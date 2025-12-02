

// module for 1-bit Manchester Carry Circuit (MCC)
module mcc_1bit(
    input wire clk,
    input wire A,
    input wire B,
    input wire Cin,
    output reg Cout,
    output reg Sum
);

    wire P = A ^ B;
    wire G = A & B;

    always @(*) begin
        if (clk) begin
            // clk == 1 → do actual addition
            Cout = G | (P & Cin);
        end
        else begin
            // clk == 0 → define what you want here
            Cout = 1'b1;   // your original idea
        end
        Sum = P ^ Cin;
    end
endmodule


// Module for flip flop
module dff(
    input wire D,
    input wire clk,
    output reg Q
);
    always @(posedge clk) begin
        Q <= D;
    end
endmodule