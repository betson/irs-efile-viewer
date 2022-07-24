<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- CSS Styles for form 1065 -->
	<xsl:template name="IRS1065ScheduleB1Style">
  .styIRS1065SchB1DotLn { 
      letter-spacing:3.2mm;
      font-weight:bold;   
      float:left;
      padding-right:2mm;
  }                        
  .styIRS1065SchB1LNDesc{ /* Line item description */
    height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS1065SchB1LNAmountBoxNLB{ /* Amount Box with no left border */
    width:32mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:right;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS1065SchB1LNLeftLtrBoxTD{ /* Item letter to the left of the page under the three digit number Third Number -- 14a -- */
  width:8mm;height:4mm;
  padding-top:.5mm;
  padding-bottom:.5mm;
  padding-left:4.4mm;
  font-weight:bold;
  float:left; clear: none;
  }


    .styIRS1065SchB1VTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS1065SchB1BBText{ /* Text with a bottom border */
      padding-top:.5mm;
      padding-bottom:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1065SchB1LNPercentBox{ /* Box for percentages */
      width:14mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1065SchB1LNYesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS1065LNSchB1YesNoBoxRB{ /* Box for storing Yes/No Values with a right border */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
      float:left; clear: none;
    }
</xsl:template>
</xsl:stylesheet>
