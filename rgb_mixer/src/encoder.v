`default_nettype none
`timescale 1ns/1ns
module encoder (
    input clk,
    input reset,
    input a,
    input b,
    output reg [7:0] value
);

	reg old_a, old_b;
	
	always @( posedge clk ) begin
		if(reset) begin

			old_a <= 0;
			old_b <= 0;
			value <= 0;

		end else begin

			old_a <= a;
			old_b <= b;
			
			
			case({a,old_a,b,old_b})
				4'b1000: value <= value + 1'b1;
				4'b0111: value <= value + 1'b1;

				4'b0010: value <= value - 1'b1;
				4'b1101: value <= value - 1'b1;

				default: value <= value;
			endcase		
		end
	end 

endmodule
