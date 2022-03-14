defmodule LetterTest do
  use ExUnit.Case

  describe "Verifica se uma palavra é a palavra escolhida" do
    test "Verifica se TOUCA é a palavra do dia (e é)" do
      assert Letter.guess("TOUCA")
    end

    test "Verifica se FESTA é a palavra do dia (não é)" do
      refute Letter.guess("FESTA")
    end

    #  test "Joga um jogo" do
    #     Letter.choose_random_word() |>
    #     Letter.automated_guess("FESTA") |>
    #     Letter.automated_guess("TORTA")
    #  end

    # test "Compara palavra FESTA ao chute EPOCA" do
    #   assert Letter.compare_word_to_guess("FESTA","EPOCA") == {"e___A", "POC"}
    # end

    test "Duas letras no mesmo lugar" do
      assert Letter.check_if_is_same_letter({"A", "A"}) == "A"
    end

    test "Letras diferentes" do
      assert Letter.check_if_is_same_letter({"A", "B"}) == "_"
    end

    #  test "Compara palavra FESTA ao chute TORTA" do
    #    assert Letter.compare_word_to_guess("FESTA","TORTA") == {"___TA", "TOR"}
    #  end
  end
end
