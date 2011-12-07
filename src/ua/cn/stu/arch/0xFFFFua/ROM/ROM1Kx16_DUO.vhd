library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity ROM1Kx16_DUO is
	port ( 
		I_CLK 	: in	STD_LOGIC;
		I_RST 	: in	STD_LOGIC;
		I_ADDR 	: in	STD_LOGIC_VECTOR (10 downto 0);
		O_DATA1	: out	STD_LOGIC_VECTOR (15 downto 0);
		O_DATA2	: out	STD_LOGIC_VECTOR (15 downto 0));
end ROM1Kx16_DUO;

architecture struct of ROM1Kx16_DUO is

	component MUX2 is
		port (
			I0 		: in	STD_LOGIC;
			I1 		: in	STD_LOGIC;
			I_ADDR 	: in	STD_LOGIC;
			O 		: out	STD_LOGIC);
	end component;
	
	component INC1x10 is
		port (
			I : in  STD_LOGIC_VECTOR (9 downto 0);
			O : out  STD_LOGIC_VECTOR (9 downto 0));
	end component;
	
	signal INC_out : STD_LOGIC_VECTOR (9 downto 0);

	component LUT3 is
		generic(
			INIT : BIT_VECTOR := X"00");
		port(
			O : out STD_ULOGIC;
			I0 : in STD_ULOGIC;
			I1 : in STD_ULOGIC;
			I2 : in STD_ULOGIC);
	end component;

	component ROM1Kx16 is
		generic (
			INIT_00	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_01	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_02	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_03	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_04	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_05	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_06	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_07	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_08	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_09	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_0A	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_0B	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_0C	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_0D	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_0E	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_0F	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_10	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_11	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_12	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_13	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_14	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_15	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_16	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_17	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_18	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_19	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_1A	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_1B	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_1C	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_1D	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_1E	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_1F	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_20	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_21	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_22	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_23	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_24	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_25	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_26	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_27	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_28	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_29	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_2A	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_2B	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_2C	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_2D	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_2E	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_2F	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_30	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_31	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_32	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_33	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_34	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_35	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_36	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_37	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_38	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_39	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_3A	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_3B	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_3C	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_3D	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_3E	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
			INIT_3F	: bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000");
		port ( 
			I_CLK 	: in	STD_LOGIC;
			I_RST 	: in	STD_LOGIC;
			I_ADDR 	: in	STD_LOGIC_VECTOR (9 downto 0);
			O_DATA 	: out	STD_LOGIC_VECTOR (15 downto 0));
	end component;
	
	type SLV2x16 is 
		array(0 to 1) of STD_LOGIC_VECTOR(15 downto 0);
	type SLV2x10 is 
		array(0 to 1) of STD_LOGIC_VECTOR(9 downto 0);
	
	signal ROM_out	: SLV2x16;
	signal ROM_addr	: SLV2x10;
	
	type SLV64x256 is 
		array(0 to 63) of bit_vector(255 downto 0);
	
	type SLV64x256_duo is 
		array(0 to 1) of SLV64x256;
		
	constant ROM_init : SLV64x256_duo := (

		(0 => X"0000_0000_0000_7800_7800_A000_7800_A000_7800_A000_7800_A000_7800_A000_7800_A000",
			others => X"0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000"),
			
		(0 => X"0000_0000_07FF_0000_0040_0130_0040_0080_0040_0001_0040_000C_0040_0006_0040_0028",
			others => X"0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000"));
	

--		(0 => X"7800_A000_7800_A000_7800_A000_7800_A000_7800_A000_7800_A000_7800_A000_7800_A000",
--		 1 => X"0000_0000_0000_7800_8061_7000_A020_7800_A000_7800_A000_7800_A000_7800_7800_7800",
--			others => X"0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000"),
			
--		(0 => X"0040_0146_0040_0178_0040_0130_0040_0080_0040_0001_0040_000C_0040_0006_0040_0028",
--		 1 => X"0000_0000_07ff_0003_5800_0020_0020_0040_0121_0040_0161_0040_0175_0040_0040_0040",
--			others => X"0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000"));
	
	constant C_GND 	: STD_LOGIC	:= '0';
	
	signal L_clk	: STD_LOGIC	:= 'Z';
begin
	
	CLK_DELAY1: LUT3
		generic map(
			INIT => X"01")
		port map(
			O 	=> L_clk,
			I0 	=> I_CLK,
			I1 	=> C_GND,
			I2 	=> C_GND);

	ADDR_EVEN_INC: INC1x10
		port map(
			I => I_ADDR(10 downto 1),
			O => INC_out);
	
	ADDR_EVEN_INPUT : for i in 0 to 9
	generate
		MUX: MUX2
			port map(
				I_ADDR 	=> I_ADDR(0),
				I0		=> I_ADDR(i+1),
				I1		=> INC_out(i),
				O	 	=> ROM_addr(0)(i));
	end generate;
	
	ADDR_ODD_INPUT : ROM_addr(1) <= I_ADDR(10 downto 1);
	
	MAIN : for i in 0 to 1
	generate
		ROM_UNIT: ROM1Kx16
			generic map(
				INIT_00 => ROM_init(i)(0),
				INIT_01 => ROM_init(i)(1),
				INIT_02 => ROM_init(i)(2),
				INIT_03 => ROM_init(i)(3),
				INIT_04 => ROM_init(i)(4),
				INIT_05 => ROM_init(i)(5),
				INIT_06 => ROM_init(i)(6),
				INIT_07 => ROM_init(i)(7),
				INIT_08 => ROM_init(i)(8),
				INIT_09 => ROM_init(i)(9),
				INIT_0A => ROM_init(i)(10),
				INIT_0B => ROM_init(i)(11),
				INIT_0C => ROM_init(i)(12),
				INIT_0D => ROM_init(i)(13),
				INIT_0E => ROM_init(i)(14),
				INIT_0F => ROM_init(i)(15),
				INIT_10 => ROM_init(i)(16),
				INIT_11 => ROM_init(i)(17),
				INIT_12 => ROM_init(i)(18),
				INIT_13 => ROM_init(i)(19),
				INIT_14 => ROM_init(i)(20),
				INIT_15 => ROM_init(i)(21),
				INIT_16 => ROM_init(i)(22),
				INIT_17 => ROM_init(i)(23),
				INIT_18 => ROM_init(i)(24),
				INIT_19 => ROM_init(i)(25),
				INIT_1A => ROM_init(i)(26),
				INIT_1B => ROM_init(i)(27),
				INIT_1C => ROM_init(i)(28),
				INIT_1D => ROM_init(i)(29),
				INIT_1E => ROM_init(i)(30),
				INIT_1F => ROM_init(i)(31),
				INIT_20 => ROM_init(i)(32),
				INIT_21 => ROM_init(i)(33),
				INIT_22 => ROM_init(i)(34),
				INIT_23 => ROM_init(i)(35),
				INIT_24 => ROM_init(i)(36),
				INIT_25 => ROM_init(i)(37),
				INIT_26 => ROM_init(i)(38),
				INIT_27 => ROM_init(i)(39),
				INIT_28 => ROM_init(i)(40),
				INIT_29 => ROM_init(i)(41),
				INIT_2A => ROM_init(i)(42),
				INIT_2B => ROM_init(i)(43),
				INIT_2C => ROM_init(i)(44),
				INIT_2D => ROM_init(i)(45),
				INIT_2E => ROM_init(i)(46),
				INIT_2F => ROM_init(i)(47),
				INIT_30 => ROM_init(i)(48),
				INIT_31 => ROM_init(i)(49),
				INIT_32 => ROM_init(i)(50),
				INIT_33 => ROM_init(i)(51),
				INIT_34 => ROM_init(i)(52),
				INIT_35 => ROM_init(i)(53),
				INIT_36 => ROM_init(i)(54),
				INIT_37 => ROM_init(i)(55),
				INIT_38 => ROM_init(i)(56),
				INIT_39 => ROM_init(i)(57),
				INIT_3A => ROM_init(i)(58),
				INIT_3B => ROM_init(i)(59),
				INIT_3C => ROM_init(i)(60),
				INIT_3D => ROM_init(i)(61),
				INIT_3E => ROM_init(i)(62),
				INIT_3F => ROM_init(i)(63))
			port map( 
				I_CLK 	=> L_clk,
				I_RST 	=> I_RST,
				I_ADDR 	=> ROM_addr(i),
				O_DATA 	=> ROM_out(i));
	end generate;

	OUTPUT : for i in 0 to 15
	generate
		MUX_OUT1: MUX2
			port map(
				I_ADDR 	=> I_ADDR(0),
				I0		=> ROM_out(0)(i),
				I1		=> ROM_out(1)(i),
				O	 	=> O_DATA1(i));
		MUX_OUT2: MUX2
			port map(
				I_ADDR 	=> I_ADDR(0),
				I0		=> ROM_out(1)(i),
				I1		=> ROM_out(0)(i),
				O	 	=> O_DATA2(i));
	end generate;
end struct;

