<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template name="IRS8902Style">
  <!-- CSS Styles Go Here -->
  /* BEGIN PAGE SPECIFIC STYLES */  
  

    .styForm8902TableCellSmallRB{ /* Table cell with  no top Bottom  borders */
      width: 25mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .styForm8902TableContainer{   /* Scrollable Table Container */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0 px; border-left-width: 0px; border-right-width: 0px;
      width: 187mm; height:100%;
      float:none;clear:none;
      overflow-y: auto;
      padding-left:9mm;
    }
    .styForm8902TableCellNoBorder {   /* Table Cell without left and right borders */
      width: 32mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .styForm8902TableCellHeaderNoBorder {   /* Table Cell Header without left and right borders*/
      width: 12mm;
      color: black;
      text-align: center;
      border-style: solid;
      border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    } 

      .styIRS8902PageBreak {
        page-break-after: always
      }
      .styIRS8902TableContainer {   /* Scrollable Table Container */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      width: 187mm; height:4.5mm;
      float:none;clear:both;
      overflow-y: auto;
    }
    .styIRS8902TableContainer1 {   /* Scrollable Table Container */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      width: 187mm; height:47.6mm;
      float:none;clear:both;
      overflow-y: auto;
    }
    .styIRS8902TableContainer2 {   /* Scrollable Table Container */
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      width: 187mm; height:33mm;
      float:none;clear:both;
      overflow-y: auto;
    }
    
     .styIRS8902LeftLtr {
      width:6mm;  
      padding-right:2mm;        
      float:left;  
      font-weight:bold;
      text-align:right;      
    } 
    
    .styIRS8902Num {
      width:28mm;
      border-bottom:1 solid black;
      text-align:right;
    }    
    .styIRS8902TabCell {
      height:8mm;
      padding-right:1px;
      border-bottom:1 solid black;
      border-right:1 solid black;
    }

    .styIRS8902TabCellThick {
      height:8mm;
      padding-right:1px;
      border-bottom:1 solid black;
      border-right:2px solid black;
   }
  	.sty6Ckbox {   /* Checkbox */
	height: 6mm; width: 6mm;
  }
	.IRS8902Index { /* line index */
 	 padding-top: 0px; padding-bottom: 0px; padding-left: 10mm; padding-right: 15px;
 	 border-style: solid; border-color: black;
 	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
 	float:left;
	height:4mm;
 	width:12mm;text-align:right;font-weight:bold;
}
	.IRS8902LongDesc {  /* line body long format */
  	padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
 	border-style: solid; border-color: black;
 	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
 	float:left;
	height:4mm;width:140mm;
}
	.IRS8902Container {
  	clear:both;
 	 width:188mm;
}
	.IRS8902AmtField { /* Money field end line */
  	 padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
 	 border-style: solid; border-color: black;
 	 border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
 	 float:left;
 	 height:4mm;width:26mm;
 	 text-align:right;
 	 font-size:7pt;
 	 font-family:arial;
 	 padding-right:.5mm
}
	.IRS8902AmtFieldMid { /* Money field middle line */
 	 padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
 	 border-style: solid; border-color: black;
 	 border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
 	 float:left;
 	 height:4mm;
 	 width:26mm;
 	 text-align:right;
 	 font-size:7pt;  
 	 font-family:arial;
}
  .IRS8902AmtFieldMidFiller { /* Money field middle line Filler */
  padding-top: 2px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:26mm;text-align:center;font-size:6pt;
}
  .sty8902TableCellSmallRB{ /* Table cell with  no top Bottom  borders */
      width: 25mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .sty8902TableCellSmallTB{ /* Table cell with only Top side borders */
      color: black;
      border-style: solid;
      border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    }
    .sty8902TableCellSmallBB{ /* Table cell with only Bottom side borders */
      color: black;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .sty8902TableContainerNBB {   /* Scrollable Table Container with no bottom border*/
    	border-style: solid; border-color: black;
    	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    	width: 187mm;
    	float:none;clear:both;
    	overflow-y: none;
    }  
     
  
  /* END PAGE SPECIFIC STYLES */
</xsl:template>
</xsl:stylesheet>



