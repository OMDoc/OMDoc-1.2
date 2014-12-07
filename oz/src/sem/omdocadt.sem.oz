%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, ADT module
%%%

%% adt
%% sortdef
%% insort
%% constructor
%% recognizer
%% argument
%% selector

meth 'make_adt'(E $)
   Metadata#Commonnames#CMPs#Sortdefs = E.content
in
   {Adjoin unit(metadata:    {Opt Metadata}
                commonnames: Commonnames
                cmps:        CMPs
                sortdefs:    Sortdefs)
    E.attribs}
end

meth 'make_insort'(E $)
   %% EMPTY
   E.attribs
end

meth 'make_constructor'(E $)
   Commonnames#Arguments = E.content
in
   {Adjoin unit(commonnames: Commonnames
                arguments:   Arguments)
    E.attribs}
end

%%%MM+Element recognizer
meth 'make_recognizer'(E $)
   Commonnames = E.content in
   {AdjoinAt E.attribs commonnames Commonnames}
end

meth 'make_argument'(E $) %% ???
   Selector = E.content in
   {AdjoinAt E.attribs selector {Opt Selector}}
end

meth 'make_selector'(E $)
   Commonnames = E.content in
   {AdjoinAt E.attribs commonnames Commonnames}
end
