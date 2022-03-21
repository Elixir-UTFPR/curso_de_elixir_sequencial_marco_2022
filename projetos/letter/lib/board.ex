defmodule Board do
  defstruct [:available_letters, :word, :current_pattern, :latest_guess]

  @notfound "-"
  @found "+"
  # @type t :: %__MODULE__{

  #   word: String.t(),
  #   latest_guess: String.t(),
  #   available_letters: [String.t()]}

  # @spec new(String.t()) :: Board.t()
  def new(word) when is_bitstring(word) do
    %__MODULE__{word: word, available_letters: all_letters(), current_pattern: "-----"}
  end

  defp all_letters() do
    MapSet.new(?A..?Z)
  end

  def guess(board, guess) do
    %__MODULE__{
      board
      | latest_guess: guess
    }
    |> first_pass()
    |> second_pass()
  end

  defp first_pass(board) do
    %__MODULE__{
      board
      | current_pattern:
          first_match(
            String.codepoints(board.word),
            String.codepoints(board.latest_guess),
            []
          )
    }
  end

  defp first_match([], _, result) do
    result
    |> Enum.reverse()
    |> Enum.join()
  end

  defp first_match([head | tail], [head | g_tail], result) do
    first_match(tail, g_tail, [head | result])
  end

  defp first_match([_ | tail], [_ | g_tail], result) do
    first_match(tail, g_tail, ["-" | result])
  end

  defp second_pass(board) do
    new_pattern =
      second_match(
        String.codepoints(board.current_pattern),
        String.codepoints(board.latest_guess),
        String.codepoints(board.word)
      )

    %__MODULE__{
      board
      | current_pattern: new_pattern
    }
  end

  defp second_match(pattern, guess, word) do
    rwl = remaining_word_letters(pattern, word)

    rgl = remaining_guess_letters_with_position(pattern, guess)

    second_match(pattern, rwl, rgl, [])
  end

  # defp second_match(old_pattern, remaining_word_letters, remaining_guess_letters_with_position, result) do
  defp second_match(_, _, [], result) do
    Enum.reverse(result)
  end

  defp second_match([h_patt | t_patt], remaining_word_letters, [g_head | g_tail], result) do
    cond do
      g_head in remaining_word_letters ->
        second_match(
          t_patt,
          remaining_word_letters -- [g_head],
          g_tail,
          ["*" | result]
        )

      true ->
        second_match(
          t_patt,
          remaining_word_letters,
          g_tail,
          [h_patt | result]
        )
    end
  end

  defp remaining_word_letters(pattern, word) do
    word -- pattern
  end

  defp remaining_guess_letters_with_position(pattern, guess) do
    remaining_guess_letters_with_position(pattern, guess, [])
  end

  defp remaining_guess_letters_with_position([], _guess, result) do
    Enum.reverse(result)
  end

  defp remaining_guess_letters_with_position([@notfound | tail], [head | g_tail], result) do
    remaining_guess_letters_with_position(tail, g_tail, [head | result])
  end

  defp remaining_guess_letters_with_position([_ | tail], [_ | g_tail], result) do
    remaining_guess_letters_with_position(tail, g_tail, [@found | result])
  end

  def get_pattern(board) do
    board.current_pattern
  end
end
