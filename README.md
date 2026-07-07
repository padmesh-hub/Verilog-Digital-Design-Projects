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
