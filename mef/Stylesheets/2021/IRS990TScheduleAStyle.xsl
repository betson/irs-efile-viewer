<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS990TScheduleAStyle">
  
  .sty990TSchADotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty990TSchADesc {
    width:82mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
  
  .sty990TSchALongDesc {
    width:142mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
  
  .sty990TSchAShortDesc {
    width:59mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	float:left; clear: none;
  }
  
  .sty990TSchARightNumBox{ /* Right number box */
	width:7mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	text-align:center;
	vertical-align:bottom;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  .sty990TSchARightNumBoxNBB{ /* Right number box with no bottom border*/
	width:7mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	font-weight:bold;
	text-align:center;
	vertical-align:bottom;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }

  .sty990TSchAAmtBox {
	width:30mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty990TSchAShortAmtBox {
	width:30mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty990TSchAShortAmtBoxNBB {
	width:30mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .sty990TSchAAmtBoxNBB {
	width:30mm;height:4mm;
	padding:0.5mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
	float:left; clear: none;
  }
  
  .styIRS990TSchAHeaderCell { /* Filer Info cell */
	height:7.5mm;
	padding-left:4px;
	padding-right:2px;
	border-style:solid;
	border-color:black;
	border-width:0px 1px 1px 0px;
	float:left; clear:none;
  }
  
  .sty990TSchADepdContainer {   
	border-style: solid; border-color: black;
	border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	width: 187mm; height:auto;
	float:none;clear:both;
	overflow-y: auto;
  }
  
  </xsl:template>

</xsl:stylesheet>