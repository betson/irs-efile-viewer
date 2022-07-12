<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 990PF -->

<xsl:template name="IRS990PFStyle">
	.styIRS990PFImg {
		width: 6mm;
		border-style: solid;
		border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;  border-right-width: 1px;
		float: left; clear: none;
	}
	.styIRS990PFLineItem {  /* Line Item */
		width: 187mm;
		font-size: 7pt;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
		float: none; clear: both;
	}
	.styIRS990PFLNLeftNumBox {
		width: 3mm;
		text-align: right;
		height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		float:left; clear:none;
		padding-left:1mm;
	}
	.styIRS990PFLNLongDesc {   /* Line Description */
		width: 164mm;
		font-size: 6pt;
		height:4.5mm;
		margin-left:3mm; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
		float: left; clear: none;
	}
	.styIRS990PFTableCellPad {   /* Table Cell Padding */
		width: 4px;
	}
	.styIRS990PFTableCellA {   /* Table Cell (a or 1) */
		width: 58mm;
		font-size: 7pt;
		font-weight: normal;
		color: black;
		text-align: left;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS990PFTableCellB {   /* Table Cell (b or 2) */
		width: 35mm;
		font-size: 7pt;
		font-weight: normal;
		color: black;
		text-align: left;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS990PFTableCellC {   /* Table Cell (c or 3) */
		width: 30mm;
		font-size: 7pt;
		font-weight: normal;
		color: black;
		text-align: right;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS990PFTableCellD {   /* Table Cell (d) */
		width: 34mm;
		font-size: 7pt;
		font-weight: normal;
		color: black;
		text-align: right;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS990PFTableCellE {   /* Table Cell (e) */
		width: 30mm;
		font-size: 7pt;
		font-weight: normal;
		color: black;
		text-align: right;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS990PFTableCellYesNo {
		width: 11mm;
		font-family:arial;
		font-size: 8pt;
		font-weight: bold;
		color: black;
		text-align: center;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styIRS990PFNBSP{
		width: 16px;
		font-weight: bold;
	}
	.styIRS990PFFormHeader {   /* Form Header */
		width: 187mm;
		font-size: 6pt;
		page-break-before: always;
	}
	.styIRS990PFFormFooter {   /* Form Footer */
		width:187mm;
		font-size: 6pt;
		text-align: left;
		border-style: solid;
		border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	}
	.styIRS990PFYesNoBox {
		width: 7mm;
		text-align: center;
		height:4.5mm;
		padding-top:0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
		float:left; clear: none;
		font-size: 8pt;
		font-weight: bold;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	}
	.styIRS990PFCkBox{
		height: 3mm;
		width: 3mm;
	}
	.styIRS990PFCkBoxText {
		width: 48mm;
		font-size: 7pt;
		text-align: left;
		margin-left: 2mm; margin-right: 0px;
		float: left; clear: none;
	}
	.styIRS990PFUnderlinedBox{
		width: 38mm;
		font-size: 7pt;
		text-align: left;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px;
	}
	.styIRS990PFSignatureText{ /* Text containing instructions for signatures */
		text-align:left;
		float:left; clear: none;
	}
	.styIRS990PFSignatureBox{ /* Box for signature fields */
		padding-top:.5mm;
		padding-bottom:.5mm;
		text-align:left;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		float:left; clear: none;
	}
	.styIRS990PFRetDiscussBox {   /* IRS Return Discussion Permission Box */
		text-align:left;
		border-style: solid; border-color: black;
		border-top-width: 3px; border-bottom-width: 3px; border-left-width: 3px; border-right-width: 3px;
		float: left; clear: none;
	}
	.styIRS990PFLeftBox{ /* Box on left holding instructions */
		text-align:left;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
		float:left;clear:none;
	}
	.styIRS990PFLNDesc{ /* Box on left holding instructions */
		width: 71mm;
		height: 4.5mm;
		text-align:left;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
		float:none;clear:none;padding-left:2mm;
	}
	.styIRS990PFShadingCell {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
			width:25mm;
			height: 4.5mm;
			background-color:lightgrey;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
			<!--float: left; clear: none;-->
		}
	.styIRS990PFUnderlinedText{
		width: 25mm;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
		float: none; clear: none;
	}
	.styIRS990PFLNAmountBox {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
			width:25mm;height:4mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
			float: none; clear: none;
			font-size:6pt;
		}
		.styIRS990PFFormLinkBox {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
			width:4.5mm;height:5mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
			float:left; clear: none;
		}
	
</xsl:template>

</xsl:stylesheet>