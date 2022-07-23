<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8820 -->

<xsl:template name="IRS8820Style">
  .styIRS8820LongLNDesc{ /* Line item description */
    width:170mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS8820MedLNDesc{ /* Line item description */
    width:139mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS8820ShortLNDesc{ /* Line item description */
    width:107mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS8820ShortestLNDesc{ /* Line item description */
    width:99mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS8820TheadCell{ /*Header Cell */
    font-size:6.5pt;
    width:25mm;
    font-weight:normal;
    text-align:center;
    display:table-header-group;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  }

.styIRS8820Cell { /*Cell for amounts */
    font-size:7.5pt;
    padding-right:.5mm;
    font-weight:normal;
    text-align:center;
    vertical-align:bottom;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px;border-left-width:1px; border-right-width: 0px;
  }  
</xsl:template>

</xsl:stylesheet>
