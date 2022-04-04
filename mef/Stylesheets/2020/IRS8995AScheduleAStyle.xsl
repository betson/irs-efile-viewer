<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS8995AScheduleAStyle">
  
  .sty8995ASchADotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty8995ASADesc {
    width:81mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
  
  .sty8995ASAAmtBox {
	width:30mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty8995ASALineDiv { 
    width:187mm;
	display:inline-block;
	float:none;clear:both;
	overflow:auto;
  }
  
  </xsl:template>

</xsl:stylesheet>