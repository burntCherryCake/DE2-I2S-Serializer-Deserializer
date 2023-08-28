library verilog;
use verilog.vl_types.all;
entity keytr is
    port(
        key             : in     vl_logic;
        \ON\            : out    vl_logic;
        clock           : in     vl_logic;
        KEYON           : out    vl_logic;
        counter         : out    vl_logic_vector(9 downto 0)
    );
end keytr;
