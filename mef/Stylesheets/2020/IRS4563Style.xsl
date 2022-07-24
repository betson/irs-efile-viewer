<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- CSS Styles for form 4563 -->
	<xsl:template name="IRS4563Style">

    .styIRS4563Info {
      font-size:7.5pt;
      padding-top:0.5mm;
    }
    
    .styIRS4563Num {
      float:left;
      padding-top:1.5mm;
      padding-left:2mm;
      font-size:7.5pt;
      font-weight:bold;
    }
    
    .styIRS4563LB {
      float:left;
      padding-left:3mm;
      padding-top:1.5mm;
      font-size:7.5pt;
    }
	.styIRS4563LineItem {  /* Line Item */
		width: 187mm;
		height:6mm; 
		padding: 0px 0px 0px 0px;
		float: none; clear: none;
    }
    .styIRS4563LNLeftNumBox{ /* Double digit item number to the left of the page */
		width:8mm;
		height:4mm;
		font-weight:bold;
		padding-top: 0.5mm; 
		padding-left: 2mm;
		float:left; clear:none;
	}
	.styIRS4563LNLeftNumBoxSD{ /* Single digit item number to the left of the page */
		width:8mm;
		height:4mm;
		font-weight:bold;
		padding-top: 0.5mm; 
		padding-left: 3.6mm;
		float:left; clear:none;
	}
	.styIRS4563LNLeftLtrBox{ /* Letter to right of number column */
		width:8mm;
		height:4mm;
		font-weight:bold;
		padding-top: 0.5mm;
		padding-left: 5.1mm;
		float:left; clear:none;
	}
	.styIRS4563LNDesc{ /* Line item description */
		width:138mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:3mm;
		font-size:7pt;
		float:left; clear: none;
	}
	.styIRS4563TableCell {   /* Table Cell for Letter */
		width: 5mm;
		color: black;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
</xsl:template>
</xsl:stylesheet>
