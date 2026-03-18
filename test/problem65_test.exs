defmodule Problem65Test do
  use ExUnit.Case, async: true

  doctest Problem65

  describe "root_two" do
    test "computes the nth element in the convergent sequence" do
      assert Problem65.root_two(2) == {3, 2}
      assert Problem65.root_two(3) == {7, 5}
      assert Problem65.root_two(4) == {17, 12}
      assert Problem65.root_two(5) == {41, 29}
      assert Problem65.root_two(10) == {3363, 2378}
    end
  end

  describe "root_two_fraction" do
    test "computes the first convergent term" do
      assert Problem65.root_two_fraction(2) == {1, 2}
      assert Problem65.root_two_fraction(3) == {2, 5}
#      assert Problem65.root_two_fraction(4) == {5, 12}
#      assert Problem65.root_two_fraction(5) == {12, 29}
    end
  end

  describe "euler's number" do
    test "2 is the first number in the sequence" do
      assert Problem65.eulers_number(1) == 2
      assert Problem65.eulers_number(2) == {3, 1}
    end
  end

  describe "euler's number fraction" do
    test "is different for multiples of 3" do
      assert Problem65.eulers_number_fraction(3) == {2, 3}
      assert Problem65.eulers_number_fraction(4) == {3, 4}
    end
  end
end
