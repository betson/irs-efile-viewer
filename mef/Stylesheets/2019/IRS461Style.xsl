<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS461Style">

  .sty461DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty461Desc {
    width:138mm;min-height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-left:.8mm;
	float:left; clear: none;
	border-left:1px solid black;
  }
  
  .sty461LeftBox {
    width:8mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	float:left; clear:none;
	text-align:center;
  }
  </xsl:template>

</xsl:stylesheet>