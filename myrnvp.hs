import Hrnvp
import qualified Data.ByteString.Char8 as C8

main = do
    adr <- C8.getContents
    putStrLn $ (show (restrAdr adr)::String)
