%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, STH module
%%%

%% theory
%% imports

meth 'make_theory'(E $)
   Metadata#Commonnames#CMPs#Xs = E.content
   Imports    = {FilterLabel Xs 'imports'}
   Inclusions = {FilterLabel Xs 'inclusion'}
   Items      = {Filter Xs
		 fun {$ X}
		    {Member {Label X} ['imports' 'inclusion']}==false
		 end}
in
   {Adjoin unit(metadata:    {Opt Metadata}
                commonnames: Commonnames
		cmps:        CMPs
		imports:     Imports
		inclusions:  Inclusions
                items:       Items)
    E.attribs}
end

meth 'make_imports'(E $)
   CMPs#Morphism = E.content in
   {Adjoin unit(cmps:     CMPs
                morphism: {Opt Morphism})
    E.attribs}
end
