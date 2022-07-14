<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRSRRB1042SStyle">
  .styRRB1042SBoxCell {
    width:100%;
    height:7mm;
    padding-left:0.5mm;padding-right:0.5mm;
    border-top:1px solid black;
  }
  .styRRB1042SLineDiv {
    width:100%;
    border-style:solid;border-color:black;
    border-width:1px 1px 0px 1px;
  }
  .styRRB1042SDesc {
    width:68%;float:left;height:7mm;
    font-size:7pt;font-family:Times New Roman;
    padding-left:0.8mm;padding-top:0.3mm;
  }
  .styRRB1042SAmountBox { /* Box for storing line item amounts. */
    width:32%;height:7mm;
    padding-top:.5mm;padding-right:0.3mm;
    text-align:right;
    border-style:solid;border-color:black;border-top-width:0px;border-bottom-width:0px;border-left-width:1px;border-right-width:0px;
    float:left;clear:none;		
  }
  </xsl:template>

</xsl:stylesheet>