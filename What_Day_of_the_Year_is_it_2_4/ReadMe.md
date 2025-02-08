# Day of the Year Calculator (SystemVerilog)  

## Description  
This project consists of three SystemVerilog modules that progressively calculate the day of the year, considering different levels of complexity for leap year calculations.  

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

## Usage  
Each file represents a progressive improvement of the day-of-year calculation. Simulate the modules in a SystemVerilog environment (e.g., ModelSim or Vivado) to verify correctness. The testbench in part C provides automated validation for various years.  

## Future Improvements  
- Extend functionality to support dynamic month length handling.  
- Optimize logic for efficiency in FPGA/ASIC implementations.  
