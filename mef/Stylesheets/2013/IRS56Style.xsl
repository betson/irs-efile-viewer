<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- CSS Styles for form 56 -->
	<xsl:template name="IRS56Style">
	.styIRS56SectionDesc{ 
		width:187mm;height:4mm;
		text-align: center;
		padding-top:.5mm;
		padding-bottom:.5mm;
		border-bottom:1 solid black;
		font-size:10pt;
		float:left; clear: none;
	}
    .styIRS56Info {
      font-size:7.5pt;
      padding-top:0.5mm;
    }
    .styIRS56PartHeader {
       width:187mm;
       height:8mm;
       padding-top:1mm;
	   padding-bottom:1mm;
       float:left; 
       border-top:1 solid black;
       border-bottom:1 solid black;
    } 
     .styIRS56PartNum {
      width:7mm;      
      float:left;              
      font-weight:bold;
      text-align:right;
      padding-right:3mm;
    }  
         .styIRS56Part1 {
      width:11mm;      
      float:left;              
      font-weight:bold;
      text-align:right;
      padding-right:1.5mm;
    } 
    .styIRS56Num {
      float:left;
      padding-top:1.5mm;
      padding-left:2mm;
      font-size:7.5pt;
      font-weight:bold;
    }

        .styIRS56Item {    
      width:187mm;    
      padding-left:1mm;        
    }

        .styIRS56DotLn { 
      letter-spacing:3.3mm;
      font-weight:bold;
      float:left;      
    } 
    .styIRS56LB {
      float:left;
      padding-left:3mm;
      padding-top:1.5mm;
      font-size:7.5pt;
    }
	.styIRS56LineItem {  /* Line Item */
		border-color:#00CBFF;
		width: 187mm;
		height: 4mm;
		padding: 0px 0px 0px 0px;
		border-style: solid;
		border-width: 0px 0px 0px 0px;
		float: none; clear: none;
    }
    .styIRS56LNLeftNumBox{ /* Double digit item number to the left of the page */
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
	.styIRS56LNDesc{ /* Line item description */
		width:138mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:.5mm;
		border-style: solid;
		border-width:0px 0px 0px 0px;
		border-color:#FF0000;
		float:left; clear: none;
	}

	.styIRS56LineDashed {   
		color: black;
		border-color:black;
		border-style: dashed;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
	}
	.styIRS56TableCellHeader {   /* Table Cell Header */
		width: 32mm;
		color: black;
		border-color:black;
		text-align: center;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS56CleanDiv {
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
