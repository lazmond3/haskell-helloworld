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

someFunc = take 9 primes & show & putStrLn
