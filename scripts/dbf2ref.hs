{-
 - Pourquoi pas de doublons ?
 - il devrait y en avoir car forcement deux noms de rue == dans niv diff
 -}

import Data.List
import Database.XBase.Dbf.Handle
import Text.PhoneticCode.Soundex
import Database.HDBC
import Database.HDBC.Sqlite3 
import qualified Data.ByteString.Lazy       as BL
import qualified Data.ByteString            as B
import qualified Data.ByteString.Char8      as BC8
import qualified Data.ByteString.Lazy.Char8 as BLC8

main = do
    initDb dbName
    putStrLn "you can take a cofee ! ..."
    mapM (\dbFile -> dbf2ref dbFile dbName) lFiles 
    where 
        dbName = "dicadr.db"
        lFiles = ["SHP/RESEAU_ROUTIER_NIV1.dbf", 
                  "SHP/RESEAU_ROUTIER_NIV2.dbf",
                  "SHP/RESEAU_ROUTIER_NIV3.dbf", 
                  "SHP/RESEAU_ROUTIER_NIV4.dbf", 
                  "SHP/RESEAU_ROUTIER_NIV5.dbf"]

initDb dbName = do
    putStrLn $ "init " ++ dbName ++ " ..."
    conn <- connectSqlite3 "dicadr.db"
    run conn "CREATE TABLE adr (name VARCHAR(80))" []
    commit conn
    disconnect conn
    putStrLn $ "init " ++ dbName ++ " ... ok"

dbf2ref sourceFile dbName = do
    putStrLn $ "check " ++ sourceFile
    h <- openDbf sourceFile True
    recs <- dbfRecords h
    fields <- dbfFields h
    r <- mapM (\x-> readDbfField x (fields!!0)) recs
    conn <- connectSqlite3 dbName
    insertAdr <- prepare conn "INSERT INTO adr VALUES (?)"
    mapM (\x -> execute insertAdr [SqlByteString $ (B.concat (BL.toChunks x))]) $ map head $ group $ sort r
    commit conn
    disconnect conn
    putStrLn $ "commit " ++ sourceFile ++ " in db ... ok"
    BLC8.writeFile "lrues.txt" $ BLC8.unlines $ map head $ group $ sort r
