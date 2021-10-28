--  Author:  Adonay Pichardo, apichardo2019@my.fit.edu
--  Author:  Josh Temel, jtemel2018@my.fit.edu
--  Course:  CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package implementation

--  INCLUDE  --------------------------------------------------
with Ada.Containers.Doubly_Linked_Lists;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO;

--  NAMES  ----------------------------------------------------
use Ada;

--  PACKAGE  --------------------------------------------------
package body Graph is

procedure printMessage is
begin

      Text_IO.Put_Line (theMessage);

      end printMessage;

end Graph;
