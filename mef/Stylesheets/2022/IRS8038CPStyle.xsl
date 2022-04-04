<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS8038CPStyle">

  .sty8038CPDotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty8038CPNumBox{ /* Double digit item number */
		width:8mm;
		font-weight:bold;
		padding-left:1mm;
	}
	.sty8038CPNumBoxSD{ /* Single digit item number */
		width:8mm;
		font-weight:bold;
		padding-left:2.5mm;
	}
  </xsl:template>

</xsl:stylesheet>