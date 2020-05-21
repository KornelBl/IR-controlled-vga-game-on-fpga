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
        <signal name="CLK" />
        <signal name="IR_BIT" />
        <signal name="XLXN_19" />
        <signal name="RST" />
        <signal name="XLXN_24(7:0)" />
        <signal name="XLXN_25(7:0)" />
        <signal name="XLXN_26(0:7)" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="LOGIC_ONE" />
        <signal name="XLXN_31" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="IR_BIT" />
        <port polarity="Input" name="RST" />
        <port polarity="Input" name="LOGIC_ONE" />
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
            <timestamp>2020-5-21T15:52:52</timestamp>
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
            <timestamp>2020-5-21T15:59:41</timestamp>
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
        <block symbolname="VGAtxt48x20" name="XLXI_2">
            <blockpin signalname="XLXN_26(0:7)" name="Char_DI(7:0)" />
            <blockpin name="Home" />
            <blockpin signalname="XLXN_28" name="NewLine" />
            <blockpin signalname="RST" name="Goto00" />
            <blockpin signalname="CLK" name="Clk_Sys" />
            <blockpin signalname="CLK" name="Clk_50MHz" />
            <blockpin signalname="LOGIC_ONE" name="CursorOn" />
            <blockpin signalname="LOGIC_ONE" name="ScrollEn" />
            <blockpin signalname="LOGIC_ONE" name="ScrollClear" />
            <blockpin name="Busy" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin name="VGA_RGB" />
            <blockpin signalname="XLXN_27" name="Char_WE" />
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
            <blockpin signalname="XLXN_27" name="rdy_out" />
            <blockpin signalname="XLXN_28" name="newline" />
            <blockpin signalname="XLXN_26(0:7)" name="output_byte(0:7)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1936" y="1440" name="XLXI_2" orien="R0">
        </instance>
        <branch name="VGA_HS">
            <wire x2="2400" y1="832" y2="832" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="2400" y="832" name="VGA_HS" orien="R0" />
        <branch name="VGA_VS">
            <wire x2="2400" y1="896" y2="896" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="2400" y="896" name="VGA_VS" orien="R0" />
        <branch name="IR_BIT">
            <wire x2="976" y1="1216" y2="1216" x1="512" />
            <wire x2="992" y1="1216" y2="1216" x1="976" />
        </branch>
        <instance x="992" y="1248" name="XLXI_3" orien="R0">
        </instance>
        <instance x="1456" y="1184" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_19">
            <wire x2="1392" y1="1088" y2="1088" x1="1376" />
            <wire x2="1408" y1="1088" y2="1088" x1="1392" />
            <wire x2="1408" y1="960" y2="1088" x1="1408" />
            <wire x2="1456" y1="960" y2="960" x1="1408" />
        </branch>
        <branch name="CLK">
            <wire x2="976" y1="1088" y2="1088" x1="496" />
            <wire x2="992" y1="1088" y2="1088" x1="976" />
            <wire x2="736" y1="1024" y2="1440" x1="736" />
            <wire x2="1840" y1="1440" y2="1440" x1="736" />
            <wire x2="1936" y1="1440" y2="1440" x1="1840" />
            <wire x2="1840" y1="1440" y2="1504" x1="1840" />
            <wire x2="1936" y1="1504" y2="1504" x1="1840" />
            <wire x2="960" y1="1024" y2="1024" x1="736" />
            <wire x2="976" y1="1024" y2="1024" x1="960" />
            <wire x2="976" y1="1024" y2="1088" x1="976" />
            <wire x2="1456" y1="896" y2="896" x1="976" />
            <wire x2="976" y1="896" y2="1024" x1="976" />
        </branch>
        <iomarker fontsize="28" x="496" y="1088" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="512" y="1216" name="IR_BIT" orien="R180" />
        <branch name="RST">
            <wire x2="528" y1="1152" y2="1152" x1="512" />
            <wire x2="976" y1="1152" y2="1152" x1="528" />
            <wire x2="992" y1="1152" y2="1152" x1="976" />
            <wire x2="528" y1="1152" y2="1584" x1="528" />
            <wire x2="1936" y1="1584" y2="1584" x1="528" />
            <wire x2="1456" y1="928" y2="928" x1="528" />
            <wire x2="1456" y1="928" y2="1024" x1="1456" />
            <wire x2="528" y1="928" y2="1152" x1="528" />
            <wire x2="1936" y1="1120" y2="1584" x1="1936" />
        </branch>
        <iomarker fontsize="28" x="512" y="1152" name="RST" orien="R180" />
        <branch name="XLXN_24(7:0)">
            <wire x2="1392" y1="1344" y2="1344" x1="1376" />
            <wire x2="1424" y1="1344" y2="1344" x1="1392" />
            <wire x2="1424" y1="1088" y2="1344" x1="1424" />
            <wire x2="1456" y1="1088" y2="1088" x1="1424" />
        </branch>
        <branch name="XLXN_25(7:0)">
            <wire x2="1392" y1="1408" y2="1408" x1="1376" />
            <wire x2="1440" y1="1408" y2="1408" x1="1392" />
            <wire x2="1440" y1="1152" y2="1408" x1="1440" />
            <wire x2="1456" y1="1152" y2="1152" x1="1440" />
        </branch>
        <branch name="XLXN_26(0:7)">
            <wire x2="1888" y1="1152" y2="1152" x1="1840" />
            <wire x2="1840" y1="1152" y2="1216" x1="1840" />
            <wire x2="1888" y1="832" y2="1152" x1="1888" />
            <wire x2="1920" y1="832" y2="832" x1="1888" />
            <wire x2="1936" y1="832" y2="832" x1="1920" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="1920" y1="896" y2="896" x1="1840" />
            <wire x2="1936" y1="896" y2="896" x1="1920" />
        </branch>
        <branch name="XLXN_28">
            <wire x2="1872" y1="1024" y2="1024" x1="1840" />
            <wire x2="1872" y1="1024" y2="1056" x1="1872" />
            <wire x2="1920" y1="1056" y2="1056" x1="1872" />
            <wire x2="1936" y1="1056" y2="1056" x1="1920" />
        </branch>
        <branch name="LOGIC_ONE">
            <wire x2="1856" y1="1280" y2="1280" x1="1824" />
            <wire x2="1920" y1="1280" y2="1280" x1="1856" />
            <wire x2="1936" y1="1280" y2="1280" x1="1920" />
            <wire x2="1856" y1="1280" y2="1344" x1="1856" />
            <wire x2="1936" y1="1344" y2="1344" x1="1856" />
            <wire x2="1936" y1="1216" y2="1216" x1="1856" />
            <wire x2="1856" y1="1216" y2="1280" x1="1856" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1280" name="LOGIC_ONE" orien="R180" />
    </sheet>
</drawing>