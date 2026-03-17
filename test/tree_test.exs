defmodule TreeTest do
  use ExUnit.Case, async: true
  use Repatch.ExUnit
  import Repatch, only: [private: 1]

  setup_all do
    Repatch.spy(Tree)
  end

  describe "init" do
    test "pulls the data into a tree" do
      tree = Tree.init([3, 7, 4, 2, 4, 6, 8, 5, 9, 3])
      assert tree == :end_of_data
    end
  end

  describe "load" do
    test "loads data into erlang term storage" do
      :ets.new(:erlang_term_storage, [:set, :public, :named_table])
      private Tree.load({0,0}, [3, 7, 4, 2, 4, 6, 8, 5, 9, 3])
      {_coordinates, first} = :ets.lookup(:erlang_term_storage, {0,0})
                              |> List.first()
      {_coordinates, last} = :ets.lookup(:erlang_term_storage, {3,3})
                             |> List.first()
      assert first == 3
      assert last == 3
    end

    test "signals when the data is empty" do
      signal = private Tree.load({0,0}, [])
      assert signal == :end_of_data
    end
  end

  describe "left" do
    test "gets the coordinates of the left tree" do
      left = private Tree.left({1,1})
      assert left == {1, 2}
    end
  end

  describe "longest_path" do
    test "is zero when out of bounds" do
      Tree.init([3, 7, 4, 2, 4, 6, 8, 5, 9, 3])
      assert Tree.longest_path({1,0}) == 0
    end

    test "finds the length of the longest path" do
      Tree.init([3, 7, 4, 2, 4, 6, 8, 5, 9, 3])
      assert Tree.longest_path() == 23
    end
  end
end
