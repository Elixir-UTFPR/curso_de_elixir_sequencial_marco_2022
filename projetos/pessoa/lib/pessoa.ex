defmodule Pessoa do
  defstruct nome: "", idade: 0
  @type t :: %__MODULE__{nome: String.t(), idade: non_neg_integer}

  # constructors

  @spec new :: Pessoa.t()
  def new() do
    %__MODULE__{}
  end

  @spec new(String.t(), non_neg_integer) :: Pessoa.t()
  def new(nome, idade) do
    %__MODULE__{nome: nome, idade: idade}
  end

  # reducers

  @spec change_nome(Pessoa.t(), String.t()) :: Pessoa.t()
  def change_nome(pessoa, new_nome) do
    %__MODULE__{pessoa | nome: new_nome}
  end

  @spec change_idade(Pessoa.t(), non_neg_integer) :: Pessoa.t()
  def change_idade(pessoa, new_idade) do
    %__MODULE__{pessoa | idade: new_idade}
  end

  # converters - transformers

  @spec as_string(Pessoa.t()) ::
          String.t()
  def as_string(pessoa) do
    "Nome: #{pessoa.nome}, Idade: #{pessoa.idade}"
  end
end

# defimpl Inspect, for: Pessoa do
#   def inspect(pessoa, _opts) do    """
#     -----------|---------------------
#        Nome    :     #{pessoa.nome}
#     -----------|---------------------
#        Idade   :     #{pessoa.idade}
#     -----------|---------------------
#     """
#   end
# end
