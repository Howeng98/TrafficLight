library verilog;
use verilog.vl_types.all;
entity traffic_light is
    generic(
        Red_Light       : vl_logic_vector(1 downto 0) := (Hi0, Hi0);
        Green_Light     : vl_logic_vector(1 downto 0) := (Hi0, Hi1);
        Yellow_Light    : vl_logic_vector(1 downto 0) := (Hi1, Hi0);
        Blank_Light     : vl_logic_vector(1 downto 0) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pass            : in     vl_logic;
        R               : out    vl_logic;
        G               : out    vl_logic;
        Y               : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Red_Light : constant is 2;
    attribute mti_svvh_generic_type of Green_Light : constant is 2;
    attribute mti_svvh_generic_type of Yellow_Light : constant is 2;
    attribute mti_svvh_generic_type of Blank_Light : constant is 2;
end traffic_light;
