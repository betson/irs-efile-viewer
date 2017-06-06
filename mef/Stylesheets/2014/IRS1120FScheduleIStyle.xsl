<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for form IRS 1120-F Schedule I -->
  <xsl:template name="IRS1120FScheduleIStyle">
    .sty1120FSchIFNBox {   /* 1120F Schedule I Form Number Box */
      font-family: "Arial";
      font-size: 8pt;
      text-align:left;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 2px;
    }
      
    .sty1120FSchIAgency {   /* 1120F Schedule I Agency */
      font-family: "Arial";
      font-size: 7pt;
      font-weight:normal;
    }
      
    .sty1120FSchIFTBox {   /* 1120F Schedule I Form Title Box*/
      font-size:7pt;
      text-align: center;
      float: left; clear: none;
    }
      
    .sty1120FSchIMainTitle {   /* Form Main Title */
      font-size: 11pt;
      font-family: "Arial";
      font-weight: bold;
    }
      
    .sty1120FSchIOMB {   /* 1120F Schedule I OMB No. */
      height:4mm;
      font-size:7pt;
      font-weight:normal;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 2px; border-right-width: 0px;
    }
      
    .sty1120FSchITY {   /* 1120F Schedule I Tax Year */
      font-family: "Arial Narrow";
      font-size: 23pt;
      font-weight: bold;
      height:8mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 2px; border-right-width: 0px;
    }
    
    .sty1120FSchIGenericNum { /* Generic line number*/
      width:6mm;height:4mm;
      text-align:left;
      font-weight:bold;
      font-size:7pt;
    }
    
    .sty1120FSchIGenericLetter{ /* Generic line letter */
      width:6mm;height:4mm;
      font-weight:bold;
      font-size:7pt;
      padding-left:1.7mm;
    }
    
    .sty1120FSchIGenericLetterDD{ /* Generic line letter for double digit line numbers*/
      width:6mm;height:4mm;
      font-weight:bold;
      font-size:7pt;
      padding-left:3.2mm;
    }
   
    .sty1120FSchIGenericRightNumBox{ /* Right number box */
      width:6mm;height:4mm;
      font-weight:bold;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIDotLn { /* Dotted line - no float */
      letter-spacing:3.3mm;
      font-weight:bold;
      font-size:7pt; 	
      skiplink:display:none;
    }	
    
    .sty1120FSchIRightFloat { /* Generic div for right aligned item */
      float:right;clear:none;
      text-align:right;
    }
    
    .sty1120FSchILineABNum { /* Line A and B line number*/
      width:6mm;height:4mm;
      text-align:left;
      font-weight:bold;
      font-size:7pt;
      float:left;clear:none;
      padding-top:0.5mm;
    }
    
    .sty1120FSchILineABDesc { /*Line A and B line description*/
      width:181mm;height:4mm;
      text-align:left;
      font-weight:normal;
      font-size:7pt;
      float:left;clear:none;
      padding-top:0.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep1Desc { /*Step 1 line description*/
      width:77mm;height:4mm;
      text-align:left;
      font-weight:normal;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep1Amount { /*Step 1 for storing amounts*/
      width:26mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep1AmountLastCol { /*Step 1 for storing amounts with no right border*/
      width:26mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep1AmountShaded { /*Step 1 Shaded*/
      width:26mm;height:4mm;
      background-color:lightgrey;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep1AmountShadedLastCol { /*Step 1 Shaded with no right border*/
      width:26mm;height:4mm;
      font-weight:normal;
      background-color:lightgrey;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep1Header { /*Step 1 Header*/
      width:26mm;height:4mm;
      text-align:center;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep1HeaderLastCol { /*Step 1 Header with no right border*/
      width:26mm;height:4mm;
      text-align:center;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep2Desc { /*Step 2 line description*/
      width:125mm;height:4mm;
      padding-right:2mm;
      text-align:left;
      font-weight:normal;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep2DescLong { /*Step 2 long line description*/
      width:153mm;height:4mm;
      padding-right:2.8mm;
      text-align:left;
      font-weight:normal;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep2Amount { /*Step 2 for storing amounts*/
      width:28mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep2AmountLastCol { /*Step 2 for storing amounts with no right border*/
      width:28mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep2AmountShadedLastCol { /*Step 2 Shaded with no right border*/
      width:28mm;height:4mm;
      font-weight:normal;
      background-color:lightgrey;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep3Header { /*Step 3 for storing amounts*/
      width:33mm;height:12mm;
      text-align:center;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3HeaderLastCol { /*Step 3 for storing amounts with no right border*/
      width:33mm;height:12mm;
      text-align:center;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep3Desc { /*Step 3 line description*/
      width:79mm;height:4mm;
      padding-right:3mm;
      text-align:justify;
      font-weight:normal;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3Amount { /*Step 3 for storing amounts*/
      width:34mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      padding-top:2.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3AmountLastCol { /*Step 3 for storing amounts with no right border*/
      width:34mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      padding-top:2.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep3AmountShaded { /*Step 3 Shaded*/
      width:34mm;height:4mm;
      background-color:lightgrey;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3AmountShadedLastCol { /*Step 3 Shaded with no right border*/
      width:34mm;height:4mm;
      font-weight:normal;
      background-color:lightgrey;
      font-size:7pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep3ContAdjUSDesc { /*Step 3 (Cont. Adj US) line description*/
      width:141mm;height:4mm;
      text-align:left;
      font-weight:normal;
      font-size:7pt;
      padding-right:0.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3ContAdjUSDescShort { /*Step 3 (Cont. Adj US) short line description*/
      width:101mm;height:4mm;
      text-align:left;
      font-weight:normal;
      font-size:7pt;
      padding-right:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3ContAdjUSAmount { /*Step 3 (Cont. Adj US) for storing amounts*/
      width:34mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3ContAdjUSAmountLastCol { /*Step 3 (Cont. Adj US) for storing amounts with no right border*/
      width:34mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep3ContAdjUSShadedCell { /*Step 3 (Cont. Adj US) Shaded with no right border*/
      width:40mm;height:4mm;
      font-weight:normal;
      background-color:lightgrey;
      font-size:7pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep3ContSepCurDesc { /*Step 3 (Cont.) Sep Cur line description*/
      width:77mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:2mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3ContSepCurAmount { /*Step 3 (Cont.) Sep Cur for storing amounts*/
      width:26mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3ContSepCurAmountLastCol { /*Step 3 (Cont.) Sep Cur for storing amounts with no right border*/
      width:26mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchIStep3ContSepCurShaded { /*Step 3 (Cont.) Sep Cur Shaded*/
      width:26mm;height:4mm;
      background-color:lightgrey;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3ContSepCurShadedLastCol { /*Step 3 (Cont.) Sep Cur Shaded with no right border*/
      width:26mm;height:4mm;
      font-weight:normal;
      background-color:lightgrey;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    
      .sty1120FSchIStep3ContSepCurHeader { /*Step 3 (Cont.) Sep Cur Header*/
      width:26mm;height:4mm;
      text-align:center;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchIStep3ContSepCurHeaderLastCol { /*Step 3 (Cont.) Sep Cur Header with no right border*/
      width:26mm;height:4mm;
      text-align:center;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchISummaryDesc { /*Summary line description*/
      width:141mm;height:4mm;
      text-align:justify;
      font-weight:normal;
      font-size:7pt;
      padding-right:1.2mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchISummaryDescShort { /*Summary short line description*/
      width:104mm;height:4mm;
      text-align:justify;
      font-weight:normal;
      font-size:7pt;
      padding-right:2mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchISummaryAmount { /*Summary for storing amounts*/
      width:33mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchISummaryAmountLastCol { /*Summary for storing amounts with no right border*/
      width:33mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }

    .sty1120FSchISummaryShadedAmountLastCol { /*Summary Shaded amount with no right border*/
      width:33mm;height:4mm;
      font-weight:normal;
      background-color:lightgrey;
      font-size:7pt;
      padding-right:1mm;
    }
    
    .sty1120FSchISummaryShadedRightNumBox { /*Summary Shaded right number box with no right border*/
      width:5mm;height:4mm;
      font-weight:normal;
      background-color:lightgrey;
      font-size:7pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
  </xsl:template>
</xsl:stylesheet>