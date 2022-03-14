f = fn x,y -> x/y end
g = fn w,t -> w*t end

num1 = 10.7
num2 = 3.2
num3 = 450

IO.puts(g.(f.(num1,num2), num3))

num1
|> f.(num2)
|> g.(num3)
|> IO.puts()


1
|> then(fn x -> Enum.drop(["a", "b", "c"], x) end)
|> IO.inspect()
