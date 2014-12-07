%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, DOC module
%%%

%% catalogue
%% loc
%% metadata
%% extradata
%% ignore
%% with
%% ref
%% omgroup
%% omdoc (the root element!)

meth 'make_catalogue'(E $)
   Locs = E.content in
   {AdjoinAt E.attribs locs Locs}
end
      
meth 'make_loc'(E $)
   %% EMPTY
   E.attribs
end

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
      
meth 'make_ignore'(E $)
   ANY = E.content in
   {AdjoinAt E.attribs content ANY}
end
      
meth 'make_with'(E $)
   %% E.content is an extended virtual string
   {AdjoinAt E.attribs content E.content}
end

meth 'make_ref'(E $)
   %% EMPTY
   E.attribs
end
      
meth 'make_omgroup'(E $)
   Metadata#Items = E.content
   %% Omgroups = {FilterLabel Items 'omgroup'}
   %% Refs     = {FilterLabel Items 'ref'}
in
   {Adjoin unit(metadata: {Opt Metadata}
                items:    Items
                %% omgroups: Omgroups
                %% refs:     Refs
               )
    E.attribs}
end 

meth 'make_omdoc'(E $)
   Metadata#Catalogue#Items = E.content in
   {Adjoin unit(metadata:  Metadata
                elem_catalogue: {Opt Catalogue}
                items:     Items) % sort items?
    E.attribs}
end
