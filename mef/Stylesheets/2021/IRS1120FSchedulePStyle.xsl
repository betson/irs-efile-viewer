<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for form IRS 1120-F Schedule P -->
  <xsl:template name="IRS1120FSchedulePStyle">
    .sty1120FSchPFNBox {   /* 1120F Schedule P Form Number Box */
      font-family: "Arial";
      font-size: 8pt;
      text-align:left;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
   
    .sty1120FSchPFNBox {   /* 1120F Schedule P Form Number Box */
      font-family: "Arial";
      font-size: 8pt;
      text-align:left;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
      
    .sty1120FSchPAgency {   /* 1120F Schedule P Agency */
      font-family: "Arial";
      font-size: 7pt;
      font-weight:normal;
    }
      
    .sty1120FSchPFTBox {   /* 1120F Schedule P Form Title Box*/
      font-size:7pt;
      text-align: center;
      float: left; clear: none;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;      
    }
      
    .sty1120FSchPMainTitle {   /* Form Main Title */
      font-size: 11pt;
      font-family: "Arial";
      font-weight: bold;
    }
      
    .sty1120FSchPOMB {   /* 1120F Schedule P OMB No. */
      height:4mm;
      font-size:7pt;
      font-weight:normal;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 2px; border-right-width: 0px;
    }
      
    .sty1120FSchPTY {   /* 1120F Schedule P Tax Year */
      font-family: "Arial Narrow";
      font-size: 23pt;
      font-weight: bold;
      height:8mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 2px; border-right-width: 0px;
    }
   
   .sty1120FSchPSectionTitle{ /* 8 point bold text that floats left */
	width:187mm; 
	font-size:8pt;
	font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
 }
   
    .sty1120FSchPTableCellNum { /*Table Cell line number*/
      width:5mm;height:4mm;
      padding-left:2.5mm;
      text-align:left;
      font-weight:bold;
      font-size:7pt;
    }
    
    .sty1120FSchPTableCellText { /*Table Cell line number*/
      width:55mm;height:4mm;
      text-align:center;
      font-weight:bold;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchPTableCellData{/*Table Cell data #*/
	text-align:left; 
	font-weight:bold;
	font-size:7pt;
	padding-top:.5mm;
	padding-bottom:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
	}
    
    .sty1120FSchPTableCellDataLF{/*Table Cell data left*/
	text-align:left; 
	font-size:7pt;
	padding-top:.5mm;
	padding-bottom:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
	}
	
    .sty1120FSchPTableCellDataRG{/*Table Cell data right*/
	text-align:left; 
	font-size:7pt;
	padding-top:.5mm;
	padding-bottom:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
	}
	
	/* NEW STYLES BELOW NEW STYLES BELOW */
	
    .sty1120FSchPTableK1CellMainHeaderSpacer { /*Table K1main header spacer*/
      width:67mm; 
      height:10mm;
    }
    
   .sty1120FSchPTableK1CellMainHeader { /*Table K1main header*/
      width:120mm;
      height:10mm;
      font-size:7pt;
      padding-top:1mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchPTableK1CellHeaderSpacer { /*Table K1 Cell header spacer*/
      width:67mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
	
    .sty1120FSchPTableK1CellHeader { /*Table K1 Cell header*/
      width:24mm;
      font-size:7pt;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchPTableK1CellLastColHeader { /*Table K1 Cell last column header*/
      width:24mm;
      font-size:7pt;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
		
    .sty1120FSchPTableK1CellNumSD { /*Table K1 single digit line number*/
      width:6mm;
      font-size:7pt;
      padding-left:1mm;
      padding-bottom:2mm;
      text-align:left;
      text-valign:top;
      font-weight:bold;
      border-style: solid; border-color: black;      
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchPTableK1CellNum { /*Table K1 double digit line number*/
      width:6mm;
      font-size:7pt;
      text-align:left;
      text-valign:top;
      font-weight:bold;
    }
		
    .sty1120FSchPTableK1Desc { /*Table K1 Cell line description*/
      width:61mm;
      text-align:justify;
      padding-right:1mm;
      padding-top:1mm;
      font-size:7pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
		
    .sty1120FSchPTableK1Cell { /*Table K1 Cell*/
      width:24mm;
      text-align:right;
      padding-right:1mm;
      padding-top:3mm;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    
    .sty1120FSchPTableK1CellLastCol { /*Table K1 Cell last column*/
      width:24mm;
      text-align:right;
      padding-right:1mm;
      padding-top:3mm;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchPTableCellAmountShaded { /*Table Cell Shaded*/
      width:24mm;
      background-color:lightgrey;
      font-weight:normal;
      font-size:6pt;
      padding-right:1mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    
    .sty1120FSchPRightFloat { /* Generic div for right aligned item */
      float:right;clear:none;
      text-align:right;
    }
    /* Change the dot space from 3.3mm to 1.0mm   */
    .sty1120FSchPDotLn { /* Dotted line - no float */
      letter-spacing:1.0mm;
      font-weight:bold;
      font-size:7pt; 	
      skiplink:display:none;
    }	

    .styDepTblRow3 {   /* Dependency Table Row 1 */
      background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/>;   /* set in User Preferences */
      color:black;
      text-align:right;
      width:24mm;
      text-align:right;
      padding-right:1mm;
      padding-top:3mm;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;      
    }
    .styDepTblRow4 {   /* Dependency Table Row 2 */
      background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
      color:black;
      text-align:right;
      width:24mm;
      text-align:right;
      padding-right:1mm;
      padding-top:3mm;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;      
    }    
    .styDepTblRow3LC {   /* Dependency Table Row 1 */
      background-color: <xsl:value-of select="$UserPref/View/TableRow1BgColor"/>;   /* set in User Preferences */
      color:black;
      text-align:right;
      width:24mm;
      text-align:right;
      padding-right:1mm;
      padding-top:7mm;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;      
    }    
    .styDepTblRow4LC {   /* Dependency Table Row 2 */
      background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
      color:black;
      text-align:right;
      width:24mm;
      text-align:right;
      padding-right:1mm;
      padding-top:7mm;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;      
    }       
    .styTableCellTextSeparatedData{/*Table Cell data #*/
	text-align:left; 
	color: black;	
	font-weight:normal;
	font-size:7pt;
	padding-top:.5mm;
	padding-bottom:.5mm;
	border-style: solid;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
	}
  </xsl:template>
</xsl:stylesheet>