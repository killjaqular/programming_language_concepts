--  Author: Adonay Pichardo, apichardo2019@my.fit.edu
--  Course: CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package specification

--  INCLUDE  ------------------------------------
with Ada.Containers.Doubly_Linked_Lists;

--  PACKAGE  --------------------------------------------------
package Graph is

   type elementNode;
   type elementNode is record
      data : String (1 .. 50);
      list : Ada.Containers.Doubly_Linked_Lists (String);
   end record;

   procedure insertNode;
   procedure printLinkedList;

end Graph;
