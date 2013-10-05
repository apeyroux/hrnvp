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
 - je considere que le cp est le pivot de l'adresse
 - codaz very crado mais fait en 1h pour tester les regex en haskell
 -
 -}

module Hrnvp (restrAdr, normAdr) where

import Data.List
import Data.Char
import Data.Int
import Text.Regex as R
import Data.Map as M

-- sert pas pour le moment
data Adresse = Adresse { l1 :: String,
                         l2 :: String } deriving (Show, Eq, Ord)

normAdr :: String -> String
normAdr (x:xs)
    | elem x badch = normAdr xs
    | otherwise = toUpper x : normAdr xs
    where badch = "();,.*#\n\t"
normAdr _ = []

restrAdr adr = case matchPivot (normAdr adr) of
                Nothing -> "WTF ! its not adr ... :(" -- fucking crade : return nothing pour la prochaine fois !
                Just (b, m, a, _) -> 
                            case matchCity m of
                            Nothing -> "NO CP No City !"
                            Just c -> 
                                -- maintenant que j'ai le cp je vais chercher la rue et le nom du gars
                                -- il faudrait ajouter un check de "chez" pour que ce soit complet
                                case cutAdr b of
                                Nothing -> "I dont match street number ..."
                                Just (b', m', a', _) ->
                                    case matchChez b' of
                                    Nothing -> "l1 :" ++ b' ++ "\nl5 :" ++ m' ++ a' ++ "\nl6 :" ++ m ++ " " ++ c
                                    Just (b'', _, a'', _) -> "l1 :" ++ b'' ++ "\nl2 :" ++ a'' ++ "\nl5 :" ++ m' ++ a' ++ "\nl6 :" ++ m ++ " " ++ c
   
cutAdr beforeCp = matchRegexAll rNumber beforeCp 
                where rNumber = R.mkRegex "[1-9]+( AV| BIS| BD| RUE)"

matchChez adr = matchRegexAll rChez adr
                where rChez = R.mkRegex "CHEZ"
 
-- return un tuple (before, match, after, []) or nothing
matchPivot adr = matchRegexAll rCp adr
                where rCp = R.mkRegex "((0[1-9])|([1-8][0-9])|(9[0-8])|(2A)|(2B))[0-9]{3}"

-- virer le a|à + nom de la ville
processA adr = subRegex rA adr "" 
                where rA = R.mkRegex "(A|À)*" -- faire regex a|à + nom ville + cp si ou cp + non ville

-- peut ce passer du match dans la liste des villes/cp
matchCity cp = M.lookup cp (M.fromList citys)
                where citys = [("92320", "CHATILLON"), ("92190", "MEUDON")]
