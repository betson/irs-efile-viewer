<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:template name="IRS1040ScheduleDStyle">



.IRS1040ScheduleD_styTableContainer {   /* Scrollable Table Container */
  width: 707px;
  float:none; clear:both;  
  overflow-y: auto;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
}

.IRS1040ScheduleD_styTable {   /* Table */
  font-size: 7pt;
  text-align: left;
  float:none; clear:both;  
  width:100%
}

.IRS1040ScheduleD_styTableCellA {   /* Table Cell (a) */
  width: 158px;   /* 220px;then 60 */
  color: black;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1040ScheduleD_styTableCellB {   /* Table Cell (b) */
  width: 70px;   /* was 87px;to 80 to 77px**/
  color: black;
  text-align:center;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1040ScheduleD_styTableCellC {   /* Table Cell (c) */
  width: 70px;   /* was 87px;to 80 to 77px*/
  color: black;
  text-align:center;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1040ScheduleD_styTableCellD {   /* Table Cell (d) */
  width: 126px;   /* 91px;then 110 */
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1040ScheduleD_styTableCellE {   /* Table Cell (e) */
  width: 126px;   /* 91px; */
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  border-color:black
}
.IRS1040ScheduleD_styTableCellF {   /* Table Cell (f) */
  /*width: 126px;   /* 109px; */
  color: black;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  border-color:black
}

.IRS1040ScheduleD_styTableLastCol {   /* Last Table Column */
  width: 15px;
  color: white;
  text-align: right;
  border-style: solid;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  display: none;
}


.IRS1040ScheduleD_styLN {   /* Line Number */
  width: 16px;   /* 15px; */
  color: black;
  font-weight: bold; text-align: right;
  float:left
}


.IRS1040ScheduleD_styFormFooter {   /* Form Footer */
  font-size: 7pt;
  text-align: left;
  border-style: solid;
  border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
}
</xsl:template>
</xsl:stylesheet>
