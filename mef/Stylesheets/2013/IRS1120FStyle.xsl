<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 1120F -->

<xsl:template name="IRS1120FStyle">
    .styIRS1120FVTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS1120FLNPercentBox{ /* Box for percentages */
      width:10mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1120FLNLeftNumBox{ /* digit item number to the left of the page */
	width:4mm;height:4mm;
	font-weight:bold;
	float:left; clear:none;
	padding-left:1mm;
	padding-top:.5mm;
      border-style: solid; border-color: black;	
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;	
    }
    .styIRS1120FLNDesc{ /* Line item description */
	width:96mm;height:4mm;
	float:left; clear: none;

    }
    .styIRS1120FRGLeftNumBox{ /* digit item number to the left of the page */
	width:4mm; height:4mm;
	font-weight:bold;
	float:left; clear:none;
	padding-left:1mm;
	padding-right:1mm;
      border-style: solid; border-color: black;	
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;	
    }
    
    .styIRS1120FRGnewLeftNumBox{ /* digit item number to the left of the page */
	width:4mm; height:4mm;
	font-weight:bold;
       vertical-align:top;
       text-align:center;
    }
    
    .styIRS1120FRGnewDesc{ /* Line item description */
	width:71mm;height:4mm;
	text-align:justify;
	font-size:7pt;
	font-weight:normal;
	padding-right:1mm;
    } 
    
    .styIRS1120FRGnewYesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:4mm;
      text-align:center;
      vertical-align:bottom;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;  
    }
    
    .styIRS1120FRGnewYesNoBoxShaded {   /* Shading with a left border */
	width:6mm;height:4mm;
	background-color:lightgrey;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .styIRS1120FRGDesc{ /* Line item description */
	width:71mm;height:4mm;
	float:left; clear: none;
      border-style: solid; border-color: black;	
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }    
    .sty1120FItemUnderline{ /* Underlined Item */
      width:58mm;height:4mm;
      font-size:7pt;
      text-align:left;
      padding-top:.5mm;
      padding-bottom:0mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .sty1120FItemUnderlineSM{ /* Underlined Item small font */
      width:58mm;height:4mm;
      font-size:6pt;
      text-align:left;
      padding-top:.5mm;
      padding-bottom:0mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }    
    .styIRS1120FYesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:3.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;      
    }
    .styIRS1120FLFNoBox{ /* Left Box for storing No Values */
      width:6mm;height:3.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      float:left; clear: none;      
    }    
    .styIRS1120FYesNoBoxRB{ /* Box for storing Yes/No Values with a right border */
      width:5.9mm;height:3.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1120LNYesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1120LNYesNoBoxRB{ /* Box for storing Yes/No Values with a right border */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      clear: none;
    }
    .styIRS1120FShadingCell {   /* Shading with a left border */
	width:6mm;
	background-color:lightgrey;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float: left; clear: none;
    }
    .styIRS1120FShadingCellRB {   /* Shading with a left border and a right border*/
	width:5.9mm;
	background-color:lightgrey;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float: left; clear: none;
    }
   .styIRS1120Fseparater{/* lines to separate the text */
      width:187mm;
      padding-top:.2mm;
      padding-bottom:.2mm;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
   }
    .styIRS1120FLeftNumBox{ /* digit item number to the left of the page */
	width:4mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
    clear:none;
	padding-left:1mm;
      border-style: solid; border-color: black;	
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;	
    }
    .styIRS1120FNumBox{ /* digit item number to the left of the page on computation */
	width:4mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	clear:none;
	padding-left:1mm;
      border-style: solid; border-color: black;	
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;	
    }
    .styIRS1120FItemDesc{ /* Line item description on computation */
	width:81mm;
	padding-left:2mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	clear: none;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
	.styIRS1120FColumnBox{/*Column Box for storing data/amount on computation*/
	width:30mm;
      padding-top:.1mm;
      padding-bottom:.1mm;
      text-align:right;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      clear: none;
}
      .styIRS1120FRGColumnBox{/*Right Column Box for storing data/amount on computation */
	width:30mm;
      padding-top:.1mm;
      padding-bottom:.1mm;
      text-align:right;
      font-weight:normal;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      clear: none;
}
      .styIRS1120FAdditionInfoTitle{/Additional Information title */
      border-right:1 solid black;
      border-bottom:1 solid black;
      vertical-align:bottom;
      padding-left:.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      height:5mm;
      width:92mm; 
      font-size:8pt;
}
     .styIRS1120FAdditionInfoContent{/Additional Information content */
      border-right:1 solid black;
      border-bottom:1 solid black;
      padding-left:.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      height:4mm;
      width:93mm; 
      font-size:7pt;
}
     .styIRS1120FSectionTitle{ /* 8 point bold text that floats left */
	width:187mm; 
      border-style: solid; border-color: black;
      border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
 }
      .styIRS1120FDivTreatyLF{ /* header section for treaty county */
	height:10.2mm;
	text-align:center; 
	font-size:6pt;
	padding-top:1mm;
	padding-bottom:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
 }
      .styIRS1120FDivTreatyRG{ /* header section for treaty county */
	height:10.2mm;
	text-align:center; 
	font-size:6pt;
	padding-top:1mm;
	padding-bottom:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
 }
      .styIRS1120FDivTreatyDataTitle{ /* header section for treaty county */
	height:1.5mm;
	text-align:left; 
	font-size:6pt;
	padding-top:.5mm;
	padding-bottom:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
 }
      .styIRS1120FDivTreatyDataLF{ /* header section for treaty county */
	height:1.5mm;
	text-align:right; 
	font-size:6pt;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
 }
      .styIRS1120FDivTreatyDataRG{ /* header section for treaty county */
	height:1.5mm;
	text-align:right; 
	font-size:6pt;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
 }
    .sty1120FTableCellNum { /*Table Cell line number*/
      width:5mm;height:4mm;
      padding-left:2mm;
      text-align:left;
      font-weight:bold;
      font-size:7pt;
    }
    .sty1120FTableCellNumDD { /*Table Cell double digit line number*/
      width:5mm;height:4mm;
      padding-left:0.5mm;
      text-align:left;
      font-weight:bold;
      font-size:7pt;
    }
    .sty1120FTableCellNumDDTBB { /*Table Cell double digit line number with thick bottom border*/
      width:5mm;height:4mm;
      padding-left:0.5mm;
      text-align:left;
      font-weight:bold;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 2px; border-left-width: 0px; border-right-width: 0px;
    }
    .sty1120FTableCellDesc { /*Table Cell line description*/
      width:62mm;height:4mm;
      text-align:left;
      font-weight:normal;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    .sty1120FTableCellAmount { /*Table Cell for storing amounts*/
      width:30mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    .sty1120FTableCellAmountLastCol { /*Table Cell for storing amounts with no right border*/
      width:30mm;height:4mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .sty1120FTableCellAmountShaded { /*Table Cell Shaded*/
      width:30mm;height:4mm;
      background-color:lightgrey;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    .sty1120FTableCellAmountShadedLastCol { /*Table Cell Shaded with no right border*/
      width:30mm;height:4mm;
      font-weight:normal;
      background-color:lightgrey;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
      .sty1120FTableCellHeader { /*Table Cell Header*/
      width:30mm;height:4mm;
      text-align:center;
      font-weight:bold;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    .sty1120FTableCellHeaderLastCol { /*Table Cell Header with no right border*/
      width:30mm;height:4mm;
      text-align:center;
      font-weight:bold;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .sty1120FTableLeftAlignedItem { /* Left aligned Item in a table cell */
      text-align:left;
      font-size:7pt;
      padding-left:1mm;
    }
   .sty1120FDotLn { /* Dotted line - no float */
      letter-spacing:3.3mm;
      font-weight:bold;
      font-size:7pt; 	
      skiplink:display:none;
    }	
    
    .sty1120FRightFloat { /* Generic div for right aligned item */
      float:right;clear:none;
      text-align:right;
    }
 
    .sty1120FSchCLNAmountBoxHeader{ /* Schedule C - Header for box for storing line item amounts. */
      width:32mm;height:4mm;
      vertical-align:middle;
      font-weight:normal;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
 
    .sty1120FSchCLNRightAmountBoxHeader{ /* Schedule C - Header for box for storing line item amounts. */
      width:36mm;height:4mm;
      vertical-align:middle;
      font-weight:normal;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
     
    .sty1120FSchCLNLeftNumBox{ /* Schedule C - item number to the left of the page */
      width:4mm;height:4mm;
      font-weight:bold;
      font-size:7pt;
      text-align:left;
      vertical-align:top;
      padding-top:0.25mm;
      padding-left:1.5mm;
    }
    
    .sty1120FSchCLNLeftNumBoxDD{ /* Schedule C - item number to the left of the page */
      width:4mm;height:4mm;
      font-weight:bold;
      font-size:7pt;
      text-align:left;
      vertical-align:top;
      padding-top:0.25mm;
    }
    
    .sty1120FSchCLNDesc{ /* Schedule C - Line item description */
      width:103mm;height:4mm;
      font-size:7pt;
      padding-right:1mm;
      font-weight:normal;
      text-align:justify;
    }
    
    .sty1120FSchCLNAmountBox{ /* Schedule C - Box for storing line item amounts. */
      width:32mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      text-align:right;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchCLNAmountBoxShaded{ /* Schedule C - Shaded Amount Box. */
      width:32mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      text-align:right;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchCLNRightAmountBox{ /* Schedule C - Box for storing line item amounts. */
      width:36mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      text-align:right;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchCLNRightAmountBoxShaded{ /* Schedule C - Shaded Amount Box. */
      width:36mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      text-align:right;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .styIRS1120FLNPercentBox{ /* Box for percentages */
      width:12mm;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .styIRS1120FLNPercentBoxShaded{ /* Shaded Box for percentages */
      width:11mm;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
   .sty1120FDotLn { /* Dotted line - no float */
      letter-spacing:3.3mm;
      font-weight:bold;
      font-size:7pt; 	
      skiplink:display:none;
    }	
    
    .sty1120FRightFloat { /* Generic div for right aligned item */
      float:right;clear:none;
      text-align:right;
    }
 
    .sty1120FSchCLNAmountBoxHeader{ /* Schedule C - Header for box for storing line item amounts. */
      width:32mm;height:4mm;
      vertical-align:middle;
      font-weight:normal;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
 
    .sty1120FSchCLNRightAmountBoxHeader{ /* Schedule C - Header for box for storing line item amounts. */
      width:36mm;height:4mm;
      vertical-align:middle;
      font-weight:normal;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
     
    .sty1120FSchCLNLeftNumBox{ /* Schedule C - item number to the left of the page */
      width:4mm;height:4mm;
      font-weight:bold;
      font-size:7pt;
      text-align:left;
      vertical-align:top;
      padding-top:0.25mm;
      padding-left:1.5mm;
    }
    
    .sty1120FSchCLNLeftNumBoxDD{ /* Schedule C - item number to the left of the page */
      width:4mm;height:4mm;
      font-weight:bold;
      font-size:7pt;
      text-align:left;
      vertical-align:top;
      padding-top:0.25mm;
    }
    
    .sty1120FSchCLNDesc{ /* Schedule C - Line item description */
      width:103mm;height:4mm;
      font-size:7pt;
      padding-right:1mm;
      font-weight:normal;
      text-align:justify;
    }
    
    .sty1120FSchCLNAmountBox{ /* Schedule C - Box for storing line item amounts. */
      width:32mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      text-align:right;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchCLNAmountBoxShaded{ /* Schedule C - Shaded Amount Box. */
      width:32mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      text-align:right;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchCLNRightAmountBox{ /* Schedule C - Box for storing line item amounts. */
      width:36mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      text-align:right;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .sty1120FSchCLNRightAmountBoxShaded{ /* Schedule C - Shaded Amount Box. */
      width:36mm;height:4mm;
      font-weight:normal;
      font-size:7pt;
      padding-right:1mm;
      text-align:right;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .styIRS1120FLNPercentBox{ /* Box for percentages */
      width:12mm;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    
    .styIRS1120FLNPercentBoxShaded{ /* Shaded Box for percentages */
      width:11mm;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }

 
</xsl:template>

</xsl:stylesheet>