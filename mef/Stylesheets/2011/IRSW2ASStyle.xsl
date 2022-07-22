<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- CSS Styles for form W2AS -->
	<xsl:template name="IRSW2ASStyle">

    .styIRSW2ASInfo {
      font-size:7.5pt;
      padding-top:0.5mm;
    }
    
    .styIRSW2ASNum {
      float:left;
      padding-top:1.5mm;
      padding-left:2mm;
      font-size:7.5pt;
      font-weight:bold;
    }
    
    .styIRSW2ASLB {
      float:left;
      padding-left:3mm;
      padding-top:1.5mm;
      font-size:7.5pt;
    }
	.styIRSW2ASLineItem {  /* Line Item */
		width: 187mm;
		height: 3mm;
		padding: 0px 0px 0px 0px;
		border-style: solid;
		border-width: 0px 0px 0px 0px;
		float: none; clear: none;
    }
    .styIRSW2ASLineItemBB {  /* Line Item */
		border-color:black;
		width: 100%;
		height: 10mm;
		padding: 0px 0px 0px 0px;
		border-style: solid;
		border-width: 0px 0px 1px 0px;
		float: none; clear: none;
    }
    .styIRSW2ASLNLeftNumBox{ /* Double digit item number to the left of the page */
		width:7mm;
		height:100%;
		font-weight:bold;
		padding-top: 0px; 
		float:left; clear:none;
		text-align:right;
		padding-left:0px; 
		padding-right:3px;
		border-style:solid;
		border-width:0px 0px 0px 0px;
		border-color:black;
		font-size:8pt;
	}
	.styIRSW2ASLNDesc{ /* Line item description */
		width:138mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:2px;
		border-style: solid;
		border-width:0px 0px 0px 0px;
		font-size:7pt;
		font-family:arial;
		float:left; clear: none;
	}
	
	.styIRSW2ASTableCell {   /* Table Cell for Letter */
		width: 5mm;
		color: black;
		border-color:black;
		border-style: solid;
		border-width:0px 0px 1px 0px;
		padding:0px 0px 0px 0px;
		font-size:7pt;
		font-family:arial;
	}
	.styIRSW2ASTableCellHeader {   /* Table Cell Header */
		width: 32mm;
		color: black;
		border-color:black;
		text-align: center;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRSW2ASCleanDiv {
		padding:0px 0px 0px 0px;
		border-width:0px 0px 0px 1px;
		border-style:solid;
		border-color:black;
		float:left;
		font-size:7pt;
		font-family:arial;
	}
</xsl:template>
</xsl:stylesheet>
