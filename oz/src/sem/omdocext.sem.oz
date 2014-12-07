%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, EXT module
%%%

%% omlet
%% private
%% code
%% input
%% output
%% effect
%% data

meth 'make_omlet'(E $)
   ANY = E.content in
   {AdjoinAt E.attribs content ANY}
end

%%%MM+Element privmatter

meth 'make_private'(E $)
   Metadata#Datas = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                datas:    Datas)
    E.attribs}
end
      
meth 'make_code'(E $)
   Metadata#Datas#Input#Output#Effect = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                datas:    Datas
                input:    {Opt Input}
                output:   {Opt Output}
                effect:   {Opt Effect})
    E.attribs}
end
      
meth 'make_input'(E $)
   CMPs#FMPs = E.content 
in
   {Adjoin unit(cmps: CMPs
                fmps: FMPs)
    E.attribs}            
end
      
meth 'make_output'(E $)
   CMPs#FMPs = E.content 
in
   {Adjoin unit(cmps: CMPs
                fmps: FMPs)
    E.attribs}            
end
      
meth 'make_effect'(E $)
   CMPs#FMPs = E.content 
in
   {Adjoin unit(cmps: CMPs
                fmps: FMPs)
    E.attribs}            
end
      
meth 'make_data'(E $)
   ANY = E.content in
   {AdjoinAt E.attribs content ANY}
end
