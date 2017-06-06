<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 990 ScheduleK -->

<xsl:template name="IRS990ScheduleKStyle">
  .sty990ScheduleKBB {   /* Bottom Border */
    width: 256mm; height: 18mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: left;
  }
  .sty990ScheduleKFN {   /* Form Name */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty990ScheduleKFNum {   /* Form Number */
    font-family: verdana, arial, sans-serif;
    font-size: 10pt; font-weight: bold;
  }
  .sty990ScheduleKFNum2 {   /* Form Number 2nd Line */
    font-family: verdana, arial, sans-serif;
    font-size: 10pt; font-weight: bold;
  }
  .sty990ScheduleKRev {
    font-size: 6pt; font-weight: normal;
  }
  .sty990ScheduleKAgency {   /* Agency */
    font-family: verdana, arial, sans-serif;
    font-size: 6pt; font-weight: normal;
  }
  .sty990ScheduleKPartName{ /* Used to display Part Name - Black background with white text used to display names such as "Part I" */
			height:3mm;width:14mm;
			color:white;
			background-color:black;
			font-size: 8pt;
			font-weight:bold;
			text-align:center;
			float:left; clear: none;
}
	.sty990ScheduleKPartDesc{ /* Section Part Description  - Displayed to the right of the styPartName*/
			height:3mm;width:240mm;
			font-size: 8pt; 
			font-weight: bold;
			padding-left:3mm;
			float:left; clear: none;
}
			
.sty990ScheduleKFTBox {   /* Form Title Box*/
    height:18mm;
    text-align: center;
    float: left; clear: none;
  }
  .sty990ScheduleKFMT {   /* Form Main Title */
    font-family: verdana, arial, sans-serif;
    font-size: 12pt; font-weight: bold;
    text-align: center;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;
  }
  
  .sty990ScheduleKFST {   /* Form Subtitle */
    font-family: verdana, arial, sans-serif;
    font-size: 7pt; font-weight: bold;
  }
  .sty990ScheduleKOMB {   /* OMB No. */
    font-size: 6pt;
    text-align:center;
    height: 18mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
  }
  .IRS990ScheduleK_FormYearBlock {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
  width:45mm;height:18mm;
  float:left;
}
 .IRS990ScheduleK_OMB {   /* Block containing the OMB number */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:45mm;height:4mm;
  text-align:center;
  float:left;
}
.IRS990ScheduleK_TaxYear {   /* Block Contain tax year */
  padding-top: 10px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  width:45mm;height:10mm;
  font-family: "Arial Narrow";
  font-size: 26pt; font-weight: bold;
  text-align:center;
  float:left;
  /* Note the height is 11mm instead of 12mm.  Seems like borders take space even at zero width */
}
 .sty990ScheduleKBusinessName {   /* Business Name */
    font-size: 6pt;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty990ScheduleKName {   /*Name */
     width:109mm;
    font-size: 6pt;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty990ScheduleKIN {   /*IN */
    font-size: 6pt;
    text-align: center;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: none;
  }
  .sty990ScheduleKINBox{ /*Employer ID number box*/
    font-size:6pt;
    font-weight: bold;
    float: left; clear: none;
  }
  .sty990ScheduleKCorporation {
    width: 256mm;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  }
  .sty990ScheduleKLNCol {
    height: 8mm;
    width: 62mm;
    font-size: 8pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    text-align: left;
    float:left; clear:none;
  }
  .sty990ScheduleKColA {
    height: 8mm;
    width:31mm;
    font-size: 6pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width:1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    padding-top:0mm; padding-left:0px; padding-right:.5mm; padding-bottom: 0px;
    text-align: right;
    float:left; clear: none;
  }
  .sty990ScheduleKCol {
    height: 8mm;
    width:31mm;
    font-size: 6pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width:1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    padding-top:6mm; padding-left:0px; padding-right:.5mm; padding-bottom: 0px;
    text-align: right;
    float:left; clear: none;
  }
  .sty990ScheduleKColiii {
    height: 8mm;
    width:32.75mm;
    font-size: 6pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width:1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    padding-top:6mm; padding-left:0px; padding-right:.5mm; padding-bottom: 0px;
    text-align: right;
    float:left; clear: none;
  }
  .sty990ScheduleKColB {
    height: 8mm;
    width: 35.75mm;
    font-size: 6pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    padding-top:6mm; padding-left:0px; padding-right:.5mm; padding-bottom: 0px;
    text-align: right;
    float:left; clear: none;
  }
  .sty990ScheduleKColC {
    height: 8mm;
    width: 35.75mm;
    font-size: 7pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    padding-top:6mm; padding-left:0px; padding-right:.5mm; padding-bottom: 0px;
    text-align: right;
    float:left; clear: none;
  }
  .sty990ScheduleKDescLine {   /* Desc Line */
    font-size: 7pt;
    width: 256mm;
  }
  .sty990ScheduleKLN {   /* Line Number */
    color: black;
    font-weight: bold;
    text-align: right;
    float: left;
  }
  .sty990ScheduleKLine {
    font-size: 8pt;
    color: black;
    margin-left: 2mm; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    float: left;
  }

.IRS990ScheduleK_LineIndexMid { /* subline index 2 */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS990ScheduleK_LineIndexMidFillerGray { /* subline index 2, bottomless with gray fill */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;background-color:lightgrey;
}

  .sty990ScheduleKFormFooter {   /* Form Footer */
    width:256mm;
    font-size: 6pt;
    text-align: left;
  }
.sty990ScheduleKUnderlineAmount{ /* Box for storing underlined amounts. */
			width:22mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
			float:left; clear: none;
}  
sty990ScheduleKLNLeftNumBoxBB{ /* Item number to the left of the page with a bottom border*/
			width:4mm;height:4mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			font-weight:bold;
			float:left; clear: none;
			padding-left:2mm;
			border-style: solid; 
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}
		.sty990ScheduleKTableCell {   /* Table Cell */
			width: 32mm;
			padding-top:0mm;
			padding-bottom:.5mm;

			text-align: right;
			border-style: solid; padding-top:0mm;padding-bottom:0mm
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
		.IRS990ScheduleKLineDesc { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:156mm;
}

</xsl:template>

</xsl:stylesheet>