`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb;

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.fst");
        $dumpvars (0, tb);
        #1;
    end

    reg clk = 0, reload = 0, restart = 0, pgm_strobe = 0, pgm_data = 0;


    task cycle;
    begin
        #5;
        clk = 1'b1;
        #5;
        clk = 1'b0;
    end
    endtask

    integer i, j;
    initial begin
        restart = 1'b1;
        #100;
        reload = 1'b1;
        restart = 1'b0;
        repeat (1000000) cycle;
    end

    // wire up the inputs and outputs
    wire [7:0] inputs = {3'b000, pgm_data, pgm_strobe, restart, reload, clk};
    wire [7:0] outputs;
    wire mel = outputs[0];

    // instantiate the DUT
    prog_melody_gen mel_i (
        .io_in  (inputs),
        .io_out (outputs)
        );

endmodule
