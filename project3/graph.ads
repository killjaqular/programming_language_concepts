--  Author:  Adonay Pichardo, apichardo2019@my.fit.edu
--  Author:  Josh Temel, jtemel2018@my.fit.edu
--  Course:  CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package specification

--  INCLUDE  --------------------------------------------------
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

--  NAME  -----------------------------------------------------
--  NONE

--  PACKAGE  --------------------------------------------------
package Graph is

      --------------------------------
      --  EXAMPLE STUFF
      --------------------------------
      theMessage : String := "MESSAGE FROM graph.ads, PRINTED BY graph.adb.";

      procedure printMessage;

      --------------------------------
      --  GRAPH STUFF
      --------------------------------

      package listPackage is
      new Ada.Containers.Doubly_Linked_Lists (Unbounded_String);

      outterList : listPackage.List;
      innerList  : listPackage.List;

end Graph;
