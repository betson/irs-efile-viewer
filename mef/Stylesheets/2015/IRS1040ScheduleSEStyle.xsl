<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- CSS Styles for form 1040ScheduleSE -->
  <xsl:template name="IRS1040ScheduleSEStyle">
        
    .styForm1040ScheduleSEEINFullBox{ /*Employer ID complete box*/
      border-style: solid; border-color: black;
      font-size:6pt;
      font-weight: bold;
      float:left;
    }
    .styIRS1040ScheduleSEBox{ /* box around text */
      width:90mm;
      border-style: solid;
      border-color: black;
      border-top-width: 1px; 
      border-bottom-width: 1px; 
      border-left-width: 1px; 
      border-right-width: 1px;
     
  }
 .styIRS1040ScheduleSEBorder{ /* add borders */
      width:90mm;
      border-style: solid;
      border-color: black;
      border-top-width: 0px; 
      border-bottom-width: 0px; 
      border-left-width: 0px; 
      border-right-width: 0px;
      
  }
   
 .styIRS1040ScheduleSEBorder2{ /* add borders */
      width:90mm;
      border-style: solid;
      border-color: black;
      border-top-width: 0px; 
      border-bottom-width: 0px; 
      border-left-width: 0px; 
      border-right-width: 0px;
      float:left; clear: none;
  }
  
  .styIRS1040ScheduleSEBox2{ /* box around text */
      width:90mm;
      border-style: solid;
      border-color: black;
      border-top-width: 1px; 
      border-bottom-width: 1px; 
      border-left-width: 1px; 
      border-right-width: 1px;
      float:left; clear: none;
  }
  
  .styIRS1040ScheduleSEDotLn {
		float:right; clear:none;
		text-align:right;
		padding-right:3mm;
		letter-spacing:13px;
		font-weight:bold;
		skiplink:display:none;
  }
</xsl:template>
</xsl:stylesheet>
