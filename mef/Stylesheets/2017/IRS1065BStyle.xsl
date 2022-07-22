<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Last Modified by James Ganzy on 6/30/2010 -->
<!-- CSS Styles for form 1065 B-->

<xsl:template name="IRS1065BStyle">
    .styIRS1065BVTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS1065BBText{ /* Text with a bottom border */
      height:4mm;border-style: dotted; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1065BLNPercentBox{ /* Box for percentages */
      width:14mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1065BLNYesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1065BLNYesNoBoxRB{ /* Box for storing Yes/No Values with a right border */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      float:left; clear: none;
    }
</xsl:template>

</xsl:stylesheet>