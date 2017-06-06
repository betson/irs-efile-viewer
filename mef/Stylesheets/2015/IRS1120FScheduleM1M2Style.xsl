<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for form IRS 1120-F Schedule M-1 and M-2 -->
  <xsl:template name="IRS1120FScheduleM1M2Style">
    .sty1120FSchM1M2FNBox {   /* 1120F Schedule M1 and M2 Form Number Box */
      font-family: "Arial";
      font-size: 8pt;
      text-align:left;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 2px;
    }
      
    .sty1120FSchM1M2OMB {   /* 1120F Schedule M1 and M2 OMB No. */
      height:4mm;
      font-size:7pt;
      font-weight:normal;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 2px; border-right-width: 0px;
    }
      
    .sty1120FSchM1M2TY {   /* 1120F Schedule M1 and M2 Tax Year */
      font-family: "Arial Narrow";
      font-size: 23pt;
      font-weight: bold;
      height:8mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 2px; border-right-width: 0px;
    }
    
    .sty1120FSchM1M2LNAmountBox{ /* Box for storing line item amounts. */
      width:34mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      padding-right:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      float:left; clear: none;
    }
    
    .sty1120FSchM1M2LNAmountBoxShaded{ /* Shaded Amount Box */
      width:34mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;
      float:left; clear: none;
    }
    
    .sty1120FSchM1M2ItemUnderline{ /* Underlined Item */
      width:53mm;height:4mm;
      font-size:6pt;
      text-align:right;
      padding-top:.5mm;
      padding-bottom:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0.5px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
  
    .sty1120FSchM1M2DotLn { /* Dotted line */
      letter-spacing:3.3mm;
      font-weight:bold; 	
      skiplink:display:none;
    }	

	.sty1120FSchM1M2_styPartHdr {   /* Part Header */
	  width:187mm;
	  font-size: 8pt; font-weight: bold;
	  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
	  border-style: solid; border-color: black;
	  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
	}            

	.sty1120FSchM1M2_styLNLeftNumBox{ /* Double digit item number to the left of the page */
		width:6mm;
		height:4mm;
		padding-left:1.5mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		float:left; clear:none;
	}

	.sty1120FSchM1M2_headerTableCell{ /* Table Cell for header*/
		float:left;text-align:left;
		border-style: solid;
		border-top-width: 0px; border-left-width: 0px; border-right-width: 1px; border-bottom-width: 0px;
	}	
  </xsl:template>
</xsl:stylesheet>