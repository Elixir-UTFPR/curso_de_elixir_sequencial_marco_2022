defmodule Letter do
  @moduledoc """
  Documentação para o módulo `Letter`.
  """

  @word_of_the_day "TOUCA"
  @words ["FESTA", "TOUCA", "CAUSA", "PAUSA", "RESTO"]

  def guess(user_guess) do
    user_guess == @word_of_the_day
  end

  def choose_random_word() do
    Enum.random(@words)
  end

  def compare_word_to_guess(word, guess) do
    String.codepoints(word)
    |> Enum.zip(String.codepoints(guess))
  end

  def check_if_is_same_letter({letter, letter}) do
    letter
  end

  def check_if_is_same_letter({_, _}) do
    "_"
  end
end
