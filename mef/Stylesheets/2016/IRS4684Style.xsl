<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="IRS4684Style">

        .styIRS4684ScheduleName{ /* Used for the Schedule A TitleName*/
          height:4mm;width:23mm;
          font-size:8pt;
          font-weight:bold;
          text-align:center;
          float:left;clear:none;
        }
      
        .styIRS4684TableCellSmallRB{ /* Table cell with  no top Bottom  borders */
          width: 25mm;
          color: black;
          text-align: right;
          border-style: solid;
          border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
        }
        
        .styIRS4684TableCellHeaderNoBorders {   /* Table Cell Header */
          width: 32mm;
          color: black;
          text-align: center;
          border-style: solid;
          border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
        }
        .styTableCellNoBorders{   /* Table Cell */
          width: 32mm;
          color: black;
          text-align: right;
          border-style: solid;
          border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
        }
        .styIRS4684TableContainer{ /* Table Container with no border */
          border-style: solid; border-color: black;
				border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
				width: 187mm; height:4.5mm;
				float:none;clear:both;
				overflow-y: auto;
        }

  </xsl:template>
</xsl:stylesheet>
