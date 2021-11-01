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
      --  Checks if the first entry of any list in The_Graph is 'name'
      --  name : The node to search
      -------------------------------
      function IsInSpine (name : String) return Boolean is
      begin
            for every_list of The_Graph loop
                  if every_list (0) = name then
                        return (True);
                  end if;
            end loop;

            return (False);
      end IsInSpine;

end Graph;
