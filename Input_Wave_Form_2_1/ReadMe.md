<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">Input Wave Forms</h3>

  <p align="center">
    A SystemVerilog module that demonstrates input waveforms for simulating signal behavior over time.
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#module">Module</a></li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This repository contains a **SystemVerilog** module that demonstrates input waveforms. The module simulates a simple scenario with two signal inputs (`a` and `b`), changing their states over time. The waveform transitions are controlled using delays to simulate real-world signal behavior.

### Overview:
The `input_wave_forms` module initializes two logic signals `a` and `b`, and then generates a series of transitions with specific delays. These signals are typically used for testing digital circuits where input waveforms are needed to observe how a circuit responds to changes in its inputs over time.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MODULE -->
## Module

### `input_wave_forms`

This is the main module that generates waveforms for the signals `a` and `b`.

**Signals:**
- `a`: Logic signal, which will toggle between 0 and 1 over time.
- `b`: Logic signal, which will also toggle between 0 and 1 over time.

**Waveform Transitions:**
- `a = 0`, `b = 1` initially.
- After 3 time units, `a = 1`, `b = 0`.
- After 3 more time units, `a = 1`, `b = 1`.
- After 2 more time units, `a = 0`, `b = 1`.
- After 3 more time units, `a = 1`, `b = 0`.
- After 1 more time unit, `a = 0`, `b = 0`.
- Finally, after 5 time units, `a = 0`, `b = 0`.

![Waveform](https://github.com/user-attachments/assets/c5a14fe1-624d-42b2-b83e-21ff11ad7c03)

This sequence creates a simple, timed waveform for two signals (`a` and `b`) to test how a circuit behaves under different conditions.

### Simulation Result:

After simulating the waveform in ModelSim, the resulting signal behavior will appear as follows:

![Simulation Result](https://github.com/user-attachments/assets/b0754733-e834-4837-b175-3170cbd2306f)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE -->
## Usage

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/combinational-logic-exercises.git
