<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 4/08/2015 -->
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
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>  
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
  <div class="styBB" style="height:19mm;width:187mm;">
    <div  class="styFNBox" style="height:19mm;width:26mm;font-size: 7pt;">
		<div class="" style="height:12mm;" >
      Form <span class="styFormNumber">8909</span>      
       <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span> 
      </div> 
       <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
   <div class="styFTBox" style="height: 19mm;width:130mm;padding-top:4mm;">
        <div class="styMainTitle" style="height:8.5mm;width:130mm;">Energy Efficient Appliance Credit</div>
		<div class="styFST" style="width:130mm;text-align:center;font-size:7pt;">
			<img src="{$ImagePath}/8909_Bullet.gif" alt="MediumBullet"/>  
				Attach to your tax return. 
        </div>
        <div class="styFST" style="text-align:left;font-size:7pt;">
			<img src="{$ImagePath}/8923_Bullet.gif" alt="MediumBullet"/>
				Information about Form 8909 and its separate instructions is at <a href="http://www.irs.gov/form8909" title="Link to IRS.gov"><i>www.irs.gov/form8909</i></a>
		</div> 
    </div>
  <div class="styTYBox" style="width:30mm;height:19mm; border-left-width: 1px;">
      <div class="styOMB">OMB No. 1545-0123</div>
      <div class="styTaxYear" style="height:8mm">20<span class="styTYColor">14</span></div>
      <div class="stySequence">Attachment<br/>Sequence No. <b>159</b></div>
    </div>
  </div>
  <!--  End title of Form  -->
    
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:141mm;font-weight:normal;font-size:7pt;">
      Name(s) shown on return<br/>
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template><br/>  
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param></xsl:call-template>      
    </div>
    <div class="styEINBox" style=" padding-left:2mm;font-size:7pt;">Identifying number
      <br/><br/>
      <span style="font-weight:normal;">  
        <xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">EIN</xsl:with-param>
        </xsl:call-template>
         <xsl:call-template name="PopulateReturnHeaderFiler">
           <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
         </xsl:call-template> 
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
<!-- James border-style:solid;border-color:black;border-width: 1px 1px 1px 1px;-->
    <!-- line 1 Number Eligible Dishwashers-->
    <div style="width:187mm;">
  <table cellspacing="0" cellpadding="0" style="height:auto;width:auto;float:right;clear:none;">
      	<tr>      
            <td style="background-color:gray;width:6mm;border-left:1px solid black;height:6mm;border-top:0px solid black;border-bottom:1px solid black;border-right:0px;"><span style="width:1px;"/></td>
            <td class="styIRS8909TableCellHeaderSmall" align="center" style="height:6mm;width:26mm;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a)<br/>Type A</td>
            <td class="styIRS8909TableCellHeaderSmall" align="center" style="height:6mm;width:26mm;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b)<br/>Type B</td>
            <td style="height:6mm;background-color:gray;width:32mm;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>                   	                   	                    	 
        </tr>
             <!--Begin Line 1 Number Eligible Dishwashers-->
                   	<tr>
						 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">1</td>
					 <!-- Type A Clothes Washers Produced -->  	 
						 <td align="right" style="height:6mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleDishwashersTypeAQty"/>
						 </xsl:call-template> 
							<span style="width:1px;"/>
						 </td>
					<!-- Type B Clothes Washers Produced -->   	 
						 <td align="right" style="height:6mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleDishwashersTypeBQty"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
						 <td style="height:6mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	</tr>
            <!--End Line 1 Number Eligible Dishwashers-->

            <!--Begin Line 2 Average Number Dishwashers Produced In Prior 2 Calendar Years-->
                   	<tr>
						 <td valign="bottom" style="height:6.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">2</td>
					 <!-- Type A Clothes Washers Produced -->  	 
						 <td align="right" style="height:6.5mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DshwshrPrdcdPr2YrsTypeAAvgQty"/>
						 </xsl:call-template> 
							<span style="width:1px;"/>
						 </td>
					<!-- Type B Clothes Washers Produced -->   	 
						 <td align="right" style="height:6.5mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DshwshrPrdcdPr2YrsTypeBAvgQty"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
						 <td style="height:6.5mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	</tr>
            <!--End Line 2 Average Number Dishwashers Produced In Prior 2 Calendar Years-->
        
            <!--Begin Line 3 Subtract Line 2(a) From Line 1(a)-->
                   	<tr>
						 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">3</td>
					 <!-- Type A Clothes Washers Produced -->  	 
						 <td align="right" style="height:4mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleDishwashersTypeANetQty"/>
						 </xsl:call-template> 
							<span style="width:1px;"/>
						 </td>
					<!-- Type B Clothes Washers Produced -->   	 
						 <td align="right" style="height:4mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EligibleDishwashersTypeBNetQty"/>
							</xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
						 <td style="height:4mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
					</tr>
				<!--End Line 3 Subtract Line 2(a) From Line 1(a)-->
			
				<!--Begin Line 4 Subtract Line 2(a) From Line 1(a)-->
					<tr>
						 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">4</td>
						 <td align="right" style="height:4mm;padding-right:1mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$50</td>
						 <td align="right" style="height:4mm;padding-right:1mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$75</td>
						 <td style="height:4mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	</tr>  
            <!--End Line 4 Subtract Line 2(a) From Line 1(a)-->
        
            <!--Begin Line 5 Multiply Line 3(a) by Line 4(a)-->
                   	<tr>
						 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;padding-top:.5mm;">5</td>
					 <!-- Type A Clothes Washers Produced -->  	 
						 <td align="right" style="height:4mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;padding-top:.5mm;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DishwashersTypeATentativeCrAmt"/>
						 </xsl:call-template> 
							<span style="width:1px;"/>
						 </td>
					<!-- Type B Clothes Washers Produced -->   	 
						 <td align="right" style="height:4mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;padding-top:.5mm;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DishwashersTypeBTentativeCrAmt"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
						 <td style="height:4mm;background-color:gray;border-bottom:solid black 1px;border-right:solid black 1px;border-right:0px;padding-top:.5mm;"><span style="width:1mm"/></td>                 	 
					</tr>
				<!--End Line 5 Multiply Line 3(a) by Line 4(a) -->
     </table>   

		<span style="width:96mm;float:left;clear:none;">	
     <!-- end line 1 Number Eligible Dishwashers-->
				<div style="width:96mm;">
				    <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;padding-top:6mm;">1</div>
				    <div class="styLNDesc" style="height:12mm;width:90mm;padding-left:2mm;float:left;font-size:7pt;padding-top:6mm;">
						  Enter the number of eligible dishwashers produced in calendar year 2013
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;padding-left:.5mm;clear:none;">.................</span>
				    </div>
				</div>
				   <!-- end line 1 Number Eligible Dishwashers-->

				<!-- line 2 Average Number Dishwashers Produced In Prior 2 Calendar Years-->
				<div style="width:96mm;">
				    <div class="styLNLeftNumBox" style="width:6mm;text-align:center;float:left;padding-left:2mm;">2</div>
					<div class="styLNDesc" style="height:6.5mm;width:90mm;padding-left:2mm;float:left;">
							Enter the average number of eligible dishwashers produced in the 2 prior
							calendar years
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;padding-left:.5mm;clear:none;">.............</span>
				    </div>
				</div>
				<!-- end line 2 Average Number Dishwashers Produced In Prior 2 Calendar Years-->
				
				 <!-- line 3 Subtract Line 2(a) From Line 1(a)-->
				<div  style="width:96mm;">
				    <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;text-align:center;float:left;padding-left:2mm;">3</div>
					<div class="styLNDesc" style="width:90mm;padding-top:1mm;padding-left:2mm;">
						<span style="float:left;clear:none;">   	
								Subtract line 2 from line 1
						</span>	
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:.5mm;clear:none;">............</span>
					</div>
				</div>
				<!-- end line 3 Subtract Line 2(a) From Line 1(a)-->   
				
				<!-- line 4 -->
				<div style="width:96mm;">
				    <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;text-align:center;float:left;padding-left:2mm;">4</div>
				    <div class="styLNDesc" style="width:90mm;padding-top:1mm;padding-left:2mm;float:left;">
						<span style="float:left;clear:none;">   
							Applicable amount
						</span>	
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:.5mm;clear:none;">...............</span>
				    </div>
				</div>
				<!-- end line 4 --> 
    
				  <!-- line 5 Multiply Line 3(a) by Line 4(a)-->
				<div style="width:96mm;">
				    <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;text-align:center;float:left;padding-left:2mm;">5</div>
				    <div class="styLNDesc" style="width: 90mm;padding-left:2mm;float:left;padding-top:1mm;">
						<span style="float:left;clear:none;">   
							Multiply line 3 by line 4
						</span>	
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:.5mm;clear:none;">.............</span>
				    </div>
				</div>
				<!-- end line 5 Multiply Line 3(a) by Line 4(a)-->  
			     </span>	    
   </div>
				<!-- line 6 Multiply Line 3(a) by Line 4(a)-->
				<div  class="styBB" style="width:187mm;">
				    <div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-left:2mm;">6</div>
				    <div class="styLNDesc" style="width:149.8mm;padding-left:2mm;float:left;">
						<span style="float:left;clear:none;">   
							Add the amounts of line 5 in columns (a) and  (b)
						</span>	
					<!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:.5mm;clear:none;">.....................</span>
				    </div>
				    <div class="styLNRightNumBox" style="width:6mm;text-align:center;border-bottom-width:0px;" valign="bottom">6</div>
				    <div class="styLNAmountBox"  style="width:26mm;font-size:6pt;padding-top:1mm;border-bottom-width:0px;" valign="bottom">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TentativeCrdtForDishwashersAmt"/>
						 </xsl:call-template>                         
				    </div>
				</div>
				<!-- end line 6 Multiply Line 3(a) by Line 4(a)-->

 					<!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;">Part II</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
          Clothes Washers<span style="font-weight:normal;"> (see instructions)</span></div>
					</div>
					<!-- END PART II TITLE -->  
					
<div style="width:187mm;">
 <table cellspacing="0" cellpadding="0" style="float:right">
     	<tr>      
                   	 <td style="height:6mm;background-color:gray;width:6mm;border-style:solid;border-color:black;border-width:0px 1px 1px 1px;"><span style="width:1px;"/></td>
                   	 <td style="height:6mm;width:26mm;font-weight:bold;font-size:7pt;border-right:1px solid black;"></td>
                   	 <td style="height:6mm;background-color:gray;width:32mm;"><span style="width:1mm"/></td>                   	                   	                    	 
                   	 </tr>
                   	 
                   	 <!--Row 7 Clothes Washers Produced-->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">7</td>
                <!-- Type B Clothes Washers Produced -->   	 
                   	 <td align="right" style="height:4mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EligClothesWashersPrdcdQty"/>
     			     </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="height:4mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr>
                   	 <!--End Row 7 Clothes Washers Produced--> 
                   	 
                   	 <!-- Row 8 Average Number Eligible Clothes Washer -->
                   	 <tr>
                  	 <td valign="bottom" style="height:6.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">8</td>
                <!-- Average Number Eligible Clothes Washer Type B -->   	 
                   	 <td align="right" style="height:6.5mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgEligClothesWashersPrdcdQty"/>
					 </xsl:call-template>                       
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="height:6.5mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr>
                   	 <!-- End Row 8 Average Number Eligible Clothes Washer --> 

                   	 <!-- Row 9 Subtract Line 7(a) From Line 6(a) -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;padding-top:.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">9</td>
                <!-- Subtract Line 7(b) From Line 6(b) Type B -->   	 
                   	 <td align="right" style="height:4mm;padding-top:.5mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/NetEligClothesWashersPrdcdQty"/>
					 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="height:4mm;padding-top:.5mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr>
                   	 <!-- End Row 9 Subtract Line 7(a) From Line 6(a) --> 
                   	 
                   	  <!-- row 10 -->
                   	 <tr>
						 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">10</td>
						 <td align="right" style="height:4mm;padding-right:1mm;border-left:0px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$225</td>
						 <td style="height:4mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td> 
                   	 </tr> 
                   	 
                    <!-- Row 11 Multiply Line 8 By Line 9-->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;border-right:1px solid black;">11</td>
                <!-- Multiply Line 8(b) By Line 9(b) --> 
                   	 <td align="right" style="height:4mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ClothesWasherTentativeCrAmt"/>
						 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="height:4mm;background-color:gray;border-right:solid black 1px;border-right:0px;
                   	 border-bottom:solid black 1px;"><span style="width:1mm"/></td>
                   	 </tr> 
                   	<!-- End Row 11 Multiply Line 8 By Line 9--> 
                   	   </table>

<span style="width:123mm;float:left;clear:none;"> 

 <!--James-border-style:solid;border-color:black;border-width:1px 1px 1px 1px;-->
    <!-- line 7 -->
    <div style="width:123mm;padding-top: 5.5mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;">7</div>
      <div class="styLNDesc" style="width:115mm;padding-left:2mm;float:left;font-size:7pt;">
			  Enter the number of eligible clothes washers produced in calendar year 2013
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">...</span>
      </div>
    </div>
    <!-- end line 7 -->
    
    <!-- line 8 -->
    <div style="width:123mm;">
      <div class="styLNLeftNumBox" style="height:6.5mm;width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;">8</div>
      <div class="styLNDesc" style="height:6.5mm;width:115mm;padding-left:2mm;float:left;font-size:7pt;">
			Enter the average number of eligible clothes washers produced
			in the 2 prior calendar years
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">..........................</span>
      </div>
    </div>
    <!-- end line 8 -->
    
    <!-- line 9 -->
    <div style="width:123mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;padding-top:1mm;float:left;padding-left:2mm;">9</div>
      <div class="styLNDesc" style="width:115mm;padding-top:1mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">     
			   Subtract line 8 from line 7
			</span>  
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">...................</span>
      </div>
    </div>
    <!-- end line 9 -->
    
    <!-- line 10-->
    <div style="width:123mm;">
      <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;float:left;padding-left:1.5mm;">10</div>
      <div class="styLNDesc" style="width:115mm;padding-top:1mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">   
			   Applicable amount
			</span>   
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">......................</span>
      </div>
    </div>
    <!-- end line 10 -->
    
    <!-- line 11 -->
    <div style="width:123mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">11</div>
      <div class="styLNDesc" style="width:115mm;padding-top:1mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">  
				Multiply line 9 by line 10
			</span>
        <!--Dotted Line-->
            <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">....................</span>
    	</div>
     </div>
    <!-- end line 11 -->
    </span>
    </div>
      
    <!-- line 12 Tentative Credit For Clothes Washers-->
   <div class="styBB" style="width: 187mm;">  
  	<div class="styLNLeftNumBox"  style="width:6mm;float:left;padding-left:1.5mm;padding-top:.5mm;">12
  	</div>   
     <div class="styLNDesc" style="width: 148.8mm;padding-left:1mm;float:left;">
		<span style="float:left;clear:none;">  
			 Enter the amount from line 11
		</span>
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">..........................</span>
    	</div>    
     	<div class="styLNRightNumBox" style="width:6mm;float:left;padding-left:1.5mm;padding-top:1mm;padding-bottom:0mm;border-bottom:0px;">12</div>
     		<div class="styLNAmountBox" style="width:26mm;font-size:6pt;padding-top:1mm;border-bottom-width:0px; ">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/ClothesWasherTentativeCrAmt"/>
     			 </xsl:call-template> 
     		</div>          
   </div>
    <!-- end line 12 Tentative Credit For Clothes Washers-->  	
  
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
                   	 <td style="background-color:gray;width:6mm;border-left:1px solid black;height:6mm;border-top:0px solid black;border-bottom:1px solid black;border-right:0px;"><span style="width:1px;"/></td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="height:6mm;width:26mm;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a)<br/>Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="height:6mm;width:26mm;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b)<br/>Type B</td>
                     <td style="height:6mm;background-color:gray;width:32mm;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>  	              	                   	                    	 
                   	 </tr>
                   	 
                   	 <!-- Row 13 Refrigerators Produced-->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">13</td>
                <!-- Type A Refrigerators Produced -->
                   	 <td align="right" style="height:6mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeARefrigeratorsProducedQty"/>
     			     </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Type B Refrigerators Produced  -->
                   	 <td align="right" style="height:6mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeBRefrigeratorsProducedQty"/>
     			     </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="height:6mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 <!-- End Row 13 Refrigerators Produced-->
                   	 
                   	 <!-- Row 14 Average Number Eligible Refrigerator -->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">14</td>
                <!-- Average Number Eligible Refrigerator Type A  -->   	 
                   	 <td align="right" style="height:6mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
						 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AvgNumEligRefrigeratorsTypAQty"/>
						 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Average Number Eligible Refrigerator Type B  -->   	 
                   	 <td align="right" style="height:6mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     	  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AvgNumEligRefrigeratorsTypBQty"/>
						 </xsl:call-template>                       
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="height:6mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr>
                   	  <!-- End Row 14 Average Number Eligible Refrigerator -->

                   	  <!-- Row 15 Subtract Line 13 From Line 12 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;padding-top:1.3mm;">15</td>
                <!-- Subtract Line 13(a) From Line 12(a) Type A  -->   	 
                   	 <td align="right" style="height:4mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;padding-top:1.3mm;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EligibleRefrigeratorTypeAQty"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Subtract Line 13(b) From Line 12(b) Type B  -->   	 
                   	 <td align="right" style="height:4mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;padding-top:1mm;" valign="bottom">
                    	 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleRefrigeratorTypeBQty"/>
						 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="height:4mm;background-color:gray;border-right:solid black 1px;border-right:0px;padding-top:1mm;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 <!-- End Row 15 Subtract Line 13 From Line 12 -->
                   	 
                   	  <!-- row 16 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">16</td>
                     <td align="right" style="height:4mm;padding-right:1mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$150</td>
                   	 <td align="right" style="height:4mm;padding-right:1mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$200</td>
                   	 <td style="height:4mm;background-color:gray;border-right:solid black 0px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 <!-- end row 16 -->
                   	 
                     <!-- Row 17 Multiply Line 14 By Line 15-->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">17</td>
                <!-- Multiply Line 14(a) By Line 15(a) Type A  -->   	 
                   	 <td align="right" style="height:4mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/RefrigeratorTypeATentCrAmt"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Multiply Line 14(b) By Line 15(b) Type B  -->   	 
                   	 <td align="right" style="height:4mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RefrigeratorTypeBTentCrAmt"/>
						 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="height:4mm;background-color:gray;border-bottom:solid black 1px;padding-top: .5mm;"><span style="width:1px;"/></td>
                   	 </tr>
                   	 <!-- End Row 17 Multiply Line 14 By Line 15--> 
                   	   </table>

<span style="width:96mm;float:left;clear:none;">	
    <!-- line 13 -->
      <div style="width:96mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;padding-top:5.5mm;">13</div>
      <div class="styLNDesc" style="height:12mm;width:90mm;padding-left:2mm;float:left;font-size:7pt;padding-top:5.5mm;">
			  Enter the number of eligible refrigerators produced in calendar year 2013
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">....................</span>
      </div>
    </div>  
    <!-- end line 13 -->
    
   <!-- line 14 -->
    <div style="width:96mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">14</div>
      <div class="styLNDesc" style="height:6mm;width:90mm;padding-left:2mm;float:left;font-size:7pt;">
			Enter the average number of eligible refrigerators produced in the 2 prior calendar years
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">...............</span>
      </div>
    </div>    
    <!-- end line 14 -->
    
    <!-- line 15 -->
    <div style="width:96mm;">
      <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;float:left;padding-left:1.5mm;">15</div>
      <div class="styLNDesc" style="width:90mm;padding-top:1mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">     
			   Subtract line 14 from line 13
			</span>  
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...........</span>
      </div>
    </div>    
    <!-- end line 15 -->
    
    <!-- line 16 -->
     <div style="width:96mm;">
      <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;float:left;padding-left:1.5mm;">16</div>
      <div class="styLNDesc" style="width:90mm;padding-top:1mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">   
			   Applicable amount
			</span>   
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..............</span>
      </div>
    </div>   
    <!-- end line 16 -->
    
    <!-- line 17 -->
    <div style="width:96mm;">
      <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;float:left;padding-left:1.5mm;">17</div>
      <div class="styLNDesc" style="width:90mm;padding-top:1mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">  
				Multiply line 15 by line 16
			</span>
        <!--Dotted Line-->
            <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">............</span>
    	</div>
     </div>
    <!-- end line 17 -->
    </span>	    
   </div>
 
  <!-- line 18 Tentative Credit For Refrigerators-->
   <div class="styBB" style="width: 187mm;">  
  	<div class="styLNLeftNumBox"  style="width:6mm;float:left;padding-left:1.5mm;padding-top:.5mm;">18
  	</div>   
     <div class="styLNDesc" style="width: 148.8mm;padding-left:2mm;float:left;">
		<span style="float:left;clear:none;">  
			 Add the amounts on line 17 in columns (a) and (b)
		</span>
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">....................</span>
    	</div>    

     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;border-bottom:0px;">18</div>
     		<div class="styLNAmountBox" style="width:26mm;font-size:6pt;padding-top:1mm;border-bottom-width:0px; ">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeCrForRefrigeratorsAmt"/>
     			 </xsl:call-template> 
     		</div>          
   </div>  

    <!-- end line 18 Tentative Credit For Refrigerators-->

   <!--Start of Part IV-->   
  
  					<!-- BEGIN PART IV TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;">Part IV</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
          Current Year Energy Appliance Credit</div>
					</div>
					<!-- END PART II TITLE -->  
	
				<!-- line 19 Total Tentative Credit-->
			  <div style="width: 187mm;">  
				<div class="styLNLeftNumBox"  style="width:6mm;float:left;padding-left:1.5mm;">19</div>
				 <div class="styLNDesc" style="width: 148.8mm;float:left;padding-left:2mm;">
					<span style="float:left;clear:none;">   
						 <b>Total.</b> Add lines 6, 12, and 18
					</span>
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..........................</span>
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">19</div>
						<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
							 <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTentativeCreditAmt"/>
							 </xsl:call-template> 
						</div>                   	
			   </div>
				<!-- end line 19 Total Tentative Credit-->
			
				<!--  Line 20 2% Average Gross Receipts-->    
			  <div style="width: 187mm;">  
				<div class="styLNLeftNumBox"  style="width:6mm;float:left;padding-left:1.5mm;">20</div>
				 <div class="styLNDesc" style="width:148.8mm;float:left;padding-left:2mm;">
					 <span style="float:left;clear:none;"> 	 
						 Enter 4% of average annual gross receipts (see instructions)
					 </span>
				  <!--Dotted Line-->
					 <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">................</span>
				 </div>    
			
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">20</div>
						<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
							 <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AvgAnnualGrossRcptsStdPctAmt"/>
							 </xsl:call-template> 
						</div>                   	
			   </div>
				  <!-- end line 20 2% Average Gross Receipts-->
			
				 <!--  Line 21a -->    
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left:1mm;">21a</div>
					<div class="styLNDesc" style="width:114.8mm;float:left;">
						 <span style="float:left;clear:none;">	 
							 Maximum credit base amount (see instructions)
						 </span>
				  <!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">.............</span>
					</div>        
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21a</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-top:1mm;padding-bottom:0mm;">$25,000,000</div>                   	
					<div class="styShadingCell" style="height:4.3mm;width:32mm;padding-bottom:0mm;background-color:gray;"></div> 
				</div>
			<!-- End  Line 21a -->
			  
			<!--  Line 21b -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">b</div>
					<div class="styLNDesc" style="width:114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Enter the amount from line 19 of your *2012 Form 8909
						</span>
						  <!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">..........</span>    
					</div>    
			
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21b</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PYTotalTentativeCreditAmt"/>
						</xsl:call-template> 
					</div>                   	
					<div class="styShadingCell" style="height:4.3mm;width:32mm;padding-bottom:0mm;background-color:gray;"></div>                   	
				</div>
			<!-- End  Line 21b -->  
			  
				  <!--  Line 21c -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">c</div>
					<div class="styLNDesc" style="width: 114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Enter the amount from line 22a of your *2012 Form 8909
						</span>
							  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">..........</span>    
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21c</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PYClothesWasherTypeBTentCrAmt"/>
						</xsl:call-template>       
					</div>          
					<div class="styShadingCell" style="height:4.3mm;width:32mm;border-bottom:solid black 0px;padding-bottom:0mm;background-color:gray;"></div> 
			   </div>
			  <!-- End Line 21c --> 
			  
				  <!--  Line 21d -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">d</div>
					<div class="styLNDesc" style="width: 114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Enter the amount from line 22b of your *2012 Form 8909
						</span>
							  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">..........</span>    
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21d</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PYRefrigeratorTypeBTentCrAmt"/>
						</xsl:call-template>       
					</div>          
					<div class="styShadingCell" style="height:4.3mm;width:32mm;border-bottom:solid black 0px;padding-bottom:0mm;background-color:gray;"></div> 
				</div>
			  <!-- End Line 21d -->
			   
				  <!--  Line 21e -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">e</div>
					<div class="styLNDesc" style="width: 114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Add lines 21c and 21d
						</span>
							  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">.....................</span>    
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21e</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TentativePriorYrCreditAmt"/>
						</xsl:call-template>       
					</div>          
					<div class="styShadingCell" style="height:4.3mm;width:32mm;border-bottom:solid black 0px;padding-bottom:0mm;background-color:gray;"></div> 
				</div>
			  <!-- End Line 21e -->
			
				  <!--  Line 21f -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">f</div>
					<div class="styLNDesc" style="width: 114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Subtract line 21e from line 21b
						</span>
							  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">..................</span>    
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21f</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetTentativePriorYrCreditAmt"/>
						</xsl:call-template>       
					</div>          
					<div class="styShadingCell" style="height:4.3mm;width:32mm;border-bottom:solid black 0px;padding-bottom:0mm;background-color:gray;"></div> 
				</div>
			  <!-- End Line 21f -->
			
				  <!--  Line 21g -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">g</div>
					<div class="styLNDesc" style="width: 114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Enter the amount from line 20 of your *2012 Form 8909
						</span>
							  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">..........</span>    
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21g</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PYAvgAnnualGrossRcptsStdPctAmt"/>
						</xsl:call-template>       
					</div>          
					<div class="styShadingCell" style="height:4.3mm;width:32mm;border-bottom:solid black 0px;padding-bottom:0mm;background-color:gray;"></div> 
				</div>
			  <!-- End Line 21g -->
			
				  <!--  Line 21h -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">h</div>
					<div class="styLNDesc" style="width: 114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Enter the <b>smallest</b> of the amount on line 21a, 21f, or 21g
						</span>
							  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">..........</span>    
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21h</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SmallerOfLinesAmt"/>
						</xsl:call-template>       
					</div>          
					<div class="styShadingCell" style="height:4.3mm;width:32mm;border-bottom:solid black 0px;padding-bottom:0mm;background-color:gray;"></div> 
				</div>
			  <!-- End Line 21h -->
			  
			  <!--  Line 21i -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">i</div>
					<div class="styLNDesc" style="width: 114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Enter the amount from line 21h of your *2012 Form 8909
						</span>
							  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">..........</span>    
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21i</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/PYSmallerOfLinesAmt"/>
						</xsl:call-template>       
					</div>          
					<div class="styShadingCell" style="height:4.3mm;width:32mm;border-bottom:solid black 0px;padding-bottom:0mm;background-color:gray;"></div> 
				</div>
			  <!-- End Line 21i -->
			  
			  <!--  Line 21j -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">j</div>
					<div class="styLNDesc" style="width: 114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Add lines 21h and 21i
						</span>
							  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">.....................</span>    
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21j</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSmallerOfLinesAmt"/>
						</xsl:call-template>       
					</div>          
					<div class="styShadingCell" style="height:4.3mm;width:32mm;border-bottom:solid black 0px;padding-bottom:0mm;background-color:gray;"></div> 
				</div>
			  <!-- End Line 21j -->
			  
				   <!--  Line 21k --> 
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">k</div>
					<div class="styLNDesc" style="width:146.8mm;float:left;">
						<span style="float:left;clear:none;"> 
						   Subtract line 21j from line 21a
						</span>
						  <!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..........................</span>    
						   
					</div>
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21k</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetSmallerOfLinesAmt"/>
						</xsl:call-template> 
					</div>   
						   
				</div>   
				   <!-- End Line 21k --> 
			
				 <!--  Line 22a -->    
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left:1mm;">22a</div>
					<div class="styLNDesc" style="width:114.8mm;float:left;">
						 <span style="float:left;clear:none;">	 
							 Enter the amount from line 12
						 </span>
				  <!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">..................</span>
					</div>        
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">22a</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ClothesWasherRefrigTentCrGrp/ClothesWasherTentativeCrAmt"/>
						</xsl:call-template>       
					</div>          
					<div class="styShadingCell" style="height:4.3mm;width:32mm;border-bottom:solid black 0px;padding-bottom:0mm;background-color:gray;"></div> 
				</div>
			<!-- End  Line 22a -->
			  
			<!--  Line 22b -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="padding-left: 4.5mm">b</div>
					<div class="styLNDesc" style="width:114.8mm;float:left;">
						<span style="float:left;clear:none;"> 
							Enter the amount from line 17, column (b)
						</span>
						  <!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">...............</span>    
					</div>    
			
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">22b</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ClothesWasherRefrigTentCrGrp/RefrigeratorTypeBTentCrAmt"/>
						</xsl:call-template> 
					</div>                   	
					<div class="styShadingCell" style="height:4.3mm;width:32mm;padding-bottom:0mm;background-color:gray;"></div>                   	
				</div>
			<!-- End  Line 22b -->  
			  
				  <!--  Line 22c -->  
				<div style="width: 187mm">  
					<div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">c</div>
				 <div class="styLNDesc" style="width:148.8mm;float:left;padding-left:2mm;">
						<span style="float:left;clear:none;"> 
							Add lines 22a and 22b
						</span>
							  <!--Dotted Line-->
						 <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">.....................</span>    
					</div>    
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">22c</div>
					<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AggregateTenativeCrAmt"/>
						</xsl:call-template>       
					</div>          
					
			   </div>
			  <!-- End Line 22c --> 
			 
				  <!--  Line 23 Maximum Credit Allowed Amount-->    
			  <div style="width: 187mm;">  
				<div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">23</div>
				 <div class="styLNDesc" style="width:148.8mm;float:left;padding-left:2mm;">
					<span style="float:left;clear:none;"> 
						 Maximum credit amount. Add lines 21k and 22c
					</span>
						  <!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...................</span>    
						   
				 </div>
					<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">23</div>
						<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
							 <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MaximumCreditAllowedAmt"/>
							 </xsl:call-template> 
						</div>                   	    	    
			  </div>
			   <!-- End Line 23 Maximum Credit Allowed Amount-->
			  
 
			   <!--  Line 24 Smallest of lines 19, 20 or 23-->    
			  <div style="width: 187mm;">  
				<div  class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">24</div>
				 <div class="styLNDesc" style="width:148.8mm;float:left;padding-left:2mm;padding-bottom:0mm;">
					<span style="float:left;clear:none;">  
						 Enter the <b>smallest</b> of the amount on line 19, 20, or 23
						<!-- Single Producer -->  
						 <xsl:call-template name="LinkToLeftoverDataTableInline">
							<xsl:with-param name="Desc">Part IV Line 24 - Single Producer</xsl:with-param>
						 <xsl:with-param name="TargetNode" select="$FormData/SingleProducerTxt"/>
					   </xsl:call-template>
					</span>    
						  <!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.................</span>   
					  
					</div>
					<div class="styLNRightNumBox" style="height:4mm;width:6mm;padding-bottom:0mm;">24</div>
						<div class="styLNAmountBox" style="height:4mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
							 <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ApplianceTentativeCreditAmt"/>
							 </xsl:call-template> 
						</div>                   	    	    
			  </div>
			   <!-- End Line 24 Smallest of lines 19, 20 or 23-->

			   <!--  Line 25 Energy Efficient Appliance Credits Amount-->    
			    <div style="width: 187mm;">  
					<div class="styLNLeftNumBox" style="height:7mm;width:6mm;padding-top:1mm;float:left;padding-left:1.5mm;">25</div>
					<div class="styLNDesc" style="height:7mm;width:148.8mm;padding-top:1mm;float:left;padding-left:2mm;">
							 Energy efficient appliance credit from partnerships, S corporations, cooperatives, estates, and trusts
							 <span style="float:left;clear:none;">(see instructions)</span>
							  <!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..............................</span>    
					</div>    
			
					<div class="styLNRightNumBox" style="height:7mm;width:6mm;padding-top:3.5mm;padding-bottom:0mm;">25</div>
						<div class="styLNAmountBox" style="height:7mm;width:26mm;font-size:6pt;padding-top:3.5mm;padding-bottom:0mm;">
							 <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EnergyEffcntApplianceCrdtAmt"/>
							 </xsl:call-template> 
						</div>                   	 
				</div>
				 <!-- End Line 25 Energy Efficient Appliance Credits Amount--> 

				  <!--  Line 26 Add Lines 24 and 25-->    
				<div style="width: 187mm;">  
							<div class="styLNLeftNumBox" style="height:7mm;width:6mm;padding-top:1mm;float:left;padding-left:1.5mm;">26</div>
							<div class="styLNDesc" style="height:7mm;width:148.8mm;padding-top:1mm;float:left;padding-left:2mm;">
									Add lines 24 and 25. Cooperatives, estates, and trusts, go to line 27. Partnerships and S corporations, stop here and report this amount on Schedule K. All others, stop here and report this amount on Form 3800, Part III, line 1q
						 <!--Dotted Line --> 
								<span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">.</span>
									 </div>    
								<div class="styLNRightNumBox" style="height:7mm;width:6mm;padding-top:3.5mm;padding-bottom:0mm;">26</div>
							<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
								 <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalApplianceCreditAmt"/>
								 </xsl:call-template> 
							</div>                   	 
				</div>
				 <!-- End Line 26 Add Lines 24 and 25--> 
					
				 <!--  Line 27 Amount Allocated to Beneficiaries of Estates or Trusts or Patrons of the Cooperatives Amount-->
				<div style="width: 187mm;">  
					<div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">27</div>
					<div class="styLNDesc" style="width:148.8mm;float:left;padding-left:2mm;">
					 Amount allocated to beneficiaries of the estate or trust, or to patrons of the cooperative (see instructions)
				
					 </div>    
							<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;">27</div>
							<div class="styLNAmountBox" style="width:26mm;font-size:6pt;padding-bottom:0mm;">
								 <xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AllocatedToBeneficiariesAmt"/>
								 </xsl:call-template> 
							</div>                   	    	
				   </div>
				  <!-- End Line 27 Amount Allocated to Beneficiaries of Estates or Trusts or Patrons of the Cooperatives Amount-->  
				  
				 <!--  Line 28 Subtract line 27 from line 26-->    
				    <div style="width: 187mm;">  
						<div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">28</div>
						<div class="styLNDesc" style="width: 148.8mm;float:left;padding-left:2mm;">
								Cooperatives, estates, and trusts, subtract line 27 from line 26. Report this amount on Form 3800, Part III, line 1q
								<!--<span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">..................................</span>--> 
						</div>    
						<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;">28</div>
						<div class="styLNAmountBox" style="width:26mm;font-size:6pt;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstatesTrustsCooperativesAmt"/>
							</xsl:call-template> 
						</div>                   	    	
				    </div>*Include amounts from predecessors.
				   <!-- End Line 28 Subtract line 27 from line 26--> 
				   
  <!--  FOOTER-->
        <div style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see separate instructions. </span> 
          <span style="width:76px;"></span>                      
          Cat. No. 37719E
          <span style="width:115px;"></span>  
          Form <span class="styBoldText">8909</span> (2014)
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
            <xsl:with-param name="Desc">Part IV Line 24 - Single Producer</xsl:with-param> 
            <xsl:with-param name="TargetNode" select="$FormData/SingleProducerTxt"/> 
            <xsl:with-param name="DescWidth" select="100"/> 
        </xsl:call-template> 
        </table>
      <!-- END Left Over Table -->      
  </form>  
</body>
</html>
</xsl:template>    

</xsl:stylesheet>