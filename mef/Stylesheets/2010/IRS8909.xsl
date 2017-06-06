<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 12/22/2010 -->
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
      <div class="styTaxYear" style="">20<span class="styTYColor">10</span></div>
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
<!--<div style="width:187mm;">  James border-style:solid;border-color:black;boder-width: 1px 1px 1px 1px;-->
    <!-- line 1 Number Eligible Dishwashers-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4mm;width:6mm;text-align:center;float:left;padding-top:3mm;padding-left:2mm;">1</div>
		  <div class="styLNDesc" style="height:4mm;width:105mm;padding-left:2mm;float:left;padding-top:3mm;">
				<span style="float:left;clear:none;">   
				    Enter the number of eligible dishwashers produced in calendar year 2010
				</span>    
        <!--Dotted Line-->
                <!--<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.</span>-->
		  </div>
          <div class="styLNRightNumBox" style="height:4mm;width:6mm;text-align:center;padding-top:3mm;">1</div>
          <div class="styLNAmountBox"  style="height:4mm;border-right-width:1px;border-bottom-width:1px;padding-top:3mm;">
                          <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/NumEligibleDishwashers"/>
     			         </xsl:call-template>                         
         </div>
          <div  class="styLNAmountBox" style="height:7mm;width:37.8mm;background-color:gray;border-left-width:0px;border-bottom-width:0px;"/>               	 
		  
      </div>
    <!-- end line 1 Number Eligible Dishwashers-->
    
    <!-- line 2 Average Number Dishwashers Produced In Prior 2 Calendar Years-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:5mm;width:6mm;text-align:center;float:left;padding-bottom:0mm;padding-left:2mm;">2</div>
		  <div class="styLNDesc" style="height:5mm;width:105mm;padding-left:2mm;padding-bottom:0mm;float:left;">
				Enter the average number of eligible dishwashers produced in the 2 prior<br/>
				calendar years
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:.5mm;clear:none;">.....................</span>
      </div>
      <div class="styLNRightNumBox" style="height:6mm;width:6mm;text-align:center;padding-top:3mm;">2</div>
      <div class="styLNAmountBox"  style="height:6mm;padding-top:3mm;border-right-width:1px;border-bottom-width:1px;">
           <xsl:call-template name="PopulateAmount">
         		<xsl:with-param name="TargetNode" select="$FormData/AvgNumDshwshrPrdPr2Yrs"/>
     		</xsl:call-template>                         
      </div>
      <div  class="styLNAmountBox" style="height:7mm;width:37.8mm;background-color:gray;border-left-width:0px;border-bottom-width:0px;"/>                 	 
      
    </div>
    <!-- end line 2 Average Number Dishwashers Produced In Prior 2 Calendar Years-->
    
    <!-- line 3 Subtract Line 2(a) From Line 1(a)-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;text-align:center;float:left;padding-left:2mm;">3</div>
		  <div class="styLNDesc" style="width:105mm;padding-left:2mm;float:left;">
				<span style="float:left;clear:none;">     
					Subtract line 2 from line 1
				</span>	
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.................</span>
		  </div>
          <div class="styLNRightNumBox" style="width:6mm;text-align:center;"  valign="bottom" >3</div>
          <div class="styLNAmountBox"  style="border-right-width:1px;border-bottom-width:1px" valign="bottom">
                <xsl:call-template name="PopulateAmount">
         			<xsl:with-param name="TargetNode" select="$FormData/SubLn2FrmLn1"/>
     			</xsl:call-template>                         
          </div>
          <div  class="styLNAmountBox" style="height:4.5mm;width:37.8mm;background-color:gray;border-left-width:0px;border-bottom-width:0px;"/>                 	 
      
    </div>
    <!-- end line 3 Subtract Line 2(a) From Line 1(a)-->
    
    <!-- line 4 -->
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;text-align:center;float:left;padding-left:2mm;">4</div>
      <div class="styLNDesc" style="width:105mm;padding-left:2mm;float:left;">
			<span style="float:left;clear:none;">   
				Applicable amount
			</span>	
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...................</span>
      </div>
      <div  class="styLNRightNumBox" style="width:6mm;text-align:center;"  valign="bottom">4</div>
      <div class="styLNAmountBox"  style="border-right-width:1px;border-bottom-width:1px;" valign="bottom">$75</div>
      <div  class="styLNAmountBox" style="height:4.5mm;width:37.8mm;background-color:gray;border-left-width:0px;border-bottom-width:0px;"/>                 	 
      
    </div>
    <!-- end line 4 -->
    
    <!-- line 5 Multiply Line 3(a) by Line 4(a)-->
    <div class="styBB" style="width:187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;text-align:center;float:left;padding-left:2mm;">5</div>
      <div class="styLNDesc" style="width: 143mm;padding-left:2mm;float:left;">
			<span style="float:left;clear:none;">   
				Multiply line 3 by line 4
			</span>	
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..........................</span>
      </div>
      <div class="styLNRightNumBox" style="width:6mm;text-align:center;border-bottom-width:0px;" valign="bottom">5</div>
      <div class="styLNAmountBox"  style="border-bottom-width:0px;" valign="bottom">
            <xsl:call-template name="PopulateAmount">
         		<xsl:with-param name="TargetNode" select="$FormData/MultLn3ByLn4"/>
     		 </xsl:call-template>                         
      </div>
     </div>
    <!-- end line 5 Multiply Line 3(a) by Line 4(a)-->


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
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a)<br/>Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b)<br/>Type B</td>
                   	 <td style="background-color:gray;width:37.8mm;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>                   	                   	                    	 
                   	 </tr>
                   	 
                   	 <!--Row 6 Clothes Washers Produced-->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">6</td>
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
                  	 <td valign="bottom" style="height:7mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">7</td>
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
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">8</td>
                <!-- Subtract Line 7(a) From Line 6(a) Type A -->   	 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne7aFromLne6aTypA"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Subtract Line 7(b) From Line 6(b) Type B -->   	 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                     <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne7bFromLne6bTypB"/>
					 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr>
                   	 <!-- End Row 8 Subtract Line 7(a) From Line 6(a) --> 
                   	 
                   	  <!-- row 9 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">9</td>
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$150</td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$250</td>                      
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"/>                 	 
                   	 </tr> 
                   	 
                    <!-- Row 10 Multiply Line 8 By Line 9-->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">10</td>
                <!-- Multiply Line 8(a) By Line 9(a) --> 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply8aByLne9a"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Multiply Line 8(b) By Line 9(b) --> 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Multiply8bByLne9b"/>
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
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;padding-top:5.5mm;">6</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;padding-top:5.5mm;">
			  Enter the number of eligible clothes washers produced in<br/>
			  calendar year 2010
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">..............</span>
      </div>
    </div>
    <!-- end line 6 -->
    
    <!-- line 7 -->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;">7</div>
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
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;">8</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">     
			   Subtract line 7 from line 6
			</span>  
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">............</span>
      </div>
    </div>
    <!-- end line 8 -->
    
    <!-- line 9-->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2mm;">9</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">   
			   Applicable amount
			</span>   
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..............</span>
      </div>
    </div>
    <!-- end line 9 -->
    
    <!-- line 10 -->
    <div style="width:93mm;padding-top:.8mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2px;">10</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">  
				Multiply line 8 by line 9
			</span>
        <!--Dotted Line-->
            <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.............</span>
    	</div>
     </div>
    <!-- end line 10 -->
    </span>
    </div>
      
    <!-- line 11 Tentative Credit For Clothes Washers-->
   <div class="styBB" style="width: 187mm;">  
  	<div class="styLNLeftNumBox"  style="width:6mm;text-align:center;float:left;padding-left:2px;padding-top:.5mm;">11
  	</div>   
     <div class="styLNDesc" style="width: 143mm;padding-left:2mm;float:left;">
		<span style="float:left;clear:none;">  
			 Add the amounts on line 10 in columns (a) and (b)
		</span>
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...................</span>
    	</div>    
     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;border-bottom:0px;">11</div>
     		<div class="styLNAmountBox" style="border-bottom-width:0px; ">
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
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-left-width:1px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(a)<br/>Type A</td>
                   	 <td class="styIRS8909TableCellHeaderSmall" align="center" style="width:95px;border-right-width:1px;font-weight:bold;font-size:7pt;border-top:0px solid black">(b)<br/>Type B</td>
                     <td style="background-color:gray;width:37.8mm;border-right:solid black 1px;border-top:0px solid black;border-right:0px;"><span style="width:1mm"/></td>  	              	                   	                    	 
                   	 </tr>
                   	 
                   	 <!-- Row 12 Refrigerators Produced-->
                   	 <tr>
                  	 <td valign="bottom" style="height:6mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">12</td>
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
                  	 <td valign="bottom" style="height:7mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">13</td>
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
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">14</td>
                <!-- Subtract Line 13(a) From Line 12(a) Type A  -->   	 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SubtractLne13aFrmLne12aTypA"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Subtract Line 13(b) From Line 12(b) Type B  -->   	 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/SubtractLne13bFrmLne12bTypB"/>
						 </xsl:call-template>                        
                        <span style="width:1px;"/>
                      </td>
                   	 <td style="background-color:gray;border-right:solid black 1px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 <!-- End Row 14 Subtract Line 13 From Line 12 -->
                   	 
                   	  <!-- row 15 -->
                   	 <tr>
                  	 <td valign="bottom" style="height:4mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">15</td>
                     <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$100</td>
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">$200</td>
                   	 <td style="background-color:gray;border-right:solid black 0px;border-right:0px;"><span style="width:1mm"/></td>                 	 
                   	 </tr> 
                   	 
                     <!-- Row 16 Multiply Line 14 By Line 15-->
                   	 <tr>
                  	 <td valign="bottom" style="height:4.5mm;font-size:6.5pt;font-weight:bold;text-align:center;border-bottom:1px solid black;border-left:1px solid black;">16</td>
                <!-- Multiply Line 14(a) By Line 15(a) Type A  -->   	 
                   	 <td align="right" style="border-left:1px solid black;border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                   	  <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Multiply14aByLne15aTypA"/>
					 </xsl:call-template> 
                        <span style="width:1px;"/>
                   	 </td>
                <!-- Multiply Line 14(b) By Line 15(b) Type B  -->   	 
                   	 <td align="right" style="border-right:1px solid black;font-size:6pt;border-bottom:1px solid black;" valign="bottom">
                    	 <xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Multiply14bByLne15bTypB"/>
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
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2px;padding-top:5.5mm;">12</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;padding-top:5.5mm;">
			  Enter the number of eligible refrigerators produced in<br/>
			  calendar year 2010
        <!--Dotted Line-->
                <span class="styDotLn" style="float:none;padding-left:1mm;clear:none;">..............</span>
      </div>
    </div>  
    <!-- end line 12 -->
    
   <!-- line 13 -->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2px;">13</div>
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
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2px;">14</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">     
			   Subtract line 13 from line 12
			</span>  
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...........</span>
      </div>
    </div>    
    <!-- end line 14 -->
    
    <!-- line 15 -->
     <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2px;">15</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">   
			   Applicable amount
			</span>   
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.............</span>
      </div>
    </div>   
    <!-- end line 15 -->
    
    <!-- line 16 -->
    <div style="width:93mm;">
      <div class="styLNLeftNumBox" style="width:6mm;font-size:7pt;text-align:center;float:left;padding-left:2px;">16</div>
      <div class="styLNDesc" style="width:86mm;padding-left:2mm;float:left;font-size:7pt;">
			<span style="float:left;clear:none;">  
				Multiply line 14 by line 15
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
  	<div class="styLNLeftNumBox"  style="width:6mm;text-align:center;float:left;padding-left:2px;padding-top:.5mm;">17
  	</div>   
     <div class="styLNDesc" style="width: 143mm;padding-left:2mm;float:left;">
		<span style="float:left;clear:none;">  
			 Add the amounts on line 16 in columns (a) and (b)
		</span>
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...................</span>
    	</div>    

     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;border-bottom:0px;">17</div>
     		<div class="styLNAmountBox" style="border-bottom-width:0px; ">
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
  	<div class="styLNLeftNumBox"  style="width:6mm;text-align:center;float:left;padding-left:2px;">18</div>
     <div class="styLNDesc" style="width: 143mm;float:left;padding-left:2mm;">
		<span style="float:left;clear:none;">   
			 <b>Total.</b> Add lines 5, 11, and 17
        </span>
        <!--Dotted Line-->
                <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.........................</span>
    	</div>    
     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">18</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TotalTentativeCredit"/>
     			 </xsl:call-template> 
     		</div>                   	
   </div>
    <!-- end line 18 Total Tentative Credit-->

    <!--  Line 19 2% Average Gross Receipts-->    
  <div style="width: 187mm;">  
  	<div style="width:6mm;font-size:7pt;font-weight:bold;text-align:center;float:left;padding-left:2px;">19</div>
     <div class="styLNDesc" style="width:143mm;float:left;padding-left:2mm;">
		 <span style="float:left;clear:none;"> 	 
			 Enter 2% of average annual gross receipts (see instructions)
		 </span>
      <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...............</span>
     </div>    

     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">19</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Per2AvgeAnnualGrossRecpts"/>
     			 </xsl:call-template> 
     		</div>                   	
   </div>
      <!-- end line 19 2% Average Gross Receipts-->

     <!--  Line 20a -->    
      <div style="width: 187mm">  
		 <div class="styLNLeftNumBox" style="padding-left:1mm;">20a</div>
		 <div class="styLNDesc" style="width:103mm;float:left;">
			 <span style="float:left;clear:none;">	 
				 Maximum credit base amount (see instructions)
			 </span>
      <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..........</span>
     </div>        
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20a</div>
     	 <div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">$75,000,000</div>                   	
     	 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
   </div>
<!-- End  Line 20a -->  
    
 
 <!--  Line 20b Line 19 prior year amount-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">b</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;">
			Enter the amount from line 19 of your *2009 Form 8909
        </span>
      <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.......</span>
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20b</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/PriorYrLine19Amt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 20b Line 19 prior year amount-->
  
   <!--  Line 20c Line 22a prior year amount-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">c</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;">
			Enter the amount from line 22a of your *2009 Form 8909
        </span>
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">......</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20c</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/PriorYrLine22aAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 20c Line 22a prior year amount-->
  
   <!--  Line 20d Line 22b prior year amount-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">d</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;">
			Enter the amount from line 22b of your *2009 Form 8909
        </span>
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">......</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20d</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/PriorYrLine22bAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 20d Line 22b prior year amount-->
  
    <!--  Line 20e Add lines 20c and 20d-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">e</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;">
			Add lines 20c and 20d
        </span>
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..................</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20e</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativePriorYrCreditAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 20e Add lines 20c and 20d-->

    <!--  Line 20f Subtract line 20e from line 20b-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">f</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;">
			Subtract line 20e from line 20b
         </span>   
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">...............</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20f</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/DifferenceOfLines20eAnd20bAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 20f Subtract line 20e from line 20b-->

    <!--  Line 20g Line 20 prior year amount-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">g</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;">
			Enter the amount from line 20 of your *2009 Form 8909
        </span>   
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.......</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20g</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/PriorYrAvgeGrossRecptsAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 20g Line 20 prior year amount-->
 
    <!--  Line 20h lines 20a, 20f or 20g-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">h</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;">
			Enter the <b>smallest</b> of the amount on line 20a, 20f, or 20g
        </span>   
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.......</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20h</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SmallerOfLinesAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 20h lines 20a, 20f or 20g--> 
  
    <!--  Line 20i Amount from 21h of 2009 Form 8909-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">i</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;">
			Enter the amount from 21h of your 2009 Form 8909
        </span>   
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">........</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20i</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/PriorYrSmallerOfLinesAmt"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 20i Amount from 21h of 2009 Form 8909--> 

    <!--  Line 20j Add Lines 20h and 20i-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">j</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;">
			Add lines 20h and 20i
        </span>   
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..................</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20j</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AddLines20hAnd20i"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 20j Add Lines 20h and 20i-->
   
    <!--  Line 20k Subtract line 20j from line 20a-->    
  <div style="width: 187mm;">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm;">k</div>
  	<div class="styLNDesc" style="width: 141mm;float:left;">
			<span style="float:left;clear:none;">
				 Subtract line 20j from line 20a
        </span>
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.........................</span>    
     </div>    

     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">20k</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/DifferenceOfLines20jAnd20aAmt"/>
     			 </xsl:call-template> 
     		</div>                   	
   </div>
      <!-- end line 20k Subtract line 20j from line 20a-->
      
      <!--  Line 21a Line 10 amount-->    
      
      <div style="width: 187mm">  
		 <div class="styLNLeftNumBox" style="padding-left:1mm;">21a</div>
		 <div class="styLNDesc" style="width:103mm;float:left;">
			<span style="float:left;clear:none;"> 
				Enter the amount from line 10, column (b)
			</span>
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">............</span>    
         </div>    

     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">21a</div>
     	 <div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
      			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Line10Amount"/>
     			 </xsl:call-template> 
     	 </div>                   	
     	 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div>                   	
  </div>
<!-- End  Line 21a Line 10 amount-->  
  
      <!--  Line 21b Line 16 Amount-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm">b</div>
    <div class="styLNDesc" style="width: 103mm;float:left;">
		<span style="float:left;clear:none;"> 
			Enter the amount from line 16, column (b)
        </span>
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">............</span>    
    </div>    
     	 <div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">21b</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/Line16Amount"/>
     			 </xsl:call-template>       
		  </div>          
		 <div class="styShadingCell" style="height:4mm;width:38mm;padding-top:1.3mm;padding-bottom:0mm;background-color:gray;"></div> 
  </div>
  <!-- End Line 21b Line 16 Amount--> 
  
       <!--  Line 21c Add lines 21a and 21b-->  
  <div style="width: 187mm">  
    <div class="styLNLeftNumBox" style="padding-left: 4.5mm;">c</div>
    <div class="styLNDesc" style="width:141mm;float:left;">
		<span style="float:left;clear:none;"> 
			Add lines 21a and 21b
         </span>       
              <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">............................</span>    
    	</div>
     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">21c</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TentativeMaximumCreditAmount"/>
     			 </xsl:call-template> 
     		</div>                   	    	    
  </div>
  <!-- End Line 21c Add lines 21a and 21b--> 
   
     <!--  Line 22 Maximum Credit Allowed Amount-->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="width:6mm;text-align:center;float:left;padding-left:2px;">22</div>
     <div class="styLNDesc" style="width:143mm;float:left;padding-left:2mm;">
		<span style="float:left;clear:none;"> 
			 Maximum credit amount. Add lines 20k through 21c
        </span>
              <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..................</span>    
               
     </div>
     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">22</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/MaximumCreditAllowedAmt"/>
     			 </xsl:call-template> 
     		</div>                   	    	    
  </div>
   <!-- End Line 22 Maximum Credit Allowed Amount-->
  
 
   <!--  Line 23 Smallest of lines 18, 19 or 22-->    
  <div style="width: 187mm;">  
  	<div  class="styLNLeftNumBox" style="width:6mm;text-align:center;float:left;padding-left:2px;">23</div>
     <div class="styLNDesc" style="width:143mm;float:left;padding-left:2mm;">
		<span style="float:left;clear:none;">  
			 Enter the <b>smallest</b> of the amount on line 18, 19, or 22
			<!-- Single Producer -->  
             <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Single Producer</xsl:with-param>
             <xsl:with-param name="TargetNode" select="$FormData/SingleProducer"/>
           </xsl:call-template>
        </span>    
              <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">................</span>   
          
    	</div>
     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">23</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/SmallestOfLines18And19Or22Amt"/>
     			 </xsl:call-template> 
     		</div>                   	    	    
  </div>
   <!-- End Line 23 Smallest of lines 18, 19 or 22-->

   <!--  Line 24 Energy Efficient Appliance Credits Amount-->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="width:6mm;text-align:center;float:left;padding-left:2px;">24</div>
    <div class="styLNDesc" style="width:143mm;float:left;padding-left:2mm;">
		<span style="float:left;clear:none;">  
			 Energy efficient appliance credits from partnerships, S corporations, estates, trusts, and cooperatives
        </span>
              <!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.</span>    
    </div>    

     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">24</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/EnergyEffcntApplianceCrdtAmt"/>
     			 </xsl:call-template> 
     		</div>                   	 
   </div>
     <!-- End Line 24 Energy Efficient Appliance Credits Amount--> 
   

  <!--  Line 25 Add Lines 23 and 24-->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="height:7mm;width:6mm;text-align:center;float:left;padding-left:2px;">25</div>
    <div class="styLNDesc" style="height:7mm;width:143mm;float:left;padding-left:2mm;">
			Add lines 23 and 24. Estates, trusts, and cooperatives, go to line 26; partnerships and S corporations,<br/> 
			report this amount on Schedule K; all others, report this amount on Form 3800, line 1q
              <!--Dotted Line-->
        <span class="styDotLn" style="float:none;padding-left:2mm;clear:none;">......</span> 
     </div>    
    	     	<div class="styLNRightNumBox" style="height:7mm;width:6mm;padding-top:4mm;padding-bottom:0mm;">25</div>
     		<div class="styLNAmountBox" style="height:7mm;padding-top:4mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/TotalOfLines23And24Amt"/>
     			 </xsl:call-template> 
     		</div>                   	 
   </div>
 <!-- End Line 25 Add Lines 23 and 24--> 
    
 <!--  Line 26 Amount Allocated to Beneficiaries of Estates or Trusts or Patrons of the Cooperatives Amount-->
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="width:6mm;text-align:center;float:left;padding-left:2px;">26</div>
    <div class="styLNDesc" style="width:143mm;float:left;padding-left:2mm;">
     Amount allocated to beneficiaries of the estate or trust, or to patrons of the cooperative (see instructions)

     </div>    
   	     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">26</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
     			 <xsl:call-template name="PopulateAmount">
         				<xsl:with-param name="TargetNode" select="$FormData/AllctedToBeneEstTrstPatrnAmt"/>
     			 </xsl:call-template> 
     		</div>                   	    	
   </div>
  <!-- End Line 26 Amount Allocated to Beneficiaries of Estates or Trusts or Patrons of the Cooperatives Amount-->  
  
 <!--  Line 27 Subtract line 26 from line 25-->    
  <div style="width: 187mm;">  
  	<div class="styLNLeftNumBox" style="width:6mm;text-align:center;float:left;padding-left:2px;">27</div>
    <div class="styLNDesc" style="width: 143mm;float:left;padding-left:2mm;">
			Estates, trusts, and cooperatives, subtract line 26 from line 25. Report this amount on Form 3800, line 1q<br/> 
			*Include amounts from predecessors.
      </div>    
      	     	<div class="styLNRightNumBox" style="width:6mm;padding-top:1mm;padding-bottom:0mm;">27</div>
     		<div class="styLNAmountBox" style="padding-top:1mm;padding-bottom:0mm;">
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
          Form <span class="styBoldText">8909</span> (2010)
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