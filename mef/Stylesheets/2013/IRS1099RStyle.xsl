<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--  CSS Styles for form 1099R  -->

<xsl:template name="IRS1099RStyle">
    .styIRS1099RleftBox{ /* Box for left side of form */
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 0px;
      border-left-width: 1px; 
      border-right-width: 0px;
      float:left; 
      clear: none;    }
      
    .styIRS1099RleftBoxWithBottom{ /* Box for left side of form with a bottome line*/
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 1px;
      border-left-width: 1px; 
      border-right-width: 0px;
      float:left; 
      clear: none;    }
    
    .styIRS1099RrightBox{ /* Box for right side of form */
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 0px;
      border-left-width: 1px; 
      border-right-width: 1px;
      float:right; 
      clear: none;    }
    
 
    .styIRS1099RrightBoxWithBottom{ /* Box for right side of form with bottome line*/
      border-style: solid; 
      border-color: black;
      border-top-width: 0px;
      border-bottom-width: 1px;
      border-left-width: 1px; 
      border-right-width: 1px;
      float:left; 
      clear: none;    }
      
    .styIRS1099R_itemLabel{
      font-weight: bold;
      font-size: 7pt;
      font-family: Verdana;
      width: 24px;
      border: 1px;
      border-right: 1px solid black;
      margin: 0px;
      padding: 0px;
      padding-bottom: 0mm;   }
      
    .styIRS1099R_tdRight{
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
      
    .styIRS1099RLNAmountBoxNLB{ /* Amount Box with no left border */
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