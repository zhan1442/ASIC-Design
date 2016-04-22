// $Id: $
// File name:   sensor_s.sv
// Created:     1/21/2016
// Author:      Zhizhe Zhang
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: .

module sensor_s
(
 	input wire [3:0] sensors,
	output wire error

);
//F= Bit0 + Bit2*Bit1 + Bit3*Bit1

	wire output1;
	wire output2;
	wire output3;

	and A1 (output1, sensors[2], sensors[1]);
	and A2 (output2, sensors[3], sensors[1]);
	or O1 (output3, output1, output2);
	or O2 (error, sensors[0], output3);

endmodule