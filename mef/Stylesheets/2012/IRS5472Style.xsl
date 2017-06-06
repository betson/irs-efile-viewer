<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS5472Style">              
                    
    .styIRS5472TextTitle {               
      padding-left:1mm;
      font-weight:bold;
      float:left;  
      width:6mm;                                          
    }                    
    
          
    .styIRS5472LNum {
      width:5mm;  
      padding-right:2mm;        
      float:left;
      clear:left;      
      font-weight:bold;
      text-align:right;      
    }  
          
     
      
    .styIRS5472CenterTxt {
      text-align:center;
      width:100%; 
    } 
    
    .styIRS5472TableContainer {  
      clear:both;        
      overflow-y:auto;
      width:100%;     
      font-size:7.5pt;
      line-height:100%              
    }
    
    .styIRS5472TableContainer2 {    
      clear:both;        
      overflow-y:auto;
      width:187mm;                   
    }
    
    .styIRS5472Table  {  
      display:table-header-group;
      font-size:8pt;            
      width:100%;
      clear:both;    
      text-align:left;
      border-bottom:1 solid black    
    }              
        
    .styIRS5472DotBB {
      border-bottom:1 dashed black;  
      text-align:center;        
    }      
            
  </xsl:template>
</xsl:stylesheet>