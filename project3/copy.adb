--  copy.adb:  copy standard input to output numbering lines

with Text_IO, Ada.Integer_Text_IO;
use Ada;

procedure Copy is
   Line   : String (1 .. 100);
   Length : Integer;
   Num    : Integer := 0;

begin

   while not (Text_IO.End_Of_File) loop
      Text_IO.Get_Line (Line, Length);
      Num := Num + 1;
      Integer_Text_IO.Put (Item => Num, Width => 4);
      Text_IO.Put (Item => "  " & Line (1 .. Length));
      Text_IO.New_Line;
   end loop;

end Copy;
