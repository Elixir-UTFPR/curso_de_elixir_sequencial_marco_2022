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

  describe "Testes sobre Fatorial" do
    test "o fatorial de 1 é 1"  do
      assert Letter.fatorial(1) == 1
    end
    test "o fatorial de 2 é 2"  do
      assert Letter.fatorial(2) == 2
    end
    test "o fatorial de 3 é 6"  do
      assert Letter.fatorial(3) == 6
    end
  end
end
