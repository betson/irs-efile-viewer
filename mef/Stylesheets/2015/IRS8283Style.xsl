<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="IRS8283Style">
  <!-- CSS Styles Go Here -->
  /* BEGIN PAGE SPECIFIC STYLES */
      .styIRS8283SignatureBox{ /* Box for signature fields */
        padding-top:.5mm;
        padding-bottom:.5mm;
        text-align:left;
        border-style: solid; border-color: black;
        border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
        float:left; clear: none;
      }
      .styIRS8283LNYesNoBox{ /* Box for storing Yes/No Values */
        width:10mm;
        padding-top:.5mm;
        padding-bottom:.5mm;
        text-align:center;
        border-style: solid; border-color: black;
        border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
        float:left; clear: none;
      }
      .styIRS8283TableContainer {
        clear:both;
        width:187mm;min-height:29mm;
        font-size:6pt;
        border-style: solid; border-color: black;
        border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
        overflow-y:auto;
       }
      .styTableContainerForTP3ctn {   /* Scrollable Table Container */
        border-style: solid; border-color: black;
        border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
        width: 187mm; min-height:4.5mm;
        float:none;clear:both;
        overflow-y: auto;
    }
      .styIRS8283PageBreak {
        page-break-after: always
      }
      
  
  /* END PAGE SPECIFIC STYLES */
</xsl:template>
</xsl:stylesheet>



