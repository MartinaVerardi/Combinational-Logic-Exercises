<div id="top"></div>
<!--
*** Thanks for checking out the Change Box - Coin Return System project! If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/your_username/Change-Box-Coin-Return-System">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Change Box - Coin Return System</h3>

  <p align="center">
    A system that simulates a change box to return coins as change for purchased items.
    <br />
    <a href="https://github.com/your_username/Change-Box-Coin-Return-System"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/your_username/Change-Box-Coin-Return-System">View Demo</a>
    ·
    <a href="https://github.com/your_username/Change-Box-Coin-Return-System/issues">Report Bug</a>
    ·
    <a href="https://github.com/your_username/Change-Box-Coin-Return-System/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#inputs">Inputs</a></li>
        <li><a href="#outputs">Outputs</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#error-handling">Error Handling</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

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
The module takes inputs of the item's cost and the amount paid, and checks if enough change is available in the change box. If enough change is available, it will return the two largest coins that can be given as change. If not enough money is paid, the system will request the customer to cough up more money. The system will also assert an error if there is not enough change available in the box.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally. To get a local copy up and running follow these simple example steps.

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/your_username/Change-Box-Coin-Return-System.git
