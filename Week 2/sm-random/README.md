# sm-random
This is a version of the starman (basically, hangman with asterisks instead of morbidity) example program from the third week of the University of Glasgow's Functional Programming in Haskell course. The original takes the word to be used from `stdin`. This version selects a word randomly from a dictionary instead.

It uses a simple text file dictionary taken from [https://github.com/dwyl/english-words](https://github.com/dwyl/english-words), which is stored in `resources/`.

## Running sm-random
`cd` to the sm-random folder, then:

``` sh
stack run
```
## Gameplay

```
-------------- **********
Enter your guess: 
a
---a---------- **********
Enter your guess: 
e
---a-------e-- **********
Enter your guess: 
i
-i-a-------e-- **********
Enter your guess: 
o
-i-a---o---e-- **********
Enter your guess: 
u
-i-a---ou--e-- **********
Enter your guess: 
l
-i-a---ou--e-- *********
Enter your guess: 
y
-i-a---ou--e-- ********
Enter your guess: 
d
di-a---ou--e-- ********
Enter your guess: 
n
di-a---ou-ne-- ********
Enter your guess: 
r
di-a--rou-ne-- ********
Enter your guess: 
t
di-a-trou-ne-- ********
Enter your guess: 
s
disastrousness ********
You win!
```

## Issues
Null guesses are currently not handled.
