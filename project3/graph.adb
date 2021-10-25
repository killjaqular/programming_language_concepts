--  Author: Adonay Pichardo, apichardo2019@my.fit.edu
--  Course: CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package implementation

--  INCLUDE  ------------------------------------
with Ada.Text_IO;

--  NAMES  --------------------------------------
use Ada;

--  PACKAGE  --------------------------------------------------
package body Graph is

   procedure Sub is
   begin
      -- print name of the Nth element in type "T"
      Text_IO.Put_Line (Item=>T'Image (T'Val (N)));
   end Sub;

   function Fun return Boolean is
   begin
      return (True);
   end Fun;

begin

   -- initialize "N" with position of "Green" in type "T"
   N := T'Pos (Green);

end Graph;
