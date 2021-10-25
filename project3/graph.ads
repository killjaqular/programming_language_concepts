--  Author: Adonay Pichardo, apichardo2019@my.fit.edu
--  Course: CSE 4250, Summer 2021
--  Project: Proj3, Can you hear me now?

--  graph.adb: Graph package specification

--  PACKAGE  --------------------------------------------------
package Graph is

   type T is (Red, Green, Blue);     -- a type declaration

   subtype S is T range Red..Green;  -- a subtype declaration

   N: Integer;                       -- an object declaration

   C: constant Float := 3.14159;     -- a constant declaration

   E: exception;                     -- an exception declaration

   procedure Sub;                    -- a subprocedure declaration

   function Fun return Boolean;      -- a function declaration

end Graph;
