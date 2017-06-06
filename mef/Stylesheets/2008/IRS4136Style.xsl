<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 4136 -->

<xsl:template name="IRS4136Style">
  .styIRS4136BB {   /* Bottom Border */
    width: 187mm; height: 16mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: left;
  }
  .styIRS4136FN {   /* Form Name */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }    
  .styIRS4136Agency {   /* Agency */
    font-family: verdana, arial, sans-serif;
    font-weight: normal;
    font-size: 5pt;
  }
  .styIRS4136TYBox {   /* Tax Year Box*/
    width: 29mm;
    height: 7mm;
    text-align: center;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    float: right; clear: none;
  }
  .styIRS4136OMB {   /* OMB No. */
    font-size: 6pt;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS4136TY {   /* Tax Year */
    vertical-align: middle;
    font-family: "Arial Narrow", arial, verdana;
    font-size: 26pt; font-weight: bold;
  }
  .styIRS4136Sequence {
    font-size: 7pt;
    text-align:left;
    padding-top: 0px; padding-bottom: 0px; padding-left: 5mm; padding-right: 0px;
  }
  .styIRS4136BusinessName {   /* Business Name */
    width:117mm;height:8mm;
    font-size: 6pt;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }    
  .styIRS4136CautionHdr {   /* Caution Header */
    font-size: 8pt; font-style: italic; font-family: verdana;
    width:187mm;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }   
  .styIRS4136CautionHdrTitle {   /* Caution Header Title */
    color: black;
    font-style: normal; font-weight: bold;
    width:17mm;margin-left:5mm;float:left;
  } 
  .styIRS4136NumLine {
    width: 187mm;
    padding-left:1mm; padding-right:0px; padding-top:0px; padding-bottom: 0px;
    border-style: solid;
    border-bottom-width: 1px; border-top-width: 0px; border-right-width: 0px; border-left-width: 0px;
    font-size:8pt;
    font-weight: bold;
  }
  .styIRS4136TableThead{ /* Style for HTML 'thead' element  */
    display:table-header-group;
  }
  .styIRS4136TableContainer1 {   /* Scrollable Table Container for Line 1 */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; 
    height: 16mm;
    float: left; clear:left;
    overflow-y: auto;
  }
  
  .styIRS4136TableContainer2 {   /* Scrollable Table Container for Line 2 */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; 
    height: 12mm;
    float: left; clear:left;
    overflow-y: auto;
  }    
  
  .styIRS4136TableContainer3 {   /* Scrollable Table Container for Line 3 */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; 
    height: 26.5mm;
    float: left; clear:left;
    overflow-y: auto;
  }    

  .styIRS4136TableContainer4 {   /* Scrollable Table Container for Line 4 */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; 
    height: 21.75mm;
    float: left; clear:left;
    overflow-y: auto;
  }   
  
  .styIRS4136TableContainer5 {   /* Scrollable Table Container for Line 5 */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; 
    height: 19.5mm; 
    float: none; clear: both;
    overflow-y: auto;
  }    

  .styIRS4136TableContainer67 {   /* Scrollable Table Container for Line 6 and 7*/
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; 
    height: 22mm; 
    float: left; clear:left;
    overflow-y: auto;
  }    

  .styIRS4136TableContainer11 {   /* Scrollable Table Container for Line 7 */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; 
    height: 12mm; 
    float: left; clear:left;
    overflow-y: auto;
  }     
  
  .styIRS4136TableContainer9 {   /* Scrollable Table Container for Line 7 */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    width: 187mm; 
    height: 23.4mm;
    float: none; clear:none;
    overflow-y: auto;
  }        
  .styIRS4136TableCellPad {   /* Table Cell Padding */
    width: 4px;
  }
  .styIRS4136Table {   /* Table */
    font-size: 7pt;
    text-align: left;
    float: left;
  }
  .styIRS4136TableCellA {   /* Table Cell (a or 1) */
    width: 23mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    border-color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
    .styIRS4136TableCellAForRow2 {   /* Table Cell (a or 1)  for tableRow2cell for SRD*/
    width: 16mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    border-color: black;
    text-align: center;
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }

  .styIRS4136TableCellB {   /* Table Cell (b or 2) */
    width: 13mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: left;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
    .styIRS4136TableCellBForRow2 {   /* Table Cell (b or 2) */
    width: 13mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: left;
    border-color: black;
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }

  .styIRS4136TableCellC {   /* Table Cell (c or 3) */
    width: 24mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    border-color: black;
    text-align: right;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
    .styIRS4136TableCellCForRow2 {   /* Table Cell (c or 3) */
    width: 32mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    border-color: black;
    text-align: right;
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }

  .styIRS4136TableCellD {   /* Table Cell (d or 4) */
    width: 33mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: right;
    border-color: black; 
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
  }
    .styIRS4136TableCellDForRow2 {   /* Table Cell (d or 4) for SRD*/
    width: 32mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: right;
    border-color: black; 
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
  }

  .styIRS4136TableCellE {  
    width: 11mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
    .styIRS4136TableCellEForRow2 {  /*For SRD */
    width: 9mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }

  .styIRS4136TableCellLine {  
    width: 77mm;
    padding-left:0mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: left;
    border-color: black;
    border-style: solid;
    vertical-align: bottom;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS4136LetterCell { /* Letter label for line item description */
      width:3mm;
      height:4mm;
      padding-left:2.8mm;
      border-color: black;
      border-style: solid;
      vertical-align: bottom;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS4136Braces {
    width: 3mm;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS4136DescLine {   /* Desc Line */
    font-size: 7pt;
    width: 187mm;
  }    
  .styIRS4136Ckbox {   /* Checkbox */
    height: 4mm; width: 4mm;
  }    
  .styIRS4136Table {   /* Table */
    font-size: 7pt;
    text-align: left;
    float: left; clear: none;
  }
  .styIRS4136LN {   /* Line Number */
    width: 2mm;
    color: black;
    font-weight: bold; text-align: right;
  }
  .styIRS4136LNBox {   /* Boxed Line Numbers */
    width: 5mm;
    font-weight: bold;
    text-align: center;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;
  }  
  .styIRS4136Amount {
    width: 33mm;
    font-size: 7pt;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;
    border-style: solid;
    border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px;
    text-align: right;
  }
  .styIRS4136CRN {
    width: 8mm;
    background-color: lightgrey;
    margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
    padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;
    border-style: solid;
    border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px;
    text-align: center;
  } 
  .styIRS4136NBSP{
    width: 5px;
    font-weight: bold;
  }
</xsl:template>

</xsl:stylesheet>