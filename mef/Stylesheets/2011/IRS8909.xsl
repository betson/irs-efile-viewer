<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 12/27/2011 -->
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
  <div class="styBB" style="width:187mm;">
    <div  class="styFNBox" style="width:31mm;font-size: 7pt;">
		<div class="" style="height:13.2mm;" >
      Form <span class="styFormNumber">8909</span>      
       <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span> 
      </div> 
       <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="width:125mm;padding-top:4mm;">
      <div class="styMainTitle" style="height:12.3mm;">Energy Efficient Appliance Credit</div>
      <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold">
        <img src="{$ImagePath}/8909_Bullet.gif" alt="MediumBullet"/>  
        Attach to your tax return. 
      </div>
    </div>
    <div class="styTYBox" style="width:30mm;border-left-width: 1px;">
      <div class="styOMB" style="height:2mm;">OMB No. 1545-2055</div>
      <div class="styTaxYear" style="">20<span class="styTYColor">11</span></div>
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
<!--<div style="width:187mm;">  James border-style:solid;border-color:black;boder-width: 1px 1px 1px 1px;-->
    <!-- line 1 Number Eligible Dishwashers-->
    <div style="width:187mm;">
  <table cellspacing="0" cellpadding="0" style="float:right">
     	<tr>      
                <td style="background-color:gray;width:18px;border-left:1px solid black;height:6mm;border-top:0px solid black;border-bottom:1px solid black;border-right:0px;"><span style="width:1px;"/></td>
                <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:26mm;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a)<br/>Type A</td>
                <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:26mm;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b)<br/>Type B</td>
                <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:26mm;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(c)<br/>Type C</td>
                <td style="background-color:gray;width:32mm;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>                   	                   	                    	 
        </tr>
            <!--Begin Line 1 Number Eligible Dishwashers-->
                   	<tr>
						 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">1</td>
					 <!-- Type A Clothes Washers Produced -->  	 
						 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleDishwashersTypeAQty"/>
						 </xsl:call-template> 
							<span style="width:1px;"/>
						 </td>
					<!-- Type B Clothes Washers Produced -->   	 
						 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleDishwashersTypeBQty"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
					<!-- Type C Clothes Washers Produced -->   	 
						 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleDishwashersTypeCQty"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
						 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	</tr>
            <!--End Line 1 Number Eligible Dishwashers-->

            <!--Begin Line 2 Average Number Dishwashers Produced In Prior 2 Calendar Years-->
                   	<tr>
						 <td valign="bottom" style="height:10mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">2</td>
					 <!-- Type A Clothes Washers Produced -->  	 
						 <td align="right" style="height:10mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DshwshrPrdcdPr2YrsTypeAAvgQty"/>
						 </xsl:call-template> 
							<span style="width:1px;"/>
						 </td>
					<!-- Type B Clothes Washers Produced -->   	 
						 <td align="right" style="height:10mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DshwshrPrdcdPr2YrsTypeBAvgQty"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
					<!-- Type C Clothes Washers Produced -->   	 
						 <td align="right" style="height:10mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DshwshrPrdcdPr2YrsTypeCAvgQty"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
						 <td style="height:10mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
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
					<!-- Type C Clothes Washers Produced -->   	 
						 <td align="right" style="height:4mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleDishwashersTypeCNetQty"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
						 <td style="height:4mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
					</tr>
				<!--End Line 3 Subtract Line 2(a) From Line 1(a)-->
			
				<!--Begin Line 4 Subtract Line 2(a) From Line 1(a)-->
					<tr>
						 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">4</td>
						 <td align="right" style="height:4.5mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$25</td>
						 <td align="right" style="height:4.5mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$50</td>
						 <td align="right" style="height:4.5mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$75</td>                      
						 <td style="height:4.5mm;background-color:gray;border-right:solid black 1px;border-right:0px;"/>                 	 
                   	</tr>  
            <!--End Line 4 Subtract Line 2(a) From Line 1(a)-->
        
            <!--Begin Line 5 Multiply Line 3(a) by Line 4(a)-->
                   	<tr>
						 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">5</td>
					 <!-- Type A Clothes Washers Produced -->  	 
						 <td align="right" style="height:4mm;border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DishwashersTypeATentativeCrAmt"/>
						 </xsl:call-template> 
							<span style="width:1px;"/>
						 </td>
					<!-- Type B Clothes Washers Produced -->   	 
						 <td align="right" style="height:4mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DishwashersTypeBTentativeCrAmt"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
					<!-- Type C Clothes Washers Produced -->   	 
						 <td align="right" style="height:4mm;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
							  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/DishwashersTypeCTentativeCrAmt"/>
						 </xsl:call-template>                         
							<span style="width:1px;"/>
						  </td>
						 <td style="height:5mm;background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
					</tr>
				<!--End Line 5 Multiply Line 3(a) by Line 4(a) -->
     </table>   
 <span style="float:left;clear:none;">     

     <!-- end line 1 Number Eligible Dishwashers-->
    <div style="width:70mm;border-top-width: 2mm;">
      <div class="styLNLeftNumBox" style="width:5mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;padding-top:5.5mm;">1</div>
      <div class="styLNDesc" style="width:65mm;padding-left:2mm;float:left;font-size:7pt;padding-top:5.5mm;">
			  Enter the number of eligible dishwashers produced in calendar year 2011
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">.....</span>
      </div>
    </div>
       <!-- end line 1 Number Eligible Dishwashers-->

    <!-- line 2 Average Number Dishwashers Produced In Prior 2 Calendar Years-->
    <div style="width:70mm;">
      <div class="styLNLeftNumBox" style="height:8mm;width:5mm;text-align:center;float:left;padding-bottom:0mm;padding-left:2mm;">2</div>
		  <div class="styLNDesc" style="height:8mm;width:65mm;padding-left:2mm;padding-bottom:0mm;float:left;">
				Enter the average number of eligible dishwashers produced in the 2 prior
				calendar years
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:.5mm;clear:none;">.............</span>
      </div>
    </div>
    <!-- end line 2 Average Number Dishwashers Produced In Prior 2 Calendar Years-->
    
     <!-- line 3 Subtract Line 2(a) From Line 1(a)-->
    <div style="width:70mm;padding-top:1mm;">
      <div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-left:2mm;">3</div>
		  <div class="styLNDesc" style="width:65mm;padding-left:2mm;float:left;">
				<span style="float:left;clear:none;">     
					Subtract line 2 from line 1
				</span>	
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.......</span>
		  </div>
    </div>
    <!-- end line 3 Subtract Line 2(a) From Line 1(a)-->   
    
    <!-- line 4 -->
    <div style="width:70mm;padding-top:1mm;">
      <div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-left:2mm;">4</div>
      <div class="styLNDesc" style="width:65mm;padding-left:2mm;float:left;">
			<span style="float:left;clear:none;">   
				Applicable amount
			</span>	
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.........</span>
      </div>
    </div>
    <!-- end line 4 --> 
    
      <!-- line 5 Multiply Line 3(a) by Line 4(a)-->
    <div style="width:70mm;">
      <div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-left:2mm;">5</div>
      <div class="styLNDesc" style="width: 65mm;padding-left:2mm;float:left;">
			<span style="float:left;clear:none;">   
				Multiply line 3 by line 4
			</span>	
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">........</span>
      </div>
     </div>
    <!-- end line 5 Multiply Line 3(a) by Line 4(a)-->  
 </span>
</div>
				<!-- line 6 Multiply Line 3(a) by Line 4(a)-->
				<div class="styBB" style="width:187mm;">
				  <div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-left:2mm;">6</div>
				  <div class="styLNDesc" style="width: 149.8mm;padding-left:2mm;float:left;">
						<span style="float:left;clear:none;">   
							Add the amounts of line 5 in columns (a), (b), and (c)
						</span>	
					<!--Dotted Line-->
							<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...................</span>
				  </div>
				  <div class="styLNRightNumBox" style="width:6mm;text-align:center;border-bottom-width:0px;" valign="bottom">6</div>
				  <div class="styLNAmountBox"  style="width:26mm;font-size:6pt;padding-top:1mm;border-bottom-width:0px;" valign="bottom">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TentativeCrdtForDishwashers"/>
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
                   	 <td style="background-color:gray;width:18px;border-left:1px solid black;height:6mm;border-top:0px solid black;border-bottom:1px solid black;border-right:0px;"><span style="width:1px;"/></td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:26mm;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a)<br/>Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:26mm;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b)<br/>Type B</td>
                   	 <td style="background-color:gray;width:32mm;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>                   	                   	                    	 
                   	 </tr>
                   	 
                   	 <!--Row 6 Clothes Washers Produced-->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">7</td>
                 <!-- Type A Clothes Washers Produced -->  	 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeAClothesWashersProdcd"/>
     			     </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Type B Clothes Washers Produced -->   	 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeBClothesWashersProdcd"/>
     			     </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr>
                   	 <!--End Row 6 Clothes Washers Produced--> 
                   	 
                   	 <!-- Row 7 Average Number Eligible Clothes Washer -->
                   	 <tr>
                  	 <td valign="bottom" style="height:7mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">8</td>
                <!-- Average Number Eligible Clothes Washer Type A -->   	 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblClothesWasherTypA"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Average Number Eligible Clothes Washer Type B -->   	 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblClothesWasherTypB"/>
					 </xsl:call-template>                       
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr>
                   	 <!-- End Row 7 Average Number Eligible Clothes Washer --> 

                   	 <!-- Row 8 Subtract Line 7(a) From Line 6(a) -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">9</td>
                <!-- Subtract Line 7(a) From Line 6(a) Type A -->   	 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EligibleClothesWasherTypeAQty"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Subtract Line 7(b) From Line 6(b) Type B -->   	 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EligibleClothesWasherTypeBQty"/>
					 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr>
                   	 <!-- End Row 8 Subtract Line 7(a) From Line 6(a) --> 
                   	 
                   	  <!-- row 9 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">10</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$175</td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$225</td>                      
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"/>                 	 
                   	 </tr> 
                   	 
                    <!-- Row 10 Multiply Line 8 By Line 9-->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">11</td>
                <!-- Multiply Line 8(a) By Line 9(a) --> 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/ClothesWasherTypeATentCrAmt"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Multiply Line 8(b) By Line 9(b) --> 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/ClothesWasherTypeBTentCrAmt"/>
						 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;
                   	 border-bottom:solid black 1px;"><span style="width:1mm"/></td>
                   	 </tr> 
                   	<!-- End Row 10 Multiply Line 8 By Line 9--> 
                   	   </table>

<span style="float:left;clear:none;">  
    <!-- line 6 -->
    <div style="width:93mm;border-top-width: 2mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;padding-top:5.5mm;">7</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;padding-top:5.5mm;">
			  Enter the number of eligible clothes washers produced in<br/>
			  calendar year 2011
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">..............</span>
      </div>
    </div>
    <!-- end line 6 -->
    
    <!-- line 7 -->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;">8</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			Enter the average number of eligible clothes washers produced<br/>
			in the 2 prior calendar years
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">...........</span>
      </div>
    </div>
    <!-- end line 7 -->
    
    <!-- line 8 -->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;">9</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">     
			   Subtract line 8 from line 7
			</span>  
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">............</span>
      </div>
    </div>
    <!-- end line 8 -->
    
    <!-- line 9-->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">10</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">   
			   Applicable amount
			</span>   
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">...............</span>
      </div>
    </div>
    <!-- end line 9 -->
    
    <!-- line 10 -->
    <div style="width:93mm;padding-top:.8mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">11</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">  
				Multiply line 9 by line 10
			</span>
        <!--Dotted Line-->
            <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">.............</span>
    	</div>
     </div>
    <!-- end line 10 -->
    </span>
    </div>
      
    <!-- line 11 Tentative Credit For Clothes Washers-->
   <div class="styBB" style="width: 187mm;">  
  	<div class="styLNLeftNumBox"  style="width:6mm;float:left;padding-left:1.5mm;padding-top:.5mm;">12
  	</div>   
     <div class="styLNDesc" style="width: 148.8mm;padding-left:2mm;float:left;">
		<span style="float:left;clear:none;">  
			 Add the amounts on line 11 in columns (a) and (b)
		</span>
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">...................</span>
    	</div>    
     	<div class="styLNRightNumBox" style="width:6mm;float:left;padding-left:1.5mm;padding-top:1mm;padding-bottom:0mm;border-bottom:0px;">12</div>
     		<div class="styLNAmountBox" style="width:26mm;font-size:6pt;padding-top:1mm;border-bottom-width:0px; ">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeCrdtForClothesWashers"/>
     			 </xsl:call-template> 
     		</div>          
   </div>
    <!-- end line 11 Tentative Credit For Clothes Washers-->  	
  
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
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:26mm;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a)<br/>Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:26mm;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b)<br/>Type B</td>
                     <td style="background-color:gray;width:32mm;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>  	              	                   	                    	 
                   	 </tr>
                   	 
                   	 <!-- Row 12 Refrigerators Produced-->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">13</td>
                <!-- Type A Refrigerators Produced -->
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeARefrigeratorsProdcd"/>
     			     </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Type B Refrigerators Produced  -->
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TypeBRefrigeratorsProdcd"/>
     			     </xsl:call-template>                         
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 <!-- End Row 12 Refrigerators Produced-->
                   	 
                   	 <!-- Row 13 Average Number Eligible Refrigerator -->
                   	 <tr>
                  	 <td valign="bottom" style="height:7mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">14</td>
                <!-- Average Number Eligible Refrigerator Type A  -->   	 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
						 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblRefrigTypA"/>
						 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Average Number Eligible Refrigerator Type B  -->   	 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     	  <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/AvgeNumElgblRefrigTypB"/>
						 </xsl:call-template>                       
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr>
                   	  <!-- End Row 13 Average Number Eligible Refrigerator -->

                   	  <!-- Row 14 Subtract Line 13 From Line 12 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">15</td>
                <!-- Subtract Line 13(a) From Line 12(a) Type A  -->   	 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EligibleRefrigeratorTypeAQty"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Subtract Line 13(b) From Line 12(b) Type B  -->   	 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/EligibleRefrigeratorTypeBQty"/>
						 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 <!-- End Row 14 Subtract Line 13 From Line 12 -->
                   	 
                   	  <!-- row 15 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">16</td>
                     <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$150</td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$200</td>
                   	 <td style="background-color:gray;border-right:solid black 0px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                     <!-- Row 16 Multiply Line 14 By Line 15-->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">17</td>
                <!-- Multiply Line 14(a) By Line 15(a) Type A  -->   	 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/RefrigeratorTypeATentCrAmt"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Multiply Line 14(b) By Line 15(b) Type B  -->   	 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/RefrigeratorTypeBTentCrAmt"/>
						 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-bottom:solid black 1px;"><span style="width:1mm"/></td>
                   	 </tr>
                   	 <!-- End Row 16 Multiply Line 14 By Line 15--> 
                   	   </table>

<span style="float:left;clear:none;">
    <!-- line 12 -->
      <div style="width:93mm;border-top-width: 2mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;padding-top:5.5mm;">13</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;padding-top:5.5mm;">
			  Enter the number of eligible refrigerators produced in<br/>
			  calendar year 2011
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">..............</span>
      </div>
    </div>  
    <!-- end line 12 -->
    
   <!-- line 13 -->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">14</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			Enter the average number of eligible refrigerators produced in<br/>
			the 2 prior calendar years
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">............</span>
      </div>
    </div>    
    <!-- end line 13 -->
    
    <!-- line 14 -->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">15</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">     
			   Subtract line 14 from line 13
			</span>  
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...........</span>
      </div>
    </div>    
    <!-- end line 14 -->
    
    <!-- line 15 -->
     <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">16</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">   
			   Applicable amount
			</span>   
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..............</span>
      </div>
    </div>   
    <!-- end line 15 -->
    
    <!-- line 16 -->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">17</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">  
				Multiply line 15 by line 16
			</span>
        <!--Dotted Line-->
            <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">............</span>
    	</div>
     </div>
    <!-- end line 16 -->
    </span>	    
   </div>
 
  <!-- line 17 Tentative Credit For Refrigerators-->
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
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeCrdtForRefrigerators"/>
     			 </xsl:call-template> 
     		</div>          
   </div>  

    <!-- end line 17 Tentative Credit For Refrigerators-->

   <!--Start of Part IV-->   
  
  					<!-- BEGIN PART IV TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;">Part IV</div>
						<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
          Current Year Energy Appliance Credit</div>
					</div>
					<!-- END PART II TITLE -->  
	
    <!-- line 18 Total Tentative Credit-->
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
         				<xsl:with-param name="TargetNode" select="$FormData/TotalTentativeCredit"/>
     			 </xsl:call-template> 
     		</div>                   	
   </div>
    <!-- end line 18 Total Tentative Credit-->

    <!--  Line 19 2% Average Gross Receipts-->    
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
      <!-- end line 19 2% Average Gross Receipts-->

     <!--  Line 20a -->    
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
<!-- End  Line 20a -->  

      <div style="width: 187mm">  
		 <div class="styLNLeftNumBox" style="padding-left: 4.5mm">b</div>
		 <div class="styLNDesc" style="width:114.8mm;float:left;">
			<span style="float:left;clear:none;"> 
				Enter the amount from line 11, column (b)
			</span>
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">...............</span>    
         </div>    

     	 <div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">21b</div>
     	 <div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
      			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/ClothesWasherRefrigTentCrGroup/ClothesWasherTypeBTentCrAmt"/>
     			 </xsl:call-template> 
     	 </div>                   	
     	 <div class="styShadingCell" style="height:4.3mm;width:32mm;padding-bottom:0mm;background-color:gray;"></div>                   	
  </div>
<!-- End  Line 21a Line 10 amount-->  
  
      <!--  Line 21b Line 16 Amount-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">c</div>
    <div class="styLNDesc" style="width: 114.8mm;float:left;">
		<span style="float:left;clear:none;"> 
			Enter the amount from line 17, column (b)
        </span>
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:1mm;clear:none;">...............</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;">21c</div>
     		<div class="styLNAmountBox" style="width:26mm;font-size:6pt;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/ClothesWasherRefrigTentCrGroup/RefrigeratorTypeBTentCrAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4.3mm;width:32mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 21b Line 16 Amount--> 
  
      <!--  Line 22 Maximum Credit Allowed Amount-->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">22</div>
     <div class="styLNDesc" style="width:148.8mm;float:left;padding-left:2mm;">
		<span style="float:left;clear:none;"> 
			 Maximum credit amount. Add lines 21a through 21c
        </span>
              <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...................</span>    
               
     </div>
     	<div class="styLNRightNumBox" style="height:4.3mm;width:6mm;padding-bottom:0mm;">22</div>
     		<div class="styLNAmountBox" style="height:4.3mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/MaximumCreditAllowedAmt"/>
     			 </xsl:call-template> 
     		</div>                   	    	    
  </div>
   <!-- End Line 22 Maximum Credit Allowed Amount-->
  
 
   <!--  Line 23 Smallest of lines 18, 19 or 22-->    
  <div style="width: 187mm;">  
  	<div  class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">23</div>
     <div class="styLNDesc" style="width:148.8mm;float:left;padding-left:2mm;padding-bottom:0mm;">
		<span style="float:left;clear:none;">  
			 Enter the <b>smallest</b> of the amount on line 19, 20, or 22
			<!-- Single Producer -->  
             <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Part IV Line 23 - Single Producer</xsl:with-param>
             <xsl:with-param name="TargetNode" select="$FormData/SingleProducer"/>
           </xsl:call-template>
        </span>    
              <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.................</span>   
          
    	</div>
     	<div class="styLNRightNumBox" style="height:4.5mm;width:6mm;padding-top1mm;padding-bottom:0mm;">23</div>
     		<div class="styLNAmountBox" style="height:4.5mm;width:26mm;font-size:6pt;padding-top:1.3mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeApplianceCreditAmt"/>
     			 </xsl:call-template> 
     		</div>                   	    	    
  </div>
   <!-- End Line 23 Smallest of lines 18, 19 or 22-->

   <!--  Line 24 Energy Efficient Appliance Credits Amount-->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">24</div>
    <div class="styLNDesc" style="width:148.8mm;float:left;padding-left:2mm;">
			 Energy efficient appliance credit from partnerships, S corporations, cooperatives, estates, and trusts
			 <span style="float:left;clear:none;">(see instructions)</span>
              <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..............................</span>    
    </div>    

     	<div class="styLNRightNumBox" style="height:6.3mm;width:6mm;padding-top:4mm;padding-bottom:0mm;">24</div>
     		<div class="styLNAmountBox" style="height:6.3mm;width:26mm;font-size:6pt;padding-top:4.5mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EnergyEffcntApplianceCrdtAmt"/>
     			 </xsl:call-template> 
     		</div>                   	 
   </div>
     <!-- End Line 24 Energy Efficient Appliance Credits Amount--> 

  <!--  Line 25 Add Lines 23 and 24-->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="height:7mm;width:6mm;float:left;padding-left:1.5mm;">25</div>
    <div class="styLNDesc" style="height:7mm;width:148.8mm;float:left;padding-left:2mm;">
			Add lines 23 and 24. Cooperatives, estates, and trusts, go to line 26. Partnerships and S corporations, stop here and report this amount on Schedule K. All others, stop here and report this amount on 
            Form 3800, line 1q

              <!--Dotted Line
        <span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">.....</span>--> 
     </div>    
    	     	<div class="styLNRightNumBox" style="height:7mm;width:6mm;padding-top:4mm;padding-bottom:0mm;">25</div>
     		<div class="styLNAmountBox" style="height:7mm;padding-top:4.5mm;width:26mm;font-size:6pt;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TotalApplianceCreditAmt"/>
     			 </xsl:call-template> 
     		</div>                   	 
   </div>
 <!-- End Line 25 Add Lines 23 and 24--> 
    
 <!--  Line 26 Amount Allocated to Beneficiaries of Estates or Trusts or Patrons of the Cooperatives Amount-->
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">26</div>
    <div class="styLNDesc" style="width:148.8mm;float:left;padding-left:2mm;">
     Amount allocated to beneficiaries of the estate or trust, or to patrons of the cooperative (see instructions)

     </div>    
   	     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">26</div>
     		<div class="styLNAmountBox" style="width:26mm;font-size:6pt;padding-top:1.5mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AllctedToBeneEstTrstPatrnAmt"/>
     			 </xsl:call-template> 
     		</div>                   	    	
   </div>
  <!-- End Line 26 Amount Allocated to Beneficiaries of Estates or Trusts or Patrons of the Cooperatives Amount-->  
  
 <!--  Line 27 Subtract line 26 from line 25-->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="width:6mm;float:left;padding-left:1.5mm;">27</div>
    <div class="styLNDesc" style="width: 148.8mm;float:left;padding-left:2mm;">
			Cooperatives, estates, and trusts, subtract line 26 from line 25. Report this amount on Form 3800, line 1q
			<span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">..................................</span> 
      </div>    
      	     	<div class="styLNRightNumBox" style="width:6mm;padding-top:4.5mm;padding-bottom:0mm;border-bottom-width:0px;">27</div>
     		<div class="styLNAmountBox" style="width:26mm;font-size:6pt;padding-top:5mm;padding-bottom:0mm;border-bottom-width:0px;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EstTrCYBondCrAmt"/>
     			 </xsl:call-template> 
     		</div>                   	    	
   </div>
   <!-- End Line 27 Subtract line 26 from line 25--> 
   
  <!--  FOOTER-->
        <div style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:120px;"></span>                      
          Cat. No. 37719E
          <span style="width:130px;"></span>  
          Form <span class="styBoldText">8909</span> (2011)
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
            <xsl:with-param name="Desc">Part IV Line 23 - Single Producer</xsl:with-param> 
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