module module_1(
 input in0, in1, sel,
 output out);
assign out = (~sel & in0) | (sel & in1);
endmodule