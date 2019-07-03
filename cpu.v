module cpu(matriz , clock, difficulty, coordenadas);

	input modo, [1:0] matriz [0:8];
	output coordenadas;
	reg[1:0] modo;
	parameter facil=0, medio=1, dificil=2;

	//funções que definem as jogadas de acordo com a dificuldade
	function modo_facil;
		input matriz;
		begin
		reg cont;
		for (i=0; i<9; i=i+1)begin
			if(matriz[i] == 2)begin
				modo_facil = i;
				break;
			end
				
		end		
		end
	endfunction
	
	function modo_medio;
		input matriz;
		begin
		reg [1:0] temp [0:8], cont;
		for (i=0; i<9; i=i+1)begin
			if(matriz[i] == 2)begin
				temp[cont] = i;
				cont = cont+1;
			end

		modo_medio= ;
		end
	endfunction
	
	function modo_dificil;
		input matriz;
		begin
		

		modo_dificil= ;
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
	end

//verificação de qual a dificuldade
	always @(posedge clock, negedge reset_n)begin
		if(difficulty == facil)
			modo<=facil;			
		else if(difficulty == medio)begin
			modo<=medio;			
		end
		else
			modo<=dificil;			
		end
	end
	
endmodule
  
