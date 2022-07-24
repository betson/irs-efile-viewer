<?xml version="1.0" encoding="UTF-8" ?>
<!-- 05/05/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8865ScheduleO -->

  <xsl:template name="IRS8865ScheduleOStyle">
    .styForm8865ScheduleOFST {   /* Form Main Subtitle */
        font-size: 9pt; font-weight: bold;
        margin-left:3mm;
      }
      
    .styForm8865ScheduleOFN {   /* Form Name */
        font-size:7pt;
        border-style: solid; border-color: black;
        border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
        float: left; clear: none;
    }

    .styForm8865ScheduleOTablesCells {   /* Table Cells */
      font-size: 6pt;
      height: 5mm;
      font-weight: normal;      
      text-align: right;
      border-right:1px solid black;
      border-bottom:1px solid black;  
      padding-right:0.5mm;
      padding-left:0.5mm
    }  

    .styForm8865ScheduleOPartIITableCell {   /* Form8865ScheduleOPartII Table Cell */
      font-size: 6pt;
      height: 5mm;
      font-weight: normal;      
      text-align: right;
      border-right:1px solid black;
      border-bottom:1px solid black;  
      padding-right:0.5mm;
      padding-left:0.5mm;
      padding-top:2.5mm;
      vertical-align:top;      
    }  

    
    .styForm8865ScheduleOTableContainer { /* Part I Table Container */
      width: 187mm; 
      height: 117mm;
      float: none; clear:both;
      overflow-y: auto;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }    
  </xsl:template>

</xsl:stylesheet>