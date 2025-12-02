
// testbench for 5-bit MCC with input and output flip-flops

`include "modules.v"

module mcl_5bit_with_ff_tb;

    reg clk;
    reg [4:0] A, B;
    reg Cin;

    wire [4:0] A_in, B_in;
    wire Cin_in;

    wire [4:0] SUMin;
    wire Cout_in;

    wire [4:0] SUM;
    wire Cout;

    // input flipflops
    dff dffA0 (.D(A[0]), .clk(clk), .Q(A_in[0]));
    dff dffA1 (.D(A[1]), .clk(clk), .Q(A_in[1]));
    dff dffA2 (.D(A[2]), .clk(clk), .Q(A_in[2]));
    dff dffA3 (.D(A[3]), .clk(clk), .Q(A_in[3]));
    dff dffA4 (.D(A[4]), .clk(clk), .Q(A_in[4]));

    dff dffB0 (.D(B[0]), .clk(clk), .Q(B_in[0]));
    dff dffB1 (.D(B[1]), .clk(clk), .Q(B_in[1]));
    dff dffB2 (.D(B[2]), .clk(clk), .Q(B_in[2]));
    dff dffB3 (.D(B[3]), .clk(clk), .Q(B_in[3]));
    dff dffB4 (.D(B[4]), .clk(clk), .Q(B_in[4]));

    dff dffCin (.D(Cin), .clk(clk), .Q(Cin_in));

    // MCC chain
    wire C1, C2, C3, C4 , C5;

    mcc_1bit m0 (.A(A_in[0]), .B(B_in[0]), .Cin(Cin_in), .clk(~clk), .Sum(SUMin[0]), .Cout(C1));
    mcc_1bit m1 (.A(A_in[1]), .B(B_in[1]), .Cin(C1),     .clk(~clk), .Sum(SUMin[1]), .Cout(C2));
    mcc_1bit m2 (.A(A_in[2]), .B(B_in[2]), .Cin(C2),     .clk(~clk), .Sum(SUMin[2]), .Cout(C3));
    mcc_1bit m3 (.A(A_in[3]), .B(B_in[3]), .Cin(C3),     .clk(~clk), .Sum(SUMin[3]), .Cout(C4));
    mcc_1bit m4 (.A(A_in[4]), .B(B_in[4]), .Cin(C4),     .clk(~clk), .Sum(SUMin[4]), .Cout(C5));

    // output flipflops
    dff dffS0 (.D(SUMin[0]), .clk(clk), .Q(SUM[0]));
    dff dffS1 (.D(SUMin[1]), .clk(clk), .Q(SUM[1]));
    dff dffS2 (.D(SUMin[2]), .clk(clk), .Q(SUM[2]));
    dff dffS3 (.D(SUMin[3]), .clk(clk), .Q(SUM[3]));
    dff dffS4 (.D(SUMin[4]), .clk(clk), .Q(SUM[4]));
    dff dffCout (.D(C5), .clk(clk), .Q(Cout));

    // clock
    initial clk = 0;
    always #5 clk = ~clk; // time period of clock = 10

    // stimulus
    initial begin
        $dumpfile("mcl_5bit_with_ff_tb.vcd");
        $dumpvars(0, mcl_5bit_with_ff_tb);

        A = 0; B = 0; Cin = 0;
        #1;
        A = 5'd1; B = 5'd2; Cin = 0;
        #20;

        A = 5'd0; B = 5'd4; Cin = 1;
        #20;

        A = 5'd15; B = 5'd15; Cin = 0;
        #20;

        A = 5'd0; B = 5'd0; Cin = 0;
        #20;

        $finish;
    end

endmodule
