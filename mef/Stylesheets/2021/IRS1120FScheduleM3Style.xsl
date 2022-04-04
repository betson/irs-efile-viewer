<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for form IRS 1120-F Schedule M-3 -->
  <xsl:template name="IRS1120FScheduleM3Style">
    .sty1120FSchM3FNBox {   /* 1120F Schedule M3 Form Number Box */
      font-family: "Arial";
      font-size: 8pt;
      text-align:left;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 2px;
    }
      
    .sty1120FSchM3Agency {   /* 1120F Schedule M3 Agency */
      font-family: "Arial";
      font-size: 7pt;
      font-weight:normal;
    }
      
    .sty1120FSchM3FTBox {   /* 1120F Schedule M3 Form Title Box*/
      font-size:7pt;
      text-align: center;
      float: left; clear: none;
    }
      
    .sty1120FSchM3MainTitle {   /* Form Main Title */
      font-size: 11pt;
      font-family: "Arial";
      font-weight: bold;
    }
      
    .sty1120FSchM3OMB {   /* 1120F Schedule M3 OMB No. */
      height:4mm;
      font-size:7pt;
      font-weight:normal;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 2px; border-right-width: 0px;
    }
      
    .sty1120FSchM3TY {   /* 1120F Schedule M3 Tax Year */
      font-family: "Arial Narrow";
      font-size: 23pt;
      font-weight: bold;
      height:8mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 2px; border-right-width: 0px;
    }
    
    .sty1120FSchM3LNDesc{ /* Line item description */
      width:147mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:justify;
      float:left; clear: none;
    }
    
    .sty1120FSchM3LNDescLong{ /* Line item description */
      width:179mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:justify;
      float:left; clear: none;
    }
    
    .sty1120FSchM3ChkBx {
      padding-left:2mm;
      padding-top:3.5mm;
      width:14mm;
      float:left; clear:none;
      font-size:8pt;font-weight:bold
    }
    
    .sty1120FSchM3Pad4mm {
      float:left;clear:none;
      width:3mm
    }
    
     .sty1120FSchM3DotLn { 
      letter-spacing:3.3mm;
      font-weight:bold; 	
      skiplink:display:none;
      font-size:7pt;
    }	
    
    .sty1120FSchM3RightFloat { /* Generic div for right aligned item */
      float:right;clear:none;
      text-align:right;
    }
    
    .sty1120FSchM3UnderlinedDate{ /* Underlined Item */
      width:30mm;height:4mm;
      text-align:center;
      padding-top:.5mm;
      padding-bottom:.2mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchM3UText{ /* Underlined Text. */
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }		
    
    .sty1120FSchM3LN411AmountBox{ /* Box for storing line item amounts. */
      width:38mm;height:4.4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      padding-right:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    
    .sty1120FSchM3LN411Desc{ /* Line item description */
      width:133mm;height:4.4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      padding-right:3mm;
      text-align:justify;
      float:left; clear: none;
    }
    
    .sty1120FSchM3LN411LeftNumBoxSD{ /* Single digit item number to the left of the page */
      width:8mm;height:4.4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      float:left; clear:none;
      padding-left:2.5mm;
    }
    
    .sty1120FSchM3LN411RightNumBox{ /* Right number box */
      width:8mm;height:4.4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    
    .sty1120FSchM3TableCellNum { /*Table Cell line number*/
      width:7mm;height:4mm;
      padding-left:2.5mm;
      text-align:left;
      font-weight:bold;
      font-size:7pt;
    }
    
    .sty1120FSchM3TableCellNumDD { /*Table Cell double digit line number*/
      width:7mm;height:4mm;
      padding-left:0.9mm;
      text-align:left;
      font-weight:bold;
      font-size:7pt;
    }
    
    .sty1120FSchM3TableCellText { /*Table Cell Description*/
      width:60mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:2mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchM3TableCellAmount { /*Table Cell for storing amounts*/
      width:24mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      padding-top:0.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchM3TableCellAmountLastCol { /*Table Cell for storing amounts with no right border*/
      width:24mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      padding-top:0.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
  </xsl:template>
</xsl:stylesheet>