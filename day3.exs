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

regex = ~r/mul\([0-9]*,[0-9]*\)/
matches = Regex.scan(regex, contents)

result = Enum.map(matches, fn list -> hd(list) end)
r2 = Enum.map(result, fn string -> String.split(string, ",") end)
r3 = Enum.map(r2, fn elt ->
  [first, second] = elt
  [_, f1] = String.split(first, "(")
  [s1, _] = String.split(second, ")")
  f2 = String.to_integer(f1)
  s2 = String.to_integer(s1)
  f2 * s2
end)
IO.inspect(r3, charlists: :as_lists)
r4 = Enum.sum(r3)
IO.inspect(r4)



