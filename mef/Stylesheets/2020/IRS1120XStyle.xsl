<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS Styles for form 1120 -->

<xsl:template name="IRS1120XStyle">
    .styIRS1120VTImageBox{ /* Vertical image holder box */
      width:5mm;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
      float:left;clear:none;
    }
   
    .styOptTelephoneNo {/*Box for Optional Telephone Number */}
    font-size:6pt;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
 
  	.styEINPhoneNoBox {  /*EIN, and Phone Number Box}*/ }
  	 border-style: solid; border-color: black;
 	 border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;	
 	float: left;clear:none;
 	}
 	
 	.styEINPhoneNo{ /*EIN and Phone Number (other text box if required}*/}
 	 font-size: 6pt;
  	 border-style: solid; border-color: black;
 	 border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;	
 	padding-top: 0px; padding-bottom: 0px; padding-left: 3px; padding-right: 0px;vertical-align: top;
 	float: left;clear:none;
 	}
    		.
   	.styTblCellHeader {   /* Table Cell Header */
	width: 32mm;
	color: black;
	text-align: center;
	border-style: solid;
	border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
	}
	.styTblCell {   /* Table Cell */
	width: 32mm;
	color: black;
	text-align: center;
	border-style: solid ;
	border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}
	.styTblCellNumber{   /* Table Cell */
	width: 6mm;
	color: black;
	font-weight:bold;
	text-align:center;
	border-style: solid ;
	border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
	}		

	.styTblAmountCell {   /* Table Cell */
	width: 31mm;
	color: black;
	text-align: right;
	border-style: solid ;
	border-color: black;
	border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
			
     }
	.styTbl {   /* Table */
	display:table;
	font-size: 6pt;
	text-align: center;
	color: black;
	border-style:solid;
	border-color: black;
	border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
	}
</xsl:template>

</xsl:stylesheet>