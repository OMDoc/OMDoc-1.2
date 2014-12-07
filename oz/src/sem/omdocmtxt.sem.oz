%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, MTXT module
%%%

%% CMP
%% FMP
%% assumption
%% conclusion
%% omtext

meth 'make_CMP'(E $)
   %% E.content is an extended virtual string
   {AdjoinAt E.attribs content E.content}
end

meth 'make_FMP'(E $)
   case E.model
   of _#_ then
      Assumptions#Conclusions = E.content
   in
      {Adjoin unit(assumptions: Assumptions
                   conclusions:  Conclusions)
       E.attribs}
   [] 'OMOBJ' then
      {AdjoinAt E.attribs omobj E.content}
   end
end

meth 'make_assumption'(E $)
   CMPs#OMOBJ = E.content
in
   {Adjoin unit(cmps:  CMPs
                omobj: {Opt OMOBJ})
    E.attribs}
end
      
meth 'make_conclusion'(E $)
   CMPs#OMOBJ = E.content
in
   {Adjoin unit(cmps:  CMPs
                omobj: {Opt OMOBJ})
    E.attribs}
end

meth 'make_omtext'(E $)
   Metadata#CMPs#FMPs = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                cmps:     CMPs
                fmps:     FMPs
               )
    E.attribs}
end

