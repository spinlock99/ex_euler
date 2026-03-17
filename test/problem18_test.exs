defmodule Problem18Test do
  use ExUnit.Case, async: true
  use Repatch.ExUnit

  describe "Problem18.solution" do
    test "it greats the world" do
      assert Problem18.solution() == 1074
    end
  end
end
