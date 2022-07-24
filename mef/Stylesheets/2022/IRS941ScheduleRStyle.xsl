<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template name="IRS941ScheduleRStyle">

.IRS941ScheduleRTableContainer {
  clear:both;
  width:256mm;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  padding-top:0mm;padding-bottom:0mm;
  overflow-y:auto; table-layout:fixed;
}

.IRS941ScheduleR_GenericCellHeader { 
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  height:9mm;background-color:lightgrey;vertical-align:top;text-align:center;
}

.IRS941ScheduleR_GenericCell { 
  border-style: solid; border-color: black; font-size:6pt;
  border-top-width: 0px; border-bottom-width: .05px; border-left-width: 1px; border-right-width: 0px;
  height:5mm;text-align:right;padding-right:.5mm;
}
</xsl:template>
</xsl:stylesheet>
