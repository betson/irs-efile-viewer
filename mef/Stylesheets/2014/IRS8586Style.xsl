<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS8586Style">    
        
      .styIRS8586BotTopBorder {    
        border-bottom:1 solid Black; 
        border-top:1 solid Black;
      }
      
      .styIRS8586BotTopRtBorder {    
        border-right:1 solid Black;
        border-bottom:1 solid Black; 
        border-top:1 solid Black;
      }            
      
      .styIRS8586DotBB {
        border-bottom:1 solid Black;
        float:left;
        text-align:center;        
        width:26mm;        
      }  
      
      .styIRS8586LNRightNumBoxNBB { 
        width:7mm;
        height:4mm;
        font-weight:bold;
        text-align:center;
        border-left:1 solid black;
        float:left;
      }  
      
      .styIRS8586LNLeftLtrBox {     
        height:4mm;    
        width:7mm;
        padding-left:3mm;
        font-weight:bold;
        float:left;
      }
    
      .styIRS8586LNLeftNumBox {  
        height:4mm;    
        width:7mm;
        font-weight:bold;
        float:left; 
        padding-left:1mm;
      }
      
      .styIRS8586LNRightNumBox {    
        height:4mm;    
        width:7mm;
        font-weight:bold;
        text-align:center;
        border-bottom:1 solid black;
        border-left:1 solid black;      
        float:left; 
      }
      
      .styIRS8586LNAmountBox { 
        width:31.75mm;
        height:4mm;      
        text-align:right;      
        border-bottom:1 solid black;
        border-left:1 solid black;
        float:left;
        padding-right:0.3mm;    
        padding-top:0.2mm;        
        font-size:7pt;        
        font-family:verdana;
      }    
      
      .styIRS8586LNAmountBoxNBB {
        width:31.75mm;
        height:4mm;    
        text-align:right;
        border-left:1 solid black;        
        float:left;
        padding-right:0.3mm;    
        padding-top:0.5mm;        
        font-size:7pt;    
        font-family:verdana;    
      }      
            
      .styIRS8586TableContainer {  
        width:187mm;      
        clear:both;            
        padding-left:7mm;  
      }          
      
      .styIRS8586Table {  
        display:table-header-group;
        font-size:8pt;
        width:100%;      
        text-align: left;  
      }  
      
      .styIRS8586DotLn { 
        letter-spacing:3.5mm;
        font-weight:bold;   
        float:left;    
        padding-right:1mm          
      }                    
      
  </xsl:template>
</xsl:stylesheet>
