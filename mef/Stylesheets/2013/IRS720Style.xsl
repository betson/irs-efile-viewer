<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 720 -->

  	<xsl:template name="IRS720Style">
  		.styIRS720LargeBoldText { /* 9 point bold text that floats left */
  			float:left;
  			font-size:9pt;
  			font-weight:bold;
  			padding-left:3mm;
  		}
  		.styIRS720LineHeaderLN { /* Line numberfor the line header */
  			width:8mm;
  			text-align:center;
  			font-size:8pt;
  		}
  		.styIRS720LineHeaderTitle { /* Title for the line header */
  			width:108mm;
  			text-align:left;
  			font-size:8pt;
  		}
  		.styIRS720LineHeaderPCRGN { /* Period of claim/Reg Number Style for the line header */
  			width:35mm;
  			text-align:right;
  			padding-right:1mm;
  			padding-left:0.5mm;
  			font-weight:normal;
  		}
  		.styIRS720LineHeaderData { /* Data cell for the line header */
  			width:36mm;
  			text-align:left;
  			font-weight:normal
  		}
		.styIRS7204BoldTableHeaderCell { /* A bold table header cell with top border */
			text-align:center;
			font-weight:bold;
    			border-color: black;
			border-style: solid;
			border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
    		.styIRS720NameTableCell {   /* Table Cell that aligns to the left and top for text */
    			text-align: left;
    			vertical-align:top;
			font-weight:normal;
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}     
		.styIRS720TableCellText {   /* Table Cell that aligns to the center for text */
    			text-align: center;
    			vertical-align:bottom;
    			padding-bottom:1px;
			font-weight:normal;
			font-size: 7pt;
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
		.styIRS720TableCellTextType5 {   /* Table Cell that floats left for type of use 5 text */
    			clear:none;
    			vertical-align:bottom;
    			padding-bottom:1px;
			font-weight:normal;
			font-size: 7pt;
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
		.styIRS720TableCellTextRate {   /* Table Cell that aligns rate by decimal point */
    			text-align: left;
    			vertical-align:bottom;
    			padding-bottom:1px;
    			padding-left:1mm
			font-weight:normal;
			font-size: 7pt;
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
		.styIRS720TableCellAmount {   /* Table Cell that aligns to the right for amounts */
			padding-right:4px;
    			text-align: right;
    			vertical-align:bottom;
    			padding-bottom:1px;
			font-weight:normal;
			font-size: 6pt;
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
		
		.styIRS720TableCellLineNumber {   /* Table Cell that aligns to the right for line number */
			padding-right:4px;
    			text-align: right;
    			vertical-align:bottom;
    			padding-bottom:1px;
			font-weight:bold;
			font-size: 7pt;
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
		.styIRS720RightBorder { /* right border only */
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
			}
		.styIRS720LineNumber { /* Line number */
			font-weight:bold;
			text-align:center;
			font-size:8pt;
			padding-top:0.5mm;
			}
		.styIRS270DebugBorders { /* debug borders */
			border-color: black;
			border-style: solid;
			border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
			}
		                
 	</xsl:template>

</xsl:stylesheet>