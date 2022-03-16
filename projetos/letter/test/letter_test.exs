defmodule LetterTest do
  use ExUnit.Case

  describe "Verifica se uma palavra é a palavra escolhida" do
    test "Verifica se TOUCA é a palavra do dia (e é)" do
      assert Letter.is_guess_equal_to_word("TOUCA")
    end

    test "Verifica se FESTA é a palavra do dia (não é)" do
      refute Letter.is_guess_equal_to_word("FESTA")
    end

    #  test "Joga um jogo" do
    #     Letter.choose_random_word() |>
    #     Letter.automated_guess("FESTA") |>
    #     Letter.automated_guess("TORTA")
    #  end

    # test "Compara palavra FESTA ao chute EPOCA" do
    #   assert Letter.compare_word_to_guess("FESTA","EPOCA") == {"e___A", "POC"}
    # end

    test "Compara palavra FESTA ao chute TORTA" do
      assert Letter.compare_word_to_guess("FESTA", "TORTA") ==
               {"---TA", MapSet.new(["T", "O", "R"])}
    end
  end

  describe "Verifica se uma rodada do jogo chegou à solução" do
    # palavra do dia: FESTA
    # chute:          TORTA -> ---TA    T, O, R
    # chute:          SEXTA -> *E-TA    T, O, R, X
    # chute:          BESTA -> -ESTA    T, O, R, X, B
    # chute:          FESTA -> FESTA    igual

    test "Executa o fluxo de FESTA com chutes TORTA, SEXTA, BESTA, FESTA" do
      Letter.new("FESTA")
      |> assertNoGuess()
      |> Letter.guess("TORTA")
      |> assertGuess("TORTA")
      |> assertPartialResult("---TA")
      |> assertNonusedLetters(MapSet.new(["T", "O", "R"]))

      # |> Letter.guess("SEXTA")
      # |> assertGuess("SEXTA")
      # |> assertPartialResult("*E-TA")
      # |> assertNonusedLetters(MapSet.new(["T", "O", "R", "X"]))

      # |> Letter.guess("BESTA")
      # |> Letter.guess("FESTA")
    end
  end

  def assertNoGuess(letter_game = {_, guess, _}) do
    assert guess == ""
    letter_game
  end

  def assertGuess(letter_game = {_, guess_game, _}, guess) do
    assert guess_game == guess
    letter_game
  end

  def assertPartialResult(letter_game = {_, _, {partial_result, _}}, pr_test) do
    assert partial_result == pr_test
    letter_game
  end

  def assertPartialResult(letter_game, _) do
    refute true
    letter_game
  end

  def assertNonusedLetters(letter_game = {_, _, {_, non_used_letters}}, nul_test) do
    assert non_used_letters == nul_test
    letter_game
  end

  def assertNonusedLetters(letter_game, _) do
    refute true
    letter_game
  end
end
