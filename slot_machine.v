/*
    Este é um módulo para uma máquina caça-níqueis que possui 3 símbolos de saída (symbol1, symbol2 e symbol3) e um sinal de saída de vitória (win). 
    O módulo usa um sinal de clock e um sinal de reset para controlar o funcionamento da máquina. O sinal de start é usado para iniciar a máquina.

    O módulo usa uma contagem de 16 bits para gerar um número aleatório e atualizar os símbolos na tela.
    Ele também verifica se há uma combinação vencedora dos símbolos. 
    Se houver uma combinação vencedora, o sinal de vitória é definido como 1 e o símbolo vencedor é armazenado. 
    Caso contrário, o sinal de vitória é definido como 0. O código também armazena o símbolo atual para uso na próxima iteração.
*/

module slot_machine(
    input clock,
    input reset,
    input start,
    output reg [2:0] symbol1,
    output reg [2:0] symbol2,
    output reg [2:0] symbol3,
    output reg win
);

    reg [15:0] counter;
    reg [2:0] prev_symbol;
    reg [2:0] current_symbol;
    reg [2:0] next_symbol;
    reg [2:0] winning_symbol;

    always @(posedge clock) begin
        if (reset) begin
            counter <= 0;
            symbol1 <= 0;
            symbol2 <= 0;
            symbol3 <= 0;
            prev_symbol <= 0;
            current_symbol <= 0;
            next_symbol <= 0;
            winning_symbol <= 0;
            win <= 0;
        end 
        
        else if (start) begin
            // Generate a random number by shifting the counter
            counter <= counter + 1;
            current_symbol <= counter[3:1];
            next_symbol <= counter[4:2];
            
            // Update the symbols on the display
            if (counter[4:2] == 0) begin
                symbol1 <= current_symbol;
            end
            else if (counter[3:1] == 0) begin
                symbol2 <= current_symbol;
            end
            else if (counter[2:0] == 0) begin
                symbol3 <= current_symbol;
            end
            
            // Check if we have a winning combination
            if (symbol1 == symbol2 && symbol2 == symbol3) begin
                win <= 1;
                winning_symbol <= symbol1;
            end 
            else if (prev_symbol == current_symbol && current_symbol == next_symbol) begin
                win <= 1;
                winning_symbol <= current_symbol;
                end else begin
                win <= 0;
                winning_symbol <= 0;
            end
            
            // Store the current symbol for the next iteration
            prev_symbol <= current_symbol;
        end
    end  
endmodule