<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS8993Style">

  .sty8993DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
    .sty8993HeaderBox {
    width:32mm;min-height:12mm;
    font-family:Arial;
    padding-top:0.5mm;
	padding-bottom:0.5mm;
	padding-right:0.2mm;
	padding-left:0.2mm;
	text-align:center;
	border-style:solid;border-color:black;
	border-left-width:1px;border-right-width: 0px;border-top-width:0px;border-bottom-width:1px;
	float:left;clear:none;
  }
  
  .sty8993DescBox {
    width:42mm;height:4mm;
    padding-top:0.5mm;
	padding-bottom:0.5mm;
	padding-right:0.5mm;
	padding-left:0.5mm;
	text-align:left;
	float:left;clear:none;
  }
  
  </xsl:template>

</xsl:stylesheet>