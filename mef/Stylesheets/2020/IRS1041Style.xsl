<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="IRS1041Style">
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
      
      .styRotatedText{ 
		  display:block;
		  -webkit-transform: rotate(90deg);
		  -moz-transform: rotate(90deg);
		  -ms-transform: rotate(90deg);
		  -o-transform: rotate(90deg);
		  transform: rotate(90deg);
		  filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
		  font-weight:bold;
		  writing-mode: tb-rl;
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
      
     .sty1041DepdContainer {   
			border-style: solid; border-color: black;
			border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
			width: 123mm; height:28mm;
			float:left;clear:none;
			overflow-y: auto;
		}  
		
	.styIRS1041HeaderCell { /* Filer Info cell */
		height:7.5mm;
		padding-left:4px;
		border-style:solid;
		border-color:black;
		border-width:0px 1px 1px 0px;
		float:left; clear:none;
	}
  /* END PAGE SPECIFIC STYLES */
</xsl:template>
</xsl:stylesheet>



