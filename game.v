module game(posicaoX, posicaoY, clock, reset);
input posicaoX, posicaoY, clock, reset;

reg[1:0] estadoAtual;
reg [7:0] matrizJogo [0:2][0:2];

parameter Player = 0, CPU = 1;


initial begin
y = 0;
estadoAtual = 0;
velha = 0;
end

always @(posedge clock, negedge reset) begin
    if(~reset)
        estadoAtual <= Player;  
    else
        case(estadoAtual)
        Player: begin 
                matrizJogo[posicaoX, posicaoY] = Player;
               end
        CPU: begin 
                  matrizJogo[posicaoX, posicaoY] = CPU;
             end
        endcase

        if(matrizJogo[posicaoX][0] == estadoAtual         // 3-in-the-row
                   && matrizJogo[posicaoX][1] == estadoAtual
                   && matrizJogo[posicaoX][2] == estadoAtual
              || matrizJogo[0][posicaoY] == estadoAtual      // 3-in-the-column
                   && matrizJogo[1][posicaoY] == estadoAtual
                   && matrizJogo[2][posicaoY] == estadoAtual
              || posicaoX == posicaoY            // 3-in-the-diagonal
                   && matrizJogo[0][0] == estadoAtual
                   && matrizJogo[1][1] == estadoAtual
                   && matrizJogo[2][2] == estadoAtual
              || posicaoX + posicaoY == 2  // 3-in-the-opposite-diagonal
                   && matrizJogo[0][2] == estadoAtual
                   && matrizJogo[1][1] == estadoAtual
                   && matrizJogo[2][0] == estadoAtual)
                begin
                $display(estadoAtual + "Ganhou")
                end 
        else
            begin
            for (int i =0; i<3; i++) begin
                for (int j =0; j<3; j++) begin
                    if(matrizJogo[i][j] != Player || matrizJogo[i][j] != CPU)begin
                        velha = 1;
                        $display(velha + "Ganhou")
                    end

                end 
            end 


            end           
end

endmodule