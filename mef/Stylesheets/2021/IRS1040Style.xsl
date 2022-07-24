<?xml version="1.0" encoding="UTF-8" ?>
<!-- Last Modified by Eugenia McDonald on 03/18/2021 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="IRS1040Style">
  <!-- CSS Styles Go Here -->
  /* BEGIN PAGE SPECIFIC STYLES */  
      .verticaltext {
         writing-mode: tb-rl;
         filter: flipv fliph;
         float: left;
         clear: none;
      }
      
      .verticaltextflip {
         writing-mode: tb-rl;
         filter: flipv flipv;
         float: left;
         clear: none;
      }
      
    .sty1040DotLn {
		letter-spacing:3.1mm;
		font-weight:bold;
		float:right;
		padding-right:2px;
		font-family:verdana;font-size:7pt;
	}

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
      
    .sty1040LN {
		width:167mm;height:auto;min-height:4mm;float:none;
    }
    
    .sty1040Desc {
		width:123mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
    }
    
    .sty1040RightNumBox{ /* Right number box */
		width:7mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.sty1040RightNumBoxNBB{ /* Right number box with no bottom border*/
		width:7mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
    .sty1040AmountBox{ /* Box for storing line item amounts. */
		width:29mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-right:1px;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	.sty1040AmountBoxNBB{ /* Amount Box with no bottom border */
		width:29mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
      
     .sty1040DepdContainer {   
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
			width: 187mm; height:auto;
			float:none;clear:both;
			overflow-y: auto;
		}  
	
	.sty1040DepdContainer2 {   
			width: 167mm; 
			float:left;
			overflow-y: auto;
		} 	
			
	.styIRS1040HeaderCell { /* Filer Info cell */
		height:7.5mm;
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



