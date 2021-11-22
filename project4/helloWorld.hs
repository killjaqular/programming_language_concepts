{-
- Author: Adonay Pichardo, apichardo2019@gmail.com
- Course: CSE 4250, Fall 2019
- Project: Proj4, Tautology Checker
- Language implementation: Glorious Glasgow Haskell Compilation System, version 8.4.3
-}

{-
    Given a string representing postfix predicate notation, evaluate the expression True
    if it can be proven to be a Tautology, False otherwise.

    We may NOT use Monads. Avoid using 'do'.
    Main shoud be: String -> String

    Constructors can be pattern matched.
    Constructors create data on the heap.
    Constructors must be used, example syntax:
    data Food = Cake Bool | Cookies Bool | CandyCane Color
    Cake True :: Food
    Cake False :: Food
    Cookies True :: Food
    Cookies False :: Food

    Cake :: Bool -> Food
    Cookies :: Bool -> Food
    CandyCane :: Color -> Food

    We must use Trees, example:
    data SimpleTree = SimLeaf | SimBranch SimpleTree SimpleTree
    OR
    data Tree = Leaf | Branch Tree Tree
    OR
    data BoolTree = BoolLeaf Bool | BoolBranch BoolTree BoolTree
    OR
    data BoolTree a b = BoolLeaf Bool | BoolBranch BoolTree a BoolTree b

    In Predicate Notation
    A   v   disjunction
    C   =>  implication
    D   |   nand
    E   <=> equivalence
    J   +   xor
    K   &   conjunction
    N   ˜   unary negation

Sample input:

P              P
PQRAKPQKC      ((P & (Q v R)) => (P & Q))
PQRAKPQKPRKAE  ((P & (Q v R)) <=> ((P & Q) v (P & R)))

Sample output:

false P
false ((((~P v ~Q) v P) & ((~P v ~R) v P)) & (((~P v ~Q) v Q) & ((~P v ~R) v Q)))
true  ((((((~P v ~Q) v (P v P)) & ((~P v ~Q) v (Q v P))) & (((~P v ~Q) v (P v R)) & ((~P v ~Q) v (Q v R)))) & ((((~P v ~R) v (P v P)) & ((~P v ~R) v (Q v P))) & (((~P v ~R) v (P v R)) & ((~P v ~R) v (Q v R))))) & ((((~P v ~Q) v P) & ((~P v ~R) v P)) & (((~P v ~Q) v (Q v R)) & ((~P v ~R) v (Q v R)))))
-}

import System.IO

-- Functions:
-- Disjunction: X OR Y
-- Example usage: putStrLn $ show $ True `f_A` False
f_A :: Bool -> Bool -> Bool
f_A x y = x || y

-- Conjunction: X AND Y
-- Example usage: putStrLn $ show $ True `f_K` False
f_K :: Bool -> Bool -> Bool
f_K x y = x && y

-- Negation: NOT X
-- Example usage: putStrLn $ show $ f_N False
f_N :: Bool -> Bool
f_N x = not x

-- Implication: X => Y
-- Example usage: putStrLn $ show $ True `f_C` False
f_C :: Bool -> Bool -> Bool
f_C x y = x <= y

-- Nand: X | Y
-- Example usage: putStrLn $ show $ True `f_D` False
f_D :: Bool -> Bool -> Bool
f_D x y = not $ x `f_K` y

-- Equivalence: X <=> Y
-- Example usage: putStrLn $ show $ True `f_E` False
f_E :: Bool -> Bool -> Bool
f_E x y = x == y

-- Exclusive OR: X XOR Y
-- Example usage: putStrLn $ show $ True `f_J` False
f_J :: Bool -> Bool -> Bool
f_J x y = x /= y

-- Main
main = do
    foundEOF <- isEOF
    if foundEOF
        then return ()
    else do
        inputLine <- getLine
        putStrLn inputLine

        putStrLn $ show $ True `f_A` False  -- Expected value: True
        putStrLn $ show $ True `f_K` False  -- Expected value: False
        putStrLn $ show $ f_N False         -- Expected value: True
        putStrLn $ show $ True `f_C` False  -- Expected value: False
        putStrLn $ show $ True `f_D` True   -- Expected value: False
        putStrLn $ show $ False `f_E` False -- Expected value: True
        putStrLn $ show $ False `f_J` False -- Expected value: False

        main
