%%
%% metadata parser semantics
%%

functor

import
   %% XVS at 'x-ozlib://mathweb/share/XVS.ozf'

export
   'class': SemMetadata
   
define

   VS2A = VirtualString.toAtom
   %% VS2BS = VirtualString.toByteString

   %% old:        BS = {VS2BS E.content}
   %% instead of: ANY = E.content
   fun {Single Lab E}
      ANY = E.content in
      Lab(ANY)
   end

   fun {Opt X}
      case X of nil
      then unit
      else X
      end
   end

   fun {FilterLabel Xs L}
      {Filter Xs fun {$ X} {Label X}==L end}
   end

   fun {GetLang Attribs} {VS2A {CondSelect Attribs 'xml:lang' 'en'}} end
   %% GetRole and GetScheme are probably not necessary
   
   %% fun {GetRole Attribs} {VS2A {CondSelect Attribs role 'aut'}} end
   %% fun {GetScheme Attribs} {VS2A {CondSelect Attribs scheme 'ISBN'}} end
   
   class SemMetadata
      
      %% <!-- DTD for OMDoc Metadata - MiKo 17.8.99 -->
      
      %% <!-- this DTD is based on the Core Metadata model of the
      %%      Dublin Metadata initiative (http://purl.org/dc) -->

      %% <!ENTITY % dcdata "Contributor | Creator 
      %%             | Subject | Title  | Description
      %%             | Publisher | Date | Type 
      %%             | Format | Identifier | Source | Language 
      %%             | Relation | Rights">
      %%
      %% %% old: <!ENTITY % otherdata "depends-on | private">
      %%
      %% <!ELEMENT metadata ((%dcdata;)*,extradata?)>
%%%Docu Dublin Core of Omdoc1.1
      
      meth 'make_metadata'(E $)
         Items = E.content
         DCData Extradatas
         %%
         fun {IsExtradata X}
            {Label X}==extradata
         end
      in
         {List.partition Items IsExtradata ?Extradatas ?DCData}
         {Adjoin 'metadata'(items:      DCData
                            extradatas: Extradatas)
          E.attribs}                  
      end
      
      meth 'make_Contributor'(E $)
         ANY = E.content in
         {Adjoin unit(ANY
                      lang:{GetLang E.attribs}
                      /*role:{GetRole E.attribs}*/)
          E.attribs}
      end
      
      meth 'make_Creator'(E $)
         ANY = E.content in
         {Adjoin unit(ANY
                      lang:{GetLang E.attribs}
                      /*role:{GetRole E.attribs}*/)
          E.attribs}
      end
      /* old
      meth 'make_Translator'(E $)
         ANY = E.content in
         'Translator'(ANY lang:{GetLang E.attribs})
      end
      */
      meth 'make_Title'(E $)
         ANY = E.content in
         {Adjoin unit(ANY lang:{GetLang E.attribs})
          E.attribs}
      end
      
      meth 'make_Subject'(E $)
         ANY = E.content in
         {Adjoin unit(ANY lang:{GetLang E.attribs})
          E.attribs}
      end
      
      meth 'make_Description'(E $)
         ANY = E.content in
         {Adjoin unit(ANY lang:{GetLang E.attribs})
          E.attribs}
      end
      
      meth 'make_Publisher'(E $)
         ANY = E.content in
         {Adjoin unit(ANY lang:{GetLang E.attribs})
          E.attribs}
      end

      meth 'make_Type'(E $)
         {Single 'Type' E}
      end

      meth 'make_Format'(E $)
         {Single 'Format' E}
      end

      meth 'make_Source'(E $)
         {Single 'Source' E}
      end
      
      meth 'make_Language'(E $)
         {Single 'Language' E}
      end
      
      meth 'make_Relation'(E $)
         {Single 'Relation' E}
      end
      /* old
      meth 'make_Coverage'(E $)
         {Single 'Coverage' E}
      end
      */
      meth 'make_Rights'(E $)
         {Single 'Rights' E}
      end

      meth 'make_Date'(E $)
         ANY = E.content in
         {AdjoinAt E.attribs 1 ANY}
      end

      meth 'make_Identifier'(E $)
         ANY = E.content in
         {AdjoinAt E.attribs 1 ANY}
      end

      %% XXX ActiveMath: current implementation is for:
      %% <!ELEMENT extradata %extrameta;>
      %% <!ENTITY % extrameta "(difficulty?,abstractness?,relation*,depends-on*)">
      meth 'make_extradata'(E $)
         ANY = E.content
         Elems = ANY
         fun {OptSingle Xs}
            case Xs
            of nil then unit
            [] [X] then X
            else
               raise parseError(only_one_allowed {Label Xs.1}) end
            end
         end
         Difficulty   = {OptSingle {FilterLabel Elems difficulty}}
         Abstractness = {OptSingle {FilterLabel Elems abstractness}}
         Relations    = {FilterLabel Elems relation}
         DependsOns   = {FilterLabel Elems 'depends-on'}
      in
         extradata(content:       ANY
                   difficulty:    {Opt Difficulty}
                   abstractness:  {Opt Abstractness}
                   relations:     Relations
                   'depends-ons': DependsOns)
      end
      
      meth 'ANY'(E $)
         if E.content==nil
         then E.attribs
         else {AdjoinAt E.attribs 1 E.content}
         end
      end
   end
   
end








