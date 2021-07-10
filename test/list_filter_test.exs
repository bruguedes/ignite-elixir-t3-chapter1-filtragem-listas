defmodule ListFilterTest do
  use ExUnit.Case

  alias ListFilter

  describe "call/1" do
    test "sucess when valid list" do
      list1 = ["1", "3", "6", "43", "banana", "6", "abc"]
      list2 = ["1", "2", "3", "4", "5", "6", "11", "7abc", "8def"]
      list3 = ["12", "2", "34", "67", "banana", "99", "abc"]
      list4 = ["banana", "manga", "abc"]

      assert ListFilter.call(list1) == 3
      assert ListFilter.call(list2) == 4
      assert ListFilter.call(list3) == 2
      assert ListFilter.call(list4) == "There are no numbers in this list"
    end

    test "passing an empty list" do
      list = []

      assert ListFilter.call(list) == {:error, "empty list "}
    end

    test "parameter is not a list" do
      list = "Bruno"

      assert ListFilter.call(list) == {:error, "not is list "}
    end
  end
end
