`include "game.v"
`include "testbench.v"

module main;

wire [0:8] posicao;
wire [0:2]vencedor;
reg clock, reset;

testbench testbench(.posicao(posicao));
game game(.posicao(posicao), .clock(clock), .reset(reset), .vencedor(vencedor));

initial begin
    $dumpfile("game.vcd"); //Saídas do jogo
    $dumpvars;

    //Inicializando variáveis
    reset = 0;
    clock = 0;
    reset = 1;
    #10
    #150 $finish;
end
    always
        #10 clock = ~clock;
endmodule
