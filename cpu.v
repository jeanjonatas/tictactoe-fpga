module cpu(matriz , clock, difficulty, coordenadas);

	input modo, blanks;
	output coordenadas;
	reg[1:0] modo;
	parameter facil=0, medio=1, dificil=2;

	function modo_facil;
		input blanks;
		begin
		

		modo_facil= ;
		end
	endfunction


	always @(*)begin
		case (modo)
			facil:begin
			coordenadas = modo_facil(blankpos);
			end
			medio:begin
			coordenadas = modo_medio;
			end
			dificil
		
		
		
	end


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
  
  https://towardsdatascience.com/tic-tac-toe-creating-unbeatable-ai-with-minimax-algorithm-8af9e52c1e7d
  http://www.codekraft.co/freecodecamp/jogo-da-velha-entendendo-o-algoritimo-minimax/
