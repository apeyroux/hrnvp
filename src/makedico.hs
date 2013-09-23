import System.IO
import Data.List
import Text.PhoneticCode.Soundex

main = do
        putStrLn "--- start makedico ---"
	h <- openBinaryFile "rues.txt" ReadMode 
	c <- hGetContents h
        writeFile "dico.txt" $ unlines $ map (\x -> show (soundexSimple x, x)) $ map head (group $ sort $ words c)
        putStrLn "--- end makedico ---"
