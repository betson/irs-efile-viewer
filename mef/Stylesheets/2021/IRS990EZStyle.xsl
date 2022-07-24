<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 990EZ -->

<xsl:template name="IRS990EZStyle">
  .styIRS990EZImg {
   width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990EZLineItem {  /* Line Item */
    width: 187mm;
    font-size: 7pt;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: none; clear: both;
  }
  .styIRS990EZLNLeftNumBox {
    width: 3mm;
    text-align: right;
    height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    font-weight:bold;
    float:left; clear:none;
    padding-left:1mm;
  }
  .styIRS990EZLNLongDesc {   /* Line Description */
    width: 164mm;
    font-size: 6pt;
    height:4.5mm;
    margin-left:3mm; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: none;
  }
   .styIRS990EZLNLongDesc2 {   /* Line Description */
    width: 164mm;
    font-size: 6pt;
    height:4.5mm;
    margin-left:0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: none;
  }
  .styIRS990EZTableCellPad {   /* Table Cell Padding */
    width: 4px;
  }
    .styIRS990EZTableCellAA {   /* Table Cell (a or 1) */
    width: 122mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }

  .styIRS990EZTableCellA {   /* Table Cell (a or 1) */
    width: 70mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990EZTableCellB {   /* Table Cell (b or 2) */
    width: 28mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990EZTableCellC {   /* Table Cell (c or 3) */
    width: 30mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990EZTableCellD {   /* Table Cell (d) */
    width: 34mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990EZTableCellE {   /* Table Cell (e) */
    width: 30mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990EZNBSP{
    width: 16px;
    font-weight: bold;
  }
  .styIRS990EZYesNoBox {
      width:10mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
  }
  .styIRS990EZCkBox{
    height: 2mm;
    width: 2mm;
  }
  .styIRS990EZUnderlinedBox{
    width: 38mm;
    font-size: 7pt;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px;
  }
</xsl:template>

</xsl:stylesheet>