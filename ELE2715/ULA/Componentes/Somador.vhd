--==============================================================================================
--				LOGICA DO SOMADOR COMPLETO
--==============================================================================================
entity SCOMP is
	port( A, B, Ci : in bit;
			S, Co : out bit);
end SCOMP;

architecture ckt of SCOMP is

	begin
		S <= A xor B xor Ci;
		Co <= (A and B) or (A and Ci) or (B and Ci);
		
end ckt;

--==============================================================================================
--				SOMADOR DE 8 BITS
--==============================================================================================

entity ADD8 is
	port (A, B : in bit_vector(7 downto 0);
			Ci : in bit;
			Co : out bit;
			S : out bit_vector(7 downto 0));
end ADD8;

architecture ckt of ADD8 is

	component SCOMP is
		port ( A, B, Ci : in bit;
				S, Co : out bit);
	end component;

	signal Carry : bit_vector(7 downto 0);

	begin

		R0 : SCOMP port map (A(0), B(0), Ci, S(0), Carry(0));		
		R1 : SCOMP port map (A(1), B(1), Carry(0), S(1), Carry(1));
		R2 : SCOMP port map (A(2), B(2), Carry(1), S(2), Carry(2));
		R3 : SCOMP port map (A(3), B(3), Carry(2), S(3), Carry(3));
		R4 : SCOMP port map (A(4), B(4), Carry(3), S(4), Carry(4));
		R5 : SCOMP port map (A(5), B(5), Carry(4), S(5), Carry(5));
		R6 : SCOMP port map (A(6), B(6), Carry(5), S(6), Carry(6));
		R7 : SCOMP port map (A(7), B(7), Carry(6), S(7), Carry(7));

end ckt;

--==============================================================================================
--				SOMADOR DE 16 BITS (usado para o multiplicador)
--==============================================================================================

entity ADD16 is
	port (A, B : in bit_vector(15 downto 0);
			Ci : in bit;
			Co : out bit;
			S : out bit_vector(15 downto 0));
end ADD16;

architecture ckt of ADD16 is

	component SCOMP is
		port ( A, B, Ci : in bit;
				S, Co : out bit);
	end component;

	signal Carry : bit_vector(15 downto 0);

	begin

		R0 : SCOMP port map (A(0), B(0), Ci, S(0), Carry(0));		
		R1 : SCOMP port map (A(1), B(1), Carry(0), S(1), Carry(1));
		R2 : SCOMP port map (A(2), B(2), Carry(1), S(2), Carry(2));
		R3 : SCOMP port map (A(3), B(3), Carry(2), S(3), Carry(3));
		R4 : SCOMP port map (A(4), B(4), Carry(3), S(4), Carry(4));
		R5 : SCOMP port map (A(5), B(5), Carry(4), S(5), Carry(5));
		R6 : SCOMP port map (A(6), B(6), Carry(5), S(6), Carry(6));
		R7 : SCOMP port map (A(7), B(7), Carry(6), S(7), Carry(7));
		R8 : SCOMP port map (A(8), B(8), Carry(7), S(8), Carry(8));
		R9 : SCOMP port map (A(9), B(9), Carry(8), S(9), Carry(9));
		R10 : SCOMP port map (A(10), B(10), Carry(9),  S(10), Carry(10));
		R11 : SCOMP port map (A(11), B(11), Carry(10), S(11), Carry(11));
		R12 : SCOMP port map (A(12), B(12), Carry(11), S(12), Carry(12));
		R13 : SCOMP port map (A(13), B(13), Carry(12), S(13), Carry(13));
		R14 : SCOMP port map (A(14), B(14), Carry(13), S(14), Carry(14));
		R15 : SCOMP port map (A(15), B(15), Carry(14), S(15), Carry(15));

end ckt;


