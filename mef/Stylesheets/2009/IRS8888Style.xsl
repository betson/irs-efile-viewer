<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for Form 8888 -->

<xsl:template name="IRS8888Style">

  .styIRS8888LnDescOcc{ /* Line description for the various tables in this form*/
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
  
  .styIRS8888SSNBox{ /* Line description for the various tables in this form*/
    width:35mm;
    height:8mm;
    font-size:7pt;
    font-weight: bold;
    padding-left:2mm;
    border-top-width: 0px;
    border-left-width:1px;
   float:left; clear:none;    
    }
  
	.styIRS8888ColBox{ /* Column box */
	width:32mm;
	height:13mm;
	font-size:8pt;
	padding-top:4mm;
	padding-bottom:0mm;
	text-align:right;
	border-style: solid; border-color: black;
	border-top-width: 0px; 
	border-bottom-width: 1px;
	 border-left-width: 1px; 
	 border-right-width: 1px;
	float:left; clear: none;
  }
  	.styIRS8888ColBoxGrey{ /* Column box */
	width:32mm;
	height:13mm;
	padding-top:4mm;
	padding-bottom:0mm;
	text-align:right;
	font-weight:bold;
	border-style: solid; border-color: black;
	border-top-width: 0px; 
	border-bottom-width: 1px;
	border-left-width: 1px; 
	border-right-width: 1px;
	background-color:lightgrey;
	float:left; clear: none;
  }

  
    .styIRS8888TableContainer {   /* Scrollable Table Container */
	 border-style: solid; border-color: black;
	border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
	width: 187mm;
	float:none;clear:none;
	overflow:hidden; 
  }
  
	.styIRS8888TB {   /* Top Border */
		border-style: solid; border-color: black;
		border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
		float: left; clear: left;
}

	.styIRS8888IndividualLetterBox{ /* Item letter to the left of the page */
		width:.5mm;
		height:.5mm;
		padding-top:0mm;
		text-align:center;
		border:1 solid black;
		border-right-width:0;
		clear:none;float:left

}
</xsl:template>
   
</xsl:stylesheet>