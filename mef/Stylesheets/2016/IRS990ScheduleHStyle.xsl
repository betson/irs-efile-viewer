<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="IRS990ScheduleHStyle">          
    
    
     
.styIRS990ScheduleHTable {   /* Scrollable Table Container */
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
			width: 187mm; height:4.5mm;
			float:none;clear:both;
			overflow-y: auto;
}
 .styIRS990ScheduleHTableContainerNBB {   /* Scrollable Table Container with no bottom border*/
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
			width: 187mm; height:4.5mm;
			float:none;clear:both;
			overflow-y: auto;
  }
  

.styIRS990ScheduleHTheadCell{ /*Header Cell */
    font-size:6.5pt;
    width:25mm;
    font-weight:normal;
    text-align:center;
    display:table-header-group;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  }

.styIRS990ScheduleHCell { /*Cell for amounts */
    font-size:6pt;
    padding-right:.5mm;
    font-weight:normal;
    text-align:right;
    vertical-align:bottom;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px;border-left-width:1px; border-right-width: 0px;
  }


.styIRS990ScheduleHFormHeader {   /* Form Header */
		width: 187mm;
		font-size: 6pt;
		page-break-before: always;
	}
	.styIRS990ScheduleHFormFooter {   /* Form Footer */
		width:187mm;
		font-size: 6pt;
		text-align: left;
		border-style: solid;
		border-top-width: 2px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	}
	
	
	.styIRS990ScheduleHUnderlinedBox{
		width: 28mm;
		font-size: 7pt;
		text-align:center;
		border-style: solid;
		border-top-width: 0px; border-bottom-width: 1px; border-right-width: 0px; border-left-width: 0px;
	}
	
	
.styIRS990ScheduleHUnderlinedText{
		width: 30mm;
		border-style: solid; border-color: black;
		border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
		float: none; clear: none;
	}
		
  .styIRS990SchHVTImageBox{ /* Vertical image holder box */
      width:6mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    
.IRS990ScheduleH_LineContainer {
  clear:both;
  width:187mm;
}

.IRS990ScheduleH_LineIndex { /* line index */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 15px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-align:right;font-weight:bold;
}

.IRS990ScheduleH_LineDesc { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:156mm;
}

.IRS990ScheduleH_LineIndexMid { /* subline index 2 */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}

.IRS990ScheduleH_Checkbox {
  height:4mm;
  width:4mm;
}

  .styIRS990ScheduleHBB {
      width:187mm;
      height:8mm;
      clear:both;
      border-bottom:1 solid black
    }                
        
    .styIRS990ScheduleHBB1 {
      width:100%;
      border-bottom:1 solid black;
      height:8mm;      
      padding-top:1mm;  
     } 

    
      
      
  </xsl:template>
</xsl:stylesheet>