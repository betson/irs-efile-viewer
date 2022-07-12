<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- CSS Styles for form 8949 -->
	<xsl:template name="IRS8949Style">

    .styIRS8949Info {
      font-size:7.5pt;
      padding-top:0.5mm;
    }
    
    .styIRS8949Num {
      float:left;
      padding-top:1.5mm;
      padding-left:2mm;
      font-size:7.5pt;
      font-weight:bold;
    }
    
    .styIRS8949LB {
      float:left;
      padding-left:3mm;
      padding-top:1.5mm;
      font-size:7.5pt;
    }
	.styIRS8949LineItem {  /* Line Item */
		width: 187mm;
		height: 3mm;
		padding: 0px 0px 0px 0px;
		border-style: solid;
		border: 0px 0px 0px 0px;
		float: none; clear: none;
    }
    .styIRS8949LNLeftNumBox{ /* Double digit item number to the left of the page */
		width:8mm;
		height:4mm;
		font-weight:bold;
		padding-top: 0.5mm; 
		padding-left: 4mm;
		float:left; clear:none;
	}
	.styIRS8949LNDesc{ /* Line item description */
		width:138mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:3mm;
		border-style: solid;
		border-top-width:0px;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;
		border-color:#000000;
		font-size:7pt;
		float:left; clear: none;
	}
	.styIRS8949TableCell {   /* Table Cell for Letter */
		width: 5mm;
		color: black;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS8949TableCellPad { /* Padding for Cell */ 
		width: 0px;
	}
	.styIRS8949CleanDiv {
		padding:0px 0px 0px 0px;
		border-width:0px 0px 0px 0px;
		border-style:solid;
		border-color:black;
		float:left;
		font-size:7pt;
	}
</xsl:template>
</xsl:stylesheet>
