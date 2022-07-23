<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- CSS Styles for form 4972 -->
  <xsl:template name="IRS4972Style">
  .styIRS4972DotLn{ /* controls dot leaders */
    letter-spacing:3.2mm;
    font-weight:bold;
    float:right;
    clear:none;
    padding-right:3.5mm;
  }

  img.tightRight {
    margin-right:-1mm;
  }
  
  .verylong {
    word-spacing: -0.25em
  }
  
  .overlong {
    word-spacing: -0.130em
  }
  
  .slightlylong {
    word-spacing: -0.05em
  }
  
  .s4972YNLine {
    padding-bottom:0;
    padding-top:0;
    margin-bottom:0;
    margin-top:0;
    font-size:7.0pt;
  }
  
  .sty4972RightNumBox{ /* Right number box */
		width:8mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		font-weight:bold;
		text-align:center;
		vertical-align:bottom;
		border-style: solid; border-color: black;
		border-top-width: 0; border-bottom-width: 0.22mm; border-left-width: 0.22mm; border-right-width: 0;
		float:left; clear: none;
  }

	.sty4972AmountBox{ /* Box for storing line item amounts. */
		width:32mm;height:4mm;
		padding-top:.5mm;
		padding-bottom:.5mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0; border-bottom-width: 0.22mm; border-left-width: 0.22mm; border-right-width: 0;
		float:left; clear: none;
	}
  
	.sty4972TableHeaderBox{ /* Box for storing line item amounts. */
		width:32mm;height:4mm;
		padding-top:2.5mm;
		padding-bottom:.5mm;
		text-align:right;
		border-style: solid; border-color: black;
		border-top-width: 0; border-bottom-width: 0.22mm; border-left-width: 0.22mm; border-right-width: 0;
		float:left; clear: none;
	}
  
  .styIRS4972Box{ /* box around text */ /* unused */
    width:90mm;
    border-style: solid;
    border-color: black;
    border-top-width: 1px; 
    border-bottom-width: 1px; 
    border-left-width: 1px; 
    border-right-width: 1px;
  }
  .styIRS4972Border{ /* add borders */ /* unused */
    width:90mm;
    border-style: solid;
    border-color: black;
    border-top-width: 0px; 
    border-bottom-width: 0px; 
    border-left-width: 0px; 
    border-right-width: 0px;
  }
  
  .styIRS4972VTImageBox{ /* Vertical image holder box */ /* unused */
    height:25mm;
    width:5mm;
    border-style: solid; border-color: black;
    border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;
    float:left;clear:none;
  }
  
  .sty4972Ckbox {   /* Checkbox */
	  width: 3mm;
	  height: 3mm; 
	  margin-bottom:0.4mm;
  }

    .styIRS4972LNYesNoBox{ /* Box for storing Yes/No Values */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;
    }
    .styIRS4972LNYesNoBoxRB{ /* Box for storing Yes/No Values with a right border */
      width:6mm;height:4.5mm;
      padding-top:.5mm;
      padding-bottom:.5mm;
      text-align:center;
      font-weight:bold;
      border-style: solid; border-color: black;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px;
    }


</xsl:template>
</xsl:stylesheet>
