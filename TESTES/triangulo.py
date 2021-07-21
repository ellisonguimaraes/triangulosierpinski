

def triangulo_chato(lb, t, rb, n):

    if(n == 0):
        print(lb, t, rb)
        return -1

    # Cálculo de pontos médios
    lt_x, lt_y = [int((t[0]-lb[0])/2+lb[0]), int((lb[1]-t[1])/2+t[1])]
    tr_x, tr_y = [int((rb[0]-t[0])/2+t[0]), int((rb[1]-t[1])/2+t[1])]
    lr_x, lr_y = [int((rb[0]-lb[0])/2+lb[0]), int(rb[1])]


    # ESQUERDA
    triangulo_chato(lb,
                    [lt_x, lt_y+1],
                    [lr_x-1, lr_y],
                    n-1)

    # TOPO
    triangulo_chato([lt_x+1, lt_y],
                    t,
                    [tr_x, tr_y],
                    n-1)

    # DIREITA
    triangulo_chato([lr_x+1, lr_y],
                    [tr_x+1, tr_y+1],
                    rb,
                    n-1)



# [x, y] = [coluna, linha]
lb = [1, 32]
t = [32, 1]
rb = [63, 32]

triangulo_chato(lb, t, rb, 2)