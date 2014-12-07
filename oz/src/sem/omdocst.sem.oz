%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, ST module
%%%

%% symbol
%% commonname
%% axiom
%% definition
%% requation
%% pattern
%% value
%% measure
%% ordering
%% assertion
%% type
%% alternative
%% example

meth 'make_symbol'(E $)
   Metadata#CMPs#Xs = E.content
   Commonnames = {FilterLabel Xs 'commonname'}
   Types       = {FilterLabel Xs 'type'}
   Selectors   = {FilterLabel Xs 'selector'}
in
   {Adjoin unit(metadata: {Opt Metadata}
		cmps:        CMPs
                commonnames: Commonnames
                types:       Types
                selectors:   Selectors)
    E.attribs}
end
      
meth 'make_commonname'(E $)
   %% ANY, was: #PCDATA
   {AdjoinAt E.attribs content E.content}
end

meth 'make_axiom'(E $)
%   L = {Width E.content}
%   Metadata = E.content.1
%   Privates = if L==5 then E.content.2 else nil end
%   Symbols  = E.content.(L-2)
%   CMPs     = E.content.(L-1)
%   FMP      = E.content.L
   Metadata#Symbols#CMPs#FMPs = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                symbols:  Symbols
                cmps:     CMPs
                fmps:     FMPs)
    E.attribs}
end

meth 'make_definition'(E $)
%   Metadata = E.content.1
%   CMPs     = E.content.2
%   X        = E.content.3
%   Measure  = {CondSelect E.content 4 unit} % new omdoc.dtd, needed for PVS
%   Ordering = {CondSelect E.content 5 unit} % new omdoc.dtd, needed for PVS
   Metadata#CMPs#FMPs#X#Measure#Ordering = E.content
   
   %%{Browse E.model.4}
   R = case E.model.4
       of list('+' 'requation') then
          unit(model: requations
               requations: X)
       [] 'OMOBJ' then
          unit(model: omobj
               omobj: X)
       [] unit then
          unit(model: unit)
       end
in
   {Adjoin {Adjoin unit(metadata:   {Opt Metadata}
                        cmps:       CMPs
                        fmps:       FMPs
                        requations: unit
                        omobj:      unit
                        measure:    {Opt Measure}
                        ordering:   {Opt Ordering}) R}
    E.attribs}
end
      
meth 'make_requation'(E $)
   Pattern#Value = E.content in
   {Adjoin unit(pattern: Pattern
                value:   Value)
    E.attribs}
end

meth 'make_pattern'(E $)
   %% pattern(omobj: E.content)
   {AdjoinAt E.attribs omobj E.content}
end
      
meth 'make_value'(E $)
   %% value(omobj: E.content)
   {AdjoinAt E.attribs omobj E.content}
end

meth 'make_measure'(E $)
   %% measure(omobj: E.content)
   {AdjoinAt E.attribs omobj E.content}
end

meth 'make_ordering'(E $)
   %% ordering(omobj: E.content)
   {AdjoinAt E.attribs omobj E.content}
end

meth 'make_assertion'(E $)
%%% this was the old "privates hack":
%   L = {Width E.content}
%   Metadata = E.content.1
%   Privates = if L==5 then E.content.2 else nil end
%   Symbols  = E.content.(L-2)
%   CMPs     = E.content.(L-1)
%   FMP      = E.content.L
   Metadata#Symbols#CMPs#FMPs = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
%               privates: Privates
                symbols:  Symbols
                cmps:     CMPs
                fmps:     FMPs)
    E.attribs}
end

meth 'make_type'(E $)
   %% CMP*,OMOBJ
   CMPs#OMOBJ = case E.content
                of Cs#O then Cs#O
                [] O then nil#O % backwards compatibility (neccessary?)
                end
in
   {Adjoin unit(cmps: CMPs
                omobj: OMOBJ)
    E.attribs}
end

meth 'make_alternative'(E $)
   Metadata#CMPs#FMPs#X = E.content
   R = case E.model.4
       of list('+' 'requation') then
          unit(model: requations
               requations: X)
       []'OMOBJ' then
          unit(model: omobj
               omobj: X)
       [] unit then
          unit(model: unit)
       end
in
   {Adjoin {Adjoin unit(metadata:   {Opt Metadata}
                        cmps:       CMPs
                        fmps:       FMPs
                        requations: unit
                        omobj:      unit) R}
    E.attribs}   
end

meth 'make_example'(E $)
   Metadata#Symbols#CMPs#OMOBJs = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                symbols:  Symbols
                cmps:     CMPs
                omobjs:   OMOBJs)
    E.attribs}
end

