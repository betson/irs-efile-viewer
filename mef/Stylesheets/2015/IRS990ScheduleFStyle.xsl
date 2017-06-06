<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS990ScheduleFStyle">


.IRS990ScheduleF_styAgency {   /* Agency */  
  font-family: "Arial Narrow";
  font-size: 7pt;
  font-weight:normal;
  line-height:100%
}

.IRS990ScheduleF_styFNBox {   /* Form number block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:30mm;height:20mm;
  float:left;
}
.IRS990ScheduleF_FormTitleBlock {   /* Form title block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:128mm;height:20mm;
  text-align:center;
  float:left;
}

 .styIRS990ScheduleFLN {   /* Line Number */
    width: 2mm;
    color: black;
    font-weight: bold; text-align: right;
    float: left; clear: none;
  } 

.IRS990ScheduleF_FormYearBlock {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:20mm;
  float:left;
}
.IRS990ScheduleF_OMB {   /* Block containing the OMB number */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:4mm;
  text-align:center;
  float:left;
}
.IRS990ScheduleF_TaxYear {   /* Block Contain tax year */
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

.IRS990ScheduleF_styPartHdr {   /* Part Header */
  font-size: 8pt; font-weight: bold;
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}


.IRS990ScheduleF_PartName{ /* Used to display Part Name - Black background with white text used to display names such as "Part I" */
			height:3mm;width:14mm;
			color:white;
			background-color:black;
			font-size: 8pt;
			font-weight:bold;
			text-align:center;
			float:left; clear: none;
}

.IRS990ScheduleF_PartDesc{ /* Section Part Description  - Displayed to the right of the styPartName*/
			height:3mm;width:172mm;
			font-size: 8pt; 
			font-weight: bold;
			padding-left:3mm;
			float:left; clear: none;
}

.IRS990ScheduleF_PartDescLong{ /* Section Part Description  - Displayed to the right of the styPartName*/
			height:3mm;width:230mm;
			font-size: 8pt; 
			font-weight: bold;
			padding-left:3mm;
			float:left; clear: none;
}

 .styIRS990ScheduleF_LNAmountBoxNLB {   /* Amount Box with no left border (only a bottom border)*/
      width:32mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }


.IRS990ScheduleF_LineIndex { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 15px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-align:right;font-weight:bold;
}
.IRS990ScheduleF_SubLineIndex { /* subline index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-indent:3mm;font-weight:bold;
}
.IRS990ScheduleF_LineDescLong {  /* line body long format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:140mm;
}
.IRS990ScheduleF_LineIndexMid { /* subline index 2 */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS990ScheduleF_LineIndexMidFiller { /* subline index 2, bottomless */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS990ScheduleF_LineIndexMidFillerGray { /* subline index 2, bottomless with gray fill */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;background-color:lightgrey;
}

.IRS990ScheduleF_DotSpacing { /* dot line spacing */
  letter-spacing:2mm;
}

.IRS990ScheduleF_LineContainer {
  clear:both;
  width:188mm;
}

.IRS990ScheduleF_TableContainer {
  clear:both;
  width:188mm;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}

.IRS990ScheduleFPart1_TableContainer {
  clear:both;
  width:188mm;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}


.IRS990ScheduleF_TableContainerLandscape {
  clear:both;
  width:256mm;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}

.IRS990ScheduleFPartII_TableContainer {
  clear:both;
  width:188mm;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}

.IRS990ScheduleFPartIII_TableContainer {
  clear:both;
  width:188mm;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
}

.IRS990ScheduleF_LineDesc { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:156mm;
}

.IRS990ScheduleF_LNDescLandscape{ /* Line item description for forms in Landscape format*/
  width:216mm;height:4mm;
  padding-top:.5mm;
  padding-bottom:.5mm;
 float:left; clear: none;
 }

.IRS990ScheduleF_TableContainerLandscape {   /* Scrollable Table Container for forms in Landscape format*/
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
	width: 256mm; height:4.5mm;
	float:none;clear:both;
	overflow-y: auto;
}

.IRS990ScheduleF_TableContainerLandscapeNBB {   /* Scrollable Table Container for forms in Landscape format with no bottom border*/
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	width: 256mm; height:4.5mm;
	float:none;clear:both;
	overflow-y: auto;
}		


/* the reduction in line width is necessary here */
.IRS990ScheduleF_Checkbox {
  height:3mm;
  width:3mm;
}

.IRS990ScheduleF_GenericCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;  
}

.IRS990ScheduleF_styTableCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
  height:4mm;
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


.IRS990ScheduleF_styTableCellA {   /* Form Name */
  width:45mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }

.IRS990ScheduleF_styTableCellB {   /* Form Name */
  width:20mm;font-size:6pt;text-align:right;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }

.IRS990ScheduleF_styTableCellC {   /* Form Name */
  width:20mm;font-size:6pt;text-align:right;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
}

.IRS990ScheduleF_styTableCellD {   /* Form Name */
  width:37mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
}

.IRS990ScheduleF_styTableCellE {   /* Form Name */
  width:37mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
  height:4mm;
}

.IRS990ScheduleF_styTableCellF {   /* Form Name */
  width:26mm;font-size:6pt;text-align:right;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }


.styIRS990ScheduleFTableCellA {   /* Form Name */
  width:50mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }

.styIRS990ScheduleFTableCellB {   /* Form Name */
  width:20mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }
.styIRS990ScheduleFTableCellC {   /* Form Name */
  width:31mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }
.styIRS990ScheduleFTableCellD {   /* Form Name */
  width:31mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }
.styIRS990ScheduleFTableCellE {   /* Form Name */
  width:16mm;font-size:6pt;text-align:right;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }
.styIRS990ScheduleFTableCellF {   /* Form Name */
  width:31mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }
.styIRS990ScheduleFTableCellG {   /* Form Name */
  width:15mm;font-size:6pt;text-align:right;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }
.styIRS990ScheduleFTableCellH {   /* Form Name */
  width:31mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }
.styIRS990ScheduleFTableCellI {   /* Form Name */
  width:31mm;font-size:6pt;text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
 }


.IRS990ScheduleF_CellPtI {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1mm;padding-right:1mm;
  height:4mm;
}


.IRS990ScheduleF_IndexCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  padding-left:0mm;padding-right:10px;padding-top:1px;padding-bottom:1px;
  font-weight:bold;text-align:right;
}

.IRS990ScheduleF_MoneyCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  padding-left:1px;padding-right:1px;
  font-size:6pt;text-align:right;
}

.styNBSP{
		width: 16px;
		font-weight: bold;
}


</xsl:template>
</xsl:stylesheet>
