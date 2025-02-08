/* 

C) Now to a more complete definition. Leap Years are years that are evenly divisible by 4
except for century years (like 1900) that are not also divisible by 400 (like 2000).
So, 1900 was not a leaap year, but 2000 was. Extend the module in part B to consider this definition. 
Use a testbench to test the years between 1600 and 2020.

module dayIfYrCalc
    (
    input logic [5:0] dayOfMonth,
    input logic [3:0] month,
    input logic [10:0] year,
    output logic [8:0] dayOfYear;
    );


HINT: Think about what it means to divide by a power of the base. Don't use the divider operator.

*/