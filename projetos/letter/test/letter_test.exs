defmodule LetterTest do
  use ExUnit.Case
  doctest Letter

  test "cumprimenta o mundo" do
    assert Letter.hello() == :world
  end

  test "cumprimenta uma pessoa específica" do
    assert Letter.hello("Adolfo") == "Hello, Adolfo!"
    assert Letter.hello("Maria") == "Hello, Maria!"
  end
end
