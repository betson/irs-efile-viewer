<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8825 -->

  <xsl:template name="IRS8825Style">
    .styForm8825TableCellSmallRB{ /* Table cell with  no top Bottom  borders */
      width: 25mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .styForm8825TableContainer{   /* Scrollable Table Container */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0 px; border-left-width: 0px; border-right-width: 0px;
      width: 187mm; height:100%;
      float:none;clear:none;
      overflow-y: auto;
      padding-left:9mm;
    }
    .styForm8825TableCellNoBorder {   /* Table Cell without left and right borders */
      width: 32mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .styForm8825TableCellHeaderNoBorder {   /* Table Cell Header without left and right borders*/
      width: 12mm;
      color: black;
      text-align: center;
      border-style: solid;
      border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }  
  </xsl:template>

</xsl:stylesheet>