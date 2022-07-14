<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 1125E -->

<xsl:template name="IRS1125EStyle">

  .styIRS1125EImg {
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;  border-right-width: 1px;
    float: left; clear: none;
  }

  .styIRS1125ETableContainer {   /* Scrollable Table Container */
    width: 187mm; height: 21mm;
    float: none; clear:none;
    overflow-y: auto;
  }

  .styIRS1125ETableLastCol {   /* Last Table Column */
    width: 15px;
    color: white;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    display: none;
  }
</xsl:template>

</xsl:stylesheet>