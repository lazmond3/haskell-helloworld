module Random
  ( nyshuffle,
  )
where

import System.Random

nyshuffle [] = return []
nyshuffle xs = do
  n <- getStdRandom $ randomR (0, length xs -1)
  print n -- ランダムに1文字取り出す その index となる。
  xs' <- nyshuffle $ take n xs ++ drop (n + 1) xs -- n番目を落として先頭に加える、という関数
  return $ (xs !! n) : xs'

-- nyshuffle xs = do
--   n <- getStdRandom $ randomR (0, length xs - 1) :: IO Int
--   xs' <- nyshuffle $ take n xs ++ drop (n + 1) xs
--   return $ (xs !! n) : xs'