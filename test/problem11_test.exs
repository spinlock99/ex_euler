defmodule Problem11Test do
  use ExUnit.Case, async: true
  use Repatch.ExUnit
  import Repatch, only: [private: 1]

  doctest Problem11

  setup_all do
    Repatch.spy(Problem11)
    private Problem11.init()
  end

  describe "solution" do
    test "reads the data" do
      assert Problem11.solution() == 70_600_674
    end
  end

  describe "init" do
    test "stores the data in ets" do
      {_, number} = :ets.lookup(:memo, {8,6})
                    |> List.first()
      assert number == 26
    end
  end

  describe "largest" do
    test "returns the max" do
      max = private Problem11.largest({:"$end_of_table", 10})
      assert max == 10
    end

    test "works with keys" do
      max = private Problem11.largest({:ets.first(:memo),0})
      assert max == 70_600_674
    end
  end

  describe "right" do
    test "multiplies 4 numbers to the right" do
      right = private Problem11.right({0,0})
      assert right == 34_144
    end

    test "multiplies 4 numbers to the right starting at 16" do
      right = private Problem11.right({16,0})
      assert right == 2_802_800
    end

    test "returns zero if there aren't 4 numbers to the right" do
      right = private Problem11.right({17,0})
      assert right == 0
    end
  end

  describe "diagonal" do
    test "returns zero if x is out of bounds" do
      product = private Problem11.right_diagonal({18,0})
      assert product == 0
    end

    test "returns zero if y is out of bounds" do
      product = private Problem11.right_diagonal({0,18})
      assert product == 0
    end

    test "returns product of 4 diagonal numbers" do
      product = private Problem11.right_diagonal({8,6})
      assert product == 1_788_696
    end
  end

  describe "down" do
    test "it returns zero if there aren't 4 numbers down" do
      down = private Problem11.down({0,18})
      assert down == 0
    end

    test "multiplies 4 numbers down" do
      down = private Problem11.down({0,0})
      assert down == 1_651_104
    end
  end
end
