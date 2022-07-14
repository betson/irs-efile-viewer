<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="IRS3468Style">
  
    .styIRS3468LNSLeftLtrBoxBB{ /* Item letter to the second left of the page with a bottom border*/
      width:8mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      padding-left:6.6mm;
      font-weight:bold;
      float:left; clear: none;
    }
    .styIRS3468LNAmountBoxTest{ /* Box for storing amounts */
      width:32mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      text-decoration:underline;
      border-style: dashed; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
  </xsl:template>

</xsl:stylesheet>
