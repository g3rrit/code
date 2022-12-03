{-# LANGUAGE LambdaCase #-}

module Days.Day03 (runDay) where

import Data.Char (ord)

import qualified Program.RunDay as R (runDay)
import Data.Attoparsec.Text (Parser, sepBy, letter, endOfLine, many1)
import Data.Void

runDay :: Bool -> String -> IO ()
runDay = R.runDay inputParser partA partB

------------ TYPES ------------
type Input = [String]

type OutputA = Integer

type OutputB = Void

------------ UTILITIES ---------

charToVal :: Char -> Integer
charToVal a 
    | val <= 90 = toInteger $ val - 38
    | val <= 122 = toInteger $ val - 96
    | otherwise = error "Invalid character"
    where val = ord a

splitString :: String -> (String, String)
splitString s = (take ll s, drop ll s)
    where l = toInteger $ (length s) `div` 2
          ll = fromIntegral l

------------ PARSER ------------
inputParser :: Parser Input
inputParser = (many1 letter) `sepBy` endOfLine

------------ PART A ------------
getMatch :: String -> String -> Maybe Char
getMatch [] _ = Nothing
getMatch (x:xs) ys = getMatch' ys
    where getMatch' = \case
            [] -> getMatch xs ys
            (y:yys) -> if x == y
                      then Just x
                      else getMatch' yys

lineToVal :: String -> Integer
lineToVal s = case getMatch s1 s2 of
        Just a -> charToVal a
        Nothing -> error "No matching in strings"
    where (s1, s2) = splitString s

partA :: Input -> OutputA
partA i = sum $ lineToVal <$> i

------------ PART B ------------
partB :: Input -> OutputB
partB = error "Not implemented yet!"
