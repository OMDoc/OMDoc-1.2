%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, RT module
%%%

%% li
%% ul
%% ol
%% p
%% highlight
%% note
%% table
%% tr
%% td
%% th
%% link

meth 'make_li'(E $)
   li(content:E.content)
end

meth 'make_ul'(E $)
   ul(items: E.content)
end

meth 'make_ol'(E $)
   ol(items: E.content)
end

meth 'make_p'(E $)
   p(content:E.content)
end

meth 'make_highlight'(E $)
   {AdjoinAt E.attribs content E.content}
end

meth 'make_note'(E $)
   note(content:E.content)
end

meth 'make_table'(E $)
  table(content:E.content)
end

meth 'make_tr'(E $)
   tr(content:E.content)
end

meth 'make_td'(E $)
   td(content:E.content)
end

meth 'make_th'(E $)
   th(content:E.content)
end

meth 'make_link'(E $)
   link(content:E.content)
end

