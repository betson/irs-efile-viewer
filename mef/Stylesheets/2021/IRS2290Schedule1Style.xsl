<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



<xsl:template name="IRS2290Schedule1Style">
  .sty2290Sch1TableCellLast { /* Table cell in last column */
    text-align:center;
    font-weight:bold;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
  }
  
  .sty2290Sch1TableCellBB {   /* Table Cell with only bottom border*/
    text-align: center;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
  }
  
  .sty2290Sch1TableCellCtr {   /* Table Cell that aligns to the center */
    font-weight:bold;
    text-align: center;
    border-style: solid;border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px
  }
  
  .sty2290Sch1BlankLetterBox { /* A blank letter box */
    float:left;clear:none;
    width:5mm;
    height:4.25mm;
    border-color: black; border-style: solid;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px
  }
  .sty2290Sch1LetterBoxSpace { /* Space between letter boxes */
    float:left;clear:none;
    width:0.5mm
  }
       
</xsl:template>

</xsl:stylesheet>