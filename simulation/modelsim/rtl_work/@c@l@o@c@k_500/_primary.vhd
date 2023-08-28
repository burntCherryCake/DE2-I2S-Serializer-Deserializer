library verilog;
use verilog.vl_types.all;
entity CLOCK_500 is
    port(
        CLOCK           : in     vl_logic;
        CLOCK_500       : out    vl_logic;
        DATA            : out    vl_logic_vector(23 downto 0);
        \END\           : in     vl_logic;
        RESET           : in     vl_logic;
        GO              : out    vl_logic;
        CLOCK_2         : out    vl_logic
    );
end CLOCK_500;
