<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for Form 8958 -->
<xsl:template name="IRS8960Style">
	.styIRS8960Dots { /* For dot leaders */
		float:right; clear:none;
		text-align:right;
		padding-right:3mm;
		letter-spacing:16px;
		font-weight:bold;
		skiplink:display:none;
	}
	
	.styLNLeftLtrBox8960{ /* Item letter to the left of the page */
		width:8mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:4mm;
		font-weight:bold;
		float:left; clear: none;
	}
	
	.styLNLeftLtrBoxDD8960{ /* Item letter to the left of the page */
		width:8mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		padding-left:4.4mm;
		font-weight:bold;
		float:left; clear: none;
	}
	
</xsl:template>
</xsl:stylesheet>