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

--  NAMES  ----------------------------------------------------
--  NONE

--  PROCEDURE  ------------------------------------------------
procedure hear is

      --  No input line shall be greater than 150 chars
      inputLine    : String (1 .. 150);
      inputLineLen : Integer := 0;
      index        : Integer := 1;
      start        : Integer;

      left_tower  : Unbounded_String;
      right_tower : Unbounded_String;
      action      : Character;
      has_link    : Boolean;

begin

      --  Read from STDIN until End of File char is read
      <<Continue>>
      while not (Text_IO.End_Of_File) loop
            --------------------------------
            --  Read in a line
            --------------------------------
            Text_IO.Get_Line (inputLine, inputLineLen);
            --  Skip over empty lines
            if inputLineLen = 0 then
                  goto Continue;
            end if;

            --------------------------------
            --  Get left_tower
            --------------------------------
            --  Move index until the first non-blank character is found
            while inputLine (index) = ' ' loop
                  index := index + 1;
            end loop;

            --  Save the position of the first non-blank character
            start := index;
            loop
                  exit when inputLine (index) = ' ';
                  index := index + 1;
            end loop;

            left_tower := To_Unbounded_String
                          (inputLine (start .. index - 1));

            --------------------------------
            --  Get right_tower
            --------------------------------
            --  Move index until the first non-blank character is found
            while inputLine (index) = ' ' loop
                  index := index + 1;
            end loop;

            --  Save the position of the first non-blank character
            start := index;
            loop
                  exit when inputLine (index) = ' ';
                  exit when inputLine (index) = '.';
                  exit when inputLine (index) = '?';
                  index := index + 1;
            end loop;

            right_tower := To_Unbounded_String
                           (inputLine (start .. index - 1));

            --------------------------------
            --  Get action
            --------------------------------
            if inputLine (index) = ' ' then
                  loop
                        exit when inputLine (index) = '.';
                        exit when inputLine (index) = '?';
                        index := index + 1;
                  end loop;
            end if;
            action := inputLine (index);

            index := 1; --  Reset the index counter

            --------------------------------
            --  If action is '.' Insert new link
            --------------------------------
            if action = '.' then
                  Graph.InsertLink (To_String (left_tower),
                                    To_String (right_tower));

            --------------------------------
            --  If action is '?' Search for link
            --------------------------------
            else
                  --  Check if connection exists in the graph
                  --  if the connection does exists, follow this format:
                  has_link := Graph.HasLink (left_tower,
                                             right_tower);
                  if has_link = True then
                        --  + Tower_A => Tower_C
                        Text_IO.Put_Line ("+ " & To_String (left_tower)
                                          & " => " & To_String (right_tower));
                  --  if the connection does not exists, follow this format:
                  else
                        --  - Tower_D => Tower_B
                        Text_IO.Put_Line ("- " & To_String (left_tower)
                                          & " => " & To_String (right_tower));

                  end if;
            end if;
      end loop;

end hear;
