<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 4562 -->

<xsl:template name="IRS4562Style"> 
 .styIRS4562NoteHdr {   /* Note Header */
    font-size: 8pt; font-style: italic; font-family: verdana;
    width:187mm;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }  
  .styIRS4562NoteHdrTitle {   /* Note Header Title */
    color: black;
    font-style: normal; font-weight: bold;
  }
  .styIRS4562Section {
    width: 187mm;
    color: black;
    font-weight: bold;
    font-size: 8pt;
    text-align: center;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS4562LineItem {  /* Line Item */
    width: 187mm;
    font-size: 7pt;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: none;
  }
  .styIRS4562LNLeftNumBox {
    width: 3mm;
    text-align: right;
    height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    font-weight:bold;
    float:left; clear:none;
    padding-left:1mm;
  }  
  .styIRS4562LNDesc {
    width: 143.5mm;
    margin-left: 1mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS4562LNAmountBox{ /* Box for storing amounts */
    width:30mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:right;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS4562TableCellPad {   /* Table Cell Padding */
        width: 4px;
  }
  .styIRS4562SectionATableContainer {   /* Scrollable Table Container for Section A, line 25-27 */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm;
    height: 49.7mm;
    float: none; clear:none;
    overflow-y: auto;
  }
  .styIRS4562TableContainer {   /* Scrollable Table Container */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm;
    float: none; clear:none;
    overflow-y: auto;
  } 
  .styIRS4562Table {   /* Table */
    font-size: 7pt;
    width: 187mm
    text-align: left;
    float: none; clear: none;
  }
  .styIRS4562OtherCell {
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellA {   /* Table Cell (a or 1) */
    width: 36mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellB {   /* Table Cell (b or 2) */
    width: 21mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellC {   /* Table Cell (c or 3) */
    width: 32mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellD {   /* Table Cell (d) */
    width: 21mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellE {   /* Table Cell (e) */
    width: 21mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellF {   /* Table Cell (f) */
    width: 24mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellG {   /* Table Cell (g) */
    width: 32mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellH {   /* Table Cell (g) */
    width: 35mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellI {   /* Table Cell (g) */
    width: 35mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellSmall { 
    width: 11mm;
    font-family:arial;
    font-size: 9pt;
    font-weight: normal;
    color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellSmall2 { 
    width: 22mm;
    font-family:arial;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4562TableCellYesNo { 
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
  .styIRS4562NBSP{
    width: 16px;
    font-weight: bold;
  }   
  .styIRS4562YesNoBox {
    width: 11mm;
    height: 4.25mm;
    text-align: center;
    padding-top: 1mm; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    font-size: 8pt;
    font-weight: bold;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  }
  .styIRS4562Ckbox {   /* Checkbox */
    height: 3mm; width: 3mm;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px; 
  }
</xsl:template>

</xsl:stylesheet>