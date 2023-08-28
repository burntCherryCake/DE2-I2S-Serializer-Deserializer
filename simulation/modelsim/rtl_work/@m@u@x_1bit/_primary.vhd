library verilog;
use verilog.vl_types.all;
entity MUX_1bit is
    port(
        EN              : in     vl_logic;
        IN0             : in     vl_logic;
        IN1             : in     vl_logic;
        \OUT\           : out    vl_logic
    );
end MUX_1bit;
