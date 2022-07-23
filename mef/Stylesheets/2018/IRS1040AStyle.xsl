<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for form 1040 Schd C-EZ -->
<xsl:template name="IRS1040AStyle">
     .sty1040ADepdContainer {   
			border-style: solid; border-color: black;
			border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
			width: 123mm; height:28mm;
			float:left;clear:none;
			overflow-y: auto;
		}
		
	 .styDblBox {   
      	border-style: solid;
      	border-color: black;
      	border-top-width: 2px;
      	border-bottom-width: 2px;
      	border-left-width: 2px;
      	border-right-width: 2px;
      	float: left;
      	clear: none;
      }
      
      .sty1040AShortLine {
		  height:5mm;
		  float:left;
		  clear:none;
		  padding-top:1mm;
		  border-bottom:1px solid black;
      }
      
     .sty1040ALongLine {
		 width:162.5mm;
		 border-bottom:1px solid black
      }
      
      .styIRS1040AHeaderCell { /* Filer Info cell */
		height:7.5mm;
		padding-left:4px;
		border-style:solid;
		border-color:black;
		border-width:0px 1px 1px 0px;
		float:left; clear:none;
	}
 </xsl:template>
</xsl:stylesheet>