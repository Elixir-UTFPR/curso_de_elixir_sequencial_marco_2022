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
end
