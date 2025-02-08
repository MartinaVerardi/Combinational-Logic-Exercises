/* Binary-Coded Decimal ADDER */

/* 
Write a SystemVerilog module that calculates the sum of two BCD numbers and a carryIn.
The module header is:

module bcdAdd
    (input logic [3:0] a,b,
     input logic carryIn,
     output logic [3:0] sum,
     output logic carryOut);

The sum output must be a BCD number. carryOut is the carry out to the next higher digit.
Demonstrate the adder correctness with a testbench.
 */

module bcdAdd (
    input logic [3:0] a, b,   // Inputs a and b (4 bits each)
    input logic carryIn,      // Carry input
    output logic [3:0] sum,   // Sum output (4 bits)
    output logic carryOut     // Carry output
);

    logic [2:0] c;  // Internal carry signals

    // Instantiate the 1-bit adders for each bit
    adder b0 (a[0], b[0], carryIn, sum[0], c[0]);  // Least significant bit
    adder b1 (a[1], b[1], c[0], sum[1], c[1]);
    adder b2 (a[2], b[2], c[1], sum[2], c[2]);
    adder b3 (a[3], b[3], c[2], sum[3], carryOut);  // Most significant bit
    
endmodule

module adder(
    input logic a, b, cI,   // Inputs for the adder
    output logic sum, cO    // Outputs for sum and carry out
);

     logic [4:0] tempSum;  // 5-bit temporary sum (to handle overflow)
    
    always_comb begin
        // Step 1: Add a, b and carryIn
        tempSum = a + b + cI;

        // Step 2: Check if the sum exceeds 9 (1001 in binary)
        if (tempSum > 9) begin
            // If the sum is greater than 9, we need to correct it by adding 6
            sum = tempSum[3:0] + 6;  // Add 6 (0110) to correct the sum
            cO = 1;                   // Set carryOut to 1 because the result overflows a BCD digit
        end else begin
            // If the sum is <= 9, no correction needed
            sum = tempSum[3:0];       // Use the lower 4 bits of tempSum
            cO = 0;                   // No carryOut, since the result fits in a BCD digit
        end
    end

endmodule

module testbench;
    logic [3:0] s;        // Sum result
    logic cOut;           // Carry output
    logic [9:0] count;    // Counter to generate test cases

    // Instantiate the BCD adder module
    bcdAdd add0 (
        .a(count[7:4]),
        .b(count[3:0]),
        .carryIn(count[8]),
        .sum(s),
        .carryOut(cOut)
    );

    initial begin
        for (count = 0; count < 512; count++) begin
            #1;  // Small delay for simulation

            // Check if the result is correct by comparing the sum and carry
            if ({cOut, s} !== (count[7:4] + count[3:0] + count[8])) begin
                $display("Oops!! %d != %d + %d + %d", {cOut, s}, count[7:4], count[3:0], count[8]);
            end
        end
        $finish;  // End the simulation
    end

endmodule

