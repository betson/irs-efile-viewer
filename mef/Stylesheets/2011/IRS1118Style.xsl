<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for Form 1118 -->

<xsl:template name="IRS1118Style">
  .styIRS1118TableCellHeaderSmall {   /* Table Cell Header*/
    width: 25mm;
    color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1118TableCellLtr {   /* Table Cell for Letter */
    width: 5mm;
    color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1118TableCellTotal {   /* Table Cell for Totals*/
    width: 35mm;
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1118TableCellNW {   /* Table Cell with no pre-defined width*/
    color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS1118TableLastCol {   /* Last Table Column */
    width: 3.75mm;
    color: white;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    display: none;
  }
  .styIRS1118TableCell {   /* Form 1118 Table Cell with a bottom border*/
    color:black;
    border-style: solid; border-color: black;
    text-align: center;
    padding-top:2mm;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float: left; clear: none;
  }
  .styIRS1118LNDescRD{ /*Line description for the Research and Dev lines in Schedule H, Part 1*/
    width:39mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float:left; clear: none;
    text-align:left;
  }
  .styIRS1118LNDescDed{ /*Line description for the Deduction lines in Schedule H, Part 2*/
    width:91mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float:left; clear: none;
    text-align:left;
  }
  .styIRS1118LNDescRed{ /*Line description for the Reduction lines in Schedule G*/
    width:87mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS1118LNLeftNumBoxB{ /* Item number to the left of the page, with a border */
    width:8mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    padding-right:2.25mm;
    font-weight:bold;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    float:left; clear: none;
    text-align:right;
  }
  .styIRS1118ScheduleCell{ /*Schedule Cell Box*/
    width:127mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    float: left;clear: none;
  }
  .stySectionDesc{ /* Section Title Description */
    font-size: 9pt; font-weight: bold; text-align:center;
    float: left;clear: none;
  }
  .styIRS1118TitleDesc{ /* Section Title Description */
    height:4mm;width:232mm;
    font-size: 9pt; font-weight: bold;
    padding-left:4mm;
    float:left; clear: none;
  }
  .styIRS1118TableContainerSchF {   /* Scrollable Table Container for Schedule F Table*/
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width:127mm; height:4.5mm;
    float:left;clear:none;
    overflow-y: auto;
  }
  .styIRS1118UnderlinedText {  
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    width:26mm;
  }
  .styIRS1118TableContainerLandscape {   /* Scrollable Table Container for forms in Landscape format*/
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    width: 256mm; height:4.5mm;
    float:none;clear:both;
    overflow-y: auto;
    display:table-header-group;
  }
		.styIRS1118LNAmountBoxSmall{ /* Small Amount Box with small text size*/ 
			width:26mm;height:4mm;
			font-size:6pt;
			padding-top:.5mm;
			padding-bottom:.5mm;
			padding-right:0mm;
			text-align:right;
			vertical-align:bottom;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
			float:right;
		}

</xsl:template>

</xsl:stylesheet>