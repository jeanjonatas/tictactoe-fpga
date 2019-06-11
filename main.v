`include "game.v"
`include "testbench.v"

module main;

wire posicaoX, posicaoY, vencedor;
reg clock, reset;

testbench testbench(.posicaoX(posicaoX), .posicaoY(posicaoY));
game game(.posicaoX(posicaoX), .posicaoY(posicaoY), .clock(clock), .reset(reset), .vencedor(vencedor));

initial begin
    $dumpfile("game.vcd"); //Saídas do jogo
    $dumpvars;

    //Inicializando variáveis
    reset = 0;
    clock = 0;
    reset = 1;
    #5
    #150 $finish;
end
    always
        #10 clock = ~clock;
endmodule