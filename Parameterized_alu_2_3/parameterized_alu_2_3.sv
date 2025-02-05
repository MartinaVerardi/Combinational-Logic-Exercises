/*

An ALU has the following functions: ADD, AND, OR, XOR. These are selected by a 2-bit input fn.
The encoding of fn is 0-3 with the above order. The ALU has a carry in (cIn) and carry out (COut).
Scalar outputs N, Z, and V indicates when the ALU's output is negative (2-compliments), zero,
or if there is a 2-complement overflow. The two inputs are a and b, and the output is result. 
Write and test the module using enumerations and a width parameter.

*/

typedef enum logic [0:1] { 
    ADD = 2'b00,
    AND = 2'b01,
    OR  = 2'b10,
    XOR = 2'b11
} mode;

module myALU (
    input  logic [3:0] a, b,      // Inputs a and b (4 bits each)
    input  logic cIn,             // Carry input
    output logic [3:0] result,    // Sum output (4 bits)
    output logic cOut,            // Carry output 
    input  mode  fn,              // Function selector
    output logic N, Z, V          // Negative, Zero, Overflow flags
);

    always_comb begin
        
        // Default values
        result = 0;
        cOut = 0;
        N = 0; Z = 0; V = 0;

        unique case (fn)
            ADD: begin
                tempSum = a + b + cIn;
                result = tempSum[3:0]; // Take the lower 4 bits
                cOut = tempSum[4];     // Carry out is the 5th bit

                // Negative flag (MSB of result is 1 in 2's complement)
                N = result[3];

                // Zero flag (Result is zero)
                Z = (result == 4'b0000) ? 1 : 0;

                // Overflow flag (Occurs when adding two same-signed numbers results in a different sign)
                V = (~a[3] & ~b[3] & result[3]) | (a[3] & b[3] & ~result[3]);
            end
            AND: result = a & b;
            OR: result = a | b;
            XOR: result = a ^ b;
        endcase

    end 

endmodule

module testALU;

    /*                 ** COUNT STRUCTURE **

    msb                             lsb
     --------------------------------
    |   |   |   |   |   |   |   |   |
    |   |   |   |   |   |   |   |   |
     --------------------------------
    * 

    */

    mode       fn,
    bit [7:0]  count
    bit [3:0]  resultOut,
    bit        Nout, Zout, Vout, carryOut

    myALU alu0(
        input  logic [3:0] a, b,      // Inputs a and b (4 bits each)
        input  logic cIn,             // Carry input
        output logic [3:0] result,    // Sum output (4 bits)
        output logic cOut,            // Carry output 
        input  mode  fn,              // Function selector
        output logic N, Z, V          // Negative, Zero, Overflow flags
    )



endmodule