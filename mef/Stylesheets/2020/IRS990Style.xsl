<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for Form 990 -->

<xsl:template name="IRS990Style">
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
      width:4mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
     
    }
    .styIRS990LNYesNoBox{ /* Box for storing Yes/No Values */
      width:10mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styIRS990LNDescBB{ /* Line item description */
      width:138mm;height:4mm;
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
  .styIRS990CkBox{
    height: 2mm;
    width: 2mm;
     }
</xsl:template>

</xsl:stylesheet>
