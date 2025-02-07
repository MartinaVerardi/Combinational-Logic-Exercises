# ALU (Arithmetic Logic Unit)  

## Description  
This project implements a 4-bit Arithmetic Logic Unit (ALU) with four operations:  
- **ADD (00)** – Addition with carry-in support  
- **AND (01)** – Bitwise AND  
- **OR (10)** – Bitwise OR  
- **XOR (11)** – Bitwise XOR  

The ALU includes status flags for **Negative (N), Zero (Z), Overflow (V),** and **Carry-out (cOut)**. It takes two 4-bit inputs (`a` and `b`), a carry-in (`cIn`), and outputs a 4-bit result. The operation mode is selected using a 2-bit function selector (`fn`).  

## Features  
- Supports arithmetic and logical operations  
- Implements a carry-in and carry-out for addition  
- Sets flags for negative, zero, and overflow conditions  
- Uses a **testbench** for automated verification of operations  

## Known Issues  
🚨 **Bug Alert:**  
- The loop in the testbench does **not exit** correctly when `fn == ADD`.  
- The code is **still in progress**, and improvements are being made to address this issue.  

## Usage  
This Verilog module can be used in FPGA designs or simulations to perform basic ALU operations. The testbench provides automatic validation of results for all operations.  

## Future Improvements  
- Fix the loop exit condition for `fn == ADD`  
- Optimize test cases for better efficiency  
- Add more edge case testing  
