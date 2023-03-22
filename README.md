# Slot-Machine-Simulator
Simulador de caça-níquel feito em Verilog.

Esse código descreve um módulo de uma máquina caça-níqueis em Verilog, que é uma linguagem de descrição de hardware usada para projetar circuitos digitais. O módulo tem uma entrada de relógio (clock), uma entrada de reset, uma entrada de start e quatro saídas: três saídas para exibir os símbolos que aparecem nos três rolos da máquina e uma saída indicando se o jogador ganhou ou não.

O comportamento da máquina caça-níqueis é controlado por um sinal de start. Quando esse sinal é acionado, a máquina começa a rodar os rolos. A cada ciclo do relógio, um número aleatório é gerado a partir de um contador, que é então convertido em um símbolo correspondente e exibido nos rolos. Se os três símbolos exibidos forem iguais, o jogador ganha.

A variável "win" é usada para indicar se o jogador ganhou ou não, e "winning_symbol" é usada para armazenar o símbolo que resultou na vitória. As variáveis "prev_symbol", "current_symbol" e "next_symbol" são usadas para rastrear os símbolos que foram exibidos nos rolos nos ciclos de relógio anteriores e atuais, para que possam ser comparados para determinar se o jogador ganhou.

Quando o sinal de reset é acionado, todas as variáveis são reiniciadas para seus valores iniciais, o que coloca a máquina em um estado inicial para a próxima jogada.
