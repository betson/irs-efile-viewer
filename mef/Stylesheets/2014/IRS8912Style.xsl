<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8912-->

  <xsl:template name="IRS8912Style">
    <!-- CSS Styles Go Here -->
    
    .styIRS8912LNLeftLtrBox {     
      height:4mm;    
      width:6.5mm;        
      font-weight:bold;
      float:left;        
      text-align:right;
      margin-right:1.5mm      
    }
  
    .styIRS8912LNLeftNumBox {          
      width:8mm;
      font-weight:bold;
      float:left;       
      padding-left:1mm;          
    }

    .styIRS8912LNRightNumBox {    
      height:4mm;    
      width:8mm;
      font-weight:bold;
      text-align:center;
      border-bottom:1 solid black;
      border-left:1 solid black;      
      float:left;         
    }
    
    .styIRS8912LNAmountBox { 
      width:33mm;
      height:4mm;      
      text-align:right;      
      border-bottom:1 solid black;
      border-left:1 solid black;
      float:left;
      padding-right:0.5mm;          
      font-size:7pt;    
      padding-top:0.7mm          
    }    

   .styIRS8912TextBox{ /* text Box with no border */
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