module Days.Day01 (runDay) where

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
type Input = [[Integer]]

type OutputA = Integer

type OutputB = Void

------------ PARSER ------------
inputParser :: Parser Input
inputParser = decimal `sepBy` endOfLine `sepBy` (endOfLine >> endOfLine)


------------ PART A ------------
partA :: Input -> OutputA
partA i = maximum $ sum <$> i

------------ PART B ------------
partB :: Input -> OutputB
partB = error "Not implemented yet!"
