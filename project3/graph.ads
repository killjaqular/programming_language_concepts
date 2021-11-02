--  Author:  Adonay Pichardo, apichardo2019@my.fit.edu
--  Author:  Josh Temel, jtemel2018@my.fit.edu
--  Course:  CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package specification

--  INCLUDE  --------------------------------------------------
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Unbounded_Synchronized_Queues;
with Ada.Containers.Synchronized_Queue_Interfaces;

--  NAMES  ----------------------------------------------------
--  NONE
use Ada.Containers;
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

      --  The outer most list
      TheGraph : List_List.List := List_List.Empty_List;

      --  Queue
      package String_queues is
      new Synchronized_Queue_Interfaces (Element_Type => Unbounded_String);
      use String_queues;

      package Unbounded_String_Queues is
      new Unbounded_Synchronized_Queues (Queue_Interfaces => String_queues);
      use Unbounded_String_Queues;

      -------------------------------
      --  This section has functions and procedures
      --  used to manipulate information in the Graph.
      -------------------------------
      procedure InsertLink (left_node  : String;
                            right_node : String);

      function HasLink (from_node : Unbounded_String;
                        to_node   : Unbounded_String) return Boolean;

      -------------------------------
      --  This section has functions and procedures
      --  used to display information in the Graph.
      -------------------------------
      procedure PrintGraph;

end Graph;
