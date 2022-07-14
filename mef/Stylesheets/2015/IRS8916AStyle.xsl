<?xml version="1.0" encoding="UTF-8" ?>
<!-- Last Modified by Eugenia McDonald on 10/05/2011 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- CSS Styles for form 8916A-->
<xsl:template name="IRS8916AStyle">
  .styIRS8916ATheadCell{ /*Header Cell */
    font-size:7pt;
    width:25mm;
    font-weight:normal;
    text-align:center;
    display:table-header-group;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width:0px;
  }
  .styIRS8916ACell { /*Cell for amounts */
    font-size:7pt;
    font-family:arial;
    padding-right:.2mm;
    height:6mm;
    width:25mm;
    font-weight:normal;
    text-align:right;
    vertical-align:middle;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  }
  .styIRS8916AShadedCell { /*Cell for amounts with grey background */
    width:25mm;
    height:6mm;
    background-color:lightgrey;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
  }
  .styIRS8916ANumberCell { /*Cell for amounts with grey background */
    width:8mm;
    height:8mm;
    font-weight:bold;
    float:left; clear:none;
    padding-left:1mm;
    padding-top: 2mm;
    vertical-align:top;
  }
  .styIRS8916ALnNumCell { /*cells for line numbers*/
    width:8mm;
    height:6mm;
    font-weight:bold;
    float:left; clear:none;
    padding-left:1mm;
    vertical-align:top;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width:1px;
  }
  .styIRS8916ATxCell { /*Cell for text */
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
  .styIRS8916AamtCell { /*Cell for amounts */
    font-size:7pt;
    font-family:arial;
    padding-right:.2mm;
    height:6mm;
    width:32mm;
    font-weight:normal;
    text-align:right;
    vertical-align:middle;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width:1px; border-left-width:0px; border-right-width:1px;
  }

  .styIRS8916ATheadCellPt2{ /*Header Cell */
    font-size:7pt;
    width:32.5mm;
    font-weight:normal;
    text-align:center;
    display:table-header-group;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width:1px;
  }
</xsl:template>
</xsl:stylesheet>
