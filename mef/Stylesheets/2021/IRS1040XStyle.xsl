<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS1040XStyle">
  
  .sty1040XDotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty1040XDesc {
    width:82mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
  
  .sty1040XLongDesc {
    width:142mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
  
  .sty1040XRightNumBox{ /* Right number box */
	width:7mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	text-align:center;
	vertical-align:bottom;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  .sty1040XRightNumBoxNBB{ /* Right number box with no bottom border*/
	width:7mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	text-align:center;
	vertical-align:bottom;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }

  .sty1040XAmtBox {
	width:30mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty1040XAmtBoxNBB {
	width:30mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .styIRS1040XHeaderCell { /* Filer Info cell */
	height:7.5mm;
	padding-left:4px;
	padding-right:2px;
	border-style:solid;
	border-color:black;
	border-width:0px 1px 1px 0px;
	float:left; clear:none;
  }
  
  .sty1040XDepdContainer {   
	border-style: solid; border-color: black;
	border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	width: 187mm; height:auto;
	float:none;clear:both;
	overflow-y: auto;
  }
  
  .sty1040XDepdContainer2 {   
			width: 167mm; 
			float:left;
			overflow-y: auto;
		} 
  
  </xsl:template>

</xsl:stylesheet>