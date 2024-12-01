defmodule Modl do
  def makeSortedIntList(lines) do
    Enum.map(lines, fn string -> String.to_integer(string) end)
    |> Enum.sort()
  end
end


{:ok, contents} = File.read("input.txt")

splitted = contents |> String.split("\n")
lines = Enum.slice(splitted, 0, length(splitted) - 1)
left = Enum.map(lines, fn string -> String.split(string, "   ", parts: 2)
  |> List.first() end)
  |> Modl.makeSortedIntList()
right = Enum.map(lines, fn string -> String.split(string, "   ", parts: 2)
  |> List.last() end)
  |> Modl.makeSortedIntList()

result = Enum.zip(left, right) 
  |> Enum.map(fn {a, b} -> abs(a - b) end)
  |> Enum.sum()
IO.inspect(result)
