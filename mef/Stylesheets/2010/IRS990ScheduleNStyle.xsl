<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 990ScheduleN -->

<xsl:template name="IRS990ScheduleNStyle">
  .sty990ScheduleNBB {   /* Bottom Border */
    width: 256mm; height: 18mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: left;
  }
  .sty990ScheduleNFN {   /* Form Name */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty990ScheduleNFNum {   /* Form Number */
    font-family: verdana, arial, sans-serif;
    font-size: 10pt; font-weight: bold;
  }
  .sty990ScheduleNFNum2 {   /* Form Number 2nd Line */
    font-family: verdana, arial, sans-serif;
    font-size: 10pt; font-weight: bold;
  }
  .sty990ScheduleNRev {
    font-size: 6pt; font-weight: normal;
  }
  .sty990ScheduleNAgency {   /* Agency */
    font-family: verdana, arial, sans-serif;
    font-size: 6pt; font-weight: normal;
  }
  .sty990ScheduleNPartName{ /* Used to display Part Name - Black background with white text used to display names such as "Part I" */
			height:3mm;width:14mm;
			color:white;
			background-color:black;
			font-size: 8pt;
			font-weight:bold;
			text-align:center;
			float:left; clear: none;
}
	.sty990ScheduleNPartDesc{ /* Section Part Description  - Displayed to the right of the styPartName*/
			height:3mm;width:240mm;
			font-size: 8pt; 
			font-weight: bold;
			padding-left:3mm;
			float:left; clear: none;
}
			
.sty990ScheduleNFTBox {   /* Form Title Box*/
    height:18mm;
    text-align: center;
    float: left; clear: none;
  }
  .sty990ScheduleNFMT {   /* Form Main Title */
    font-family: verdana, arial, sans-serif;
    font-size: 12pt; font-weight: bold;
    text-align: center;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;
  }
  
  .sty990ScheduleNFST {   /* Form Subtitle */
    font-family: verdana, arial, sans-serif;
    font-size: 7pt; font-weight: bold;
  }
  .sty990ScheduleNOMB {   /* OMB No. */
    font-size: 6pt;
    text-align:center;
    height: 18mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
  }
  .IRS990ScheduleN_FormYearBlock {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
  width:45mm;height:18mm;
  float:left;
}
 .IRS990ScheduleN_OMB {   /* Block containing the OMB number */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:45mm;height:4mm;
  text-align:center;
  float:left;
}
.IRS990ScheduleN_TaxYear {   /* Block Contain tax year */
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
 .sty990ScheduleNBusinessName {   /* Business Name */
    font-size: 6pt;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty990ScheduleNName {   /*Name */
     width:109mm;
    font-size: 6pt;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty990ScheduleNIN {   /*IN */
    font-size: 6pt;
    text-align: center;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: none;
  }
  .sty990ScheduleNINBox{ /*Employer ID number box*/
    font-size:6pt;
    font-weight: bold;
    float: left; clear: none;
  }
  .sty990ScheduleNCorporation {
    width: 256mm;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  }
  .sty990ScheduleNLNCol {
    height: 8mm;
    width: 62mm;
    font-size: 8pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;
    text-align: left;
    float:left; clear:none;
  }
  .sty990ScheduleNColA {
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
  .sty990ScheduleNCol {
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
  .sty990ScheduleNColiii {
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
  .sty990ScheduleNColB {
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
  .sty990ScheduleNColC {
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
  .sty990ScheduleNDescLine {   /* Desc Line */
    font-size: 7pt;
    width: 256mm;
  }
  .sty990ScheduleNLN {   /* Line Number */
    color: black;
    font-weight: bold;
    text-align: right;
    float: left;
  }
  .sty990ScheduleNLine {
    font-size: 8pt;
    color: black;
    margin-left: 2mm; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    float: left;
  }

.IRS990ScheduleN_LineIndexMid { /* subline index 2 */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS990ScheduleN_LineIndexMidFillerGray { /* subline index 2, bottomless with gray fill */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;background-color:lightgrey;
}

  .sty990ScheduleNFormFooter {   /* Form Footer */
    width:256mm;
    font-size: 6pt;
    text-align: left;
  }
.sty990ScheduleNUnderlineAmount{ /* Box for storing underlined amounts. */
			width:22mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
			float:left; clear: none;
}  
</xsl:template>

</xsl:stylesheet>