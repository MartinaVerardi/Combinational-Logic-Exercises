/* 

B) Now consider leap years. First, we'll (incorrectly) define leap years 
to be years that are evenly divisible by 4, i.e., the reminder is 0. 
The new module header is written below:

module dayIfYrCalc
    (
    input logic [5:0] dayOfMonth,
    input logic [3:0] month,
    input logic [10:0] year,
    output logic [8:0] dayOfYear;
    );


HINT: Think about what it means to divide by a power of the base. Don't use the divider operator.

*/