module Lib
  ( someFunc,
  )
where

import Data.Function ((&))

someFunc :: IO ()
primes :: [Integer]
primes = filterPrime [2 ..]
  where
    filterPrime (p : xs) =
      p : filterPrime [x | x <- xs, x `mod` p /= 0]

convertListToStringWithCase :: [Integer] -> String
convertListToStringWithCase (a : as) =
  show a
    ++ case length as of
      0 -> ". finished"
      _ -> ", " ++ convertListToStringWithCase as

convertListToStringWithIf :: Show a => [a] -> [Char]
convertListToStringWithIf (a : as) =
  show a
    ++ if null as -- length の代わりに null を使えと言われた。
      then ". finished"
      else ", " ++ convertListToStringWithIf as

joinString :: String -> String -> String
joinString a b = a ++ b

addNewLine :: [Char] -> [Char]
addNewLine a = a ++ "\n"

addCommentLineOnTop a b = (a & addNewLine) ++ b

take9PrimseNumbersListConversionTest comment =
  take 9 primes
    & convertListToStringWithIf
    & addCommentLineOnTop comment
    & putStrLn

someFunc = do
  let comment = "--- with case ---"
   in take 9 primes
        & convertListToStringWithCase
        & addCommentLineOnTop comment
        & putStrLn

  let comment = "--- with if   ---"
   in take 9 primes
        & convertListToStringWithIf
        & addCommentLineOnTop comment
        & putStrLn

  let groupComment = "============== to one function ============="
   in do
        putStrLn groupComment
        let comment = "--- with case ---"
         in take9PrimseNumbersListConversionTest comment

        let comment = "--- with if   ---"
         in take9PrimseNumbersListConversionTest comment

  joinString "test hello" "world"
    & putStrLn
