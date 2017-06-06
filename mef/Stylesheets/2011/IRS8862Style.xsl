<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- CSS Styles for form 8862 -->
	<xsl:template name="IRS8862Style">

    .styIRS8862Info {
      font-size:7.5pt;
      padding-top:0.5mm;
    }
    
    .styIRS8862Num {
      float:left;
      padding-top:1.5mm;
      padding-left:2mm;
      font-size:7.5pt;
      font-weight:bold;
    }
    
    .styIRS8862LB {
      float:left;
      padding-left:3mm;
      padding-top:1.5mm;
      font-size:7.5pt;
    }
	.styIRS8862LineItem {  /* Line Item */
		border-color:#00CBFF;
		width: 100%;
		height: 4mm;
		padding: 0px 0px 0px 0px;
		border-style: solid;
		border-width: 0px 0px 0px 0px;
		float: none; clear: none;
    }
    .styIRS8862LNLeftNumBox{ /* Double digit item number to the left of the page */
		width:6mm;
		height:100%;
		font-weight:bold;
		padding-top: 3px; 
		padding-right:6px;
		padding-left: 0mm;
		float:left; clear:none;
		text-align:right;
		font-size:8pt;
	}
	.styIRS8862LNDesc{ /* Line item description */
		width:138mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:3mm;
		border-style: solid;
		border-width:0px 0px 0px 0px;
		border-color:#FF0000;
		font-size:8.5pt;
		float:left; clear: none;
	}
	
	.styIRS8862TableCell {   /* Table Cell for Letter */
		width: 5mm;
		color: black;
		border-color:black;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS8862TableCellHeader {   /* Table Cell Header */
		width: 32mm;
		color: black;
		border-color:black;
		text-align: center;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS8862CleanDiv {
		padding:0px 0px 0px 0px;
		border-width:0px 0px 0px 0px;
		border-style:solid;
		border-color:black;
		float:left;
		font-size:7pt;
		font-family:arial;
	}
</xsl:template>
</xsl:stylesheet>
