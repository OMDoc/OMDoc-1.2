%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, CTH module
%%%

%% morphism
%% inclusion
%% theory-inclusion
%% decomposition
%% axiom-inclusion
%% path-just
%% obligation

meth 'make_morphism'(E $)
   Requations = E.content in
   {AdjoinAt E.attribs requations Requations}
end
      
meth 'make_inclusion'(E $)
   %% EMPTY
   E.attribs
end

meth 'make_theory-inclusion'(E $)
   (Metadata#Symbols#CMPs#FMPs)#Morphism = E.content
in
   {Adjoin unit(metadata:      {Opt Metadata}
                symbols:       Symbols
                cmps:          CMPs
                fmps:          FMPs
                morphism:      Morphism
               )
    E.attribs}
end
      
meth 'make_decomposition'(E $)
   %% EMPTY
   E.attribs
end

%%%->Elements from   omdocmath   
%%%Docu complex theories of Omdoc1.1

meth 'make_axiom-inclusion'(E $)
   (Metadata#Symbols#CMPs#FMPs)#Morphism#Just = E.content
   R = case E.model.3
       of 'path-just' then
          unit('path-just': Just
               model: 'path-just')
       [] list('*' obligation) then
          unit('obligations': Just
               model: 'obligations')
       end
in
   {Adjoin {Adjoin unit(metadata:      {Opt Metadata}
                        symbols:       Symbols
                        cmps:          CMPs
                        fmps:          FMPs
                        morphism:      {Opt Morphism}
                        'path-just':   unit
                        'obligations': unit) R}
    E.attribs}
end

meth 'make_path-just'(E $)
   %% EMPTY
   E.attribs
end

meth 'make_obligation'(E $)
   %% EMPTY
   E.attribs
end
