%%% -*- indent-tabs-mode: nil -*-

%%%
%%% Parser semantics for OMDocs
%%%

functor
   
import
   SemOmobj       at 'omdobj.sem.ozf'
   SemMetadata    at 'metadata.sem.ozf'
   
   %%Browser(browse:Browse)
export
   'class': SemOmdoc
   
define
   
   fun {Opt X}
      case X of nil
      then unit
      else X
      end
   end
   
   fun {FilterLabel Xs L}
      {Filter Xs fun {$ X} {Label X}==L end}
   end
   
   class SemOmdoc
      from 
         SemOmobj.'class'
         SemMetadata.'class'

         \insert omdocmobj.sem.oz
         \insert omdocmtxt.sem.oz
         \insert omdocrt.sem.oz
         \insert omdocst.sem.oz
         \insert omdocadt.sem.oz
         \insert omdocsth.sem.oz
         \insert omdocpres.sem.oz
         \insert omdocpf.sem.oz
         \insert omdocext.sem.oz
         \insert omdocquiz.sem.oz
         \insert omdoccth.sem.oz
         \insert omdocdoc.sem.oz
         \insert activemath.sem.oz 
   end
   
end





