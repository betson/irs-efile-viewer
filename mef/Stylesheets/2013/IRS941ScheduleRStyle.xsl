<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template name="IRS941ScheduleRStyle">

.IRS941ScheduleRTableContainer {
  clear:both;
  width:187mm;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  padding-top:0mm;padding-bottom:0mm;
  overflow-y:auto; table-layout:fixed;
}

.IRS941ScheduleR_GenericCellHeader {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  height:22mm;background-color:lightgrey;vertical-align:top;
}

.IRS941ScheduleR_GenericCell {   /* Form Name */
  border-style: solid; border-color: black; font-size:6pt;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  height:6mm;
}

</xsl:template>
</xsl:stylesheet>
