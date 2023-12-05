defmodule Helper do
  def read_lines_from_file(input_file) do
    case File.read(input_file) do
      {:ok, input} ->
        input|> String.split("\n")
      {:error, reason} -> "Error reading file: #{reason}"
    end
  end

  def write_to_file(filename, data) do
    case File.write(filename, data) do
      :ok ->
        IO.puts("File written successfully")
      {:error, reason} -> IO.puts("Error writing file: #{reason}")
    end
  end
end
