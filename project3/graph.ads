--  Author:  Adonay Pichardo, apichardo2019@my.fit.edu
--  Author:  Josh Temel, jtemel2018@my.fit.edu
--  Course:  CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package specification

--  INCLUDE  --------------------------------------------------
with Ada.Containers.Doubly_Linked_Lists; use Ada.Containers;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

--  NAME  -----------------------------------------------------
--  NONE

--  PACKAGE  --------------------------------------------------
package Graph is

      -------------------------------
      --  Declarations and Initializations
      -------------------------------

      --  List of Unbounded Strings
      package Unbounded_String_List is
      new Doubly_Linked_Lists (Unbounded_String);
      use Unbounded_String_List;

      --  List of lists
      package List_List is
      new Doubly_Linked_Lists (Unbounded_String_List.List);
      use List_List;

      --  Cursors for pointing to elements in lists
      innerCursor  : Unbounded_String_List.Cursor;
      outterCursor : List_List.Cursor;

      --  The outer most list
      The_Graph : List_List.List := List_List.Empty_List;

      -------------------------------
      --  This section has functions and procedures
      --  used to manipulate information in the Graph.
      -------------------------------
      function FindConnection (fromNode : String;
                               toNode   : String) return Boolean;

      function IsInSpine (name : String) return Boolean;

end Graph;
