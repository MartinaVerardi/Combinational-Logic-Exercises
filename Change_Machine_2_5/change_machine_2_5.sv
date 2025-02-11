/*

Assume that a Change Box exist that's stocked with a number of nickels, dimes, and quarters
to return as change. Next assume that you are given a price of an item and an ammount of money that's
been paid by the costumer. You're going to design a combinational logic that does 2 things:

- Determine if there's enough money in the change box to make complete change.
- Determine the two largest single coins that should be given out as part of the change.

More specifically, from the inputs specified below, generate the specified combinational outputs.
As listed here, there will be 5 multi-bit inputs and 6 multi-bit output for your circuit. 
Each of the inputs and outputs are described below:

- Cost [3:0]: Four-bit input representing the cost of the item purchesed in increments of $0.05.
  In other words, this number tells you how many nickels the item costs. This number is unsigned. 
  No pennies allowed! The max cost is 15*5 = 75 cents.
 
- Paid [3:0]: Four-bit input rapresenting the ammount of money paid by the costumer in increments
  of $0.05. Again, no pennies. This number is unsigned. The maximumammount paid is 15*5 = 75 cents.

- Quarters [1:0]: Two-bit input (unsigned) rapresenting the number of quarters in the change box.

- Dimes [1:0]: Two-bit input (unsigned) rapresenting the number of dimes in the change box.

- Nickels [1:0]: Two-bit input (unsigned) rapresenting the number of nickels in the change box.

- FirstCoin [2:0]: This output is the value (in nickels) of the first coin to be returned.
  This can have the values 3'b001, 3'b010, 3'b101 indicating nickel, dime, or quarter, rispectively. 
  It can also have the value 3'b000 indicating that no coins should be given (no change is necessary).
  This should be the largest coin that can be returned aad which is available in the change box. 
  For example, if the person is due 15 cents first coin should indicate 3'b010 meaning that a dime 
  should be returned. But it will only indicate that if there is a dime available. If there is no dime
  available, the FirstCoin should indicate a nickel.

- SecondCoin [2:0]: This output is the value (in nickels) of the first coin to be returned.
  This can have the values 3'b001, 3'b010, 3'b101 indicating nickel, dime, or quarter, rispectively. 
  It can also have the value 3'b000 indicating that no coins should be given (no change is necessary).
  This should be the largest coin that can be returned aad which is available in the change box. 
  For example, if the person is due 20 cents, FirstCoin should indicate a dime (assuming there is one) 
  and SecondCoin should indicate a dime as well (assuming there is a second one). If there are no dimes
  then for both FirstCoin and SecondCoin should both indicate nickel (assuming nickels are availables).
  (And of course, in this case the person won't get the full change).

- ExactAmmount: This is a single-bit output that, when asserted, indicates that the ammount entered 
  is equal to the cost. Thus no change is necessary.

- NotEnoughChange: This is a single-bit output that, when asserted, indicates that change was needed
  and we did not have it. We were out of the necessary coins to make the complete change. 
  (Note that this has nothing to do with giving 2 nickels instead of a dime. The issue here is that 
  we owe that person something - they might pounch out the machine!)

- CoughUpMore: This is a single-bit output that, when asserted, indicates that Paid is less than Cost.

- Remaining [3:0]: This is the ammount in nickels that indicates how much is left to give to the person
  in change

*/

module CheckIfCoinPresent(
    input logic [3:0] coin,
    input logic [1:0] Quarters, // 15 cents
    input logic [1:0] Dimes, // 10 cents
    input logic [1:0] Nickels, // 5 cents
    output logic coinPresent
);
    // Check if the requested coin value is available in the change box
    always_comb begin
        coinPresent = 0;
        unique case(coin)
            4'd15: if (Quarters > 0) coinPresent = 1;
            4'd10: if (Dimes > 0) coinPresent = 1;
            4'd5: if (Nickels > 0) coinPresent = 1;
        endcase
    end
endmodule

module CountChange(
    input logic [3:0] Cost,
    input logic [3:0] Paid,
    input logic [1:0] Quarters, // 15 cents
    input logic [1:0] Dimes, // 10 cents
    input logic [1:0] Nickels, // 5 cents
    output logic NotEnoughChange,
    output logic [2:0] FirstCoin,
    output logic [2:0] SecondCoin,
    output logic [3:0] Remaining
);
    always_comb begin
        NotEnoughChange = 0;
        FirstCoin = 3'b000;
        SecondCoin = 3'b000;
        Remaining = Paid - Cost;

        // Determine the largest possible coin to return first
        if (Remaining > 0) begin
            if (Remaining >= 15 && Quarters > 0) begin
                FirstCoin = 3'b101;
                Remaining -= 15;
                if (Remaining >= 15 && Quarters > 1) begin
                    SecondCoin = 3'b101;
                    Remaining -= 15;
                end
            end
            if (Remaining >= 10 && Dimes > 0) begin
                if (FirstCoin == 3'b000)
                    FirstCoin = 3'b010;
                else
                    SecondCoin = 3'b010;
                Remaining -= 10;
            end
            if (Remaining >= 5 && Nickels > 0) begin
                if (FirstCoin == 3'b000)
                    FirstCoin = 3'b001;
                else
                    SecondCoin = 3'b001;
                Remaining -= 5;
            end
            // If we still owe money, set NotEnoughChange flag
            if (Remaining > 0)
                NotEnoughChange = 1;
        end
    end
endmodule

module CostVsPaid(
    input logic [3:0] Cost,
    input logic [3:0] Paid,
    output logic ExactAmmount,
    output logic CoughUpMore
);
    // Determine if exact amount was paid or if more money is needed
    always_comb begin
        ExactAmmount = (Cost == Paid);
        CoughUpMore = (Cost > Paid);
    end
endmodule

module ChangeBox(
    input logic [3:0] Cost,
    input logic [3:0] Paid,
    input logic [1:0] Quarters,
    input logic [1:0] Dimes,
    input logic [1:0] Nickels,
    output logic [2:0] FirstCoin,
    output logic [2:0] SecondCoin,
    output logic NotEnoughChange,
    output logic ExactAmmount,
    output logic CoughUpMore,
    output logic [3:0] Remaining
);
    always_comb begin
        // Validate inputs
        if (Cost > 15 || Paid > 15 || Quarters > 3 || Dimes > 3 || Nickels > 3) begin
            $fatal("ERROR!! Invalid input values.");
        end

        // Check if exact amount was paid or more money is required
        CostVsPaid compare(.Cost(Cost), .Paid(Paid), .ExactAmmount(ExactAmmount), .CoughUpMore(CoughUpMore));

        // If exact amount was paid, no change is needed
        if (ExactAmmount) begin
            FirstCoin = 3'b000;
            SecondCoin = 3'b000;
            NotEnoughChange = 0;
            Remaining = 0;
        end else if (CoughUpMore) begin
            // If not enough money was paid, display error and exit
            FirstCoin = 3'b000;
            SecondCoin = 3'b000;
            NotEnoughChange = 0;
            Remaining = 0;
            $display("ERROR!! Not enough money.");
        end else begin
            // Calculate change
            CountChange compute(.Cost(Cost), .Paid(Paid), .Quarters(Quarters), .Dimes(Dimes), .Nickels(Nickels),
                               .NotEnoughChange(NotEnoughChange), .FirstCoin(FirstCoin), .SecondCoin(SecondCoin), .Remaining(Remaining));
        end
    end
endmodule