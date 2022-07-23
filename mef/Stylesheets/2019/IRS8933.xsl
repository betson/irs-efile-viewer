<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Updated by Iskilu Lawal 10/30/2019_D4 UWR 224918 -->
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8933Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS8933"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>  
  <title>
  <xsl:call-template name="FormTitle">
  <xsl:with-param name="RootElement" select="local-name($FormData)">
  </xsl:with-param></xsl:call-template>
  </title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8933"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
   <xsl:call-template name="GlobalStylesForm"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
  <xsl:call-template name="InitJS"/>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS8933Style">
      </xsl:call-template>    
      <xsl:call-template name="AddOnStyle">
      </xsl:call-template>  
    </xsl:if>
  </style>      
</head>
<body class="styBodyClass">
  <form name="Form8933">    
    <xsl:call-template name="DocumentHeader"/>  
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;">
			<div class="styFNBox" style="width:31mm;height:20mm;border-right:none;vertical-align:bottom;">
							Form <span class="styFormNumber">8933</span>		
		<div class="styAgency" style="margin-top:1.8mm">
		<br/>						
        Department of the Treasury
      <br/>
        Internal Revenue Service
      </div>
		</div>
		<div class="styFTBox" style="width:123mm;border-right:1px solid black;border-left:1px solid black;height:20mm;">
		<div style="height:
		7mm;" class="styMainTitle">
		
		Carbon Oxide Sequestration Credit
      </div>
      <br/>
		<span class="styFST" style="height:4mm;font-size:7pt;">
								<img src="{$ImagePath}/8933_Bullet.gif" alt="Bullet Image"/>
Attach to your tax return.    
</span>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-bottom:5mm;">
								<!--<img src="{$ImagePath}/8933_Bullet.gif" alt="Bullet Image"/>
To claim this credit, the qualified facility must capture at least 500,000 metric <br/> tons of carbon Oxide during the tax year.  -->
   </div><br/>
 							<div class="styFST" style="height:4mm;font-size:7pt;padding-top:1mm;">
								<img src="{$ImagePath}/8933_Bullet.gif" alt="Bullet Image"/>
Go to  
									 <a style="text-decoration:none;color:black;" href="http://www.irs.gov/8933" title="Link to irs.gov">
										<i>www.irs.gov/Form8933</i>
									</a>
									 for the latest information. 
							</div>
		</div>
		<div class="styTYBox" style="width:32mm;border-left:none;">
		<div class="styOMB" style="height:4mm;">OMB No. 1545-0123</div>
		<div class="styTaxYear">
          20<span class="styTYColor">19</span>
		</div>
		<div style="margin-left:3mm; text-align:left;">
          Attachment<br/>Sequence No. <span class="styBoldText">165</span>
		</div>
		</div>
		</div>
		<!-- End Form Number and Name section -->
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:144.2mm;font-weight:normal;font-size:7pt;height: 10mm;">
      Name(s) shown on return<br/>
      <div style="font-family:verdana;font-size:6pt;padding-top:1mm;">
 					<xsl:choose>
						<xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
						<br/>
						  <span>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
						  </span>
						</xsl:when>
						
						<xsl:when test="$RtnHdrData/ReturnTypeCd='1040NR'">
						<br/>
						  <span>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
						  </span>
						</xsl:when>
						  <xsl:otherwise>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							</xsl:otherwise>
					</xsl:choose>
     </div>
    </div>
    <div class="styEINBox" style="padding-left:2mm;font-size:7pt;clear:none;">
    <span class="BoldText">Identifying number</span><br/>  
      <div class="styNormalText" style="text-align:left; padding-top:0mm;height:7mm;">
      <!-- if EIN exists -->
      <xsl:choose>
			 <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
							<br/>
				 <span style="font-weight:normal;">
					 <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</xsl:when>
						<xsl:when test="$RtnHdrData/ReturnTypeCd='1040NR'">
							<br/>
				 <span style="font-weight:normal;">
					 <xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</xsl:when>
						  <xsl:otherwise>
						  <br/>
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
				</xsl:call-template>
			</span>
		</xsl:otherwise>
	</xsl:choose>
      </div>   
    </div>
  </div> 
  <!--  End Name and Employer indentification number  -->
  <!--Qualified carbon dixiode-->
  <div style="width: 187mm">
   <div class="styLNLeftNumBox" style="width:6mm;height:18mm; padding-top: 2mm;"/>
   <div class="styIRS8933MedLNDesc" style="height: 18mm; padding-top: 2mm;width:138mm;"> 
   <b>Qualified carbon oxide captured using carbon capture equipment originally placed in service at a qualified facility before February 9, 2018, disposed of in secure geological<br/>
        storage, and not used as a tertiary injectant in a qualified enhanced oil or natural gas recovery<br/>
        project, and not used in a way described in section 45Q(f)(5).</b>
    </div>
    <div class="styLNRightNumBox" style="height:18mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:18mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
 <!--  Line 1a -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 0mm;float:left;clear:none;">1a</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		<div class="styIRS8933MedLNDesc" style="height: 4mm; padding-top: 0mm;width:91.5mm;padding-left:.5mm;">
               Metric tons captured and disposed of (see instructions)
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>  		
		</div>
     		  <div class="styUnderlineAmount" style="height:4mm;width:40.5mm;">
		  <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedBfrSpcfdDtGrp/MetricTonsCapturedQty"/>
		  </xsl:call-template>
		   <!--<span style="width:2mm;"/>-->
		</div>
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
  <!-- end Line 1a -->  
  <!--  Line 1b -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">b</div>
     <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
    <div class="styIRS8933MedLNDesc" style="height: 4mm; width:91.5mm;padding-left:.5mm;">Inflation–adjusted credit rate
 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
      </div>
<div class="styUnderlineAmount" style="height:4mm;width:41mm;">
     $22.87
          </div>
    </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm; "/>
    <div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
    <div class="styLNAmountBox" style="height:6mm; padding-top:0mm;border-bottom-width:0px;">      
    </div>
  </div>
    <!--  end Line 1b --> 
  <!--  Line 1c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">Multiply line 1a by line 1b 
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
     </div>
    <div class="styLNRightNumBox">1c</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedBfrSpcfdDtGrp/MetricTonsCapturedCreditAmt"/>
      </xsl:call-template>
    </div>
  </div>
  <!--  end Line 1c -->
  <!--Qualified carbon dioxide-->
  <div style="width: 187mm">
   <div class="styLNLeftNumBox" style="width:6mm;height: 18mm; padding-top: 2mm"/>
   <div class="styIRS8933MedLNDesc" style="height: 18mm; padding-top: 2mm;width:138mm;"> <b>Qualified carbon oxide captured using carbon capture equipment originally placed in service at a qualified facility before February 9, 2018, disposed of in secure geological <br/>storage, and used as a tertiary injectant in a qualified enhanced oil or natural gas recovery <br/>project, or used in a way described in section 45Q(f)(5).
    </b>
    </div>
    <div class="styLNRightNumBox" style="height:18mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:18mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>  
    <!--  Line 2a -->  
     <div style="width: 187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 0mm;float:left;clear:none;">2a</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		<div class="styIRS8933MedLNDesc" style="height: 4mm; padding-top: 0mm;width:91.5mm;padding-left:.5mm;">Metric tons captured and used (see instructions)
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span> 		
		  </div>
     		  <div class="styUnderlineAmount" style="height:4mm;width:40.5mm;">
		  <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/CapturedUsedBfrSpcfdDtGrp/MetricTonsCapturedQty"/>
		  </xsl:call-template>
		   <!--<span style="width:2mm;"/>-->
		</div>
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
  <!-- end Line 2a -->  
  <!--  Line 2b -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">b</div>
     <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
    <div class="styIRS8933MedLNDesc" style="height: 4mm; width:91.5mm;padding-left:.5mm;">Inflation–adjusted credit rate
  <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
    </div>
    <div class="styUnderlineAmount" style="height:4mm;width:41mm;">
    $11.44
          </div>
    </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm; "/>
    <div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
    <div class="styLNAmountBox" style="height:6mm; padding-top:0mm;border-bottom-width:0px;">      
    </div>
  </div>
  <!--  end Line 2b --> 
  <!--  Line 2c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">Multiply line 2a by line 2b 
 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
     </div>
    <div class="styLNRightNumBox">2c</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CapturedUsedBfrSpcfdDtGrp/MetricTonsCapturedCreditAmt"/>
      </xsl:call-template>
    </div>

   <div class="styLNLeftNumBox" style="width:6mm;height: 20mm; padding-top: 2mm"/>
   <div class="styIRS8933MedLNDesc" style="height: 22mm; padding-top: 2mm;width:138mm;">
 <b>Qualified carbon oxide captured using carbon capture equipment originally placed in<br/><br/>
service at a qualified facility on or after February 9, 2018, during the 12-year period beginning on the
date the equipment was originally placed in service, disposed of in secure geological storage, and not
used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project, nor used as described in section 45Q(f)(5).
    </b>
    </div>

    <div class="styLNRightNumBox" style="height:22mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:22mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>  
  <!--  end Line 2c -->
  
  
  
     <!--  Line 3a -->  
     <div style="width: 187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 0mm;float:left;clear:none;">3a</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		<div class="styIRS8933MedLNDesc" style="height: 4mm; padding-top: 0mm;width:91.5mm;padding-left:.5mm;">Metric tons captured and disposed of (see instructions)
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span> 		
		  </div>
     		  <div class="styUnderlineAmount" style="height:4mm;width:40.5mm;">
		  <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedAftrSpcfdDtGrp/MetricTonsCapturedQty"/>
		  </xsl:call-template>
		   <!--<span style="width:2mm;"/>-->
		</div>
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
  <!-- end Line 3a -->  
  <!--  Line 3b -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">b</div>
     <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
    <div class="styIRS8933MedLNDesc" style="height: 4mm; width:91.5mm;padding-left:.5mm;">
Section 45Q(a)(3) applicable dollar amount (see instructions)
  <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
    </div>
    <div class="styUnderlineAmount" style="height:4mm;width:41mm;">
     
          </div>
    </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm; "/>
    <div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
    <div class="styLNAmountBox" style="height:6mm; padding-top:0mm;border-bottom-width:0px;">      
    </div>
  </div>
  <!--  end Line 3b --> 
  <!--  Line 3c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">Multiply line 3a by line 3b 
 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
     </div>
    <div class="styLNRightNumBox">3c</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedAftrSpcfdDtGrp/MetricTonsCapturedCreditAmt"/>
      </xsl:call-template>
    </div>

   <div class="styLNLeftNumBox" style="width:6mm;height: 18mm; padding-top: 2mm"/>
   <div class="styIRS8933MedLNDesc" style="height: 22mm; padding-top: 2mm;width:138mm;">
 <b>Qualified carbon oxide captured using carbon capture equipment originally placed in<br/><br/>
service at a qualified facility on or after February 9, 2018, during the 12-year period beginning on the
date the equipment was originally placed in service, disposed of in secure geological storage, and used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project, or used as described in section 45Q(f)(5)
    </b>
    </div>

    <div class="styLNRightNumBox" style="height:22mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:22mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>  
    
  <!--  end Line 3c -->
  
     <!--  Line 4a -->  
     <div style="width: 187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 0mm;float:left;clear:none;">4a</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		<div class="styIRS8933MedLNDesc" style="height: 4mm; padding-top: 0mm;width:91.5mm;padding-left:.5mm;">
              Metric tons captured and disposed of (see instructions)
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span> 		
		  </div>
     		  <div class="styUnderlineAmount" style="height:4mm;width:40.5mm;">
		  <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/CapturedUsedAftrSpcfdDtGrp/MetricTonsCapturedQty"/>
		  </xsl:call-template>
		   <!--<span style="width:2mm;"/>-->
		</div>
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
  <!-- end Line 4a -->  
  <!--  Line 4b -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">b</div>
     <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
    <div class="styIRS8933MedLNDesc" style="height: 4mm; width:91.5mm;padding-left:.5mm;">
       Section 45Q(a)(4) applicable dollar amount (see instructions)
  <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
    </div>
    <div class="styUnderlineAmount" style="height:4mm;width:41mm;">
     
          </div>
    </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm; "/>
    <div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom-width:0px;"/>
    <div class="styLNAmountBox" style="height:6mm; padding-top:0mm;border-bottom-width:0px;">      
    </div>
  </div>
  <!--  end Line 4b --> 
  <!--  Line 4c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">Multiply line 4a by line 4b
 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
     </div>
    <div class="styLNRightNumBox">4c</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CapturedUsedAftrSpcfdDtGrp/MetricTonsCapturedCreditAmt"/>
      </xsl:call-template>
    </div>
    </div>
    <!-- end Line 4c -->  
    
    <!--  Line 5 -->  
     <div style="width: 187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;height:4mm; padding-top: 2.5mm;float:left;clear:none;">5</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		
     		  <div class="styIRS8933MedLNDesc" style="height: 8mm; padding-top: 1mm;width:135mm;padding-left:.5mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Section45Qb3ElectionInd"/>
									<xsl:with-param name="BackupName">Section45Qb3ElectionInd</xsl:with-param>
								</xsl:call-template>
								<div style="width: 123mm;">
								Section 45Q(b)(3) election. Check the box if you're making the  election under section 45Q(b)(3).	</div>
							</label>
							<span style="width:5px;"/>
							<input type="checkbox" alt="Section45Qb3ElectionInd" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section45Qb3ElectionInd"/>
										<xsl:with-param name="BackupName">Section45Qb3ElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
						</div>
     </div>
     
     
   <div class="styIRS8933MedLNDesc" style="height:4mm; width:5mm;"/>
  <div class="styShadingCellRB" style="height:4mm; width:8mm;background-color:lightgrey; border-right-width:0px;"/>
    <div class="styShadingCell" style="height:4mm;  border-bottom-width:0px;">      
    </div>
    </div>
  
  <div style="width: 187mm;">
    <div class="styLNLeftNumBox" style="width:6mm;"></div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">
		
     </div>
    <div class="styLNRightNumBox"></div>
    <div class="styShadingCell" style="height:4mm;  border-bottom-width:1px;">     
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MetricTonsCapturedUsedAmt"/>
      </xsl:call-template>
    </div>
    </div>
    <!-- end Line 5 -->  
    
    <!--  Line 6 -->  
    <div style="width: 187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 2.5mm;float:left;clear:none;">6</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		
     		  <div class="styIRS8933MedLNDesc" style="height: 8mm; padding-top: 1mm;width:135mm;padding-left:.5mm;">
     		  
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Section45Qb6ElectionInd"/>
									<xsl:with-param name="BackupName">Section45Qb6ElectionInd</xsl:with-param>
								</xsl:call-template>
								<div style="width: 124mm;">
							 Section 45Q(f)(6) election. Check the box if you're making the  election under section 45Q(f)(6).	</div>
							</label>
							<!--<span style="width:5px;"/>-->
						<input type="checkbox" alt="Section45Qb6ElectionInd" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section45Qb6ElectionInd"/>
										<xsl:with-param name="BackupName">Section45Qb6ElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
						</div>
     </div>
    <div class="styIRS8933MedLNDesc" style="height:4mm; width:5mm;"/>
  <div class="styShadingCellRB" style="height:4mm; width:8mm;background-color:lightgrey; border-right-width:0px;"/>
    <div class="styShadingCell" style="height:4mm;  border-bottom-width:0px;">      
    </div>
    </div>
  
  <div style="width: 187mm;">
    <div class="styLNLeftNumBox" style="width:6mm;"></div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">
		
     </div>
    <div class="styLNRightNumBox"></div>
    <div class="styShadingCell" style="height:4mm;  border-bottom-width:1px;">     
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MetricTonsCapturedUsedAmt"/>
      </xsl:call-template>
    </div>
    </div>
    <!-- end Line 6 -->  
    
  
    <!--  Line 7 -->  
    <div style="width: 187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 2.5mm;float:left;clear:none;">7</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		
     		 <div class="styIRS8933MedLNDesc" style="height: 8mm; padding-top: 1mm;width:135mm;padding-left:.5mm;">
     		 
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>
								<div style="width: 124mm;">
							 Reserved for future use.	<!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....................</span>  </div>
							</label>
							
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
     </div>
    <div class="styIRS8933MedLNDesc" style="height:4mm; width:5mm;"/>
  <div class="styShadingCellRB" style="height:4mm; width:8mm;background-color:lightgrey; border-right-width:0px;"/>
    <div class="styShadingCell" style="height:4mm;  border-bottom-width:0px;">      
    </div>
    </div>
  
  <div style="width: 187mm;">
    <div class="styLNLeftNumBox" style="width:6mm;"></div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">
		
     </div>
    <div class="styLNRightNumBox"></div>
    <div class="styShadingCell" style="height:4mm;  border-bottom-width:1px;">     
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/MetricTonsCapturedUsedAmt"/>
      </xsl:call-template>
    </div>
    </div>
    <!-- end Line 7 -->  
  
  <!--  Line 8 -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;height:6mm;padding-top: 4mm;">8</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;height:6mm;padding-top: 4mm; ">Carbon oxide sequestration credit from partnerships and S corporations
  <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>    
     </div>
     <div class="styLNRightNumBox" style="height:5mm; padding-top: 0mm; border-bottom-width:0px;background-color:lightgrey;"/>
     <div class="styLNAmountBox" style="height:5mm; padding-top: 0mm; border-bottom-width:0px;">
          </div>
          
    <div class="styLNRightNumBox">8</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CreditAmt"/>
      </xsl:call-template>
    </div>
  </div>
  <!--  end Line 8 -->
    <!--  Line 9 -->  
  <div class="styBB" style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;height:6mm;padding-top: 4mm;">9</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;height:6mm;padding-top: 4mm;">Add lines 1c, 2c, 3c and 4c. Partnerships and S corporations, report this amount on Schedule K. All <br/> others, report this amount on Form 3800, Part III, line 1x
	    <!--Dotted Line-->
		    <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
    </div>
       
  <div class="styLNRightNumBox" style="height:4mm; padding-top: 3mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4mm; padding-top: 0mm; border-bottom-width:0px;">
    </div>
    <div class="styLNRightNumBox" style="height:7mm; padding-top: 3mm; border-bottom-width:0px;">9</div>
    <div class="styLNAmountBox" style="height:7mm; padding-top: 3mm; border-bottom-width:0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalAmt"/>
      </xsl:call-template>
    </div>
      </div>  
  <!--  end Line 9 -->
          <div style="width:187mm;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span> 
          <span style="width:30mm;"/>                      
          Cat. No. 37748H 
          <span style="width:33mm;"/>  
          Form <span class="styBoldText">8933</span> (2019)
        </div>
        <div class="pageEnd"/>
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        
                <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$FormData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>                   
        </table>
      <!-- END Left Over Table -->      
  </form>  
</body>
</html>
</xsl:template>    
</xsl:stylesheet>