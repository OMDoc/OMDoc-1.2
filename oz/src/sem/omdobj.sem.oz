%%%
%%% omdobj parser semantics
%%%

%%
%% Note: This is for OMOBJs as defined in the OMDoc standard; for parsing
%% the original OMOBJs as defined by the OpenMath standard you may want
%% to use omobj.sem.oz instead of this file.
%%

functor

import
   Compiler
   
export
   'class': SemOMObj

define
   % These are the *additional* attributes:
   % OMS    cref style class
   % OMV    cref style class
   % OMI    cref style class id xref
   % OMB    cref style class id xref
   % OMSTR  cref style class id xref
   % OMF    cref style class id xref
   % OMA    cref style class id xref
   % OMBIND cref style class id xref
   % OMBVAR cref
   % OME    cref
   % OMATTR cref style class id xref
   % OMATP  cref
   % OMDATA cref
   % OMOBJ  cref style class id xref

   % XXX TODO: This module still ignores most of the additional stuff.
   
   ID_Attrs = [mid id xmlns cref]
   WithStyle_Attrs = {Append ID_Attrs [style 'class']}
   
   proc {AllowedAttribs E Attrs}
      ElemAttrs = E.attribs in
      {Record.forAllInd ElemAttrs
       proc {$ A V}
          if {Member A Attrs}==false then
	     raise omParser(illegalAttribute(A V 'expected':Attrs 'in':E)) end
          end
       end}
   end
   proc {RequiredAttribs E Attrs}
      ElemAttrs = E.attribs in
      {ForAll Attrs
       proc {$ A}
          if {HasFeature ElemAttrs A}==false then
             raise omParser(missingAttribute(A 'in':E)) end
          end
       end}
   end
   proc {CheckAttribsNoStyle E Attrs}
      {AllowedAttribs E {Append Attrs ID_Attrs}}
      {RequiredAttribs E Attrs}
   end
   proc {CheckAttribs E Attrs}
      {AllowedAttribs E {Append Attrs WithStyle_Attrs}}
      {RequiredAttribs E Attrs}
   end
   proc {CheckEmpty E}
      {AllowedAttribs E WithStyle_Attrs}
   end
   
   fun {IsLink E}
      {HasFeature E.attribs xref}
   end
   fun {Link E}
      {AllowedAttribs E [xref /* mid id */]}
      if {Member E.content [nil unit]}==false then
         raise omParser(nonEmptyContentInLink(E.content 'in':E)) end
      end
      {GetAttribs E}
   end

   %% convert all ordinary attribute values to ByteString
   local
      fun {NormalizeAttrVal AttrVal}
         if {IsVirtualString AttrVal} andthen AttrVal\=nil
         then {ByteString.make AttrVal}
         else AttrVal
         end
      end
   in
      fun {GetAttribs E}
         {Record.map E.attribs NormalizeAttrVal}
      end
   end
   
   %% XXX Need to document the variants between different OMDoc versions.
   %% This is currently about OMDoc 1.1.

   %%
   %% omdoc.dtd allows to use id/xref links for  
   %%   OMI, OMB, OMSTR, OMF, OMA, OMBIND, OMATTR and OMOBJ
   %% but *not* for
   %%   OMS, OMV, OMBVAR, OME, OMATP
   %%
   
   class SemOMObj
      
      meth 'make_OMS'(E $)
         %% no id/xref
         {CheckAttribs E [cd name]}
         {GetAttribs E}
      end
      
      meth 'make_OMV'(E $)
         %% no id/xref
         {CheckAttribs E [name]}
         {GetAttribs E}
      end
      
      meth 'make_OMI'(E $)
         if {IsLink E} then {Link E}
         else
            {CheckEmpty E}
            S0 = {VirtualString.toString E.content}
            S1 = S0 %{Map S0 fun {$ C} if C==&- then &~ else C end end}
            S2 = {List.dropWhile S1 fun {$ C} C==&0 end}
            S3 = if {All S2 Char.isSpace} andthen {Member &0 S1} then "0"
                 else S2 end
            I  = {StringToInt S3}                    
         in
            {Adjoin {GetAttribs E} 'OMI'(I)}
         end
      end
      
      meth 'make_OMB'(E $)
         if {IsLink E} then {Link E}
         else
            {CheckEmpty E}
            BS = {VirtualString.toByteString E.content}
         in
            {Adjoin {GetAttribs E} 'OMB'(BS)}
         end
      end

      meth 'make_OMSTR'(E $)
         if {IsLink E} then {Link E}
         else
            {CheckEmpty E}
            BS = {VirtualString.toByteString E.content}
         in
            {Adjoin {GetAttribs E} 'OMSTR'(BS)}
         end
      end
      
      meth 'make_OMF'(E $)
         if {IsLink E} then {Link E}
         else
            %% Here's a bug in the design of the OM spec: It would be much
            %% cleaner to have something like <OMF base="10">3.1415927</OMF>
            %% or <OMF type="hex">FFFFFF</OMF>.
            {AllowedAttribs E {Append [dec hex] WithStyle_Attrs}}
            A = E.attribs
            ID_Rec = {Record.subtractList A [dec hex]}
            Dec = {CondSelect A dec unit}
            Hex = {CondSelect A hex unit}
         in
            case Dec#Hex
            of unit#unit then
               raise omParser('OMF' missingValue) end
            [] _#unit then
               S0 = {VirtualString.toString Dec}
               S1 = {Map S0 fun {$ C} if C==&- then &~ else C end end}
               S2 = if {Member &. S1} then S1
                    else {VirtualString.toString S1#"."}
                    end
               %% XXX bug: Oz floats are single precision, bug
               %% OpenMath supports double precision (IEEE 754-1985 standard) 
               F  = {String.toFloat {Float.toString {String.toFloat S2}}}
            in
               {Adjoin ID_Rec 'OMF'(F)}   
            [] unit#_ then
               F = {Compiler.virtualStringToValue "0x"#Hex} in
               {Adjoin ID_Rec 'OMF'(F)}
            else
               raise omParser('OMF' twoValues) end
            end
         end
      end

      meth 'make_OMA'(E $)
         if {IsLink E} then {Link E}
         else
	    {CheckAttribs E nil}
	    case E.content
            of F|Args then
               {Adjoin {GetAttribs E} 'OMA'(F Args)}
            [] nil then
               raise omParser(missingFunction('in':E)) end
            end
         end
      end

      meth 'make_OMBIND'(E $)
         if {IsLink E} then {Link E}
         else
            {CheckEmpty E}
            E1#Vars#E2 = E.content in
            {Adjoin {GetAttribs E} 'OMBIND'(E1 Vars E2)}
         end
      end

      meth 'make_OMBVAR'(E $)
         %% no id/xref
         {CheckAttribsNoStyle E nil}
         E.content
      end

      meth 'make_OME'(E $)
         %% no id/xref
         {CheckAttribsNoStyle E nil}
         Sym#L = E.content in
         'OME'(Sym L)
      end

      %% XXX TODO: convert all xrefs to OMRs during parsing
      meth 'make_OMR'(E $)
         % xmlns:xlink CDATA #FIXED 'http://www.w3.org/1999/xlink'
         % xlink:href CDATA #REQUIRED
         % xlink:type CDATA #FIXED 'simple'
         % xlink:show CDATA 'embed'>
         {CheckAttribs E ['xmlns:xlink'
                          'xlink:href' 'xlink:type' 'xlink:show']}
         {Adjoin {GetAttribs E} 'OMR'()}
      end
      
      meth 'make_OMATTR'(E $)
         if {IsLink E} then {Link E}
         else
            {CheckEmpty E}
            AList#El = E.content in
            {Adjoin {GetAttribs E} 'OMATTR'(AList El)}
         end
      end
      meth 'make_OMATP'(E $)
         %% no id/xref
         {CheckAttribsNoStyle E nil}
         E.content
      end

      meth 'make_OMDATA'(E $) % new in OpenMath 2
         %% no id/xref
         {CheckAttribsNoStyle E [encoding]}
         {Adjoin {GetAttribs E} 'OMDATA'(content:E.content)}
      end
      
      meth 'make_OMOBJ'(E $)
         if {IsLink E} then {Link E}
         else
            {CheckEmpty E}
            El = E.content in
            {Adjoin {GetAttribs E} 'OMOBJ'(El)}
         end
      end

      %% Note: <ominput> does not seem to be part of OMDoc 1.1.
 
      meth 'make_ominput'(E $)
         'ominput'(format:{GetAttribs E}.format E.content) 
      end
   end
   
end
