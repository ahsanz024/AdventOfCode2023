defmodule Day2 do
  @list_of_tuples [{:red, 12}, {:green, 13}, {:blue, 14}]

  def part1(input) do
    output = input
      |> Enum.map(&process_row_part1/1)
      |> Enum.sum()

      IO.puts "Day 2 Part 1 #{inspect(output)}"
      {:ok, output}
  end

  def part2(input) do
    output = input
      |> Enum.map(&process_row_part2/1)
      |> Enum.sum()

    IO.inspect(output, label: "Day 2 Part 2")
    {:ok, output}
  end

  defp process_row_part2(row) do
    trimmed_string = get_trimmed_string(row)

    @list_of_tuples
    |> Enum.map(fn {color, _} -> get_max_value_for_color(trimmed_string, color) end)
    |> Enum.reduce(1, fn x, acc -> x * acc end)
  end

  defp process_row_part1(row) do
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

  defp get_trimmed_string(string) do
    String.replace(string, ~r/(\s)|(\,)|(Game\s?\d+:)/, "")
  end

  defp color_values_possible?(string) do
    trimmed_string = get_trimmed_string(string)

    @list_of_tuples
    |> Enum.map(fn {color, value} -> is_value_over?(trimmed_string, color, value) end)
    |> Enum.any?(fn x -> x == true end)
  end

  defp is_value_over?(string, color, cond_value) do
    Regex.scan(~r/\d+(?=#{color})/, string)
    |> List.flatten()
    |> Enum.map(&String.to_integer/1)
    |> Enum.any?(fn x -> x > cond_value  end)
  end

  defp get_max_value_for_color(_ = "", _), do: 1
  defp get_max_value_for_color(string, color) do
    Regex.scan(~r/\d+(?=#{color})/, string)
    |> List.flatten()
    |> Enum.map(&String.to_integer/1)
    |> Enum.max()
  end
end
