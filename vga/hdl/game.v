module game(posicoes, clock, coordenadas, reset,
		matrizJogo0,
		matrizJogo1,
		matrizJogo2,
		matrizJogo3,
		matrizJogo4,
		matrizJogo5,
		matrizJogo6,
		matrizJogo7,
		matrizJogo8);

		
reg [0:3]posicao;
input clock;
input reset;
input coordenadas;
input [9:0] posicoes;
reg [9:0] posicoesJogadas;

reg[0:2] vencedor;
reg[8:0] matrizJogo[0:8];

reg[1:0] estadoAtual;
output reg matrizJogo0,
		matrizJogo1,
		matrizJogo2,
		matrizJogo3,
		matrizJogo4,
		matrizJogo5,
		matrizJogo6,
		matrizJogo7,
		matrizJogo8;


parameter Player = 0, CPU = 1;
integer count = 1;


//module cpu(matriz , clock, difficulty, coordenadas, reset);




initial begin
vencedor = 2;
estadoAtual = 0;
end

integer index;
always @(posedge clock) begin
estadoAtual <= CPU;
    if(~reset)begin
       // estadoAtual <= CPU; 
		 // matrizJogo[0] = 1;
		 end 
    else
		begin
	  
	  /*if(estadoAtual == Player) begin
	  
		if(posicoes[0] != posicoesJogadas[0] && posicoes[0])
		posicao = 0;
		 
		if(posicoes[1] != posicoesJogadas[1] && posicoes[1]) 
		posicao = 1;
		
		if(posicoes[2] != posicoesJogadas[2] && posicoes[2]) 
		posicao = 2;
		
		if(posicoes[3] != posicoesJogadas[3] && posicoes[3])
		posicao = 3;
		
		if(posicoes[4] != posicoesJogadas[4] && posicoes[4]) 
		posicao = 4;
		
		if(posicoes[5] != posicoesJogadas[5] && posicoes[5]) 
		posicao = 5;
		
		if(posicoes[6] != posicoesJogadas[6] && posicoes[6]) 
			posicao = 6;
		
		if(posicoes[7] != posicoesJogadas[7] && posicoes[7]) 
			posicao = 7;
		
		if(posicoes[8] != posicoesJogadas[8] && posicoes[8]) 
			posicao = 8;
		end
			else begin
				//posicao = coordenadas;
			end
			*/
			
			// matrizJogo[1] = ;
			matrizJogo[0] = matrizJogo0;
			matrizJogo[1] = matrizJogo1;
			matrizJogo[2] = matrizJogo2;
			matrizJogo[3] = matrizJogo3;
			matrizJogo[4] = matrizJogo4;
			matrizJogo[5] = matrizJogo5;
			matrizJogo[6] = matrizJogo6;
			matrizJogo[7] = matrizJogo7;
			matrizJogo[8] = matrizJogo8;
	 
        case(estadoAtual)
			CPU: begin 
                /*if(matrizJogo[posicao] != 0)begin
                    $display("Erro, essa posição já está preenchida");
                end*/
                 matrizJogo[1] = 2;
                 estadoAtual <= Player;
             end    
		Player: begin 
					 /*
					 if(matrizJogo[posicao] != 0)begin
                    $display("Erro, essa posição já está preenchida");
                end
                else begin
                    matrizJogo[posicao] <= Player;
                    estadoAtual <= CPU;
                end*/
					 matrizJogo[0] = 1;
					 estadoAtual <= CPU;
               end
        endcase
         // matrizJogo[coordenadas] = CPU;
			 matrizJogo[1] = 2;
			  matrizJogo[2] = 2;
			   matrizJogo[3] = 2;
         
			 matrizJogo0 = matrizJogo[0];
			 matrizJogo1 = matrizJogo[1];
			 matrizJogo2 = matrizJogo[2];
			 matrizJogo3 = matrizJogo[3];
			 matrizJogo4 = matrizJogo[4];
			 matrizJogo5 = matrizJogo[5];
			 matrizJogo6 = matrizJogo[6];
			 matrizJogo7 = matrizJogo[7];
			 matrizJogo8 = matrizJogo[8];
							
			
			
			
          
           //Verificando se houve ganhador
            if((matrizJogo[0]==estadoAtual) &&  (matrizJogo[4]==estadoAtual) && (matrizJogo[8] == estadoAtual))begin
                 $display("Ganhou na diagonal principal");
                 vencedor <= estadoAtual;
            end
            else if(matrizJogo[2]==estadoAtual &&  matrizJogo[4]==estadoAtual && matrizJogo[6] == estadoAtual)begin
                 $display("Ganhou na diagonal secundaria");
                 vencedor <= estadoAtual;
            end

            if(matrizJogo[0] == estadoAtual && matrizJogo[1] == estadoAtual && matrizJogo[2] == estadoAtual
                 || matrizJogo[3] == estadoAtual && matrizJogo[4] == estadoAtual && matrizJogo[5] == estadoAtual
                 ||  matrizJogo[6] == estadoAtual && matrizJogo[7] == estadoAtual && matrizJogo[8] == estadoAtual)begin
                 $display("Ganhou por linha");
                 vencedor <= estadoAtual;
            end


            if(matrizJogo[0] == estadoAtual && matrizJogo[3] == estadoAtual && matrizJogo[6] == estadoAtual
                 || matrizJogo[1] == estadoAtual && matrizJogo[4] == estadoAtual && matrizJogo[7] == estadoAtual
                 ||  matrizJogo[2] == estadoAtual && matrizJogo[5] == estadoAtual && matrizJogo[8] == estadoAtual)begin
                 $display("Ganhou por coluna");
                 vencedor <= estadoAtual;
            end
				
							
           
            $display(count);
            $display(vencedor);
            count <= count + 1;
            if(count == 9 && vencedor == 2)begin
                 $display("Jogo empatou");
            end
				 
				
		end
end

endmodule
