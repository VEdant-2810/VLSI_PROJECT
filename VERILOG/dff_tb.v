// testbench for d flip flop

`include "modules.v"
module dff_tb;

    reg d;
    reg clk;
    wire y;
    
    // instantiate the dff module
    dff mod( d , clk, y);
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // toggle clock every 5 time units
    end
    
    initial begin

        $dumpfile("dff_tb.vcd");
        $dumpvars(0, dff_tb);
        // monitor changes
    
        // apply test vectors
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 1; #10;
        d = 0; #10;
    
        // finish simulation
        $finish;
    end
endmodule