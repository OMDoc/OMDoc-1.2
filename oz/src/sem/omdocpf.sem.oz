%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, PF module
%%%

%% proof
%% proofobject
%% metacomment
%% derive
%% conclude
%% hypothesis
%% method
%% premise

meth 'make_proof'(E $)
   Metadata#Symbols#CMPs#Xs#Conclude = E.content
   Metacomments = {FilterLabel Xs 'metacomment'}
   Derives      = {FilterLabel Xs 'derive'}
   Hypotheses   = {FilterLabel Xs 'hypothesis'}
in
   {Adjoin unit(metadata:     {Opt Metadata}
                symbols:      Symbols
                cmps:         CMPs
                metacomments: Metacomments
                derives:      Derives
                hypotheses:   Hypotheses
                conclude:     Conclude)
    E.attribs}
end

meth 'make_proofobject'(E $)
   Metadata#CMPs#OMOBJ = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                cmps:     CMPs
                omobj:    OMOBJ)
    E.attribs}
end
      
meth 'make_metacomment'(E $)
   CMPs = E.content in
   {AdjoinAt E.attribs cmps CMPs}
end
      
meth 'make_derive'(E $)
   CMPs#FMPs#Method#Premises#Prf = E.content
   R = case E.model.5
       of 'proof' then
          unit(model: 'proof'
               proof: Prf)
       [] 'proofobject' then
          unit(model: 'proofobject'
               proofobject: Prf)
       [] unit then
          unit(model: unit)
       end
in
   {Adjoin {Adjoin unit(cmps:        CMPs
                        fmps:        FMPs
                        method:      {Opt Method}
                        premises:    Premises
                        proof:       unit
                        proofobject: unit) R}
    E.attribs}
end

meth 'make_conclude'(E $)
   CMPs#Method#Premises#Prf = E.content
   R = case E.model.4
       of 'proof' then
          unit(model: 'proof'
               proof: Prf)
       [] 'proofobject' then
          unit(model: 'proofobject'
               proofobject: Prf)
       [] unit then
          unit(model: unit)
       end
in
   {Adjoin {Adjoin unit(cmps:        CMPs
                        method:      {Opt Method}
                        premises:    Premises
                        proof:       unit
                        proofobject: unit) R}
    E.attribs}
end
          
meth 'make_hypothesis'(E $)
   Symbols#CMPs#FMPs = E.content
in
   {Adjoin unit(symbols: Symbols
                cmps:    CMPs
                fmps:    FMPs)
    E.attribs}
end

meth 'make_method'(E $)
   OMOBJs = E.content in 
   {AdjoinAt E.attribs omobjs OMOBJs}
end

meth 'make_premise'(E $)
   %% EMPTY
   E.attribs
end
