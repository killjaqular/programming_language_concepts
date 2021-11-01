--  Author:  Adonay Pichardo, apichardo2019@my.fit.edu
--  Author:  Josh Temel, jtemel2018@my.fit.edu
--  Course:  CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package implementation

--  INCLUDE  --------------------------------------------------
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Text_IO;

--  NAMES  ----------------------------------------------------
use Ada;
use Ada.Containers;

--  PACKAGE  --------------------------------------------------
package body Graph is

      -------------------------------
      --  Procedures and Functions
      -------------------------------

      -------------------------------
      --  InsertUnbounded_String_List:
      --  Inserts a new and empty Unbounded String List
      -------------------------------
      procedure InsertUnbounded_String_List is
            NewUnbounded_String_List : Unbounded_String_List.List :=
            Unbounded_String_List.Empty_List;
      begin
            The_Graph.Append (NewUnbounded_String_List);
      end InsertUnbounded_String_List;

      -------------------------------
      --  FindConnection:
      --  Checks if a connection between towers exists in the graph
      --  fromNode : The starting node
      --  toNode   : The ending node
      -------------------------------
      function FindConnection (fromNode : String;
                               toNode   : String) return Boolean is
      begin
            return (True);
      end FindConnection;

      -------------------------------
      --  IsInSpine:
      --  Checks if a node is already in the outer most list
      --  name : The name of a node to search
      -------------------------------
      function IsInSpine (name : String) return Boolean is
      begin
            for every_list of TheGraph loop
                  --  Check first element in each list
                  if name = every_list(0) then
                        return (True);
            end loop;

            return (False);
      end IsInSpine;

      -------------------------------
      --  PrintGraphBFS:
      --  Print entire Graph in Breath First Search order
      -------------------------------
      procedure PrintGraphBFS is
      begin
            --  Loop over the elements of the outer and inner list.
            for Inner_List of The_Graph loop
                  for Inner_Elem of Inner_List loop
                        Text_IO.Put (To_String (Inner_Elem) & " ");
                  end loop;
                  Text_IO.New_Line;
            end loop;
      end PrintGraphBFS;

end Graph;
