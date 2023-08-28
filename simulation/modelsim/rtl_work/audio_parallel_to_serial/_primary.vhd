library verilog;
use verilog.vl_types.all;
entity audio_parallel_to_serial is
    port(
        AUD_BCK         : in     vl_logic;
        AUD_LRCK        : in     vl_logic;
        AUD_DATA        : out    vl_logic;
        AUD_inL         : in     vl_logic_vector(15 downto 0);
        AUD_inR         : in     vl_logic_vector(15 downto 0);
        counter         : out    vl_logic_vector(3 downto 0);
        test            : out    vl_logic
    );
end audio_parallel_to_serial;
