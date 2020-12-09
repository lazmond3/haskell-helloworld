module Lib where
    ( someFunc 
) where
someFunc :: IO ()


primes = filterPrime [2..]
    where filterPrime (p:xs) = 
            p : filterPrime [x | x <- xs, x `mod` p /= 0]



someFunc = putStrLn  $ show $ take 9 primes 
-- -- someFunc2::IO()
-- -- someFunc2 = putStrLn take 9 primes

