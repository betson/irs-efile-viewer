<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 1120S -->

<xsl:template name="IRS1120SStyle">
  .styIRS1120SVTImageBox{ /* Vertical image holder box */
    width:5mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float:left;clear:none;
  }
  .styIRS1120SLNYesNoBox{ /* Box for storing Yes/No Values */
    width:10mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:center;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS1120SBBText{ /* Text that must be underlined */
    padding-top:.5mm;
    padding-bottom:.5mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS1120SLNAmountBoxNLB{ /* Amount Box with no left border */
    width:32mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:right;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS1120SLNLeftLtrBoxTD{ /* Item letter to the left of the page under the three digit number Third Number -- 14a -- */
	width:8mm;height:4mm;
	padding-top:.5mm;
	padding-bottom:.5mm;
	padding-left:4.4mm;
	font-weight:bold;
	float:left; clear: none;
  }
  .styIRS1120SDotLn { 
      letter-spacing:3.2mm;
      font-weight:bold;   
      float:left;
      padding-right:2mm;
  }                        
  .styIRS1120SLNDesc{ /* Line item description */
  	height:4mm;
  	padding-top:.5mm;
  	padding-bottom:.5mm;
  	float:left; clear: none;
  }

</xsl:template>

</xsl:stylesheet>