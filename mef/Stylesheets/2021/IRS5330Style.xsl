<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS5330Style">

  .sty5330DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty5330Desc { 
		width:130mm;min-height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
	}
	
	.sty5330NumBox {
		width:8mm;min-height:4mm;
		padding-top:.65mm;
		padding-bottom:.5mm;
		font-size:6pt;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	
  .sty5330HeaderCell { /* Filer Info cell */
		height:7.5mm;
		padding-left:0px;
		padding-right:2px;
		padding-top:2px;
		border-style:solid;
		border-color:black;
		border-width:0px 0px 1px 1px;
		float:left; clear:none;
	}
	
  </xsl:template>

</xsl:stylesheet>