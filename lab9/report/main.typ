#set page(
  paper: "a4",
  margin: (x: 2cm, y: 3cm),
)
#set text(
  font: "New Computer Modern",
  size: 10pt
)

#import "@preview/codly:1.0.0": *
#import "@preview/codly-languages:0.1.1": *
#show: codly-init.with()

#codly(languages: codly-languages)

ФИО: Яровой Вадим \
ГР: 5140904/40102 \
Работа №9 "Функциональное программирование. Программа вычисления расстояния хэмминга для двоичных последовательностей." \

= Код
реализация на Elixir

```ex
defmodule Hamming do
  def hamming_distance(s1, s2) when byte_size(s1) == byte_size(s2) do
    s1
    |> String.to_charlist()
    |> Enum.zip(String.to_charlist(s2))
    |> Enum.count(fn {c1, c2} -> c1 != c2 end)
  end

  def hamming_distance(_, _) do
    raise "Длины двоичных последовательностей должны быть равны."
  end

  def show_differences(s1, s2) do
    differences =
      s1
      |> String.to_charlist()
      |> Enum.zip(String.to_charlist(s2))
      |> Enum.map(fn {c1, c2} -> if c1 != c2, do: '^', else: ' ' end)

    "Строки: #{s1}\n" <>
    "        #{s2}\n" <>
    "        #{List.to_string(differences)}\n"
  end
end

defmodule Main do
  def run do
    binary_s1 = "1011001001"
    binary_s2 = "1001110100"

    distance = Hamming.hamming_distance(binary_s1, binary_s2)
    IO.puts("Расстояние Хэмминга: #{distance}")
    IO.puts(Hamming.show_differences(binary_s1, binary_s2))
  end
end

Main.run()
```
#figure(
  image("image2.png"),
  caption: [Elixir]
)

также решил добавить реализацию на haskell для разнообразия

```hs
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
```
#figure(
  image("image.png"),
  caption: [Haskell]
)

= Вывод

```bash
Расстояние Хэмминга: 6
Строки: 1011001001
        1001110100
          ^ ^^^^ ^
```

