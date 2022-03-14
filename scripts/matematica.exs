defmodule Matematica do
  def divide(um_numero, outro_numero) do
    case {Float.parse(um_numero), Float.parse(outro_numero)} do
      {:error, _} ->
        {:erro, "O primeiro argumento não é um número"}

      {_, :error} ->
        {:erro, "O segundo argumento não é um número"}

      {{num1, _}, {num2, _}} ->
        {:ok, num1 / num2}
    end
  end

  defp pdivide(_,0.0) do
    {:erro, "Não é possível dividir por zero"}
  end

  defp pdivide(um_numero, outro_numero) do
    {:ok, um_numero / outro_numero}
  end
end

# IO.puts("10 dividido por 3 é")
# {:ok, resultado} = Matematica.divide(10,3)
# resultado
# |> IO.puts()

# IO.puts("Adolfo dividido por UTFPR é")
# {:erro, mensagem} = Matematica.divide("Adolfo","UTFPR")
# IO.puts("Erro: #{mensagem}")

numero1 = IO.gets("Digite o primeiro número: ") |> String.trim()
numero2 = IO.gets("Digite o segundo número: ") |> String.trim()

case Matematica.divide(numero1, numero2) do
  {:ok, resultado} ->
    IO.puts("#{numero1} dividido por #{numero2} é #{resultado}")

  {:erro, mensagem} ->
    IO.puts("A mensagem de erro é \"#{mensagem}\".")
end
