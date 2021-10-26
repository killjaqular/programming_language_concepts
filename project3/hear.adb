--  Author:  Adonay Pichardo, apichardo2019@my.fit.edu
--  Author:  Josh Temel, jtemel2018@my.fit.edu
--  Course:  CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  hear.adb: write "Hello World" to terminal/stdout

--  Compile like so:
--  gnatmake -gnaty hear.adb
--  Run like so:
--  ./hear < someFile

--  INCLUDE  --------------------------------------------------
with Text_IO;
with Ada.Integer_Text_IO;
with Graph;

--  NAMES  ----------------------------------------------------
use Ada;

--  PROCEDURE  ------------------------------------------------
procedure hear is

   Line   : String (1 .. 150);
   Length : Integer;
   Num    : Integer := 0;

   left_tower  : String (1 .. 50);
   right_tower : String (1 .. 50);
   action      : String (1);

   X : Graph.T;

   B : Boolean := Graph.Fun;

begin

   Graph.Sub;
   Text_IO.Put_Line (Item => "SOME BOOLEAN " & Graph.Fun'Image);
   Text_IO.Put_Line (Item => "Printing:_> X'Image " & X'Image);

   --   Read from STDIN until the end
   while not (Text_IO.End_Of_File) loop
      Text_IO.Get_Line (Line, Length);
      Num := Num + 1;
      Integer_Text_IO.Put (Item => Num, Width => 4);
      Text_IO.Put (Item => "  " & Line (1 .. Length));
      Text_IO.New_Line;
   end loop;

end hear;
