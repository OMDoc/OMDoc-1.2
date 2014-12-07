%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, DC module
%%%

%% Contributor
%% Creator
%% Title
%% Subject
%% Description
%% Publisher
%% Type
%% Format
%% Source
%% Language
%% Relation
%% Rights
%% Date
%% Identifier

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
