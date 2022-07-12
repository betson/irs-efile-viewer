<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for Form 2441 -->

<xsl:template name="IRS2441Style">
  .styIRS2441LNDescTbl{ /* Line description for the various tables in this form*/
    width:58mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS2441LNDescTblBB{ /* Line description for the various tables in this form with a bottom border*/
    width:58mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  .styIRS2441LNCellHeader{ /* Cell Header for the various tables in this form */
    width:28mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:center;
    font-weight:bold;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS2441LNCell{ /* Cell for the various tables in this form */
    width:28mm;
    font-size:6pt;
    padding-top:.5mm;
    padding-bottom:.5mm;
    padding-right:1mm;
    text-align:right;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS2441Part2LNCellHeader{ /* Cell Header for the Part 2 table in this form */
    width:28mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:center;
    font-weight:bold;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS2441Part2LNCell{ /* Cell for the Part 2 table in this form */
    width:32mm;
    font-size:6pt;
    padding-top:.5mm;
    padding-bottom:.5mm;
    padding-right:1mm;
    text-align:right;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS2441Part3LNCellHeader{ /* Cell Header for the various Part 3 table in this form */
    width:28mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:center;
    font-weight:bold;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styIRS2441Part3LNCell{ /* Cell for the various Part 3 table in this form */
    width:28mm;
    font-size:6pt;
    padding-top:.5mm;
    padding-bottom:.5mm;
    padding-right:1mm;
    text-align:right;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    float:left; clear: none;
  }
  .styDollarSpan { /* span between the dollar sign and the actual amount value */
    width:3px;
  }
  .styIRS2441PTDesc{ /* Part Description */
    font-size: 9pt; font-weight: bold; width:168mm;
  }
  .styDepTblCellSRD { /* Table cell for Dependency table */
    font-size:6pt;
    padding-top: 4px; padding-bottom: 4px; 
    padding-left: 4px; padding-right: 4px;
    vertical-align: top;border:1 solid black;
    text-align:right;
    vertical-align:bottom; 
    }
  .styDepTblCellRNBSRD { /* Table cell for right number box in Dependency table */
    padding-top: 4px; padding-bottom: 4px; 
    padding-left: 4px; padding-right: 4px;
    vertical-align: top;border:1 solid black;
    text-align:center;
    font-weight:bold;
   vertical-align:bottom; 
    }   
.styIRS2441instructionBoxNBB{ /* Instruction Box with no bottom border */
    width:32mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    text-align:center;
    font-weight:normal;
    border-style: solid; border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
   float:left; clear: none;
}
.styIRS2441SpaceBox{ /* Space Box with no bottom border */
   width:25mm;height:4mm;
   padding-top:.5mm;
   padding-bottom:.5mm;
   text-align:right;
   border-style: solid; border-color: black;
   border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
   float:left; clear: none;
}
.styIRS2441RightSpaceBox{ /* Right Space Box with no bottom border */
   width:48mm;height:4mm;
   padding-top:.5mm;
   padding-bottom:.5mm;
   text-align:right;
   border-style: solid; border-color: black;
   border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
   float:left; clear: none;
}
.styIRS2441TableBox{ /* Table Box with no bottom border */
   width:32mm;height:4mm;
   padding-top:.5mm;
   padding-bottom:.5mm;
   text-align:right;
   border-style: solid; border-color: black;
   border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 0px;
   float:left; clear: none;
}

</xsl:template>

</xsl:stylesheet>