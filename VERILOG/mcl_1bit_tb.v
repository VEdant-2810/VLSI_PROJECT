
`include "modules.v"


module mcl_1bit_tb;

    reg clk;
    reg A;
    reg B;
    reg Cin;
    wire Sum;
    wire Cout;

    // instantiate the mcc_1bit module
    mcc_1bit mod( clk ,A , B , Cin , Cout , Sum );

    initial clk = 0;
    always #5 clk = ~clk; // time period of clock = 10
    
    initial begin
        $dumpfile("mcl_1bit_tb.vcd");
        $dumpvars(0, mcl_1bit_tb);

        A = 0; B = 0; Cin = 0;
        #10;

        A = 0; B = 1; Cin = 0;
        #10;

        A = 1; B = 0; Cin = 0;
        #10;

        A = 1; B = 1; Cin = 0;
        #10;

        A = 1; B = 1; Cin = 1;
        #10;

        A = 0; B = 1; Cin = 1;
        #10;

        A = 1; B = 0; Cin = 1;
        #10;

        A = 0; B = 0; Cin = 1;
        #10;

        $finish;
    end
endmodule