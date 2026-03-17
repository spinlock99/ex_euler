defmodule Tree do
  @tree :erlang_term_storage

  def init(data) do
    if :ets.whereis(@tree) == :undefined do
      :ets.new(@tree, [:set, :public, :named_table])
    end
    :ets.delete_all_objects(:erlang_term_storage)
    load({0,0}, data)
  end

  def longest_path, do: longest_path({0,0})
  def longest_path(coordinates) do
    # Add the number to the longer of the left and right paths.
    {_, number} = :ets.lookup(@tree, coordinates) |> List.first()
    longest_sub_path = [left(coordinates), right(coordinates)]
                       |> Enum.map(&longest_path/1)
                       |> Enum.max
    number + longest_sub_path
  rescue _error in MatchError ->
    0
  end

  defp left({column, row}), do: {column, row + 1}
  defp right({column, row}), do: {column + 1, row + 1}

  defp load(_choordinates, data) when data == [], do: :end_of_data
  defp load({column, row}, data) when column > row, do: load({0, row + 1}, data)
  defp load({column, row}, data) do
    [number | remainder] = data
    :ets.insert(@tree, {{column, row}, number})
    load({column + 1, row}, remainder)
  end
end
