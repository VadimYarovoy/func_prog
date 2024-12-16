module Main where

hammingDistance :: String -> String -> Int
hammingDistance s1 s2
    | length s1 /= length s2 =
        error "Длины двоичных последовательностей должны быть равны."
    | otherwise =
        let differences = zipWith (/=) s1 s2
            resList = filter (== True) differences
            res = length resList
        in res

showDifferences :: String -> String -> String
showDifferences s1 s2 =
    let differences = zipWith (\c1 c2 -> if c1 /= c2 then '^' else ' ') s1 s2
    in "Строки: " ++ s1 ++ "\n" ++
       "        " ++ s2 ++ "\n" ++
       "        " ++ differences ++ "\n"

main :: IO ()
main = do
    let binaryS1 = "1011001001"
    let binaryS2 = "1001110100"
    let distance = hammingDistance binaryS1 binaryS2
    putStrLn ("Расстояние Хэмминга: " ++ show distance)
    putStrLn (showDifferences binaryS1 binaryS2)
