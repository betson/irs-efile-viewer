<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS8900Style">          
    
    .styIRS8900LNRightNumBoxNBB { 
      width:7mm;
      height:4mm;
      font-weight:bold;
      text-align:center;
      border-left:1 solid black;
      float:left;          
    }  
    
    .styIRS8900LNLeftLtrBox {     
      height:4mm;    
      width:6.5mm;        
      font-weight:bold;
      float:left;        
      text-align:right;
      margin-right:1.5mm      
    }
  
    .styIRS8900LNLeftNumBox {          
      width:8mm;
      font-weight:bold;
      float:left;       
      padding-left:1mm;          
    }
    .styIRS8900LNLeftNumBoxTop {          
      width:8mm;
      font-weight:bold;
      float:left;       
      padding-left:2.8mm;          
    }

    .styIRS8900LNRightNumBox {    
      height:4mm;    
      width:7mm;
      font-weight:bold;
      text-align:center;
      border-bottom:1 solid black;
      border-left:1 solid black;      
      float:left;         
    }
    
    .styIRS8900InsertLn {    
      height:4mm;  
      font-size:6pt;
      padding-top:0.7mm;    
      float:left;         
    }
    
    .styIRS8900LNAmountBox { 
      width:26mm;
      height:4mm;      
      text-align:right;      
      border-bottom:1 solid black;
      border-left:1 solid black;
      float:left;
      padding-right:0.5mm;          
      font-size:7pt;    
      padding-top:0.7mm          
    }    
    
    .styIRS8900LNAmountBoxNBB {
      width:26mm;
      height:4mm;    
      text-align:right;
      border-left:1 solid black;        
      float:left;
      padding-right:0.5mm;          
      font-size:7pt                  
    }    
          
    .styForm8900TBTable{ /* Table with top border-Ravi Venigalla 02/21/03 */
     font-size:7pt;
     font-family:verdana;
     font-style: normal;
     font-weight:normal;
     border-top:solid black .75pt;
     border-bottom:solid black .75pt;
     border-right:solid black .75pt;
     padding:0mm
  }

  </xsl:template>
</xsl:stylesheet>
