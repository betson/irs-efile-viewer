<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 1120 Schedule PH-->

<xsl:template name="IRS1120SchedulePHStyle">
  .styIRS1120SchedulePHBB {   /* Bottom Border */
    width: 187mm; height: auto;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: left;
  }
  .styIRS1120SchedulePHFN {   /* Form Name */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }   
  .styIRS1120SchedulePHAgency {   /* Agency */
    font-family: verdana, arial, sans-serif;
    font-weight: normal;
    font-size: 5pt;
  }
  .styIRS1120SchedulePHFTBox {   /* Form Title Box*/
    text-align: center;
    float: left; clear: none;
  } 
  .styIRS1120SchedulePHFST {   /* Form Subtitle */
    font-family: verdana, arial, sans-serif;
    font-size: 7pt; font-weight: bold;
  }
  .styIRS1120SchedulePHTYBox {   /* Tax Year Box*/
    text-align: center;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    float: right; clear: none;
  }
  .styIRS1120SchedulePHOMB {   /* OMB No. */
    font-size: 6pt;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS1120SchedulePHTY {   /* Tax Year */
    vertical-align: middle;
    font-family: "Arial Narrow", arial, verdana;
    font-size: 26pt; font-weight: bold;
  } 
  .styIRS1120SchedulePHPartHdr {   /* Part Header */
    height: auto;
    width:187mm;
    font-size: 10pt; font-weight: bold;
    padding-top: 7px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS1120SchedulePHPartHdrSpanner {   /* Part Header Spanner */
    width: 0px;
    background-color: black;
  }
  .styIRS1120SchedulePHPartHdrTitle {   /* Part Header Title */
    font-size: 10pt;
    color: white; background-color: black;
  }
  .styIRS1120SchedulePHNoteHdr {   /* Note Header */
    font-size: 8pt; font-style: italic; font-family: verdana;
    width:187mm;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }   
  .styIRS1120SchedulePHNoteHdrTitle {   /* Note Header Title */
    color: black;
    font-style: normal; font-weight: bold;
  }
  .styIRS1120SchedulePHSeeInstructionsTitle {    /* See Intructions Title  */
    color: black;
    width:187mm;
    font-size:9pt;
    font-style: normal; font-weight: normal;
  }
  .styIRS1120SchedulePHLineItem {   /* Line Item */
    width: 187mm;
  }
  .styIRS1120SchedulePHLN {   /* Line Number */
    width: 2mm;
    color: black;
    font-weight: bold; text-align: right;
    float: none; clear: none;
  } 
  .styIRS1120SchedulePHLNLtMargin {   /* Line Number Left Margin */
    width: 4mm;
    float: left; clear: none;
  }   
  .styIRS1120SchedulePHLNDesc {   /* Line Description */
    width: 139mm;
    float: left; clear: none;
  }  
  .styIRS1120SchedulePHLNBox {   /* Boxed Line Numbers */
    width: 7mm;
    font-weight: bold;
    text-align: center;
    float:left; clear: none;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
  }
  .styIRS1120SchedulePHLNValBox {   /* Line Value Box */
    width: 32mm;
    text-align: right;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0mm;
    float: left; clear: none;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS1120SchedulePHLNVal {   /* Line Value */
    width: 32mm;
    color: black;
    font-family: verdana, arial, sans-serif;
    font-size: 7pt; font-weight: normal;
    text-align: right; vertical-align: text-bottom;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: none; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  } 
  .styIRS1120SchedulePHTableCellPad {   /* Table Cell Padding */
        width: 4px;
  }
  .styIRS1120SchedulePHTableThead{ /* Style for HTML 'thead' element  */
    display:table-header-group;
  }
  .styIRS1120SchedulePHTableContainer {   /* Scrollable Table Container */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; height: auto;
    overflow-y: auto;
  }
  .styIRS1120SchedulePHTable {   /* Table */
    font-size: 7pt;
    width: 187mm;
    text-align: left;
  }
  .styIRS1120SchedulePHTableCellA {   /* Table Cell (a) */
    width: 66mm;
    font-size: 6pt;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1120SchedulePHTableCellB {   /* Table Cell (b) */
    width: 82mm;
    font-size: 6pt;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1120SchedulePHTable3CellsInOne {
    width:  36mm;
  }
  .styIRS1120SchedulePHTableCellC {   /* Table Cell (c) */
    width: 19mm;
    font-size: 6pt;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1120SchedulePHTableCellD {   /* Table Cell (d) */
    width: 19mm;
    font-size: 6pt;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1120SchedulePHTableCellE {   /* Table Cell (e) */
    width: 29mm;
    font-size: 6pt;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1120SchedulePHTableCellF {   /* Table Cell (f) */
    width: 23mm;
    font-size: 6pt;
    color: black;
    text-align: center;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1120SchedulePHTableCellG {   /* Table Cell (g) */
    width: 22mm;
    font-size: 6pt;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1120SchedulePHTableCellH {   /* Table Cell (h) */
    width: 22mm;
    font-size: 6pt;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS1120SchedulePHTableTopCell {
    width: 38mm;
    font-size: 6pt;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS1120SchedulePHPreferred {
    width: 20mm;
    padding-top:4.5mm;
    color: black;
    text-align: right;
    float: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;
  }
  .styIRS1120SchedulePHCommon {
    width: 17.75mm;
    padding-top:4.5mm;
    text-align: right;
    float: right;
    clear: none;
  }
  .styIRS1120SchedulePHImg {
    width: 6mm;
    height: auto;
    padding-left: 0px; padding-right: 0px; padding-top: 4mm; padding-bottom:0mm;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;  border-right-width: 1px;
    float: left; clear: none;
  }
  .styIRS1120SchedulePHNBSP{
    width: 16px;
    font-weight: bold;
  }
</xsl:template>

</xsl:stylesheet>