import Database.XBase.Dbf.Handle
import Data.List
import qualified Data.ByteString.Lazy       as BL
import qualified Data.ByteString            as B
import qualified Data.ByteString.Char8      as BC8
import qualified Data.ByteString.Lazy.Char8 as BLC8

main = do
    mapM dbf2ref lFiles 
    where lFiles = ["SHP/RESEAU_ROUTIER_NIV1.dbf", 
                    "SHP/RESEAU_ROUTIER_NIV2.dbf", 
                    "SHP/RESEAU_ROUTIER_NIV3.dbf", 
                    "SHP/RESEAU_ROUTIER_NIV4.dbf", 
                    "SHP/RESEAU_ROUTIER_NIV5.dbf"]

-- penser à virer les "lignes blanches"
-- netoyer les lignes en sup les char " "
dbf2ref f = do
    putStrLn $ "check " ++ f
    h <- openDbf f True
    recs <- dbfRecords h
    fields <- dbfFields h
    r <- mapM (\x-> readDbfField x (fields!!0)) recs
    BLC8.writeFile "lrues.txt" $ BLC8.unlines $ map head $ group $ sort r
