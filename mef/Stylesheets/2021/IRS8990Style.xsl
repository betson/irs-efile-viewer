<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="IRS8990Style">

  .sty8990DotLn {
    letter-spacing:3.1mm;
    font-weight:bold;
    float:right;
    padding-right:2px;
  }
  
  .sty8990SectionLn {
    padding:1.5mm 0.5mm 2.5mm 0.5mm;
    font-weight:bold;
    font-size:8pt;
    width:187mm;
    height:auto;
    display:block;clear:both;
    border-style:solid;border-color:black;
    border-width:1px 0px;
  }
  
  .sty8990BlockLn {
    padding:1.5mm 0.5mm 2.5mm 0.5mm;
    font-weight:bold;
    text-align:center;
    width:187mm;
    height:auto;
    display:block;clear:both;
    border-style:solid;border-color:black;
    border-width:1px 0px;
  }
  
  .sty8990InstructionLn {
    width:187mm;height:auto;
    display:block;clear:both;
    padding:0.5mm;
    font-style:italic;
  }
  </xsl:template>

</xsl:stylesheet>