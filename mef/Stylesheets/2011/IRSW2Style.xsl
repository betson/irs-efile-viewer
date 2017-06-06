<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--  CSS Styles for form W2  -->

<xsl:template name="IRSW2Style">
    .styIRSW2leftBox{ /* Box for left side of form */
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 0px;
      border-left-width: 1px; 
      border-right-width: 0px;
      float:left; 
      clear: none;    }
    .styIRSW2leftBoxWithBottom{ /* Box for left side of form with a bottome line*/
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 1px;
      border-left-width: 1px; 
      border-right-width: 0px;
      float:left; 
      clear: none;    }
    
    .styIRSW2rightBox{ /* Box for right side of form */
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 0px;
      border-left-width: 1px; 
      border-right-width: 1px;
      float:right; 
      clear: none;    }
    
 
    .styIRSW2rightBoxWithBottom{ /* Box for right side of form with bottome line*/
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 1px;
      border-left-width: 1px; 
      border-right-width: 1px;
      float:left; 
      clear: none;    }
      
     .styIRSW2_tdRight{
      border-top: 1px solid black;
      border-bottom: 0px;
      border-left: 0px;
      border-right: 0px;
      vertical-align: top;
      padding-top: 0mm;
      padding-bottom: 0mm;  
      padding-left: 0mm;
      padding-right: 0mm;
      text-align: top;
      font-family: Verdana;
      font-size: 7pt;
      width: 46.5mm;
      height: 4mm;    }
      
    .styIRSW2LNAmountBoxNLB{ /* Amount Box with no left border */
     width:32mm;height:4mm;
     padding-top:.5mm;
     padding-bottom:.5mm;
     text-align:right;
     border-style: solid; border-color: black;
     border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
     float:left; clear: none;
     }

        
  </xsl:template>
</xsl:stylesheet>