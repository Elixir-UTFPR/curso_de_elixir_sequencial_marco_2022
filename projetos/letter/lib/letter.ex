defmodule Letter do
  @moduledoc """
  Documentação para o módulo `Letter`.
  """

  @word_of_the_day "TOUCA"
  @words ["FESTA", "TOUCA", "CAUSA", "PAUSA", "RESTO"]
  @no_match_char "-"
  @dif_position_char "*"

  def no_match_char() do
    @no_match_char
  end

  def dif_position_char() do
    @dif_position_char
  end

  def is_guess_equal_to_word(user_guess) do
    user_guess == @word_of_the_day
  end

  def choose_random_word() do
    Enum.random(@words)
  end

  def compare_word_to_guess(word, guess) do
    match = matches_each_character(word, guess)

    {
      match,
      find_non_used_letters(match, guess)
    }
  end

  defp find_non_used_letters(match, guess) do
    match_chars = String.codepoints(match) |> Enum.reject(fn char -> char == @no_match_char end)
    guess_chars = String.codepoints(guess)

    (guess_chars -- match_chars)
    |> MapSet.new()
  end

  defp matches_each_character(word, guess) do
    word_chars = String.codepoints(word)
    guess_chars = String.codepoints(guess)

    Enum.zip(word_chars, guess_chars)
    |> compare_word_to_guess_letter_to_letter([], word)
    |> remove_repeated_matches(0, word, guess)
  end

  defp remove_repeated_matches(result, index, word, guess) do
    # zip = Enum.zip(1..5, String.codepoints(result))
    # result_map = Map.new(zip)

    # Map.keys(result_map)
    # 1 => *
    # 2 => -
    # 3 => -
    # 4 => T
    # 5 => A
    # FESTA
    # TORTA

    maybe_dif_position = String.at(result, index)

    if maybe_dif_position != @dif_position_char do
      remove_repeated_matches(result, index + 1, word, guess)
    else
      guess_char = String.at(guess, index)

      # Encontrar as posições onde guess_char aparece em guess
      # exceto em index
      # Verificar se nestas posições guess_char está também em word.
      # Se isso acontece, trocar o * por -
    end

    "---TA"
  end

  defp compare_word_to_guess_letter_to_letter([], result, _word) do
    result
    |> Enum.reverse()
    |> Enum.join()
  end

  defp compare_word_to_guess_letter_to_letter([{word_letter, guess_letter} | tail], result, word) do
    compare_word_to_guess_letter_to_letter(
      tail,
      [same_letter(word_letter, guess_letter, word) | result],
      word
    )
  end

  defp same_letter(letter, letter, _word) do
    letter
  end

  defp same_letter(_word_letter, guess_letter, word) do
    if String.contains?(word, guess_letter) do
      @dif_position_char
    else
      @no_match_char
    end
  end

  def new(word) do
    {word, "", MapSet.new()}
  end

  def guess({word, _previousguess, _letters}, guess) do
    {word, guess, compare_word_to_guess(word, guess)}
  end
end
