<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 5735 -->

<xsl:template name="IRS5735Style">
  .styIRS5735LNDescBB{ /* Line item description */
    width:138mm;height:4mm;
    border-style: solid;
    border-color: black;
    border-bottom-width: 1px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
    .styIRS5735NoteHdr {
    width: 146mm;
    float: left; clear: none;
    padding-left: 1mm; padding-top: 0px; padding-bottom: 0px; padding-right: 0px;
  }  
  .styIRS5735TableContainer {   /* Scrollable Table Container */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  width: 187mm; height:4.5mm;
  float:none;clear:none;
   overflow-y: auto;
  }
</xsl:template>

</xsl:stylesheet>
