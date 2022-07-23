<?xml version="1.0"?>
<!-- 05/05/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS8865SchedulePStyle">  

    .styIRS8865SchedulePTblRB {
      border-bottom:1px solid black;
      border-right:1px solid black;      
    }        
    
    .styIRS8865SchedulePTable {
      display:table-header-group;
      text-align:left;      
      font-size:7pt;
      width:100%;                  
    }
    
    .styIRS8865SchedulePTblCell {
      border-bottom:1px solid black;      
      height:8mm;
    }    
    
    .styIRS8865SchedulePTableContainer {   /* Scrollable Table Container */
      width:187mm;      
      overflow-y:auto;
      clear:both;  
      border-bottom:1px solid black;      
    }    
              
    .styIRS8865SchedulePBB {
      width:187mm;
      height:8mm;
      clear:both;
      border-bottom:1px solid black
    }                
        
    .styIRS8865SchedulePBB1 {
      width:100%;
      border-bottom:1px solid black;
      height:8mm;      
      padding-top:1mm;  
     }      
            
  </xsl:template>
</xsl:stylesheet>
