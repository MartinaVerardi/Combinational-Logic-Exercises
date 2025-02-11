# Change Box - Coin Return System

This project simulates a change box that returns coins as change for a purchased item. The system checks if the customer has provided enough money and determines the coins to return as change.

### Inputs:
1. **Cost [3:0]**: Four-bit input representing the cost of the item in increments of $0.05. The maximum value is 75 cents.
2. **Paid [3:0]**: Four-bit input representing the amount of money paid by the customer in increments of $0.05. The maximum value is 75 cents.
3. **Quarters [1:0]**: Two-bit input representing the number of quarters (25 cents) available in the change box.
4. **Dimes [1:0]**: Two-bit input representing the number of dimes (10 cents) available in the change box.
5. **Nickels [1:0]**: Two-bit input representing the number of nickels (5 cents) available in the change box.

### Outputs:
1. **FirstCoin [2:0]**: Indicates the largest coin to return (either nickel, dime, or quarter).
   - 3'b001: Nickel
   - 3'b010: Dime
   - 3'b101: Quarter
   - 3'b000: No change (no coins to give)
2. **SecondCoin [2:0]**: Indicates the second largest coin to return, following the same encoding as `FirstCoin`.
3. **NotEnoughChange**: A single-bit output that asserts when there is not enough change in the box to provide the required change.
4. **ExactAmmount**: A single-bit output that asserts when the paid amount is exactly equal to the cost of the item.
5. **CoughUpMore**: A single-bit output that asserts when the paid amount is less than the cost of the item.
6. **Remaining [3:0]**: The remaining amount, in nickels, that still needs to be returned to the customer if change is owed.

### Description:
- The module takes inputs of the item's cost and the amount paid, and checks if enough change is available in the change box. 
- If enough change is available, it will return the two largest coins that can be given as change.
- If not enough money is paid, the system will request the customer to cough up more money.
- The system will also assert an error if there is not enough change available in the box.

### Example Workflow:
1. The customer buys an item costing 30 cents.
2. They pay with 50 cents.
3. The system checks the change box for available coins.
4. The system returns 1 quarter (25 cents) and 1 nickel (5 cents) as change.

### Error Handling:
- The system will assert an error if invalid input values are provided or if not enough change is available.

### Usage:
To simulate the change box, instantiate the `ChangeBox` module and provide the inputs for `Cost`, `Paid`, and the available coins (`Quarters`, `Dimes`, `Nickels`). Observe the outputs `FirstCoin`, `SecondCoin`, `NotEnoughChange`, `ExactAmmount`, `CoughUpMore`, and `Remaining`.

