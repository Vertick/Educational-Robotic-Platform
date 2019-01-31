<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="8.4.3">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting keepoldvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="yes" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="yes" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="yes" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="yes" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="yes" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="yes" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="yes" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="yes" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="yes" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="yes" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="yes" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="yes" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="yes" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="yes" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="yes" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="yes" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="yes" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="yes" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="yes" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="yes" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="yes" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="yes" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="2X14">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-17.78" y1="-1.905" x2="-17.145" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="-2.54" x2="-15.875" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="-2.54" x2="-15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-1.905" x2="-14.605" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-2.54" x2="-13.335" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-2.54" x2="-12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-1.905" x2="-12.065" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="-2.54" x2="-10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-2.54" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-9.525" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-2.54" x2="-8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-2.54" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-2.54" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.54" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="-1.905" x2="-17.78" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="1.905" x2="-17.145" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-17.145" y1="2.54" x2="-15.875" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-15.875" y1="2.54" x2="-15.24" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="1.905" x2="-14.605" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="2.54" x2="-13.335" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="2.54" x2="-12.7" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.905" x2="-12.065" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="2.54" x2="-10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="2.54" x2="-10.16" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.905" x2="-9.525" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="2.54" x2="-8.255" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="2.54" x2="-7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-6.985" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="2.54" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-5.08" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0" y2="1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.08" y2="1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.905" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.985" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.985" y1="2.54" x2="7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="8.255" y2="2.54" width="0.1524" layer="21"/>
<wire x1="8.255" y1="2.54" x2="9.525" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.525" y1="2.54" x2="10.16" y2="1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="1.905" x2="10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="2.54" x2="12.065" y2="2.54" width="0.1524" layer="21"/>
<wire x1="12.7" y1="1.905" x2="12.065" y2="2.54" width="0.1524" layer="21"/>
<wire x1="12.7" y1="1.905" x2="13.335" y2="2.54" width="0.1524" layer="21"/>
<wire x1="14.605" y1="2.54" x2="13.335" y2="2.54" width="0.1524" layer="21"/>
<wire x1="14.605" y1="2.54" x2="15.24" y2="1.905" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-1.905" x2="14.605" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="14.605" y1="-2.54" x2="13.335" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-1.905" x2="13.335" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-1.905" x2="12.065" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="12.065" y1="-2.54" x2="10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="9.525" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-2.54" x2="8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="8.255" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="1.905" x2="-15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.905" x2="-12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="1.905" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="12.7" y1="1.905" x2="12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="15.24" y1="1.905" x2="15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="15.24" y1="1.905" x2="15.875" y2="2.54" width="0.1524" layer="21"/>
<wire x1="17.145" y1="2.54" x2="15.875" y2="2.54" width="0.1524" layer="21"/>
<wire x1="17.145" y1="2.54" x2="17.78" y2="1.905" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-1.905" x2="17.145" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="17.145" y1="-2.54" x2="15.875" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-1.905" x2="15.875" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="17.78" y1="1.905" x2="17.78" y2="-1.905" width="0.1524" layer="21"/>
<pad name="1" x="-16.51" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-16.51" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-13.97" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-13.97" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="-11.43" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="-11.43" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="-8.89" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="-8.89" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="-6.35" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="-6.35" y="1.27" drill="1.016" shape="octagon"/>
<pad name="11" x="-3.81" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="12" x="-3.81" y="1.27" drill="1.016" shape="octagon"/>
<pad name="13" x="-1.27" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="14" x="-1.27" y="1.27" drill="1.016" shape="octagon"/>
<pad name="15" x="1.27" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="16" x="1.27" y="1.27" drill="1.016" shape="octagon"/>
<pad name="17" x="3.81" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="18" x="3.81" y="1.27" drill="1.016" shape="octagon"/>
<pad name="19" x="6.35" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="20" x="6.35" y="1.27" drill="1.016" shape="octagon"/>
<pad name="21" x="8.89" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="22" x="8.89" y="1.27" drill="1.016" shape="octagon"/>
<pad name="23" x="11.43" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="24" x="11.43" y="1.27" drill="1.016" shape="octagon"/>
<pad name="25" x="13.97" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="26" x="13.97" y="1.27" drill="1.016" shape="octagon"/>
<pad name="27" x="16.51" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="28" x="16.51" y="1.27" drill="1.016" shape="octagon"/>
<text x="-17.78" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-17.78" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-16.764" y1="-1.524" x2="-16.256" y2="-1.016" layer="51"/>
<rectangle x1="-16.764" y1="1.016" x2="-16.256" y2="1.524" layer="51"/>
<rectangle x1="-14.224" y1="1.016" x2="-13.716" y2="1.524" layer="51"/>
<rectangle x1="-14.224" y1="-1.524" x2="-13.716" y2="-1.016" layer="51"/>
<rectangle x1="-11.684" y1="1.016" x2="-11.176" y2="1.524" layer="51"/>
<rectangle x1="-11.684" y1="-1.524" x2="-11.176" y2="-1.016" layer="51"/>
<rectangle x1="-9.144" y1="1.016" x2="-8.636" y2="1.524" layer="51"/>
<rectangle x1="-6.604" y1="1.016" x2="-6.096" y2="1.524" layer="51"/>
<rectangle x1="-4.064" y1="1.016" x2="-3.556" y2="1.524" layer="51"/>
<rectangle x1="-9.144" y1="-1.524" x2="-8.636" y2="-1.016" layer="51"/>
<rectangle x1="-6.604" y1="-1.524" x2="-6.096" y2="-1.016" layer="51"/>
<rectangle x1="-4.064" y1="-1.524" x2="-3.556" y2="-1.016" layer="51"/>
<rectangle x1="-1.524" y1="1.016" x2="-1.016" y2="1.524" layer="51"/>
<rectangle x1="-1.524" y1="-1.524" x2="-1.016" y2="-1.016" layer="51"/>
<rectangle x1="1.016" y1="1.016" x2="1.524" y2="1.524" layer="51"/>
<rectangle x1="1.016" y1="-1.524" x2="1.524" y2="-1.016" layer="51"/>
<rectangle x1="3.556" y1="1.016" x2="4.064" y2="1.524" layer="51"/>
<rectangle x1="3.556" y1="-1.524" x2="4.064" y2="-1.016" layer="51"/>
<rectangle x1="6.096" y1="1.016" x2="6.604" y2="1.524" layer="51"/>
<rectangle x1="6.096" y1="-1.524" x2="6.604" y2="-1.016" layer="51"/>
<rectangle x1="8.636" y1="1.016" x2="9.144" y2="1.524" layer="51"/>
<rectangle x1="8.636" y1="-1.524" x2="9.144" y2="-1.016" layer="51"/>
<rectangle x1="11.176" y1="1.016" x2="11.684" y2="1.524" layer="51"/>
<rectangle x1="11.176" y1="-1.524" x2="11.684" y2="-1.016" layer="51"/>
<rectangle x1="13.716" y1="1.016" x2="14.224" y2="1.524" layer="51"/>
<rectangle x1="13.716" y1="-1.524" x2="14.224" y2="-1.016" layer="51"/>
<rectangle x1="16.256" y1="1.016" x2="16.764" y2="1.524" layer="51"/>
<rectangle x1="16.256" y1="-1.524" x2="16.764" y2="-1.016" layer="51"/>
</package>
<package name="2X14/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-17.78" y1="-1.905" x2="-15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="-1.905" x2="-15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-15.24" y1="0.635" x2="-17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="0.635" x2="-17.78" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-16.51" y1="6.985" x2="-16.51" y2="1.27" width="0.762" layer="21"/>
<wire x1="-15.24" y1="-1.905" x2="-12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-1.905" x2="-12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="0.635" x2="-15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-13.97" y1="6.985" x2="-13.97" y2="1.27" width="0.762" layer="21"/>
<wire x1="-12.7" y1="-1.905" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="6.985" x2="-11.43" y2="1.27" width="0.762" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="6.985" x2="-8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="6.985" x2="8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-1.905" x2="12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="0.635" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="6.985" x2="11.43" y2="1.27" width="0.762" layer="21"/>
<wire x1="12.7" y1="-1.905" x2="15.24" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-1.905" x2="15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="15.24" y1="0.635" x2="12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="13.97" y1="6.985" x2="13.97" y2="1.27" width="0.762" layer="21"/>
<wire x1="15.24" y1="-1.905" x2="17.78" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-1.905" x2="17.78" y2="0.635" width="0.1524" layer="21"/>
<wire x1="17.78" y1="0.635" x2="15.24" y2="0.635" width="0.1524" layer="21"/>
<wire x1="16.51" y1="6.985" x2="16.51" y2="1.27" width="0.762" layer="21"/>
<pad name="2" x="-16.51" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="-13.97" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="6" x="-11.43" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="8" x="-8.89" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="10" x="-6.35" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="12" x="-3.81" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="14" x="-1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="16" x="1.27" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="18" x="3.81" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="20" x="6.35" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="22" x="8.89" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="24" x="11.43" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="26" x="13.97" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="28" x="16.51" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-16.51" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="-13.97" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="5" x="-11.43" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="7" x="-8.89" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="9" x="-6.35" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="11" x="-3.81" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="13" x="-1.27" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="15" x="1.27" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="17" x="3.81" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="19" x="6.35" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="21" x="8.89" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="23" x="11.43" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="25" x="13.97" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="27" x="16.51" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-18.415" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="19.685" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-16.891" y1="0.635" x2="-16.129" y2="1.143" layer="21"/>
<rectangle x1="-14.351" y1="0.635" x2="-13.589" y2="1.143" layer="21"/>
<rectangle x1="-11.811" y1="0.635" x2="-11.049" y2="1.143" layer="21"/>
<rectangle x1="-9.271" y1="0.635" x2="-8.509" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="8.509" y1="0.635" x2="9.271" y2="1.143" layer="21"/>
<rectangle x1="11.049" y1="0.635" x2="11.811" y2="1.143" layer="21"/>
<rectangle x1="13.589" y1="0.635" x2="14.351" y2="1.143" layer="21"/>
<rectangle x1="16.129" y1="0.635" x2="16.891" y2="1.143" layer="21"/>
<rectangle x1="-16.891" y1="-2.921" x2="-16.129" y2="-1.905" layer="21"/>
<rectangle x1="-14.351" y1="-2.921" x2="-13.589" y2="-1.905" layer="21"/>
<rectangle x1="-16.891" y1="-5.461" x2="-16.129" y2="-4.699" layer="21"/>
<rectangle x1="-16.891" y1="-4.699" x2="-16.129" y2="-2.921" layer="51"/>
<rectangle x1="-14.351" y1="-4.699" x2="-13.589" y2="-2.921" layer="51"/>
<rectangle x1="-14.351" y1="-5.461" x2="-13.589" y2="-4.699" layer="21"/>
<rectangle x1="-11.811" y1="-2.921" x2="-11.049" y2="-1.905" layer="21"/>
<rectangle x1="-9.271" y1="-2.921" x2="-8.509" y2="-1.905" layer="21"/>
<rectangle x1="-11.811" y1="-5.461" x2="-11.049" y2="-4.699" layer="21"/>
<rectangle x1="-11.811" y1="-4.699" x2="-11.049" y2="-2.921" layer="51"/>
<rectangle x1="-9.271" y1="-4.699" x2="-8.509" y2="-2.921" layer="51"/>
<rectangle x1="-9.271" y1="-5.461" x2="-8.509" y2="-4.699" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-6.731" y1="-5.461" x2="-5.969" y2="-4.699" layer="21"/>
<rectangle x1="-6.731" y1="-4.699" x2="-5.969" y2="-2.921" layer="51"/>
<rectangle x1="-4.191" y1="-4.699" x2="-3.429" y2="-2.921" layer="51"/>
<rectangle x1="-4.191" y1="-5.461" x2="-3.429" y2="-4.699" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-5.461" x2="-0.889" y2="-4.699" layer="21"/>
<rectangle x1="-1.651" y1="-4.699" x2="-0.889" y2="-2.921" layer="51"/>
<rectangle x1="0.889" y1="-4.699" x2="1.651" y2="-2.921" layer="51"/>
<rectangle x1="0.889" y1="-5.461" x2="1.651" y2="-4.699" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-5.461" x2="4.191" y2="-4.699" layer="21"/>
<rectangle x1="3.429" y1="-4.699" x2="4.191" y2="-2.921" layer="51"/>
<rectangle x1="5.969" y1="-4.699" x2="6.731" y2="-2.921" layer="51"/>
<rectangle x1="5.969" y1="-5.461" x2="6.731" y2="-4.699" layer="21"/>
<rectangle x1="8.509" y1="-2.921" x2="9.271" y2="-1.905" layer="21"/>
<rectangle x1="11.049" y1="-2.921" x2="11.811" y2="-1.905" layer="21"/>
<rectangle x1="8.509" y1="-5.461" x2="9.271" y2="-4.699" layer="21"/>
<rectangle x1="8.509" y1="-4.699" x2="9.271" y2="-2.921" layer="51"/>
<rectangle x1="11.049" y1="-4.699" x2="11.811" y2="-2.921" layer="51"/>
<rectangle x1="11.049" y1="-5.461" x2="11.811" y2="-4.699" layer="21"/>
<rectangle x1="13.589" y1="-2.921" x2="14.351" y2="-1.905" layer="21"/>
<rectangle x1="16.129" y1="-2.921" x2="16.891" y2="-1.905" layer="21"/>
<rectangle x1="13.589" y1="-5.461" x2="14.351" y2="-4.699" layer="21"/>
<rectangle x1="13.589" y1="-4.699" x2="14.351" y2="-2.921" layer="51"/>
<rectangle x1="16.129" y1="-4.699" x2="16.891" y2="-2.921" layer="51"/>
<rectangle x1="16.129" y1="-5.461" x2="16.891" y2="-4.699" layer="21"/>
</package>
<package name="1X02">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.6162" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
</package>
<package name="1X02/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.445" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
</package>
<package name="1X04">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-5.1562" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
</package>
<package name="1X04/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-5.715" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.985" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINH2X14">
<wire x1="-6.35" y1="-20.32" x2="8.89" y2="-20.32" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-20.32" x2="8.89" y2="17.78" width="0.4064" layer="94"/>
<wire x1="8.89" y1="17.78" x2="-6.35" y2="17.78" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="17.78" x2="-6.35" y2="-20.32" width="0.4064" layer="94"/>
<text x="-6.35" y="18.415" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-22.86" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="15.24" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="15.24" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-2.54" y="12.7" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="12.7" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="10.16" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="7.62" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="9" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="5.08" y="5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="11" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="12" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="13" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="14" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="15" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="16" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="17" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="18" x="5.08" y="-5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="19" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="20" x="5.08" y="-7.62" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="21" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="22" x="5.08" y="-10.16" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="23" x="-2.54" y="-12.7" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="24" x="5.08" y="-12.7" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="25" x="-2.54" y="-15.24" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="26" x="5.08" y="-15.24" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="27" x="-2.54" y="-17.78" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="28" x="5.08" y="-17.78" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
<symbol name="PINHD2">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD4">
<wire x1="-6.35" y1="-5.08" x2="1.27" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-5.08" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-2X14" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X14" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X14">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="16" pad="16"/>
<connect gate="A" pin="17" pad="17"/>
<connect gate="A" pin="18" pad="18"/>
<connect gate="A" pin="19" pad="19"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="20" pad="20"/>
<connect gate="A" pin="21" pad="21"/>
<connect gate="A" pin="22" pad="22"/>
<connect gate="A" pin="23" pad="23"/>
<connect gate="A" pin="24" pad="24"/>
<connect gate="A" pin="25" pad="25"/>
<connect gate="A" pin="26" pad="26"/>
<connect gate="A" pin="27" pad="27"/>
<connect gate="A" pin="28" pad="28"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="2X14/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="16" pad="16"/>
<connect gate="A" pin="17" pad="17"/>
<connect gate="A" pin="18" pad="18"/>
<connect gate="A" pin="19" pad="19"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="20" pad="20"/>
<connect gate="A" pin="21" pad="21"/>
<connect gate="A" pin="22" pad="22"/>
<connect gate="A" pin="23" pad="23"/>
<connect gate="A" pin="24" pad="24"/>
<connect gate="A" pin="25" pad="25"/>
<connect gate="A" pin="26" pad="26"/>
<connect gate="A" pin="27" pad="27"/>
<connect gate="A" pin="28" pad="28"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X2" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X02">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X02/90">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X4" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X04">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X04/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead" urn="urn:adsk.eagle:library:325">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="2X05" urn="urn:adsk.eagle:footprint:22358/1" library_version="2">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-2.54" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-2.54" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.54" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-1.905" x2="-6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="1.905" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.27" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="3.175" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.175" y1="2.54" x2="3.81" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="3.175" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-2.54" x2="0.635" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.54" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-2.54" x2="-4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="4.445" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.905" x2="4.445" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.445" y1="2.54" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="2.54" x2="6.35" y2="1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="2" x="-5.08" y="1.27" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="1.27" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="1.27" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-1.27" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="1.27" drill="1.016" shape="octagon"/>
<text x="-6.35" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-5.334" y1="-1.524" x2="-4.826" y2="-1.016" layer="51"/>
<rectangle x1="-5.334" y1="1.016" x2="-4.826" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
<rectangle x1="4.826" y1="1.016" x2="5.334" y2="1.524" layer="51"/>
<rectangle x1="4.826" y1="-1.524" x2="5.334" y2="-1.016" layer="51"/>
</package>
<package name="2X05/90" urn="urn:adsk.eagle:footprint:22359/1" library_version="2">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-6.35" y1="-1.905" x2="-3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.635" x2="-6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="0.635" x2="-6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="6.985" x2="-5.08" y2="1.27" width="0.762" layer="21"/>
<wire x1="-3.81" y1="-1.905" x2="-1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="6.985" x2="-2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.635" x2="-1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="6.985" x2="0" y2="1.27" width="0.762" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="3.81" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="6.985" x2="2.54" y2="1.27" width="0.762" layer="21"/>
<wire x1="3.81" y1="-1.905" x2="6.35" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-1.905" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="3.81" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="6.985" x2="5.08" y2="1.27" width="0.762" layer="21"/>
<pad name="2" x="-5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="4" x="-2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="6" x="0" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="8" x="2.54" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="10" x="5.08" y="-3.81" drill="1.016" shape="octagon"/>
<pad name="1" x="-5.08" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="3" x="-2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="5" x="0" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="7" x="2.54" y="-6.35" drill="1.016" shape="octagon"/>
<pad name="9" x="5.08" y="-6.35" drill="1.016" shape="octagon"/>
<text x="-6.985" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="8.255" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-5.461" y1="0.635" x2="-4.699" y2="1.143" layer="21"/>
<rectangle x1="-2.921" y1="0.635" x2="-2.159" y2="1.143" layer="21"/>
<rectangle x1="-0.381" y1="0.635" x2="0.381" y2="1.143" layer="21"/>
<rectangle x1="2.159" y1="0.635" x2="2.921" y2="1.143" layer="21"/>
<rectangle x1="4.699" y1="0.635" x2="5.461" y2="1.143" layer="21"/>
<rectangle x1="-5.461" y1="-2.921" x2="-4.699" y2="-1.905" layer="21"/>
<rectangle x1="-2.921" y1="-2.921" x2="-2.159" y2="-1.905" layer="21"/>
<rectangle x1="-5.461" y1="-5.461" x2="-4.699" y2="-4.699" layer="21"/>
<rectangle x1="-5.461" y1="-4.699" x2="-4.699" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-4.699" x2="-2.159" y2="-2.921" layer="51"/>
<rectangle x1="-2.921" y1="-5.461" x2="-2.159" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-2.921" x2="0.381" y2="-1.905" layer="21"/>
<rectangle x1="2.159" y1="-2.921" x2="2.921" y2="-1.905" layer="21"/>
<rectangle x1="-0.381" y1="-5.461" x2="0.381" y2="-4.699" layer="21"/>
<rectangle x1="-0.381" y1="-4.699" x2="0.381" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-4.699" x2="2.921" y2="-2.921" layer="51"/>
<rectangle x1="2.159" y1="-5.461" x2="2.921" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-2.921" x2="5.461" y2="-1.905" layer="21"/>
<rectangle x1="4.699" y1="-5.461" x2="5.461" y2="-4.699" layer="21"/>
<rectangle x1="4.699" y1="-4.699" x2="5.461" y2="-2.921" layer="51"/>
</package>
</packages>
<packages3d>
<package3d name="2X05" urn="urn:adsk.eagle:package:22470/2" type="model" library_version="2">
<description>PIN HEADER</description>
</package3d>
<package3d name="2X05/90" urn="urn:adsk.eagle:package:22471/1" type="box" library_version="2">
<description>PIN HEADER</description>
</package3d>
</packages3d>
<symbols>
<symbol name="PINH2X5" urn="urn:adsk.eagle:symbol:22357/1" library_version="2">
<wire x1="-6.35" y1="-7.62" x2="8.89" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="-7.62" x2="8.89" y2="7.62" width="0.4064" layer="94"/>
<wire x1="8.89" y1="7.62" x2="-6.35" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="8.255" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="5.08" y="5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="5.08" y="2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="5.08" y="0" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="7" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="5.08" y="-2.54" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
<pin name="9" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="5.08" y="-5.08" visible="pad" length="short" direction="pas" function="dot" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-2X5" urn="urn:adsk.eagle:component:22531/2" prefix="JP" uservalue="yes" library_version="2">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINH2X5" x="0" y="0"/>
</gates>
<devices>
<device name="" package="2X05">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22470/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="2X05/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:22471/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ST2378E">
<packages>
<package name="TSSOP20">
<smd name="1" x="-3.585" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="2" x="-2.935" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="3" x="-2.285" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="4" x="-1.635" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="5" x="-0.985" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="6" x="-0.335" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="7" x="0.315" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="8" x="0.965" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="P$9" x="1.615" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="P$10" x="2.265" y="-3.225" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="20" x="-3.585" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="19" x="-2.935" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="18" x="-2.285" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="17" x="-1.635" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="16" x="-0.985" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="15" x="-0.335" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="14" x="0.315" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="13" x="0.965" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="12" x="1.615" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<smd name="11" x="2.265" y="2.625" dx="0.95" dy="0.35" layer="1" rot="R90"/>
<wire x1="-3.81" y1="0.43125" x2="-3.81" y2="-1.03125" width="0.127" layer="21" curve="-180"/>
<wire x1="2.49" y1="1.94" x2="2.49" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="1.94" x2="2.49" y2="1.94" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-2.54" x2="2.49" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="1.94" x2="-3.81" y2="-2.54" width="0.127" layer="21"/>
<text x="-2.754" y="-0.929" size="1.016" layer="25" ratio="10">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="ST2378E">
<pin name="VCC" x="2.54" y="20.32" length="middle" rot="R270"/>
<pin name="VL" x="-2.54" y="20.32" length="middle" rot="R270"/>
<pin name="OE" x="7.62" y="20.32" length="middle" rot="R270"/>
<pin name="GND" x="2.54" y="-27.94" length="middle" rot="R90"/>
<pin name="I/O_1_L" x="-12.7" y="5.08" length="middle"/>
<pin name="I/O_2_L" x="-12.7" y="2.54" length="middle"/>
<pin name="I/O_3_L" x="-12.7" y="0" length="middle"/>
<pin name="I/O_4_L" x="-12.7" y="-2.54" length="middle"/>
<pin name="I/O_5_L" x="-12.7" y="-5.08" length="middle"/>
<pin name="I/O_6_L" x="-12.7" y="-7.62" length="middle"/>
<pin name="I/O_7_L" x="-12.7" y="-10.16" length="middle"/>
<pin name="I/O_8_L" x="-12.7" y="-12.7" length="middle"/>
<pin name="I/O_1_H" x="20.32" y="5.08" length="middle" rot="R180"/>
<pin name="I/O_2_H" x="20.32" y="2.54" length="middle" rot="R180"/>
<pin name="I/O_3_H" x="20.32" y="0" length="middle" rot="R180"/>
<pin name="I/O_4_H" x="20.32" y="-2.54" length="middle" rot="R180"/>
<pin name="I/O_5_H" x="20.32" y="-5.08" length="middle" rot="R180"/>
<pin name="I/O_6_H" x="20.32" y="-7.62" length="middle" rot="R180"/>
<pin name="I/O_7_H" x="20.32" y="-10.16" length="middle" rot="R180"/>
<pin name="I/O_8_H" x="20.32" y="-12.7" length="middle" rot="R180"/>
<wire x1="-7.62" y1="15.24" x2="15.24" y2="15.24" width="0.254" layer="94"/>
<wire x1="15.24" y1="15.24" x2="15.24" y2="-22.86" width="0.254" layer="94"/>
<wire x1="15.24" y1="-22.86" x2="-7.62" y2="-22.86" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-22.86" x2="-7.62" y2="15.24" width="0.254" layer="94"/>
<text x="10.16" y="16.51" size="1.778" layer="95">&gt;NAME</text>
<text x="10.16" y="-25.4" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ST2378E_TSSOP">
<gates>
<gate name="G$1" symbol="ST2378E" x="-5.08" y="2.54"/>
</gates>
<devices>
<device name="" package="TSSOP20">
<connects>
<connect gate="G$1" pin="GND" pad="P$10"/>
<connect gate="G$1" pin="I/O_1_H" pad="19"/>
<connect gate="G$1" pin="I/O_1_L" pad="2"/>
<connect gate="G$1" pin="I/O_2_H" pad="3"/>
<connect gate="G$1" pin="I/O_2_L" pad="18"/>
<connect gate="G$1" pin="I/O_3_H" pad="17"/>
<connect gate="G$1" pin="I/O_3_L" pad="4"/>
<connect gate="G$1" pin="I/O_4_H" pad="5"/>
<connect gate="G$1" pin="I/O_4_L" pad="16"/>
<connect gate="G$1" pin="I/O_5_H" pad="15"/>
<connect gate="G$1" pin="I/O_5_L" pad="6"/>
<connect gate="G$1" pin="I/O_6_H" pad="7"/>
<connect gate="G$1" pin="I/O_6_L" pad="14"/>
<connect gate="G$1" pin="I/O_7_H" pad="13"/>
<connect gate="G$1" pin="I/O_7_L" pad="8"/>
<connect gate="G$1" pin="I/O_8_H" pad="P$9"/>
<connect gate="G$1" pin="I/O_8_L" pad="12"/>
<connect gate="G$1" pin="OE" pad="11"/>
<connect gate="G$1" pin="VCC" pad="20"/>
<connect gate="G$1" pin="VL" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="empty" width="0" drill="0">
</class>
</classes>
<parts>
<part name="P4" library="pinhead" deviceset="PINHD-2X14" device=""/>
<part name="P3" library="pinhead" deviceset="PINHD-2X14" device=""/>
<part name="P2" library="pinhead" deviceset="PINHD-2X14" device=""/>
<part name="P1" library="pinhead" deviceset="PINHD-2X14" device=""/>
<part name="JP1" library="pinhead" deviceset="PINHD-1X2" device=""/>
<part name="BT_COM" library="pinhead" deviceset="PINHD-1X4" device=""/>
<part name="JP2" library="pinhead" deviceset="PINHD-1X2" device=""/>
<part name="&lt;P_MM1" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-2X5" device="" package3d_urn="urn:adsk.eagle:package:22470/2"/>
<part name="P_MM2&gt;" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-2X5" device="" package3d_urn="urn:adsk.eagle:package:22470/2"/>
<part name="P_MM3&gt;" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-2X5" device="" package3d_urn="urn:adsk.eagle:package:22470/2"/>
<part name="&lt;P_MM4" library="pinhead" library_urn="urn:adsk.eagle:library:325" deviceset="PINHD-2X5" device="" package3d_urn="urn:adsk.eagle:package:22470/2"/>
<part name="U$1" library="ST2378E" deviceset="ST2378E_TSSOP" device=""/>
<part name="U$2" library="ST2378E" deviceset="ST2378E_TSSOP" device=""/>
<part name="U$3" library="ST2378E" deviceset="ST2378E_TSSOP" device=""/>
<part name="U$4" library="ST2378E" deviceset="ST2378E_TSSOP" device=""/>
<part name="JP3" library="pinhead" deviceset="PINHD-1X2" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="P4" gate="A" x="40.64" y="27.94"/>
<instance part="P3" gate="A" x="40.64" y="71.12"/>
<instance part="P2" gate="A" x="40.64" y="114.3"/>
<instance part="P1" gate="A" x="40.64" y="157.48"/>
<instance part="JP1" gate="G$1" x="73.66" y="170.18" rot="MR0"/>
<instance part="BT_COM" gate="A" x="73.66" y="142.24" rot="MR0"/>
<instance part="JP2" gate="G$1" x="101.6" y="170.18" rot="MR0"/>
<instance part="&lt;P_MM1" gate="A" x="231.14" y="147.32"/>
<instance part="P_MM2&gt;" gate="A" x="165.1" y="88.9"/>
<instance part="P_MM3&gt;" gate="A" x="289.56" y="86.36"/>
<instance part="&lt;P_MM4" gate="A" x="226.06" y="33.02"/>
<instance part="U$1" gate="G$1" x="162.56" y="152.4"/>
<instance part="U$2" gate="G$1" x="101.6" y="93.98"/>
<instance part="U$3" gate="G$1" x="226.06" y="91.44"/>
<instance part="U$4" gate="G$1" x="162.56" y="38.1"/>
<instance part="JP3" gate="G$1" x="101.6" y="157.48" rot="MR0"/>
</instances>
<busses>
</busses>
<nets>
<net name="FPGA_40" class="0">
<segment>
<pinref part="P1" gate="A" pin="1"/>
<wire x1="38.1" y1="172.72" x2="17.78" y2="172.72" width="0.1524" layer="91"/>
<label x="20.32" y="172.72" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="149.86" y1="157.48" x2="134.62" y2="157.48" width="0.1524" layer="91"/>
<label x="137.16" y="157.48" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_1_L"/>
</segment>
</net>
<net name="FPGA_42" class="0">
<segment>
<pinref part="P1" gate="A" pin="3"/>
<wire x1="38.1" y1="170.18" x2="17.78" y2="170.18" width="0.1524" layer="91"/>
<label x="20.32" y="170.18" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="149.86" y1="152.4" x2="134.62" y2="152.4" width="0.1524" layer="91"/>
<label x="137.16" y="152.4" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_3_L"/>
</segment>
</net>
<net name="FPGA_44" class="0">
<segment>
<pinref part="P1" gate="A" pin="5"/>
<wire x1="38.1" y1="167.64" x2="17.78" y2="167.64" width="0.1524" layer="91"/>
<label x="20.32" y="167.64" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="149.86" y1="147.32" x2="134.62" y2="147.32" width="0.1524" layer="91"/>
<label x="137.16" y="147.32" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_5_L"/>
</segment>
</net>
<net name="FPGA_47" class="0">
<segment>
<pinref part="P1" gate="A" pin="7"/>
<wire x1="38.1" y1="165.1" x2="17.78" y2="165.1" width="0.1524" layer="91"/>
<label x="20.32" y="165.1" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="149.86" y1="142.24" x2="134.62" y2="142.24" width="0.1524" layer="91"/>
<label x="137.16" y="142.24" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_7_L"/>
</segment>
</net>
<net name="FPGA_51" class="0">
<segment>
<pinref part="P1" gate="A" pin="9"/>
<wire x1="38.1" y1="162.56" x2="17.78" y2="162.56" width="0.1524" layer="91"/>
<label x="20.32" y="162.56" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="185.42" y1="172.72" x2="170.18" y2="172.72" width="0.1524" layer="91"/>
<label x="172.72" y="172.72" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="OE"/>
</segment>
</net>
<net name="FPGA_53" class="0">
<segment>
<pinref part="P1" gate="A" pin="11"/>
<wire x1="38.1" y1="160.02" x2="17.78" y2="160.02" width="0.1524" layer="91"/>
<label x="20.32" y="160.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_57" class="0">
<segment>
<pinref part="P1" gate="A" pin="13"/>
<wire x1="38.1" y1="157.48" x2="17.78" y2="157.48" width="0.1524" layer="91"/>
<label x="20.32" y="157.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_59" class="0">
<segment>
<pinref part="P1" gate="A" pin="15"/>
<wire x1="38.1" y1="154.94" x2="17.78" y2="154.94" width="0.1524" layer="91"/>
<label x="20.32" y="154.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_63" class="0">
<segment>
<pinref part="P1" gate="A" pin="17"/>
<wire x1="38.1" y1="152.4" x2="17.78" y2="152.4" width="0.1524" layer="91"/>
<label x="20.32" y="152.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_65" class="0">
<segment>
<pinref part="P1" gate="A" pin="19"/>
<wire x1="38.1" y1="149.86" x2="17.78" y2="149.86" width="0.1524" layer="91"/>
<label x="20.32" y="149.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_69" class="0">
<segment>
<pinref part="P1" gate="A" pin="21"/>
<wire x1="38.1" y1="147.32" x2="17.78" y2="147.32" width="0.1524" layer="91"/>
<label x="20.32" y="147.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_71" class="0">
<segment>
<pinref part="P1" gate="A" pin="23"/>
<wire x1="38.1" y1="144.78" x2="17.78" y2="144.78" width="0.1524" layer="91"/>
<label x="20.32" y="144.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_GND" class="0">
<segment>
<pinref part="P1" gate="A" pin="25"/>
<wire x1="38.1" y1="142.24" x2="17.78" y2="142.24" width="0.1524" layer="91"/>
<label x="20.32" y="142.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P1" gate="A" pin="26"/>
<wire x1="45.72" y1="142.24" x2="66.04" y2="142.24" width="0.1524" layer="91"/>
<label x="53.34" y="142.24" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="38.1" y1="129.54" x2="17.78" y2="129.54" width="0.1524" layer="91"/>
<label x="20.32" y="129.54" size="1.778" layer="95"/>
<pinref part="P2" gate="A" pin="1"/>
</segment>
<segment>
<pinref part="P2" gate="A" pin="2"/>
<wire x1="45.72" y1="129.54" x2="66.04" y2="129.54" width="0.1524" layer="91"/>
<label x="53.34" y="129.54" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P2" gate="A" pin="26"/>
<wire x1="45.72" y1="99.06" x2="66.04" y2="99.06" width="0.1524" layer="91"/>
<label x="53.34" y="99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P2" gate="A" pin="27"/>
<wire x1="38.1" y1="96.52" x2="17.78" y2="96.52" width="0.1524" layer="91"/>
<label x="20.32" y="96.52" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P3" gate="A" pin="1"/>
<wire x1="38.1" y1="86.36" x2="17.78" y2="86.36" width="0.1524" layer="91"/>
<label x="20.32" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P3" gate="A" pin="2"/>
<wire x1="45.72" y1="86.36" x2="66.04" y2="86.36" width="0.1524" layer="91"/>
<label x="53.34" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P3" gate="A" pin="26"/>
<wire x1="45.72" y1="55.88" x2="66.04" y2="55.88" width="0.1524" layer="91"/>
<label x="53.34" y="55.88" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P3" gate="A" pin="27"/>
<wire x1="38.1" y1="53.34" x2="17.78" y2="53.34" width="0.1524" layer="91"/>
<label x="20.32" y="53.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P4" gate="A" pin="1"/>
<wire x1="38.1" y1="43.18" x2="17.78" y2="43.18" width="0.1524" layer="91"/>
<label x="20.32" y="43.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P4" gate="A" pin="2"/>
<wire x1="45.72" y1="43.18" x2="66.04" y2="43.18" width="0.1524" layer="91"/>
<label x="53.34" y="43.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P4" gate="A" pin="8"/>
<wire x1="45.72" y1="35.56" x2="66.04" y2="35.56" width="0.1524" layer="91"/>
<label x="53.34" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P4" gate="A" pin="9"/>
<wire x1="38.1" y1="33.02" x2="17.78" y2="33.02" width="0.1524" layer="91"/>
<label x="20.32" y="33.02" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="45.72" y1="33.02" x2="66.04" y2="33.02" width="0.1524" layer="91"/>
<label x="53.34" y="33.02" size="1.778" layer="95"/>
<pinref part="P4" gate="A" pin="10"/>
</segment>
<segment>
<pinref part="P4" gate="A" pin="25"/>
<wire x1="38.1" y1="12.7" x2="17.78" y2="12.7" width="0.1524" layer="91"/>
<label x="20.32" y="12.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P4" gate="A" pin="26"/>
<wire x1="45.72" y1="12.7" x2="66.04" y2="12.7" width="0.1524" layer="91"/>
<label x="53.34" y="12.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JP1" gate="G$1" pin="2"/>
<wire x1="76.2" y1="170.18" x2="96.52" y2="170.18" width="0.1524" layer="91"/>
<label x="83.82" y="170.18" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="BT_COM" gate="A" pin="2"/>
<wire x1="76.2" y1="144.78" x2="96.52" y2="144.78" width="0.1524" layer="91"/>
<label x="83.82" y="144.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JP2" gate="G$1" pin="2"/>
<wire x1="104.14" y1="170.18" x2="124.46" y2="170.18" width="0.1524" layer="91"/>
<label x="111.76" y="170.18" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="228.6" y1="152.4" x2="205.74" y2="152.4" width="0.1524" layer="91"/>
<label x="208.28" y="152.4" size="1.778" layer="95"/>
<pinref part="&lt;P_MM1" gate="A" pin="1"/>
</segment>
<segment>
<wire x1="162.56" y1="93.98" x2="142.24" y2="93.98" width="0.1524" layer="91"/>
<label x="144.78" y="93.98" size="1.778" layer="95"/>
<pinref part="P_MM2&gt;" gate="A" pin="1"/>
</segment>
<segment>
<wire x1="287.02" y1="91.44" x2="266.7" y2="91.44" width="0.1524" layer="91"/>
<label x="269.24" y="91.44" size="1.778" layer="95"/>
<pinref part="P_MM3&gt;" gate="A" pin="1"/>
</segment>
<segment>
<wire x1="223.52" y1="38.1" x2="203.2" y2="38.1" width="0.1524" layer="91"/>
<label x="205.74" y="38.1" size="1.778" layer="95"/>
<pinref part="&lt;P_MM4" gate="A" pin="1"/>
</segment>
<segment>
<wire x1="165.1" y1="124.46" x2="185.42" y2="124.46" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="GND"/>
<label x="170.18" y="124.46" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="104.14" y1="66.04" x2="124.46" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="GND"/>
<label x="109.22" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="228.6" y1="63.5" x2="248.92" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="GND"/>
<label x="233.68" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="165.1" y1="10.16" x2="185.42" y2="10.16" width="0.1524" layer="91"/>
<pinref part="U$4" gate="G$1" pin="GND"/>
<label x="170.18" y="10.16" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="104.14" y1="157.48" x2="124.46" y2="157.48" width="0.1524" layer="91"/>
<label x="111.76" y="157.48" size="1.778" layer="95"/>
<pinref part="JP3" gate="G$1" pin="2"/>
</segment>
</net>
<net name="FPGA_VCC" class="0">
<segment>
<pinref part="P1" gate="A" pin="27"/>
<wire x1="38.1" y1="139.7" x2="17.78" y2="139.7" width="0.1524" layer="91"/>
<label x="20.32" y="139.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P1" gate="A" pin="28"/>
<wire x1="45.72" y1="139.7" x2="66.04" y2="139.7" width="0.1524" layer="91"/>
<label x="53.34" y="139.7" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="45.72" y1="96.52" x2="66.04" y2="96.52" width="0.1524" layer="91"/>
<label x="53.34" y="96.52" size="1.778" layer="95"/>
<pinref part="P2" gate="A" pin="28"/>
</segment>
<segment>
<pinref part="P3" gate="A" pin="28"/>
<wire x1="45.72" y1="53.34" x2="66.04" y2="53.34" width="0.1524" layer="91"/>
<label x="53.34" y="53.34" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P4" gate="A" pin="27"/>
<wire x1="38.1" y1="10.16" x2="17.78" y2="10.16" width="0.1524" layer="91"/>
<label x="20.32" y="10.16" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="P4" gate="A" pin="28"/>
<wire x1="45.72" y1="10.16" x2="66.04" y2="10.16" width="0.1524" layer="91"/>
<label x="53.34" y="10.16" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="BT_COM" gate="A" pin="1"/>
<wire x1="76.2" y1="147.32" x2="96.52" y2="147.32" width="0.1524" layer="91"/>
<label x="83.82" y="147.32" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="144.78" y1="172.72" x2="160.02" y2="172.72" width="0.1524" layer="91"/>
<label x="147.32" y="172.72" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="VL"/>
</segment>
<segment>
<wire x1="83.82" y1="114.3" x2="99.06" y2="114.3" width="0.1524" layer="91"/>
<label x="86.36" y="114.3" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="VL"/>
</segment>
<segment>
<wire x1="208.28" y1="111.76" x2="223.52" y2="111.76" width="0.1524" layer="91"/>
<label x="210.82" y="111.76" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="VL"/>
</segment>
<segment>
<wire x1="144.78" y1="58.42" x2="160.02" y2="58.42" width="0.1524" layer="91"/>
<label x="147.32" y="58.42" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="VL"/>
</segment>
</net>
<net name="FPGA_41" class="0">
<segment>
<pinref part="P1" gate="A" pin="2"/>
<wire x1="45.72" y1="172.72" x2="66.04" y2="172.72" width="0.1524" layer="91"/>
<label x="53.34" y="172.72" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="134.62" y1="154.94" x2="149.86" y2="154.94" width="0.1524" layer="91"/>
<label x="137.16" y="154.94" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_2_L"/>
</segment>
</net>
<net name="FPGA_43" class="0">
<segment>
<pinref part="P1" gate="A" pin="4"/>
<wire x1="45.72" y1="170.18" x2="66.04" y2="170.18" width="0.1524" layer="91"/>
<label x="53.34" y="170.18" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="134.62" y1="149.86" x2="149.86" y2="149.86" width="0.1524" layer="91"/>
<label x="137.16" y="149.86" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_4_L"/>
</segment>
</net>
<net name="FPGA_45" class="0">
<segment>
<pinref part="P1" gate="A" pin="6"/>
<wire x1="45.72" y1="167.64" x2="66.04" y2="167.64" width="0.1524" layer="91"/>
<label x="53.34" y="167.64" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="134.62" y1="144.78" x2="149.86" y2="144.78" width="0.1524" layer="91"/>
<label x="137.16" y="144.78" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_6_L"/>
</segment>
</net>
<net name="FPGA_48" class="0">
<segment>
<pinref part="P1" gate="A" pin="8"/>
<wire x1="45.72" y1="165.1" x2="66.04" y2="165.1" width="0.1524" layer="91"/>
<label x="53.34" y="165.1" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="134.62" y1="139.7" x2="149.86" y2="139.7" width="0.1524" layer="91"/>
<label x="137.16" y="139.7" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_8_L"/>
</segment>
</net>
<net name="FPGA_52" class="0">
<segment>
<pinref part="P1" gate="A" pin="10"/>
<wire x1="45.72" y1="162.56" x2="66.04" y2="162.56" width="0.1524" layer="91"/>
<label x="53.34" y="162.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_55" class="0">
<segment>
<pinref part="P1" gate="A" pin="12"/>
<wire x1="45.72" y1="160.02" x2="66.04" y2="160.02" width="0.1524" layer="91"/>
<label x="53.34" y="160.02" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_58" class="0">
<segment>
<pinref part="P1" gate="A" pin="14"/>
<wire x1="45.72" y1="157.48" x2="66.04" y2="157.48" width="0.1524" layer="91"/>
<label x="53.34" y="157.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_60" class="0">
<segment>
<pinref part="P1" gate="A" pin="16"/>
<wire x1="45.72" y1="154.94" x2="66.04" y2="154.94" width="0.1524" layer="91"/>
<label x="53.34" y="154.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_64" class="0">
<segment>
<pinref part="P1" gate="A" pin="18"/>
<wire x1="45.72" y1="152.4" x2="66.04" y2="152.4" width="0.1524" layer="91"/>
<label x="53.34" y="152.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_67" class="0">
<segment>
<pinref part="P1" gate="A" pin="20"/>
<wire x1="45.72" y1="149.86" x2="66.04" y2="149.86" width="0.1524" layer="91"/>
<label x="53.34" y="149.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_70" class="0">
<segment>
<pinref part="P1" gate="A" pin="22"/>
<wire x1="45.72" y1="147.32" x2="66.04" y2="147.32" width="0.1524" layer="91"/>
<label x="53.34" y="147.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_72" class="0">
<segment>
<pinref part="P1" gate="A" pin="24"/>
<wire x1="45.72" y1="144.78" x2="66.04" y2="144.78" width="0.1524" layer="91"/>
<label x="53.34" y="144.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_73" class="0">
<segment>
<pinref part="P2" gate="A" pin="3"/>
<wire x1="38.1" y1="127" x2="17.78" y2="127" width="0.1524" layer="91"/>
<label x="20.32" y="127" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="88.9" y1="99.06" x2="73.66" y2="99.06" width="0.1524" layer="91"/>
<label x="76.2" y="99.06" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_1_L"/>
</segment>
</net>
<net name="FPGA_75" class="0">
<segment>
<pinref part="P2" gate="A" pin="5"/>
<wire x1="38.1" y1="124.46" x2="17.78" y2="124.46" width="0.1524" layer="91"/>
<label x="20.32" y="124.46" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="88.9" y1="93.98" x2="73.66" y2="93.98" width="0.1524" layer="91"/>
<label x="76.2" y="93.98" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_3_L"/>
</segment>
</net>
<net name="FPGA_79" class="0">
<segment>
<pinref part="P2" gate="A" pin="7"/>
<wire x1="38.1" y1="121.92" x2="17.78" y2="121.92" width="0.1524" layer="91"/>
<label x="20.32" y="121.92" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="88.9" y1="88.9" x2="73.66" y2="88.9" width="0.1524" layer="91"/>
<label x="76.2" y="88.9" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_5_L"/>
</segment>
</net>
<net name="FPGA_81" class="0">
<segment>
<pinref part="P2" gate="A" pin="9"/>
<wire x1="38.1" y1="119.38" x2="17.78" y2="119.38" width="0.1524" layer="91"/>
<label x="20.32" y="119.38" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_87" class="0">
<segment>
<pinref part="P2" gate="A" pin="11"/>
<wire x1="38.1" y1="116.84" x2="17.78" y2="116.84" width="0.1524" layer="91"/>
<label x="20.32" y="116.84" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="88.9" y1="83.82" x2="73.66" y2="83.82" width="0.1524" layer="91"/>
<label x="76.2" y="83.82" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_7_L"/>
</segment>
</net>
<net name="FPGA_89" class="0">
<segment>
<pinref part="P2" gate="A" pin="13"/>
<wire x1="38.1" y1="114.3" x2="17.78" y2="114.3" width="0.1524" layer="91"/>
<label x="20.32" y="114.3" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="124.46" y1="114.3" x2="109.22" y2="114.3" width="0.1524" layer="91"/>
<label x="111.76" y="114.3" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="OE"/>
</segment>
</net>
<net name="FPGA_91" class="0">
<segment>
<pinref part="P2" gate="A" pin="15"/>
<wire x1="38.1" y1="111.76" x2="17.78" y2="111.76" width="0.1524" layer="91"/>
<label x="20.32" y="111.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_93" class="0">
<segment>
<pinref part="P2" gate="A" pin="17"/>
<wire x1="38.1" y1="109.22" x2="17.78" y2="109.22" width="0.1524" layer="91"/>
<label x="20.32" y="109.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_96" class="0">
<segment>
<pinref part="P2" gate="A" pin="19"/>
<wire x1="38.1" y1="106.68" x2="17.78" y2="106.68" width="0.1524" layer="91"/>
<label x="20.32" y="106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_99" class="0">
<segment>
<wire x1="38.1" y1="104.14" x2="17.78" y2="104.14" width="0.1524" layer="91"/>
<label x="20.32" y="104.14" size="1.778" layer="95"/>
<pinref part="P2" gate="A" pin="21"/>
</segment>
</net>
<net name="FPGA_101" class="0">
<segment>
<pinref part="P2" gate="A" pin="23"/>
<wire x1="38.1" y1="101.6" x2="17.78" y2="101.6" width="0.1524" layer="91"/>
<label x="20.32" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_104" class="0">
<segment>
<pinref part="P2" gate="A" pin="25"/>
<wire x1="38.1" y1="99.06" x2="17.78" y2="99.06" width="0.1524" layer="91"/>
<label x="20.32" y="99.06" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="BT_COM" gate="A" pin="3"/>
<wire x1="76.2" y1="142.24" x2="96.52" y2="142.24" width="0.1524" layer="91"/>
<label x="83.82" y="142.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_74" class="0">
<segment>
<pinref part="P2" gate="A" pin="4"/>
<wire x1="45.72" y1="127" x2="66.04" y2="127" width="0.1524" layer="91"/>
<label x="53.34" y="127" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="73.66" y1="96.52" x2="88.9" y2="96.52" width="0.1524" layer="91"/>
<label x="76.2" y="96.52" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_2_L"/>
</segment>
</net>
<net name="FPGA_76" class="0">
<segment>
<pinref part="P2" gate="A" pin="6"/>
<wire x1="45.72" y1="124.46" x2="66.04" y2="124.46" width="0.1524" layer="91"/>
<label x="53.34" y="124.46" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_80" class="0">
<segment>
<pinref part="P2" gate="A" pin="8"/>
<wire x1="45.72" y1="121.92" x2="66.04" y2="121.92" width="0.1524" layer="91"/>
<label x="53.34" y="121.92" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_86" class="0">
<segment>
<pinref part="P2" gate="A" pin="10"/>
<wire x1="45.72" y1="119.38" x2="66.04" y2="119.38" width="0.1524" layer="91"/>
<label x="53.34" y="119.38" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="73.66" y1="86.36" x2="88.9" y2="86.36" width="0.1524" layer="91"/>
<label x="76.2" y="86.36" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_6_L"/>
</segment>
</net>
<net name="FPGA_88" class="0">
<segment>
<pinref part="P2" gate="A" pin="12"/>
<wire x1="45.72" y1="116.84" x2="66.04" y2="116.84" width="0.1524" layer="91"/>
<label x="53.34" y="116.84" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="73.66" y1="91.44" x2="88.9" y2="91.44" width="0.1524" layer="91"/>
<label x="76.2" y="91.44" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_4_L"/>
</segment>
<segment>
<wire x1="73.66" y1="81.28" x2="88.9" y2="81.28" width="0.1524" layer="91"/>
<label x="76.2" y="81.28" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_8_L"/>
</segment>
</net>
<net name="FPGA_90" class="0">
<segment>
<pinref part="P2" gate="A" pin="14"/>
<wire x1="45.72" y1="114.3" x2="66.04" y2="114.3" width="0.1524" layer="91"/>
<label x="53.34" y="114.3" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_92" class="0">
<segment>
<pinref part="P2" gate="A" pin="16"/>
<wire x1="45.72" y1="111.76" x2="66.04" y2="111.76" width="0.1524" layer="91"/>
<label x="53.34" y="111.76" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_94" class="0">
<segment>
<pinref part="P2" gate="A" pin="18"/>
<wire x1="45.72" y1="109.22" x2="66.04" y2="109.22" width="0.1524" layer="91"/>
<label x="53.34" y="109.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_97" class="0">
<segment>
<wire x1="45.72" y1="106.68" x2="66.04" y2="106.68" width="0.1524" layer="91"/>
<label x="53.34" y="106.68" size="1.778" layer="95"/>
<pinref part="P2" gate="A" pin="20"/>
</segment>
</net>
<net name="FPGA_100" class="0">
<segment>
<pinref part="P2" gate="A" pin="22"/>
<wire x1="45.72" y1="104.14" x2="66.04" y2="104.14" width="0.1524" layer="91"/>
<label x="53.34" y="104.14" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_103" class="0">
<segment>
<pinref part="P2" gate="A" pin="24"/>
<wire x1="45.72" y1="101.6" x2="66.04" y2="101.6" width="0.1524" layer="91"/>
<label x="53.34" y="101.6" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="BT_COM" gate="A" pin="4"/>
<wire x1="76.2" y1="139.7" x2="96.52" y2="139.7" width="0.1524" layer="91"/>
<label x="83.82" y="139.7" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_112" class="0">
<segment>
<pinref part="P3" gate="A" pin="3"/>
<wire x1="38.1" y1="83.82" x2="17.78" y2="83.82" width="0.1524" layer="91"/>
<label x="20.32" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="213.36" y1="96.52" x2="195.58" y2="96.52" width="0.1524" layer="91"/>
<label x="200.66" y="96.52" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_1_L"/>
</segment>
</net>
<net name="FPGA_114" class="0">
<segment>
<pinref part="P3" gate="A" pin="5"/>
<wire x1="38.1" y1="81.28" x2="17.78" y2="81.28" width="0.1524" layer="91"/>
<label x="20.32" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="213.36" y1="91.44" x2="195.58" y2="91.44" width="0.1524" layer="91"/>
<label x="200.66" y="91.44" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_3_L"/>
</segment>
</net>
<net name="FPGA_118" class="0">
<segment>
<pinref part="P3" gate="A" pin="7"/>
<wire x1="38.1" y1="78.74" x2="17.78" y2="78.74" width="0.1524" layer="91"/>
<label x="20.32" y="78.74" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="213.36" y1="86.36" x2="195.58" y2="86.36" width="0.1524" layer="91"/>
<label x="200.66" y="86.36" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_5_L"/>
</segment>
</net>
<net name="FPGA_120" class="0">
<segment>
<pinref part="P3" gate="A" pin="9"/>
<wire x1="38.1" y1="76.2" x2="17.78" y2="76.2" width="0.1524" layer="91"/>
<label x="20.32" y="76.2" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="213.36" y1="81.28" x2="195.58" y2="81.28" width="0.1524" layer="91"/>
<label x="200.66" y="81.28" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_7_L"/>
</segment>
</net>
<net name="FPGA_122" class="0">
<segment>
<pinref part="P3" gate="A" pin="11"/>
<wire x1="38.1" y1="73.66" x2="17.78" y2="73.66" width="0.1524" layer="91"/>
<label x="20.32" y="73.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_126" class="0">
<segment>
<pinref part="P3" gate="A" pin="13"/>
<wire x1="38.1" y1="71.12" x2="17.78" y2="71.12" width="0.1524" layer="91"/>
<label x="20.32" y="71.12" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="251.46" y1="111.76" x2="233.68" y2="111.76" width="0.1524" layer="91"/>
<label x="236.22" y="111.76" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="OE"/>
</segment>
</net>
<net name="FPGA_132" class="0">
<segment>
<pinref part="P3" gate="A" pin="15"/>
<wire x1="38.1" y1="68.58" x2="17.78" y2="68.58" width="0.1524" layer="91"/>
<label x="20.32" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_134" class="0">
<segment>
<pinref part="P3" gate="A" pin="17"/>
<wire x1="38.1" y1="66.04" x2="17.78" y2="66.04" width="0.1524" layer="91"/>
<label x="20.32" y="66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_136" class="0">
<segment>
<pinref part="P3" gate="A" pin="19"/>
<wire x1="38.1" y1="63.5" x2="17.78" y2="63.5" width="0.1524" layer="91"/>
<label x="20.32" y="63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_139" class="0">
<segment>
<pinref part="P3" gate="A" pin="21"/>
<wire x1="38.1" y1="60.96" x2="17.78" y2="60.96" width="0.1524" layer="91"/>
<label x="20.32" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_142" class="0">
<segment>
<pinref part="P3" gate="A" pin="23"/>
<wire x1="38.1" y1="58.42" x2="17.78" y2="58.42" width="0.1524" layer="91"/>
<label x="20.32" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="132.08" y1="40.64" x2="149.86" y2="40.64" width="0.1524" layer="91"/>
<label x="137.16" y="40.64" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_2_L"/>
</segment>
</net>
<net name="FPGA_113" class="0">
<segment>
<pinref part="P3" gate="A" pin="4"/>
<wire x1="45.72" y1="83.82" x2="66.04" y2="83.82" width="0.1524" layer="91"/>
<label x="53.34" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="195.58" y1="93.98" x2="213.36" y2="93.98" width="0.1524" layer="91"/>
<label x="200.66" y="93.98" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_2_L"/>
</segment>
</net>
<net name="FPGA_115" class="0">
<segment>
<pinref part="P3" gate="A" pin="6"/>
<wire x1="45.72" y1="81.28" x2="66.04" y2="81.28" width="0.1524" layer="91"/>
<label x="53.34" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="195.58" y1="88.9" x2="213.36" y2="88.9" width="0.1524" layer="91"/>
<label x="200.66" y="88.9" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_4_L"/>
</segment>
</net>
<net name="FPGA_119" class="0">
<segment>
<pinref part="P3" gate="A" pin="8"/>
<wire x1="45.72" y1="78.74" x2="66.04" y2="78.74" width="0.1524" layer="91"/>
<label x="53.34" y="78.74" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_121" class="0">
<segment>
<pinref part="P3" gate="A" pin="10"/>
<wire x1="45.72" y1="76.2" x2="66.04" y2="76.2" width="0.1524" layer="91"/>
<label x="53.34" y="76.2" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="195.58" y1="83.82" x2="213.36" y2="83.82" width="0.1524" layer="91"/>
<label x="200.66" y="83.82" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_6_L"/>
</segment>
</net>
<net name="FPGA_125" class="0">
<segment>
<pinref part="P3" gate="A" pin="12"/>
<wire x1="45.72" y1="73.66" x2="66.04" y2="73.66" width="0.1524" layer="91"/>
<label x="53.34" y="73.66" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="195.58" y1="78.74" x2="213.36" y2="78.74" width="0.1524" layer="91"/>
<label x="200.66" y="78.74" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_8_L"/>
</segment>
</net>
<net name="FPGA_129" class="0">
<segment>
<pinref part="P3" gate="A" pin="14"/>
<wire x1="45.72" y1="71.12" x2="66.04" y2="71.12" width="0.1524" layer="91"/>
<label x="53.34" y="71.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_133" class="0">
<segment>
<pinref part="P3" gate="A" pin="16"/>
<wire x1="45.72" y1="68.58" x2="66.04" y2="68.58" width="0.1524" layer="91"/>
<label x="53.34" y="68.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_135" class="0">
<segment>
<pinref part="P3" gate="A" pin="18"/>
<wire x1="45.72" y1="66.04" x2="66.04" y2="66.04" width="0.1524" layer="91"/>
<label x="53.34" y="66.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_137" class="0">
<segment>
<pinref part="P3" gate="A" pin="20"/>
<wire x1="45.72" y1="63.5" x2="66.04" y2="63.5" width="0.1524" layer="91"/>
<label x="53.34" y="63.5" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_141" class="0">
<segment>
<pinref part="P3" gate="A" pin="22"/>
<wire x1="45.72" y1="60.96" x2="66.04" y2="60.96" width="0.1524" layer="91"/>
<label x="53.34" y="60.96" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="149.86" y1="43.18" x2="132.08" y2="43.18" width="0.1524" layer="91"/>
<label x="137.16" y="43.18" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_1_L"/>
</segment>
</net>
<net name="FPGA_143" class="0">
<segment>
<pinref part="P3" gate="A" pin="24"/>
<wire x1="45.72" y1="58.42" x2="66.04" y2="58.42" width="0.1524" layer="91"/>
<label x="53.34" y="58.42" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="149.86" y1="38.1" x2="132.08" y2="38.1" width="0.1524" layer="91"/>
<label x="137.16" y="38.1" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_3_L"/>
</segment>
</net>
<net name="FPGA_3" class="0">
<segment>
<pinref part="P4" gate="A" pin="3"/>
<wire x1="38.1" y1="40.64" x2="17.78" y2="40.64" width="0.1524" layer="91"/>
<label x="20.32" y="40.64" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_7" class="0">
<segment>
<pinref part="P4" gate="A" pin="5"/>
<wire x1="38.1" y1="38.1" x2="17.78" y2="38.1" width="0.1524" layer="91"/>
<label x="20.32" y="38.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_9" class="0">
<segment>
<pinref part="P4" gate="A" pin="7"/>
<wire x1="38.1" y1="35.56" x2="17.78" y2="35.56" width="0.1524" layer="91"/>
<label x="20.32" y="35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_17" class="0">
<segment>
<pinref part="P4" gate="A" pin="11"/>
<wire x1="38.1" y1="30.48" x2="17.78" y2="30.48" width="0.1524" layer="91"/>
<label x="20.32" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_22" class="0">
<segment>
<pinref part="P4" gate="A" pin="13"/>
<wire x1="38.1" y1="27.94" x2="17.78" y2="27.94" width="0.1524" layer="91"/>
<label x="20.32" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="149.86" y1="27.94" x2="132.08" y2="27.94" width="0.1524" layer="91"/>
<label x="137.16" y="27.94" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_7_L"/>
</segment>
</net>
<net name="FPGA_25" class="0">
<segment>
<pinref part="P4" gate="A" pin="15"/>
<wire x1="38.1" y1="25.4" x2="17.78" y2="25.4" width="0.1524" layer="91"/>
<label x="20.32" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="185.42" y1="58.42" x2="170.18" y2="58.42" width="0.1524" layer="91"/>
<label x="172.72" y="58.42" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="OE"/>
</segment>
</net>
<net name="FPGA_27" class="0">
<segment>
<pinref part="P4" gate="A" pin="17"/>
<wire x1="38.1" y1="22.86" x2="17.78" y2="22.86" width="0.1524" layer="91"/>
<label x="20.32" y="22.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_1V2" class="0">
<segment>
<wire x1="38.1" y1="20.32" x2="17.78" y2="20.32" width="0.1524" layer="91"/>
<label x="20.32" y="20.32" size="1.778" layer="95"/>
<pinref part="P4" gate="A" pin="19"/>
</segment>
<segment>
<pinref part="P4" gate="A" pin="20"/>
<wire x1="45.72" y1="20.32" x2="66.04" y2="20.32" width="0.1524" layer="91"/>
<label x="53.34" y="20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_30" class="0">
<segment>
<pinref part="P4" gate="A" pin="21"/>
<wire x1="38.1" y1="17.78" x2="17.78" y2="17.78" width="0.1524" layer="91"/>
<label x="20.32" y="17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_32" class="0">
<segment>
<pinref part="P4" gate="A" pin="23"/>
<wire x1="38.1" y1="15.24" x2="17.78" y2="15.24" width="0.1524" layer="91"/>
<label x="20.32" y="15.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_4" class="0">
<segment>
<pinref part="P4" gate="A" pin="4"/>
<wire x1="45.72" y1="40.64" x2="66.04" y2="40.64" width="0.1524" layer="91"/>
<label x="53.34" y="40.64" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="132.08" y1="35.56" x2="149.86" y2="35.56" width="0.1524" layer="91"/>
<label x="137.16" y="35.56" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_4_L"/>
</segment>
</net>
<net name="FPGA_8" class="0">
<segment>
<pinref part="P4" gate="A" pin="6"/>
<wire x1="45.72" y1="38.1" x2="66.04" y2="38.1" width="0.1524" layer="91"/>
<label x="53.34" y="38.1" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="149.86" y1="33.02" x2="132.08" y2="33.02" width="0.1524" layer="91"/>
<label x="137.16" y="33.02" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_5_L"/>
</segment>
</net>
<net name="FPGA_18" class="0">
<segment>
<pinref part="P4" gate="A" pin="12"/>
<wire x1="45.72" y1="30.48" x2="66.04" y2="30.48" width="0.1524" layer="91"/>
<label x="53.34" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="132.08" y1="30.48" x2="149.86" y2="30.48" width="0.1524" layer="91"/>
<label x="137.16" y="30.48" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_6_L"/>
</segment>
</net>
<net name="FPGA_21" class="0">
<segment>
<pinref part="P4" gate="A" pin="14"/>
<wire x1="45.72" y1="27.94" x2="66.04" y2="27.94" width="0.1524" layer="91"/>
<label x="53.34" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="132.08" y1="25.4" x2="149.86" y2="25.4" width="0.1524" layer="91"/>
<label x="137.16" y="25.4" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_8_L"/>
</segment>
</net>
<net name="FPGA_24" class="0">
<segment>
<pinref part="P4" gate="A" pin="16"/>
<wire x1="45.72" y1="25.4" x2="66.04" y2="25.4" width="0.1524" layer="91"/>
<label x="53.34" y="25.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_26" class="0">
<segment>
<wire x1="45.72" y1="22.86" x2="66.04" y2="22.86" width="0.1524" layer="91"/>
<label x="53.34" y="22.86" size="1.778" layer="95"/>
<pinref part="P4" gate="A" pin="18"/>
</segment>
</net>
<net name="FPGA_28" class="0">
<segment>
<pinref part="P4" gate="A" pin="22"/>
<wire x1="45.72" y1="17.78" x2="66.04" y2="17.78" width="0.1524" layer="91"/>
<label x="53.34" y="17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="FPGA_31" class="0">
<segment>
<pinref part="P4" gate="A" pin="24"/>
<wire x1="45.72" y1="15.24" x2="66.04" y2="15.24" width="0.1524" layer="91"/>
<label x="53.34" y="15.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="VIN" class="0">
<segment>
<pinref part="JP1" gate="G$1" pin="1"/>
<wire x1="76.2" y1="172.72" x2="96.52" y2="172.72" width="0.1524" layer="91"/>
<label x="83.82" y="172.72" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="236.22" y1="152.4" x2="256.54" y2="152.4" width="0.1524" layer="91"/>
<label x="243.84" y="152.4" size="1.778" layer="95"/>
<pinref part="&lt;P_MM1" gate="A" pin="2"/>
</segment>
<segment>
<wire x1="170.18" y1="93.98" x2="190.5" y2="93.98" width="0.1524" layer="91"/>
<label x="177.8" y="93.98" size="1.778" layer="95"/>
<pinref part="P_MM2&gt;" gate="A" pin="2"/>
</segment>
<segment>
<wire x1="294.64" y1="91.44" x2="314.96" y2="91.44" width="0.1524" layer="91"/>
<label x="302.26" y="91.44" size="1.778" layer="95"/>
<pinref part="P_MM3&gt;" gate="A" pin="2"/>
</segment>
<segment>
<wire x1="231.14" y1="38.1" x2="251.46" y2="38.1" width="0.1524" layer="91"/>
<label x="238.76" y="38.1" size="1.778" layer="95"/>
<pinref part="&lt;P_MM4" gate="A" pin="2"/>
</segment>
</net>
<net name="VCC" class="0">
<segment>
<pinref part="JP2" gate="G$1" pin="1"/>
<wire x1="104.14" y1="172.72" x2="124.46" y2="172.72" width="0.1524" layer="91"/>
<label x="111.76" y="172.72" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="165.1" y1="177.8" x2="175.26" y2="177.8" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="VCC"/>
<wire x1="165.1" y1="172.72" x2="165.1" y2="177.8" width="0.1524" layer="91"/>
<label x="167.64" y="177.8" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="104.14" y1="119.38" x2="114.3" y2="119.38" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="VCC"/>
<wire x1="104.14" y1="114.3" x2="104.14" y2="119.38" width="0.1524" layer="91"/>
<label x="106.68" y="119.38" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="228.6" y1="116.84" x2="238.76" y2="116.84" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="VCC"/>
<wire x1="228.6" y1="111.76" x2="228.6" y2="116.84" width="0.1524" layer="91"/>
<label x="231.14" y="116.84" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="165.1" y1="63.5" x2="175.26" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U$4" gate="G$1" pin="VCC"/>
<wire x1="165.1" y1="58.42" x2="165.1" y2="63.5" width="0.1524" layer="91"/>
<label x="167.64" y="63.5" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="104.14" y1="160.02" x2="124.46" y2="160.02" width="0.1524" layer="91"/>
<label x="111.76" y="160.02" size="1.778" layer="95"/>
<pinref part="JP3" gate="G$1" pin="1"/>
</segment>
</net>
<net name="FPGA_144" class="0">
<segment>
<pinref part="P3" gate="A" pin="25"/>
<wire x1="38.1" y1="55.88" x2="17.78" y2="55.88" width="0.1524" layer="91"/>
<label x="20.32" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="AR1_D0" class="0">
<segment>
<pinref part="&lt;P_MM1" gate="A" pin="3"/>
<wire x1="228.6" y1="149.86" x2="205.74" y2="149.86" width="0.1524" layer="91"/>
<label x="208.28" y="149.86" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="200.66" y1="157.48" x2="182.88" y2="157.48" width="0.1524" layer="91"/>
<label x="187.96" y="157.48" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_1_H"/>
</segment>
</net>
<net name="AR1_D2" class="0">
<segment>
<pinref part="&lt;P_MM1" gate="A" pin="5"/>
<wire x1="228.6" y1="147.32" x2="205.74" y2="147.32" width="0.1524" layer="91"/>
<label x="208.28" y="147.32" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="200.66" y1="152.4" x2="182.88" y2="152.4" width="0.1524" layer="91"/>
<label x="187.96" y="152.4" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_3_H"/>
</segment>
</net>
<net name="AR1_D7" class="0">
<segment>
<pinref part="&lt;P_MM1" gate="A" pin="7"/>
<wire x1="228.6" y1="144.78" x2="205.74" y2="144.78" width="0.1524" layer="91"/>
<label x="208.28" y="144.78" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="200.66" y1="147.32" x2="182.88" y2="147.32" width="0.1524" layer="91"/>
<label x="187.96" y="147.32" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_5_H"/>
</segment>
</net>
<net name="AR1_D12" class="0">
<segment>
<pinref part="&lt;P_MM1" gate="A" pin="9"/>
<wire x1="228.6" y1="142.24" x2="205.74" y2="142.24" width="0.1524" layer="91"/>
<label x="208.28" y="142.24" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="200.66" y1="142.24" x2="182.88" y2="142.24" width="0.1524" layer="91"/>
<label x="187.96" y="142.24" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_7_H"/>
</segment>
</net>
<net name="AR2_D0" class="0">
<segment>
<pinref part="P_MM2&gt;" gate="A" pin="3"/>
<wire x1="162.56" y1="91.44" x2="142.24" y2="91.44" width="0.1524" layer="91"/>
<label x="144.78" y="91.44" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="137.16" y1="99.06" x2="121.92" y2="99.06" width="0.1524" layer="91"/>
<label x="124.46" y="99.06" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_1_H"/>
</segment>
</net>
<net name="AR2_D2" class="0">
<segment>
<pinref part="P_MM2&gt;" gate="A" pin="5"/>
<wire x1="162.56" y1="88.9" x2="142.24" y2="88.9" width="0.1524" layer="91"/>
<label x="144.78" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="137.16" y1="93.98" x2="121.92" y2="93.98" width="0.1524" layer="91"/>
<label x="124.46" y="93.98" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_3_H"/>
</segment>
</net>
<net name="AR2_D7" class="0">
<segment>
<pinref part="P_MM2&gt;" gate="A" pin="7"/>
<wire x1="162.56" y1="86.36" x2="142.24" y2="86.36" width="0.1524" layer="91"/>
<label x="144.78" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="137.16" y1="88.9" x2="121.92" y2="88.9" width="0.1524" layer="91"/>
<label x="124.46" y="88.9" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_5_H"/>
</segment>
</net>
<net name="AR2_D12" class="0">
<segment>
<pinref part="P_MM2&gt;" gate="A" pin="9"/>
<wire x1="162.56" y1="83.82" x2="142.24" y2="83.82" width="0.1524" layer="91"/>
<label x="144.78" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="137.16" y1="83.82" x2="121.92" y2="83.82" width="0.1524" layer="91"/>
<label x="124.46" y="83.82" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_7_H"/>
</segment>
</net>
<net name="AR2_D1" class="0">
<segment>
<pinref part="P_MM2&gt;" gate="A" pin="4"/>
<wire x1="170.18" y1="91.44" x2="190.5" y2="91.44" width="0.1524" layer="91"/>
<label x="177.8" y="91.44" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="121.92" y1="96.52" x2="137.16" y2="96.52" width="0.1524" layer="91"/>
<label x="124.46" y="96.52" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_2_H"/>
</segment>
</net>
<net name="AR2_D4" class="0">
<segment>
<pinref part="P_MM2&gt;" gate="A" pin="6"/>
<wire x1="170.18" y1="88.9" x2="190.5" y2="88.9" width="0.1524" layer="91"/>
<label x="177.8" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="121.92" y1="91.44" x2="137.16" y2="91.44" width="0.1524" layer="91"/>
<label x="124.46" y="91.44" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_4_H"/>
</segment>
</net>
<net name="AR2_D8" class="0">
<segment>
<pinref part="P_MM2&gt;" gate="A" pin="8"/>
<wire x1="170.18" y1="86.36" x2="190.5" y2="86.36" width="0.1524" layer="91"/>
<label x="177.8" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="121.92" y1="86.36" x2="137.16" y2="86.36" width="0.1524" layer="91"/>
<label x="124.46" y="86.36" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_6_H"/>
</segment>
</net>
<net name="AR2_D13" class="0">
<segment>
<pinref part="P_MM2&gt;" gate="A" pin="10"/>
<wire x1="170.18" y1="83.82" x2="190.5" y2="83.82" width="0.1524" layer="91"/>
<label x="177.8" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="121.92" y1="81.28" x2="137.16" y2="81.28" width="0.1524" layer="91"/>
<label x="124.46" y="81.28" size="1.778" layer="95"/>
<pinref part="U$2" gate="G$1" pin="I/O_8_H"/>
</segment>
</net>
<net name="AR3_D0" class="0">
<segment>
<pinref part="P_MM3&gt;" gate="A" pin="3"/>
<wire x1="287.02" y1="88.9" x2="266.7" y2="88.9" width="0.1524" layer="91"/>
<label x="269.24" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="261.62" y1="96.52" x2="246.38" y2="96.52" width="0.1524" layer="91"/>
<label x="248.92" y="96.52" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_1_H"/>
</segment>
</net>
<net name="AR3_D2" class="0">
<segment>
<pinref part="P_MM3&gt;" gate="A" pin="5"/>
<wire x1="287.02" y1="86.36" x2="266.7" y2="86.36" width="0.1524" layer="91"/>
<label x="269.24" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="261.62" y1="91.44" x2="246.38" y2="91.44" width="0.1524" layer="91"/>
<label x="248.92" y="91.44" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_3_H"/>
</segment>
</net>
<net name="AR3_D7" class="0">
<segment>
<pinref part="P_MM3&gt;" gate="A" pin="7"/>
<wire x1="287.02" y1="83.82" x2="266.7" y2="83.82" width="0.1524" layer="91"/>
<label x="269.24" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="261.62" y1="86.36" x2="246.38" y2="86.36" width="0.1524" layer="91"/>
<label x="248.92" y="86.36" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_5_H"/>
</segment>
</net>
<net name="AR3_D12" class="0">
<segment>
<pinref part="P_MM3&gt;" gate="A" pin="9"/>
<wire x1="287.02" y1="81.28" x2="266.7" y2="81.28" width="0.1524" layer="91"/>
<label x="269.24" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="261.62" y1="81.28" x2="246.38" y2="81.28" width="0.1524" layer="91"/>
<label x="248.92" y="81.28" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_7_H"/>
</segment>
</net>
<net name="AR3_D1" class="0">
<segment>
<pinref part="P_MM3&gt;" gate="A" pin="4"/>
<wire x1="294.64" y1="88.9" x2="314.96" y2="88.9" width="0.1524" layer="91"/>
<label x="302.26" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="246.38" y1="93.98" x2="261.62" y2="93.98" width="0.1524" layer="91"/>
<label x="248.92" y="93.98" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_2_H"/>
</segment>
</net>
<net name="AR3_D4" class="0">
<segment>
<pinref part="P_MM3&gt;" gate="A" pin="6"/>
<wire x1="294.64" y1="86.36" x2="314.96" y2="86.36" width="0.1524" layer="91"/>
<label x="302.26" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="246.38" y1="88.9" x2="261.62" y2="88.9" width="0.1524" layer="91"/>
<label x="248.92" y="88.9" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_4_H"/>
</segment>
</net>
<net name="AR3_D8" class="0">
<segment>
<pinref part="P_MM3&gt;" gate="A" pin="8"/>
<wire x1="294.64" y1="83.82" x2="314.96" y2="83.82" width="0.1524" layer="91"/>
<label x="302.26" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="246.38" y1="83.82" x2="261.62" y2="83.82" width="0.1524" layer="91"/>
<label x="248.92" y="83.82" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_6_H"/>
</segment>
</net>
<net name="AR3_D13" class="0">
<segment>
<pinref part="P_MM3&gt;" gate="A" pin="10"/>
<wire x1="294.64" y1="81.28" x2="314.96" y2="81.28" width="0.1524" layer="91"/>
<label x="302.26" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="246.38" y1="78.74" x2="261.62" y2="78.74" width="0.1524" layer="91"/>
<label x="248.92" y="78.74" size="1.778" layer="95"/>
<pinref part="U$3" gate="G$1" pin="I/O_8_H"/>
</segment>
</net>
<net name="AR4_D0" class="0">
<segment>
<pinref part="&lt;P_MM4" gate="A" pin="3"/>
<wire x1="223.52" y1="35.56" x2="203.2" y2="35.56" width="0.1524" layer="91"/>
<label x="205.74" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="198.12" y1="43.18" x2="182.88" y2="43.18" width="0.1524" layer="91"/>
<label x="185.42" y="43.18" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_1_H"/>
</segment>
</net>
<net name="AR4_D2" class="0">
<segment>
<pinref part="&lt;P_MM4" gate="A" pin="5"/>
<wire x1="223.52" y1="33.02" x2="203.2" y2="33.02" width="0.1524" layer="91"/>
<label x="205.74" y="33.02" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="198.12" y1="38.1" x2="182.88" y2="38.1" width="0.1524" layer="91"/>
<label x="185.42" y="38.1" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_3_H"/>
</segment>
</net>
<net name="AR4_D7" class="0">
<segment>
<pinref part="&lt;P_MM4" gate="A" pin="7"/>
<wire x1="223.52" y1="30.48" x2="203.2" y2="30.48" width="0.1524" layer="91"/>
<label x="205.74" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="198.12" y1="33.02" x2="182.88" y2="33.02" width="0.1524" layer="91"/>
<label x="185.42" y="33.02" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_5_H"/>
</segment>
</net>
<net name="AR4_D12" class="0">
<segment>
<pinref part="&lt;P_MM4" gate="A" pin="9"/>
<wire x1="223.52" y1="27.94" x2="203.2" y2="27.94" width="0.1524" layer="91"/>
<label x="205.74" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="198.12" y1="27.94" x2="182.88" y2="27.94" width="0.1524" layer="91"/>
<label x="185.42" y="27.94" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_7_H"/>
</segment>
</net>
<net name="AR4_D1" class="0">
<segment>
<pinref part="&lt;P_MM4" gate="A" pin="4"/>
<wire x1="231.14" y1="35.56" x2="251.46" y2="35.56" width="0.1524" layer="91"/>
<label x="238.76" y="35.56" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="182.88" y1="40.64" x2="198.12" y2="40.64" width="0.1524" layer="91"/>
<label x="185.42" y="40.64" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_2_H"/>
</segment>
</net>
<net name="AR4_D4" class="0">
<segment>
<pinref part="&lt;P_MM4" gate="A" pin="6"/>
<wire x1="231.14" y1="33.02" x2="251.46" y2="33.02" width="0.1524" layer="91"/>
<label x="238.76" y="33.02" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="182.88" y1="35.56" x2="198.12" y2="35.56" width="0.1524" layer="91"/>
<label x="185.42" y="35.56" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_4_H"/>
</segment>
</net>
<net name="AR4_D8" class="0">
<segment>
<pinref part="&lt;P_MM4" gate="A" pin="8"/>
<wire x1="231.14" y1="30.48" x2="251.46" y2="30.48" width="0.1524" layer="91"/>
<label x="238.76" y="30.48" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="182.88" y1="30.48" x2="198.12" y2="30.48" width="0.1524" layer="91"/>
<label x="185.42" y="30.48" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_6_H"/>
</segment>
</net>
<net name="AR4_D13" class="0">
<segment>
<pinref part="&lt;P_MM4" gate="A" pin="10"/>
<wire x1="231.14" y1="27.94" x2="251.46" y2="27.94" width="0.1524" layer="91"/>
<label x="238.76" y="27.94" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="182.88" y1="25.4" x2="198.12" y2="25.4" width="0.1524" layer="91"/>
<label x="185.42" y="25.4" size="1.778" layer="95"/>
<pinref part="U$4" gate="G$1" pin="I/O_8_H"/>
</segment>
</net>
<net name="AR1_D1" class="0">
<segment>
<pinref part="&lt;P_MM1" gate="A" pin="4"/>
<wire x1="236.22" y1="149.86" x2="256.54" y2="149.86" width="0.1524" layer="91"/>
<label x="243.84" y="149.86" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="182.88" y1="154.94" x2="200.66" y2="154.94" width="0.1524" layer="91"/>
<label x="187.96" y="154.94" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_2_H"/>
</segment>
</net>
<net name="AR1_D4" class="0">
<segment>
<pinref part="&lt;P_MM1" gate="A" pin="6"/>
<wire x1="236.22" y1="147.32" x2="256.54" y2="147.32" width="0.1524" layer="91"/>
<label x="243.84" y="147.32" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="182.88" y1="149.86" x2="200.66" y2="149.86" width="0.1524" layer="91"/>
<label x="187.96" y="149.86" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_4_H"/>
</segment>
</net>
<net name="AR1_D8" class="0">
<segment>
<pinref part="&lt;P_MM1" gate="A" pin="8"/>
<wire x1="236.22" y1="144.78" x2="256.54" y2="144.78" width="0.1524" layer="91"/>
<label x="243.84" y="144.78" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="182.88" y1="144.78" x2="200.66" y2="144.78" width="0.1524" layer="91"/>
<label x="187.96" y="144.78" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_6_H"/>
</segment>
</net>
<net name="AR1_D13" class="0">
<segment>
<pinref part="&lt;P_MM1" gate="A" pin="10"/>
<wire x1="236.22" y1="142.24" x2="256.54" y2="142.24" width="0.1524" layer="91"/>
<label x="243.84" y="142.24" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="182.88" y1="139.7" x2="200.66" y2="139.7" width="0.1524" layer="91"/>
<label x="187.96" y="139.7" size="1.778" layer="95"/>
<pinref part="U$1" gate="G$1" pin="I/O_8_H"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
<errors>
<approved hash="106,1,38.1,40.64,FPGA_3,,,,,"/>
<approved hash="106,1,38.1,38.1,FPGA_7,,,,,"/>
<approved hash="106,1,38.1,35.56,FPGA_9,,,,,"/>
<approved hash="106,1,38.1,30.48,FPGA_17,,,,,"/>
<approved hash="106,1,45.72,25.4,FPGA_24,,,,,"/>
<approved hash="106,1,45.72,22.86,FPGA_26,,,,,"/>
<approved hash="106,1,38.1,22.86,FPGA_27,,,,,"/>
<approved hash="106,1,45.72,17.78,FPGA_28,,,,,"/>
<approved hash="106,1,38.1,17.78,FPGA_30,,,,,"/>
<approved hash="106,1,45.72,15.24,FPGA_31,,,,,"/>
<approved hash="106,1,38.1,15.24,FPGA_32,,,,,"/>
<approved hash="106,1,45.72,162.56,FPGA_52,,,,,"/>
<approved hash="106,1,38.1,160.02,FPGA_53,,,,,"/>
<approved hash="106,1,45.72,160.02,FPGA_55,,,,,"/>
<approved hash="106,1,38.1,157.48,FPGA_57,,,,,"/>
<approved hash="106,1,45.72,157.48,FPGA_58,,,,,"/>
<approved hash="106,1,38.1,154.94,FPGA_59,,,,,"/>
<approved hash="106,1,45.72,154.94,FPGA_60,,,,,"/>
<approved hash="106,1,38.1,152.4,FPGA_63,,,,,"/>
<approved hash="106,1,45.72,152.4,FPGA_64,,,,,"/>
<approved hash="106,1,38.1,149.86,FPGA_65,,,,,"/>
<approved hash="106,1,45.72,149.86,FPGA_67,,,,,"/>
<approved hash="106,1,38.1,147.32,FPGA_69,,,,,"/>
<approved hash="106,1,45.72,147.32,FPGA_70,,,,,"/>
<approved hash="106,1,38.1,144.78,FPGA_71,,,,,"/>
<approved hash="106,1,45.72,144.78,FPGA_72,,,,,"/>
<approved hash="106,1,45.72,124.46,FPGA_76,,,,,"/>
<approved hash="106,1,45.72,121.92,FPGA_80,,,,,"/>
<approved hash="106,1,38.1,119.38,FPGA_81,,,,,"/>
<approved hash="106,1,45.72,114.3,FPGA_90,,,,,"/>
<approved hash="106,1,38.1,111.76,FPGA_91,,,,,"/>
<approved hash="106,1,45.72,111.76,FPGA_92,,,,,"/>
<approved hash="106,1,38.1,109.22,FPGA_93,,,,,"/>
<approved hash="106,1,45.72,109.22,FPGA_94,,,,,"/>
<approved hash="106,1,38.1,106.68,FPGA_96,,,,,"/>
<approved hash="106,1,45.72,106.68,FPGA_97,,,,,"/>
<approved hash="106,1,38.1,104.14,FPGA_99,,,,,"/>
<approved hash="106,1,45.72,104.14,FPGA_100,,,,,"/>
<approved hash="106,1,38.1,101.6,FPGA_101,,,,,"/>
<approved hash="106,1,45.72,78.74,FPGA_119,,,,,"/>
<approved hash="106,1,38.1,73.66,FPGA_122,,,,,"/>
<approved hash="106,1,45.72,71.12,FPGA_129,,,,,"/>
<approved hash="106,1,38.1,68.58,FPGA_132,,,,,"/>
<approved hash="106,1,45.72,68.58,FPGA_133,,,,,"/>
<approved hash="106,1,38.1,66.04,FPGA_134,,,,,"/>
<approved hash="106,1,45.72,66.04,FPGA_135,,,,,"/>
<approved hash="106,1,38.1,63.5,FPGA_136,,,,,"/>
<approved hash="106,1,45.72,63.5,FPGA_137,,,,,"/>
<approved hash="106,1,38.1,60.96,FPGA_139,,,,,"/>
<approved hash="106,1,38.1,55.88,FPGA_144,,,,,"/>
<approved hash="113,1,41.8677,28.1661,P4,,,,,"/>
<approved hash="113,1,41.8677,71.3461,P3,,,,,"/>
<approved hash="113,1,41.8677,114.526,P2,,,,,"/>
<approved hash="113,1,41.8677,157.706,P1,,,,,"/>
<approved hash="113,1,75.9629,172.946,JP1,,,,,"/>
<approved hash="113,1,75.1766,145.006,BT_COM,,,,,"/>
<approved hash="113,1,103.903,172.946,JP2,,,,,"/>
<approved hash="113,1,232.368,148.816,&lt;P_MM1,,,,,"/>
<approved hash="113,1,166.328,90.3961,P_MM2&gt;,,,,,"/>
<approved hash="113,1,290.788,87.8561,P_MM3&gt;,,,,,"/>
<approved hash="113,1,227.288,34.5161,&lt;P_MM4,,,,,"/>
<approved hash="113,1,103.903,160.246,JP3,,,,,"/>
</errors>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
