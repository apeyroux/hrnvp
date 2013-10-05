import Hrnvp
import System.IO

main = do
    adr <- getContents
    putStrLn $ restrAdr adr 
