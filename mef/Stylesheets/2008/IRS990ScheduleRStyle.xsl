<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for Form 990 -->

<xsl:template name="IRS990ScheduleRStyle">
    .styIRS990RightSideSection { /*Style for sections H, I, and M of information before part one*/
      width:75mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS990RightSideLeftNumBox{ /* Item number to the left of the page for sections H, I, and M of information before part one */
      width:8mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      float:left; clear:none;
    }
    .styIRS990VTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS990ScheduleRPartIIILNYesNoBox{ /* Box for storing Yes/No Values */
      width:8mm;
      padding-top:0mm;
       height:4.9mm;
      padding-bottom:0mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 1px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990ScheduleRLNYesNoBox{ /* Box for storing Yes/No Values */
      width:10mm;
      height:4.5mm;
      padding-top:0mm;
      padding-bottom:0mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
     .styIRS990ScheduleRPartVLNYesNoBox{ /* Box for storing Yes/No Values */
      width:10mm;
      height:4.5mm;
      padding-top:0mm;
      padding-bottom:0mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }



  <!--  .styIRS990ScheduleRLNNoBox{ /* Box for storing Yes/No Values */
      width:10mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: red;
      border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    } -->
    
    .styIRS990ScheduleRLNDescBB{ /* Line item description */
      width:256mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      float:left; clear: none;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .styIRS990DollarUnderlined {   /* Underline for dollar sign*/
      width:1mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990LNAmountBoxNLB {   /* Amount Box with no left border (only a bottom border)*/
      width:32mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990LNAmountBoxNLBSmall {   /* Small Amount Box with no left border (only a bottom border)*/
      width:25mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-size:6pt;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990TableLB {   /* Table with left border*/
      display:table-header-group;
      font-size: 6pt;
      text-align: left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS990TableCellHeaderLB {   /* Table Cell Header with left border */
      width: 32mm;
      color: black;
      text-align: center;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .styIRS990TableCellLB {   /* Table Cell with left border */
      width: 32mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .styIRS990LNLeftLtrBoxLI{ /* Item letter to the left of the page with a small left indentation*/
      width:8mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      padding-left:1.5mm;
      font-weight:bold;
      float:left; clear: none;
    }
    .styIRS990ScheduleRMiddleLineofBox{ /* Item letter to the left of the page with a small left indentation*/
      width:10mm;height:4mm;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      font-weight:bold;
      color:blue;
      clear: none;
    }
    .IRS990ScheduleR_DotSpacing { /* dot line spacing */
  	letter-spacing:2mm;
	}
	.IRS990ScheduleR_LineContainer {
  	clear:both;
  	width:256mm;
	}
	.IRS990ScheduleR_TableContainer {
  	clear:both;
  	width:236mm;
  	border-style: solid; border-color: black;
  	border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  	overflow-y:auto;
	}
	.IRS990ScheduleR_LineDesc { /* description space */
	padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
 	border-style: solid; border-color: black;
  	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  	float:left;
  	height:4mm;width:200mm;
	}
	.IRS990ScheduleR_LineIndex { /* line index */
	padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 15px;
	border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	float:left;
	height:4mm;
	width:8mm;text-align:right;font-weight:bold;
	}
	
	

</xsl:template>

</xsl:stylesheet>
