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

convert_list_to_string:: [Integer] -> String
convert_list_to_string (a:as) = show a ++ 
    case length as of
        0 -> ". finished"
        _ -> ", " ++ convert_list_to_string as


someFunc = take 9 primes &
            convert_list_to_string & 
            -- show & 
            putStrLn
