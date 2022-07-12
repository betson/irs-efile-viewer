<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8936-->

  <xsl:template name="IRS8936Style">
    <!-- CSS Styles Go Here -->
    .styIRS8936TableContainer {   /* Scrollable Table Container */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  width: 187mm;
  float:none;clear:none;
  overflow:hidden; 
  }
  
    .sty8936LNDescHeader{ /* Line item description - shortest width - 8mm Height */
      width:97mm;height:6mm;
      font-weight:normal;
      text-align:left;
      padding-top:1.5mm;
      padding-bottom:1.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }  
    .sty8936HLNAmountBoxTall{ /* Box for storing line item amounts - Short width - 8mm Height */
      width:45mm;height:4mm;
      padding-top:1mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
     .sty8936HLNAmountBoxShort{ /* Box for storing line item amounts - Short width - 8mm Height */
      width:45mm;height:4mm;
      padding-top:1mm;
      padding-right:1mm;
      text-align:right;
      font-weight:normal;
      font-size:6pt;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    } 
    .sty8936HLNRightNumBoxTall{ /* Right number box - 8mm Height */
      width:8mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      text-align:center;
      vertical-align:bottom;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }  
    .sty8936LNDescTallShortest{ /* Line item description - shortest width - 8mm Height */
      width:85mm;height:4mm;
      font-weight:normal;
      text-align:left;
      padding-top:1mm;
      padding-right:1mm;
	  padding-left:2mm;
    }    
    .sty8936LNLeftNumBoxTallDDTwoLines{ /* Double digit item number to the left of the page - 8mm Height with two lines of text description */
      width:6mm;height:4mm;
      padding-top:1mm;
      font-weight:bold;
      text-align:center
    }
  </xsl:template>

</xsl:stylesheet>
