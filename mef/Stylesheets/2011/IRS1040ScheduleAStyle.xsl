<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 1040 ScheduleA -->

  <xsl:template name="IRS1040ScheduleAStyle">
    .styIRS1040ScheduleADotLn { 
      letter-spacing:3.2mm;
      font-weight:bold;   
      float:left;
      padding-right:.9mm;
      } 
    
    .styIRS1040ScheduleAleftBox{ /* Box for left side of form */
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 0px;
      border-left-width: 1px; 
      border-right-width: 0px;
      float:left; 
      clear: none; 
      }
      
    .styIRS1040ScheduleAleftBoxWithBottom{ /* Box for left side of form with a bottome line*/
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 1px;
      border-left-width: 1px; 
      border-right-width: 0px;
      float:left; 
      clear: none;
      }
    
    .styIRS1040ScheduleArightBox{ /* Box for right side of form */
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 0px;
      border-left-width: 1px; 
      border-right-width: 1px;
      float:right; 
      clear: none;
      }
     
    .styIRS1040ScheduleArightBoxWithBottom{ /* Box for right side of form with bottome line*/
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 1px;
      border-left-width: 1px; 
      border-right-width: 1px;
      float:left; 
      clear: none;
      }  
      
     .styIRS1040ScheduleAlnAmountBox{ /* Box for storing line item amounts. */
    	width:29.5mm;height:1mm;
		padding-top:.2mm;
		padding-bottom:.2mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	  }
	.styIRS1040ScheduleAlnAmountBoxNBB{ /* Amount Box with no bottom border */
		width:29.5mm;height:1mm;
		padding-top:.2mm;
		padding-bottom:.2mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	  } 
	.styIRS1040ScheduleAlnRightNumBox{ /* Right number box */
		width:6mm;height:1mm;
		padding-top:.2mm;
		padding-bottom:.2mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
		}
	.styIRS1040ScheduleAlnRightNumBoxNBB{ /* Right number box with no bottom border*/
		width:6mm;height:1mm;
		padding-top:.2mm;
		padding-bottom:.2mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
		float:left; clear: none;
	    }                     
  </xsl:template>

</xsl:stylesheet>