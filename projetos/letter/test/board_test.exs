defmodule BoardTest do
  use ExUnit.Case

  test "Cria o tabuleiro com FESTA e compara com TORTA" do
    Board.new("FESTA")
    |> Board.guess("TORTA")
    |> assert_pattern_is(["-", "-", "-", "T", "A"])
    |> Board.guess("SEXTA")
    |> assert_pattern_is(["*", "E", "-", "T", "A"])
    |> Board.guess("BESTA")
    |> assert_pattern_is(["-", "E", "S", "T", "A"])
    |> Board.guess("FESTA")
    |> assert_pattern_is(["F", "E", "S", "T", "A"])
  end

  defp assert_pattern_is(board, expected_pattern) do
    assert Board.get_pattern(board) == expected_pattern
    board
  end
end
