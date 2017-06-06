<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS8864Style">          
    
    .styIRS8864LNRightNumBoxNBB { 
      width:7mm;
      height:5mm;
      font-weight:bold;
      text-align:center;
      border-left:1 solid black;
      float:left;          
    }  
    
    .styIRS8864LNLeftLtrBox {     
      height:4mm;    
      width:6.5mm;        
      font-weight:bold;
      float:left;        
      text-align:right;
      margin-right:1.5mm      
    }
  
    .styIRS8864LNLeftNumBox {          
      width:8mm;
      font-weight:bold;
      float:left;       
      padding-left:1mm;
          
    }
    .styIRS8864LNLeftNumBoxTop {          
      width:8mm;
      font-weight:bold;
      float:left;       
      padding-left:2.8mm;
          
    }
    
    .styIRS8864LNRightNumBox {    
      height:5mm;    
      width:7mm;
      font-weight:bold;
      text-align:center;
      border-bottom:1 solid black;
      border-left:1 solid black;      
      float:left;         
    }
    
    .styIRS8864InsertLn {    
      height:5mm;  
      font-size:6pt;
      padding-top:0.7mm;    
      float:left;         
    }
    
    .styIRS8864LNAmountBox { 
      width:26mm;
      height:5mm;      
      text-align:right;      
      border-bottom:1 solid black;
      border-left:1 solid black;
      float:left;
      padding-right:0.5mm;          
      font-size:8pt;    
      padding-top:0.7mm          
    }    
    
    .styIRS8864LNAmountBoxNBB {
      width:26mm;
      height:5mm;    
      text-align:right;
      border-left:1 solid black;        
      float:left;
      padding-right:0.5mm;          
      font-size:8pt                  
    }    
          
  </xsl:template>
</xsl:stylesheet>
