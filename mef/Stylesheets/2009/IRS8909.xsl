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
      <div class="styTaxYear" style="height:10mm">20<span class="styTYColor">09</span></div>
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
          Dishwashers<span style="font-weight:normal;"> (see instructions)</span></div>
					</div>
					<!-- END PART I TITLE -->  
  
<div style="width:187mm;">
  <table cellspacing="0" cellpadding="0" style="font-size:7pt;float:right;">
     	<tr>      
                   	 <td style="background-color:gray;width:22px;border-left:1px solid black;height:6mm;border-top:0px solid black;border-bottom:1px solid black;border-right:0px;"><span style="width:1px;"/></td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:110px;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:8pt;border-top:0px solid black">(a)<br/>Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:110px;border-right-width:1px;font-weight:bold;font-size:8pt;border-top:0px solid black">(b)<br/>Type B</td>
                   	 <td style="background-color:gray;width:134px;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>                   	 
        </tr>
                   	 
                   	 <!-- row 1 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:7pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">1</td>
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
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 2 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:7pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">2</td>
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
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">$45</td>
                   	 <td align="right" style="border-right:1px solid black;font-size:7pt;border-bottom:1px solid black;" valign="bottom">$75</td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 5 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:7pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">5</td>
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
  
<div style="float:left;width:300px;padding-top:2mm;">
  <br/>
 
    <!-- line 1 -->
    <div style="width:320px;padding-top:2px;">
      <div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2mm;">1</div>
		  <div style="padding-left:2mm;float:left;font-size:7pt;">Enter the number of eligible dishwashers produced in<br/>
		   calendar year 2009
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
    <div style="width:300px;padding-top:2px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2mm;">2</div>
		  <div style="padding-left:2mm;float:left;font-size:7pt;">Enter the average number of eligible dishwashers<br/>
		   produced in the 2 prior calendar years
		   <span class="styBoldText">
				 <span style="width:10px"></span>.
				 <span style="width:10px"></span>.
				 <span style="width:10px"></span>.
				 <span style="width:10px"></span>.
				 <span style="width:10px"></span>.
			</span>
      </div>
      
    </div>
    <!-- end line 2 -->
    <!-- line 3 -->
    <div style="width:300px;padding-top:3px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2mm;">3</div>
		  <div style="padding-left:2mm;float:left;font-size:7pt;">Subtract line 2 from line 1
				<span class="styBoldText">
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
    <div style="width:300px;padding-top:1px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2mm;">4</div>
      <div style="padding-left:2mm;float:left;font-size:7pt;">Applicable amount
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
    <!-- end line 4 -->
    <!-- line 5 -->
    <div style="width:300px;padding-top:0px;">
      <div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2mm;">5</div>
      <div style="padding-left:2mm;float:left;font-size:7pt;">Multiply line 3 by line 4
				<span class="styBoldText">
					 <span style="width:14px"></span>.
					 <span style="width:14px"></span>.
					 <span style="width:14px"></span>.
					 <span style="width:14px"></span>.
					 <span style="width:14px"></span>.
					 <span style="width:14px"></span>.
					 <span style="width:14px"></span>.
				</span>
      </div>
      
    </div>
    <!-- end line 5 -->
    </div>
    </div>
 
   <!--  Line 6 -->    
  <div class="styBB" style="width: 187mm;font-size:7pt;">  
  	<div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2mm;padding-top:.5mm;">6</div>
     <div style="width: 145.5mm;height:3mm;float:left; padding-top:.5mm;padding-left:2mm;">Add the amounts on line 5 in columns (a) and (b)
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
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
				 <span style="width:15px"></span>.
			</span>
    	</div> 
     	<div class="styLNRightNumBox" style="width:20px;padding-top:.5mm;height:3mm;border-bottom-width:0px;">6</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:.5mm;height:3mm;border-bottom-width:0px;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeCrdtforDishwshrs"/>
     			 </xsl:call-template> 
     		</div>          
   </div>
  <!--  Line 6 -->
					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
          Clothes Washers<span style="font-weight:normal;"> (see instructions)</span></div>
					</div>
					<!-- END PART II TITLE -->  
					
<div style="width:187mm;">
 <table cellspacing="0" cellpadding="0" style="font-size:7pt;float:right;">
     	<tr>      
                   	 <td style="background-color:gray;width:18px;border-left:1px solid black;height:6mm;border-top:0px solid black;border-bottom:1px solid black;border-right:0px;"><span style="width:1px;"/></td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a)<br/>Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b)<br/>Type B</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(c)<br/>Type C</td>
                   	 <td style="background-color:gray;width:134px;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>                   	                   	                    	 
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
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 

                   	  <!-- row 9 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">9</td>
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
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 10 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">10</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$125</td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$150</td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$250</td>                      
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                    	  <!-- row 11 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">11</td>
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
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;
                   	 border-bottom:solid black 1px;"><span style="width:1mm"/></td>
                   	 </tr> 
                   	   </table>

    <!-- line 7 -->
    <div style="width:67mm;border-top-width: 3px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2mm;padding-top:5.5mm;">7
      </div>
      <div style="padding-left:2mm;float:left;font-size:7pt;padding-top:5.5mm;">Enter the number of eligible clothes washers produced in calendar year 2009
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
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2mm;">8</div>
      <div style="padding-left:2mm;float:left;font-size:7pt;">Enter the average number of eligible clothes washers produced in the 2 prior calendar<br/> years
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
    <!-- end line 8 -->
    <!-- line 9 -->
    <div style="width:67mm;padding-top:3px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2mm;">9</div>
      <div style="padding-left:2mm;float:left;font-size:7pt;">Subtract line 8 from line 7
					<span class="styBoldText">
						 <span style="width:16px"></span>.
						 <span style="width:16px"></span>.
						 <span style="width:16px"></span>.
						 <span style="width:16px"></span>. 
					</span>
      </div>
      
    </div>
    <!-- end line 9 -->
    <!-- line 10 -->
    <div style="width:67mm;padding-top:1px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">10</div>
      <div style="padding-left:2mm;float:left;font-size:7pt;">Applicable amount
				<span class="styBoldText">
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>.
					 <span style="width:16px"></span>. 
					<span style="width:12px"></span>.
				</span>
      </div>
      
    </div>
    <!-- end line 10 -->
    <!-- line 11 -->
    <div style="width:67mm;">
      <div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">11</div>
      <div style="padding-left:2mm;float:left;font-size:7pt;">Multiply line 9 by line 10
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
  	<div style="width:23px;height:3mm;font-size:6.5pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:.5mm;">12
  	</div>   
     <div style="width: 145.3mm;height:3mm;float:left; padding-top:.5mm;padding-left:2mm;">
		 Add the amounts on line 11 in columns (a) through (c)
			 <span class="styBoldText">
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

     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;border-bottom:0px;">12</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:.5mm;height:3mm;border-bottom-width:0px; ">
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
          Refrigerators<span style="font-weight:normal;"> (see instructions)</span></div>
					</div>
					<!-- END PART II TITLE -->  
					
<div style="width:187mm;">
  <table cellspacing="0" cellpadding="0" style="font-size:7pt;float:right;">
     	<tr>      
                   	 <td style="background-color:gray;width:18px;border-left:1px solid black;height:6mm;border-top:0px solid black;border-bottom:1px solid black;border-right:0px;"><span style="width:1px;"/></td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a)<br/>Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b)<br/>Type B</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(c)<br/>Type C</td>
                   	 <td style="background-color:gray;width:134px;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>                   	                   	                    	 
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
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 14  -->
                   	 <tr>
                  	 <td valign="bottom" style="height:9mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">14</td>
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
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 

                   	  <!-- row 15 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">15</td>
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
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                   	  <!-- row 16 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">16</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$75</td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$100</td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$200</td>
                   	 <td style="background-color:gray;border-right:solid black 0px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                    	  <!-- row 17 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">17</td>
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
                   	 <td style="background-color:gray;border-bottom:solid black 1px;"><span style="width:1mm"/></td>
                   	 </tr> 
                   	   </table>

    <!-- line 13 -->
    <div style="width:67mm;border-top-width: 3px;">
      <div style="width:22px;height:4mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:5.5mm;">13</div>
      <div style="padding-left:2mm;float:left;font-size:7pt;padding-top:5.5mm;">Enter the number of eligible refrigerators produced in calendar year 2009
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
      <div style="padding-left:2mm;float:left;font-size:7pt;">Enter the average number of eligible refrigerators produced in the 2 prior calendar years
          <span class="styBoldText">
  				 <span style="width:12px"></span>.
				 <span style="width:12px"></span>.
				 <span style="width:12px"></span>.
				 <span style="width:12px"></span>.
				 <span style="width:12px"></span>.
				 <span style="width:12px"></span>. 
				 <span style="width:12px"></span>. 
				 <span style="width:12px"></span>. 
        </span>
      </div>
      
    </div>
    <!-- end line 14 -->
    <!-- line 15 -->
    <div style="width:67mm;padding-top:3px;">
      <div style="width:22px;height:3.5mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">15</div>
      <div style="padding-left:2mm;float:left;font-size:7pt;">Subtract line 14 from line 13
        <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
         </span>
      </div>
      
    </div>
    <!-- end line 15 -->
    
    <!-- line 16 -->
    <div style="width:67mm;padding-top:1px;">
      <div style="width:22px;height:3.5mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">16</div>
      <div style="padding-left:2mm;float:left;font-size:7pt;">Applicable amount
        <span class="styBoldText">
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
          <span style="width:16px"></span>.
		  <span style="width:12px"></span>.
		  <span style="width:12px"></span>.
		  <span style="width:12px"></span>.
        </span>
      </div>
      
    </div>
    <!-- end line 16 -->
    
    <!-- line 17 -->
    <div style="width:67mm;">
      <div style="width:22px;height:3.5mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">17</div>
		 <div style="padding-left:2mm;float:left;font-size:7pt;">Multiply line 15 by line 16
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
  	<div style="width:23px;height:3.5mm;font-size:6.5pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:.5mm;">18
  	</div>
     <div style="width: 145.3mm;height:3mm;float:left; padding-top:.5mm;padding-left:2mm;">
		 Add the amounts on line 17 in columns (a) through (c)
			 <span class="styBoldText">
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
				 <span style="width:12px"></span>.
			</span>
    	</div>    

     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;border-bottom:0px;">18</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:.5mm;height:3mm;border-bottom-width:0px; ">
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
  	<div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">19
  	</div>
     <div style="width: 145.3mm;float:left;padding-left:2mm;">
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
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:10px"></span>.
        </span>
    	</div>    

     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:0mm;padding-bottom:0mm;height:3mm;">19</div>
     		<div class="styLNAmountBox" style="width:30.5mm;padding-top:0mm;padding-bottom:0mm;height:3mm;border-bottom-width:1px; ">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TotalTentativeCredit"/>
     			 </xsl:call-template> 
     		</div>                   	
 
  </div>
    <!-- end line 19 -->

    <!--  Line 20 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:3mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:.5mm;">20
  	</div>
     <div style="width: 145.3mm;float:left; padding-top:.5mm;padding-left:2mm;">
     Enter 2% of average annual gross receipts (see instructions)
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
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
        </span>
     </div>    

     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-bottom:0mm;height:3mm;">20</div>
     		<div class="styLNAmountBox" style="width:30.5mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Per2AvgeAnnualGrossRecpts"/>
     			 </xsl:call-template> 
     		</div>                   	
   </div>
      <!-- end line 20 -->

     <!--  Line 21 a -->    
      
      <div style="width: 187mm">  
		 <div class="styLNLeftNumBox" style="padding-left:1mm;height:4.5mm">21a</div>
		 <div style="width:108mm;float:left;padding-top:.5mm;">Maximum credit base amount (see instructions)
          <span class="styBoldText">
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
         </span></div>    

     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;">21a</div>
     	 <div class="styLNAmountBox" style="width:30mm;padding-top:1mm;padding-bottom:0mm;height:3mm;">$75,000,000</div>                   	
     	 <div class="styShadingCell" style="height:3.5mm;width:36mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div>                   	
  </div>
<!-- End  Line 21 a -->  
    
 
 <!--  Line 21b -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">b</div>
    <div style="width: 108mm;float:left;padding-top:.5mm;">Enter the amount from line 19 of your *2008 Form 8909
          <span class="styBoldText">
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
         </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;">21b</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:1mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/PriorYrLine19Amt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:3.5mm;width:36mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 21b -->
  
   <!--  Line 21c -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">c</div>
    <div style="width: 108mm;float:left;padding-top:.5mm;">Enter the amount from line 21b of your *2008 Form 8909
          <span class="styBoldText">
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
         </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;">21c</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:1mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/PriorYrLine21bAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:3.5mm;width:36mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 21c -->
  
   <!--  Line 21d -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">d</div>
    <div style="width: 108mm;float:left;padding-top:.5mm;">Enter the amount from line 21c of your *2008 Form 8909
          <span class="styBoldText">
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
         </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;">21d</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:1mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/PriorYrLine21cAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:3.5mm;width:36mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 21d -->
  
    <!--  Line 21e -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">e</div>
    <div style="width: 108mm;float:left;padding-top:.5mm;">Add lines 21c and 21d
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
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;">21e</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:1mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativePriorYrCreditAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:3.5mm;width:36mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 21e -->

    <!--  Line 21f -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">f</div>
    <div style="width: 108mm;float:left;padding-top:.5mm;">Subtract line 21e from line 21b
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
         </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;">21f</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:1mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/DifferenceOfLines21eAnd21bAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:3.5mm;width:36mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 21f -->

    <!--  Line 21g -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">g</div>
    <div style="width: 108mm;float:left;padding-top:.5mm;">Enter the amount from line 20 of your *2008 Form 8909
          <span class="styBoldText">
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
         </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;">21g</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:1mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/PriorYrAvgeGrossRecptsAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:3.5mm;width:36mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 21g -->
 
    <!--  Line 21h -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">h</div>
    <div style="width: 108mm;float:left;padding-top:.5mm;">Enter the <b>smallest</b> of the amount on line 21a, 21f, or 21g
          <span class="styBoldText">
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
         </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-top:1mm;padding-bottom:0mm;height:3mm;">21h</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:1mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SmallerOfLinesAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:3.5mm;width:36mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 21h --> 
  
    <!--  Line 21i -->    
  <div style="width: 187mm;">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm;padding-top:0mm;">i</div>
  	     <div style="width: 143.2mm;float:left;">Subtract line 21h from line 21a
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

     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-bottom:0mm;height:3.8mm;">21i</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-bottom:0mm;height:3.5mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/DifferenceOfLines21hAnd21aAmt"/>
     			 </xsl:call-template> 
     		</div>                   	
   </div>
      <!-- end line 21i -->
      
      <!--  Line 22 a -->    
      
      <div style="width: 187mm">  
		 <div class="styLNLeftNumBox" style="padding-left:1mm;height:3mm">22a</div>
		 <div style="width:108mm;float:left;">Enter the amount from line 11, column (c)
          <span class="styBoldText">
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
         <span style="width:14px"></span>.
         </span></div>    

     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-bottom:0mm;height:3mm;">22a</div>
     	 <div class="styLNAmountBox" style="width:30mm;padding-bottom:0mm;height:3mm;">
      			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Line11cAmount"/>
     			 </xsl:call-template> 
     	 </div>                   	
     	 <div class="styShadingCell" style="height:4.5mm;width:36mm;padding-bottom:0mm;background-color:gray;"></div>                   	
  </div>
<!-- End  Line 22 a -->  
  
      <!--  Line 22b -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">b</div>
    <div style="width: 108mm;float:left;">Enter the amount from line 17, column (c)
          <span class="styBoldText">
          <span style="width:15px"></span>.
          <span style="width:15px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
         <span style="width:14px"></span>.
         </span>   
    </div>    
     	 <div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-bottom:0mm;height:3mm;">22b</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Line17cAmount"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4.5mm;width:36mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 22b --> 
  
       <!--  Line 22c -->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm;padding-top:0mm;">c</div>
    <div style="width:143.2mm;float:left;">Add lines 22a and 22b
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
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          <span style="width:14px"></span>.
          </span>       
    	</div>
     	<div class="styLNRightNumBox" style="width:20px;font-size:6.5pt;padding-bottom:0mm;height:3.8mm;">22c</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeMaximumCreditAmount"/>
     			 </xsl:call-template> 
     		</div>                   	    	    
  </div>
  <!-- End Line 22c -->  
     <!--  Line 23 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:2mm;font-size:6.5pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">23
  	</div>
     <div style="width:145.3mm;float:left;padding-left:2mm;">Maximum credit amount. Add lines 21i through 22c
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
          </span>       
    	</div>
     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;;padding-bottom:0mm;height:3mm;">23</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/MaximumCreditAllowedAmt"/>
     			 </xsl:call-template> 
     		</div>                   	    	    
  </div>
   <!-- End Line 23 -->
  
 
   <!--  Line 24 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:2mm;font-size:6.5pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">24
  	</div>
     <div style="width:145.3mm;float:left;padding-left:2mm;">
     Enter the <b>smallest</b> of the amount on line 19, 20, or 23
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
         </span>       
             <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Single Producer</xsl:with-param>
             <xsl:with-param name="TargetNode" select="$FormData/SingleProducer"/>
           </xsl:call-template>
    	</div>
     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;padding-bottom:0mm;height:3mm;">24</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SmallestOfLines19And20Or23Amt"/>
     			 </xsl:call-template> 
     		</div>                   	    	    
  </div>
   <!-- End Line 24 -->

   <!--  Line 25 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:2mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">25
  	</div>
     <div style="width:145.3mm;float:left;padding-left:2mm;">
     Energy efficient appliance credits from partnerships, S corporations, estates, trusts, and cooperatives
         <span class="styBoldText">
           <span style="width:10px"></span>.
        </span>     
    </div>    

     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;padding-bottom:0mm;height:3mm;">25</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-bottom:0mm;height:3mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EnergyEffcntApplianceCrdtAmt"/>
     			 </xsl:call-template> 
     		</div>                   	 
   </div>
     <!-- End Line 25 --> 
   

  <!--  Line 26 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:2mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;padding-top:5px;">26</div>
     <div style="width: 145.3mm;float:left; padding-top:1mm;padding-left:2mm;">
Add lines 24 and 25. Estates, trusts, and cooperatives, go to line 27; partnerships and S corporations,<br/> 
report this amount on Schedule K; all others, report this amount on Form 3800, line 1q
         <span class="styBoldText">
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
          <span style="width:12px"></span>.
        </span>  
     </div>    
    	     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;padding-top:4.5mm;padding-bottom:0mm;height:2mm;">26</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-top:4.5mm;padding-bottom:0mm;height:2mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TotalOfLines24And25Amt"/>
     			 </xsl:call-template> 
     		</div>                   	 
   </div>
 <!-- End Line 26 --> 
    
 <!--  Line 27 -->

  <div style="width: 187mm;">  
  	<div style="width:22px;height:2mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">27
  	</div>
     <div style="width:145.3mm;height:3mm;float:left; ;padding-left:2mm;">
     Amount allocated to beneficiaries of the estate or trust, or to patrons of the cooperative (see
instructions)

     </div>    
   	     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;;padding-bottom:0mm;height:3mm;">27</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-bottom:0mm;height:3.5mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AllctedToBeneEstTrstPatrnAmt"/>
     			 </xsl:call-template> 
     		</div>                   	    	
   </div>
  <!-- End Line 27 -->  
  
 <!--  Line 28 -->    
  <div style="width: 187mm;">  
  	<div style="width:22px;height:2mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">28
  	</div>
     <div style="width: 145.3mm;float:left;padding-left:2mm;">Estates, trusts, and cooperatives, subtract line 27 from line 26. Report this amount on Form 3800, line 1q<br/> 
*Include amounts from predecessors.
      </div>    
      	     	<div class="styLNRightNumBox" style="width:20px;font-size:7pt;padding-bottom:0mm;height:3mm;">28</div>
     		<div class="styLNAmountBox" style="width:30mm;padding-bottom:0mm;height:3.5mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne27FrmLne26Amt"/>
     			 </xsl:call-template> 
     		</div>                   	    	
   </div>
   <!-- End Line 28 --> 
   
  <!--  FOOTER-->
        <div style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:120px;"></span>                      
          Cat. No. 37719E
          <span style="width:130px;"></span>  
          Form <span class="styBoldText">8909</span> (2009)
        </div> 
        <div class="pageEnd"/>
        
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