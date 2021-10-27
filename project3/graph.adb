--  Author: Adonay Pichardo, apichardo2019@my.fit.edu
--  Course: CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package implementation

--  INCLUDE  ------------------------------------
with Ada.Containers.Doubly_Linked_Lists;

--  PACKAGE  --------------------------------------------------
package body Graph is

   procedure insertNode (newNode   : elementNode,
                         givenList : Ada.Containers.Doubly_Linked_Lists) is
      begin
         givenList.Append(newNode);
      end

   function searchNode return Boolean (targetNode : String,
                         givenList  : Ada.Containers.Doubly_Linked_Lists) is
      begin
      --------------------------------
      --  Iterate through the whole list
      --------------------------------
      for element of givenList loop
         --  If node is found, return True
         if element.data = targetNode then
            return (True);

      --  If node is not found, return False
      return (False);
      end

begin



end Graph;
