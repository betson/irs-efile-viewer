<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 990N -->

<xsl:template name="IRS990NStyle">
  .styIRS990NImg {
    width: 6mm;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;  border-right-width: 1px;
    float: left; clear: none;
  }
  .styIRS990NLineItem {  /* Line Item */
    width: 187mm;
    font-size: 7pt;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: none; clear: both;
  }
  .styIRS990NLNLeftNumBox {
    width: 3mm;
    text-align: right;
    height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    font-weight:bold;
    float:left; clear:none;
    padding-left:1mm;
  }
  .styIRS990NLNLongDesc {   /* Line Description */
    width: 164mm;
    font-size: 6pt;
    height:4.5mm;
    margin-left:3mm; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: none;
  }
  .styIRS990NTableCellPad {   /* Table Cell Padding */
    width: 4px;
  }
  .styIRS990NTableCellA {   /* Table Cell (a or 1) */
    width: 58mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990NTableCellB {   /* Table Cell (b or 2) */
    width: 35mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990NTableCellC {   /* Table Cell (c or 3) */
    width: 30mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990NTableCellD {   /* Table Cell (d) */
    width: 34mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990NTableCellE {   /* Table Cell (e) */
    width: 30mm;
    font-size: 7pt;
    font-weight: normal;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS990NNBSP{
    width: 16px;
    font-weight: bold;
  }
  .styIRS990NYesNoBox {
      width:10mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
  }
  .styIRS990NCkBox{
    height: 4mm;
    width: 4mm;
  }
  .styIRS990NUnderlinedBox{
    width: 38mm;
    font-size: 7pt;
    text-align: left;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px;
  }
</xsl:template>

</xsl:stylesheet>