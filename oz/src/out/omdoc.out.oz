%%% -*- indent-tabs-mode: nil -*-
%%
%% Oz --> XML converter for OMDocs
%%

functor

import
   Type(ask)
   
   Xml('class':XML) at 'x-ozlib://mathweb/omdoc/out/xml.out.ozf'
% Buffered
   
   OMOBJ('class':OmobjWriter)
   at 'x-ozlib://mathweb/omdoc/out/omobj.out.ozf'
   
   METADATA('class':MetadataWriter)
   at 'x-ozlib://mathweb/omdoc/out/metadata.out.ozf'
   
   OmdocItems(contents:ContentModels)
   at 'x-ozlib://mathweb/omdoc/OmdocItems.ozf'

   OmdocTables(elements2: ElementSpecs
               contentInfo: ContentInfo)
   at 'x-ozlib://mathweb/mbase/OmdocTables.ozf'

   Browser(browse:Browse)
   System
export
   'class': OmdocWriter
   writeElement:  WriteElement
   writeMetadata: WriteMetadata
   writeAnyContent: WriteAnyContent
   
   elementSpecs: R
   contentInfo: ContentInfo
   
define
   
   VS2A = VirtualString.toAtom

   EmptyElements =
   [ref premise 'path-just' 'assertion-just' decomposition
    signature insort inclusion]
   
   NonGenericElements =
   ['OMOBJ' metadata extradata 'depends-on' omdoc omgroup tref /*data*/
    br ol ul li highlight] % XXX ActiveMath
   /*
   GenericElements =
   [
    omtext 'CMP' ref
    %% %%%%%%%%%%%%%%%%%%%% omdocmath %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    'FMP' assertion assumption conclusion 'alternative-def'
    proof proofobject metacomment derive conclude hypothesis
    method parameter premise example
    'axiom-inclusion'  % XXX check 'path-just' and 'assertion-just'
    %                  % our theories are not yet up to the new dtds ... ?!?
    'theory-inclusion' 'path-just' 'assertion-just' decomposition
    %% %%%%%%%%%%%%%%%%%%%% omdoctheory %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    theory symbol commonname % commonname(content:_  'xml:lang':_)
    signature type axiom definition requation /*pattern*/ /*value*/
    adt sortdef constructor argument insort
    selector % XXX no order (single-element) 
    imports morphism inclusion
    %% %%%%%%%%%%%%%%%%%%%% omdocaux %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    exercise hint solution mc 'choice' answer omlet private
    code input output effect
    data % XXX bug: content is of type ANY, but only #PCDATA is supported here
    presentation use
   ]
   */
   
   R = ElementSpecs
   %% {Record.mapInd ElementSpecs
   %%  fun {$ Elem _#O} OmdocItems.attrNames.Elem#O end}

   fun {IsText X}
      {IsVirtualString X} andthen
      ({IsAtom X}==false orelse X==nil)
   end
   /*   
   fun {IsTextElement R}
      {HasFeature R content} orelse
      ({Filter {Arity R} IsInt}==[1] andthen
       local C|_={AtomToString {Label R}} in {Char.isUpper C} end)
   end
   */
   class Self = OmdocWriter
      from
         XML
         OmobjWriter
         MetadataWriter
         
      meth write(vs:VS)
         {System.showInfo VS}
      end
      %%
      meth isTextElement(TagA $)
         case {CondSelect ContentModels TagA unit}
         of unit then
            true % default for unknown elements
            /*
            OmobjWriter, isTextElement(TagA $) orelse
            MetadataWriter, isTextElement(TagA $)
            */
         [] 'PCDATA' then true
         [] 'ANY'    then true
         [] mixed(_) then true
         else false
         end
      end
      %%
      meth writeElement(X name:L<={Label X})
         %%{Browse writeElement(L)}
         case X of L(MID) andthen {IsInt MID} then
            %%{System.show L#empty}
            {self emptyTag(L(mid:MID))}
         elseif {Member L NonGenericElements} then
            %%{System.show L#nongeneric}
            S = {AtomToString L}
            Meth = {VS2A "write_"#S}
         in
            %%{Browse generic(Meth)}
            {self Meth(X)}
         else
            %%{System.show L#generic}
            {self writeGeneric(X)}
         end
      end
      %%
      meth writeElements(Xs name:ElemName<=unit)
         if ElemName==unit then
            {ForAll Xs proc {$ X} {self writeElement(X)} end}
         else
            {ForAll Xs proc {$ X} {self writeElement(X name:ElemName)} end}
         end
      end
      %%
      meth writeGeneric(ItemRecord
                        order: OrderedItemNames <= _
                        %%<=
                        %%{List.filter {Record.arity ItemRecord}
                        %% fun{$ I}
                        %%    {Member I Attribs} == false
                        %% end}
                        %% Im ungeordneten Fall: alle Features ausser Attributen
                        attribs: Attribs <= _)
         %%{System.showInfo "*** tagged item: "#{Label ItemRecord}#" ***"}
         %%{System.show ItemRecord}
         
         ElementName = {Label ItemRecord}
         
         fun {NotUnit X} X\=unit end
      in
         case {CondSelect R ElementName unit}
         of unit then
            R1 = {Record.filter {Record.subtract ItemRecord 1} NotUnit}
         in
            Self, startTag(R1 /*text:{IsTextElement R1}*/)
            Self, WriteXvsList({CondSelect ItemRecord 1 nil})
            Self, endTag({Label ItemRecord})
         [] Attrs # Order then
            
            if {IsFree OrderedItemNames} then OrderedItemNames = Order end
            if {IsFree Attribs} then Attribs = 'xmlns'|Attrs end
            
            /*
            RealAttribs = {Filter Attribs fun {$ A} {HasFeature ItemRecord A} end}
            */
         in
            if {Member ElementName EmptyElements} then
               {self emptyTag(ItemRecord attribs:Attrs)}
            else
               Self, startTag({Record.filter ItemRecord NotUnit} %% wg. catalogue
                              attribs:/*Real*/Attribs
                              /*text: {IsTextElement ItemRecord}*/)
               {ForAll OrderedItemNames
                proc{$ F}
                   Self, writeElems(F {CondSelect ItemRecord F unit})
                end}
               %% XXX Hack to support 'items' feature for all elements
               if {Member items OrderedItemNames} == false then
                  Self, writeElems(items {CondSelect ItemRecord items nil})
               end
               Self, endTag(ItemRecord)
            end
         end
      end
      
      %%
      %% non-generic elements
      %%
      
      meth write_OMOBJ(X)
         case X of nil then skip
         else
            OmobjWriter, write_OMOBJ(X)
         end
      end
      
      meth write_omdoc(X)
         X1 = {AdjoinAt X xmlns "http://www.mathweb.org/omdoc"}
      in
         Self, writeGeneric(X1)
      end
      
      meth write_omgroup(X)
         Self, writeGeneric(X)
      end
      
      %% XXX I can't find a <tref> element in omdoc.dtd
      meth write_tref(X)
         Self, emptyTag(X attribs:[theory name])
      end
      /*
      meth write_commonname(X) % commonname(content:_  'xml:lang':_)
         Self, tag(commonname(X.content /*mid:X.mid*/ 'xml.lang':X.'xml:lang'))
      end
      */

      /*
      %% This does not work yet: In the database, the content is stored
      %% as xml, thus already escaped. (This is necessary because the
      %% content model of the data element is ANY, not #PCDATA.)
      %% So if we want a CDATA section in the output, we will have to
      %% do this when generating the xml content string for the database.
      meth write_data(X)
         Self, startTag({Record.subtract X content})
         Self, writeCDATA(X.content)
         Self, endTag(X)
      end
      */
      
      %%
      %% XXX ActiveMath:
      %%
      
      meth write_br(X)
         Self, emptyTag(br)
      end

      meth write_ol(X)
         Self, startTag(ol)
         Self, writeElements(X.items name:li)
         Self, endTag(ol)
      end

      meth write_ul(X)
         Self, startTag(ul)
         Self, writeElements(X.items name:li)
         Self, endTag(ul)
      end

      meth write_li(X)
         Self, startTag(li text:true)
         Self, writeContent(X.content)
         Self, endTag(li)
      end
      
      meth write_highlight(X)
         Self, startTag({Record.subtract X content} text:true)
         Self, writeContent(X.content)
         Self, endTag(highlight)
      end
      
      %%
      %% main dispatch
      %%
     
      meth writeElems(Kind Content)
         
         proc {ForAllContent Method}
            {ForAll Content
             proc{$ Item} Self, Method(Item) end}
         end
      in
         if Content == unit then skip
         else 
            case {CondSelect ContentInfo Kind unit}
            of single # ItemName then
               Self, writeElement(Content name:ItemName)
            [] multiple # ItemName then
               Self, writeElements(Content name:ItemName)
            elsecase Kind
            of items then {ForAllContent writeElement /*writeItem*/} % hack
            [] lists then {ForAllContent writeList}
            [] content then {self writeContent(Content)}
            else
               Self, write(vs:"Dunno!!!" /*Content*/)              
               %% writeElems: what about the (unknown) features of e.g data ???
               %% either return them in else case or name them explicitly []
            end
         end
      end

      meth WriteXvsList(Xs)
         %% takes an eXtended VirtualString in form of a list Xs
         %% which contains both text elements and complex ones (records)
         {ForAll Xs
          proc {$ X}
             if {IsText X}
             then
                %%{System.showInfo "WriteXvsList: text of length "#
                %% {Length {VirtualString.toString X}}}
                {self writeText(X)}
             else
                %%{System.showInfo "WriteXvsList: begin "#{Label X}}
                {self writeElement(X)}
                %%{System.showInfo "WriteXvsList: end "#{Label X}}
             end
          end}
      end
      
      meth writeContent(X) %% XXX needs cleanup
         %% SHOULD WE CALL writeAnyContent (xml.out.oz) SOMEWHERE???
         %%{System.show writeContent(X)}
         /*
         fun {IsSimple1 X}
            {Member {Value.type X} [atom int float byteString]} orelse
            case X of '|'(_ _) then true else false end
         end
      in
         */
         %%{Browse X}
         case X of '#'(...) then
            {Record.forAll X proc {$ Y} Self, writeContent(Y) end}
         elseif {IsVirtualString X} then
            {self write(vs:X)}
            %% XXX the following would double-escape ANY content from mbase
            %%{self writeText(X)}
         elsecase X of  _|_ then
            %% for elements with ANY or #PCDATA content, like commonname, CMP,
            %% or ignore; e.g. for 'commonname' with #PCDATA content: X=[VS]
            Self, WriteXvsList(X)
         elsecase X of nil then skip
         [] 'OMOBJ'(...) then
            OmobjWriter, write_OMOBJ(X)
         [] list(...) then
            Self, writeList(X)
         else
            VS = {Value.toVirtualString X 1000 1000} in
            {self writeText(VS)}
         end
      end
      
      meth writeList(Xs) %% needs cleanup
         Self, writeGeneric(Xs attribs:[id mid] order:[items])
      end
      /* should be obsolete
      meth writeItem(X)
         Self, writeGeneric(X attribs:[id mid] order:[metadata cmps])
      end
      */
   end

   %%
   %% Abstraction for easy use
   %%
   local
      class MyOmdocWriter
         from OmdocWriter
         attr Buffer
         meth init
            OmdocWriter, init
            Buffer <- nil
         end
         meth write(vs:VS)
            Buffer <- @Buffer#VS
         end
         meth getVS($)
            @Buffer
         end
      end
   in
      fun {GetVS WriteMethod}
         Writer = {New MyOmdocWriter init} in
         {Writer WriteMethod}
         {Writer getVS($)}
      end
      fun {WriteMetadata M} {GetVS writeMetadata(M)} end
      fun {WriteElement X} {GetVS writeElement(X)} end
      fun {WriteAnyContent X} {GetVS writeAnyContent(X)} end
   end
   
end
