<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS4720Style">

  .sty4720DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty4720ScheduleHead {
    height:auto;width:187mm;
    display:block;float:none;clear:both;
    padding:0.5mm;
    font-weight:bold;
    font-size:8pt;
    text-align:center;
    border-style:solid;border-color:black;
    border-width:1px 0px 1px 0px;
  }
  
  .sty4720HeaderCell { /* Filer Info cell */
		height:7.5mm;
		padding-left:4px;
		padding-right:2px;
		padding-top:2px;
		border-style:solid;
		border-color:black;
		border-width:0px 0px 1px 1px;
		float:left; clear:none;
	}
	
	.sty4720LeftLtrBox {
	  float:left; clear:none;
	  width:4mm;height:auto;
	  font-weight:bold;
	}
  </xsl:template>

</xsl:stylesheet>