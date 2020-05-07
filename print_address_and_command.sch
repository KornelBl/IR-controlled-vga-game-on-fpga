<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="aspartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="CLK" />
        <signal name="RST" />
        <signal name="IR_BIT" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14(7:0)" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="IR_BIT" />
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
            <timestamp>2020-5-7T18:22:43</timestamp>
            <rect width="64" x="320" y="20" height="24" />
            <line x2="384" y1="32" y2="32" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="256" x="64" y="-192" height="256" />
        </blockdef>
        <block symbolname="VGAtxt48x20" name="XLXI_2">
            <blockpin signalname="XLXN_14(7:0)" name="Char_DI(7:0)" />
            <blockpin name="Home" />
            <blockpin name="NewLine" />
            <blockpin name="Goto00" />
            <blockpin signalname="CLK" name="Clk_Sys" />
            <blockpin signalname="CLK" name="Clk_50MHz" />
            <blockpin name="CursorOn" />
            <blockpin name="ScrollEn" />
            <blockpin name="ScrollClear" />
            <blockpin name="Busy" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin name="VGA_RGB" />
            <blockpin signalname="XLXN_13" name="Char_WE" />
        </block>
        <block symbolname="NEC_decoder" name="XLXI_3">
            <blockpin signalname="CLK" name="clk" />
            <blockpin signalname="RST" name="rst" />
            <blockpin signalname="IR_BIT" name="ir_bit" />
            <blockpin signalname="XLXN_13" name="rdy" />
            <blockpin signalname="XLXN_14(7:0)" name="output_byte(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1936" y="1440" name="XLXI_2" orien="R0">
        </instance>
        <iomarker fontsize="28" x="976" y="1088" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="976" y="1216" name="IR_BIT" orien="R180" />
        <iomarker fontsize="28" x="976" y="1152" name="RST" orien="R180" />
        <branch name="VGA_HS">
            <wire x2="2400" y1="832" y2="832" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="2400" y="832" name="VGA_HS" orien="R0" />
        <branch name="VGA_VS">
            <wire x2="2400" y1="896" y2="896" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="2400" y="896" name="VGA_VS" orien="R0" />
        <instance x="1216" y="1248" name="XLXI_3" orien="R0">
        </instance>
        <branch name="CLK">
            <wire x2="736" y1="1024" y2="1440" x1="736" />
            <wire x2="1840" y1="1440" y2="1440" x1="736" />
            <wire x2="1936" y1="1440" y2="1440" x1="1840" />
            <wire x2="1840" y1="1440" y2="1504" x1="1840" />
            <wire x2="1936" y1="1504" y2="1504" x1="1840" />
            <wire x2="976" y1="1024" y2="1024" x1="736" />
            <wire x2="976" y1="1024" y2="1088" x1="976" />
            <wire x2="1216" y1="1088" y2="1088" x1="976" />
        </branch>
        <branch name="RST">
            <wire x2="1216" y1="1152" y2="1152" x1="976" />
        </branch>
        <branch name="IR_BIT">
            <wire x2="1216" y1="1216" y2="1216" x1="976" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1760" y1="1088" y2="1088" x1="1600" />
            <wire x2="1760" y1="896" y2="1088" x1="1760" />
            <wire x2="1936" y1="896" y2="896" x1="1760" />
        </branch>
        <branch name="XLXN_14(7:0)">
            <wire x2="1744" y1="1280" y2="1280" x1="1600" />
            <wire x2="1744" y1="832" y2="1280" x1="1744" />
            <wire x2="1936" y1="832" y2="832" x1="1744" />
        </branch>
    </sheet>
</drawing>