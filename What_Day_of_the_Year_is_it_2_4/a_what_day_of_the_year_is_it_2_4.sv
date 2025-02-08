/*

A) Write a SystemVerilog module that calculates the day of the year, e.g.,
   February 1 would be the 32nd day of the year. Ignore leap years for now.
   The header for the module is:

   module dayInYrCalc
   (
       input logic [5:0] dayOfMonth,
       input logic [3:0] month,
       output logic [8:0] dayOfYear;
   );

*/

// Module to calculate the number of days before a given month
module countDays
    (
        input logic [3:0] monthNumber,  // Month number (1-12)
        output logic [8:0] daysOffset    // Accumulated days before the given month
    );

    // Array storing the number of days in each month (ignoring leap years)
    daysOfTheMonths = '{0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30};

    // Temporary variable to store the sum of the days
    tempSum = 0;

    // Initial block to compute the total number of days before the given month
    initial begin

        // Loop to sum the days of the months before the given month
        for (int i = 0; i <= int'(monthNumber - 1); i++) begin
            tempSum = tempSum + daysOfTheMonths[i];  // Add the days of each month
        end

        // Output the total days accumulated before the current month
        daysOffset = tempSum;

    end

endmodule

// Main module to calculate the day of the year based on the month and the day of the month
module dayInYrCalc
    (
        input logic [5:0] dayOfMonth,  // Day of the month (1-31)
        input logic [3:0] month,       // Month number (1-12)
        output logic [8:0] dayOfYear   // The calculated day of the year (1-365)
    );

    // Declare the variable to store the days offset before the current month
    int daysOfTheMonths[12];

    // Always block to calculate the day of the year
    always_comb begin

        // Call countDays to calculate the number of days before the current month
        offset = countDays(month);

        // Calculate the final day of the year by adding the day of the month
        dayOfYear = offset + dayOfMonth;

    end

endmodule
