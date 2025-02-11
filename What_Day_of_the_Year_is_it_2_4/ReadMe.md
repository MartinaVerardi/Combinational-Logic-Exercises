<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">Day of the Year Calculator (SystemVerilog)</h3>

  <p align="center">
    A series of SystemVerilog modules that progressively calculate the day of the year, considering leap year calculations at various levels.
    <br />
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#files-and-functionality">Files and Functionality</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#future-improvements">Future Improvements</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

This project consists of three **SystemVerilog** modules that progressively calculate the day of the year, incorporating different levels of complexity in leap year calculations.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- FILES AND FUNCTIONALITY -->
## Files and Functionality

### A) Basic Day of Year Calculation  
**File:** `a_what_day_of_the_year_is_it_2_4.sv`  
- Computes the day of the year given a day and month.  
- Ignores leap years.

### B) Simple Leap Year Consideration  
**File:** `b_what_day_of_the_year_is_it_2_4.sv`  
- Extends the basic calculation by considering leap years.  
- Defines a leap year as any year divisible by 4 (incorrect but a common approximation).  
- Does not use the division operator explicitly.

### C) Complete Leap Year Rule  
**File:** `c_what_day_of_the_year_is_it_2_4.sv`  
- Implements the correct leap year definition:  
  - A year is a leap year if divisible by 4 **unless** it is a century year not divisible by 400.  
  - Example: 1900 was **not** a leap year, but 2000 **was**.  
- Includes a testbench to verify calculations for years between 1600 and 2020.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE -->
## Usage

Each file represents a progressive improvement of the day-of-year calculation. Simulate the modules in a SystemVerilog environment (e.g., ModelSim or Vivado) to verify correctness. The testbench in part C provides automated validation for various years.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- FUTURE IMPROVEMENTS -->
## Future Improvements
- Extend functionality to support dynamic month length handling.  
- Optimize logic for efficiency in FPGA/ASIC implementations.

<p align="right">(<a href="#top">back to top</a>)</p>
