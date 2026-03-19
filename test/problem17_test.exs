defmodule Problem17Test do
  use ExUnit.Case
  doctest Problem17

  test "1234" do
    assert Problem17.to_words(1234) == [1,2,3,4]
    assert Problem17.to_words(1) == "one"
  end
end
