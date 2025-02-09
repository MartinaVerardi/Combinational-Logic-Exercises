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

module isItLeap
    (
        input logic [10:0] year,
        output logic leap
    );

    leap = 0;

    initial begin

        // Checking if the year is divisible by 4 (simplified leap year rule)
        if (year[1:0] == 0) leap = 1;
        else leap = 0;

    end

endmodule

// Module to calculate the number of days before a given month
module countDays
    (
        input logic [3:0] monthNumber,  // Month number (1-12)
        input [12] offsetDaysOfMonth,   // Array holding the cumulative day offsets for each month
        output logic [8:0] daysOffset    // Accumulated days before the given month
    );

    // Temporary variable to store the sum of the days
    logic [8:0] tempSum = 0;

    // Initial block to compute the total number of days before the given month
    initial begin

        // Loop to sum the days of the months before the given month
        for (int i = 0; i <= int'(monthNumber - 1); i++) begin
            tempSum = tempSum + offsetDaysOfMonth[i];  // Add the days of each month
        end

        // Output the total days accumulated before the current month
        daysOffset = tempSum;

    end

endmodule

// Main module to calculate the day of the year based on the given month and day of the month
module dayIfYrCalc
    (
        input logic [5:0] dayOfMonth,  // Day of the month (1-31)
        input logic [3:0] month,       // Month number (1-12)
        input logic [10:0] year,       // Year (to check for leap year)
        output logic [8:0] dayOfYear   // The calculated day of the year (1-366)
    );

    logic [8:0] offset = 0;
    
    // Array holding the cumulative day offsets for each month. The value at each index represents
    // the total number of days that have passed before the given month. For example:
    // - January (index 0) has 0 days before it, so the offset is 0.
    // - February (index 1) has 31 days from January, so the offset is 31.
    // This helps to calculate the correct day of the year by adding the day of the month to the offset.
    logic [8:0] daysOfTheMonths[12] = '{0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30};

    // Always block to calculate the day of the year
    always_comb begin

        if(!(1 < month > 12))
            $fatal("ERROR!! Month should be a number between 1 and 12. Given: %0d", month);

        // Check if February has more than 28 days
        if(month == 2 && dayOfMonth > 28)
            $fatal("ERROR!! Feb has only 28 days!!");

        // Check if months with 31 days (Jan, Mar, May, Jul, Aug, Oct, Dec) have more than 31 days
        else if((month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) && dayOfMonth > 31)
            $fatal("ERROR!! Jen, Mar, May, Jul, Aug, Oct, Dec have only 31 days!!");        

        // Check if months with 30 days (Apr, Jun, Sep, Nov) have more than 30 days
        else if((month == 4 || month == 6 || month == 9 || month == 11) && dayOfMonth > 30)
            $fatal("ERROR!! Jen, Mar, May, Jul, Aug, Oct, Dec have only 30 days!!");  


        leap = isItLeap(year);

        if (leap) daysOfTheMonths[2] = 29;

        // Call countDays to calculate the number of days before the current month
        offset = countDays(month);

        // Calculate the final day of the year by adding the day of the month
        dayOfYear = offset + dayOfMonth;

    end

endmodule