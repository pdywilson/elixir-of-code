defmodule Modl do
  def increasing?([]), do: true
  def increasing?([_]), do: true

  def increasing?([a, b | rest]) when a < b and b - a <= 3  do
    increasing?([b | rest])
  end

  def increasing?(_), do: false

  def decreasing?([]), do: true
  def decreasing?([_]), do: true

  def decreasing?([a, b | rest]) when a > b and a - b <= 3 do
    decreasing?([b | rest])
  end

  def decreasing?(_), do: false
end


{:ok, contents} = File.read("input.txt")

lines = contents
  |> String.split("\n", trim: true)
  |> Enum.map(fn line ->
    line
    |> String.split(" ")
    |> Enum.map(fn str -> String.to_integer(str) end)
  end)
  |> Enum.filter(fn line -> Modl.increasing?(line) or Modl.decreasing?(line) end)
  |> Enum.count()



IO.inspect(lines, charlists: :as_lists)



