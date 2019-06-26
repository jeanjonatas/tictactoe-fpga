module cpu(matriz , clock, difficulty, coordenadas);

	input modo, blanks;
	output coordenadas;
	reg[1:0] modo;
	parameter facil=0, medio=1, dificil=2;

	//funções que definem as jogadas de acordo com a dificuldade
	function modo_facil;
		input blanks;
		begin
		

		modo_facil= ;
		end
	endfunction
	
	function modo_medio;
		input blanks;
		begin
		

		modo_medio= ;
		end
	endfunction
	
	function modo_dificil;
		input blanks;
		begin
		

		modo_dificil= ;
		end
	endfunction
	

	always @(*)begin
		case (modo)
			facil:begin
			coordenadas = modo_facil(blankpos);
			end
			medio:begin
			coordenadas = modo_medio(blankpos);
			end
			dificil:begin
			coordenadas = modo_dificil(blankpos);
			end		
	end

//verificação de qual a dificuldade
	always @(posedge clock, negedge reset_n)begin
		if(difficulty == facil)
			modo<=facil;
			blanks<= matriz;
		else if(difficulty == medio)begin
			modo<=medio;
			blanks<= matriz;
		end
		else
			modo<=dificil;
			blanks<= matriz;
		end
	end
	
endmodule
  
