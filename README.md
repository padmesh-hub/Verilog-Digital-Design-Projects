# Verilog-Digital-Design-Projects

1. SR Latch (Asynchronous)
Description: Implemented a basic asynchronous Set-Reset (SR) latch using behavioral Verilog. Because it is level-sensitive and has no clock, outputs respond immediately to changes on the S and R inputs.
Key Concepts: Level-sensitive latching behavior, bistable storage, and the behavior of the invalid/forbidden state (S=1, R=1) where both outputs are driven to the same logic level, breaking the normal complementary relationship between Q and Q̄.
Verification: Developed a functional testbench to apply all input combinations and verify the resulting truth table outputs during simulation.
