<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="IR_BIT" />
        <signal name="XLXN_19" />
        <signal name="XLXN_24(7:0)" />
        <signal name="XLXN_25(7:0)" />
        <signal name="LOGIC_ONE">
        </signal>
        <signal name="XLXN_64" />
        <signal name="XLXN_65" />
        <signal name="XLXN_66(0:7)" />
        <signal name="CLK" />
        <signal name="RST" />
        <signal name="XLXN_76" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78" />
        <signal name="VGA_R" />
        <signal name="VGA_G" />
        <signal name="VGA_B" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Input" name="IR_BIT" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RST" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_B" />
        <blockdef name="VGAtxt48x20">
            <timestamp>2008-9-4T9:59:2</timestamp>
            <rect width="304" x="64" y="-640" height="728" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="64" y2="64" x1="64" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-608" y2="-608" x1="368" />
            <line x2="432" y1="-544" y2="-544" x1="368" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
        </blockdef>
        <blockdef name="NEC_decoder">
            <timestamp>2020-5-21T16:28:12</timestamp>
            <rect width="64" x="320" y="84" height="24" />
            <line x2="384" y1="96" y2="96" x1="320" />
            <rect width="64" x="320" y="148" height="24" />
            <line x2="384" y1="160" y2="160" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="256" x="64" y="-192" height="384" />
        </blockdef>
        <blockdef name="output_formatter">
            <timestamp>2020-5-21T16:27:6</timestamp>
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="256" x="64" y="-320" height="384" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <block symbolname="VGAtxt48x20" name="XLXI_2">
            <blockpin signalname="XLXN_66(0:7)" name="Char_DI(7:0)" />
            <blockpin name="Home" />
            <blockpin signalname="XLXN_65" name="NewLine" />
            <blockpin signalname="RST" name="Goto00" />
            <blockpin signalname="CLK" name="Clk_Sys" />
            <blockpin signalname="CLK" name="Clk_50MHz" />
            <blockpin signalname="LOGIC_ONE" name="CursorOn" />
            <blockpin signalname="LOGIC_ONE" name="ScrollEn" />
            <blockpin signalname="LOGIC_ONE" name="ScrollClear" />
            <blockpin name="Busy" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin signalname="XLXN_77" name="VGA_RGB" />
            <blockpin signalname="XLXN_64" name="Char_WE" />
        </block>
        <block symbolname="NEC_decoder" name="XLXI_3">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="IR_BIT" name="ir_bit" />
            <blockpin signalname="XLXN_19" name="rdy" />
            <blockpin signalname="XLXN_24(7:0)" name="output_command(7:0)" />
            <blockpin signalname="XLXN_25(7:0)" name="output_address(7:0)" />
        </block>
        <block symbolname="output_formatter" name="XLXI_4">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="XLXN_19" name="rdy_in" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="XLXN_24(7:0)" name="command(0:7)" />
            <blockpin signalname="XLXN_25(7:0)" name="address(0:7)" />
            <blockpin signalname="XLXN_64" name="rdy_out" />
            <blockpin signalname="XLXN_65" name="newline" />
            <blockpin signalname="XLXN_66(0:7)" name="output_byte(0:7)" />
        </block>
        <block symbolname="constant" name="LOGIC_HIGH">
            <attr value="1" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="LOGIC_ONE" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="XLXN_77" name="I" />
            <blockpin signalname="VGA_R" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_8">
            <blockpin signalname="XLXN_77" name="I" />
            <blockpin signalname="VGA_G" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_9">
            <blockpin signalname="XLXN_77" name="I" />
            <blockpin signalname="VGA_B" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="VGA_HS">
            <wire x2="2400" y1="832" y2="832" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="2400" y="832" name="VGA_HS" orien="R0" />
        <branch name="VGA_VS">
            <wire x2="2400" y1="896" y2="896" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="2400" y="896" name="VGA_VS" orien="R0" />
        <branch name="IR_BIT">
            <wire x2="992" y1="1216" y2="1216" x1="512" />
        </branch>
        <instance x="992" y="1248" name="XLXI_3" orien="R0">
        </instance>
        <iomarker fontsize="28" x="496" y="1088" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="512" y="1216" name="IR_BIT" orien="R180" />
        <iomarker fontsize="28" x="512" y="1152" name="RST" orien="R180" />
        <branch name="LOGIC_ONE">
            <wire x2="1824" y1="1280" y2="1280" x1="1776" />
            <wire x2="1856" y1="1280" y2="1280" x1="1824" />
            <wire x2="1856" y1="1280" y2="1344" x1="1856" />
            <wire x2="1936" y1="1344" y2="1344" x1="1856" />
            <wire x2="1936" y1="1280" y2="1280" x1="1856" />
            <wire x2="1936" y1="1216" y2="1216" x1="1856" />
            <wire x2="1856" y1="1216" y2="1280" x1="1856" />
        </branch>
        <instance x="1936" y="1440" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_25(7:0)">
            <wire x2="1424" y1="1408" y2="1408" x1="1376" />
            <wire x2="1440" y1="1104" y2="1104" x1="1424" />
            <wire x2="1424" y1="1104" y2="1408" x1="1424" />
        </branch>
        <branch name="XLXN_24(7:0)">
            <wire x2="1408" y1="1344" y2="1344" x1="1376" />
            <wire x2="1408" y1="1040" y2="1344" x1="1408" />
            <wire x2="1440" y1="1040" y2="1040" x1="1408" />
        </branch>
        <instance x="1440" y="1136" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_19">
            <wire x2="1392" y1="1088" y2="1088" x1="1376" />
            <wire x2="1440" y1="912" y2="912" x1="1392" />
            <wire x2="1392" y1="912" y2="1088" x1="1392" />
        </branch>
        <branch name="XLXN_64">
            <wire x2="1872" y1="848" y2="848" x1="1824" />
            <wire x2="1872" y1="848" y2="896" x1="1872" />
            <wire x2="1936" y1="896" y2="896" x1="1872" />
        </branch>
        <branch name="XLXN_65">
            <wire x2="1872" y1="976" y2="976" x1="1824" />
            <wire x2="1872" y1="976" y2="1056" x1="1872" />
            <wire x2="1936" y1="1056" y2="1056" x1="1872" />
        </branch>
        <branch name="XLXN_66(0:7)">
            <wire x2="1856" y1="1168" y2="1168" x1="1824" />
            <wire x2="1856" y1="832" y2="1168" x1="1856" />
            <wire x2="1936" y1="832" y2="832" x1="1856" />
        </branch>
        <branch name="CLK">
            <wire x2="688" y1="1088" y2="1088" x1="496" />
            <wire x2="992" y1="1088" y2="1088" x1="688" />
            <wire x2="688" y1="1088" y2="1504" x1="688" />
            <wire x2="1440" y1="1504" y2="1504" x1="688" />
            <wire x2="1440" y1="848" y2="848" x1="688" />
            <wire x2="688" y1="848" y2="1088" x1="688" />
            <wire x2="1440" y1="1440" y2="1504" x1="1440" />
            <wire x2="1872" y1="1440" y2="1440" x1="1440" />
            <wire x2="1936" y1="1440" y2="1440" x1="1872" />
            <wire x2="1872" y1="1440" y2="1504" x1="1872" />
            <wire x2="1936" y1="1504" y2="1504" x1="1872" />
        </branch>
        <branch name="RST">
            <wire x2="752" y1="1152" y2="1152" x1="512" />
            <wire x2="992" y1="1152" y2="1152" x1="752" />
            <wire x2="752" y1="1152" y2="1456" x1="752" />
            <wire x2="1888" y1="1456" y2="1456" x1="752" />
            <wire x2="1440" y1="976" y2="976" x1="752" />
            <wire x2="752" y1="976" y2="1152" x1="752" />
            <wire x2="1888" y1="1120" y2="1456" x1="1888" />
            <wire x2="1936" y1="1120" y2="1120" x1="1888" />
        </branch>
        <instance x="1632" y="1248" name="LOGIC_HIGH" orien="R0">
        </instance>
        <instance x="2496" y="992" name="XLXI_7" orien="R0" />
        <instance x="2496" y="1072" name="XLXI_8" orien="R0" />
        <instance x="2496" y="1152" name="XLXI_9" orien="R0" />
        <branch name="XLXN_77">
            <wire x2="2416" y1="960" y2="960" x1="2368" />
            <wire x2="2496" y1="960" y2="960" x1="2416" />
            <wire x2="2416" y1="960" y2="1040" x1="2416" />
            <wire x2="2496" y1="1040" y2="1040" x1="2416" />
            <wire x2="2416" y1="1040" y2="1120" x1="2416" />
            <wire x2="2496" y1="1120" y2="1120" x1="2416" />
        </branch>
        <branch name="VGA_R">
            <wire x2="2752" y1="960" y2="960" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="2752" y="960" name="VGA_R" orien="R0" />
        <branch name="VGA_G">
            <wire x2="2752" y1="1040" y2="1040" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="2752" y="1040" name="VGA_G" orien="R0" />
        <branch name="VGA_B">
            <wire x2="2752" y1="1120" y2="1120" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="2752" y="1120" name="VGA_B" orien="R0" />
    </sheet>
</drawing>