defmodule LetterTest do
  use ExUnit.Case

  describe "Verifica se uma palavra é a palavra escolhida" do
   test "Verifica se TOUCA é a palavra do dia (e é)" do
    assert Letter.guess("TOUCA")
   end
   test "Verifica se FESTA é a palavra do dia (não é)" do
    refute Letter.guess("FESTA")
   end

   test "Joga um jogo" do
      Letter.choose_random_word() |>
      Letter.automated_guess("FESTA") |>
      Letter.automated_guess("TORTA")

   end
  end
end
