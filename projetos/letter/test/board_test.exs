defmodule BoardTest do
  use ExUnit.Case

  test "Cria o tabuleiro com FESTA e compara com TORTA" do
    Board.new("FESTA")
    |> assert_word_is("FESTA")
    |> Board.guess("TORTA")
    |> assert_pattern_is(["-", "-", "-", "T", "A"])
    |> Board.guess("SEXTA")
    |> assert_pattern_is(["*", "E", "-", "T", "A"])
    |> Board.guess("BESTA")
    |> assert_pattern_is(["-", "E", "S", "T", "A"])
    |> Board.guess("FESTA")
    |> assert_pattern_is(["F", "E", "S", "T", "A"])
    |> assert_winner_guess()
  end

  defp assert_pattern_is(board, expected_pattern) do
    assert Board.get_pattern(board) == expected_pattern
    board
  end

  defp assert_word_is(board, expected_word) do
    assert Board.get_word(board) == expected_word
    board
  end

  defp assert_winner_guess(board) do
    pattern_as_string =
      board
      |> Board.get_pattern()
      |> Enum.join()

    assert Board.get_word(board) == pattern_as_string
    board
  end
end
