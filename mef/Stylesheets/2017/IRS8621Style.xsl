<?xml version="1.0"?>
<!-- 05/01/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS8621Style">  

    .styIRS8621TableContainer {
      width:187mm;      
      overflow-y:auto;
      clear:both;        
    }          
      
    .styIRS8621FNBox {  
      border-right:1px solid black;
      float: left; 
      width:100mm;
      height:8mm;      
    }                    
    
    .styIRS8621LNRightNumBoxNBB { 
      width:8mm;
      height:4.2mm;
      font-weight:bold;
      text-align:center;      
      border-left:1px solid black;
      float:left;
    }  
    
    .styIRS8621LNRightNumBox {
      width:8mm;
      height:4.2mm;        
      font-weight:bold;
      text-align:center;
      border-bottom:1px solid black;
      border-left:1px solid black;
      float:left; 
      vertical-align:bottom;
    }  
    
    .styIRS8621Part1 {            
      width:7mm;
      float:left;
      clear:left;                
    }
      
    .styIRS8621Part2 {
      width:7mm;      
      float:left;        
      font-weight:bold;
      text-align:right;
      padding-right:2mm;
    }
      
    .styIRS8621Part3 {
      width:7mm;      
      float:left;              
      font-weight:bold;
      text-align:right;
      padding-right:3mm;
    }    
    
    .styIRS8621LNAmountBoxNBB { 
      width:32mm;
      height:4.2mm;      
      text-align:right;
      border-left:1px solid black;
      float:left;
      padding-right:1mm;
      font-size:8pt
    }    
    
    .styIRS8621LNAmountBox { 
      width:32mm;
      height:4.2mm;      
      text-align:right;
      border-bottom:1px solid black;
      border-left:1px solid black;
      float:left;
      padding-right:1mm;
      font-size:8pt
    }    
    
    .styIRS8621LNDesc {      
      width:179mm;  
      float:left;       
    }                   
            
    .styIRS8621FixedUnderline {
      border-bottom:1px solid black;  
      text-align:center;
      width:20mm;            
    }  
      
    .styIRS8621BB {
       width:187mm;
       height:8mm;
       font-size:7pt;
      float:left; 
      border-bottom:1px solid black;
    }         
      
    .styIRS8621Item {    
      width:187mm;    
      padding-left:1mm;        
    }
      
    .styIRS8621P5Td {
      border-left:1px solid black;
      border-bottom:1px solid black;        
      text-align:right;      
      vertical-align:bottom;                
    }  
      
    .styIRS8621P5Th {
      border-left:1px solid black;
      border-bottom:1px solid black;      
      text-align:center;
      width:23.3mm;      
      vertical-align:top;                  
    }  
      
    .styIRS8621P5ItemNo {
      vertical-align:top;
      padding-right:3mm;
      width:3mm;
      font-weight:bold;
      text-align:right;
      height:7.5mm;          
    }
      
    .styIRS8621Table {
      font-size:8.5pt;
      width:100%;    
      display:table-header-group;
      text-align:left;              
    }
      
    .styIRS8621TblLB {
      border-bottom:1px solid black;      
      border-left:1px solid black;
      text-align:right;    
      font-size:8pt  
    }
    
    .styIRS8621DotLn { 
      letter-spacing:3.3mm;
      font-weight:bold;
      float:left;      
    }      
    
    .styIRS8621DotBB {
		border-bottom:1px solid black;	
		text-align:center;
		width:20mm;						
	}	  
  </xsl:template>
</xsl:stylesheet>