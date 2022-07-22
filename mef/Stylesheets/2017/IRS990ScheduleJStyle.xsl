<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for Form 990 -->

<xsl:template name="IRS990ScheduleJStyle">
    .styIRS990ScheduleJRightSideSection { /*Style for sections H, I, and M of information before part one*/
      width:75mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS990ScheduleJRightSideLeftNumBox{ /* Item number to the left of the page for sections H, I, and M of information before part one */
      width:8mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      float:left; clear:none;
    }
    .styIRS990ScheduleJVTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS990ScheduleJLNYesNoBox{ /* Box for storing Yes/No Values */
      width:10mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
   .styIRS990ScheduleJLineContainer {
  clear:both;
  width:188mm;
}
.IRS990ScheduleJLineDesc { /* description space */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;width:156mm;
}

{ /* Line item description */
      width:138mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      float:left; clear: none;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .styIRS990ScheduleJDollarUnderlined {   /* Underline for dollar sign*/
      width:1mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990ScheduleJLNAmountBoxNLB {   /* Amount Box with no left border (only a bottom border)*/
      width:32mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990ScheduleJLNAmountBoxNLBSmall {   /* Small Amount Box with no left border (only a bottom border)*/
      width:25mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-size:6pt;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990ScheduleJTableLB {   /* Table with left border*/
      display:table-header-group;
      font-size: 6pt;
      text-align: left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS990ScheduleJTableCellHeaderLB {   /* Table Cell Header with left border */
      width: 32mm;
      color: black;
      text-align: center;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .styIRS990ScheduleJTableCellLB {   /* Table Cell with left border */
      width: 32mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
    }
    .styIRS990ScheduleJDotSpacing { /* dot line spacing */
 	 letter-spacing:4mm;
}
	.styIRS990ScheduleJLNLeftLtrBoxLI{ /* Item letter to the left of the page with a small left indentation*/
      width:8mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      padding-left:1.5mm;
      font-weight:bold;
      float:left; clear: none;
    }
    .styIRS990ScheduleJUnderlineAmount{ /* Box for storing underlined amounts. */
			width:22mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
			float:left; clear: none;
	}
	.styIRS990ScheduleJShadingCellSmall {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
			width:26mm;
			background-color:lightgrey;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
			float: left; clear: none;
}
 styIRS990ScheduleJTextCell {   /* ll */
			width:36mm;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
			float: left; clear: none;
}
.styIRS990ScheduleJShadingCell {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
			width:72mm;
			background-color:lightgrey;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
			float: left; clear: none;
}
.styIRS990ScheduleJLineIndexMid { /* subline index 2 */
    padding-top:.5mm;
      padding-bottom:.5mm;
 padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}


</xsl:template>

</xsl:stylesheet>
