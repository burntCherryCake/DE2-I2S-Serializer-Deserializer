library verilog;
use verilog.vl_types.all;
entity audio_serial_to_parallel is
    port(
        AUD_BCK         : in     vl_logic;
        AUD_LRCK        : in     vl_logic;
        AUD_ADCDAT      : in     vl_logic;
        AUD_outL        : out    vl_logic_vector(15 downto 0);
        AUD_outR        : out    vl_logic_vector(15 downto 0)
    );
end audio_serial_to_parallel;
