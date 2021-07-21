defmodule Points do
	# FUNÇÃO RESPONSÁVEL POR ITERAR A ALTURA E PEGAR OS PONTOS LATERAIS DELA
	def getPoints(lb, t, rb) when elem(t, 1) == elem(lb, 1) do
		IO.puts "Chegou ao final, hora de retornar!"
		lateralPoints(elem(lb, 0), elem(rb, 0), elem(lb, 1))
	end
	def getPoints(lb, t, rb) do

		# OBTEM TODOS OS PONTOS DE x ENTRE lb e rb.
		lP = lateralPoints(elem(lb, 0), elem(rb, 0), elem(lb, 1))

		IO.inspect lP, charlists: :as_lists

		# ENTRA NA RECURSÃO ENVIANDO lb e rb DECREMENTADOS.
		lP ++ getPoints({elem(lb, 0)+1, elem(lb, 1)-1}, t, {elem(rb, 0)-1, elem(rb, 1)-1})
	end

	# FUNÇÃO RESPONSÁVEL POR PEGAR O INTERVALO DE X ENTRE PONTOS
	def lateralPoints(offset, limit, x) when offset==limit do
		[[offset, x]]
	end
	def lateralPoints(offset, limit, x) do
		[[offset, x]] ++ lateralPoints(offset+1, limit, x)
	end
end


# PONTOS INICIAIS
lb = {1, 32}
t = {32, 1}
rb = {63, 32}

a = Points.getPoints({25, 8}, {28, 5}, {31, 8})

IO.puts "TAMANHO DE A: #{length(a)}"
IO.inspect a, charlists: :as_lists
