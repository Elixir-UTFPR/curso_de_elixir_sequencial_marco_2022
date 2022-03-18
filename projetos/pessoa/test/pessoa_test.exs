defmodule PessoaTest do
  use ExUnit.Case
  doctest Pessoa

  test "cria uma pessoa com nome João e idade 13" do
    assert Pessoa.new("João", 13) == %Pessoa{idade: 13, nome: "João"}
  end

  test "muda o nome de uma pessoa para Maria" do
    assert Pessoa.new() |> Pessoa.change_nome("Maria") == %Pessoa{idade: 0, nome: "Maria"}
  end

  test "muda a idade de uma pessoa para 10" do
    assert Pessoa.new("João", 20) |> Pessoa.change_idade(10) == %Pessoa{idade: 10, nome: "João"}
  end

  test "Exibe uma pessoa como string" do
    assert Pessoa.new("João", 20) |> Pessoa.as_string() == "Nome: João, Idade: 20"
  end
end
