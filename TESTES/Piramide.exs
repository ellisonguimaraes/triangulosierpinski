
# RECURSÃO QUE PEGA OS PONTOS MENORES
defmodule Triangulo do
    def build(lb, t, rb, n) when n == 0 do
        IO.puts "[#{elem(lb, 0)}, #{elem(lb, 1)}], [#{elem(t, 0)}, #{elem(t, 1)}], [#{elem(rb, 0)}, #{elem(rb, 1)}]"

        [[[elem(lb, 0), elem(lb, 1)], [elem(t, 0), elem(t, 1)], [elem(rb, 0), elem(rb, 1)]]]
    end

    def build(lb, t, rb, n) do

        {lt_x, lt_y} = {trunc((elem(t, 0) - elem(lb, 0)) / 2 + elem(lb, 0)), trunc((elem(lb, 1) - elem(t, 1)) / 2 + elem(t, 1))}
        {tr_x, tr_y} = {trunc((elem(rb, 0) - elem(t, 0)) / 2 + elem(t, 0)), trunc((elem(rb, 1) - elem(t, 1)) / 2 + elem(t, 1))}
        {lr_x, lr_y} = {trunc((elem(rb, 0) - elem(lb, 0)) / 2 + elem(lb, 0)), trunc(elem(rb, 1))}

        #IO.puts "lt = [#{lt_x}, #{lt_y}]"
        #IO.puts "tr = [#{tr_x}, #{tr_y}]"
        #IO.puts "lr = [#{lr_x}, #{lr_y}]"

        # ESQUERDA
        left = build(lb, {lt_x, lt_y+1}, {lr_x-1, lr_y}, n-1)

        # TOPO
        top = build({lt_x+1, lt_y}, t, {tr_x, tr_y}, n-1)

        # DIREITA
        right = build({lr_x+1, lr_y}, {tr_x+1, tr_y+1}, rb, n-1)

        # RETORNO
        left ++ top ++ right
    end
end

# PONTOS INICIAIS
lb = {1, 32}
t = {32, 1}
rb = {63, 32}

{n, _} = IO.gets("Digite N: ") |> Integer.parse
# OBTENDO OS PONTOS DOS TRIANGULOS MENORES
result = Triangulo.build(lb, t, rb, n)
IO.puts "#{length(result)}"
