<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="IRS4137Style">

	.styIRS4137Desc {
		width:132.2mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
    }
    
    .styIRS4137DescInd { /* Line Description for lines with indented amounts */
		width:90.2mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
    }

    .styIRS4137AmountBox {
		width:34mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
    }
    
    .styIRS4137Dots {
		letter-spacing:3.2mm;
		font-weight:bold;
		float:right;
		clear:none;
		padding-right:3.5mm;
    }
    
    </xsl:template>
</xsl:stylesheet>
