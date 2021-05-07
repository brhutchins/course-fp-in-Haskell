speller :: [String] -> String
speller xss = foldr (addComma . xIsFor) "" $ removeNullWordsFrom xss
    where addComma xs ys
            | null ys   = "and " ++ xs
            | otherwise = xs ++ ", " ++ ys

          xIsFor word =
            [head word] ++ " is for " ++ word
          
          removeNullWordsFrom xss =
            filter (not . null) xss
          -- If the initial list of words has some null entries in it,
          -- the output will have extra "and"s sprinkled throughout.
          -- removeNullWordsFrom fixes that by cleaning up the input.
