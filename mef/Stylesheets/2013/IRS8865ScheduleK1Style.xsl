<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:template name="IRS8865ScheduleK1Style">
  
.IRS8865ScheduleK1_part
{
	background-color: #ffffff;
	color: #000000;
}
.IRS8865ScheduleK1_tdLeft
{
	border-top: 1px solid black;
	border-bottom: 0px;
	border-left: 1px solid black;
	border-right: 0px;
	vertical-align: top;
	padding-top: 1mm;
	padding-bottom: 1mm;
	padding-left: 2mm;
	padding-right: 1mm;
	text-align: top;
	font-family: Verdana;
	font-size: 7pt;
}
.IRS8865ScheduleK1_tdRight
{
	border-top: 1px solid black;
	border-bottom: 0px;
	border-left: 0px;
	/*border-right: 1px solid black;*/
	border-right: 0px;
	vertical-align: top;
	padding-top: 0mm;
	padding-bottom: 0mm;	
	padding-left: 0mm;
	padding-right: 0mm;
	text-align: top;
	font-family: Verdana;
	font-size: 7pt;
	width: 46.5mm;
	height:4mm;
}
.IRS8865ScheduleK1_tdPart
{
	border-top: 1px solid black;
	border-bottom: 0px;
	border-left: 1px solid black;
	border-right: 0px;
	background-color: lightgrey;
	font-family: Verdana;
	font-size: 10pt;
	color: black;
}
.IRS8865ScheduleK1_itemLabel
{
  font-weight: bold;
  font-size: 7pt;
  font-family: Verdana;
  width: 5mm;
 /* height: 2mm;*/
  border: 1px;
  border-right: 1px solid black;
  margin: 0px;
  padding: 0px;
  padding-bottom: 0mm;	
}
.IRS8865ScheduleK1_partName
{
	background-color: black;
	font-family: Verdana;
	font-size: 10pt;
	font-weight: bold;
	color: white;
	width: 18mm;
	height: 5mm;
	margin: 1mm;
	text-align: center;
}
.IRS8865ScheduleK1_partDesc
{
	font-family: Verdana;
	font-size: 9pt;
	font-weight: bold;
	color: black;
	height: 5mm;
	text-align: left;
	margin-bottom: 0.5mm;
}
.IRS8865ScheduleK1_lineETH
{
	font-family: Verdana;
	font-size: 7pt;
	font-weight: bold;
	text-align: center;
	border: 0px;
}
.IRS8865ScheduleK1_lineETD
{
	font-family: Verdana;
	font-size: 7pt;
	text-align: right;
	border-bottom: 1px solid black;
	padding: 1mm;
	width: 28mm;
}
.IRS8865ScheduleK1_codeBox
{
	width: 5mm;
      height: 4.5mm;
	text-align: center;
	padding-top: 0mm;
	border-top: 0px;
	border-bottom: 0px;
	border-left: 0px;
	border-right: 1px solid black;
	margin-top: 0mm;
}
.IRS8865ScheduleK1_amountBox
{
	width: 41mm;
	height: 2mm;
	text-align: right;
	border: 0px;
	margin-top: 0mm;
	border-bottom: 1px;
}
.IRS8865ScheduleK1_codeCell
{
	width: 5mm;
	height: 8mm;
	text-align: center;
	border-top: 1px solid lightgrey;
	border-bottom: 0px;
	border-left: 0px;
	border-right: 1px solid black;
	padding-top: 4mm;
	}
.IRS8865ScheduleK1_amountCell
{
	width: 41mm;
	height: 8mm;
	text-align: right;
	border-top: 1px solid lightgrey;
	border-bottom: 0px;
	border-left: 0px;
	border-right: 0px;
	padding-top: 4mm;
	/*background-color:lightblue;*/
}

</xsl:template>

</xsl:stylesheet>