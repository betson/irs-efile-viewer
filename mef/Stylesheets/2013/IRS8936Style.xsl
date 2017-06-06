<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8936-->

  <xsl:template name="IRS8936Style">
    <!-- CSS Styles Go Here -->
    .styIRS8936TableContainer {   /* Scrollable Table Container */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  width: 187mm;
  float:none;clear:none;
  overflow:hidden; display:block;
  }
.styIRS8936LNRightNumBox{ /* Right number box */
	width:8mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	text-align:center;
	vertical-align:bottom;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:none; clear: none;
}
.styIRS8936LNRightNumBoxNBB{ /* Right number box with no bottom border*/
	width:8mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	text-align:center;
	vertical-align:bottom;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:none; clear: none;
}
.styIRS8936LNAmountBox{ /* Box for storing line item amounts. */
	width:48mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
}
  </xsl:template>

</xsl:stylesheet>
