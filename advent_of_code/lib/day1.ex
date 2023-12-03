defmodule Day1 do
  def part1 do
    case File.read("inputs/day1.txt") do
      {:ok, input} -> input
      {:error, reason} -> "Error reading file: #{reason}"
    end
    |> String.split("\n")
    |> Enum.map(&extract_digits/1)
    |> Enum.sum()


  end

  def extract_digits(string) do
    all_numbers = Regex.scan(~r/\d/, string)
    |> List.flatten()
    |> Enum.map(&String.to_integer/1)

    get_digits(all_numbers)
  end

  defp get_digits([]), do: 0
  defp get_digits(list) do
    [head | _] = list
    last_element = Enum.at(list, length(list) - 1, head)
    "#{head}" <> "#{last_element}"
      |> String.to_integer()
  end
end
