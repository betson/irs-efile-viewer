<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="IRS4466Style">

    .styIRS4466LeftBox{ /* Box on left holding instructions */
          text-align:left;
          border-style: solid; border-color: black;
          border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
          float:left;clear:none;
    }
    
    .styIRS4466LNDescWB{ /* Line description with right border*/
      width:138mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      float:left; clear: none;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    }
    .styIRS4466SignatureText{ /* Text containing instructions for signatures */
      font-size: 7pt; text-align:left;
      float:left; clear: none;
    }
    .styIRS4466SignatureBox{ /* Box for signature fields */
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
    }

  </xsl:template>
</xsl:stylesheet>
