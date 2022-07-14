<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for form IRS 1120-F Schedule H -->
  <xsl:template name="IRS1120FScheduleHStyle">
    .sty1120FSchHFNBox {   /* 1120F Schedule H Form Number Box */
      font-family: "Arial";
      font-size: 8pt;
      text-align:left;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 2px;
    }
      
    .sty1120FSchHAgency {   /* 1120F Schedule H Agency */
      font-family: "Arial";
      font-size: 7pt;
      font-weight:normal;
    }
      
    .sty1120FSchHFTBox {   /* 1120F Schedule H Form Title Box*/
      font-size:7pt;
      text-align: center;
      clear: none;
    }
      
    .sty1120FSchHMainTitle {   /* Form Main Title */
      font-size: 11pt;
      font-family: "Arial";
      font-weight: bold;
    }
      
    .sty1120FSchHOMB {   /* 1120F Schedule H OMB No. */
      height:4mm;
      font-size:7pt;
      font-weight:normal;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 2px; border-right-width: 0px;
    }
      
    .sty1120FSchHTY {   /* 1120F Schedule H Tax Year */
      font-family: "Arial Narrow";
      font-size: 23pt;
      font-weight: bold;
      height:8mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 2px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNLeftNumBox{ /* Single digit item number to the left of the page */
      width:6mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      padding-left:2mm;
    }
    
    .sty1120FSchHLNLeftNumBoxDD{ /* Double digit item number to the left of the page */
      width:6mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      padding-left:0.5mm;
    }
    
    .sty1120FSchHLNLeftNumBoxLetter{ /* Single letter item number to the left of the page */
      width:6mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      padding-left:4mm;
    }
    
    .sty1120FSchHLNDesc{ /* Line item description */
      width:140mm;height:4mm;
      font-weight:normal;
      text-align:left;
      padding-right:5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
    }
    
    .sty1120FSchHLNDescShort{ /* Line item description - short width */
      width:99mm;height:4mm;
      font-weight:normal;
      text-align:left;
      padding-top:.5mm;
      padding-bottom:.5mm;
    }
    
    .sty1120FSchHLNDescLong{ /* Line item description - Long width */
      width:165mm;height:4mm;
      font-weight:normal;
      text-align:left;
      padding-right:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
    }
    
    .sty1120FSchHDotLn { /* Dotted line - no float */
      letter-spacing:3.3mm;
      font-weight:bold; 	
      skiplink:display:none;
    }	
    
    .sty1120FSchHLNRightNumBox{ /* Right number box */
      width:8mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNRightNumBoxNBB{ /* Right number box wih no bottom border */
      width:8mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNRightNumBoxShadedNBB{ /* Shaded right number box with no bottom border*/
      width:8mm;height:4mm;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNYesNoBox{ /* Yes No box */
      width:8mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:normal;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNAmountBox{ /* Box for storing line item amounts. */
      width:33mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNAmountBoxNBB{ /* Amount Box with no bottom border */
      width:33mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNLeftNumBoxTallDD{ /* Double digit item number to the left of the page - 8mm Height */
      width:6mm;height:8mm;
      padding-top:3.5mm;
      font-weight:bold;
      padding-left:0.5mm;
    }
    
    .sty1120FSchHLNLeftNumBoxTallDDTwoLines{ /* Double digit item number to the left of the page - 8mm Height with two lines of text description */
      width:6mm;height:8mm;
      padding-top:0.7mm;
      font-weight:bold;
      padding-left:0.5mm;
    }
    
    .sty1120FSchHLNLeftNumBoxTallLetter{ /* Single letter item number to the left of the page - 8mm Height */
      width:6mm;height:8mm;
      padding-top:3.5mm;
      font-weight:bold;
      padding-left:4mm;
    }
    
    .sty1120FSchHLNLeftNumBoxTallLetterTwoLines{ /* Single letter item number to the left of the page - 8mm Height with two lines of text description */
      width:6mm;height:8mm;
      padding-top:0.7mm;
      font-weight:bold;
      padding-left:4mm;
    }
    
    .sty1120FSchHLNDescTall{ /* Line item description - 8mm Height */
      width:140mm;height:8mm;
      font-weight:normal;
      text-align:left;
      padding-right:5mm;
      padding-top:3.5mm;
    }
    
    .sty1120FSchHLNDescTallShort{ /* Line item description - short width - 8mm Height */
      width:99mm;height:8mm;
      font-weight:normal;
      text-align:left;
      padding-top:3.5mm;
    }
    
    .sty1120FSchHLNDescTallShortest{ /* Line item description - shortest width - 8mm Height */
      width:89mm;height:8mm;
      font-weight:normal;
      text-align:left;
      padding-top:3.5mm;
      padding-right:3mm;
    }
    
    .sty1120FSchHLNRightNumBoxTall{ /* Right number box - 8mm Height */
      width:8mm;height:8mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNRightNumBoxTallNBB{ /* Right number box wih no bottom border - 8mm Height */
      width:8mm;height:8mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNRightNumBoxTallShadedNBB{ /* Shaded right number box with no bottom border - 8mm Height */
      width:8mm;height:8mm;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNAmountBoxTall{ /* Box for storing line item amounts - 8mm Height */
      width:33mm;height:8mm;
      padding-top:3.5mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNAmountBoxTallNBB{ /* Amount Box with no bottom border - 8mm Height */
      width:33mm;height:8mm;
      padding-top:3.5mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNAmountBoxTallNBBTwoLines{ /* Amount Box with no bottom border - 8mm Height with two lines of text description */
      width:33mm;height:8mm;
      padding-top:5.5mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNAmountBoxTallShort{ /* Box for storing line item amounts - Short width - 8mm Height */
      width:28mm;height:8mm;
      padding-top:3.5mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNAmountBoxTallShortTwoLines{ /* Box for storing line item amounts - Short width - 8mm Height with two lines of text description */
      width:28mm;height:8mm;
      padding-top:5.5mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNAmountBoxTallShortNBBTwoLines{ /* Amount Box with no bottom border - Short width - 8mm Height with two lines of text description */
      width:28mm;height:8mm;
      padding-top:5.5mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNAmountBoxHeader{ /* Header Box for storing short line item amounts */
      width:28mm;height:12mm;
      padding-top:1.5mm;
      padding-bottom:1.5mm;
      text-align:center;
      font-weight:bold;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchHLNDescHeader{ /* Line item description - shortest width - 8mm Height */
      width:103mm;height:12mm;
      font-weight:normal;
      text-align:left;
      padding-top:1.5mm;
      padding-bottom:1.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
  </xsl:template>
</xsl:stylesheet>