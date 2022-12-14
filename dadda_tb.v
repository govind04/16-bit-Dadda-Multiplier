`include "dadda_mult_with_BKadder.v"

module testbench;

reg [15:0] a, b;
wire [31:0]out;

dadda test (a, b, out);

// Variables
integer j,k;


initial
begin
    	$dumpfile("test.vcd");
	$dumpvars(0, testbench);
        for (j=10; j<2**16; j=j+1)
            	for (k=100; k<2**16; k=k+1)
                begin
                    	a=j;
                    	b=k;
                    	#20 $display("a * b = %d * %d = out = %d  a*b = %d correct_or_not = %b", a, b, out, j*k, (out == j*k));
                    	if(!(out == j*k)) begin
                    		#10 $display("ERROR");
                    		$stop;
                    	end
                end
end

endmodule
