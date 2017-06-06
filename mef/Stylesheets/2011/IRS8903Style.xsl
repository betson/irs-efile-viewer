<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8903-->

  <xsl:template name="IRS8903Style">
    <!-- CSS Styles Go Here -->
    .styIRS8903LNLeftNumBoxSD{ /* Single digit item number to the left of the page */
			width:8mm;height:4mm;
			padding-top: 4mm;
			padding-bottom:.5mm;
			font-weight:bold;
			float:left; clear:none;
			padding-left:2.5mm;
        }
    .styIRS8903LNLeftNumBox{ /* Double digit item number to the left of the page */
			width:8mm;height:4mm;
			padding-top:4mm;
			padding-bottom:.5mm;
			font-weight:bold;
			float:left; clear:none;
			padding-left:1mm;
		}
    .styIRS8903LNDesc{ /* Line item description */
			height:4mm;
			padding-top:4mm;
			padding-bottom:.5mm;
			float:left; clear: none;
		}
	.styShadingCellBox {   /* Shading with a left border box */
			width:8mm;height:8mm;
			background-color:lightgrey;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
			float: left; clear: none;
		}
		

  </xsl:template>

</xsl:stylesheet>
