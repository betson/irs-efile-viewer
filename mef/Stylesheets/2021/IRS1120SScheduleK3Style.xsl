<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS1120SScheduleK3Style">

  .sty1065K2DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:1px;
  }
  
  .sty1065K2HeaderDiv {
    width:35.5mm; height:8mm;
    padding-top:1mm; padding-bottom:0.5mm;
    text-align:center;
    float:left; clear:none;
    background-color:#DCDCDC;
    border-bottom:1px solid black; border-left:1px solid black;
  }
  
  .sty1065K2RowIDCell {
		color: black;
		text-align: center; 
		font-weight:bold;
		border-style: solid;
		border-color: black;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  }
  
  .sty1065K2RowNumCell {
		color: black;
		text-align:left; 
		vertical-align:top;
		padding-left:1.5mm;
		font-weight:bold;
		border-style: solid;
		border-color: black;
		border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  
  .sty1065K2RowNumCellSD {
		color: black;
		text-align:left; 
		vertical-align:top;
		padding-left:3mm;
		font-weight:bold;
		border-style: solid;
		border-color: black;
		border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  
  .sty1065K2Halftable {
		width:126mm;height:auto;margin-bottom:2mm;
		float:none;clear:both;
  }
  
  .sty1065K2TableContainerLSGap {
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
		width: 256mm; height:auto; padding-left:7.5mm;
		float:none;clear:both;
		overflow-y: auto;
  }
  </xsl:template>

</xsl:stylesheet>