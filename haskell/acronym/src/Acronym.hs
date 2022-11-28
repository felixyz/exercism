module Acronym (abbreviate) where

import Data.Char

abbreviate :: String -> String
abbreviate = map toUpper . fst . foldl select ("", ' ')
  where
    select (s, p) c =
      if keep p c
        then (s ++ [c], c)
        else (s, c)

keep :: Char -> Char -> Bool
keep p c =
  isLetter c
    && ( isSpace p
           || p == '-'
           || p == '_'
           || isLower p && isUpper c
       )
