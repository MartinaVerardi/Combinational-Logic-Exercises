<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">ALU (Arithmetic Logic Unit)</h3>

  <p align="center">
    A 4-bit ALU that supports arithmetic and logical operations with status flags for Negative, Zero, Overflow, and Carry-out.
    <br />
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#module-breakdown">Module Breakdown</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#future-improvements">Future Improvements</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

This project implements a **4-bit Arithmetic Logic Unit (ALU)** that supports four operations:
- **ADD (00)**: Addition with carry-in support
- **AND (01)**: Bitwise AND
- **OR (10)**: Bitwise OR
- **XOR (11)**: Bitwise XOR

The ALU also includes status flags for:
- **Negative (N)**: Indicates if the result is negative.
- **Zero (Z)**: Indicates if the result is zero.
- **Overflow (V)**: Indicates if an overflow occurred during the operation.
- **Carry-out (cOut)**: Indicates if a carry was generated during the operation.

It takes two 4-bit inputs (`a` and `b`), a carry-in (`cIn`), and outputs a 4-bit result. The operation mode is selected using a 2-bit function selector (`fn`).

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- FEATURES -->
## Features
- Supports arithmetic and logical operations
- Implements carry-in and carry-out for addition
- Sets flags for negative, zero, and overflow conditions
- Includes a **testbench** for automated verification of operations

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MODULE BREAKDOWN -->
## Module Breakdown

### ALU Module

This module performs arithmetic and logical operations based on the `fn` selector.

**Inputs:**
- `a[3:0]`: 4-bit input operand A
- `b[3:0]`: 4-bit input operand B
- `cIn`: Carry-in input for addition
- `fn[1:0]`: 2-bit function selector that chooses the operation (ADD, AND, OR, XOR)

**Outputs:**
- `result[3:0]`: 4-bit result of the operation
- `N`: Negative flag
- `Z`: Zero flag
- `V`: Overflow flag
- `cOut`: Carry-out flag

### Testbench

The testbench provides automatic validation for the ALU's operations by testing all possible cases, ensuring the ALU behaves as expected for each operation and condition.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE -->
## Usage

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/combinational-logic-exercises.git
