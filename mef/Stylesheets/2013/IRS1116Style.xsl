<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- CSS Styles for form 1116 -->
	<xsl:template name="IRS1116Style">

    .styIRS1116Info {
      font-size:7.5pt;
      padding-top:0.5mm;
    }
    
    .styIRS1116Num {
      float:left;
      padding-top:1.5mm;
      padding-left:2mm;
      font-size:7.5pt;
      font-weight:bold;
    }
    
    .styIRS1116LB {
      float:left;
      padding-left:3mm;
      padding-top:1.5mm;
      font-size:7.5pt;
    }
	.styIRS1116LineItem {  /* Line Item */
		border-color:#00CBFF;
		width: 187mm;
		height:auto;min-height:3mm;
		padding: 0px 0px 0px 0px;
		border-style: solid;
		border-width: 0px 0px 0px 0px;
		float: none; clear: none;
    }
    .styIRS1116LNLeftNumBox{ /* Double digit item number to the left of the page */
		width:8mm;
		height:4mm;
		font-weight:bold;
		padding-top: 0.5mm; 
		padding-left: 3mm;
		padding-right:4px;
		float:left; clear:none;
		text-align:right;
	}
	.styIRS1116LNDesc{ /* Line item description */
		width:138mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:3mm;
		border-style: solid;
		border-width:0px 0px 0px 0px;
		border-color:#FF0000;
		font-size:7pt;
		float:left; clear: none;
	}
	.styIRS1116TableCell {   /* Table Cell for Letter */
		width: 5mm;
		color: black;
		font-weight:normal;
		border-color:black;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS1116TableCellHeader {   /* Table Cell Header */
		width: 32mm;
		color: black;
		border-color:black;
		text-align: center;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.sty1116GenericDiv { /* definition of a generic placeholder div */
	 clear:none;float:none;
}

.sty1116LNLeftNumBox{ /* Double digit item number to the left of the page */
			width:8mm;height:4mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			font-weight:bold;
			clear:none;
			padding-left:1mm;
		}
		
		.sty1116LNAmountBox{ /* Box for storing line item amounts. */
			width:32mm;height:4mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
			clear: none;
		}
		.sty1116LNAmountBoxNBB{ /* Amount Box with no bottom border */
			width:32mm;height:4mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
			clear: none;
		}
		.sty1116LNAmountBoxNB{ /* Amount Box with no border */
			width:32mm;height:4mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			clear: none;
		}
		.sty1116LNAmountBoxSmall{ /* Small Amount Box with small text size*/ 
			width:26mm;height:4mm;
			font-size:6pt;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
			clear: none;
		}
		.sty1116LNAmountBoxFormLink{ /* Small Amount Box to be used with Form to Form links */ 
			width:27mm;height:4mm;
			font-size:6pt;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
			clear: none;
		}
		.sty1116LNAmountBoxSmallNBB{ /* Small Amount Box with small text size and no bottom border*/ 
			width:26mm;height:4mm;
			font-size:6pt;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
			clear: none;
		}
		.sty1116LNRightNumBox{ /* Right number box */
			width:8mm;height:4mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			font-weight:bold;
			text-align:center;
			vertical-align:bottom;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
			clear: none;
		}
		.sty1116LNRightNumBoxNBB{ /* Right number box with no bottom border*/
			width:8mm;height:4mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			font-weight:bold;
			text-align:center;
			vertical-align:bottom;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
			clear: none;
		}
		.sty1116LNAmountBoxSmallNBB{ /* Small Amount Box with small text size and no bottom border*/ 
			width:26mm;height:4mm;
			font-size:6pt;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
			clear: none;
		}
</xsl:template>
</xsl:stylesheet>
