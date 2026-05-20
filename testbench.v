module vending_machine_tb;

reg clk;
reg [1:0] in;
reg rst;

wire out;
wire [1:0] change;

vending_machine uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out),
    .change(change)
);

always #5 clk = ~clk;

initial begin

    $dumpfile("vending_machine.vcd");
    $dumpvars(0,vending_machine_tb);

    clk = 0;
    rst = 1;
    in  = 2'b00;

    #10 rst = 0;

    // Insert 5rs
    #10 in = 2'b01;

    // Insert 10rs
    #10 in = 2'b10;

    #20 $finish;

end

endmodule