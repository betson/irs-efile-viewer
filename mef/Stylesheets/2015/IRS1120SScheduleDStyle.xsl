<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1120SScheduleDStyle">
  

.IRS1120SScheduleD_LineContainer {
  clear:both;
  width:187mm;
}
.IRS1120SScheduleD_PartIndex {
  padding-top: 8px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:8mm;width:187mm;
}
.IRS1120SScheduleD_TableContainer {
  clear:both;
  width:187mm;height:25mm;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}
.IRS1120SScheduleD_styTable {   /* Table */
  font-size: 7pt;
  text-align: left;
}
.IRS1120SScheduleD_DescCol {   /* description column */
  width: 46mm;   /* ; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
}
.IRS1120SScheduleD_DescColBody {   /* description column for table body */
  width: 32mm;   /* ; */
}
.IRS1120SScheduleD_IndexCol {   /* index column */
  width: 4mm;   /* ; */
  text-indent:1mm;
  font-size:7pt;
  font-weight:bold;
}
.IRS1120SScheduleD_DateCol {   /* date column */
  width: 21mm;   /* 86px; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  text-align:center;
}
.IRS1120SScheduleD_MoneyCol {   /* date column */
  width: 33mm;   /* 86px; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  text-align:right;
}
.IRS1120SScheduleD_styTableCellPad {   /* Table Cell Padding */
  width: 4px;
  text-align:right;
}

</xsl:template>
</xsl:stylesheet>
