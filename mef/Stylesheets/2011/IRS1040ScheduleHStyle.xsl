<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- CSS Styles for form 1040ScheduleH -->
	<xsl:template name="IRS1040ScheduleHStyle">

    .styIRS1040ScheduleHInfo {
      font-size:7.5pt;
      padding-top:0.5mm;
    }
    
    .styIRS1040ScheduleHNum {
      float:left;
      padding-top:1.5mm;
      padding-left:2mm;
      font-size:7.5pt;
      font-weight:bold;
    }
    
    .styIRS1040ScheduleHLB {
      float:left;
      padding-left:3mm;
      padding-top:1.5mm;
      font-size:7.5pt;
    }
	.styIRS1040ScheduleHLineItem {  /* Line Item */
		border-color:#00CBFF;
		width: 187mm;
		height: 3mm;
		padding: 0px 0px 0px 0px;
		border-style: solid;
		border-width: 0px 0px 0px 0px;
		float: none; clear: none;
    }
    .styIRS1040ScheduleHLNLeftNumBox{ /* Double digit item number to the left of the page */
		width:8mm;
		height:4mm;
		font-weight:bold;
		padding-top: 0.5mm; 
		padding-left: 3mm;
		float:left; clear:none;
		text-align:right;
	}
	.styIRS1040ScheduleHLNDesc{ /* Line item description */
		width:138mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:3mm;
		border-style: solid;
		border-top-width:0px;border-bottom-width:0px;border-right-width:0px;border-left-width:0px;
		border-color:#FF0000;
		font-size:7pt;
		float:left; clear: none;
	}
	.styIRS1040ScheduleHTableCell {   /* Table Cell for Letter */
		
		color: black;
		border-color:black;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS1040ScheduleHTableCellHeader {   /* Table Cell Header */
		width: 32mm;
		color: black;
		border-color:black;
		text-align: center;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
</xsl:template>
</xsl:stylesheet>
