<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS990TStyle">

  .sty990TDotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty990THeaderCell { /* Filer Info cell */
		height:7.5mm;
		padding-left:4px;
		padding-right:2px;
		padding-top:2px;
		border-style:solid;
		border-color:black;
		border-width:0px 0px 1px 1px;
		float:left; clear:none;
	}
	
	.sty990TLeftLtrBox {
	  float:left; clear:none;
	  width:4mm;height:auto;
	  font-weight:bold;
	}
  </xsl:template>

</xsl:stylesheet>