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
