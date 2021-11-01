--  Author:  Adonay Pichardo, apichardo2019@my.fit.edu
--  Author:  Josh Temel, jtemel2018@my.fit.edu
--  Course:  CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package implementation

--  INCLUDE  --------------------------------------------------
with Ada.Text_IO;

--  NAMES  ----------------------------------------------------
use Ada;

--  PACKAGE  --------------------------------------------------
package body Graph is

      -------------------------------
      --  Procedures and Functions
      -------------------------------

      -------------------------------
      --  InsertLink:
      --  Inserts link into graph
      --  left_node  : The left node
      --  right_node : The node that left_node connects to directly
      -------------------------------
      procedure InsertLink (left_node  : String;
                            right_node : String) is

            NewList : Unbounded_String_List.List;
      begin
            -------------------------------
            --  Check if left_node already exists
            -------------------------------
            for every_list of TheGraph loop
                  --  If the left_node already exists,
                  if First_Element (every_list) = left_node then
                        --  Append right_node to the already existing list
                        every_list.Append (To_Unbounded_String (right_node));
                        return;
                  end if;
            end loop;

            --  If left_node is not already in the Graph
            NewList := Unbounded_String_List.Empty_List;
            NewList.Append (To_Unbounded_String (left_node));
            NewList.Append (To_Unbounded_String (right_node));
            TheGraph.Append (NewList);
      end InsertLink;

      -------------------------------
      --  HasLink:
      --  Checks if a connection exists starting at from_node to to_node
      --  from_node : The starting node
      --  to_node   : The end node
      -------------------------------
      function HasLink (from_node : String;
                        to_node   : String) return Boolean is
      begin
            null;
            return (True);
      end HasLink;

      -------------------------------
      --  Auxiliary Procedures and Functions
      -------------------------------

      -------------------------------
      --  PrintGraph:
      --  Prints entire Graph
      -------------------------------
      procedure PrintGraph is
      begin
            for every_list of TheGraph loop
                  for every_element of every_list loop
                        Text_IO.Put ("<" & To_String
                                    (every_element) & "> => ");
                  end loop;
                  Text_IO.Put_Line ("");
            end loop;
      end PrintGraph;

end Graph;
