module game(posicaoX, posicaoY, clock, reset);
input posicaoX, posicaoY, clock, reset;

reg[1:0] estadoAtual;
reg [7:0] matrizJogo [0:2][0:2];

parameter Player = 0, CPU = 1;

initial begin
y = 0;
estadoAtual = 0;
end

always @(posedge clock, negedge reset) begin
    if(~reset)
        estadoAtual <= sinic;  
    else
        case(estadoAtual)
        Player: begin 
                matrizJogo[posicaoX, posicaoY]
                
                if(x == 0)
                    estadoAtual <= sinic;
                else
                    estadoAtual <= s1;
               y = 0;
               end
        CPU: begin 
                if(x == 0)
                    estadoAtual <= s1;
                else
                    estadoAtual <= s11;
             y = 0;
             end
        endcase                
end

endmodule