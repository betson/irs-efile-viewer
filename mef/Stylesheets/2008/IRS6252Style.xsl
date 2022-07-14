<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 6252 -->

<xsl:template name="IRS6252Style">
    .styForm6252Attachment{   /* Attachment */
      font-family: "Arial Narrow"; font-size: 7pt;
      margin-left:3mm;
      text-align:left;
    }
  
    .styForm6252INBox{ /*Employer ID number box*/
      font-size:6pt;
      font-weight: bold;
      float:left;
    }
    .styForm6252UnderlineText{ /* Text that must be underlined */
      padding-top:.5mm;
      padding-bottom:.5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;
      float:left; clear: none;
    }
    .styForm6252TableContainer{ /* Table container style */
    	width:175mm; padding-left: 8mm; height:8mm;
    	overflow-y:auto;
    	float:left; clear:none;    
    }

</xsl:template>

</xsl:stylesheet>