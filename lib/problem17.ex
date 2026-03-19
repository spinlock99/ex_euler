defmodule Problem17 do
  def to_words(1), do: "one"
  def to_words(2), do: "two"
  def to_words(integer) do
    Integer.digits(integer)
  end

end
