<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS990ScheduleGStyle">          
    
    .styIRS990ScheduleGSchAP1 {
      height:4.7mm;    
      width:33mm;      
      font-size:8pt;
      text-align:right;      
      border-bottom:1 solid black;
      border-left:1 solid black;      
      float:left;         
    }
      
    .styIRS990ScheduleGSchDP3 {  
      height:4.5mm;              
      width:23mm;      
      font-size:7pt;      
      border-bottom:1 solid black;
      border-left:1 solid black;      
      float:left;   
      padding-top:0.5mm;
      text-align:center      
    }
      
  .styIRS990ScheduleGTable {   /* Scrollable Table Container */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      width: 187mm; height:4.5mm;
      float:none;clear:both;
      overflow-y: auto;
    }

  .styIRS990ScheduleGTableContainerNBB {   /* Scrollable Table Container with no bottom border*/
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      width: 187mm; height:4.5mm;
      float:none;clear:both;
      overflow-y: auto;
    }
  
    .IRS990ScheduleG_DotSpacing { /* dot line spacing */
      letter-spacing:4mm;
      font-weight:bold;
    }
    
    .IRS990ScheduleG_TableContainer {
      width:187mm;
      border-style: solid; border-color: black;
      border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:none;clear:both;
      overflow-y:auto;
    }

    .IRS990ScheduleG_GenericCell {   /* Form Name */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      padding-left:1mm;padding-right:1mm;  
    }

    .styIRS990ScheduleGYesBox {    
      height:4mm;    
      width:7mm;      
      text-align:center;
      border-right:1 solid black;
      border-left:1 solid black;      
      float:left;   
      border-bottom:1 solid black;  
      font-size:7.5pt      
    }    
    
    .styIRS990ScheduleGNoBox {            
      width:7mm;    
      height:4mm;        
      text-align:center;        
      float:left; 
      border-bottom:1 solid black;    
      font-size:7.5pt      
    }  
    
    .styIRS990ScheduleGDimYesBox {    
      height:4mm;    
      width:7mm;      
      background-color:lightgrey;
      border-right:1 solid black;
      border-left:1 solid black;      
      float:left;                 
    }  
        
    .styIRS990ScheduleGDimNoBox {  
      height:4mm;            
      width:7mm;      
      background-color:lightgrey;              
      float:left;             
    }                      
    
    .styIRS990ScheduleGLNLeftLtrBox {         
      width:6mm;        
      font-weight:bold;
      float:left;        
      text-align:right;
      padding-right:1mm;        
      clear:left
    }
    
    .styIRS990ScheduleGLNLeftNumBox {          
      width:4mm;
      font-weight:bold;
      float:left;     
      text-align:left;  
      clear:left;    
    }    
          
    .styIRS990ScheduleGTblRB {
      border-bottom:1 solid black;
      border-right:1 solid black;                  
    }  
    
    .styIRS990ScheduleGTblRB2 {
      border-bottom:1 solid black;
      border-left:1 solid black;    
      font-size:7pt; 
      height:4.5mm    
    }            
    
    .styIRS990ScheduleGYNChxBoxDiv { 
      float:right; 
      padding-right:1.5mm
    }              
          
    .styIRS990ScheduleGChxBoxDiv { 
      float:left;
      margin-right:1mm;     
      clear:left      
    }   
    
    .IRS990ScheduleG_TableCell {   /* Form Name */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      padding-right:.5mm;  
    }

    .styIRS990ScheduleGImg {
      width: 6mm;
      border-style: solid;
      border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px;  border-right-width: 1px;
      float: left; clear: none;
    }
    .styIRS990ScheduleGLineItem {  /* Line Item */
      width: 187mm;
      font-size: 7pt;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      float: none; clear: both;
    }
    .styIRS990ScheduleGLNLeftNumBox {
      width: 3mm;
      text-align: right;
      height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      float:left; clear:none;
      padding-left:1mm;
    }
    .styIRS990ScheduleGLNLongDesc {   /* Line Description */
      width: 164mm;
      font-size: 6pt;
      height:4.5mm;
      margin-left:3mm; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      float: left; clear: none;
    }
    .styIRS990ScheduleGTableCellPad {   /* Table Cell Padding */
      width: 4px;
    }
    .styIRS990ScheduleGTableCellA {   /* Table Cell (a or 1) */
      width: 58mm;
      font-size: 7pt;
      font-weight: normal;
      color: black;
      text-align: left;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    .styIRS990ScheduleGTableCellB {   /* Table Cell (b or 2) */
      width: 35mm;
      font-size: 7pt;
      font-weight: normal;
      color: black;
      text-align: left;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    .styIRS990ScheduleGTableCellC {   /* Table Cell (c or 3) */
      width: 30mm;
      font-size: 7pt;
      font-weight: normal;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    .styIRS990ScheduleGTableCellD {   /* Table Cell (d) */
      width: 34mm;
      font-size: 7pt;
      font-weight: normal;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    .styIRS990ScheduleGTableCellE {   /* Table Cell (e) */
      width: 30mm;
      font-size: 7pt;
      font-weight: normal;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    .styIRS990ScheduleGTableCellYesNo {
      width: 11mm;
      font-family:arial;
      font-size: 8pt;
      font-weight: bold;
      color: black;
      text-align: center;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    .styIRS990ScheduleGNBSP{
      width: 16px;
      font-weight: bold;
    }
    .styIRS990ScheduleGFormHeader {   /* Form Header */
      width: 187mm;
      font-size: 6pt;
      page-break-before: always;
    }
    .styIRS990ScheduleGFormFooter {   /* Form Footer */
      width:187mm;
      font-size: 6pt;
      text-align: left;
      border-style: solid;
      border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    .styIRS990ScheduleGYesNoBox {
      width: 7mm;
      text-align: center;
      height:4.5mm;
      padding-top:0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
      float:left; clear: none;
      font-size: 8pt;
      font-weight: bold;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS990ScheduleGCkBox{
      height: 4mm;
      width: 4mm;
    }
    .styIRS990ScheduleGCkBoxText {
      width: 48mm;
      font-size: 7pt;
      text-align: left;
      margin-left: 2mm; margin-right: 0px;
      float: left; clear: none;
    }
    .styIRS990ScheduleGUnderlinedBox{
      width: 28mm;
      font-size: 7pt;
      text-align:center;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px;
    }
    .styIRS990ScheduleGSignatureText{ /* Text containing instructions for signatures */
      text-align:left;
      float:left; clear: none;
    }
    .styIRS990ScheduleGSignatureBox{ /* Box for signature fields */
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left; clear: none;
    }
    .styIRS990ScheduleGRetDiscussBox {   /* IRS Return Discussion Permission Box */
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 3px; border-bottom-width: 3px; border-left-width: 3px; border-right-width: 3px;
      float: left; clear: none;
    }
    .styIRS990ScheduleGLeftBox{ /* Box on left holding instructions */
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }


    .styIRS990ScheduleGLNDesc{ /* Box on left holding instructions */
      width: 51mm;
      height: 4.5mm;
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      padding-bottom:.5mm;
      float:left;clear:none;
    }
  
  .styIRS990ScheduleGShadingCell {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
      width:25mm;
      height: 4.5mm;
      background-color:lightgrey;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float: left; clear: none;
    }
  .styIRS990ScheduleGUnderlinedText{
    width: 30mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    float: none; clear: none;
    }
  .styIRS990ScheduleGLNAmountBox {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
      width:25mm;height:5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
      font-size:6pt;
    }
    .styIRS990ScheduleGFormLinkBox {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
      width:4mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    
  .styIRS990ScheduleGVTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    
    .IRS990ScheduleG_LineContainer {
      clear:both;
      width:188mm;
    }

    .IRS990ScheduleG_LineIndex { /* line index */
      padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 15px;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
      float:left;
      height:4mm;
      width:8mm;text-align:right;font-weight:bold;
    }

    .IRS990ScheduleG_LineDesc { /* description space */
      padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;
      height:4mm;width:156mm;
    }

    .IRS990ScheduleG_LineIndexMid { /* subline index 2 */
      padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left;
      height:4mm;
      width:8mm;text-align:center;font-weight:bold;
    }

    .IRS990ScheduleG_Checkbox {
      height:4mm;
      width:4mm;
    }
      
  </xsl:template>
</xsl:stylesheet>