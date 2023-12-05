defmodule Day1 do
  import Helper

  @input_file "inputs/day1.txt"

  # Part 1
  def part1 do
    output = read_lines_from_file(@input_file)
    |> Enum.map(&extract_numeric_digits/1)
    |> Enum.sum()

    IO.puts(inspect(output))
  end


  # Part 2
  def part2 do
    output = read_lines_from_file(@input_file)
    |> Enum.map(&extract_alphanumeric_digits/1)
    |> List.flatten()
    |> Enum.sum()

    IO.puts(inspect(output))
  end


  def extract_numeric_digits(string) do
    all_numbers = Regex.scan(~r/\d/, string)
    |> List.flatten()
    |> Enum.map(&String.to_integer/1)

    get_final_digits(all_numbers)
  end


  def extract_alphanumeric_digits(string) do
    regex = ~r/(?=(\d)|(one)|(two)|(three)|(four)|(five)|(six)|(seven)|(eight)|(nine))/i

    string
    |> String.downcase()
    |> (&Regex.scan(regex, &1)).()
    |> List.flatten()
    |> Enum.filter(fn x -> x != "" end)
    |> Enum.map(&convert_to_digit/1)
    |> get_final_digits()
  end

  defp get_final_digits([]), do: 0
  defp get_final_digits(list) do
    [head | _] = list
    last_element = Enum.at(list, length(list) - 1, head)
    "#{head}" <> "#{last_element}"
      |> String.to_integer()
  end

  defp convert_to_digit(string) do
    case Integer.parse(string) do
      {value, _} ->
        value
      :error ->
        digit_words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
        digit_words
          |> Enum.find_index(fn x -> x == string end)
          |> Kernel.then(fn x -> x + 1 end)
    end
  end
end
