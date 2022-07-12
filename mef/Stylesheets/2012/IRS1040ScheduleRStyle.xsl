<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- CSS Styles for form 1040ScheduleF -->
  <xsl:template name="IRS1040ScheduleRStyle">
        
    .styForm1040SchREINFullBox{ /*Employer ID complete box*/
      border-style: solid; border-color: black;
      font-size:6pt;
      font-weight: bold;
      float:left;
    }
	.styForm1040SchRLNRightNumBox{ /* Double digit item number to the left of the page */
		width:8mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		float:left; clear:none;
		padding-left:1mm;
	}    
	.styForm1040SchRCkBox{ /* Check box */
		width:8mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		float:left; clear: none;
	}
	.styForm1040SchRColBox{ /* Column box */
		width:32mm;
		height:13mm;
		font-size:7.5pt;
		padding-top:4mm;
		padding-bottom:0mm;
		text-align:right;
		font-weight:bold;
		border-style: solid; border-color: black;
		border-top-width: 0px; 
		border-bottom-width: 1px;
		border-left-width: 1px; 
		border-right-width: 1px;
		float:left; clear: none;
	}	
  	.styForm1040SchRColBoxGrey{ /* Column box */
		width:32mm;
		height:13mm;
		font-size:7.5pt;
		padding-top:4mm;
		padding-bottom:0mm;
		text-align:right;
		font-weight:bold;
		border-style: solid; border-color: black;
		border-top-width: 0px; 
		border-bottom-width: 1px;
		border-left-width: 1px; 
		border-right-width: 1px;
		background-color:lightgrey;
		float:left; clear: none;
	}
		
</xsl:template>
</xsl:stylesheet>
