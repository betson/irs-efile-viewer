<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form IRS1120EliminationsOrAdj -->

<xsl:template name="IRS1120EliminationsOrAdjStyle">
    .styIRS1120VTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS1120LeftBox{ /* Box on left holding instructions */
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS1120SignatureText{ /* Text containing instructions for signatures */
      font-size: 6pt; text-align:left;
      float:left; clear: none;
    }
    .styIRS1120SignatureBox{ /* Box for signature fields */
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
    }
    .styIRS1120RetDiscussBox {   /* IRS Return Discussion Permission Box */
      font-size: 6pt; text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 3px; border-bottom-width: 3px; border-left-width: 3px; border-right-width: 3px;
      float: left; clear: none;
    }
    .styIRS1120BBText{ /* Text with a bottom border */
      padding-top:.5mm;
      padding-bottom:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      clear: none;
    }
    .styIRS1120FNum {   /* Form Number */
      font-family: "Arial Narrow";
      font-size: 22pt; font-weight: bolder;
    }
    .styIRS1120LNPercentBox{ /* Box for percentages */
      width:14mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1120LNYesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1120LNYesNoBoxRB{ /* Box for storing Yes/No Values with a right border */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      float:left; clear: none;
    }
  .stylIRS1120_GenericCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
}
    
</xsl:template>

</xsl:stylesheet>