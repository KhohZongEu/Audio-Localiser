module four_digit_bcd(din, hex0, hex1, hex2, hex3);
    input [15:0] din;
    output [6:0] hex0;
    output [6:0] hex1;
    output [6:0] hex2;
    output [6:0] hex3;

    wire [16:0]hex0val, hex1val, hex2val, hex3val;
    
    assign hex0val = din % 16'd10;
    assign hex1val = din / 16'd10 % 16'd10;
    assign hex2val = din / 16'd100 % 16'd10;
    assign hex3val = din / 16'd1000 % 16'd10;

    BCD bcd_1(.data(hex0val[3:0]), .X(hex0));
    BCD bcd_2(.data(hex1val[3:0]), .X(hex1));
    BCD bcd_3(.data(hex2val[3:0]), .X(hex2));
    BCD bcd_4(.data(hex3val[3:0]), .X(hex3));
endmodule