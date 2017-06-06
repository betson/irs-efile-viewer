<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- CSS Styles for form 1040SS -->
  <xsl:template name="IRS1040SSPRStyle">

  .styIRS1040SSPRInfo {
    font-size:7.5pt;
    padding-top:0.5mm;
  }
  .styIRS1040SSPRNum {
    float:left;
    padding-top:1.5mm;
    padding-left:2mm;
    font-size:7.5pt;
    font-weight:bold;
  }
  .styIRS1040SSPRLB {
    float:left;
    padding-left:3mm;
    padding-top:1.5mm;
    font-size:7.5pt;
  }
  .styIRS1040SSPRLineItem {  /* Line Item */
    border-color:#00CBFF;
    width: 100%;
    height: 4mm;
    padding: 0px 0px 0px 0px;
    border-style: solid;
    border-width: 0px 0px 0px 0px;
    float: none; clear: none;
    }
    .styIRS1040SSPRLNLeftNumBox{ /* Double digit item number to the left of the page */
    width:6mm;
    height:100%;
    font-weight:bold;
    padding-top: 3px; 
    padding-right:6px;
    padding-left: 0mm;
    float:left; clear:none;
    text-align:right;
    font-size:8pt;
  }
  .styIRS1040SSPRLNDesc{ /* Line item description */
    width:138mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    padding-left:3mm;
    border-style: solid;
    border-width:0px 0px 0px 0px;
    border-color:#FF0000;
    font-size:8.5pt;
    float:left; clear: none;
  }
  
  .styIRS1040SSPRTableCell {   /* Table Cell for Letter */
    width: 5mm;
    color: black;
    border-color:black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1040SSPRTableCellHeader {   /* Table Cell Header */
    width: 32mm;
    color: black;
    border-color:black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1040SSPRCleanDiv {
    padding:0px 0px 0px 0px;
    border-width:0px 0px 0px 0px;
    border-style:solid;
    border-color:black;
    float:left;
    font-size:7pt;
    font-family:arial;
  }

  <!-- CSS Styles for form 1040PR -->

  .styIRS1040PRInfo {
    font-size:7.5pt;
    padding-top:0.5mm;
  }

  .styIRS1040PRNum {
    float:left;
    padding-top:1.5mm;
    padding-left:2mm;
    font-size:7.5pt;
    font-weight:bold;
  }

  .styIRS1040PRLB {
    float:left;
    padding-left:3mm;
    padding-top:1.5mm;
    font-size:7.5pt;
  }
  .styIRS1040PRLineItem {  /* Line Item */
    border-color:#00CBFF;
    width: 100%;
    height: 4mm;
    padding: 0px 0px 0px 0px;
    border-style: solid;
    border-width: 0px 0px 0px 0px;
    float: none; clear: none;
    }
    .styIRS1040PRLNLeftNumBox{ /* Double digit item number to the left of the page */
    width:6mm;
    height:100%;
    font-weight:bold;
    padding-top: 3px; 
    padding-right:6px;
    padding-left: 0mm;
    float:left; clear:none;
    text-align:right;
    font-size:8pt;
  }
  .styIRS1040PRLNDesc{ /* Line item description */
    width:138mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    padding-left:3mm;
    border-style: solid;
    border-width:0px 0px 0px 0px;
    border-color:#FF0000;
    font-size:8pt;
    float:left; clear: none;
  }
  
  .styIRS1040PRTableCell {   /* Table Cell for Letter */
    width: 5mm;
    color: black;
    border-color:black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1040PRTableCellHeader {   /* Table Cell Header */
    width: 32mm;
    color: black;
    border-color:black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1040PRCleanDiv {
    padding:0px 0px 0px 0px;
    border-width:0px 0px 0px 0px;
    border-style:solid;
    border-color:black;
    float:left;
    font-size:7pt;
    font-family:arial;
  }
</xsl:template>

</xsl:stylesheet>
