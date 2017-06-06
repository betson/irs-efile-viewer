<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 6197 -->

  	<xsl:template name="IRS6197Style">
    		.styIRS6197TRB { /* Cell with thick right border */
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 2px;
    		}
    
    		.styIRS6197NameTableCell {   /* Table Cell that aligns to the left and top for text */
    			text-align: left;
    			vertical-align:top;
			font-weight:normal;
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}     
		.styIRS6197TableCellHeaderText {   /* Table Cell that aligns to the center for text */
    			text-align: center;
			font-weight:normal;
			font-size: 7pt;
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
		.styIRS6197TableCellText {   /* Table Cell that aligns to the center for text */
    			text-align: center;
    			vertical-align:bottom;
    			padding-bottom:1px;
			font-weight:normal;
			font-size: 7pt;
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
		.styIRS6197TableCellVerticalText {   /* Table Cell that make text vertical */
			border-color: black;
			border-style: solid;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		}
		.styIRS6197TableCellAmount {   /* Table Cell that aligns to the right for amounts */
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
		
		.styIRS6197TableCellLineNumber {   /* Table Cell that aligns to the right for amounts */
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
		                
 	</xsl:template>

</xsl:stylesheet>