%%
%% OMOBJ reader for plain OMOBJ's as defined by the OpenMath standard
%% (not using the modified version that is used by OMDoc)
%%

functor
   
import
   Property System
   
   XmlParser   at 'x-ozlib://mathweb/xmlparser/XmlParser.ozf'
   OmobjParser at 'x-ozlib://mathweb/xml/parser/omobj.parser.ozf'
   SemOmobj    at 'x-ozlib://mathweb/xml/omobj.sem.ozf'
%  SemDefault  at 'x-ozlib://mathweb/xmlparser/SemDefault.ozf'
   
export
   %readVS:     ReadVS
   readString: ReadString
   readFile:   ReadURL
   readURL:    ReadURL
   
define

   %% link generic module with semantics module
   ParserModule = {XmlParser.link OmobjParser SemOmobj}

   %% startsymbol
   Startsymbol = 'start_OMOBJ'

   %% enable debug output
   {XmlParser.setDebug false}
   
   %%
   %% auxiliuary timer functions, only needed for debugging
   %%
   fun {GetTimes}
      {Record.filter {Property.get 'time'} IsInt}
   end
   fun {DiffTimes T1 T2}
      {Record.zip T2 T1 Number.'-'}
   end
   proc {ShowTimes Times}
      {System.showInfo ''}         
      {ForAll [system user total]
       proc {$ F} {System.showInfo F#':\t'#Times.F} end}
      {System.showInfo ''}
   end
   
   fun {ReadGeneric Input}
      ?Val ?Accept T1 T2 in
      T1 = {GetTimes}
      case Input
      of url(Url) then
         {XmlParser.parseURL Url ParserModule Startsymbol(?Val) ?Accept}
      [] string(S) then
         {XmlParser.parseString S ParserModule Startsymbol(?Val) ?Accept}
      end
      T2 = {GetTimes}
      {ShowTimes {DiffTimes T1 T2}}
      if ?Accept then
         {System.showInfo 'accepted'}
         Val
      else
         {System.showInfo 'rejected'}
         raise rejected end
      end
   end
   fun {ReadURL Url}  {ReadGeneric url(Url)} end
   fun {ReadString S} {ReadGeneric string(S)} end   
      
end



