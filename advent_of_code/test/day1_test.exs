defmodule Day1Test do
  use ExUnit.Case

  import Day1

  describe "extract_digits/1" do
    test "extracts digits from a string" do
      assert extract_digits("abc123def") == 13
    end

    test "returns a zero for a string with no digits" do
      assert extract_digits("abcdef") == 0
    end

    test "returns same digits twice for a single digit" do
      assert extract_digits("abc3asdf") == 33
    end
  end
end
