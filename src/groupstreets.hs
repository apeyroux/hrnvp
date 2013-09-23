import System.IO
import Data.List

main = do
        putStrLn "--- start ---"
	h <- openBinaryFile "rues.txt" ReadMode 
	c <- hGetContents h
	writeFile "lrues.txt" $ unlines $ map head (group $ sort $ lines c)
        putStrLn "--- end ---"
