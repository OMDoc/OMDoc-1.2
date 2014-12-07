%%
%% xml pretty-printer
%%

functor
   
import
   XmlPrinter('class': XML)
   at 'x-ozlib://mathweb/share/XmlPrinter.ozf'

   Browser(browse:Browse)
export
   'class': PrettyPrinter

define

   VS2S = VirtualString.toString
   VS2A = VirtualString.toAtom
   VS2BS = VirtualString.toByteString
   
   /*
   fun {IsText X}
      {IsVirtualString X} andthen
      ({IsAtom X}==false orelse X==nil)
   end
   */
   fun {EscapeXml S}
      case S of nil then nil
      [] C|Sr then
         case C
         of &< then &&|&l|&t|&;|{EscapeXml Sr}
         [] &> then &&|&g|&t|&;|{EscapeXml Sr}
         [] && then &&|&a|&m|&p|&;|{EscapeXml Sr}
         else C|{EscapeXml Sr}
         end
      end
   end

   %% substring test function
   local
      fun {FindForward BS StartPos SubBS C0 L}
         case {ByteString.strchr BS StartPos C0}
         of false then false
         [] FoundPos then
            if {ByteString.slice BS FoundPos FoundPos+L}==SubBS
            then FoundPos
            else {FindForward BS FoundPos+1 SubBS C0 L}
            end
         end
      end
   in
      fun {FirstSubstringPos VS SubVS}
         [BS SubBS] = {Map [VS SubVS] ByteString.make}
         L  = {ByteString.length SubBS}
      in
         if L==0 then false else
            C0 = {ByteString.get SubBS 0} in
            {FindForward BS 0 SubBS C0 L}
         end
      end
      fun {ContainsSubstring VS SubVS}
         {IsInt {FirstSubstringPos VS SubVS}}
      end
   end
   
   %%
   %% write OpenMath objects
   %%
   local
      skip
   in
      class Self = PrettyPrinter
         from XML
            
	 attr
            indent: false
            isTextStack: nil
            isTextCurrent: false
            prefix: ''
	    tab:    '  '
	    
	 meth init(prefix: Prefix <= "\n"
		   tab:    Tab    <= "  "
                   indent: Indent <= true
                   isTextCurrent: IsTextCurrent <= false)
	    prefix <- Prefix
	    tab    <- Tab
            indent <- Indent
            isTextCurrent <- IsTextCurrent
	 end
         %%
         meth indentOn
            indent <- true
         end
         meth indentOff
            indent <- false
         end
         %%
	 meth setPrefix(Prefix)
	    prefix <- Prefix
	 end
         %%
         meth setTab(N)
	    Tab = {List.make N} in
	    {ForAll Tab proc {$ C} C=&  end}
	    tab <- Tab
	 end
         meth pushTab(Tab<=@tab)
	    prefix <- @prefix#Tab
	 end
	 meth popTab
	    Prefix#_ = @prefix in
	    prefix <- Prefix
	 end
         %%
         meth pushIsText(IsText)
            isTextStack   <- @isTextCurrent | @isTextStack
            isTextCurrent <- IsText
         end
         meth popIsText
            IsTextCurrent | IsTextStack = @isTextStack in
            isTextStack   <- IsTextStack
            isTextCurrent <- IsTextCurrent
         end
         %%
         meth writePrefix
            if @indent andthen @isTextCurrent==false then
               {self write(vs:@prefix)}
            end
         end
	 /*
	 meth writePrefix1
	    if @indent then {self write(vs:@prefix#@tab)} end
	 end
	 */
         %% identify tags with whitespace-sensitive content (heuristics)
         meth isTextElement(TagA $)
            false %% default value; override this in derived classes
         end
         %%
         meth startTag(text:IsText<=_...) = StartTag
            Self, writePrefix
            %% hack for Al's OmdocWriter
            case StartTag of startTag(R attribs:Attribs...) then
               Attribs1 = {Filter Attribs fun {$ F} {HasFeature R F} end} in
               XML, startTag(R attribs:Attribs1)
            else
               XML, {Record.subtract StartTag text}
	    end
            if {IsDet IsText}==false then
               IsText = {self isTextElement({Label StartTag.1} $)}
            end
            Self, pushIsText(IsText)
            Self, pushTab
         end
	 meth endTag(...) = EndTag
	    Self, popTab
	    Self, writePrefix
            Self, popIsText
            XML, EndTag
         end
         meth emptyTag(...) = EmptyTag
	    Self, writePrefix
            case EmptyTag of emptyTag(R attribs:Attribs) then
               Attribs1 = {Filter Attribs fun {$ F} {HasFeature R F} end} in
               XML, emptyTag(R attribs:Attribs1)
            else
               XML, EmptyTag
            end
	 end
	 /*
	 meth tag(T)
	    Self, writePrefix
	    XML, startTag(T)
	    {ForAll {Filter {Arity T} IsInt}
	     proc {$ I}
		XML, tag(T.I)
	     end}
	    XML, endTag(T)
	 end
	 */
	 %%   
         meth writeElems(L)
            {ForAll L
	     proc {$ Elem}
		{self writeElem(Elem)}
	     end}
         end
         %% unknown elements are supposed to have an ANY content model
         meth otherwise(M)
            MethodName = {Label M} in 
            case {VS2S MethodName}
            of &w|&r|&i|&t|&e|&_|ElemNameS then
               ElemNameA = {VS2A ElemNameS} in
               {Browse 'treating as ANY:'#ElemNameA}
               case M of MethodName(X) then
                  Self, startTag({Record.subtract X 1})
                  Self, writeAnyContent(X.1)
                  Self, endTag({Label X})
               else
                  raise error(expected:'write_XYZ'('Content') got:M) end
               end
            else
               XML, M
            end
         end
         meth writeCDATA(VS)
            if {ContainsSubstring VS "]]>"} then
               raise error(cdata(']]>' found) text:{VS2BS VS}) end
            end
            {self write(vs:"<![CDATA[")}
            {self write(vs:VS)}
            {self write(vs:"]]>")}
         end
         meth writeText(VS)
            %% xml-escapes VS and writes it
            {self write(vs:{EscapeXml {VS2S VS}})}
         end
         meth writeAnyContent(X)
            {self writeContent(X)} %% XXX HACK
            /*
            %% This method and the writeContent(...) method in omdoc.out.oz
            %% are similar, but currently the method over there does not
            %% use this one. 
            if {IsText X} then
               {self write(vs:X)}
            elseif {IsList X} then
               {ForAll X
                proc {$ Y}
                   Self, writeAnyContent(Y)
                end}
            elsecase X of '#'(...) then
               {Record.forAll X
                proc {$ Y}
                   Self, writeAnyContent(Y)
                end}
            elsecase {CondSelect X 1 nil} of nil then
               Self, emptyTag({Record.subtract X 1})
            else
               Self, startTag({Record.subtract X 1})
               Self, writeAnyContent(X.1)
               Self, endTag({Label X})
            end
            */
         end
      end
   end
end



