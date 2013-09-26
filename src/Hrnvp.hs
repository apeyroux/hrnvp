module Hnrvp where

import Data.List
import Data.Char


data Adresse = Adresse { l1 :: String,
                         l2 :: String } deriving (Show, Eq, Ord)

normAdr :: String -> String
normAdr (x:xs)
    | elem x badch = normAdr xs
    | otherwise = toUpper x : normAdr xs
    where badch = "();,.*#\n\t"
normAdr _ = []

restrAdr :: String -> Adresse
restrAdr s = (Adresse "alex" "88 rue des lapins")
