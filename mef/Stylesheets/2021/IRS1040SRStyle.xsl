<?xml version="1.0" encoding="UTF-8" ?>
<!-- Last Modified by Eugenia McDonald on 03/18/2021 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="IRS1040SRStyle">
  <!-- CSS Styles Go Here -->
  /* BEGIN PAGE SPECIFIC STYLES */  

      .styDotBox {
         float: left;
         clear: none;
      	color: black;
      	border-color: black; border-style: dotted;
      	border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      }

      .styDblBox {   
      	border-style: solid;
      	border-color: black;
      	border-top-width: 2px;
      	border-bottom-width: 2px;
      	border-left-width: 2px;
      	border-right-width: 2px;
      	float: left;
      	clear: none;
      }
      
    .sty1040SRLN {
		width:167mm;height:auto;min-height:5mm;float:none;
    }
    
    .sty1040SRDotLn {
		letter-spacing:3.1mm;
		font-weight:bold;
		float:right;
		padding-right:2px;
		font-family:verdana;font-size:9pt;
	}
    
    .sty1040SRDesc {
		width:123mm;height:6mm;
		padding-top:1.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
    }
    
    .sty1040SRLeftNumBox { /* Double digit item number to the left of the page */
		width:8mm;height:6mm;
		padding-top:1.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		float:left; clear:none;
		padding-left:1mm;
	}
	
	.sty1040SRLeftNumBoxSD { /* Single digit item number to the left of the page */
		width:8mm;height:6mm;
		padding-top:1.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		float:left; clear:none;
		padding-left:2.5mm;
	}
    
    .sty1040SRRightNumBox{ /* Right number box */
		width:7mm;height:6mm;
		padding-top:1.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.sty1040SRRightNumBoxNBB{ /* Right number box with no bottom border*/
		width:7mm;height:6mm;
		padding-top:1.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
    .sty1040SRAmountBox{ /* Box for storing line item amounts. */
		width:29mm;height:6mm;
		padding-top:2mm;
		padding-bottom:.5mm;
		padding-right:1px;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
		font-family:Verdana; font-size:7pt;
	}
	.sty1040SRAmountBoxNBB{ /* Amount Box with no bottom border */
		width:29mm;height:6mm;
		padding-top:2mm;
		padding-bottom:.5mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
		font-family:Verdana; font-size:7pt;
	}
      
     .sty1040SRDepdContainer {   
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
			width: 187mm; height:auto;
			float:none;clear:both;
			overflow-y: auto;
		} 
		
	 .sty1040SRDepdContainer2 {   
			width: 167mm; 
			float:left;
			overflow-y: auto;
		}  
		
	.styIRS1040SRHeaderCell { /* Filer Info cell */
		height:7.5mm;
		font-size:8pt;
		padding-left:4px;
		padding-right:2px;
		border-style:solid;
		border-color:black;
		border-width:0px 1px 1px 0px;
		float:left; clear:none;
	}
  /* END PAGE SPECIFIC STYLES */
</xsl:template>
</xsl:stylesheet>



