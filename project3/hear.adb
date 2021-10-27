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
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada;
with Graph;

--  PROCEDURE  ------------------------------------------------
procedure hear is

   --  No input line shall be greater than 150 chars
   inputLine   : Unbounded_String;

   --  No tower name shall be greater than 50 chars
   left_tower  : Unbounded_String;
   right_tower : Unbounded_String;
   --  The char '.' adds a link between two towers
   --  The char '?' asks if a connection exists between two towers
   action      : Character;

   --------------------------------
   --  Create a new graph
   --------------------------------
   --  <left_tower><right_tower><action>

begin

   --  Read from STDIN until End of File char is read
   while not (Text_IO.End_Of_File) loop
      --------------------------------
      --  Read in a line
      --------------------------------
      inputLine := To_Unbounded_String (Text_IO.Get_Line);
      Text_IO.Put_Line ("inputLine:_> " & To_String(inputLine));

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
      --  If action is '.' Insert new link
      --------------------------------

      --------------------------------
      --  If action is '?' Search for link
      --------------------------------

   end loop;

   Graph.printMessage;

end hear;
