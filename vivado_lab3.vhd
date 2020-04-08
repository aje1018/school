----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2020 01:28:02 PM
-- Design Name: 
-- Module Name: lab3_logic - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab3_logic is
    Port ( SW0 : in STD_LOGIC; -- switch 0 -> present input 
           CLK : in STD_LOGIC; -- clock pulse
           SW1 : in STD_LOGIC; -- switch 1 --> reset
           LD0 : out STD_LOGIC; -- LED 0 -> output
           A : out STD_LOGIC; --  
           B : out STD_LOGIC; -- 
           C : out STD_LOGIC; -- 
           D : out STD_LOGIC; -- all for seven seg display
           E : out STD_LOGIC; -- 
           F : out STD_LOGIC; -- 
           G : out STD_LOGIC; --
           SSD0 : out STD_LOGIC); -- common anode for first ssd
           --SSD1 : out STD_LOGIC); -- common anode for second ssd
           
end lab3_logic;

architecture Behavioral of lab3_logic is
signal count: integer:=1;
signal tmp : std_logic := '0';
signal clock_out: std_logic := '0';
begin
    process(CLK, SW1)
    begin
        if(SW1='1') then
            count <= 1;
            tmp <= '0';
            SSD0 <= '0';
        elsif(CLK'event and CLK='1') then
            count <= count + 1;
            if (count = 25000000) then
                tmp <= not tmp;
                count <= 1;
            end if;
        end if;
        clock_out <= tmp;
        SSD0 <= '1';
    end process;
            
    
    
    process(clock_out)
    variable state : natural range 0 to 13;
    begin
        if rising_edge(clock_out) then
            case state is
                when 0 => -- A
                    if SW0='1' then
                        state := 1; -- move to B
                    else 
                        state := 0; -- stay at A
                    end if;
                    LD0 <= '0';
                when 1 => -- B
                    if SW0='1' then
                        state := 3; -- move to D
                    else
                        state := 2; -- move to C
                    end if;
                    LD0 <= '0';
                when 2 => -- C
                    if SW0='1' then
                        state := 1; -- move to B
                    else
                        state := 4; -- move to E
                    end if;
                    LD0 <= '0';
                when 3 => -- D
                    if SW0='1' then
                        state := 3; -- stay at D
                    else
                        state := 5; -- move to F
                    end if;
                    LD0 <= '0';
                when 4 => -- E
                    if SW0='1' then
                        state := 6; -- move to G
                    else
                        state := 0; -- move to A
                    end if;
                    LD0 <= '0';
                when 5 => -- F
                    if SW0='1' then
                        state := 7; -- move to H
                    else
                        state := 4;
                    end if;
                    LD0 <= '0';
                when 6 => -- G
                    if SW0='1' then
                        state := 8; -- move to I
                    else
                        state := 2;
                    end if;
                    LD0 <= '0';
                when 7 => -- H
                    if SW0='1' then
                        state := 9;
                    else
                        state := 2;
                    end if;
                    LD0 <= '0';
                when 8 => -- I
                    if SW0='1' then
                        state := 10;
                    else
                        state := 5;
                    end if;
                    LD0 <= '0';
                when 9 => -- J
                    if SW0='1' then
                        state := 11;
                    else
                        state := 5;
                    end if;
                    LD0 <= '0';
                when 10 =>
                    if SW0='1' then
                        state := 3;
                    else
                        state := 12;
                    end if;
                    LD0 <= not SW0;
                when 11 =>
                    if SW0='1' then
                        state := 3;
                    else
                        state := 13;
                    end if;
                    LD0 <= not SW0;
                when 12|13 =>
                    if SW0='1' then
                        state := 7;
                        LD0 <= '0';
                    else
                        state := 4;
                        LD0 <= '0';
                    end if;
                when others =>
                    state := 0;
                    LD0 <= '0';
                    
            end case;
            
            if SW1='1' then
                state := 0;
                LD0 <= '0';
            end if;
        end if;
        
    end process;
            
  
  
  
  

end Behavioral;
