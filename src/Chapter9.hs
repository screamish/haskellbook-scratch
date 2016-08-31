module Chapter9 where

import Data.List
import Data.Char

onlyUppers :: String -> String
onlyUppers = filter isUpper

capitalise :: String -> String
capitalise [] = []
capitalise (x:xs) = toUpper x : xs

holler :: String -> String
holler [] = []
holler (x:xs) = toUpper x : holler xs

upperHead :: String -> Char
upperHead s =
  let h = head s
  in toUpper h

upperHead' :: String -> Char
upperHead' s = toUpper $ head s

upperHead'' :: String -> Char
upperHead'' = toUpper . head
