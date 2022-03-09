# Aprendendo o básico de Elixir

## Valores

Nessa seção falaremos sobre os valores de dados em Elixir.

## Números inteiros

Observe que não há um limite claro.

O _ é usado como separador de milhar.

```elixir
1958 + 4 + 1_237_198_239_127_378
```

```elixir
1_000
```

Números binários (base 2) podem ser escritos começando com 0b.

```elixir
0b0110
```

Números octais (base 8) podem ser escritos começando com 0o.

```elixir
0o0010
```

Números hexadecimais (base 16) podem ser escritos começando com 0x.

```elixir
0xCAFE
```

## Números de ponto flutuante

```elixir
4.79
```

Números de ponto flutuante podem ter um expoente (o número depois do e).

```elixir
1.0e2
```

```elixir
0.786876e2
```

## Cadeias de Caracteres (Strings)

```elixir
"Hello World"
```

## Átomos

```elixir
:identificador
```

```elixir
:idade
```

```elixir
:peso
```

```elixir
false
```

```elixir
true
```

```elixir
false == false
```

## Valores lógicos (booleanos)

```elixir
true
```

```elixir
false
```

## Funções

Os nomes de funções em Elixir contém Módulo, Nome da Função e Aridade.

Por exemplo: **String.upcase/1**.

```elixir
String.upcase("adolfo gustavo")
```

Funções de Erlang podem ser utilizadas em Elixir.

_Dependendo da versão do Livebook, você pode ver a ajuda dos módulos e das funções, tanto de Elixir quanto de Erlang._

**Como? Passando o mouse em cima do nome do módulo ou da função.**

```elixir
:rand.uniform(100)
```

```elixir
String.ends_with?("Adolfo", "olf")
```

## Criar suas próprias funções

Índice de Massa Corpórea

imc = peso/(altura^2)

peso: em kg

altura: em m

```elixir
defmodule Obesidade do
  def imc(peso, altura) do
    peso / (altura * altura)
  end

  def obesa?(peso, altura) do
    imc(peso, altura) > 30
  end
end
```

```elixir
Obesidade.imc(100, 1.9)
```

```elixir
Obesidade.obesa?(100, 1.7)
```

## Funções anônimas

```elixir
(fn x, y -> x / (y * y) end).(100, 1.9)
```

```elixir
imc = fn x, y -> x / (y * y) end
```

```elixir
imc.(100, 1.7)
```

Notação capture (&)

```elixir
&(&1 / &2 * &2)
```

```elixir
(&(&1 / (&2 * &2))).(100, 1.7)
```
