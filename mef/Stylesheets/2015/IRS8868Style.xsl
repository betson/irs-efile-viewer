<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8868 -->

<xsl:template name="IRS8868Style">
  .styIRS8868PartHdr {   /* Part Header */
  width:187mm;
  font-size: 8pt; font-weight: bold;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  float:left;clear:left;
  }

  .styIRS8868NoteHdr {   /* Note Header */
    font-size: 7pt; font-style: italic; font-family: verdana; font-weight: bold;
    width:187mm;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }

  .styIRS8868LineItem {  /* Line Item */
    width: 187mm;
    font-size: 7pt;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: none;
  }
  .styIRS8868LNLeftNumBox {
    width: 3mm;
    text-align: right;
    height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    font-weight:bold;
    float:left; clear:none;
    padding-left:1mm;
  }
  }
  .styIRS8868LNDesc {
    width: 143.5mm;
    margin-left: 1mm;
    height:auto;
  }
  .styIRS8868NBSP{
    width: 16px;
    font-weight: bold;
  }
  .styIRS8868Ckbox {   /* Checkbox */
    height: 3mm; width: 3mm;
  }
  .styIRS8868CkboxText {
    width: 48mm;
    font-size: 7pt;
    text-align: left;
    margin-left: 2mm; margin-right: 0px;
    float: left; clear: none;
  }
  .styIRS8868HR{
    width: 187mm;
    color:black;
    border-style: solid;
    border-bottom-width: 1px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px;
  }
</xsl:template>

</xsl:stylesheet>