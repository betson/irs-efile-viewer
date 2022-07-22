<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for Form 2106 -->

<xsl:template name="IRS2106Style">
  .styIRS2106LnDescOcc{ /* Line description for the various tables in this form*/
    width:62mm;
    height:8mm;
    font-size:7pt;
    padding-left:2mm;
    border-style: solid;
    border-color: black;
    border-right-width: 1px;
    border-top-width: 0px;
   border-left-width: 0px;
   border-bottom-width: 0px;
   float:left; clear:none;    
  }
  
  .styIRS2106SSNBox{ /* Line description for the various tables in this form*/
    width:35mm;
    height:9mm;
    font-size:7pt;
    font-weight: bold;
    padding-left:2mm;
    border-top-width: 0px;
    border-left-width:1px;
   float:left; clear:none;    
    }
  
	.styIRS2106ColBox{ /* Column box */
	width:32mm;
	height:13mm;
	font-size:7.5pt;
	padding-top:4mm;
	padding-bottom:0mm;
	text-align:right;
	font-weight:normal;
	border-style: solid; border-color: black;
	border-top-width: 0px; 
	border-bottom-width: 1px;
	 border-left-width: 1px; 
	 border-right-width: 1px;
	float:left; clear: none;
  }
  	.styIRS2106ColBoxGrey{ /* Column box */
	width:32mm;
	height:13mm;
	font-size:7.5pt;
	padding-top:4mm;
	padding-bottom:0mm;
	text-align:right;
	font-weight:normal;
	border-style: solid; border-color: black;
	border-top-width: 0px; 
	border-bottom-width: 1px;
	border-left-width: 1px; 
	border-right-width: 1px;
	background-color:lightgrey;
	float:left; clear: none;
  }

  
    .styIRS2106TableContainer {   /* Scrollable Table Container */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
  width: 187mm;
  float:none;clear:none;
  overflow:hidden; 
  }
  
.styIRS2106TB {   /* Top Border */
	border-style: solid; border-color: black;
	border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	float: left; clear: left;
}


</xsl:template>

</xsl:stylesheet>