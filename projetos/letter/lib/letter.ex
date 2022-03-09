defmodule Letter do
  @moduledoc """
  Documentação para o módulo `Letter`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Letter.hello()
      :world

      iex> Letter.hello("Elixir")
      "Hello, Elixir!"

  """
  def hello do
    :world
  end

  def hello(name) do
    "Hello, #{name}!"
  end

  def fatorial(0), do: 1
  def fatorial(n) when is_integer(n) and n > 0, do: n * fatorial(n - 1)
  def fatorial(_), do: "Erro!"

  def tail_fatorial(n), do: tail_fatorial(n, 1)
  defp tail_fatorial(0, x), do: x

  defp tail_fatorial(n, x) when is_integer(n) and n > 0 do
    tail_fatorial(n - 1, x * n)
  end
end
