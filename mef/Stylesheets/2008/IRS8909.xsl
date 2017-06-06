<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8909Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8909" />


<xsl:template match="/">
<html>
<head>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8909"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">  
      <xsl:call-template name="IRS8909Style"></xsl:call-template>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8909">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;height: 20mm;">
    <div class="styFNBox" style="width:31mm;font-size: 7pt;height: 22mm;">
      Form <span class="styFormNumber">8909</span>      
      <br/>
      <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span>  
      <br/>
      <br/>
      <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="height: 22mm;width:125mm;padding-top:4mm;">
      <div class="styMainTitle" style="height: 8mm">Energy Efficient Appliance Credit</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold">
        <img src="{$ImagePath}/8909_Bullet.gif" alt="MediumBullet"/>  
        Attach to your tax return. <br/><br/>

        <br/>
      </div>
    </div>
    <div class="styTYBox" style="width:30mm;height:22mm; border-left-width: 1px;">
      <div class="styOMB" style="height:2mm;">OMB No. 1545-2055</div>
      <div class="styTaxYear" style="height:10mm">20<span class="styTYColor">08</span></div>
      <div class="stySequence">Attachment<br/>Sequence No. <b>159</b></div>
    </div>
  </div>
  <!--  End title of Form  -->
    
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:141mm;font-weight:normal;font-size:7pt;">
      Name(s) shown on return<br/>
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>      
    </div>
    <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">Identifying number
      <br/><br/>
      <span style="font-weight:normal;">  
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>
      </span>    
    </div>
  </div>  
  <!--  End Name and Employer indentification number  -->
					<!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;">Part I</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
          Dishwashers (see instructions)</div>
					</div>
					<!-- END PART I TITLE -->  
  
<div style="width:187mm;">

  <table cellspacing="0" cellpadding="0" style="font-size:7pt;float:right;">
     	<tr>      
                   	 <td style="background-color:gray;width:22px;border-left:1px solid black;height:7mm;border-top:1px solid black;border-bottom:1px solid black;border-right:0px;border-top:0px;"><span style="width:1px;"/></td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:118px;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:8pt;border-top:1px solid black;border-top:0px;">(a) Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:118px;border-right-width:1px;font-weight:bold;font-size:8pt;border-top:1px solid black;border-top:0px;;">(b) Type B</td>
                   	 <td style="background-color:gray;width:119px;border-right:solid black 1px;border-top:1px solid black;border-right:0px;border-top:0px;"><span style="width:1mm"/></td>                   	 
        </tr>
                   	 
                   	 <!-- row 1 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:7mm;font-size:7pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;border-top:0px">1</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/NumEligibleDishwashersTypeA"/>
     			         </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/NumEligibleDishwashersTypeB"/>
     			         </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;border-top:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 2 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:7mm;font-size:7pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">2</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgNumDshwshrPrdPr2YrsTypeA"/>
     			       </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgNumDshwshrPrdPr2YrsTypeB"/>
     			         </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 

                   	  <!-- row 3 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:7pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">3</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubLn2aFrmLn1aTypeA"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubLn2bFrmLn1bTypeB"/>
     			         </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 4 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:7pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">4</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                   	  $45.00
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                          $75.00                   
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 5 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:7pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">5</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/MultLn3aByLn4aTypeA"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/MultLn3bByLn4bTypeB"/>
     			         </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-bottom:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
  </table>
  
  
  
<div style="float:left;width:323px;">
  <br/>
  <br/>
    <!-- line 1 -->
    <div style="width:323px;padding-top:2px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">1</div>
		  <div style="padding-left:1mm;float:left;font-size:7pt;">Enter the number of eligible dishwashers produced in calendar year 2008
				<span class="styBoldText">
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.          
					 <span style="width:16px"></span>.
				</span>
		  </div>
      </div>
    <!-- end line 1 -->
    
    <!-- line 2 -->
    <div style="width:323px;padding-top:2px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">2</div>
		  <div style="padding-left:1mm;float:left;font-size:7pt;">Enter the average number of eligible dishwashers produced in the 2 prior calendar years<span class="styBoldText">
			<span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.                          
				 <span style="width:16px"></span>.
			</span>
      </div>
      
    </div>
    <!-- end line 2 -->
    <!-- line 3 -->
    <div style="width:323px;padding-top:3px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">3</div>
		  <div style="padding-left:1mm;float:left;font-size:7pt;">Subtract line 2 from line 1
				<span class="styBoldText">
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
				</span>
		  </div>
      
    </div>
    <!-- end line 3 -->
    <!-- line 4 -->
    <div style="width:323px;padding-top:1px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">4</div>
      <div style="padding-left:1mm;float:left;font-size:7pt;">Applicable amount
				<span class="styBoldText">
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
				</span>
      </div>
      
    </div>
    <!-- end line 4 -->
    <!-- line 5 -->
    <div style="width:323px;padding-top:0px;">
      <div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">5</div>
      <div style="padding-left:1mm;float:left;font-size:7pt;">Multiply line 3 by line 4
				<span class="styBoldText">
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
				</span>
      </div>
      
    </div>
    <!-- end line 5 -->
    </div>
    </div>
 
   <!--  Line 6 -->    
  <div class="styBB" style="width: 187mm;">  
  	<div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:5px;">6</div>
     <div style="float:left; padding-top:1mm;padding-left:1mm;">
     Add the amounts on line 5 in columns (a) and (b)
    	</div>    
    <div style="float:right;">
    	<div class="styDotLn" style="padding-top:1mm;" > ..................</div>    
     	<div class="styLNRightNumBox" style="padding-top:1mm;height:3.5mm;border-bottom-width:0px;">6</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;height:3.5mm;border-bottom-width:0px;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeCrdtforDishwshrs"/>
     			 </xsl:call-template> 
     		</div>          
    </div>
  </div>
  <!--  Line 6 -->
					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
          Clothes Washers (see instructions)</div>
					</div>
					<!-- END PART II TITLE -->  
					
<div style="width:187mm;">

  <table cellspacing="0" cellpadding="0" style="font-size:7pt;float:right;">
     	<tr>      
                   	 <td style="background-color:gray;width:18px;border-left:1px solid black;height:8mm;border-top:0px solid black;border-bottom:1px solid black;border-right:0px; "><span style="width:1px;"/></td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:85px;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black; ">(a) Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:85px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black;">(b) Type B</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:85px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black;">(c) Type C</td>
                    	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:85px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(d) Type D</td>
                   	 <td style="background-color:gray;width:86px;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>                   	                   	                    	 
                   	 </tr>
                   	 
                   	 <!-- row 7 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">7</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeAClothesWashersProdcd"/>
     			     </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeBClothesWashersProdcd"/>
     			     </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeCClothesWashersProdcd"/>
     			     </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                    	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeDClothesWashersProdcd"/>
     			     </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>                     
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 8  -->
                   	 <tr>
                  	 <td valign="bottom" style="height:9.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">8</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblClothesWasherTypA"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblClothesWasherTypB"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblClothesWasherTypC"/>
     			 </xsl:call-template>                       
                        <span style="width:1px;"/>
                      </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblClothesWasherTypD"/>
     			 </xsl:call-template>                       
                        <span style="width:1px;"/>
                      </td>                      
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 

                   	  <!-- row 9 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">9</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne8aFromLne7aTypA"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne8bFromLne7bTypB"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne8cFromLne7cTypC"/>
     			 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne8dFromLne7dTypD"/>
     			 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 10 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">10</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                        $75.00
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                        $125.00
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                        $150.00
                        <span style="width:1px;"/>
                      </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                        $250.00
                        <span style="width:1px;"/>
                      </td>                      
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                    	  <!-- row 11 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">11</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply9aByLne10a"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply9bByLne10b"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply9cByLne10c"/>
     			 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply9dByLne10d"/>
     			 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;
                   	 border-bottom:solid black 1px;"><span style="width:1mm"/></td>
                   	 </tr> 
                   	   </table>

    <!-- line 7 -->
    <div style="width:67mm;border-top-width: 3px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:7.5mm;">7
      </div>
      <div style="padding-left:1mm;float:left;font-size:7pt;padding-top:7.5mm;">Enter the number of eligible clothes washers produced in calendar year 2008
				<span class="styBoldText">
					 <span style="width:8px"></span>.
					 <span style="width:8px"></span>.
					 <span style="width:8px"></span>.
					 <span style="width:8px"></span>.
				</span>
      </div>
      
    </div>
    <!-- end line 7 -->
    <!-- line 8 -->
    <div style="width:67mm;padding-top:2px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">8</div>
      <div style="padding-left:1mm;float:left;font-size:7pt;">Enter the average number of eligible clothes washers produced in the 2 prior calendar years
				<span class="styBoldText">
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.     
				</span>
      </div>
      
    </div>
    <!-- end line 8 -->
    <!-- line 9 -->
    <div style="width:67mm;padding-top:3px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">9</div>
      <div style="padding-left:1mm;float:left;font-size:7pt;">Subtract line 8 from line 7
					<span class="styBoldText">
						 <span style="width:16px"></span>.
						 <span style="width:16px"></span>.
					</span>
      </div>
      
    </div>
    <!-- end line 9 -->
    <!-- line 10 -->
    <div style="width:67mm;padding-top:1px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">10</div>
      <div style="padding-left:1mm;float:left;font-size:7pt;">Applicable amount
				<span class="styBoldText">
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					<span style="width:12px"></span>.
				</span>
      </div>
      
    </div>
    <!-- end line 10 -->
    <!-- line 11 -->
    <div style="width:67mm;padding-top:4px;">
      <div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">11</div>
      <div style="padding-left:1mm;float:left;font-size:7pt;">Multiply line 9 by line 10
			 <span class="styBoldText">
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
			</span>
    	</div>
    	
    </div>
    <!-- end line 11 -->
    </div>
      
    <!-- line 12 -->
   <div class="styBB" style="width: 187mm;">  
  	<div style="width:23px;height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:1mm;">12
  	</div>   
     <div style="width: 152.5mm;height:4mm;float:left; padding-top:1mm;padding-left:1mm;">
		 Add the amounts on line 11 in columns (a) through (d)
			 <span class="styBoldText">
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
			</span>
    	</div>    

     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1.2mm;padding-bottom:0mm;height:4mm;border-bottom:0px;">12</div>
     		<div class="styLNAmountBox" style="width:22mm;font-size:6pt;padding-top:1.5mm;padding-bottom:0mm;height:4mm;border-bottom:0px;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeCrdtForClothesWashers"/>
     			 </xsl:call-template> 
     		</div>          
   </div>
    <!-- end line 12 -->  	
  
<!--Start of Part III-->   
  
  					<!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;">Part III</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
          Refrigerators (see instructions)</div>
					</div>
					<!-- END PART II TITLE -->  
					
<div style="width:187mm;">
  <table cellspacing="0" cellpadding="0" style="font-size:7pt;float:right;">
     	<tr>      
                   	 <td style="background-color:gray;width:18px;border-left:1px solid black;height:8mm;border-top:0px solid black;border-bottom:1px solid black;border-right:0px;"><span style="width:1px;"/></td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:85px;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a) Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:85px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b) Type B</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:85px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(c) Type C</td>
                    	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:85px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(d) Type D</td>
                   	 <td style="background-color:gray;width:86px;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>                   	                   	                    	 
                   	 </tr>
                   	 
                   	 <!-- row 13 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">13</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeARefrigeratorsProdcd"/>
     			     </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeBRefrigeratorsProdcd"/>
     			     </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeCRefrigeratorsProdcd"/>
     			     </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                    	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeDRefrigeratorsProdcd"/>
     			     </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>                     
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 14  -->
                   	 <tr>
                  	 <td valign="bottom" style="height:10mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">14</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblRefrigTypA"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblRefrigTypB"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblRefrigTypC"/>
     			 </xsl:call-template>                       
                        <span style="width:1px;"/>
                      </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblRefrigTypD"/>
     			 </xsl:call-template>                       
                        <span style="width:1px;"/>
                      </td>                      
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 

                   	  <!-- row 15 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">15</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne14aFrmLne13aTypA"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne14bFrmLne13bTypB"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne14cFrmLne13cTypC"/>
     			 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne14dFrmLne13dTypD"/>
     			 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 16 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">16</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                        $50.00
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                        $75.00
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                        $100.00
                        <span style="width:1px;"/>
                      </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                        $200.00
                        <span style="width:1px;"/>
                      </td>                      
                   	 <td style="background-color:gray;border-right:solid black 0px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                    	  <!-- row 17 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">17</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply15aByLne16aTypA"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply15bByLne16bTypB"/>
     			 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply15cByLne16cTypC"/>
     			 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply15dByLne16dTypD"/>
     			 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-bottom:solid black 1px;"><span style="width:1mm"/></td>
                   	 </tr> 
                   	   </table>

    <!-- line 13 -->
    <div style="width:67mm;border-top-width: 3px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:7.5mm;">13
      </div>
      <div style="padding-left:1mm;float:left;font-size:7pt;padding-top:7.5mm;">Enter the number of eligible refrigerators produced in calendar year 2008
         <span class="styBoldText">
          <span style="width:8px"></span>.
          <span style="width:8px"></span>.
          <span style="width:8px"></span>.
		<span style="width:8px"></span>.
        </span>
      </div>
      
    </div>
    <!-- end line 13 -->
    
    <!-- line 14 -->
    <div style="width:67mm;padding-top:2px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">14</div>
      <div style="padding-left:1mm;float:left;font-size:7pt;">Enter the average number of eligible refrigerators produced in the 2 prior calendar years
          <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.     
        </span>
      </div>
      
    </div>
    <!-- end line 14 -->
    <!-- line 15 -->
    <div style="width:67mm;padding-top:3px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">15</div>
      <div style="padding-left:1mm;float:left;font-size:7pt;">Subtract line 14 from line 13
        <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
        </span>
      </div>
      
    </div>
    <!-- end line 15 -->
    
    <!-- line 16 -->
    <div style="width:67mm;padding-top:1px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">16</div>
      <div style="padding-left:1mm;float:left;font-size:7pt;">Applicable amount
        <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
		<span style="width:12px"></span>.
        </span>
      </div>
      
    </div>
    <!-- end line 16 -->
    
    <!-- line 17 -->
    <div style="width:67mm;padding-top:4px;">
      <div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">17</div>
		 <div style="padding-left:1mm;float:left;font-size:7pt;">Multiply line 15 by line 16
			 <span class="styBoldText">
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
			</span>
    	 </div>
    		 
    </div>
    <!-- end line 17 -->
   </div>
 
  <!-- line 18 -->
  <div class="styBB" style="width: 187mm;">  
  	<div style="width:23px;height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:1mm;">18
  	</div>
     <div style="width: 152.5mm;height:4mm;float:left; padding-top:1mm;padding-left:1mm;">
		 Add the amounts on line 17 in columns (a) through (d)
			 <span class="styBoldText">
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:16px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
			</span>
    	</div>    

     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:4mm;border-bottom:0px;">18</div>
     		<div class="styLNAmountBox" style="width:22mm;font-size:6pt;padding-top:1.5mm;padding-bottom:0mm;height:4mm;border-bottom:0px;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeCrdtForRefrigerators"/>
     			 </xsl:call-template> 
     		</div>          
   </div>
    <!-- end line 18 -->

   <!--Start of Part IV-->   
  
  					<!-- BEGIN PART IV TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;">Part IV</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
          Current Year Energy Appliance Credit</div>
					</div>
					<!-- END PART II TITLE -->  
	
    <!-- line 19 -->
  <div style="width: 187mm;">  
  	<div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:5px;">19
  	</div>
     <div style="width: 153mm;float:left; padding-top:1mm;padding-left:1mm;">
     <b>Total.</b> Add lines 6, 12, and 18
          <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.          
        </span>
    	</div>    

     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;">19</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:2mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TotalTentativeCredit"/>
     			 </xsl:call-template> 
     		</div>                   	
 
  </div>
    <!-- end line 19 -->

    <!--  Line 20 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:5px;">20
  	</div>
     <div style="width: 153mm;float:left; padding-top:1mm;padding-left:1mm;">
     Enter 2% of average annual gross receipts (see instructions)
          <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
        </span>
     </div>    

     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;">20</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:2mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Per2AvgeAnnualGrossRecpts"/>
     			 </xsl:call-template> 
     		</div>                   	
   </div>
      <!-- end line 20 -->

     <!--  Line 21 a -->    
      
      <div style="width: 187mm">  
		 <div class="styLNLeftNumBox" style="padding-left: 1mm;height:4.5mm">21a</div>
		 <div style="width:150.7mm;float:left;padding-top:.5mm;">Maximum credit base amount
          <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:6px"></span>.
         </span></div>    

     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;">21a</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:2mm;padding-bottom:0mm;height:3mm;">$75,000,000.00</div>                   	
         
  </div>
<!-- End  Line 21 a -->  
    
 
 <!--  Line 21b -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">b</div>
    <div style="width: 150.7mm;float:left;padding-top:.5mm;">
   Enter the amount from line 11, column (d)
          <span class="styBoldText">
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:7px"></span>.
        </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;">21b</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:2mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Line11dAmount"/>
     			 </xsl:call-template>       
		  </div>          

  </div>
  <!-- End Line 21b -->
  
   <!--  Line 21c -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">c</div>
    <div style="width: 150.7mm;float:left;padding-top:.5mm;">
   Enter the amount from line 17, column (d)
          <span class="styBoldText">
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:7px"></span>.
        </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;">21c</div>
     		  <div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:2mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Line17dAmount"/>
     			 </xsl:call-template>       
			  </div>          
  </div>
  <!-- End Line 21c -->
  
   <!--  Line 21d -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">d</div>
    <div style="width: 150.7mm;float:left;padding-top:.5mm;">
   Maximum credit amount.<span style="width:2px"> </span> Add lines 21a through 21c
          <span class="styBoldText">
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:13px"></span>.
          <span style="width:13px"></span>.
          <span style="width:13px"></span>.
          <span style="width:13px"></span>.
          <span style="width:13px"></span>.
           <span style="width:13px"></span>.
          <span style="width:13px"></span>.
          <span style="width:13px"></span>.
          <span style="width:5px"></span>.
        </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;">21d</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:2mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/MaximumCreditAllowed"/>
     			 </xsl:call-template>       
		  </div>          

  </div>
  <!-- End Line 21d -->
 
   <!--  Line 22 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:3mm;font-size:6.5pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:5px;">22
  	</div>
     <div style="width:153mm;float:left; padding-top:1mm;padding-left:1mm;">
     Enter the <b>smallest</b> of the amount on line 19, 20, or 21d
           <span class="styBoldText">
           <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
         </span>       
             <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Single Producer</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/SingleProducer"/>
           </xsl:call-template>
    	</div>
     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;">22</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:2mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SmallestOfLnes19And20Or21d"/>
     			 </xsl:call-template> 
     		</div>                   	    	    
  </div>
   <!-- End Line 22 -->
  

   <!--  Line 23 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:5px;">23
  	</div>
     <div style="width: 153mm;float:left; padding-top:1mm;padding-left:1mm;">
     Energy efficient appliance credits from partnerships, S corporations, estates, trusts, and cooperatives
         <span class="styBoldText">
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.         
        </span>     
    </div>    

     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;">23</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:2mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EnergyEffcntApplianceCrdt"/>
     			 </xsl:call-template> 
     		</div>                   	 
   </div>
     <!-- End Line 23 --> 
   

  <!--  Line 24 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:2mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:5px;">24
  	</div>
     <div style="width: 153mm;float:left; padding-top:1mm;padding-left:1mm;">
Add lines 22 and 23. Estates, trusts, and cooperatives, go to line 25; partnerships and S corporations, 
report this amount on Schedule K; all others, report this amount on Form 3800, line 1q
         <span class="styBoldText">
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
        </span>  
     </div>    
    	<div style="float:right;">
    	     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;padding-top:4mm;padding-bottom:0mm;height:2mm;">24</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:4.5mm;padding-bottom:0mm;height:2mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AddLines22aAnd23"/>
     			 </xsl:call-template> 
     		</div>                   	 
      	</div>
  </div>
 <!-- End Line 24 --> 
    
 <!--  Line 25 -->

  <div style="width: 187mm;">  
  	<div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:1mm;">25
  	</div>
     <div style="width: 153mm;height:3mm;float:left; padding-top:1mm;padding-left:1mm;">
     Amount allocated to beneficiaries of the estate or trust, or to patrons of the cooperative (see
instructions)
     </div>    
    	<div style="float:right;">
     	     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;padding-top:1mm;padding-bottom:0mm;height:3mm;">25</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AmtAllctedToBeneEstTrstPatrn"/>
     			 </xsl:call-template> 
     		</div>                   	    	
     	</div>
  </div>
  <!-- End Line 25 -->  
  
 <!--  Line 26 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:1mm;">26
  	</div>
     <div style="width: 153mm;float:left; padding-top:1mm;padding-left:1mm;">
Estates, trusts, and cooperatives, subtract line 25 from line 24. Report this amount on Form 3800,
line 1q
         <span class="styBoldText">
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
          </span>
     </div>    
    	<div style="float:right;">
     	     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;padding-top:1mm;padding-bottom:0mm;height:3mm;border-bottom:0px;">26</div>
     		<div class="styLNAmountBox" style="width:23mm;font-size:6pt;padding-top:1.5mm;padding-bottom:0mm;height:3mm;border-bottom:0px;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne25FrmLne24"/>
     			 </xsl:call-template> 
     		</div>                   	    	
    	</div>
  </div>
   <!-- End Line 26 --> 
   
  <!--  FOOTER-->
        <div style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:120px;"></span>                      
          Cat. No. 37719E
          <span style="width:130px;"></span>  
          Form <span class="styBoldText">8909</span> (2008)
        </div> 
        <br class="pageEnd"/>
        
        <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$FormData" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>          
        <xsl:call-template name="PopulateLeftoverRow"> 
            <xsl:with-param name="Desc">Single Producer</xsl:with-param> 
            <xsl:with-param name="TargetNode" select="$FormData/SingleProducer"/> 
            <xsl:with-param name="DescWidth" select="100"/> 
        </xsl:call-template> 
        </table>
        

      <!-- END Left Over Table -->      
  </form>  
</body>
</html>
</xsl:template>    

</xsl:stylesheet>