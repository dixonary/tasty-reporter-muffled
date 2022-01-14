module Test.Tasty.Muffled where

import Data.Char (isSpace)
import Data.List (dropWhileEnd)
import Data.List.Split (splitOn)
import Test.Tasty (TestTree, TestName, defaultMain, defaultMainWithIngredients)
import Test.Tasty.Ingredients.ConsoleReporter
  (consoleTestReporterWithHook)
import Test.Tasty.Runners
    ( Ingredient,
      Result(resultOutcome, resultDescription),
      Outcome(Failure, Success),
      listingTests)

muffledMain :: TestTree -> IO ()
muffledMain = defaultMainWithIngredients muffledIngredients

muffledIngredients :: [Ingredient]
muffledIngredients = [listingTests, muffledTestReporter]

muffledTestReporter :: Ingredient
muffledTestReporter = consoleTestReporterWithHook modifyResult

modifyResult :: [TestName] -> Result -> IO Result
modifyResult tests res = pure $ case resultOutcome res of
  Success -> res
  Failure {} -> res { resultDescription = dropWhileEnd isSpace rd' }
    where
      (rd' : _) 
          = splitOn "CallStack (from HasCallStack):" 
          $ resultDescription res