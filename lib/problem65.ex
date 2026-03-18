defmodule Problem65 do
  def root_two(position) do
    {numerator, denominator} = root_two_fraction(position)
    {denominator + numerator, denominator}
  end

  def root_two_fraction(2), do: {1, 2}
  def root_two_fraction(position) do
    {numerator, denominator} = root_two_fraction(position - 1)
    {denominator, 2 * denominator + numerator}
  end

  def eulers_number(1), do: 2
  def eulers_number(position) do
    {numerator, denominator} = eulers_number_fraction(position)
    {numerator + 2 * denominator, denominator}
  end

  def eulers_number_fraction(2), do: {1, 1}
  def eulers_number_fraction(position) do
    IO.puts "\nposition: #{position}"
    factor = if rem(position, 3) == 0 do
      2 * div(position, 3)
    else
      1
    end
    IO.puts "factor: #{factor}"
    {numerator, denominator} = eulers_number_fraction(position - 1)
    IO.puts "numerator: #{numerator}"
    IO.puts "\ndenominator: #{denominator}"
    {denominator, factor * denominator + numerator}
  end
end
