library verilog;
use verilog.vl_types.all;
entity audio_parallel_to_serial_testbench is
    generic(
        stimDelay       : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of stimDelay : constant is 1;
end audio_parallel_to_serial_testbench;
