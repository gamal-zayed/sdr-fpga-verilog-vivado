module four_to_one_mux_structural (
    input I0,
    input I1,
    input I2,
    input I3,
    input S1,
    input S0,
    output Y
);

    // Internal wires to connect the stages of 2-to-1 MUXs.
    wire W1; // Output of the first 2x1 MUX (selects between I0/I1)
    wire W2; // Output of the second 2x1 MUX (selects between I2/I3)

    // Stage 1: Two 2x1 MUXs controlled by S0
    // UUT1: Selects between I0 and I1
    two_to_one_mux_structural UUT1 (
        .A (I0),
        .B (I1),
        .S (S0),
        .Y (W1)
    );

    // UUT2: Selects between I2 and I3
    two_to_one_mux_structural UUT2 (
        .A (I2),
        .B (I3),
        .S (S0),
        .Y (W2)
    );

    // Stage 2: One 2x1 MUX controlled by S1
    // UUT3: Selects between the intermediate results W1 and W2
    two_to_one_mux_structural UUT3 (
        .A (W1), // W1 is selected when S1 = 0
        .B (W2), // W2 is selected when S1 = 1
        .S (S1),
        .Y (Y)
    );

endmodule