module testbench(posicaoX);
    output reg[0:8] posicaoX;
initial begin



posicaoX=0;
#10;
posicaoX=1;
#20;
posicaoX=4;
#20;
posicaoX=2;
#20;
posicaoX=8;
#20;
posicaoX=7;
end
endmodule
