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
with Ada.Integer_Text_IO;
with Graph;

--  PROCEDURE  ------------------------------------------------
procedure hear is

      --  No input line shall be greater than 150 chars
      inputLine    : String (1 .. 150);
      inputLineLen : Integer;
      index : Integer := 1;
      start : Integer;

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
            Text_IO.Get_Line (inputLine, inputLineLen);
            Text_IO.Put_Line ("inputLine:=> " & inputLine (1 .. inputLineLen));
            --------------------------------
            --  Get left_tower
            --------------------------------
            while inputLine (index) = ' ' loop
                  index := index + 1;
            end loop;

            --  Text_IO.Put_Line (inputLine (1 .. index));
            start := index;
            loop
                  exit when inputLine (index) = ' ';
                  index := index + 1;
            end loop;

            --  Ada.Integer_Text_IO.Put (index - 1);
            Append (left_tower, inputLine (start .. index - 1));
            Text_IO.Put_Line (To_String (left_tower));
            --------------------------------
            --  Get right_tower
            --------------------------------
            while inputLine (index) = ' ' loop
                  index := index + 1;
            end loop;

            --  Text_IO.Put_Line (inputLine (1 .. index));
            start := index;
            loop
                  exit when inputLine (index) = ' ';
                  index := index + 1;
            end loop;

            --  Text_IO.Put_Line (inputLine (start .. index - 1));
            Append (right_tower, inputLine (start .. index - 1));
            Text_IO.Put_Line (To_String (right_tower));
            --------------------------------
            --  Get action
            --------------------------------
            loop
                  exit when inputLine (index) = '.';
                  exit when inputLine (index) = '?';
                  index := index + 1;
            end loop;

            action := inputLine (index);
            Text_IO.Put (action);
            --------------------------------
            --  If action is '.' Insert new link
            --------------------------------

            --------------------------------
            --  If action is '?' Search for link
            --------------------------------

      end loop;

      Graph.printMessage;

end hear;
