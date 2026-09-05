# RISC-V Assembly Language: Partial Sum of Cubes Calculator

![ISA](https://img.shields.io/badge/ISA-RISC--V%20(RV32I)-blue)
![Simulator](https://img.shields.io/badge/Simulator-RARS-orange)

## 📌 Project Overview
This project implements a RISC-V assembly language program developed for the **CS250 Computer Organization** course at Yuan Ze University. 

The application calculates the **Partial Sum of Cubes** for a given integer range $[A, B]$ ($A^3 + (A+1)^3 + \dots + B^3$), verifies if the resulting sum is a **Perfect Square Number**, and handles input edge-cases efficiently.

---

## 🚀 Key Features

1. **Partial Sum of Cubes Calculation**: Efficiently computes $\sum_{i=A}^{B} i^3$ using hardware multiplication instructions (`mul`).
2. **Perfect Square Verification**: Checks whether the sum is a perfect square ($N = k^2$) using an iterative register-based search algorithm.
3. **Fool-Proofing Mechanism**: Automatically detects and handles inverted input boundaries ($A > B$) by swapping values before computation.
4. **Dynamic Output Formatting**: Intelligently renders output expressions based on the range length:
   - Range = 1: `1^3=1`
   - Range = 2: `2^3+3^3=35`
   - Range $\ge$ 3: `1^3+2^3+...+9^3=2025`

---

## 🛠️ Execution & Testing Instructions

### Prerequisites
- **Simulator**: [RARS (RISC-V Assembler, Simulator, and Runtime)](https://github.com/TheGrandNations/rars)
- **Environment**: Java Runtime Environment (JRE) 8+

### Steps to Run
1. Download `rars.jar` and launch the simulator.
2. Open `main.asm` in RARS.
3. Click **Assemble** (F3) and **Run** (F5).
4. Enter integer values for $A$ and $B$ in the RARS Execute console.

---

## 📊 Sample Execution Output

### Example 1: Perfect Square Range ($A=1, B=9$)
```text
s1121513
input number A=1
input number B=9
Partial Sum of Cubes=2025
2025=45*45
It is a perfect square number
1^3+2^3+...+9^3=2025
```

### Example 2: Non-Perfect Square Range ($A=2, B=3$)
```text
s1121513
input number A=2
input number B=3
Partial Sum of Cubes=35
It is not a perfect square number
2^3+3^3=35
```