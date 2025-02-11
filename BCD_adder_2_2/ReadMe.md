<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">BCD Adder</h3>

  <p align="center">
    A SystemVerilog implementation of a Binary-Coded Decimal (BCD) Adder, which adds two 4-bit BCD numbers with a carry-in.
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#modules">Modules</a></li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This repository contains a **SystemVerilog** implementation of a **Binary-Coded Decimal (BCD) Adder**. The BCD adder calculates the sum of two 4-bit BCD numbers and a carry-in, producing a 4-bit sum and a carry-out that indicates any overflow to the next higher BCD digit.

### Overview:
The BCD adder module adds two 4-bit BCD numbers and a carry-in value, performing the addition with handling for BCD-specific overflow. If the sum exceeds 9 (1001 in binary), the result is adjusted by adding 6 (0110) to make it a valid BCD value.

The adder is composed of:
- **Four 1-bit adders** to handle the addition of the individual BCD digits.
- **Carry management** for handling overflows from one digit to the next.

The project also includes a **testbench** to demonstrate the functionality and correctness of the BCD adder.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MODULES -->
## Modules

### `bcdAdd`

This is the top-level module that instantiates the 1-bit adders for each bit of the BCD digits.

**Inputs:**
- `a[3:0]`: 4-bit BCD number 1.
- `b[3:0]`: 4-bit BCD number 2.
- `carryIn`: The carry input for the addition.

**Outputs:**
- `sum[3:0]`: The 4-bit sum output, which is the BCD result.
- `carryOut`: The carry output for overflow to the next higher digit.

### `adder`

This module handles the addition of two 1-bit values along with the carry-in, producing a 1-bit sum and a carry-out.

**Inputs:**
- `a`: 1-bit BCD digit.
- `b`: 1-bit BCD digit.
- `cI`: Carry input.

**Outputs:**
- `sum`: 1-bit sum output.
- `cO`: Carry output.

### `testbench`

The testbench module generates test cases and checks if the output sum and carry are correct for a range of input values.

**Simulation Logic:**
- Loops through all possible combinations of the 8-bit inputs.
- Compares the result to the expected sum and carry, displaying any discrepancies.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE -->
## Usage

1. Clone the repository to your local machine.
   ```bash
   git clone https://github.com/your-username/combinational-logic-exercises.git
