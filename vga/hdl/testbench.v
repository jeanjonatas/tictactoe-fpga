module testbench(posicao);
    output reg[0:8] posicao;
initial begin

//Jogo deu velha
posicao=0;
#10;
posicao=1;
#20;
posicao=2;
#20;
posicao=3;
#20;
posicao=5;
#20;
posicao=4;
#20;
posicao=6;
#20;
posicao=8;
#20;
posicao=7;

/*Test ganhando por coluna
posicao=0;
#10;
posicao=2;
#20;
posicao=3;
#20;
posicao=4;
#20;
posicao=6;
#20;
posicao=7;
#20;

/*Test ganhando na linha
posicao=0;
#10;
posicao=3;
#20;
posicao=1;
#20;
posicao=4;
#20;
posicao=2;
#20;
posicao=7;
#20;
/*Test ganhando na diagonal principal
posicao=0;
#20;
posicao=1;
#20;
posicao=4;
#20;
posicao=2;
#20;
posicao=8;
#20;
posicao=7;
*/


end
endmodule
