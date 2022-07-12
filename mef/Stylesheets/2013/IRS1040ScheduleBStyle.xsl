<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS1040ScheduleBStyle">  


    .stySchBLn1TblContainer {
      overflow-y: auto;
      float:none;clear:none;
      width:161mm;
      border-bottom-width: 0px;
      display:block;
    }
    
    .stySchBLn2TblContainer {
		width:604px;
		float:none;clear:none;
		<!--border-bottom-width: 1px;
		border-top-width: 1px;-->
		overflow-y: auto;
		display:block;
    }

    .stySchBLn5TblContainer {   
			<!-- width:602px; -->
			width:161.5mm;
			padding-top:0mm;
			float:left;clear:none;
			overflow-y: auto;
			display:block;
		}



  </xsl:template>
</xsl:stylesheet>
