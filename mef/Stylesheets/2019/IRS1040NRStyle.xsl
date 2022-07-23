<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS1040NRStyle">
  .sty1040NRIndentSection {
    width:20mm;
    font-weight:bold;
    font-size:8pt;
    float:left;clear:left;
  }
  .sty1040NRIndentDesc {
    width:119mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .sty1040NRIndent2Desc {
    width:79mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .sty1040NRLongDesc {
    width:179mm;min-height:4mm;
    padding-top:0.5mm;
    padding-bottom:0.5mm;
    float:left;clear:none;
  }
  .sty1040NRTableContainerD {
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 127mm; height:auto;
    float:left;clear:none;
    overflow-y: auto;
  }
  .sty1040NRTableContainer16 {
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 220.7mm; height:auto;
    float:none;clear:right;
    overflow-y: auto; display:block;
  }
  .sty1040NRTableContainerG {
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    width: 179mm; height:auto;
    float:left;clear:none;
    overflow-y: auto; display:block;
  }
  .sty1040NRTableContainerL {
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; height:auto;
    float:none;clear:both;
    overflow-y: auto; display:block;
  }
  .sty1040NRTableCellCenter {
    color: black;
    text-align: center;
    border-style: solid;
    border-color:black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .sty1040NRTableCellText {
    color: black;
    text-align: left;
    border-style: solid;
    border-color:black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .sty1040NRTableCellAmt {
    color: black;
    text-align: right;
    border-style: solid;
    border-color:black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .sty1040NRCkbox {
    height:10px;width: 10px;
    margin:-2px 4px 0px 1px;
  }
  .sty1040NRDotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  <!-- This is hacky, but avoids declaring the whole form landscape. CONTROL PAGE BREAKS -->
  @media print {
    .sty1040NRLandDiv {
      transform: rotate(-90deg);
      margin-left:75mm;
      padding-top:0mm;
    }
  }
  </xsl:template>

</xsl:stylesheet>