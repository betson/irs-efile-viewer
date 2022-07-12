<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for Form 990 -->

<xsl:template name="IRS990ScheduleLStyle">
    .styIRS990Schedule LRightSideSection { /*Style for sections H, I, and M of information before part one*/
      width:75mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS990Schedule LRightSideLeftNumBox{ /* Item number to the left of the page for sections H, I, and M of information before part one */
      width:8mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-weight:bold;
      float:left; clear:none;
    }
    .styIRS990Schedule LVTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
    .styIRS990Schedule LLNYesNoBox{ /* Box for storing Yes/No Values */
      width:10mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990Schedule LLNDescBB{ /* Line item description */
      width:138mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      float:left; clear: none;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
    }
    .styIRS990Schedule LDollarUnderlined {   /* Underline for dollar sign*/
      width:1mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990Schedule LLNAmountBoxNLB {   /* Amount Box with no left border (only a bottom border)*/
      width:32mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990Schedule LLNAmountBoxNLBSmall {   /* Small Amount Box with no left border (only a bottom border)*/
      width:25mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      font-size:6pt;
      text-align:right;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990Schedule LTableLB {   /* Table with left border*/
      display:table-header-group;
      font-size: 6pt;
      text-align: left;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS990Schedule LTableCellHeaderLB {   /* Table Cell Header with left border */
      width: 32mm;
      color: black;
      text-align: center;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .styIRS990Schedule LTableCellLB {   /* Table Cell with left border */
      width: 32mm;
      color: black;
      text-align: right;
      border-style: solid;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }
    .styIRS990Schedule L_DotSpacing { /* dot line spacing */
 	 letter-spacing:2mm;
}
	.styIRS990Schedule LLNLeftLtrBoxLI{ /* Item letter to the left of the page with a small left indentation*/
      width:8mm;height:4mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      padding-left:1.5mm;
      font-weight:bold;
      float:left; clear: none;
    }
    .styIRS990Schedule LUnderlineAmount{ /* Box for storing underlined amounts. */
			width:22mm;
			padding-top:.5mm;
			padding-bottom:.5mm;
			text-align:right;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
			float:left; clear: none;
	}
	.styIRS990Schedule LShadingCellSmall {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
			width:26mm;
			background-color:lightgrey;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
			float: left; clear: none;
}
 styIRS990Schedule LTextCell {   /* ll */
			width:36mm;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
			float: left; clear: none;
}
.styIRS990Schedule LShadingCell {   /* Small Shading Cell has the same width as styLNAmountBoxSmall */
			width:72mm;
			background-color:lightgrey;
			border-style: solid; border-color: black;
			border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
			float: left; clear: none;
}
.styIRS990Schedule LLineIndexMid { /* subline index 2 */
  padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
  float:left;
  height:4mm;
  width:8mm;text-align:center;font-weight:bold;
}


</xsl:template>

</xsl:stylesheet>
