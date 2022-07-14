<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1041ScheduleDStyle">



.IRS1041ScheduleD_styTableContainer {   /* Scrollable Table Container */
  width: 707px;
  float:none; clear:both;  
  overflow-y: auto;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}

.IRS1041ScheduleD_styTable {   /* Table */
  font-size: 7pt;
  text-align: left;
  float:none; clear:both;  
  width:100%
}
.IRS1041ScheduleD_styTableCellNote { /* Replaces cells a, b, c for 2011 */
	width:50.8mm;
	height:8mm;
	color:black;
	padding-top:.5mm;
	padding-bottom:.5mm;
	text-align:left;
	border-style:solid;
	border-color:black;
	border-width: 0px 1px 1px 0px;
	float:left; clear:none;
}
.IRS1041ScheduleD_styTableCellAmt {
	width:32mm;
	height:8mm;
	text-align:right;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-right:2px;
	border-style:solid; border-color:black;
	border-width: 0px 1px 1px 0px;
	float:left; clear:none;
}

.IRS1041ScheduleD_styTableCellDt {
	width:19mm;
	height:9mm;
	text-align:center;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-right:2px;
	border-style:solid; border-color:black;
	border-width: 0px 1px 1px 0px;
	float:left; clear:none;
}

.IRS1041ScheduleD_styPartIIIHeader { 
	width:32mm;
	height:12.7mm;
	color:black;	
	text-align:center;
	padding-top:3mm;
	border-style:solid;
	border-color:black;
	border-width: 0px 0px 0px 1px;
	float:left; clear:none;
}

.IRS1041ScheduleD_styTableCellA {   /* Table Cell (a) */
  width: 158px;   /* 220px;then 60 */
  color: black;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1041ScheduleD_styTableCellB {   /* Table Cell (b) */
  width: 70px;   /* was 87px;to 80 to 77px**/
  color: black;
  text-align:center;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1041ScheduleD_styTableCellC {   /* Table Cell (c) */
  width: 70px;   /* was 87px;to 80 to 77px*/
  color: black;
  text-align:center;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1041ScheduleD_styTableCellD {   /* Table Cell (d) */
  width: 126px;   /* 91px;then 110 */
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1041ScheduleD_styTableCellE {   /* Table Cell (e) */
  width: 126px;   /* 91px; */
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1041ScheduleD_styTableCellF {   /* Table Cell (f) */
  /*width: 126px;   /* 109px; */
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  border-color:black
}

.IRS1041ScheduleD_styTableLastCol {   /* Last Table Column */
  width: 15px;
  color: white;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  display: none;
}


.IRS1041ScheduleD_styLN {   /* Line Number */
  width: 16px;   /* 15px; */
  color: black;
  font-weight: bold; text-align: right;
  float:left
}


.IRS1041ScheduleD_styFormFooter {   /* Form Footer */
  font-size: 7pt;
  text-align: left;
  border-style: solid;
  border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
}
</xsl:template>
</xsl:stylesheet>
