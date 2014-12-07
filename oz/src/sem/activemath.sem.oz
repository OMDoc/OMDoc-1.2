%%
%% parser semantics for ActiveMath extensions
%%

meth 'make_br'(E $)
   br
end

/*
meth 'make_ol'(E $)
   ol(items: E.content)
end

meth 'make_ul'(E $)
   ul(items: E.content)
end

meth 'make_li'(E $)
   li(content:E.content)
end

meth 'make_highlight'(E $)
   {AdjoinAt E.attribs content E.content}
end
*/

meth 'make_relation'(E $)
   Metadata#Refs = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                refs:     Refs)
    E.attribs}
end

meth 'make_depends-on'(E $)
   Refs = E.content in
   'depends-on'(refs: Refs)
   %% previously, this was implemented as <!ELEMENT depends-on (tref*)> :
   %% 'depends-on'({Filter E.content fun {$ X} {Label X}==tref end})
end

meth 'make_difficulty'(E $)
   E.attribs
end

meth 'make_abstractness'(E $)
   E.attribs
end

