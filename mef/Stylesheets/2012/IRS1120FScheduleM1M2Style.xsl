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
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
  
    .sty1120FSchM1M2DotLn { /* Dotted line */
      letter-spacing:3.3mm;
      font-weight:bold; 	
      skiplink:display:none;
    }	
            
  </xsl:template>
</xsl:stylesheet>