<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 5884B -->

<xsl:template name="IRS5884BStyle">
  .styForm5884BTBTable{ /* Table with top border-Ravi Venigalla 02/21/03 */
    font-size:7pt;
    font-family:verdana;
    font-style: normal;
    font-weight:normal;
    border-top:solid black .75pt;
    border-bottom:solid black .75pt;
    border-right:solid black .75pt;
    padding:0mm
  }
.styIRS5884BTableContainer {   /* Scrollable Table Container */
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	width: 187mm;
	float:none;clear:none;
	overflow:hidden; 
  }  
</xsl:template>

</xsl:stylesheet>