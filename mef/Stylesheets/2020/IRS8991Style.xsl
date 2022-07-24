<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS8991Style">

  .sty8991DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty8991Desc{ /* Line item description */
	width:143mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
  .sty8991ShortDesc{ /* Line item description */
	width:95mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
 .sty8991HeaderBox{ /* Box for storing line item amounts. */
	width:28mm;min-height:4mm;
	padding:0.5mm;
	text-align:center;
	font-weight:bold;
	border-style: solid; border-color: black;
	border-top-width: 1px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  .sty8991AmountBox{ /* Box for storing line item amounts. */
	width:28mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  .sty8991AmountBoxNBB{ /* Amount Box with no bottom border */
	width:28mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  .sty8991ScheduleBoxAmt { /* Box for storing line item amounts. */
	width:27mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  .sty8991ScheduleBoxInd { /* Box for storing line item amounts. */
	width:20mm;height:4mm;
	padding:0.5mm;
	text-align:center;
	font-weight:bold;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  </xsl:template>

</xsl:stylesheet>