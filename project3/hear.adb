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
      TheGraph : Graph.List_List.List;
      NewList  : Graph.Unbounded_String_List.List;

begin

      --  Read from STDIN until End of File char is read
      while not (Text_IO.End_Of_File) loop
            --------------------------------
            --  Read in a line
            --------------------------------
            Text_IO.Get_Line (inputLine, inputLineLen);
            --  Text_IO.Put_Line ("inputLine:=> <" &
            --                  inputLine (1 .. inputLineLen) & ">");

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
            Text_IO.Put_Line ("<" & To_String (left_tower) & ">");

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
            Text_IO.Put_Line ("<" & To_String (right_tower) & ">");

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
            Text_IO.Put_Line ("<" & action & ">");

            index := 1; --  Reset the index counter

            --------------------------------
            --  If action is '.' Insert new link
            --------------------------------
            --  Check if left_tower is in main spine
            NewList := Graph.Unbounded_String_List.Empty_List;
            NewList.Append (left_tower);
            TheGraph.Append (NewList);

            --------------------------------
            --  If action is '?' Search for link
            --------------------------------
            --  Check if connection exists in the graph
                  --  if the connection does exists, follow this format:
                  --  + Tower_A => Tower_C
                  Text_IO.Put_Line ("+ " & To_String (left_tower)
                                    & " => " & To_String (right_tower));
                  --  if the connection does not exists, follow this format:
                  --  - Tower_D => Tower_B
                  Text_IO.Put_Line ("- " & To_String (left_tower)
                                    & " => " & To_String (right_tower));

            Text_IO.Put_Line ("-------------------------------------");

      end loop;

      for every_list of TheGraph loop
            for every_element of every_list loop
                  Text_IO.Put ("ELEM: " & To_String (every_element) & " ");
            end loop;
            Text_IO.Put_Line ("NEXT");
      end loop;

end hear;
