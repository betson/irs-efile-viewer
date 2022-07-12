<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for Form 8867 -->
<xsl:template name="IRS8867Style">
	.styIRS8867LNDesc {
		width:146mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
	}
	
	.styIRS8867LNAmountBox{ /* Box for storing line item amounts. */
		width:32mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		text-align:center;
		font-weight:bold;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	
	.styIRS8867BranchDesc { /* For lines of the form " If you said yes to line..." */
		width:154.2mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:14mm;
		padding-right:3mm;
		border-right:1px solid black;
		float:left; clear:none;
	}
	
	.styIRS8867ChildBranch { /* BranchDesc for part II. */
		width:114mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:14mm;
		padding-right:3mm;
		float:left; clear:none;
	}
	
	.styIRS8867ChildBox { /* For the three-column part II. Amount box, but narrow. */
		width:24mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:2mm;
		text-align:left;
		font-weight:bold;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	}
	
	.styIRS8867ChildDesc { /* For the descriptions in part II. */
		width:106mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		float:left; clear: none;
	}
	
	.styIRS8867Dots { /* For dot leaders */
		float:right; clear:none;
		text-align:right;
		padding-right:3mm;
		letter-spacing:16px;
		font-weight:bold;
		skiplink:display:none;
	}
</xsl:template>
</xsl:stylesheet>