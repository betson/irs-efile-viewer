<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 4797 -->

<xsl:template name="IRS4797Style">
    .styIRS4797LNAmountBoxSmall { /* Small Amount Box with small text size. Particular width (25mm) is unique to Form 4797*/ 
      width:26mm;
      height:4mm;
      padding-top:1mm;
      font-size:6pt;
      text-align:right;
	  padding-right:1px;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS4797LNTableCellHeader { /* Small Amount Box with small text size. Particular width (25mm) is unique to Form 4797*/ 
      width:26mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS4797LNDate { /* Small Amount Box with small text size. Particular width (25mm) is unique to Form 4797*/ 
      width:26mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }    
    .styIRS4797LNText { /* Small Amount Box with small text size. Particular width (25mm) is unique to Form 4797*/ 
      width:67mm;
      font-size:7pt;
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }  
	.styIRS4797LNLeftNumBox{ /* Double digit item number to the left of the page */
		width:8mm;
		font-size:7pt;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		float:left; clear:none;
		padding-left:1mm;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	}
	.styIRS4797LNRightNumBox{ /* Double digit item number to the left of the page */
		width:8mm;
		height:4mm;
		font-size:7pt;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		clear: none;
	}
	.styIRS4797DotLn { 
		letter-spacing:3.1mm;
		font-weight:bold; 	
		float:right;
		padding-right:1mm		
		skiplink:display:none;
	}
    .styIRS4797TableContainer {   /* Scrollable Table Container for Line 33, 34 and 35 */
      width:100%;
      height:4mm;
      float:none;
      clear:none;
      overflow-y: auto;
    }
    .styIRS4797LNAmountBoxSmall2 { /* Small Amount Box with small text size. Particular width (25mm) is unique to Form 4797*/ 
      width:25mm;
      height:4.5mm;
      font-size:6pt;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }



</xsl:template>

</xsl:stylesheet>