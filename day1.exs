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

defmodule Similarity do
  def calculate_sim_score(left, right) do
    Enum.reduce(0..length(left) - 1, 0, fn i, simScore ->
      x = Enum.reduce(0..length(right) - 1, 0, fn j, acc ->
        if Enum.at(left, i) == Enum.at(right, j) do
          acc + 1
        else
          acc
        end
      end)
      y = x * Enum.at(left, i)
      simScore + y
    end)
  end
end

simScore = Similarity.calculate_sim_score(left, right)

IO.inspect(simScore)










