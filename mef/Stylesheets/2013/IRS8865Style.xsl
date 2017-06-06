<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS8865Style">

.IRS8865_FormNumBlock {   /* Form number block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:30mm;height:19mm;
  float:left;
}
.IRS8865_FormTitleBlock {   /* Form title block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:128mm;height:19mm;
  text-align:center;
  float:left;
}
.IRS8865_FormYearBlock {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:19mm;
  float:left;
}
.IRS8865_OMB {   /* Block containing the OMB number */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:4mm;
  text-align:center;
  float:left;
}
.IRS8865_TaxYear {   /* Block Contain tax year */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;
  font-family: "Arial Narrow";
  font-size: 22pt; font-weight: bold;
  text-align:center;
  float:left;
  /* Note the height is 11mm instead of 12mm.  Seems like borders take space even at zero width */
}
.IRS8865_LineBottom {   /* Block Contain LineBottom line */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:188mm;height:8mm;
  float:left;
}
.IRS8865_NameBox {   /* box to enter name */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:108mm;height:8mm;
  float:left;
}
.IRS8865_EINBox {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 5px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:80mm;height:8mm;
  float:left;
}
.IRS8865_LineIndex { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 15px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-align:right;font-weight:bold;
}
.IRS8865_LineDescLong {  /* line body long format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:140mm;
}
.IRS8865_LineIndexMid { /* subline index 2 */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS8865_LineIndexMidFiller { /* subline index 2, bottomless */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS8865_LineIndexMidFillerGray { /* subline index 2, bottomless with gray fill */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;background-color:lightgrey;
}
.IRS8865_MoneyFieldMid { /* Money field middle line */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:26mm;
  text-align:right;
  font-size:7pt;  
  font-family:arial;
}
.IRS8865_MoneyFieldMidFiller { /* Money field middle line Filler */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:26mm;text-align:center;font-size:6pt;
}
.IRS8865_MoneyField { /* Money field end line */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:26mm;text-align:center;
  font-size:7pt;
  font-family:arial;
  text-align:right;
  padding-right:.5mm
}
.IRS8865_MoneyFieldFull { /* Money field end line */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:32mm;text-align:center;
  font-size:7pt;
  text-align:right;
  padding-right:.5mm
}
.IRS8865_MoneyFieldFiller { /* Money field filler */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:26mm;
  text-align:right;
  font-size:6pt;
  padding-right:.5mm
}
.IRS8865_DotSpacing { /* dot line spacing */
  letter-spacing:2mm;
}
.IRS8865_LineContainer {
  clear:both;
  width:188mm;
}

.IRS8865_PartIndex {
  padding-top: 0px; padding-bottom: 0px; padding-left: 4px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  width:25mm;
  font-size:8pt;font-weight:bold;background-color:black;color:white;
}

/* new for 1120S Schedule D */
.IRS8865_LineDescShort { /* line body short format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:106mm;
}
/* for Schedule D*/
.IRS8865_LineDescSchD { /* line body short format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:120mm;
}
/* for Schedule K*/
.IRS8865_LineDescLongSchK { 
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:134mm;
}
.IRS8865_LineDescShortSchK { 
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:100mm;
}
/* for Schedule L*/
.IRS8865_LineDescLongSchL { 
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:76mm;
}
/* for Schedule M*/
.IRS8865_LineDescLongSchM { 
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:128mm;
}
/* for Schedule M-1*/
.IRS8865_LineDescLongSchM1 { 
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:54mm;
}
/* for Schedule N */
.IRS8865_LineDescSchN { 
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:76mm;
}
.IRS8865_TableContainer {
  clear:both;
  width:187.75mm;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
  height:4.5mm;
}
.IRS8865_TableContainer2 {
  clear:both;
  border-style: solid; border-color: black;
  border-left-width: 0px; border-right-width: 0px;
  overflow-y:auto;
  width:94mm; border-top:0; border-bottom:0
}
.IRS8865_TableContainer3 {
border-style: solid; border-color: black;
border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
width: 187.75mm; height:4.5mm;
float:none;clear:both;
overflow-y: auto;
}
.IRS8865_TableContainer4 {
border-style: solid; border-color: black;
border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
width: 187.75mm; height:4.5mm;
float:none;clear:both;
overflow-y: auto;
}
/* schedule A table style */
.IRS8865_SchATabNameCol {   /* name column */
  width: 58mm;   /* ; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
}
.IRS8865_SchATabAddrCol {   /* address column */
  width: 50mm;   /* ; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
}
.IRS8865_SchATabIDCol {   /* id column */
  width: 40mm;   /* ; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  text-align:center;
}
.IRS8865_SchATabCatCol {   /* category column */
  width: 20mm;   /* ; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  text-align:center;
}
/* schedule A-1 style */
.IRS8865_SchA1TabIDCol {   /* id column */
  width: 68mm;   /* ; */
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  text-align:center;
}
/* schedule A-2 style */
.IRS8865_SchA2TabIDCol {  
  width: 28mm;  
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  text-align:center;
}
.IRS8865_SchA2TabMoneyCol {  
  width: 40mm;  
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  text-align:right;
}
/* schedule D table */
.IRS8865_SchDTabAIdxCol {  
  width: 8mm;  
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}
.IRS8865_SchDTabATitleCol {  
  width: 38mm;  
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
}
.IRS8865_SchDTabABodyCol {  
  width: 30mm;  
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
}
.IRS8865_SchDTabCol {  
  width: 25mm;  
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  font-size:6pt;
}
.IRS8865_LineFTab {   /* line F table */
  vertical-align:top;
  height:7mm;
  border-style: solid;border-color:black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
}
.IRS8865_LineGTab {   /* line G table */
  vertical-align:top;  
  border-style: solid;border-color:black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
}
.IRS8865_AddrBox {   /* address block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:80mm;height:16mm;
  float:left;
}
.IRS8865_CatLine {   /* address block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 2px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:108mm;height:8mm;
  /*font-size:6pt;
  font-family: "Arial Narrow";*/
  float:left;
}
.IRS8865_YearLine {   /* address block in header */
  padding-top: 6px; padding-bottom: 0px; padding-left: 9px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:107.5mm;height:8mm;
  float:left;
} /* the reduction in line width is necessary here */
.IRS8865_Checkbox {
  height:3mm;
  width:3mm;
}
th {
   font-size:7pt;font-weight:normal;text-align:center;
}
.IRS8865_LabelSpace { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:6mm;
}
.IRS8865_LabelSpaceWide { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:12mm;
}
.IRS8865_M12LineContainer {
  clear:both;
  width:94mm;    
}
.IRS8865_SchMTbl {    
  font-size:7pt;
  margin-left:8mm
}

.IRS8865_MTDesc {  
  width:53.7mm;  
  border-right:1 solid black;    
  height:4mm  
}
.IRS8865_MTdAmount {  
  width:25.5mm;    
  text-align:right;
  font-size:6pt;  
  padding-right:.5mm
}
.IRS8865_MTdCent {    
  border-left:1 solid black;    
}
.IRS8865_MItemSpan {  
  border-bottom:1 solid black;
  font-size:6pt;
  line-height:90%;
}
 .styIRS8865BBText{ /* Text that must be underlined */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  
}    
  
</xsl:template>
</xsl:stylesheet>
