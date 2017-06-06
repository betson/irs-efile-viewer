<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form FormT -->

<xsl:template name="IRSFormTStyle">
  .styFormTTablesCells {    
      width: 32mm;      
      text-align: right;
      border-right:1 solid black;
      border-bottom:1 solid black;  
      padding-right:0.5mm;
      padding-left:0.5mm;
      font-size: 7.5pt;
    }  
  .styFormTLnDesc {
      float:left;clear:none;
      padding-top:.5mm;
      padding-bottom:.5mm;
    }
  .styFormTLnDescP1Right { /* Line description for the page 1 right side line items */
      float:left;clear:none;
      padding-top:.5mm;
      padding-bottom:.5mm;
      width:91mm;
    }
  .styFormTLnDescP1Left { /* Line description for the page 1 left side line items */
      float:left;clear:none;
      padding-top:.5mm;
      padding-bottom:.5mm;
      width:90mm;
    }
  .styFormTLnDescPartII { /* Line description for Part II */
      float:left;clear:none;
      padding-top:3.5mm;
      padding-bottom:.5mm;
      height:7mm;
    }
  .styFormTTablesHeaders {     
      text-align: center;
      border-right:1 solid black;
      border-bottom:1 solid black;  
      padding-right:0.5mm;
      padding-left:0.5mm;
      font-weight:bold;
    }  
  .styFormTTable {  
      float:none;
      width: 187mm;
      clear:none;
      overflow-y: auto;
      display:table-header-group;
      font-size: 7.5pt;
      text-align: left;    
    }  
  .styFormTDotLn { /* for dotted lines inside the table */ 
      float:right;font-size:7pt;
      letter-spacing:3.2mm;
      font-weight:bold;    
    }  
  .styFormTDotLnDesc {  /* for dotted lines for the line desc */ 
      float:left;
      letter-spacing:4mm;
      font-weight:bold;    
    }  
  .styFormTDotLnForPartII {  /* for dotted lines for section Part II */ 
      letter-spacing:3.2mm; 
      font-weight:bold; 
      float:left;height:7mm;
      padding-top:3.5mm;
    }  
</xsl:template>

</xsl:stylesheet>