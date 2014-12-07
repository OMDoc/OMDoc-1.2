%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, PRES module
%%%

%% presentation
%% use
%% omstyle
%% xslt
%% style
%% element
%% attribute
%% text
%% value-of
%% recurse

meth 'make_presentation'(E $)
   {AdjoinAt E.attribs items E.content}
end

meth 'make_use'(E $)
   %% #PCDATA
   {AdjoinAt E.attribs content E.content}
end

meth 'make_omstyle'(E $)
   {AdjoinAt E.attribs items E.content}
end

meth 'make_xslt'(E $)
   %% #PCDATA
   {AdjoinAt E.attribs content E.content}
end

meth 'make_style'(E $)
   {AdjoinAt E.attribs items E.content}
end

meth 'make_element'(E $)
   {AdjoinAt E.attribs items E.content}
end

meth 'make_attribute'(E $)
   %% (#PCDATA|value-of|text)*
   {AdjoinAt E.attribs content E.content}
end

meth 'make_text'(E $)
   %% #PCDATA, no attribs
   {AdjoinAt E.attribs content E.content}
end

meth 'make_value-of'(E $)
   %% EMPTY
   E.attribs
end

meth 'make_recurse'(E $)
   %% EMPTY
   E.attribs
end
