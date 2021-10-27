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

   --  No input line shall be greater than 150 chars
   inputLine   : String (1 .. 150);
   inputLength : Integer;

   --  No tower name shall be greater than 50 chars
   left_tower  : String (1 .. 50);
   right_tower : String (1 .. 50);
   --  The char '.' adds a link between two towers
   --  The char '?' asks if a connection exists between two towers
   action      : Character;

   --  Maintains a directed graph as lists of lists of the entire network
   network : Graph.elementNode;

begin

   --  Read from STDIN until End of File char is read
   while not (Text_IO.End_Of_File) loop
      --------------------------------
      --  Read in a line
      --------------------------------
      Text_IO.Get_Line (inputLine, inputLength);
      Text_IO.Put_Line ("inputLine:_> " & inputLine);

      --------------------------------
      --  Get left_tower
      --------------------------------

      --------------------------------
      --  Get right_tower
      --------------------------------

      --------------------------------
      --  Get action
      --------------------------------

      --------------------------------
      --  Insert new link
      --------------------------------

      --------------------------------
      --  Search for link
      --------------------------------

   end loop;

end hear;
