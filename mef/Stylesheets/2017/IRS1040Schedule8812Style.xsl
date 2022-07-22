<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8812-->

  <xsl:template name="IRS1040Schedule8812Style">
    <!-- CSS Styles Go Here -->
    .styIRS8812TableCellSmall {   /* Small Table Cell with 6 pt text */
  width: 25mm;
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}
 .styIRS8812TableContainer {   /* Scrollable Table Container */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      width: 187mm; height:132mm;
      float:none;clear:both;
      overflow:hidden;
    }
 </xsl:template>

</xsl:stylesheet>