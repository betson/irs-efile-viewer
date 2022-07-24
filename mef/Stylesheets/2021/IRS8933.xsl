<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!-- Updated by Iskilu Lawal 10/07/2021_DD4 UWR 370609  R10.5-->
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
 							<div class="styFST" style="height:4mm;font-size:7pt;padding-top:4mm;">
								<img src="{$ImagePath}/8933_Bullet.gif" alt="Bullet Image"/>
Go to  
									 <a style="text-decoration:none;color:black;" href="http://www.irs.gov/8933" title="Link to irs.gov">
										<i>www.irs.gov/Form8933</i>
									</a>
									 for instructions and the latest information. 
							</div>
		</div>
		<div class="styTYBox" style="width:32mm;border-left:none;">
		<div class="styOMB" style="height:4mm;">OMB No. 1545-0123</div>
		<div class="styTaxYear">20<span class="styTYColor">21</span>
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
  <!-- BEGIN PART I TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;font-family:arial;
		  text-align:center;padding-top:.5mm">Part I</div>
						<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;
		  padding-bottom:.5mm;padding-top:.5mm;">
		  Information About You</div>
					</div>
							
  <!--  End Name and Employer indentification number  -->
  
   <div style="width: 187mm; ">
   <div class="styBB" style="width:187mm;height:37mm;">
   
   <div style="width: 187mm;">
      
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		
     		 <div class="styIRS8933MedLNDesc" style="height: 8mm; padding-top: 1mm;width:135mm;padding-left:.5mm;">
			<div style="width: 129mm;font-size:10pt;padding-bottom:5mm;font-family:arial;">
		Check the applicable box(es). See instructions before completing this form.
    </div>
     </div>
      </div>
       </div>

   
    <!--  Line 1 -->  
    <div style="width: 187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 1.5mm;float:left;clear:none;">1</div>
        <div class="styLNDesc"   style="width:175mm;padding-top:0mm;padding-bottom:0mm;">
		 	Captured qualified carbon oxide during the tax year
            <!--Dotted Line-->
		    <span class="styDotLn" style="float:none;clear:none;padding-right:3mm;">.........................</span> 
	   
 							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
							</xsl:call-template>    		 
							  <label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
									<xsl:with-param name="BackupName">CaptureQualifiedCarbonOxideIndInd</xsl:with-param>
								</xsl:call-template>

							 </label>
                               <span style="width:2px;"/>
							
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
									<xsl:with-param name="BackupName">CaptureQualifiedCarbonOxideInd</xsl:with-param>
								</xsl:call-template>
							</input>
							</span>
		</div>
    </div>  
   
    <!-- end Line 1 -->  
    
    <!--  Line 2 -->  
    <div style="width: 187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 1.5mm;float:left;clear:none;">2</div>
        <div class="styLNDesc"   style="width:175mm;padding-top:0mm;padding-bottom:0mm;">
		 	Physically disposed, used, or utilized captured qualified carbon oxide during the tax year
            <!--Dotted Line-->
		    <span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">..............</span> 
	   
 							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
							</xsl:call-template>    		 
							  <label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
									<xsl:with-param name="BackupName">CaptureQualifiedCarbonOxideInd</xsl:with-param>
								</xsl:call-template>

							 </label>
                               <span style="width:2px;"/>
							
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
									<xsl:with-param name="BackupName">CaptureQualifiedCarbonOxideInd</xsl:with-param>
								</xsl:call-template>
							</input>
							</span>
		</div>
    </div>  
   
    <!-- end Line 2 -->  
    <!--  Line 3 -->  
    <div style="width: 187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 1.5mm;float:left;clear:none;">3</div>
        <div class="styLNDesc"   style="width:175mm;padding-top:0mm;padding-bottom:0mm;hieght:2mm">
		 	Elected to allow another taxpayer to claim the carbon oxide sequestration credit that you would’ve otherwise been<b/>
                        entitled to
            <!--Dotted Line-->
		    <span class="styDotLn" style="float:none;clear:none;padding-right:2mm;width:11mm;">....</span> 
	   
 							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
							</xsl:call-template>    		 
							  <label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
									<xsl:with-param name="BackupName">CaptureQualifiedCarbonOxideInd</xsl:with-param>
								</xsl:call-template>

							 </label>
                               <span style="width:2px;"/>
							
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
									<xsl:with-param name="BackupName">CaptureQualifiedCarbonOxideInd</xsl:with-param>
								</xsl:call-template>
							</input>
							</span>
		</div>
    </div>  
   
    <!-- end Line 3 -->  
    <!--  Line 4 -->  
    <div style="width: 187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 1.5mm;float:left;clear:none;">4</div>
        <div class="styLNDesc"   style="width:175mm;padding-top:0mm;padding-bottom:0mm;">
		 	Another taxpayer elected to allow you to claim the carbon oxide sequestration credit that they would’ve otherwise been
                        entitled to
            <!--Dotted Line-->
		    <span class="styDotLn" style="float:none;clear:none;padding-right:0mm;width:4.4mm;">..</span> 
	   
 							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
							</xsl:call-template>    		 
							  <label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
									<xsl:with-param name="BackupName">CaptureQualifiedCarbonOxideInd</xsl:with-param>
								</xsl:call-template>

							 </label>
                               <span style="width:2px;"/>
							
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CaptureQualifiedCarbonOxideInd"/>
									<xsl:with-param name="BackupName">CaptureQualifiedCarbonOxideInd</xsl:with-param>
								</xsl:call-template>
							</input>
							</span>
		</div>
    </div>  
   
    <!-- end Line 4 -->  
    <!--  Line 5 -->  
    <div style="width: 187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 1.5mm;float:left;clear:none;">5</div>
        <div class="styLNDesc"   style="width:175mm;padding-top:0mm;padding-bottom:0mm;">
		 	Reserved for future use
            <!--Dotted Line-->
		    <span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">..................................</span> 
	   
 							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
							</xsl:call-template>    		 
							  <label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>

							 </label>
                               <span style="width:2px;"/>
							
							<input type="Checkbox" class="styCkbox" disabled="disabled">
								<!--<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>-->
							</input>
							</span>
		</div>
    </div>  
   
    <!-- end Line 5 --> 
    <!--  Line 6 -->  
    <div style="width: 187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 1.5mm;float:left;clear:none;">6</div>
        <div class="styLNDesc"   style="width:175mm;padding-top:0mm;padding-bottom:0mm;">
		 	Reserved for future use
            <!--Dotted Line-->
		    <span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">..................................</span> 
	   
 							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
							</xsl:call-template>    		 
							  <label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>

							 </label>
                               <span style="width:2px;"/>
							
							<input type="Checkbox" class="styCkbox" disabled="disabled">
								<!--<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>-->
							</input>
							</span>
		</div>
    </div>  
   
    <!-- end Line 6 -->   
    <!--  Line 7 -->  
    <div style="width: 187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 1.5mm;float:left;clear:none;">7</div>
        <div class="styLNDesc"   style="width:175mm;padding-top:0mm;padding-bottom:0mm;">
		 	Reserved for future use
            <!--Dotted Line-->
		    <span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">..................................</span> 
	   
 							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
							</xsl:call-template>    		 
							  <label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>

							 </label>
                               <span style="width:2px;"/>
							
							<input type="Checkbox" class="styCkbox" disabled="disabled">
								<!--<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>-->
							</input>
							</span>
		</div>
    </div>  
   
    <!-- end Line 7 -->   
    <!--  Line 8 -->  
    <div style="width: 187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 1.5mm;float:left;clear:none;">8</div>
        <div class="styLNDesc"   style="width:175mm;padding-top:0mm;padding-bottom:0mm;">
		 	Reserved for future use
            <!--Dotted Line-->
		    <span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">..................................</span> 
	   
 							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
							</xsl:call-template>    		 
							  <label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>

							 </label>
                               <span style="width:2px;"/>
							
							<input type="Checkbox" class="styCkbox" disabled="disabled">
								<!--<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
									<xsl:with-param name="BackupName">IRS8933DummyInd</xsl:with-param>
								</xsl:call-template>-->
							</input>
							</span>
		</div>
    </div>  
   
    <!-- end Line 8 -->   
   
   
   </div>
   <!-- BEGIN PART II TITLE -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;font-family:arial;
		  text-align:center;padding-top:.5mm">Part II</div>
						<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;
		  padding-bottom:.5mm;padding-top:.5mm;height:10mm;">
		  Facilities at Which Qualified Carbon Oxide Qualifies for a Credit Under Section 45Q(a)(1) or (2), or for
		  Which an Election Was Made Under Section 45Q(b)(3)
		  </div>
					</div>
							
  <!-- BEGIN PART II TITLE END-->
   </div>
  
  <!--Qualified carbon dixiode-->
  <div style="width: 187mm">
  
   <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 2mm;float:left;clear:none;">1</div>
   <div class="styIRS8933MedLNDesc" style="height: 14mm; padding-top: 2mm;width:138mm;"> 
   <b>Qualified carbon oxide captured using carbon capture equipment originally placed in service at a qualified facility before February 9, 2018, disposed of in secure geological
        storage, and not used as a tertiary injectant in a qualified enhanced oil or natural gas recovery
        project, nor utilized as described in section 45Q(f)(5).</b>
    </div>
    <div class="styLNRightNumBox" style="height:15mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:15mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
 <!--  Line 1a -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-left:3mm;float:left;clear:none;">a</div>
    <div class="styLNDesc"   style="width:133mm;padding-bottom:0mm;">
		<div class="styIRS8933MedLNDesc" style="height: 17mm;width:91.5mm;padding-left:.5mm;">
               Metric tons captured and disposed of and for which you didn’t elect for another
taxpayer to claim the carbon oxide sequestration credit. See instructions for
attaching Model Certificates CF, DISP-Operator, and DISP-Owner
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>  		
		</div>
     		  
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
    
    <!-- Line 1a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"></div>
						<div class="styLNDesc" style="width:96mm;">
							<span style="float:left;"></span>
							<!--<span style="float:left;">(see instructions)</span>-->
							<span class="styIRS8960Dots">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:5.5mm;">1a</div>
						<div class="styLNAmountBox" style="height:9mm;padding-right:2px;padding-top:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedBfrSpcfdDtGrp/MetricTonsCapturedQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:9mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:9mm;"/>
					</div>
					<!-- Line 1b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">b</div>
						<div class="styLNDesc" style="width:98mm;">
							Inflation–adjusted credit rate 
							<span style="float:left;"></span>
							<span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">..............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1b</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:2px;">
							$24.10<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapturedNotUse"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;"/>
					</div>
  <!-- end Line 1a -->  
  <!--  Line 1b -->  
  
    <!--  end Line 1b --> 
  <!--  Line 1c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;">Multiply line 1a by line 1b 
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
    <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 2mm;float:left;clear:none;">2</div>
   <div class="styIRS8933MedLNDesc" style="height: 12mm; padding-top: 2mm;width:138mm;"> <b>
   Qualified carbon oxide captured using carbon capture equipment originally placed in service at
a qualified facility before February 9, 2018, disposed of in secure geological storage, and used
as a tertiary injectant in a qualified enhanced oil or natural gas recovery project.
    </b>
    </div>
    <div class="styLNRightNumBox" style="height:12mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:12mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
 <!--  Line 2a -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-left:3mm;float:left;clear:none;">a</div>
    <div class="styLNDesc"   style="width:133mm;">
		<div class="styIRS8933MedLNDesc" style="height: 12mm; padding-top: 0mm;width:91.5mm;padding-left:.5mm;">
               Metric tons captured and disposed of and for which you didn’t elect for another
taxpayer to claim the carbon oxide sequestration credit. See instructions for
attaching Model Certificates CF, EOR-Operator, and EOR-Owner
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>  		
		</div>
     		  
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
    
    <!-- Line 2a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"></div>
						<div class="styLNDesc" style="width:96mm;">
							
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">2a</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-right:2px;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapturedUsedBfrSpcfdDtGrp/MetricTonsCapturedQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;"/>
					</div>
					<!-- Line 2b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:4mm;padding-top:1mm;">b</div>
						<div class="styLNDesc" style="width:98mm;height:4mm;padding-top:1mm;">
							Inflation–adjusted credit rate 
							<span style="float:left;"></span>
							<span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">.............</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">2b</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:2px;">
							$12.05<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapturedUsedBfr"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;"/>
					</div>
    
  <!--  Line 2b -->  
  
    <!--  end Line 2b --> 
  <!--  Line 2c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;">Multiply line 2a by line 2b 
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
     </div>
    <div class="styLNRightNumBox">2c</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CapturedUsedBfrSpcfdDtGrp/MetricTonsCapturedCreditAmt"/>
      </xsl:call-template>
    </div>
  </div>
  <!--  end Line 2c -->
  
  
     <!--  Line 3a -->  
     <!--Qualified carbon dioxide-->
  <div style="width: 187mm;">
    <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 2mm;float:left;clear:none;">3</div>
   <div class="styIRS8933MedLNDesc" style="height: 10mm; padding-top: 2mm;width:138mm;"> <b>
   Qualified carbon oxide captured using carbon capture equipment originally placed in service at
a qualified facility before February 9, 2018, and utilized as described in section 45Q(f)(5).
    </b>
    </div>
    <div class="styLNRightNumBox" style="height:10mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:10mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
 <!--  Line 3a -->  
     <div style="width: 187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-left:3mm;float:left;clear:none;">a</div>
    <div class="styLNDesc"   style="width:133mm;">
		<div class="styIRS8933MedLNDesc" style="height: 10mm;width:91.5mm;padding-left:.5mm;">
               Metric tons captured and utilized and for which you didn’t elect for another
taxpayer to claim the carbon oxide sequestration credit. See instructions for
attaching Model Certificates CF and UTZ
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>  		
		</div>
     		  
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
    
    <!-- Line 3a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"></div>
						<div class="styLNDesc" style="width:96mm;">
							<span style="float:left;"></span>
							<!--<span style="float:left;">(see instructions)</span>-->
							<!--<span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">.........................</span> -->
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">3a</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:3mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedAftrSpcfdDtGrp/MetricTonsCapturedQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:6mm;"/>
					</div>
					<!-- Line 3b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:4mm;padding-top:0mm">b</div>
						<div class="styLNDesc" style="width:98mm;height:4mm;padding-top:0mm;">
							Inflation–adjusted credit rate 
							<span style="float:left;"></span>
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..............</span>  
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">3b</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:2px;">
							$12.05<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedAftrSpcfdDt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;"/>
					</div>
  <!-- end Line 3 -->  
  <!--  Line 3c -->  
  
    <!--  end Line 3b --> 
  <!--  Line 3c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;">Multiply line 3a by line 3b 
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
     </div>
    <div class="styLNRightNumBox" style="border-bottom-width: 0px;">3c</div>
    <div class="styLNAmountBox" style="border-bottom-width: 0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedAftrSpcfdDtGrp/MetricTonsCapturedCreditAmt"/>
      </xsl:call-template>
    </div>
  </div>
  
 <!-- <p style="page-break-before: always"/>-->
  <!--  end Line 3c -->
  
  
     <!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;border-top-width: 1px;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;font-family:arial;
		  text-align:center;padding-top:.5mm;">Part III</div>
						<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;
		  padding-bottom:.5mm;padding-top:.5mm;height:10mm;">
		  Qualified Facilities Under Section 45Q(a)(3) or (4) for Which No Election Was Made Under Section 45Q(b)(3)
		  </div>
					</div>
							
  <!-- BEGIN PART III TITLE END-->
   
 <!--  Line 4a -->  
     <!--Qualified carbon dioxide-->
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 2mm;float:left;clear:none;">4</div>
   <div class="styIRS8933MedLNDesc" style="height: 18mm; padding-top: 2mm;width:138mm;"> <b>
   Qualified carbon oxide captured using carbon capture equipment originally placed in service
at a qualified facility on or after February 9, 2018, during the 12-year period beginning on the
date the equipment was originally placed in service, disposed of in secure geological storage,
and not used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project,
nor utilized as described in section 45Q(f)(5).
    </b>
    </div>
    <div class="styLNRightNumBox" style="height:18mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:18mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
 <!--  Line 4a -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-left:3mm;float:left;clear:none;">a</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		<div class="styIRS8933MedLNDesc" style="height: 12mm;width:91.5mm;padding-left:.5mm;">
               Metric tons captured and disposed of and for which you didn’t elect for another
taxpayer to claim the carbon oxide sequestration credit. See instructions for
attaching Model Certificates CF, DISP-Operator, and DISP-Owner
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>  		
		</div>
     		  <!--<div class="styUnderlineAmount" style="height:4mm;width:40.5mm;">
		  <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedBfrSpcfdDtGrp/MetricTonsCapturedQty"/>
		  </xsl:call-template>
		   --><!--<span style="width:2mm;"/>--><!--
		</div>-->
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
    
    <!-- Line 4a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"></div>
						<div class="styLNDesc" style="width:96mm;">
							<!--<span style="float:left;"></span>-->
							<!--<span style="float:left;">(see instructions)</span>-->
							<!--<span class="styIRS8960Dots">....................</span>-->
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">4a</div>
						<div class="styLNAmountBox" style="height:7.5mm;padding-right:2px;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapturedUsedAftrSpcfdDtGrp/MetricTonsCapturedQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7.5mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7.5mm;"/>
					</div>
					<!-- Line 4b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:4mm;">b</div>
						<div class="styLNDesc" style="width:98mm;height:4mm;">
							Section 45Q(a)(3) applicable dollar amount 
							<span style="float:left;"></span>
							<span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">..........</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">4b</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:2px;">
							$34.81<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjNetIncmOrLossNonSect1411Amt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;"/>
					</div>
  <!-- end Line a -->  
  <!--  Line 4b -->  
  
    <!--  end Line 4b --> 
  <!--  Line 4c -->  
  <div class="styBB" style="width:187mm;">
 
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;">Multiply line 4a by line 4b 
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
     </div>
    <div class="styLNRightNumBox" style="border-bottom-width: 0px;">4c</div>
    <div class="styLNAmountBox" style="border-bottom-width: 0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CapturedUsedAftrSpcfdDtGrp/MetricTonsCapturedCreditAmt"/>
      </xsl:call-template>
    </div>
 
  </div>
   
  <!--  end Line 4c -->
  <!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span> 
          <span style="width:30mm;"/>                      
          Cat. No. 37748H
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							  Form <span class="styBoldText" style="font-size:8pt;">8933</span> (2021)
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8933 (2021)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					
     <!-- BEGIN PART III TITLE -->
					<div class="styBB" style="width:187mm;border-top-width: 1px;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;font-family:arial;
		  text-align:center;padding-top:.5mm">Part III</div>
						<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;
		  padding-bottom:.5mm;padding-top:.5mm;height:10mm">
		  Qualified Facilities Under Section 45Q(a)(3) or (4) for Which No Election Was Made Under Section 45Q(b)(3)
		  (continued)
		  </div>
					</div>
					
		 <!--  Line 5a -->  
     <!--Qualified carbon dioxide-->
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 2mm;float:left;clear:none;">5</div>
   <div class="styIRS8933MedLNDesc" style="height: 14mm; padding-top: 2mm;width:138mm;"> <b>
   Qualified carbon oxide captured using carbon capture equipment originally placed in service
at a qualified facility on or after February 9, 2018, during the 12-year period beginning on the
date the equipment was originally placed in service, disposed of in secure geological storage,
and used as a tertiary injectant in a qualified enhanced oil or natural gas recovery project.
    </b>
    </div>
    <div class="styLNRightNumBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:14mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
 <!--  Line 5a -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-left:3mm;float:left;clear:none;">a</div>
    <div class="styLNDesc"   style="width:133mm;">
		<div class="styIRS8933MedLNDesc" style="height: 12mm; padding-top: 0mm;width:91.5mm;padding-left:.5mm;">
               Metric tons captured and disposed of and for which you didn’t elect for another
taxpayer to claim the carbon oxide sequestration credit. See instructions for
attaching Model Certificates CF, EOR-Operator, and EOR-Owner
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...................</span>  		
		</div>
     		  <!--<div class="styUnderlineAmount" style="height:4mm;width:40.5mm;">
		  <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedBfrSpcfdDtGrp/MetricTonsCapturedQty"/>
		  </xsl:call-template>
		   --><!--<span style="width:2mm;"/>--><!--
		</div>-->
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
    
    <!-- Line 5a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"></div>
						<div class="styLNDesc" style="width:96mm;">
							<span style="float:left;"></span>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding-top:5.5mm;">5a</div>
						<div class="styLNAmountBox" style="height:9mm;padding-right:2px;padding-top:5.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CptrUsedOnAftrSpcfdDtGrp/MetricTonsCapturedQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:9mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:9mm;"/>
					</div>
					<!-- Line 5b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:4mm;padding-top:1mm;">b</div>
						<div class="styLNDesc" style="width:98mm;height:4mm;padding-top:1mm;">
							Section 45Q(a)(4) applicable dollar amount 
							<span class="styDotLn" style="float:none;clear:none;padding-right:2mm;">.........</span> 
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-top:1mm;">5b</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:2px;padding-top:1mm;">
							22.68<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CptrUsedOnAftrSpcfdDtGrp/MetricTonsCapturedC"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;"/>
					</div>
  <!-- end Line 5a -->  
  <!--  Line 5b -->  
  <!--<div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;"></div>
     <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
    
 --><!--Dotted Line--><!--
	     
   </div>
    
    
  </div>-->
    <!--  end Line 5b --> 
  <!--  Line 5c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">Multiply line 5a by line 5b 
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
     </div>
    <div class="styLNRightNumBox">5c</div>
    <div class="styLNAmountBox">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CptrUsedOnAftrSpcfdDtGrp/MetricTonsCapturedCreditAmt"/>
      </xsl:call-template>
    </div>
  </div>
  
  
  <!--  end Line 5c -->	
  <!--  Line 6a -->  
     <!--Qualified carbon dioxide-->
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 2mm;float:left;clear:none;">6</div>
   <div class="styIRS8933MedLNDesc" style="height: 11mm; padding-top: 2mm;width:138mm;"> <b>
   Qualified carbon oxide captured using carbon capture equipment originally placed in service at
a qualified facility on or after February 9, 2018, during the 12-year period beginning on the date
the equipment was originally placed in service, and utilized as described in section 45Q(f)(5).
    </b>
    </div>
    <div class="styLNRightNumBox" style="height:13mm; padding-top: 2mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:13mm; padding-top: 2mm; border-bottom-width:0px">
    </div>
    </div>
 <!--  Line 6a -->  
     <div style="width: 187mm">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-left:3mm;float:left;clear:none;">a</div>
    <div class="styLNDesc"   style="width:133mm;">
		<div class="styIRS8933MedLNDesc" style="height: 10mm;width:91.5mm;padding-left:.5mm;">
               Metric tons captured and utilized and for which you didn’t elect for another
taxpayer to claim the carbon oxide sequestration credit. See instructions for
attaching Model Certificates CF and UTZ
			<!--Dotted Line-->
				<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>  		
		</div>
     		  
     </div>
    <div class="styIRS8933Multiple" style="height:4mm; width:5mm;"/>
  <div class="styLNRightNumBox" style="height:4.5mm; width:8mm; border-bottom-width:0px;background-color:lightgrey;"/>
    <div class="styLNAmountBox" style="height:4.5mm;  border-bottom-width:0px;">      
    </div>
    </div>
    
    <!-- Line 6a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBoxSD"></div>
						<div class="styLNDesc" style="width:96mm;">
							<span style="float:left;"></span>
							
						</div>
						<div class="styLNRightNumBox" style="height:7.0mm;padding-top:3.5mm;">6a</div>
						<div class="styLNAmountBox" style="height:7.0mm;padding-right:2px;padding-top:3.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CptrOnAftrSpcfdDtSect45Qf5Grp/MetricTonsCapturedQty"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:7mm;"/>
					</div>
					<!-- Line 6b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;height:6mm;padding-top:2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;height:6mm;padding-top:2mm;">
							Section 45Q(a)(4) applicable dollar amount 
							<span style="float:left;"></span>
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">6b</div>
						<div class="styLNAmountBox" style="height:6mm;padding-right:2px;padding-top:3mm;">
							22.68<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjNetIncmOrLossNonSect141"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB" style="height:6mm;"/>
					</div>
  <!-- end Line a -->  
  <!--  Line 6b -->  
  
    <!--  end Line 6b --> 
  <!--  Line 6c -->  
  <div style="width: 187mm">
    <div class="styLNLeftNumBox" style="width:6mm;padding-left:3mm;">c</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm">Multiply line 6a by line 6b 
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........................</span>
     </div>
    <div class="styLNRightNumBox" style="border-bottom-width: 0px;">6c</div>
    <div class="styLNAmountBox" style="border-bottom-width: 0px;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CapturedNotUsedBfrSpcfdDtGrp/MetricTonsCapturedCreditAmt"/>
      </xsl:call-template>
    </div>
  </div>
  
  
  <!--  end Line 6c -->	
   <!-- BEGIN PART IV TITLE -->
					<div class="styBB" style="width:187mm;border-top-width: 1px;">
						<div class="styPartName" style="font-size:10pt;padding-bottom:5mm;font-family:arial;
		  text-align:center;padding-top:.5mm;">Part IV</div>
						<div class="styPartDesc" style="font-size:10pt;padding-left:3mm;float:left;clear:none;
		  padding-bottom:.5mm;padding-top:.5mm;">
		  Other Information </div>
					</div>
<!--  Line 7 -->  
     <div style="width: 187mm;">
      <div class="styLNLeftNumBox" style="width:6mm;height:4mm; padding-top: 2.5mm;float:left;clear:none;">7</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
     		  <div class="styIRS8933MedLNDesc" style="height: 6mm; padding-top: 1mm;width:135mm;padding-left:.5mm;">
						<div style="width: 128mm;">
								Check the box if you're making the election under section 45Q(b)(3)
							<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
						</div>
							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/Section45Qb3ElectionInd"/>
							</xsl:call-template>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Section45Qb3ElectionInd"/>
									<xsl:with-param name="BackupName">Section45Qb3ElectionInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<span style="width:5px;"/>
								<input type="checkbox" alt="Section 45 Q b 3 Election Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section45Qb3ElectionInd"/>
										<xsl:with-param name="BackupName">Section45Qb3ElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
     </div>
     
     
   <div class="styIRS8933MedLNDesc" style="height:5mm; width:5mm;"/>
  <div class="styShadingCellRB" style="height:5mm; width:8mm;background-color:lightgrey; border-right-width:0px;"/>
  <div class="styLNAmountBox" style="height:5mm;border-bottom-width:0px; "/>
    </div>
   
    <!-- end Line 7 -->  
    
    <!--  Line 8 -->  
    <div style="width: 187mm;height: 6mm;">
      <div class="styLNLeftNumBox" style="width:6mm;height: 4mm; padding-top: 2.5mm;float:left;clear:none;">8</div>
    <div class="styLNDesc"   style="width:133mm;padding-top:0mm;padding-bottom:0mm;">
		
     		  <div class="styIRS8933MedLNDesc" style="height: 8mm; padding-top: 1mm;width:135mm;padding-left:.5mm;">
								<div style="width: 129mm;">
							 Check the box if you're making the election under section 45Q(f)(6)
							 <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
							 	</div>
							<span>								
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/Section45Qb6ElectionInd"/>
							</xsl:call-template>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Section45Qb6ElectionInd"/>
									<xsl:with-param name="BackupName">Section45Qb6ElectionInd</xsl:with-param>
								</xsl:call-template>
							</label>
							<span style="width:2px;"/>
						<input type="checkbox" alt="Section 45Q f 6 Election Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section45Qb6ElectionInd"/>
										<xsl:with-param name="BackupName">Section45Qb6ElectionInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
     </div>
    <div class="styIRS8933MedLNDesc" style="height:5mm; width:5mm;"/>
  <div class="styShadingCellRB" style="height:8mm; width:8mm;background-color:lightgrey; border-right-width:0px;"/>
  <div class="styLNAmountBox" style="height:12mm;border-bottom-width:0px; "/>
    </div>
        <!-- end Line 8 --> 
        <!--  Line 9 -->  
  <div style="width: 187mm;">
    <div class="styLNLeftNumBox" style="width:6mm;height: 3mm; padding-top: 0mm;float:left;clear:none;">9</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;height:7mm;">Carbon oxide sequestration credit for which another taxpayer elected under section 45Q(f)(3)(B) to
allow you to claim. See instructions for attaching Model Certificates ELECT, EOR-Owner, DISP-Owner,
and UTZ
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
     </div>
    <div class="styLNRightNumBox" style="height:7mm;padding-top: 4mm;">9</div>
    <div class="styLNAmountBox" style="height:7mm;padding-top: 4mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CrbnOxdSqstrtnCrAmt"/>
      </xsl:call-template>
    </div>
  </div>
  
  
  <!--  end Line 9 -->	 
  <!--  Line 10 -->  
  <div style="width: 187mm;">
    <div class="styLNLeftNumBox" style="width:6mm;height: 3mm; padding-top: 0mm;float:left;clear:none;">10</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;height:5mm;">Carbon oxide sequestration credit from partnerships and S corporations (see instructions)
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
     </div>
    <div class="styLNRightNumBox" style="height:5mm;padding-top: 2mm;">10</div>
    <div class="styLNAmountBox" style="height:5mm;padding-top: 2mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CreditAmt"/>
      </xsl:call-template>
    </div>
  </div>
   
  <!--  end Line 10 -->
  <!--  Line 11 -->  
  <div style="width: 187mm;">
    <div class="styLNLeftNumBox" style="width:6mm;height: 3mm; padding-top: 0mm;float:left;clear:none;">11</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;height:7mm;">Add lines 1c, 2c, 3c, 4c, 5c, 6c, 9, and 10. Partnerships and S corporations, report this amount on
Schedule K. All others, report this amount on Form 3800, Part III, line 1x
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:left;padding-right:2mm;">..............</span>
     </div>
     <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"/>
						<div class="styLNAmountBoxNBB"/>
    <div class="styLNRightNumBox" style="height:3.5mm;">11</div>
    <div class="styLNAmountBox" style="height:3.5mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/TotalAmt"/>
      </xsl:call-template>
    </div>
    
  </div>
  
  
  <!--  end Line 11 -->	 	
  <!--  Line 12 -->  
  <div style="width: 187mm;">
    <div class="styLNLeftNumBox" style="width:6mm;height: 3mm; padding-top: 0mm;float:left;clear:none;">12</div>
    <div class="styIRS8933MedLNDesc" style="width:138mm;height:5mm;">Carbon oxide sequestration credit recaptured. See instructions for attaching Model Certificate
RECAPTURE
	 <!--Dotted Line-->
		<span class="styDotLn" style="float:right;clear:nonr;padding-right:2mm;">.</span>
     </div>
    <div class="styLNRightNumBox" style="height:4.5mm;padding-top: 1mm;">12</div>
    <div class="styLNAmountBox" style="height:4.5mm;padding-top: 1mm;">
      <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$FormData/CrbnOxdSqstrtnCrRcptrAmt"/>
      </xsl:call-template>
    </div>
  </div>
  
    <!--  end Line 12 -->	 	  
		
					
          <div style="width:187mm;border-style: solid; border-color: black;
	border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
          <span class="styBoldText"></span> 
          <span style="width:20mm;"/>                      
          
          <span style="width:142mm;"/>  
          Form <span class="styBoldText">8933</span> (2021)
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