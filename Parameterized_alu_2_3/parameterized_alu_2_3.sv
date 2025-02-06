/*
 * ALU (Arithmetic Logic Unit) with four functions: ADD, AND, OR, and XOR.
 * The function is selected by a 2-bit input 'fn' with the following encoding:
 *    00 - ADD
 *    01 - AND
 *    10 - OR
 *    11 - XOR
 *
 * The ALU also has:
 *    - Carry-in (cIn) and carry-out (cOut)
 *    - Scalar outputs: N (Negative), Z (Zero), and V (Overflow)
 * 
 * The inputs are 'a' and 'b' (4 bits each), and the result is a 4-bit output 'result'.
 * 
 * The code is written with enumerations for the operation modes and a parameterized width.
 */

// Enumeration for ALU operations
typedef enum logic [0:1] { 
    ADD = 2'b00,   // Addition
    AND = 2'b01,   // Bitwise AND
    OR  = 2'b10,   // Bitwise OR
    XOR = 2'b11    // Bitwise XOR
} mode;

// ALU module definition
module myALU (
    input  logic [3:0] a, b,      // 4-bit inputs a and b
    input  logic cIn,             // Carry input
    output logic [3:0] result,    // 4-bit result output
    output logic cOut,            // Carry output
    input  mode  fn,              // Function selector (operation mode)
    output logic N, Z, V          // Negative, Zero, and Overflow flags
);

    logic [4:0] tempSum;          // Temporary 5-bit sum to handle carry

    // ALU operation logic (based on selected function 'fn')
    always_comb begin
        
        // Default values for outputs
        result = 0;
        cOut = 0;
        N = 0; Z = 0; V = 0;

        // Perform operation based on 'fn' using 'unique' case statement for optimization
        unique case (fn)
            ADD: begin
                tempSum = a + b + cIn;  // Sum with carry-in
                result = tempSum[3:0];  // Lower 4 bits of result
                cOut = tempSum[4];      // Carry-out (5th bit)
                
                // Negative flag (MSB of result indicates negative in 2's complement)
                N = result[3];

                // Zero flag (Set to 1 if result is zero)
                Z = (result == 4'b0000);

                // Overflow flag (Set if there is a 2's complement overflow)
                V = (~a[3] & ~b[3] & result[3]) | (a[3] & b[3] & ~result[3]);
            end
            AND: begin
                result = a & b;           // Bitwise AND
                N = result[3];            // Negative flag
                Z = (result == 4'b0000);   // Zero flag
                V = 0;                    // No overflow for logical operations
            end
            OR: begin
                result = a | b;           // Bitwise OR
                N = result[3];            // Negative flag
                Z = (result == 4'b0000);   // Zero flag
                V = 0;                    // No overflow for logical operations
            end
            XOR: begin
                result = a ^ b;           // Bitwise XOR
                N = result[3];            // Negative flag
                Z = (result == 4'b0000);   // Zero flag
                V = 0;                    // No overflow for logical operations
            end
            default: begin
                result = 4'b0000;         // Default result in case of invalid fn value
                cOut = 0;
                N = 0;
                Z = 1;                    // Zero flag is set when result is default
                V = 0;                    // No overflow for default case
            end
        endcase
    end

endmodule

// Testbench for ALU
module testALU;
    logic [8:0]  count;           // Count used to generate test cases
    logic [3:0]  resultOut;       // ALU output
    logic        Nout, Zout, Vout, carryOut;  // ALU status flags
    mode         fn;              // ALU function selector

    // Count structure:
    // msb[8]                                  lsb[0]
    // -----------------------------------------------------
    // |     |     |     |     |     |     |     |     |     |
    // |     |     |     |     |     |     |     |     |     |
    // -----------------------------------------------------
    // |-cIn-|-----------a-----------|-----------b-----------| 

    // Instantiate ALU
    myALU alu0(
        .a(count[7:4]),
        .b(count[3:0]),
        .cIn(count[8]),
        .result(resultOut),
        .cOut(carryOut),
        .fn(fn),
        .N(Nout),
        .Z(Zout),
        .V(Vout)
    );

    // Testbench initialization and main testing loop
    initial begin
        // Display initial message
        $display("Starting ALU testbench...");

        // Loop through all ALU functions (ADD, AND, OR, XOR)
        // Explicitly iterate through the enum values for `fn`
        for (fn = ADD; fn <= XOR; fn = mode'(fn + 1)) begin
            // Test for each function
            // Loop over the inputs, testing different values for 'a', 'b', and 'cIn'
            for (count = 0; count <= ((fn == ADD) ? 511 : 255); count++) begin
                #1;  // Small delay for simulation

                $display("Testing function: %b", fn);   // Display the current function
                $display("Testing inputs: a=%b, b=%b, cIn=%b", count[7:4], count[3:0], count[8]);  // Display the current inputs

                // Test the ALU output for each function
                case (fn)
                    ADD: if ({carryOut, resultOut} !== (count[7:4] + count[3:0] + count[8])) 
                            $display("ADD Error: %d != %d + %d + %d", {carryOut, resultOut}, count[7:4], count[3:0], count[8]);
                    AND: if (resultOut !== (count[7:4] & count[3:0])) 
                            $display("AND Error: %d != %d & %d", resultOut, count[7:4], count[3:0]);
                    OR:  if (resultOut !== (count[7:4] | count[3:0])) 
                            $display("OR Error: %d != %d | %d", resultOut, count[7:4], count[3:0]);
                    XOR: if (resultOut !== (count[7:4] ^ count[3:0])) 
                            $display("XOR Error: %d != %d ^ %d", resultOut, count[7:4], count[3:0]);
                    default: begin
                        $display("Error: Undefined fn value at time %0t", $time);  // Default error case
                    end
                endcase
            end
        end
        // End the simulation
        // $finish;
    end

endmodule
