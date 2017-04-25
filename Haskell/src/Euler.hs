module Euler where


import Data.List
import Data.Numbers.Primes
import Data.Char
import Data.Maybe
import System.IO

help :: IO ()
help = putStrLn "USAGE: import Euler and call problemX to run the solver"


-- problem 8 ------------------------------------------------------------------
problem8 :: Int
problem8 = findLargestProductOfN 0 13 numList

-- yeah...
numString :: String
numString = "7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450"

numList :: [Int]
numList = map digitToInt numString

mulFromList :: Int -> [Int] -> Int
mulFromList n list = foldl (*) 1 $ take n list

findLargestProductOfN :: Int -> Int -> [Int] -> Int
findLargestProductOfN currentProduct n list
  | length list < n = currentProduct
  | currentProduct <  nextProduct = findLargestProductOfN nextProduct    n (tail list)
  | currentProduct == nextProduct = findLargestProductOfN nextProduct    n (tail list)
  | currentProduct >  nextProduct = findLargestProductOfN currentProduct n (tail list)
  where nextProduct = mulFromList n list

-- Problem 9 -------------------------------------------------------------------
-- brute force attempt - takes about ~10 seconds on my machine
-- can be refactored a bit to optamize the odds and ends
problem9 :: Int
problem9 = pythagoreanTriplet 498 499 500
  where pythagoreanTriplet :: Int -> Int -> Int -> Int
        pythagoreanTriplet a b c
          | ((a ^ 2) + (b ^ 2) == (c ^ 2)) && (a + b + c == 1000) = a * b * c
          | c == 0 = error "Something went wrong"
          | b == 0 = pythagoreanTriplet (c - 3) (c - 2) (c - 1)
          | a == 0 = pythagoreanTriplet (b - 2) (b - 1) (c)
          | otherwise = pythagoreanTriplet (a - 1) b c



-- Problem 10 - done horribly inefficiently ------------------------------------
-- the Data.Numbers.Primes library provides a much faster
-- way to compute primes
generatePrimes :: Integer -> [Integer]
generatePrimes n = sieve [2..n]
  where sieve (x:xs)
          | x < (div n 2) = x : sieve (xs \\ [x, x+x..n])
          | x > (div n 2) = x : xs
          | otherwise = []

-- problem 12 ------------------------------------------------------------------
problem12 :: Int
problem12 = calculate 1
  where calculate n
          | length (divisors (triangle)) >= 500 = triangle
          | otherwise = calculate (n + 1)
          where triangle = nthTriangleNum n

nthTriangleNum :: Int -> Int
nthTriangleNum n = sum [1..n]

divisors :: Int -> [Int]
divisors n = calculateDivisors n (floor (sqrt (fromIntegral n))) 1 []
  where calculateDivisors :: Int -> Int -> Int -> [Int] -> [Int]
        calculateDivisors n limit i list
          | i > limit = list
          | (mod n i == 0) && (i /= (div n i)) = (calculateDivisors n limit (i + 1) (i:(div n 1):list ))
          | mod n i == 0 = (calculateDivisors n limit (i + 1) (i:list))
          | otherwise = calculateDivisors n limit (i + 1) list

-- Problem 13 ------------------------------------------------------------------
problem13 :: IO Integer
problem13 = do
  content <- readFile "src/problem13.txt"
  let linesOfFile = lines content
  let nums = map (read) linesOfFile :: [Integer]
  return $ sum nums


-- problem 14 ------------------------------------------------------------------
problem14 :: Int
problem14 = [1..1000000] !! fromJust (elemIndex (last $ sort $ collatzLengths) collatzLengths)
  where collatzLengths = map (length . collatz) [1..1000000]

collatz :: Int -> [Int]
collatz n = collatz' n [n]
  where collatz' :: Int -> [Int] -> [Int]
        collatz' n list
          | n == 1 = list
          | n `mod` 2 == 0 = collatz' (div n 2) $ (div n 2):list
          | otherwise = collatz' (3 * n + 1) $ (3 * n + 1):list

-- problem 16 ------------------------------------------------------------------
problem16 :: Int
problem16 = sum $ map digitToInt $ show (2 ^ 1000)

-- problem 20 ------------------------------------------------------------------
problem20 :: Int
problem20 = sum $ map digitToInt $ show $ factorial 100

-- problem 21 ------------------------------------------------------------------

problem21 = tusum 0 [(x, y) | x <- [1..9999], y <- [x..9999], (d x) == y && (d y) == x && x /= y]
  where d n = sum $ properDivisors n
        tusum :: Int -> [(Int, Int)] -> Int
        tusum sum list
          | list == [] = sum
          | otherwise = tusum (sum + (fst listhead) + (snd listhead)) $ tail list
            where listhead = (head list)

properDivisors n = [x | x <- [1..(div n 2)], n `mod` x == 0]

-- problem 34 ------------------------------------------------------------------
problem34 :: Int
problem34 = sum $ filter factSumEqNum [3..100000]

factSumEqNum :: Int -> Bool
factSumEqNum a = (==) a (sum $ map factorial (stringToIntList $ show a))

stringToIntList :: String -> [Int]
stringToIntList s = map digitToInt s

factorial :: (Num a, Eq a) => a -> a
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)

-- problem 40 ------------------------------------------------------------------
problem40 :: Int
problem40 = digitToInt (x !! 0) *
            digitToInt (x !! 9) *
            digitToInt (x !! 99) *
            digitToInt (x !! 999) *
            digitToInt (x !! 9999) *
            digitToInt (x !! 99999) *
            digitToInt (x !! 999999)
  where x = irrationalList

-- TODO: Work out a better solution for generating this list
irrationalList :: [Char]
irrationalList = concat $ map show [1..1000000]

-- Problem 97 ------------------------------------------------------------------
problem97 = read $ reverse $ take 10 $ reverse $ show $ 28433 * (2 ^ 7830457) + 1 :: Int
