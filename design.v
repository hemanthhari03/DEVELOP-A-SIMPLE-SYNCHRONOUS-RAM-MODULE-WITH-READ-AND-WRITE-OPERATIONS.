// Synchronous RAM Module
// Author: hari hemanth
// Description: Simple 8x8 RAM with synchronous read/write

module sync_ram (
    input             clk,       // Clock input
    input             we,        // Write enable (active high)
    input      [2:0]  addr,      // 3-bit address (8 locations)
    input      [7:0]  din,       // 8-bit data input
    output reg [7:0]  dout       // 8-bit data output
);

// Internal RAM - 8 locations of 8-bit each
reg [7:0] mem [7:0];

always @(posedge clk) begin
    if (we)
        mem[addr] <= din;        // Write operation on rising clock
    else
        dout <= mem[addr];       // Read operation on rising clock
end

endmodule

