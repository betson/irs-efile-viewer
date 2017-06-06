<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- CSS Styles for form 1120F Schedule  S-->
  <xsl:template name="IRS1120FScheduleSStyle">
  .sty1120ScheduleHBB {   /* Bottom Border */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float: left; clear: left;
  }
  .sty1120ScheduleHFN {   /* Form Name */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty1120ScheduleHFNum {   /* Form Number */
    font-family: verdana, arial, sans-serif;
    font-size: 10pt; font-weight: bold;
  }
  .sty1120ScheduleHFNum2 {   /* Form Number 2nd Line */
    font-family: verdana, arial, sans-serif;
    font-size: 8pt; font-weight: bold;
  }
  .sty1120ScheduleHAgency {   /* Agency */
    font-family: verdana, arial, sans-serif;
    font-size: 5pt; font-weight: normal;
  }
  .sty1120ScheduleHFTBox {   /* Form Title Box*/
    text-align: center;
    float: left; clear: none;
  }
  .sty1120ScheduleHFMT {   /* Form Main Title */
    font-family: verdana, arial, sans-serif;
    font-size: 12pt; font-weight: bold;
    text-align: center;
  }
  .sty1120ScheduleHFST {   /* Form Subtitle */
    font-family: verdana, arial, sans-serif;
    font-size: 7pt; font-weight: bold;
  }
  .sty1120ScheduleHTYBox {   /* Tax Year Box*/
    text-align: center;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    float: right; clear: none;
  }
  .sty1120ScheduleHOMB {   /* OMB No. */
    font-size: 6pt;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .sty1120ScheduleHTY {   /* Tax Year */
    vertical-align: middle;
    font-family: "Arial Narrow", arial, verdana;
    font-size: 26pt; font-weight: bold;
  }
  .sty1120ScheduleHBusinessName {   /* Business Name */
    font-size: 6pt;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float: left; clear: none;
  }
  .sty1120ScheduleHBusinessNameInputFld {   /* Business Name Input Field */
    width: 130mm;
    color: black;
    font-family: verdana, arial, sans-serif;
    font-size: 8pt; font-weight: bold;
    border-style: none; border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
  }
  .sty1120ScheduleHEIN {   /* EIN */
    font-size: 6pt;
    text-align: leftr;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    float: right; clear: none;
  }
  .sty1120ScheduleHEINBox{ /*Employer ID number box*/
    font-size:6pt;
    font-weight: bold;
    /*float:right;*/
  }
  .sty1120ScheduleHPartHdr {   /* Part Header */
    height: 8mm;
    width:187mm;
    font-size: 10pt; font-weight: bold;
    padding-top: 7px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .sty1120ScheduleHPartHdrSpanner {   /* Part Header Spanner */
    width: 0px;
    background-color: black;
  }
  .sty1120ScheduleHPartHdrTitle {   /* Part Header Title */
    color: white; background-color: black;
  }
  .sty1120ScheduleHNoteHdr {   /* Note Header */
    font-size: 8pt; font-style: italic; font-family: verdana;
    width:187mm;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .sty1120ScheduleHNoteHdrTitleSpanner {   /* Note Header Title Spanner */
    width: 1px;
  }
  .sty1120ScheduleHNoteHdrSpanner {   /* Note Header Spanner */
    width: 40px;
  }
  .sty1120ScheduleHNoteHdrTitle {   /* Note Header Title */
    color: black;
    font-style: normal; font-weight: bold;
  }
  .sty1120ScheduleHSeeInstructionsTitle {    /* See Instructions Title  */
    color: black;
    font-style: normal; font-weight: normal;
  }
  .sty1120ScheduleHLineItem {   /* Line Item */
    width: 187mm;
    /*float: left; clear: left;*/
  }
  .sty1120ScheduleHLN {   /* Line Number */
    width: 2mm;
    color: black;
    font-weight: bold; text-align: right;
    float: left; clear:  none;
  }
  .sty1120ScheduleHLNLtMargin {   /* Line Number Left Margin */
    width: 2mm;
    float: left; clear:  none;
  }
  .sty1120ScheduleHLNLtMargin2 {   /* Line Number Left Margin */
    width: 6.25mm;
    float: left; clear:  none;
  }
  .sty1120ScheduleHLNLtMargin3 {   /* Line Number Left Margin */
    width: 4.25mm;
    float: left; clear:  none;
  }
  .sty1120ScheduleHLNDesc {   /* Line Description */
    width: 142mm;
    float: left; clear: none;
  }
  .sty1120ScheduleHLNBox {   /* Boxed Line Numbers */
    width: 5.25mm;
    font-weight: bold;
    text-align: center;
    float: right; clear: none;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
  }
  .sty1120ScheduleHLNValBox {   /* Line Value Box */
    width: 32.25mm;
    text-align: right;
    float: right; clear: none;
    padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: .25mm;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px;border-left-width: 0px; border-right-width: 0px;
  }
  .sty1120ScheduleHFormFooter {   /* Form Footer */
    width: 187mm;
    font-size: 6pt;
    text-align: left;
    border-style: solid;
    border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  }
  .sty1120ScheduleHNBSP{
    width: 16px;
    font-weight: bold;
  }
</xsl:template>
</xsl:stylesheet>
