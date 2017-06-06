<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1120ScheduleGStyle">

.IRS1120ScheduleG_styFN {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float: left; clear: none;
}
.IRS1120ScheduleG_styFNum {   /* Form Number */
  font-family: verdana, arial, sans-serif;
  font-size: 10pt; font-weight: bold;
}
.IRS1120ScheduleG_styFNum2 {   /* Form Number 2nd Line */
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
}
.IRS1120ScheduleG_styAgency {   /* Agency */  
  font-family: "Arial Narrow";
  font-size: 7pt;
  font-weight:normal;
  line-height:100%
}

.IRS1120ScheduleG_styFTBox {   /* Form Title Box*/
  text-align: center;
  float: left; clear: none;
}
.IRS1120ScheduleG_styFMT {   /* Form Main Title */
  font-family: verdana, arial, sans-serif;
  font-size: 12pt; font-weight: bold;
}
.IRS1120ScheduleG_styFST {   /* Form Subtitle */
  font-family: verdana, arial, sans-serif;
  font-size: 7pt; font-weight: bold;
}
.IRS1120ScheduleG_styTYBox {   /* Tax Year Box*/
  text-align: center;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
  float: left; clear: none;
}
.IRS1120ScheduleG_styOMB {   /* OMB No. */
  border-bottom:1 solid black;
  font-size:7pt
}
.IRS1120ScheduleG_styTY {   /* Tax Year */
  vertical-align: middle;
  font-family: "Arial Narrow", arial, verdana;
  font-size: 26pt; font-weight: bold;
}
.IRS1120ScheduleG_styInputFld {   /* Input Text Field */
  color: black;
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
  border-style: none; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
}
.IRS1120ScheduleG_styBusinessName {   /* Business Name */
  font-size: 7pt;
  padding-top: 0px; padding-bottom: 0px; padding-left: 3px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float: left; clear: none;
}
.IRS1120ScheduleG_styBusinessNameInputFld {   /* Business Name Input Field */
  width: 517px;
  color: black;
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
  border-style: none; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
}
.IRS1120ScheduleG_styEIN {   /* EIN */
  font-size: 7pt;
  text-align: center;
  padding-top: 0px; padding-bottom: 0px; padding-left: 8px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float: left; clear: none;
}
.IRS1120ScheduleG_styEINInputFld {   /* EIN Input Field */
  width: 170px;
  color: black;
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
  text-align:center;
  border-style: none; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
}

.IRS1120ScheduleG_styPartHdr {   /* Part Header */
  font-size: 8pt; font-weight: bold;
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}

.IRS1120ScheduleG_styPartHdrSpanner {   /* Part Header Spanner */
  width: 5px;
  background-color: black;  
   height:14px;
}

.IRS1120ScheduleG_styPartHdrTitle {   /* Part Header Title */
  color: white; background-color: black;  
  height:14px;  
}

.IRS1120ScheduleG_styTableHdr {   /* Table Header */
  font-size: 6pt;
  text-align: center;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  float: left; clear: none;
}
.IRS1120ScheduleG_styIFrame {   /* IFrame for Tables 1 and 2 */
  width: 707px; height: 106px;
  display: block;
}
.IRS1120ScheduleG_styTableContainer {   /* Scrollable Table Container */
  width: 707px;
  float:none; clear:both;  
  overflow-y: auto;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}

.IRS1120ScheduleG_styTable {   /* Table */
  font-size: 7pt;
  text-align: left;
  float:none; clear:both;  
  width:100%
}

.IRS1120ScheduleG_styTableCellA {   /* Table Cell (a) */
  width: 160px;   /* 220px; */
  color: black;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1120ScheduleG_styTableCellB {   /* Table Cell (b) */
  width: 77px;   /* 86px; was 80 */
  text-align:center;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1120ScheduleG_styTableCellC {   /* Table Cell (c) */
  width: 77px;   /* 87px; was 80 */
  text-align:center;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1120ScheduleG_styTableCellD {   /* Table Cell (d) */
  width: 110px;   /* 91px; */
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1120ScheduleG_styTableCellE {   /* Table Cell (e) */
  width: 126px;   /* 91px; */
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1120ScheduleG_styTableCellF {   /* Table Cell (f) */
  /*width: 126px;   /* 109px; */
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  border-color:black
}

.IRS1120ScheduleG_styTableLastCol {   /* Last Table Column */
  width: 15px;
  color: white;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  display: none;
}

.IRS1120ScheduleG_styLineItem {   /* Line Item */
  width: 708px;
  font-size: 8pt;
  float: left; clear: left;
}
.IRS1120ScheduleG_styLN {   /* Line Number */
  width: 16px;   /* 15px; */
  color: black;
  font-weight: bold; text-align: right;
  float:left
}
.IRS1120ScheduleG_styLNRtMargin {   /* Line Number Right Margin */
  width: 16px;
  float:left
}
.IRS1120ScheduleG_styLNDesc {   /* Line Description */
  width: 533px;    
  height:4mm;
  padding-top:0;
  padding-bottom:0;    
  float:left
  }

.IRS1120ScheduleG_styLNBox {   /* Boxed Line Numbers */
  width: 25px;
  font-weight: bold;
  text-align: center;
  border:1 solid black;
  border-top:0;  
  height:4mm;
  float:left
  }

.IRS1120ScheduleG_styLNValBox {   /* Line Value Box */  
  width: 117px;
  border-bottom:1 solid black;  
  height:4mm;  
  float:left
  }
.IRS1120ScheduleG_styLNVal {   /* Line Value */
  width: 117px;   
  font-size: 7pt; 
  text-align: right;  
  float:left
  }

.IRS1120ScheduleG_styFormFooter {   /* Form Footer */
  font-size: 7pt;
  text-align: left;
  border-style: solid;
  border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
}
</xsl:template>
</xsl:stylesheet>
