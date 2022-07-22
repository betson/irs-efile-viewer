<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form IRS1120SchM3EliminationsOrAdj -->

<xsl:template name="IRS1120SchM3EliminationsOrAdjStyle">

   .styIRS1120ScheduleM3TheadCell{ /*Header Cell */

  color: black;
  border-style: solid;
  border-color:black;
  border-top-width:0px; border-bottom-width:1px; border-left-width:1px; border-right-width:0px;

  }  
  .styIRS1120ScheduleM3Cell { /*Cell for amounts */
    font-size:7pt;
    font-family:arial;
    padding-right:.5mm;
    width:25mm;
    font-weight:normal;
    text-align:right;
    vertical-align:bottom;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  }

  .styIRS1120ScheduleM3ShadedCell { /*Cell for amounts with grey background */
    width:25mm;
    background-color:lightgrey;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  }

  .styIRS1120ScheduleM3NumberCell { /*Cell for amounts with grey background */
    width:6mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    font-weight:bold;
    float:left; clear:none;
    padding-left:1mm;
    vertical-align:top;
  }
  
  .styIRS1120ScheduleM3_styTable {   /* Table */ Added by WT March 18, 2015
  font-size: 7pt;
  text-align: left;
  float:none; clear:both;  
  width:100%

}

</xsl:template>

</xsl:stylesheet>