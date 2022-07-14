<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="IRS1040Style">
  <!-- CSS Styles Go Here -->
  /* BEGIN PAGE SPECIFIC STYLES */  
      .verticaltext {
         writing-mode: tb-rl;
         filter: flipv fliph;
         float: left;
         clear: none;
      }
      
      .verticaltextflip {
         writing-mode: tb-rl;
         filter: flipv flipv;
         float: left;
         clear: none;
      }

      .styDotBox {
         float: left;
         clear: none;
      	color: black;
      	border-color: black; border-style: dotted;
      	border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
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
      
     .sty1040DepdContainer {   
			border-style: solid; border-color: black;
			border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
			width: 123mm; height:28mm;
			float:left;clear:none;
			overflow-y: auto;
		}  
  /* END PAGE SPECIFIC STYLES */
</xsl:template>
</xsl:stylesheet>



