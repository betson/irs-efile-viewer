<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS926Style">  

    .styIRS926TblRB {
      border-bottom:1px solid black;
      border-right:1px solid black;
      padding-left:2mm; 
      width:104mm;      
    }
  
    .styIRS926TblRT {
      border-top:1px solid black;
      border-right:1px solid black;
    }
  
    .styIRS926OL {      
      width:8mm;    
      padding-left:1mm;
      padding-right:1.5mm;  
      float:left;      
      clear:none;
      font-weight:bold;
      text-align:left;        
    }        
    
    <!-- Created the Part2 bottom border style template because styBB, with it's use of the float and clear attributes, was causing an unusual printing issue -->
    .styIRS926Part2BB {     
      width:187mm;
      border-style: solid; 
      border-color:black; 
      border-top-width:0px; 
      border-bottom-width: 1px; 
      border-left-width: 0px; 
      border-right-width: 0px;
    }

    
    .styIRS926InerTable {    
      font-size:8.5pt;  
      width:187mm;  
      border-top:1px solid black;              
    }
  
    .styIRS926Table {  
      font-size:8.5pt;      
      width:100%;    
      display:table-header-group;
      text-align:left;                  
    }
  
    .styIRS926TblCell {
      border-bottom:1px solid black;
      padding-left:2mm;
      height:8mm;
	  width:83mm;
    }    
  
    .styIRS926DotLn {
      letter-spacing:3.3mm;
      font-weight:bold;         
      float:left
    }
  
    .styIRS926TableContainer {   
      width:187mm;          
      overflow-y:auto;
      clear:both;          
    }        
  
    .styIRS926BB {
      width:100%;
      border-bottom:1px solid black;
      height:8mm;
      padding-left:8mm;
      font-size:6pt;
      padding-top:4mm;     
     }  
  
   .styIRS926TableThead{ /* Style for HTML 'thead' element  */
    display:table-header-group;
  }
  
   .styIRS926TableCellLine {  
    width: 17mm;
    padding-left:0mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: left;
    border-color: black;
    border-style: solid;
    vertical-align: bottom;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
  
   .styIRS926TableCellA {   /* Table Cell (a or 1) */
    width: 18mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    border-color: black;
    text-align: center;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
    .styIRS926TableCellAForRow2 {   /* Table Cell (a or 1)  for tableRow2cell for SRD*/
    width: 18mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    border-color: black;
    text-align: center;
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }

  .styIRS926TableCellB {   /* Table Cell (b or 2) */
    width: 38mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: leftt;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
    .styIRS926TableCellBForRow2 {   /* Table Cell (b or 2) */
    width: 38mm;
    font-size: 7pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: left;
    border-color: black;
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }


  .styIRS926TableCellC {   /* Table Cell (b or 2) */
    width: 38mm;
    font-size: 6pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: right;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
    .styIRS926TableCellCForRow2 {   /* Table Cell (b or 2) */
    width: 38mm;
    font-size: 6pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: right;
    border-color: black;
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }

  .styIRS926TableCellD {   /* Table Cell (d or 4) */
    width: 32mm;
    font-size: 6pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: right;
    border-color: black; 
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }
    .styIRS926TableCellDForRow2 {   /* Table Cell (d or 4) for SRD*/
    width: 32mm;
    font-size: 6pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: right;
    border-color: black; 
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  }

  .styIRS926TableCellE {  
    width: 32mm;
    font-size: 6pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
    .styIRS926TableCellEForRow2 {  /*For SRD */
    width: 32mm;
    font-size: 6pt;
    height: 4mm;
    font-weight: normal;
    color: black;
    text-align: center;
    border-color: black;
    border-style: solid;
    background-color: <xsl:value-of select="$UserPref/View/TableRow2BgColor"/>;   /* set in User Preferences */
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }





  </xsl:template>
</xsl:stylesheet>