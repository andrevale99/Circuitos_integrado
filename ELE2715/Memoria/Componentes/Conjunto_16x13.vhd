--==============================================================
--      CONJUNTO DE 16 REGISTRADORES DE 13 BITS
--===============================================================

entity REG16X13 is
    port (  clk, clr : in bit;
            wd , rd : in bit;
            wd_addr, rd_addr : in bit_vector(3 downto 0);
            wd_data : in bit_vector(12 downto 0);
            rd_data : out bit_vector(12 downto 0));
end REG16X13;

architecture ckt of REG16X13 is

    component REG4X13 is
        port (  clk : in bit;
                clr : in bit;
                wd_en_01 : in bit;
                wd_en_02 : in bit;
                wd_en_03 : in bit;
                wd_en_04 : in bit;
                rd_en_01 : in bit;
                rd_en_02 : in bit;
                rd_en_03 : in bit;
                rd_en_04 : in bit;
                wd_data : in bit_vector(12 downto 0);
                rd_data_1 : out bit_vector(12 downto 0);
                rd_data_2 : out bit_vector(12 downto 0);
                rd_data_3 : out bit_vector(12 downto 0);
                rd_data_4 : out bit_vector(12 downto 0));
    end component;

    component DEC is
        port (  en : in bit;
                s : in bit_vector(3 downto 0);
                q : out bit_vector(15 downto 0));
    end component;

    component MUX13B4S is
        port ( I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15, I16 : in bit_vector(12 downto 0);
                S : in bit_vector(3 downto 0);
                Q : out bit_vector(12 downto 0));
    end component;

    signal qual_wd_reg : bit_vector(15 downto 0);
    signal qual_rd_reg : bit_vector(15 downto 0);

    signal aux_1 : bit_vector(12 downto 0);
    signal aux_2 : bit_vector(12 downto 0);
    signal aux_3 : bit_vector(12 downto 0);
    signal aux_4 : bit_vector(12 downto 0);
    signal aux_5 : bit_vector(12 downto 0);
    signal aux_6 : bit_vector(12 downto 0);
    signal aux_7 : bit_vector(12 downto 0);
    signal aux_8 : bit_vector(12 downto 0);
    signal aux_9 : bit_vector(12 downto 0);
    signal aux_10 : bit_vector(12 downto 0);
    signal aux_11 : bit_vector(12 downto 0);
    signal aux_12 : bit_vector(12 downto 0);
    signal aux_13 : bit_vector(12 downto 0);
    signal aux_14 : bit_vector(12 downto 0);
    signal aux_15 : bit_vector(12 downto 0);
    signal aux_16 : bit_vector(12 downto 0);


    begin

        WD_DECODER : DEC port map (wd, wd_addr, qual_wd_reg);
        RD_DECODER : DEC port map (rd, rd_addr, qual_rd_reg);

        CON1_4X13 : REG4X13 port map (clk , clr, qual_wd_reg(0), qual_wd_reg(1), qual_wd_reg(2), qual_wd_reg(3), 
                                        qual_rd_reg(0), qual_rd_reg(1), qual_rd_reg(2), qual_rd_reg(3), wd_data, aux_1, aux_2, aux_3, aux_4);
                                        
        CON2_4X13 : REG4X13 port map (clk , clr, qual_wd_reg(4), qual_wd_reg(5), qual_wd_reg(6), qual_wd_reg(7), 
                                        qual_rd_reg(4), qual_rd_reg(5), qual_rd_reg(6), qual_rd_reg(7), wd_data,  aux_5, aux_6, aux_7, aux_8);

        CON3_4X13 : REG4X13 port map (clk , clr, qual_wd_reg(8), qual_wd_reg(9), qual_wd_reg(10), qual_wd_reg(11), 
                                        qual_rd_reg(8), qual_rd_reg(9), qual_rd_reg(10), qual_rd_reg(11), wd_data,  aux_9, aux_10, aux_11, aux_12);
        
        CON4_4X13 : REG4X13 port map (clk , clr, qual_wd_reg(12), qual_wd_reg(13), qual_wd_reg(14), qual_wd_reg(15), 
                                        qual_rd_reg(12), qual_rd_reg(13), qual_rd_reg(14), qual_rd_reg(15), wd_data,  aux_13, aux_14, aux_15, aux_16);

        SAIDA : MUX13B4S port map (aux_1, aux_2, aux_3, aux_4, aux_5, aux_6, aux_7, aux_8, aux_9, aux_10, aux_11, aux_12, aux_13, aux_14, aux_15, aux_16, rd_addr, rd_data);

end ckt;