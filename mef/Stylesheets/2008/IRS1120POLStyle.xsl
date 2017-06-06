<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1120POLStyle">

.IRS1120POL_FormNumBlock {   /* Form number block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:45mm;height:20.75mm;
  float:left;
}
.IRS1120POL_FormTitleBlock {   /* Form title block in header */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  width:113mm;height:20.75mm;
  text-align:center;
  float:left;
}
.IRS1120POL_FormYearBlock {   /* Block with bottom border only */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:20.75mm;
  float:left;
}
.IRS1120POL_OMB {   /* Block containing the OMB number */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:4mm;
  text-align:center;
  float:left;
}
.IRS1120POL_TaxYear {   /* Block Contain tax year */
  padding-top: 6px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  width:30mm;height:11mm;
  font-family: "Arial Narrow";
  font-size: 26pt; font-weight: bold;
  text-align:center;
  float:left;
  /* Note the height is 11mm instead of 12mm.  Seems like borders take space even at zero width */
}
.IRS1120POL_LineBottom {   /* Block Contain LineBottom line */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  width:188mm;height:4mm;
  float:left;
}
.IRS1120POL_LineIndex { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 15px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-align:right;font-weight:bold;
}
.IRS1120POL_SubLineIndex { /* subline index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-indent:3mm;font-weight:bold;
}
.IRS1120POL_LineDescLong {  /* line body long format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:140mm;
}
.IRS1120POL_LineIndexMid { /* subline index 2 */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS1120POL_LineIndexMidFiller { /* subline index 2, bottomless */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}
.IRS1120POL_MoneyFieldMid { /* Money field middle line */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:26mm;text-align:right;
  font-size:6pt;
}
.IRS1120POL_MoneyField { /* Money field end line */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:26mm;text-align:right;
  font-size:6pt;
}
.IRS1120POL_MoneyFieldFiller { /* Money field filler */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;width:26mm;text-align:center;
}
.IRS1120POL_DotSpacing { /* dot line spacing */
  letter-spacing:2mm;
}
.IRS1120POL_LineContainer {
  clear:both;
  width:188mm;
}

.IRS1120POL_GenericDesc{ /* line body short format */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
}

.IRS1120POL_LineDesc { /* line index */
    width:120mm;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
}
 /* the reduction in line width is necessary here */
.IRS1120POL_Checkbox {
  height:3mm;
  width:3mm;
}
.IRS1120POL_GenericCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  width:61mm;height:10mm;padding-left:4px;
}
.IRS1120POL_LabelSpace { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:6mm;
}
.IRS1120POL_LabelSpaceWide { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:12mm;
}
.styIRS1120POLSignatureBox{ /* Box for signature fields */
  padding-top:.5mm;
  padding-bottom:.5mm;
  text-align:left;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left; clear: none;
}
.styIRS1120POLRightLine{ /*Add a Right Line*/
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float: left;clear: none;
  }


</xsl:template>
</xsl:stylesheet>
