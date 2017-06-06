<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS8609AStyle">  
  
    .styIRS8609ScheduleAItemNum {                  
      width:7mm;      
      font-weight:bold;
      text-align:right;
      float:left;    
      padding-right:2.5mm    
    }           
      
    .styIRS8609ScheduleADotLn {
      letter-spacing:3.3mm;
      font-weight:bold;      
      float:left
    }      
      
    .styIRS8609ScheduleALNAmountBox { 
      font-size:8pt;
      width:29.5mm;
      height:4.5mm;
      padding-top:0.5mm;
      padding-right:0.5mm;      
      text-align:right;
      border-bottom:1 solid black;
      border-left:1 solid black;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;  
    }  
    
    .styIRS8609ScheduleALNRightNumBox { 
      width:7mm;
      height:4.5mm;        
      font-weight:bold;
      text-align:center;            
      border-bottom:1 solid black;
      border-left:1 solid black;
      float:left;
      border-style: solid; border-color: black;	
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;	
    }    
    
  </xsl:template>
</xsl:stylesheet>