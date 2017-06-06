<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1118ScheduleJStyle">

.IRS1118ScheduleJ_FormNumBlock {   /* Form number block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
 height:25.25mm;
  float:left;
}
.IRS1118ScheduleJ_FormTitleBlock {   /* Form title block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  height:25.25mm;
  text-align:center;
  float:left;
}
.IRS1118ScheduleJ_FormYearBlock {   /* Block with bottom border only */
  padding-top: 10mm; padding-bottom: 0px; padding-left: 1mm; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  height:25.25mm;
  float:left;
}
.IRS1118ScheduleJ_NameBox {   /* box to enter name */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  height:8mm;
  float:left;
}
.IRS1118ScheduleJ_EINBox {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 5px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  height:8mm;
  float:left;
}
.IRS1118ScheduleJ_LineDescLong {  /* line body long format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
}
.IRS1118ScheduleJ_LineContainerLong {
  clear:both;
 
}
.IRS1118ScheduleJ_PartIndex {
  padding-top: 0px; padding-bottom: 0px; padding-left: 4px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  width:16mm;
  font-size:8pt;font-weight:bold;background-color:black;color:white;
}
.IRS1118ScheduleJ_TableContainer {
  clear:both;
  
}
.IRS1118ScheduleJ_GenericCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:0.5mm;padding-right:0.5mm;
 height:4mm;font-size:5pt;font-family:arial;
  text-align:right;
  width:32mm;
}
.IRS1118ScheduleJ_IndexCell {   /* index */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  height:4mm;
  font-weight:bold;
  width:8mm;
}
.IRS1118ScheduleJ_SubIndexCell {   /* index */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  padding-left:4mm;
  height:4mm;
  font-weight:bold;
  width:8mm;
}
.IRS1118ScheduleJ_DescCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
  height:4mm;
  text-align:left;font-size:6pt;
  width:50mm;
}

</xsl:template>
</xsl:stylesheet>
