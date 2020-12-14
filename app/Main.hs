module Main where

import Data.List ()
import Hello
import Lib
import Random

main :: IO ()
-- do なし記法
main =
  nyshuffle [1 .. 9] >>= \x ->
    print x

-- 動いた！
-- main = do
--   x <- nyshuffle [1, 2, 3, 4]
--   print x

--   someFunc
--   helloFunc

-- main = do
--     x <- getLine
--     let n = length $ filter (== 'N') x
--     let w = length $ filter (== 'W') x
--     let s = length $ filter (== 'S') x
--     let e = length $ filter (== 'E') x
--     let p1 = (n > 0 && s > 0) || (n == 0 && s == 0)
--     let p2 = (w > 0 && e > 0) || (w == 0 && e == 0)
--     putStrLn $ if p1 && p2 then "Yes" else "No"
