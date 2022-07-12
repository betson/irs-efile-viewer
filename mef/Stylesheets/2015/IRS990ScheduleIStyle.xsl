<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 990ScheduleI -->

<xsl:template name="IRS990ScheduleIStyle">
  .sty990ScheduleIBB {   /* Bottom Border */
    width: 256mm; height: 18mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: left;
  }
  .sty990ScheduleIFN {   /* Form Name */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty990ScheduleIFNum {   /* Form Number */
    font-family: verdana, arial, sans-serif;
    font-size: 10pt; font-weight: bold;
  }
  .sty990ScheduleIFNum2 {   /* Form Number 2nd Line */
    font-family: verdana, arial, sans-serif;
    font-size: 10pt; font-weight: bold;
  }
  .sty990ScheduleIRev {
    font-size: 6pt; font-weight: normal;
  }
  .sty990ScheduleIAgency {   /* Agency */
    font-family: verdana, arial, sans-serif;
    font-size: 6pt; font-weight: normal;
  }
  .sty990ScheduleIPartName{ /* Used to display Part Name - Black background with white text used to display names such as "Part I" */
			height:3mm;width:14mm;
			color:white;
			background-color:black;
			font-size: 8pt;
			font-weight:bold;
			text-align:center;
			float:left; clear: none;
}
	.sty990ScheduleIPartDesc{ /* Section Part Description  - Displayed to the right of the styPartName*/
			height:3mm;width:240mm;
			font-size: 8pt; 
			font-weight: bold;
			padding-left:3mm;
			float:left; clear: none;
}
			
.sty990ScheduleIFTBox {   /* Form Title Box*/
    height:18mm;
    text-align: center;
    float: left; clear: none;
  }
  .sty990ScheduleIFMT {   /* Form Main Title */
    font-family: verdana, arial, sans-serif;
    font-size: 12pt; font-weight: bold;
    text-align: center;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;
  }
  
  .sty990ScheduleIFST {   /* Form Subtitle */
    font-family: verdana, arial, sans-serif;
    font-size: 7pt; font-weight: bold;
  }
  .sty990ScheduleIOMB {   /* OMB No. */
    font-size: 6pt;
    text-align:center;
    height: 18mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
  }
  .IRS990ScheduleI_FormYearBlock {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
  width:45mm;height:18mm;
  float:left;
}
 .IRS990ScheduleI_OMB {   /* Block containing the OMB number */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:45mm;height:4mm;
  text-align:center;
  float:left;
}
.IRS990ScheduleI_TaxYear {   /* Block Contain tax year */
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
 .sty990ScheduleIBusinessName {   /* Business Name */
    font-size: 6pt;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty990ScheduleIName {   /*Name */
     width:109mm;
    font-size: 6pt;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty990ScheduleIIN {   /*IN */
    font-size: 6pt;
    text-align: center;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: none;
  }
  .sty990ScheduleIINBox{ /*Employer ID number box*/
    font-size:6pt;
    font-weight: bold;
    float: left; clear: none;
  }
  .sty990ScheduleICorporation {
    width: 256mm;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  }
  .sty990ScheduleILNCol {
    height: 8mm;
    width: 62mm;
    font-size: 8pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    text-align: left;
  
  }
  .sty990ScheduleIColA {
    height: 8mm;
    width:31mm;
    font-size: 6pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width:1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    padding-top:0mm; padding-left:0px; padding-right:.5mm; padding-bottom: 0px;
    text-align: right;
  
  }
  .sty990ScheduleICol {
    height: 8mm;
    width:31mm;
    font-size: 6pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width:1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    padding-top:6mm; padding-left:0px; padding-right:.5mm; padding-bottom: 0px;
    text-align: right;
  
  }
  .sty990ScheduleIColiii {
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
  .sty990ScheduleIColB {
    height: 8mm;
    width: 35.75mm;
    font-size: 6pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    padding-top:6mm; padding-left:0px; padding-right:.5mm; padding-bottom: 0px;
    text-align: right;

  }
  .sty990ScheduleIColC {
    height: 8mm;
    width: 35.75mm;
    font-size: 7pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    padding-top:6mm; padding-left:0px; padding-right:.5mm; padding-bottom: 0px;
    text-align: right;
 
  }
  .sty990ScheduleIDescLine {   /* Desc Line */
    font-size: 7pt;
    width: 256mm;
  }
  .sty990ScheduleILN {   /* Line Number */
    color: black;
    font-weight: bold;
    text-align: right;
    float: left;
  }
  .sty990ScheduleILine {
    font-size: 8pt;
    color: black;
    margin-left: 2mm; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    float: left;
  }

.IRS990ScheduleI_LineIndexMid { /* subline index 2 */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS990ScheduleI_LineIndexMidFillerGray { /* subline index 2, bottomless with gray fill */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;background-color:lightgrey;
}

  .sty990ScheduleIFormFooter {   /* Form Footer */
    width:256mm;
    font-size: 6pt;
    text-align: left;
  }
  
</xsl:template>

</xsl:stylesheet>