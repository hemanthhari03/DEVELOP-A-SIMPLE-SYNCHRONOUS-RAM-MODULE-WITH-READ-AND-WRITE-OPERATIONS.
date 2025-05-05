// Testbench for sync_ram

module tb_sync_ram;

reg clk;
reg we;
reg [2:0] addr;
reg [7:0] din;
wire [7:0] dout;

// Instantiate RAM
sync_ram uut (
    .clk(clk),
    .we(we),
    .addr(addr),
    .din(din),
    .dout(dout)
);

// Clock generation: 10ns period
always #5 clk = ~clk;

initial begin
    // Monitor signal values
    $monitor("Time=%0t | clk=%b | we=%b | addr=%b | din=%h | dout=%h", $time, clk, we, addr, din, dout);
    
    // Initial values
    clk = 0; we = 0; addr = 3'b000; din = 8'h00;
    
    // Write 3 values to RAM
    #10; we = 1; addr = 3'b000; din = 8'hAA; // Write 0xAA to addr 0
    #10; addr = 3'b001; din = 8'hBB;         // Write 0xBB to addr 1
    #10; addr = 3'b010; din = 8'hCC;         // Write 0xCC to addr 2

    // Read back the values
    #10; we = 0; addr = 3'b000;
    #10; addr = 3'b001;
    #10; addr = 3'b010;

    // Finish simulation
    #10; $stop;
end

endmodule
