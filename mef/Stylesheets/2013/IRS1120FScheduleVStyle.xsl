<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="IRS1120FScheduleVStyle">

    .styIRSIRS1120FScheduleVTableCellSmallRB{ /* Table cell with  no top Bottom  borders */
      width: 25mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .styIRS1120FScheduleVTableCellSmallTB{ /* Table cell with only Top side borders */
      color: black;
      border-style: solid;
      border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    .styIRS1120FScheduleVTableCellSmallBB{ /* Table cell with only Bottom side borders */
      color: black;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .styIRS1120FScheduleVTableContainerNBB {   /* Scrollable Table Container with no bottom border*/
    	border-style: solid; border-color: black;
    	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    	width: 187mm; height:4.5mm;
    	float:none;clear:both;
    	overflow-y: none;
    }  
    
    </xsl:template>
</xsl:stylesheet>
