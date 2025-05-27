
# Step Motor Controller – FPGA Project

This project implements a fully functional stepper motor controller on an FPGA, with adjustable direction, speed, and step size. The design includes several Verilog modules working together to control a bipolar stepper motor and simulate precise quarter-turns.

🎥 **Project Video**:  
Watch the full explanation and demo here:  
👉 [YouTube - Step Motor Controller](https://www.youtube.com/watch?v=PZxoFN5Q81s)

---

## 🔧 System Overview

The project is built around a **bipolar stepper motor**, controlled by a Verilog design running on an FPGA board.

**Inputs:**
- `sw1`: Direction (1 = right)
- `key3`: Speed control
- `sw2`: Continuous mode (1 = continuous)
- `key1`: Quarter-turn mode (single-step trigger)
- `sw3`: Step size (1 = full step)
- `key0`: Reset

**Outputs (motor coil control):**
- `OUT1` (Yellow)
- `OUT2` (Blue)
- `OUT3` (Green)
- `OUT4` (Red)

**Transformer and board connections:**
- `In1`: GPIO0 (Purple)
- `In2`: GPIO2 (Blue)
- `In3`: GPIO1 (Green)
- `In4`: GPIO3 (Yellow)

---

## ⚙️ Modules Description

### 1. `long_press_count`
- Detects long button presses.
- Outputs a single pulse only when a new long press occurs.

### 2. `counter_press_controller`
- Controls duration of motor pulse for quarter-turn.
- Outputs pulse for 99 cycles (half-step) or 49 cycles (full step).

### 3. `sm_v` & `freq_div`
- Calculates appropriate frequency divider for the desired motor RPM.
- Generates clock signal for motor control based on selected speed and step size.

### 4. `seven_segment`
- Displays speed level using 7-segment output.

### 5. `sm_stepper_controller`
- The main FSM (Finite State Machine) managing motor step signals.
- Determines correct step pattern based on inputs (`dir`, `step`, `turn_on`).

---

## 🧠 Control Logic Summary

- FSM with states `S1`–`S8` controls the motor coils to rotate in the desired direction and step size.
- When not in use (`turn_on == 0`), machine moves to `S9` with output `0000` to avoid overheating the motor.
- Additional OR logic handles enabling the motor only when required (e.g., quarter-step or continuous).

---

## ✅ Simulation

Each module was tested individually in simulation:
- State transitions in `sm_stepper_controller` verified.
- Clock division and signal pulse durations tested for both full and half steps.
- `seven_segment` changes display correctly on button press and reset.

---

## 📦 Applications

Stepper motors like the one in this project are widely used in:
- 3D printers
- Robotics
- Medical devices

This project demonstrates real-time FPGA control over hardware with visible mechanical output, reinforcing core digital design principles.

---

## 📁 Files

- Verilog source files for each module
- Simulation testbenches
- Project schematic
- PDF explanation (Hebrew)
- [🎥 Video explanation on YouTube](https://www.youtube.com/watch?v=PZxoFN5Q81s)

---


