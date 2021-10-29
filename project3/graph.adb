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

      package edgeContainer is
      new Doubly_Linked_Lists (Unbounded_String);
      use edgeContainer;

      package vectorContainer is
      new Doubly_Linked_Lists (edgeContainer.List);
      use vectorContainer;

      --  Cursors for points to elements in lists
      innerCursor : edgeContainer.Cursor;
      outterCursor : vectorContainer.Cursor;

      procedure printMessage is
      begin
            Text_IO.Put_Line (theMessage);
      end printMessage;

      procedure newAdjList is
            outter : vectorContainer.List := vectorContainer.Empty_List;
      begin
            --  Add Empty inner list
            outter.Append (edgeContainer.Empty_List);
      end newAdjList;

end Graph;
