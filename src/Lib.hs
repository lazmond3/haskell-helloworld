module Lib
  ( someFunc,
  )
where

import Data.Function ((&))

someFunc :: IO ()

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

convertListToStringWithIf (a : as) =
  show a
    ++ if null as -- length の代わりに null を使えと言われた。
      then ". finished"
      else ", " ++ convertListToStringWithIf as

someFunc = do
  take 9 primes
    & convertListToStringWithCase
    & (++) ("--- with case ---" ++ "\n")
    & putStrLn

  take 9 primes
    & convertListToStringWithIf
    & (++) ("--- with if   ---" ++ "\n")
    & putStrLn
