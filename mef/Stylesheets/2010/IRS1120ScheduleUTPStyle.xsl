<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1120ScheduleUTPStyle">

.styIRS1120ScheduleUTP_styFN {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float: left; clear: none; 
}
.styIRS1120ScheduleUTP_styFNum {   /* Form Number */
  font-family: verdana, arial, sans-serif;
  font-size: 10pt; font-weight: bold;
}
.styIRS1120ScheduleUTP_styFNum2 {   /* Form Number 2nd Line */
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
}
.styIRS1120ScheduleUTP_styAgency {   /* Agency */  
  font-family: "Arial Narrow";
  font-size: 7pt;
  font-weight:normal;
  line-height:100%
}

.styIRS1120ScheduleUTP_styFTBox {   /* Form Title Box*/
  text-align: center;
  float: left; clear: none;
}
.styIRS1120ScheduleUTP_styFMT {   /* Form Main Title */
  font-family: verdana, arial, sans-serif;
  font-size: 12pt; font-weight: bold;
}
.styIRS1120ScheduleUTP_styFST {   /* Form Subtitle */
  font-family: verdana, arial, sans-serif;
  font-size: 7pt; font-weight: bold;
}
.styIRS1120ScheduleUTP_styTYBox {   /* Tax Year Box*/
  text-align: center;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
  float: left; clear: none;
}
.styIRS1120ScheduleUTP_styOMB {   /* OMB No. */
  border-bottom:1 solid black;
  font-size:7pt
}
.styIRS1120ScheduleUTP_styTY {   /* Tax Year */
  vertical-align: middle;
  font-family: "Arial Narrow", arial, verdana;
  font-size: 26pt; font-weight: bold;
}
.styIRS1120ScheduleUTP_styInputFld {   /* Input Text Field */
  color: black;
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
  border-style: none; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
}
.styIRS1120ScheduleUTP_styBusinessName {   /* Business Name */
  font-size: 7pt;
  padding-top: 0px; padding-bottom: 0px; padding-left: 3px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float: left; clear: none;
}
.styIRS1120ScheduleUTP_styBusinessNameInputFld {   /* Business Name Input Field */
  width: 517px;
  color: black;
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
  border-style: none; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
}
.styIRS1120ScheduleUTP_styEIN {   /* EIN */
  font-size: 7pt;
  text-align: center;
  padding-top: 0px; padding-bottom: 0px; padding-left: 8px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float: left; clear: none;
}
.styIRS1120ScheduleUTP_styEINInputFld {   /* EIN Input Field */
  width: 170px;
  color: black;
  font-family: verdana, arial, sans-serif;
  font-size: 8pt; font-weight: bold;
  text-align:center;
  border-style: none; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
}

.styIRS1120ScheduleUTP_styPartHdr {   /* Part Header */
  font-size: 8pt; font-weight: bold;
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}

.styIRS1120ScheduleUTP_styPartHdrSpanner {   /* Part Header Spanner */
  width: 5px;
  background-color: black;  
   height:14px;
}

.styIRS1120ScheduleUTP_styPartHdrTitle {   /* Part Header Title */
  color: white; background-color: black;  
  height:14px;  
}

.styIRS1120ScheduleUTP_styTableHdr {   /* Table Header */
  font-size: 6pt;
  text-align: center;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  float: left; clear: none;
}
.styIRS1120ScheduleUTP_styIFrame {   /* IFrame for Tables 1 and 2 */
  width: 707px; height: 106px;
  display: block;
}
.styIRS1120ScheduleUTP_styTableContainer {   /* Scrollable Table Container */
  width: 707px;
  float:none; clear:both;  
  overflow-y: auto;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}

.styIRS1120ScheduleUTP_styTable {   /* Table */
  font-size: 7pt;
  text-align: left;
  float:none; clear:both;  
  width:100%
}

.styIRS1120ScheduleUTP_styLeftCell {
  color: black;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.styIRS1120ScheduleUTP_styMiddleCell {
  color: black;
  text-align:center;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.styIRS1120ScheduleUTP_styRightCell {
  color: black;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  border-color:black
}
.styIRS1120ScheduleUTP_styTableLastCol {   /* Last Table Column */
  width: 15px;
  color: white;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  display: none;
}

.styIRS1120ScheduleUTP_styLineItem {   /* Line Item */
  width: 708px;
  font-size: 8pt;
  float: left; clear: left;
}
.styIRS1120ScheduleUTP_styLN {   /* Line Number */
  width: 16px;
  color: black;
  font-weight: bold; text-align: right;
  float:left
}
.styIRS1120ScheduleUTP_styLNRtMargin {   /* Line Number Right Margin */
  width: 16px;
  float:left
}
.styIRS1120ScheduleUTP_styLNDesc {   /* Line Description */
  width: 533px;    
  height:4mm;
  padding-top:0;
  padding-bottom:0;    
  float:left
  }

.styIRS1120ScheduleUTP_styLNBox {   /* Boxed Line Numbers */
  width: 25px;
  font-weight: bold;
  text-align: center;
  border:1 solid black;
  border-top:0;  
  height:4mm;
  float:left
  }

.styIRS1120ScheduleUTP_styLNValBox {   /* Line Value Box */  
  width: 117px;
  border-bottom:1 solid black;  
  height:4mm;  
  float:left
  }
.styIRS1120ScheduleUTP_styLNVal {   /* Line Value */
  width: 117px;   
  font-size: 7pt; 
  text-align: right;  
  float:left
  }

  .styIRS1120ScheduleUTP_styCkbox {   /* Checkbox */
    height: 4mm; width: 4mm;
  }
  .styIRS1120ScheduleUTP_styCkboxText {
    width: 48mm;
    font-size: 7pt;
    text-align: left;
    margin-left: 2mm; margin-right: 0px;
    float: left; clear: none;
  }

.styIRS1120ScheduleUTP_styFormFooter {   /* Form Footer */
  font-size: 7pt;
  text-align: left;
  border-style: solid;
  border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
}
</xsl:template>
</xsl:stylesheet>
