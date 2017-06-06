<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for Form 8958 -->
<xsl:template name="IRS8958Style">
	.styIRS8958LNAmountBox{ /* Box for storing line item amounts. */
		width:32mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		text-align:center;
		font-weight:bold;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	
	.sty8958TableContainer{
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
		width: 187mm; height:7mm;
		float:none;clear:both;
		overflow-y: auto;
	}
	
	.sty8958Table{
		border:none;
		font-size:7pt;
		border-collapse:collapse;
		width:100%;
		display:table-header-group;
		text-align: left;
	}
	
	.sty8958RCell{
		width:37mm;height:7.5mm;
		padding-top:2px;
		padding-bottom:2px;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		float:left; clear: none;
	}
	
	.sty8958LCell{
		width:75mm;height:7.5mm;
		padding-top:2px;
		padding-bottom:2px;
		text-align:left;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
		float:left; clear: none;
	}
</xsl:template>
</xsl:stylesheet>