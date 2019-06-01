`include "game.v"

module main;

reg clock, reset;

initial begin
    $dumpfile("game.vcd"); //Saídas do jogo
    $dumpvars;

    //Inicializando variáveis
    reset = 0;
    clock = 0;

    #5
    #150 $finish;
end
    always
        #5 clock = ~clock;
end module