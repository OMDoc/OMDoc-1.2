%%% -*- indent-tabs-mode: nil -*-
%%%
%%% OMDoc 1.2, QUIZ module
%%%

%% exercise
%% hint
%% solution
%% mc
%% choice
%% answer

meth 'make_exercise'(E $)
   (Metadata#Symbols#CMPs#FMPs)#Hint#SolMCs = E.content
   R = case E.model.3
       of list('*' 'solution') then
          unit(solutions: SolMCs
               model: solutions)
       [] list('*' 'mc') then
          unit(mcs: SolMCs
               model: mcs)
       end
in
   {Adjoin {Adjoin unit(metadata:  {Opt Metadata}
                        %privates:  Privates
                        symbols:   Symbols
                        cmps:      CMPs
                        fmps:      FMPs
                        hint:      {Opt Hint}
                        solutions: unit
                        mcs:       unit) R}
    E.attribs}
end

meth 'make_hint'(E $)
   Metadata#Symbols#CMPs#FMPs = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                %privates: Privates
                symbols:  Symbols
                cmps:     CMPs
                fmps:     FMPs)
    E.attribs}
end
      
meth 'make_solution'(E $)
   (Metadata#Symbols#CMPs#FMPs)#Proof_Obj = E.content
   
   Proof # ProofObject # Model =
   case E.model.2
   of 'proof'       then Proof_Obj # unit      # proof
   [] 'proofobject' then unit      # Proof_Obj # proofobject
   [] unit          then unit      # unit      # cfm
   end
   
   R =  unit(metadata:    {Opt Metadata}
             symbols:     Symbols
             cmps:        CMPs
             fmps:        FMPs
             proof:       Proof
             proofobject: ProofObject
             model:       Model)
in
   {Adjoin R E.attribs}
end

meth 'make_mc'(E $)
   Symbols#Choice#Hint#Answer = E.content
in
   {Adjoin unit(symbols:  Symbols
                'choice': Choice
                hint:     {Opt Hint}
                answer:   Answer)
    E.attribs}
end

meth 'make_choice'(E $)
   Metadata#Symbols#CMPs#FMPs = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                %privates: Privates
                symbols:  Symbols
                cmps:     CMPs
                fmps:     FMPs)
    E.attribs}
end
      
meth 'make_answer'(E $)
   Metadata#Symbols#CMPs#FMPs = E.content
in
   {Adjoin unit(metadata: {Opt Metadata}
                %privates: Privates
                symbols:  Symbols
                cmps:     CMPs
                fmps:     FMPs)
    E.attribs}
end
