defmodule Letter do
  @moduledoc """
  Documentação para o módulo `Letter`.
  """

  @word_of_the_day "TOUCA"

  def guess(user_guess) do
    user_guess == @word_of_the_day
  end

end
