<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 4562FY -->

<xsl:template name="IRS4562FYStyle"> 
 .styIRS4562FYNoteHdr {   /* Note Header */
    font-size: 8pt; font-style: italic; font-family: verdana;
    width:187mm;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }  
  .styIRS4562FYNoteHdrTitle {   /* Note Header Title */
    color: black;
    font-style: normal; font-weight: bold;
  }
  .styIRS4562FYSection {
    width: 187mm;
    color: black;
    font-weight: bold;
    font-size: 8pt;
    text-align: center;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS4562FYLineItem {  /* Line Item */
    width: 187mm;
    font-size: 7pt;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: none;
  }
  .styIRS4562FYLNLeftNumBox {
    width: 3mm;
    text-align: right;
    height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    font-weight:bold;
    float:left; clear:none;
    padding-left:1mm;
  }  
  .styIRS4562FYLNDesc {
    width: 143.5mm;
    margin-left: 1mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS4562FYLNAmountBox{ /* Box for storing amounts */
    width:30mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:right;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS4562FYTableCellPad {   /* Table Cell Padding */
        width: 4px;
  }
  .styIRS4562FYSectionATableContainer {   /* Scrollable Table Container for Section A, line 25-27 */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm;
    height: 49.7mm;
    float: none; clear:none;
    overflow-y: auto;
  }
  .styIRS4562FYTableContainer {   /* Scrollable Table Container */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm;
    float: none; clear:none;
    overflow-y: auto;
  } 
  .styIRS4562FYTable {   /* Table */
    font-size: 7pt;
    width: 187mm
    text-align: left;
    float: none; clear: none;
  }
  .styIRS4562FYOtherCell {
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellA {   /* Table Cell (a or 1) */
    width: 36mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellB {   /* Table Cell (b or 2) */
    width: 21mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellC {   /* Table Cell (c or 3) */
    width: 32mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellD {   /* Table Cell (d) */
    width: 21mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellE {   /* Table Cell (e) */
    width: 21mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellF {   /* Table Cell (f) */
    width: 24mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellG {   /* Table Cell (g) */
    width: 32mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellH {   /* Table Cell (g) */
    width: 35mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellI {   /* Table Cell (g) */
    width: 35mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellSmall { 
    width: 11mm;
    font-family:arial;
    font-size: 9pt;
    font-weight: normal;
    color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellSmall2 { 
    width: 22mm;
    font-family:arial;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYTableCellYesNo { 
    width: 11mm;
    font-family:verdana;
    font-size: 7pt;
    font-weight: bold;
    color: black;
    text-align: center;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562FYNBSP{
    width: 16px;
    font-weight: bold;
  }   
  .styIRS4562FYYesNoBox {
    width: 11mm;
    height: 4.25mm;
    text-align: center;
    padding-top: 1mm; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    font-size: 8pt;
    font-weight: bold;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  }
  .styIRS4562FYCkbox {   /* Checkbox */
    height: 4mm; width: 4mm;
  }
</xsl:template>

</xsl:stylesheet>