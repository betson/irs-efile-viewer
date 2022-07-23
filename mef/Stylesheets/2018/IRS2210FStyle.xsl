<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 2210F -->

<xsl:template name="IRS2210FStyle">
    .styIRS2210Box{ /* box around text */
      width:90mm;
      border-style: solid;
      border-color: black;
      border-top-width: 1px; 
      border-bottom-width: 1px; 
      border-left-width: 1px; 
      border-right-width: 1px;
  }
    .styIRS2210Border{ /* add borders */
      width:90mm;
      border-style: solid;
      border-color: black;
      border-top-width: 0px; 
      border-bottom-width: 0px; 
      border-left-width: 0px; 
      border-right-width: 0px;
  }
  
      .styIRS2210VTImageBox{ /* Vertical image holder box */
      height:25mm;
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    
  .styIRS2210DotLn { 
      letter-spacing:3.2mm;
      font-weight:bold; 
      float: left;clear:none;
  }                        

</xsl:template>
</xsl:stylesheet>