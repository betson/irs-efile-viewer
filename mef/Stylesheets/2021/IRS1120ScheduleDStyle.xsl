<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1120ScheduleDStyle">

.IRS1120ScheduleD_styBusinessNameInputFld {   /* Business Name Input Field */
  width: 517px;
  color: black;
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
  border-style: none; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
}
.IRS1120ScheduleD_styEIN {   /* EIN */
  font-size: 7pt;
  text-align: center;
  padding-top: 0px; padding-bottom: 0px; padding-left: 8px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float: left; clear: none;
}
.IRS1120ScheduleD_styEINInputFld {   /* EIN Input Field */
  width: 170px;
  color: black;
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
  text-align:center;
  border-style: none; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
}

.IRS1120ScheduleD_styPartHdr {   /* Part Header */
  width:187mm;
  font-size: 8pt; font-weight: bold;
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}
.IRS1120ScheduleD_styIFrame {   /* IFrame for Tables 1 and 2 */
  width: 707px; height: 106px;
  display: block;
}
.IRS1120ScheduleD_styLineItem {   /* Line Item */
  width: 708px;
  font-size: 8pt;
  float: left; clear: left;
}
.IRS1120ScheduleD_styLN {   /* Line Number */
  width: 16px;   /* 15px; */
  color: black;
  font-weight: bold; text-align: right;
  float:left
}
.IRS1120ScheduleD_styLNRtMargin {   /* Line Number Right Margin */
  width: 16px;
  float:left
}
.IRS1120ScheduleD_styLNDesc {   /* Line Description */
  width: 533px;    
  height:4mm;
  padding-top:0;
  padding-bottom:0;    
  float:left
  }

.IRS1120ScheduleD_styLNBox {   /* Boxed Line Numbers */
  width: 25px;
  font-weight: bold;
  text-align: center;
  border:1 solid black;
  border-top:0;  
  height:4mm;
  float:left
  }

.IRS1120ScheduleD_styLNValBox {   /* Line Value Box */  
  width: 117px;
  border-bottom:1 solid black;  
  height:4mm;  
  float:left
  }
.IRS1120ScheduleD_styLNVal {   /* Line Value */
  width: 117px;   
  font-size: 7pt; 
  text-align: right;  
  float:left
  }

.IRS1120ScheduleD_styFormFooter {   /* Form Footer */
  width:187mm;
  font-size: 7pt;font-weight:bold;
  text-align: left;
  border-style: solid;
  border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
}
.IRS1120ScheduleD_LineContainer {
  clear:both;
  width:187mm;
}
.IRS1120ScheduleD_PartIndex {
  padding-top: 8px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:8mm;width:187mm;
}
.IRS1120ScheduleD_TableContainer {
  clear:both;
  width:187mm;height:25mm;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}
.IRS1120ScheduleD_styTable {   /* Table */
  font-size: 7pt;
  text-align: left;
}
.IRS1120ScheduleD_DescCol {   /* description column */
  width: 48mm;   
  font-weight:normal; text-align:left;
  border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
}
.IRS1120ScheduleD_DescColBody {   /* description column for table body */
  width: 33mm;  
  font-weight:normal;
  border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
}
.IRS1120ScheduleD_IndexCol {   /* index column */
  width: 4mm;   /* ; */
  text-indent:1mm;
  font-size:7pt;
  font-weight:bold;
}
.IRS1120ScheduleD_DateCol {   /* date column */
  width: 21mm;   /* 86px; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  text-align:center;
}
.IRS1120ScheduleD_MoneyCol {   /* date column */
  width: 33mm;   /* 86px; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  text-align:right; vertical-align:bottom;
}
.IRS1120ScheduleD_styTableCellPad {   /* Table Cell Padding */
  width: 4px;
  text-align:right;
}

.IRS1120ScheduleD_styLNCtrNumNBox {   /* No left right border */
	width:8mm;height:8mm;
	font-size:7pt;
	padding-bottom:.5mm;padding-left:4.5mm;
	font-weight:bold;
	float:left; clear: none;
	text-align:left;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}

.IRS1120ScheduleD_styLNAmountBox{ /* Box for storing line item amounts. */
	width:33.15mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;font-size:6pt;
}
.IRS1120ScheduleD_styDotLn { 
	letter-spacing:3.1mm;
	font-weight:bold; 	
	float:right;
	padding-right:2mm		
	skiplink:display:none;
}	
</xsl:template>
</xsl:stylesheet>
