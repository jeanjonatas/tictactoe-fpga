module game(posicaoX, posicaoY, clock, reset, vencedor);
input [0:8]posicaoX, posicaoY;
input clock, reset;
output reg vencedor;

reg[1:0] estadoAtual;
reg [1:0] matrizJogo [0:8];

parameter Player = 0, CPU = 1;


initial begin
vencedor = 2;
estadoAtual = Player;
for (i=0; i<9; i=i+1) begin
                    matrizJogo[i] = 2;
                    $display("Posicao");
                    $display(i);
                    $display(matrizJogo[i]);
            end 



end
integer i, count;
always @(posedge clock, negedge reset) begin
    if(~reset)
        estadoAtual <= Player;  
    else
        case(estadoAtual)
        Player: begin 
                matrizJogo[posicaoX] = Player;
                estadoAtual <= CPU;
               end
        CPU: begin 
                   matrizJogo[posicaoX] = CPU;
                   matrizJogo[posicaoY] = CPU;
                   estadoAtual <= Player;
             end
        endcase
         $display(estadoAtual);
          $display("Posicoes");
          $display(posicaoX);
          $display(posicaoY);
          $display("Estados");
          $display(matrizJogo[posicaoX]);
          $display(matrizJogo[posicaoX]);
          $display(matrizJogo[posicaoX]);
          
          
           for (i=0; i<9; i=i+1) begin
            if(i%2 == 0 && matrizJogo[i] == estadoAtual)begin
                count = count + 1;
                 $display("Entrou");
            end
           
           
           end
           
           if(count == 3)
             $display("Ganhou na diagonal");
             
             
            count = 0;
        
        /*
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
                    $display("Entrou");
                   vencedor <= estadoAtual;
                   end
        else begin
            for (i=0; i<3; i=i+1) begin
                for (j=0; j<3; j=j+1) begin
                    if(matrizJogo[i][j] != Player || matrizJogo[i][j] != CPU)
                    begin
                        vencedor = 2;
                        $display("Deu velha");
                    end

                end 
            end 
        end 
        */
        i = 0;
end

endmodule
