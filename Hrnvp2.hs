module Hrnvp where

import Text.Regex.Posix
import qualified Data.ByteString.Char8 as C8
import qualified Data.Text as T
import qualified Data.Text.Encoding as E

data Adresse = Adresse {
    l1::C8.ByteString,
    l2::C8.ByteString,
    l3::C8.ByteString,
    l4::C8.ByteString,
    l5::C8.ByteString,
    l6::C8.ByteString,
    l7::C8.ByteString } deriving (Show, Eq, Ord)

restrAdr :: C8.ByteString -> Adresse
restrAdr a = case matchPivot $ clearAdr a of
    (b, m, a) -> case matchRue b of
        (b', m', a') -> case matchChez b' of
            (b'', m'', a'') -> (Adresse b'' 
                            (C8.append m'' a'')
                            (C8.append m' a')
                            (C8.pack "") 
                            (C8.pack "") 
                            (C8.append m a)
                            (C8.pack ""))
    

{- 
 - Le pivot est le cp de la ville
 - (before, cp, after)
 -}
matchPivot :: C8.ByteString -> (C8.ByteString, C8.ByteString, C8.ByteString)
matchPivot a = a =~ rx :: (C8.ByteString, C8.ByteString, C8.ByteString)
    where rx = "((0[1-9])|([1-8][0-9])|(9[0-8])|(2A)|(2B))[0-9]{3}"

{-
 - (before == header de l'adresse, num rue, voie)
 -}
matchRue :: C8.ByteString -> (C8.ByteString, C8.ByteString, C8.ByteString)
matchRue a = a =~ rx :: (C8.ByteString, C8.ByteString, C8.ByteString)
    where rx = "[1-9]+( AV| BIS| BD| BOULVARD| RUE)"

matchChez :: C8.ByteString -> (C8.ByteString, C8.ByteString, C8.ByteString)
matchChez a = a =~ rx :: (C8.ByteString, C8.ByteString, C8.ByteString)
    where rx = "CHEZ"

clearAdr :: C8.ByteString -> C8.ByteString
clearAdr a = E.encodeUtf8 $ T.toUpper $ E.decodeUtf8 a
