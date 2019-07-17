module cpu(clock, difficulty, coordenadas, reset,
		matrizJogo0,
		matrizJogo1,
		matrizJogo2,
		matrizJogo3,
		matrizJogo4,
		matrizJogo5,
		matrizJogo6,
		matrizJogo7,
		matrizJogo8);

	input matrizJogo0,
		matrizJogo1,
		matrizJogo2,
		matrizJogo3,
		matrizJogo4,
		matrizJogo5,
		matrizJogo6,
		matrizJogo7,
		matrizJogo8;
	
		
	input clock, difficulty, reset;
	reg [0:8] matrizJogo;
	
	output reg [0:3]coordenadas;
	reg [1:0] modo;
	parameter facil=0, medio=1, dificil=2;
	//integer i=0;
	
	
	//funções que definem as jogadas de acordo com a dificuldade
	function modo_facil;
	integer i=0, controle = 1;
	
		input [9:0] matriz_l;
		begin		
			/*
			for (i=0; i<9; i=i+1)begin
				if(matriz_l[i] == 0 && controle)begin
					modo_facil = i;
					controle = 0;
					end
			end*/
		modo_facil = 2;
		end
	endfunction
	
	function modo_medio;
		input [9:0] matriz_l;
		integer i=0;
		reg [1:0] temp [0:8], temp2 [0:8];
		integer cont, cont2;
		begin
			cont=0;
			cont2=0;
			for (i=0; i<9; i=i+1)begin
				if(matriz_l[i] == 2)begin
					temp[cont] = i;
					cont = cont+1;
					if(matriz_l[i+1] == 1)begin
						modo_medio= i;
						break;
					end
					else if(i>0 && matriz_l[i-1] == 1)begin
						modo_medio= i;
						break;
					end
					else if(i>2 && matriz_l[i-3] == 1)begin
						modo_medio= i;
						break;
					end
					else if(matriz_l[i+3] == 1)begin
						modo_medio= i;
						break;
					end
					else
						modo_medio= i;					
						
				end				
			end
		end
	endfunction
	
	function modo_dificil;
		input matriz;
		begin
		

		modo_dificil= 0;
		end
	endfunction 
	
//definição das coordenadas de joagada de acordo com a dificuldade 
/*
	always @(*)begin
		case (modo)
			facil:begin
				coordenadas = modo_facil(matrizJogo);
			end
			medio:begin
				coordenadas = modo_medio(matrizJogo);
			end
			dificil:begin
				coordenadas = modo_dificil(matrizJogo);
			end
		endcase
	end
	*/

//verificação de qual a dificuldade
	always @(posedge clock) begin
		 if(~reset)begin
       coordenadas <= 2;
		 end 
    else begin
	  coordenadas <= 2;
	  /*
		if(difficulty == facil)begin
			modo<=facil;
		end
		else if(difficulty == medio)begin
			modo<=medio;			
		end
		else begin
			modo<=dificil;
			end*/
	end
end
	
endmodule
