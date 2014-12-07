%%
%% extract some useful information from omdoc.dtd.ozf
%%

functor

import
   Omdoc_DTD
   at 'x-ozlib://mathweb/omdoc/omdoc.dtd.ozf'

export
   attribs:   Attribs
   contents:  ElemContents
   attrNames: AttrNames
   elemNames: ElemNames
   
define
   Elements = {Record.toList Omdoc_DTD.elements}

   AttrList = {Map Elements
               fun {$ E}
                  E.name # {CondSelect E attlist nil}
               end}
   Attribs = {List.toRecord 'attribs' AttrList}

   AttrNames = {Record.map Attribs
                fun {$ Attrs}
                   {Map Attrs fun {$ A} A.1 end}
                end}

   ElemNames = {Map {Filter Omdoc_DTD.items
                     fun {$ Kind#_} Kind=='ELEMENT' end}
                fun {$ _#ElemName} ElemName end}

   ElemContents = {List.toRecord 'contents'
                   {Map Elements
                    fun {$ E}
                       E.name # E.content
                    end}}
end


