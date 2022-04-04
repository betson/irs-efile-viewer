<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 1120ScheduleN -->

<xsl:template name="IRS1120ScheduleBStyle">
  .styIRS1120ScheduleBInfoTitle{ /*Information Title */
    font-size:9pt;
    font-weight:bold;
    text-align:center;
    margin-top:2mm;
  }
  .styIRS1120ScheduleBLNYesNoBox{ /* Box for storing Yes/No Values */
    width:10mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:center;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS1120ScheduleBUnderlineAmount{ /* Box for storing underlined amounts. */
    width:32mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:right;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float:left; clear: none;
  }
</xsl:template>

</xsl:stylesheet>