module Days.Day02 (runDay) where

import Data.List
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Data.Maybe
import Data.Set (Set)
import qualified Data.Set as Set
import Data.Vector (Vector)
import qualified Data.Vector as Vec
import qualified Util.Util as U

import qualified Program.RunDay as R (runDay)
import Data.Attoparsec.Text
import Data.Void

runDay :: Bool -> String -> IO ()
runDay = R.runDay inputParser partA partB

------------ TYPES ------------

data Move = Rock
          | Paper
          | Scissors
          deriving (Show)

data Game = Win
          | Lose
          | Draw

type Input = [(Move, Char)]

type OutputA = Integer

type OutputB = Integer

------------ UTILITIES ---------

value :: Move -> Game -> Integer
value m r = (value_m m) + (value_r r)
    where value_r Win       = 6
          value_r Draw      = 3
          value_r Lose      = 0
          value_m Rock      = 1
          value_m Paper     = 2
          value_m Scissors  = 3

play :: Move -> Move -> Game
play m1 m2 = case (m1, m2) of
    (Rock, Rock) -> Draw
    (Rock, Paper) -> Lose
    (Rock, Scissors) -> Win
    (Paper, Paper) -> Draw
    (Paper, Scissors) -> Lose
    (Scissors, Scissors) -> Draw
    _ -> not' $ play m2 m1
    where not' Win = Lose
          not' Lose = Win
          not' Draw = Draw

------------ PARSER ------------
moveParser :: Parser (Move, Char)
moveParser = do
    m1 <- choice 
        [ char 'A' >> return Rock
        , char 'B' >> return Paper
        , char 'C' >> return Scissors
        ]
    _ <- char ' '
    r <- choice 
        [ char 'X'
        , char 'Y'
        , char 'Z'
        ]
    return (m1, r)

inputParser :: Parser Input
inputParser = moveParser `sepBy` endOfLine

solve :: Input -> (Move -> Char -> Move) -> OutputA
solve i f = sum $ (\(m1, r) -> value (f m1 r) $ play (f m1 r) m1) <$> i

------------ PART A ------------
translateA :: Char -> Move
translateA c = case c of
    'X' -> Rock
    'Y' -> Paper
    'Z' -> Scissors
    _ -> error "Invalid character"

partA :: Input -> OutputA
partA i = solve i (\_ r -> translateA r)

------------ PART B ------------
translateB :: Move -> Char -> Move
translateB m c = case c of
    'X' -> case m of
        Rock -> Scissors
        Paper -> Rock
        Scissors -> Paper
    'Y' -> m
    'Z' -> case m of
        Rock -> Paper
        Paper -> Scissors
        Scissors -> Rock
    _ -> error "Invalid character"

partB :: Input -> OutputB
partB i = solve i translateB
