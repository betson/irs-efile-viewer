<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8909-->

  <xsl:template name="IRS8909Style">
    <!-- CSS Styles Go Here -->
    .styIRS8909LNLeftNumBoxSD{ /* Single digit item number to the left of the page */
			width:8mm;height:4mm;
			padding-top: 4mm;
			padding-bottom:.5mm;
			font-weight:bold;
			float:left; clear:none;
			padding-left:2.5mm;
        }
    .styIRS8909LNLeftNumBox{ /* Double digit item number to the left of the page */
			width:8mm;height:4mm;
			padding-top:4mm;
			padding-bottom:.5mm;
			font-weight:bold;
			float:left; clear:none;
			padding-left:1mm;
		}
    .styIRS8909LNDesc{ /* Line item description */
			height:4mm;
			padding-top:4mm;
			padding-bottom:.5mm;
			float:left; clear: none;
		}
	.styShadingCellBox {   /* Shading with a left border box */
			width:8mm;height:8mm;
			background-color:lightgrey;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
			float: left; clear: none;
		}
	.styIRS8909LetterCell { /*Cell for amounts with grey background */
               width:6mm;
               padding-top:.5mm;
               padding-bottom:.5mm;
               font-weight:bold;
               float:left; clear:none;
               padding-left:1mm;
              vertical-align:top;
          }
		
 .styIRS8909TableCellLtr {   /* Table Cell for Letter */
              width: 5mm;
               color: black;
               border-style: solid;
               border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  .styIRS8909TableCellHeaderSmall {   /* Table Cell Header*/
               color: black;
                border-style: solid;
                border-color:black;
                border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
   .styIRS8909TextBB {   /* Table Cell (message) */
                 width: 21mm;
                 font-size: 7pt;
                 font-weight: normal;
                 color: black;
                 text-align: left;
                 border-style: solid;
                  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;bottom-border-width:1px;
  }



  </xsl:template>

</xsl:stylesheet>
