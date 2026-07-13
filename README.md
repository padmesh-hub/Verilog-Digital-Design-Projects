# Verilog-Digital-Design-Projects

1. SR Latch (Asynchronous)
Description: Implemented a basic asynchronous Set-Reset (SR) latch using behavioral Verilog. Because it is level-sensitive and has no clock, outputs respond immediately to changes on the S and R inputs.
Key Concepts: Level-sensitive latching behavior, bistable storage, and the behavior of the invalid/forbidden state (S=1, R=1) where both outputs are driven to the same logic level, breaking the normal complementary relationship between Q and Q̄.
Verification: Developed a functional testbench to apply all input combinations and verify the resulting truth table outputs during simulation.

2. SR Flip-Flop (FSM Approach)
Description: Implemented a synchronous Set-Reset (SR) flip-flop modeled explicitly as a Finite State Machine (FSM) using behavioral Verilog. Unlike an asynchronous latch, this design is edge-triggered by a clock signal, meaning state transitions occur only on the rising edge of the clock based on the present state and current inputs.
Key Concepts: Clock-edge synchronization, active-high synchronous reset logic, two-state sequential modeling (s0 and s1), and deterministic next-state decoding using a combinational case statement that forces an unknown logic level (1'bx) during the forbidden state (S=1, R=1).
Verification: Developed a functional testbench including automated clock generation and sequential stimulus injection to walk the design through hold, reset, set, and forbidden operational phases during simulation.

3. D Flip-Flop (FSM Approach)
Description: Implemented a synchronous D (Data) flip-flop modeled explicitly as a Finite State Machine (FSM) using behavioral Verilog. The design utilizes an edge-triggered sequential structure where the output captures the value of the D input at the rising edge of the clock and holds it until the next active clock edge.
Key Concepts: Edge-triggered state transitions, active-high asynchronous reset logic (posedge rst), two-state sequential modeling (s0 and s1), and a decoupled three-block FSM design pattern (separating state transitions, next-state combinational logic, and output decode logic to maintain strict complementary behavior between q and qbar).
Verification: Implemented a testbench structure to assert an initial asynchronous reset condition and dynamically toggle the data input relative to the clock edges to confirm deterministic input tracking and stable state retention.

4. JK Flip-Flop (FSM Approach)
Description: Implemented a synchronous JK flip-flop modeled explicitly as a Finite State Machine (FSM) using behavioral Verilog. This design overcomes the invalid state limitation of a standard SR flip-flop by enabling a deterministic toggle behavior when both execution control inputs are asserted simultaneously.
Key Concepts: Synchronous active-high reset logic, concatenation-based input bus decoding (i = {j, k}), two-state sequential modeling (s0 and s1), and explicit implementation of the complete state transition matrix (Hold 00, Reset 01, Set 10, and Toggle 11) using a robust multi-block FSM style.
Verification: Formulated a functional testbench to verify sequential operations across changing state bounds, focusing closely on tracking the active clock edges to validate correct state inversion during continuous toggle conditions.

5. T Flip-Flop (FSM Approach)
Description: Implemented a synchronous T (Toggle) flip-flop modeled explicitly as a Finite State Machine (FSM) using behavioral Verilog. This sequential module serves as a frequency divider or binary counter element, altering its internal logic state on the rising edge of the clock signal whenever the toggle input t is high, and holding its previous value when t is low.
Key Concepts: Asynchronous active-high reset logic (posedge rst), two-state sequential state-machine mapping (s0 and s1), conditional state inversion based on single-wire control logic, and a fully modular three-block FSM coding style to prevent the synthesis of unintended memory latches for the combinational output paths.
Verification: Formulated a functional testbench to verify correct operational response across diverse input transitions, focusing on confirming stable hold cycles when t = 0 and predictable state inversion behavior at consecutive clock edges when t = 1.

6. Multi-Pattern 2-Bit Sequence Detector (FSM Approach)
Description: Designed and implemented a synchronous multi-pattern sequence detector using behavioral Verilog to evaluate a 2-bit wide parallel input bus i[1:0]. This FSM architectures scans incoming binary vectors to detect occurrences of three target sequences: 1100, 1010, or 1001, cleanly driving the output flag z high upon pattern match.
Key Concepts: Parallel 2-bit multi-branch decoding, 4-state sequential modeling (s0 to s3), Moore-type state machine formatting where the output dependency is isolated purely to the present state, and asynchronous active-high hardware reset control.
Verification: Formulated a comprehensive functional testbench to inject continuous, back-to-back 2-bit symbol sequences into the module, verifying error-free state traversal and precise assertion of the output flag at the terminal state s3.

7. 4-Bit Universal Shift Register (Synchronous with Asynchronous Reset)
Description: Implemented a highly flexible, fully synthesizable 4-bit universal shift register using behavioral Verilog. The module unifies four distinct data-path operations—SISO, SIPO, PISO, and PIPO—into a single component capable of executing bit movements in both Left-to-Right (L2R) and Right-to-Left (R2L) directions based on a 3-bit operational routing control signal (mode). While the data shifting operations run synchronously with the master clock, the system includes an overriding asynchronous master reset.

Key Concepts:Asynchronous Reset Control: Employs an asynchronous active-high reset (posedge rst in the sensitivity list). This ensures that the moment the reset signal transitions from low to high, the internal storage array and all output pins are instantly cleared to absolute zero, completely bypassing the clock edge.
Bidirectional Data Concatenation: Uses Verilog concatenation operators ({}) inside the synchronous block to smoothly shift bits across register boundaries on the active clock edge (e.g., {b_in, temp[3:1]} for L2R and {temp[2:0], b_in} for R2L).
Zero-Lag SIPO Simulation Sync: Eliminates the typical 1-clock-cycle non-blocking assignment (<=) timing lag during verification by driving the evaluated shift concatenation directly to both the internal storage array (temp) and the external parallel output bus (w_out) simultaneously. This ensures the testbench reads updated data on the exact same clock edge it enters.
Synchronous Safe-Latch Data Holding: Employs a load signal acting as a clock-enable barrier. In PISO mode, it coordinates the switch between parallel data capture and serial bit extraction. In PIPO mode, pulling load = 0 creates a hardware hold state, isolating the flip-flops and shielding the stored data from dynamic combinational noise or toggling occurring on the w_in pins.

Verification: Developed a chronological, single-loop verification testbench (tb_universal_register.v) to systematically validate all seven operational pathways. The simulation flow executes an immediate asynchronous reset check to verify edge-independent clearing, runs a PIPO data capture and retention test to verify the hardware hold state, streams serial bits over individual clock edges to verify SIPO parallel bus growth, and toggles control pins to extract parallel arrays out of the single serial output line (b_out) using precise 1-clock-cycle delay steps (#20).

8. Mod-4 Up/Down Counter (Synchronous)
Description: Implemented a hardware-efficient 2-bit (Mod-4) synchronous up/down counter using sequential Verilog HDL. Because the design is edge-triggered, all internal state transitions occur deterministically and simultaneously on the rising edge of the system clock.

Key Concepts: Edge-triggered register allocation, synchronous reset execution (eliminating asynchronous layout hazards), count-enable isolation to prevent unnecessary signal switching, and dynamic mode configuration to control directional progression without introducing combinational logic glitches.

Verification: Developed a self-contained testbench to simulate the hardware across multiple clock cycles, confirming proper operation of the active-high reset sequence, verifying uninterrupted up/down counting boundaries, and validating steady-state hold performance when the design is disabled.

9.VGA Controller (Synchronous with Active-High Sync)
Description: Implemented a synchronous 640x480 @ 60Hz VGA controller using behavioral Verilog tailored for hardware implementations. Unlike basic asynchronous designs, all counter updates and register transitions are tightly synchronized to a 100 MHz master clock domain using a glitcheless 25 MHz pixel clock enable pulse.

Key Concepts: Clock enable generation rather than logic-generated clocks to prevent timing violations, active-high synchronization pulse windows (hsync and vsync) restricted precisely to horizontal and vertical retrace boundaries, and real-time generation of visible region logic flags (video_on) to gate digital-to-analog color output.

Verification: Created a comprehensive top-level test wrapper module to map internal logic to physical hardware constraints (switches, buttons, and VGA ports) alongside a behavioral testbench to simulate the 100 MHz clock stimulus, verifying precise counter roll-overs and pulse widths via waveform analysis before physical deployment.

10. Overlapping 101101 Sequence Detector (Mealy & Moore FSMs)
Description: Implemented a robust sequence detector using Finite State Machine (FSM) methodologies to recognize the specific overlapping bit pattern 101101. The repository showcases two distinct architectural approaches: a highly efficient 6-state Mealy machine with fully synchronized, glitch-free outputs, and a 7-state Moore machine utilizing state-splitting principles to isolate output behavior purely within the current state.

Key Concepts:
   Overlapping Pattern Recognition: Tracks historical bit streams to instantly reuse the trailing suffix 101 of a successful detection as the leading prefix for      the subsequent target sequence, optimizing detection latency.
   State Minimization & Equivalency: Demonstrates that a Mealy architecture requires exactly N states (6 states) for an N-bit sequence, whereas a Moore               architecture necessitates N+1 states (7 states) to handle output isolation without redundant logic paths.
   Synchronous Hazard Mitigation: Resolves the classical hazard of asynchronous combinational output glitching inherent to standard Mealy designs by driving          the output register through a dedicated sequential block synchronized to the clock edge.

Verification: Developed an advanced testbench utilizing custom, phase-shifted manual timing delays to feed the composite overlapping stream 101101101. By scheduling data transitions precisely within the low-phase of the clock cycle, the setup completely eliminates simulator edge-race conditions, verifying perfectly aligned, clock-synchronized double-detection waveforms in Vivado.
