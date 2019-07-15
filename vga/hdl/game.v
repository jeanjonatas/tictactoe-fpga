module game(posicoes, posicao, clock, reset, vencedor, matrizJogo);
input [0:8]posicao;
input clock, reset;
input [9:0] posicoes;

output reg[0:2] vencedor;

reg[1:0] estadoAtual;
output reg [1:0] matrizJogo [0:8];

parameter Player = 0, CPU = 1;
integer count = 1;


initial begin
vencedor = 2;
estadoAtual = Player;
//inicializando valores da matriz
for (index=0; index<9; index=index+1) begin
                    matrizJogo[index] = 2;
                    $display("Posicao");
                    $display(index);
                    $display(matrizJogo[index]);
            end 
end

integer index;
always @(posedge clock, negedge reset) begin
    if(~reset)
        estadoAtual <= Player;  
    else
    //Atribuindo valor na posicao da matriz
        case(estadoAtual)
        Player: begin 
                if(matrizJogo[posicao] != 2)begin
                    $display("Erro, essa posição já está preenchida");
                end
                else begin
                    matrizJogo[posicao] = Player;
                    estadoAtual <= CPU;
                end
               end
        CPU: begin 
                if(matrizJogo[posicao] != 2)begin
                    $display("Erro, essa posição já está preenchida");
                end
                else begin
                   matrizJogo[posicao] = CPU;
                   matrizJogo[posicao] = CPU;
                   estadoAtual <= Player;
                end
             end
        endcase
         $display(estadoAtual);
          $display("Posicoes");
          $display(posicao);
          $display("Estados");
          $display(matrizJogo[posicao]);
          
          
           //Verificando se houve ganhador
            if(matrizJogo[0]==estadoAtual &&  matrizJogo[4]==estadoAtual && matrizJogo[8] == estadoAtual)begin
                 $display("Ganhou na diagonal principal");
                 vencedor = estadoAtual;
            end
            else if(matrizJogo[2]==estadoAtual &&  matrizJogo[4]==estadoAtual && matrizJogo[6] == estadoAtual)begin
                 $display("Ganhou na diagonal secundaria");
                 vencedor = estadoAtual;
            end

            if(matrizJogo[0] == estadoAtual && matrizJogo[1] == estadoAtual && matrizJogo[2] == estadoAtual
                 || matrizJogo[3] == estadoAtual && matrizJogo[4] == estadoAtual && matrizJogo[5] == estadoAtual
                 ||  matrizJogo[6] == estadoAtual && matrizJogo[7] == estadoAtual && matrizJogo[8] == estadoAtual)begin
                 $display("Ganhou por linha");
                 vencedor = estadoAtual;
            end


            if(matrizJogo[0] == estadoAtual && matrizJogo[3] == estadoAtual && matrizJogo[6] == estadoAtual
                 || matrizJogo[1] == estadoAtual && matrizJogo[4] == estadoAtual && matrizJogo[7] == estadoAtual
                 ||  matrizJogo[2] == estadoAtual && matrizJogo[5] == estadoAtual && matrizJogo[8] == estadoAtual)begin
                 $display("Ganhou por coluna");
                 vencedor = estadoAtual;
            end
           
            $display(count);
            $display(vencedor);
            count <= count + 1;
            if(count == 9 && vencedor == 2)begin
                 $display("Jogo empatou");
            end
end

endmodule
