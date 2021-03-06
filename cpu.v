module cpu(matriz , clock, difficulty, coordenadas, reset);

	input [1:0]matriz[0:8], clock, difficulty, reset;
	output reg [3:0]coordenadas;
	reg [1:0] modo;
	parameter facil=0, medio=1, dificil=2;
	integer i =0;
	
	
	//funções que definem as jogadas de acordo com a dificuldade
	function modo_facil;
		input matriz_l;
		begin		
			for (i=0; i<9; i=i+1)begin
				if(matriz_l[i] == 2)begin
					modo_facil = i;
					break;
					end
			end				
		end
	endfunction
	
	function modo_medio;
		input matriz_l;
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
	always @(*)begin
		case (modo)
			facil:begin
				coordenadas = modo_facil(matriz);
			end
			medio:begin
				coordenadas = modo_medio(matriz);
			end
			dificil:begin
				coordenadas = modo_dificil(matriz);
			end
		endcase
	end

//verificação de qual a dificuldade
	always @(posedge clock, negedge reset)begin
		if(difficulty == facil)
			modo<=facil;			
		else if(difficulty == medio)begin
			modo<=medio;			
		end
		else
			modo<=dificil;			
		
	end
	
endmodule
