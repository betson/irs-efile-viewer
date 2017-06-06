<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:template name="IRS1120SScheduleK1Style">
  
.IRS1120SScheduleK1_part
{
  background-color: #ffffff;
  color: #000000;
}
.IRS1120SScheduleK1_tdLeft
{
  border-top: 1px solid black;
  border-bottom: 0px;
  border-left: 2px solid black;
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
.IRS1120SScheduleK1_tdRight
{
  border-top: 1px solid black;
  border-bottom: 0px;
  border-left: 0px;
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
  height: 4mm;
}
.IRS1120SScheduleK1_tdPartName
{
  border: 0px;
  background-color: lightgrey;
  font-family: Verdana;
  font-size: 8pt;
  height: 8mm;
  text-align: center;
  vertical-align: top;
  padding-top: 1mm;
}
.IRS1120SScheduleK1_tdPartDesc
{
  border: 0px;
  background-color: lightgrey;
  font-family: Verdana;
  font-size: 8pt;
  height: 8mm;
  text-align: left;
}
.IRS1120SScheduleK1_partName
{
  background-color: black;
  font-size: 8pt;
  font-weight: bold;
  color: white;
  padding: 0.5mm;
}
.IRS1120SScheduleK1_partDesc
{
  font-weight: bold;
  font-size: 8pt;
}
.IRS1120SScheduleK1_itemLabel
{
  font-weight: bold;
  font-size: 7pt;
  font-family: Verdana;
  width: 5mm;
  border: 1px;
  border-right: 1px solid black;
  margin: 0px;
  padding: 0px;
  padding-bottom: 0mm;
}

.IRS1120SScheduleK1_codeBox
{
  width: 5mm;
  height: 4.5mm;
  text-align: center;
  padding-top: 0px;
  border-top: 0px;
  border-bottom: 0px;
  border-left: 0px;
  border-right: 1px solid black;
  margin-top: 0mm;
}
.IRS1120SScheduleK1_amountBox
{
  width: 41mm;
  height: 2mm;
  text-align: right;
  border: 0px;
  margin-top: 0mm;
  border-bottom: 1px;
}
.IRS1120SScheduleK1_codeCell
{
  width: 5mm;
  height: 8mm;
  border-top: 1px solid lightgrey;
  border-bottom: 0px;
  border-left: 0px;
  border-right: 1px solid black;
  padding-top: 3.7mm;
  padding-left: 1mm;
  float:left;clear:none;
  }
.IRS1120SScheduleK1_amountCell
{
  width: 41mm;
  height: 8mm;
  text-align: right;
  border-top: 1px solid lightgrey;
  border-bottom: 0px;
  border-left: 0px;
  border-right: 0px;
  padding-top: 4mm;
  float:left;clear:none;
}

</xsl:template>

</xsl:stylesheet>