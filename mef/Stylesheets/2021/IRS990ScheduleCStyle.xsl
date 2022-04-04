<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS990ScheduleCStyle">

.IRS990ScheduleC_FormNumBlock {   /* Form number block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:30mm;height:22mm;
  float:left;
}
.IRS990ScheduleC_FormTitleBlock {   /* Form title block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:128mm;height:22mm;
  text-align:center;
  float:left;
}
.IRS990ScheduleC_FormYearBlock {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:22mm;
  float:left;
}
.IRS990ScheduleC_OMB {   /* Block containing the OMB number */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:4mm;
  text-align:center;
  float:left;
}
.IRS990ScheduleC_TaxYear {   /* Block Contain tax year */
  padding-top: 10px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:11mm;
  font-family: "Arial Narrow";
  font-size: 26pt; font-weight: bold;
  text-align:center;
  float:left;
  /* Note the height is 11mm instead of 12mm.  Seems like borders take space even at zero width */
}
.IRS990ScheduleC_LineIndex { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 15px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-align:right;font-weight:bold;
}
.IRS990ScheduleC_SubLineIndex { /* subline index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-indent:3mm;font-weight:bold;
}
.IRS990ScheduleC_LineDescLong {  /* line body long format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:140mm;
}
.IRS990ScheduleC_LineIndexMid { /* subline index 2 */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS990ScheduleC_LineIndexMidFiller { /* subline index 2, bottomless */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS990ScheduleC_LineIndexMidFillerGray { /* subline index 2, bottomless with gray fill */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;background-color:lightgrey;
}
.IRS990ScheduleC_MoneyFieldMid { /* Money field middle line */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:26mm;text-align:right;
  font-size:6pt;
}
.IRS990ScheduleC_MoneyField { /* Money field end line */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:26mm;text-align:right;
  font-size:6pt;
}
.IRS990ScheduleC_MoneyFieldFiller { /* Money field filler */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:26mm;text-align:right;
}
.IRS990ScheduleC_DotSpacing { /* dot line spacing */
  letter-spacing:2mm;
}
.IRS990ScheduleC_LineContainer {
  clear:both;
  width:188mm;
}
.IRS990ScheduleC_TableContainer {
  clear:both;
  width:188mm;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}

.IRS990ScheduleCPart1C_TableContainer {
  clear:both;
  width:188mm;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}

.IRS990ScheduleC_LineDescIIB { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:138mm;
}
.IRS990ScheduleC_LineDesc { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:156mm;
}

.IRS990ScheduleC_LineDescIV { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:172mm;
}

.IRS990ScheduleC_LineDescIVA { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:140mm;
}
.IRS990ScheduleC_LineDescIVAL { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:180mm;
}

.IRS990ScheduleC_ArrowSpace { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:6mm;
}
/* the reduction in line width is necessary here */
.IRS990ScheduleC_Checkbox {
  height:3mm;
  width:3mm;
}

.IRS990ScheduleC_GenericCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;  
}
.IRS990ScheduleC_CellPtI {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
  height:4mm;
}
.IRS990ScheduleC_IndexCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  padding-left:0mm;padding-right:10px;padding-top:1px;padding-bottom:1px;
  font-weight:bold;text-align:right;
}
.IRS990ScheduleC_IndexCellIIA {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  padding-left:0mm;padding-right:10px;padding-top:1px;padding-bottom:1px;
  font-weight:bold;text-align:right;
  width:4mm;
}

.IRS990ScheduleC_MoneyCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1px;padding-right:1px;
  font-size:6pt;text-align:right;
}

</xsl:template>
</xsl:stylesheet>
