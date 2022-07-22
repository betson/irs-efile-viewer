<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="IRS5713Style">
<!-- CSS Styles Go Here -->
  /* BEGIN PAGE SPECIFIC STYLES */
    .styIRS5713LeftBox{ /* Box on left holding instructions */
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS5713LNYesNoBox{ /* Box for storing Yes/No Values */
      width:10mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS5713SignatureBox{ /* Box for signature fields */
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
    }
    .styIRS5713SignatureText{ /* Text containing instructions for signatures */
      font-size: 6pt; text-align:left;
      float:left; clear: none;
    }
  /* END PAGE SPECIFIC STYLES */
</xsl:template>
</xsl:stylesheet>



