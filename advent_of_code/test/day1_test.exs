defmodule Day1Test do
  use ExUnit.Case

  import Day1

  describe "extract_digits/1" do
    test "extracts digits from a string" do
      assert extract_numeric_digits("abc123def") == 13
    end

    test "returns a zero for a string with no digits" do
      assert extract_numeric_digits("abcdef") == 0
    end

    test "returns same digits twice for a single digit" do
      assert extract_numeric_digits("abc3asdf") == 33
    end
  end

  describe "extract textual digits/1" do
    test "extract all 9 textual digits" do
      assert extract_alphanumeric_digits("asdfone") == 11
      assert extract_alphanumeric_digits("asdftwo") == 22
      assert extract_alphanumeric_digits("asdfthree") == 33
      assert extract_alphanumeric_digits("asdffour") ==  44
      assert extract_alphanumeric_digits("asdffive") == 55
      assert extract_alphanumeric_digits("asdfsix") == 66
      assert extract_alphanumeric_digits("asdfseven") ==  77
      assert extract_alphanumeric_digits("asdfeight") == 88
      assert extract_alphanumeric_digits("asdfnine") == 99
    end
  end
end
