defmodule Day2 do
  import Helper

  # @input_file "inputs/test.txt"
  @input_file "inputs/day2.txt"
  @list_of_tuples [{:red, 12}, {:green, 13}, {:blue, 14}]

  def part1(input) do
    output = input
      |> Enum.map(&process_row/1)
      |> Enum.sum()

      IO.puts "Day 2 Part 1 #{inspect(output)}"
      {:ok, output}
  end

  def part2 do
    IO.puts "Day 2 Part 2"
  end

  defp process_row(row) do
    cond do
      color_values_possible?(row) == false -> extract_game_numbers(row)
      true -> 0
    end
  end

  defp extract_game_numbers(string) do
    Regex.scan(~r/Game (\d+):/, string)
    |> List.flatten()
    |> List.last()
    |> String.to_integer()
  end

  defp color_values_possible?(string) do
    trimmed_string = String.replace(string, ~r/(\s)|(\,)|(Game\s?\d+:)/, "")

    @list_of_tuples
    |> Enum.map(fn {color, value} -> is_value_over?(trimmed_string, color, value) end)
    |> Enum.any?(fn x -> x == true end)
  end

  defp is_value_over?(string = "", _, _), do: 0
  defp is_value_over?(string, color, cond_value) do
    Regex.scan(~r/\d+(?=#{color})/, string)
    |> List.flatten()
    |> Enum.map(&String.to_integer/1)
    |> Enum.any?(fn x -> x > cond_value  end)
  end
end
