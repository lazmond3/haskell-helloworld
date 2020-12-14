module Random
  ( nyshuffle,
  )
where

import System.Random

nyshuffle [] = return []
nyshuffle xs = do
  n <- getStdRandom $ randomR (0, length xs - 1) :: IO Int
  xs' <- nyshuffle $ take n xs ++ drop (n + 1) xs
  return $ (xs !! n) : xs'