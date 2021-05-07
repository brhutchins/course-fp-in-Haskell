module Main where

import System.Random

check :: String -> String -> Char -> (Bool, String)
check word display c
  = (elem c word, [if x==c
        then c
        else y | (x,y) <- zip word display])

getRandomWord :: [String] -> StdGen -> String
getRandomWord wordList' g = wordList' !! rnd (length wordList' - 1) g
                      where rnd upperBound g' = fst $ randomR (0, upperBound) g'

starman :: String -> Int -> IO ()
starman word = turn word ['-' | _ <- word]

turn :: String -> String -> Int -> IO ()
turn word display n
    | n==0          = do putStrLn ("The word was \"" ++ word ++ "\"")
                         putStrLn "You lose"
    | word==display = do putStrLn (display ++ " " ++ replicate n '*')
                         putStrLn "You win!"
    | otherwise     = mkguess word display n

mkguess :: String -> String -> Int -> IO ()
mkguess word display n =
  do putStrLn (display ++ " " ++ replicate n '*')
     putStrLn "Enter your guess: "
     q <- getLine
     let (correct, display') = check word display (head q)
     let n' = if correct then n else n - 1
     turn word display' n'

main :: IO ()
main = do
  g <- newStdGen
  wordList <- dict
  starman (getRandomWord wordList g) 10

dict :: IO [String]
dict = do
  let fileName = "resources/" ++ "words.txt"
  contents <- readFile fileName
  return (lines contents)
