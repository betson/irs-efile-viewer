<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- CSS Styles for form IRS940_940PR -->
  <xsl:template name="IRS940_940PRStyle">

  
  .sty1040PREnglishBtn{
    background: url("/mef/rrprd/common/images/refreshENGButton.gif");
    width:50px;
    height:13px;
    border: 0;
  }
  .sty1040PRSpanishBtn{
    background: url("/mef/rrprd/common/images/refreshSPButton.gif");
    width:50px;
    height:13px;
    border: 0;
  }
  
  .styIRS940RightNumBox{ /* Right number box */
			width:6mm;height:6mm;
			padding-top:1mm;
			font-weight:bold;
			text-align:center;
			vertical-align:bottom;
			float:left; clear: none;
		}
		<!--padding-right added to produce more pleasant display DRB 12/2015-->
		.styIRS940LNAmountBox{ /* Box for storing line item amounts. */
			width:37mm;height:5mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			padding-right:.5mm;
			text-align:right;
			background-color:white;
			border-style: solid; border-color: black;
			border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
			float:left; clear: none;
		}
</xsl:template>

</xsl:stylesheet>
