library verilog;
use verilog.vl_types.all;
entity LED_STATUS is
    port(
        btn             : in     vl_logic;
        din             : in     vl_logic_vector(15 downto 0);
        led0            : out    vl_logic;
        led1            : out    vl_logic;
        led2            : out    vl_logic;
        led3            : out    vl_logic;
        led4            : out    vl_logic;
        led5            : out    vl_logic;
        led6            : out    vl_logic;
        led7            : out    vl_logic;
        led8            : out    vl_logic;
        led9            : out    vl_logic;
        led10           : out    vl_logic;
        led11           : out    vl_logic;
        led12           : out    vl_logic;
        led13           : out    vl_logic;
        led14           : out    vl_logic;
        led15           : out    vl_logic
    );
end LED_STATUS;
