defmodule LetterTest do
  use ExUnit.Case
  doctest Letter

  test "greets the world" do
    assert Letter.hello() == :world
  end
end
