<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 1120EliminationsOrAdjPC -->

<xsl:template name="IRS1120PCEliminationsOrAdjStyle">
    .styIRS1120PCEliminationsOrAdjVTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS1120PCEliminationsOrAdjBBText{ /* Text with a bottom border */
      padding-top:.5mm;
      padding-bottom:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1120PCEliminationsOrAdjLNPercentBox{ /* Box for percentages */
      width:14mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1120PCEliminationsOrAdjLNYesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1120PCEliminationsOrAdjLNYesNoBoxRB{ /* Box for storing Yes/No Values with a right border */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      float:left; clear: none;
    }
</xsl:template>

</xsl:stylesheet>