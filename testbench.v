module testbench(posicaoX, posicaoY);
    output reg posicaoX, posicaoY;
initial begin

posicaoX=0;
posicaoY=0;
#10
posicaoX=0;
posicaoY=0;
#10;
posicaoX=0;
posicaoY=2;
#10;
posicaoX=2;
posicaoY=2;
#10;
posicaoX=1;
posicaoY=1;
#10;
posicaoX=2;
posicaoY=0;
#10;
posicaoX=1;
posicaoY=0;
#10;
posicaoX=2;
posicaoY=1;
end
endmodule