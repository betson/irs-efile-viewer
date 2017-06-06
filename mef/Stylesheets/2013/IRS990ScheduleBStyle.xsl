<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS990ScheduleBStyle">  

    .styIRS990ScheduleBTblRB {
      border-bottom:1px solid black;
      border-right:1px solid black;
      padding-left:2mm;
      padding-right:1mm;
    }
  
    .styIRS990ScheduleBTblRB2 {
      border-bottom:1px solid black;
      border-right:1px solid black;        
    }      
          
    .styIRS990ScheduleBTable  {
      font-size:7pt;
      width:100%;  
      display:table-header-group;
      text-align:left;                    
    }
  
    .styIRS990ScheduleBTblCell {
      border-bottom:1px solid black;
      padding-left:2mm;
      height:8mm;
    }      
  
    .styIRS990ScheduleBTableContainer {         
      width:187mm;      
      overflow-y:auto;
      clear:both;    
      page-break-before:always        
    }              
          
    .styIRS990ScheduleBDotBB {
      border-bottom:1px solid black;            
      width:90mm;  
      height:8mm;    
      font-size:7pt;
      font-family:verdana;        
    }  
  
    .styIRS990ScheduleBDotBB1 {
      border-bottom:1px solid black;            
      width:70mm;  
      height:1mm;          
    }      
    
    .styIRS990ScheduleBDotLn { 
      letter-spacing:3mm;
      font-weight:bold
    }        
  
    .styIRS990ScheduleBCkbox { 
      height:3.3mm; 
      width:3.3mm;
      margin-right:1mm;
    }              
      
  </xsl:template>  
</xsl:stylesheet>
