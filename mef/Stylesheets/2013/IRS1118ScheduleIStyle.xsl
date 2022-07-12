<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="IRS1118ScheduleIStyle">
.IRS1118ScheduleI_Agency {   /* Agency */
  font-family: "Arial Narrow";
}
.IRS1118ScheduleI_FormNumBlock {   /* Form number block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:30mm;height:18.5mm;
  float:left;
}
.IRS1118ScheduleI_FormTitleBlock {   /* Form title block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:195.5mm;height:18.5mm;
  text-align:center;
  float:left;
}
.IRS1118ScheduleI_FormYearBlock {   /* Block with bottom border only */
  padding-top: 7mm; padding-bottom: 0px; padding-left: 1mm; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:18.5mm;
  float:left;
}
.IRS1118ScheduleI_NameBox {   /* box to enter name */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:206mm;height:8mm;
  float:left;
}
.IRS1118ScheduleI_EINBox {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 5px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:50mm;height:8mm;
  float:left;
}
.IRS1118ScheduleI_LineIndex { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 15px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-align:right;
  font-weight:bold;
}
.IRS1118ScheduleI_LineDescLong {  /* line body long format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:140mm;
}
.IRS1118ScheduleI_MoneyField { /* Money field end line */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:32mm;text-align:right;
}
.IRS1118ScheduleI_MoneyFieldFiller { /* Money field filler */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:32mm;text-align:center;
}
.DotSpacing { /* dot line spacing */
  letter-spacing:2mm;
}

.LineContainer {
  clear:both;
  width:188mm;
}

.LineContainerLong {
  clear:both;
  width:256mm;
}

.IRS1118ScheduleI_PartIndex {
  padding-top: 0px; padding-bottom: 0px; padding-left: 4px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  width:16mm;
  font-size:8pt;font-weight:bold;background-color:black;color:white;
}


.IRS1118ScheduleI_TableContainer {
  clear:both;
  width:256mm;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}

.IRS1118ScheduleI_LineDesc {  /* line body long format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:148mm;font-size:8pt;
}

.IRS1118ScheduleI_GenericCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
  float: none; clear: none;
  width:32mm;height:6.6mm;
  text-align:right;
  font-weight:normal;
}
</xsl:template>
</xsl:stylesheet>
