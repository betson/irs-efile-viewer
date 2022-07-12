<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 8880 -->

<xsl:template name="IRS8880Style">
  .styIRS8880LongLNDesc{ /* Line item description */
    width:170mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS8880MedLNDesc{ /* Line item description */
    width:139mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  .styIRS8880ShortLNDesc{ /* Line item description */
    width:107mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
  }
  
  .styIRS8880ShortestLNDesc{ /* Line item description */
    width:99mm;height:4mm;
    padding-top:.5mm;
    padding-bottom:.5mm;
    float:left; clear: none;
    
  }
    
  .styIRS8880TheadCellPt0{ /*Header Cell */
    font-size:7pt;
    width:35mm;
    font-weight:normal;
    text-align:center;
    display:table-header-group;
    border-style: solid;
    border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width:1px;
 }
    
  
  .styIRS8880TheadCellPt1{ /*Header Cell */
    font-size:7pt;
    width:98.5mm;
    font-weight:normal;
    text-align:center;
    display:table-header-group;
    border-style: solid;
    border-color: black;
    border-top-width: 1px; border-bottom-width: 0px; border-left-width: 1px; border-right-width:1px;

    }
   .styIRS8880TheadCellPt2{ /*Header Cell */
    font-size:7pt;
    width:35mm;
    font-weight:normal;
    text-align:center;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width:0px;
  }
  .styIRS8880TheadCellPt3{ /*Header Cell */
    font-size:7pt;
    width:31.5mm;
    font-weight:normal;
    text-align:center;
    display:table-header-group;
    border-style: solid;
    border-color: black;
    border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width:0px;

    }
  
   .styIRS8880LargeCell{ /*Second Cell */
    font-size:7pt;
    width:98.5mm;
    font-weight:normal;
    text-align:left;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width:1px;

    }

.styIRS8880TxCell { /*Cell for text */
    height:6mm;
    width:40mm;
    padding-left:2mm;
    vertical-align:top;
    border-style:solid;
    border-color:black;
    border-bottom-width:1px;
    border-left-width:0px;
     border-top-width:0px;
     border-right-width:0px;
  }
 .styIRS8880TheadCell{ /*Header Cell */
    font-size:7pt;
    width:3.5mm;
    font-weight:normal;
    display:table-header-group;
    text-align:center;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width:0px;
  }
  .styIRS8880NumberCellPt0{ /*Header Cell */
    font-size:7pt;
    width:35mm;
     height:2mm;
    font-weight:normal;
    text-align:left;
    display:table-header-group;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width:0px;
 }

.styIRS8880grayCell{ /* Grey Right number box */   
 float:left; clear: none;
}

.styIRS8880NumberCellPt1{ /*Header Cell */
    font-size:7pt;
    width:98.5mm;
    height:2mm;
    font-weight:normal;
    text-align:left;
    display:table-header-group;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width:1px; 
}

</xsl:template>

</xsl:stylesheet>
