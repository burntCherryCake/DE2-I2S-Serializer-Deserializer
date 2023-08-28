library verilog;
use verilog.vl_types.all;
entity I2S_Deserializer is
    port(
        BCLK            : in     vl_logic;
        LRCK            : in     vl_logic;
        AUD_IN          : in     vl_logic;
        LEFT_CHANNEL    : out    vl_logic_vector(15 downto 0);
        RIGHT_CHANNEL   : out    vl_logic_vector(15 downto 0)
    );
end I2S_Deserializer;
