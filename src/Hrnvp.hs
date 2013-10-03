{-
 -
 - https://github.com/kawu/nerf
 -
 - Eléments de l'adresse    Exemple
 - 1. Nom du destinataire  Mr Pierre Boulanger
 - 2. Fonction/Département (optionnel) Directeur, Dpt Qualité
 - 3. Organisation (si d’application)  Acme SA
 - 4. Informations de dispatch (si d’application)  Bloc A - Etage 4 - Porte 6
 - 5. Type et nom de rue + numéro + n° de boîte    Rue du Vivier 7C bte 5
 - 6. Code postal + Localité   1000 Bruxelles
 - 7. Pays (seulement pour courrier trans-frontalier)  Belgique
 -
 -
 -}

module Hnrvp where

import Data.List
import Data.Char
import Data.Int
import Data.ByteString.Lazy

data Adresse = Adresse { l1 :: String,
                         l2 :: String } deriving (Show, Eq, Ord)

normAdr :: String -> String
normAdr (x:xs)
    | elem x badch = normAdr xs
    | otherwise = toUpper x : normAdr xs
    where badch = "();,.*#\n\t"
normAdr _ = []

restrAdr :: String -> Adresse
restrAdr s = (Adresse "alex" "88 rue stsi2")

isDate :: String -> Maybe Bool
isDate x | elem (read x::Integer) [1100..2050] = Just True
	 | otherwise = Nothing

searchCity :: [ByteString] -> Maybe String
searchCity (x:xs) | elem x citys = Just x
                  | otherwise = searchCity xs
                  where citys = ["meudon", "clamart", "paris"]
searchCity [] = Nothing

isCp :: String -> [Maybe String]
isCp s = map (\(x,y)-> if x == s then Just y else Nothing) cpcity
        where cpcity = [("92320","C345","Chatillon"),("92140","C456","Clamart"),("92190","M350","Meudon")]
