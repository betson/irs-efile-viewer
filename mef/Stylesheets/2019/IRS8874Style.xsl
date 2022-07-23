<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 6765-->

<xsl:template name="IRS8874Style">
  .styForm8874TBTable{ /* Table with top border*/
    font-size:7pt;
    font-family:verdana;
    font-style: normal;
    font-weight:normal;
    border-top:solid black .75pt;
    border-bottom:solid black .75pt;
    border-right:solid black .75pt;
    padding:0mm
  }
  
  .styForm8874Part1TblContainer {   /* Scrollable Table Container */
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
    width: 186.5mm; height:4.5mm;
    float:none;clear:none;
    overflow-y: auto;
  }
    
    
</xsl:template>

</xsl:stylesheet>