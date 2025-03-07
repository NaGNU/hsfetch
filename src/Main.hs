module Main where

f x y = x+y

x :: Int
x = 3

main = do
	x <- getLine
	print(f 2 x)

