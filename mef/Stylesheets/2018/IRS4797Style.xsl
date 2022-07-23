<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 4797 -->

<xsl:template name="IRS4797Style">
    .styIRS4797LNAmountBoxSmall { /* Small Amount Box with small text size. Particular width (25mm) is unique to Form 4797*/ 
      width:25mm;
      height:4.5mm;
      font-size:6pt;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS4797TableContainer {   /* Scrollable Table Container for Line 33, 34 and 35 */
      width:100%;
      height:4mm;
      float:none;
      clear:none;
      overflow-y: auto;
    }
</xsl:template>

</xsl:stylesheet>