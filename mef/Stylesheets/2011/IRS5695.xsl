<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5695Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5695Data" select="$RtnDoc/IRS5695"/>

	<xsl:template match="/">
		<html lang="EN-US">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5695Data)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 5695"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5695Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS5695" style="font-family:arial;">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:2px;">
						<div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
							<div style="padding-top:1mm;">
								Form<span class="styFormNumber">  5695</span>
							</div>
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5695Data"/>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:123.5mm;">
							<!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
							<div class="styMainTitle" style="height:8mm;">
								Residential Energy Credits
							</div>
							<div class="styGenericDiv" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
								<span style="text-align:center;">
									<div style="width:100%;height:5mm;padding-left:5px;">
										<div style="width:80mm;height:5mm;">
											<br/>
											<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/> 
											See instructions.
											<br/>
											<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/> 
											Attach to Form 1040 or Form 1040NR.
										</div>
									</div>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;border-left-width:2px;float:right">
							<div class="styOMB" style="height:2mm;font-size:7pt;">OMB No. 1545-0074</div>
							<div class="styTY">20<span class="styTYColor">11</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">158</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
							Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form5695Data/Name"/>
							</xsl:call-template>
						</div>
						<div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
							Your social security number
							<br/>
							<span style="font-weight:normal;text-align:center;width:100%">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$Form5695Data/SSN"/>
									<xsl:with-param name="BackupName">IRS5695SSN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part I																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div style="padding:1.5mm 0px 1.5mm 0px; border-width:0px 0px 0px 0px;width:100%;">
							<div class="styGenericDiv" style="width:15mm;">Part I</div>
							<div  class="styGenericDiv" style="padding-left:3mm;font-size:8.5pt;">
								Nonbusiness Energy Property Credit
								
							</div>
						</div>
					</div>
					<!-- Body -->
					<!-- 1a -->
					<div class="styGenericDiv" style="width:187mm;height:7mm">
						<div class="styLNLeftNumBox">1a.</div>
						<div class="styLNDesc" style="height:7mm">
							Were the qualified energy efficiency improvements or residential energy property costs for your main home located in the<br/>
							United States? (see instructions)
						</div>
						<div class="styLNRightNumBox" style="height:5mm">1a</div>
						<div class="styLNAmountBox" style="height:5mm;border-left-width:0">
							<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
											<xsl:with-param name="BackupName">IRS5695NonBusinessEgyEffcntPropCrGrpHomeLocatedInUSAInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
										<xsl:with-param name="BackupName">IRS5695NonBusinessEgyEffcntPropCrGrpHomeLocatedInUSAInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<span style="width:6mm;"/>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
											<xsl:with-param name="BackupName">IRS5695NonBusinessEgyEffcntPropCrGrpHomeLocatedInUSAInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/HomeLocatedInUSAInd"/>
										<xsl:with-param name="BackupName">IRS5695NonBusinessEgyEffcntPropCrGrpHomeLocatedInUSAInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
						</div>
						<div class="styLNAmountBoxNBB" style="width:40mm;height:2mm;background-color:lightgrey"/>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<div class="styLNDesc" style="width:146mm;padding-left:4mm">
							<b>Caution:</b>
							<span class="styItalicText"> If you checked the “No” box, you cannot claim the nonbusiness energy property credit.
							Do not complete Part I.
							</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:40mm;background-color:lightgrey"/>
					</div>
					<!-- 1b -->
					<div class="styGenericDiv" style="width:187mm;height:5mm">
						<div class="styLNLeftNumBox">1b.</div>
						<div class="styLNDesc" style="">
							Print the complete address of the main home where you made the qualifying improvements.
						</div>
						<div class="styLNAmountBoxNBB" style="width:40mm;height:5mm;background-color:lightgrey"/>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<div class="styLNDesc" style="width:146mm;padding-left:4mm">
							<b>Caution:</b>
							<span class="styItalicText"> You can only have one main home at a time.
							</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:40mm;background-color:lightgrey"/>
					</div>
					<div class="styGenericDiv" style="width:187mm;height:4mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc"/>
						<div class="styLNAmountBoxNBB" style="width:40mm;height:4mm;background-color:lightgrey"/>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc">
						</div>
						<div class="styLNAmountBoxNBB" style="width:40mm;height:4mm;background-color:lightgrey"/>
					</div>

					<!-- Address////////////////////////////////////////////////////-->
						<div class="styGenericDiv" style="width:187mm;height:22mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EgyPropCrMainHomeUSAddress/AddressLine1"/>
								</xsl:call-template> 
								<xsl:if test="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EgyPropCrMainHomeUSAddress/AddressLine2 != ''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EgyPropCrMainHomeUSAddress/AddressLine2"/>
									</xsl:call-template> 
								</xsl:if>
								<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:1mm;height:7mm">
									Number and street<span style="width:80mm"/>Apt.No.<br/><br/>
									<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EgyPropCrMainHomeUSAddress"/>
								</xsl:call-template>								</div>
								<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:1mm">
									City, State, and ZIP code
								</div>
							</div>	
							<div class="styLNAmountBoxNBB" style="width:40mm;height:23.5mm;background-color:lightgrey"/>
						</div>

					<!-- 1c -->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox">1c.</div>
						<div class="styLNDesc" style="height:5mm">
							Were any of these improvements related to the construction of this main home?
						</div>
						<div class="styLNRightNumBox" style="border-top:1px solid black;height:5mm">1c</div>
						<div class="styLNAmountBox" style="border-top:1px solid black;height:5mm;border-left-width:0">
							<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
											<xsl:with-param name="BackupName">IRS5695NonBusinessEgyEffcntPropCrGrpImprvRltdToConstMainHomeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
										<xsl:with-param name="BackupName">IRS5695NonBusinessEgyEffcntPropCrGrpImprvRltdToConstMainHomeInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<span style="width:6mm;"/>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
											<xsl:with-param name="BackupName">IRS5695NonBusinessEgyEffcntPropCrGrpImprvRltdToConstMainHomeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ImprvRltdToConstMainHomeInd"/>
										<xsl:with-param name="BackupName">IRS5695NonBusinessEgyEffcntPropCrGrpImprvRltdToConstMainHomeInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;height:10mm;">
						<div class="styLNDesc" style="width:146mm;height:10mm;padding-left:4mm;padding-top:0">
							<b>Caution:</b>
							<span class="styItalicText"> If you checked the "Yes" box, you can only claim the nonbusiness energy property credit for qualifying improvements <br/>that were
							not related to the construction of the home and made after you moved into the home. Do not include expenses<br/> related to the construction of your main home.
							</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:40mm;height:10mm;background-color:lightgrey;padding-top:0"/>
					</div>
					<!-- 2 -->
					<div class="styGenericDiv" style="width:187mm;height:5.5mm;">
						<div class="styLNLeftNumBox">2.</div>
						<div class="styLNDesc">
							Lifetime limitation. Amounts claimed in 2006, 2007, 2009, and 2010.
						</div>
						<!--<div class="styLNRightNumBox" style="height:5mm">2</div>-->
						<div class="styLNAmountBox" style="width:40mm;background-color:lightgrey;height:5.5mm;"/>
					</div>
					<!-- 2a -->					
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">a.</div>
						<div class="styLNDesc" style="height:4mm;width:100mm">
							Amount, if any, from line 12 of your 2006 Form 5695
						</div>
							<div  class="styLNRightNumBox" style="height:4.825mm;width:8mm;text-align:center;border-top:1px solid black">2a</div>
							<div class="styLNAmountBox" style="height:4.825mm;width:30mm;border-top:1px solid black">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/NonBusinessEnergyCr5thPYAmt"/>
								</xsl:call-template>
							</div>
						<div class="styLNAmountBox" style="height:4.825mm;width:40mm;background-color:lightgrey;"/>
					</div>
					<!-- 2b -->
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">b.</div>
						<div class="styLNDesc" style="height:4mm;width:100mm">
							Amount, if any, from line 15 of your 2007 Form 5695
						</div>
						<div  class="styLNRightNumBox" style="height:4.825mm;width:8mm;text-align:center;">2b</div>
						<div class="styLNAmountBox" style="height:4.825mm;width:30mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/NonBusinessEnergyCr4thPYAmt"/>
								</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.825mm;width:40mm;background-color:lightgrey;"/>
					</div>
					<!-- 2c -->
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">c.</div>
						<div class="styLNDesc" style="height:4mm;width:100mm">
							Amount, if any, from line 11 of your 2009 Form 5695
						</div>
						<div  class="styLNRightNumBox" style="height:4.825mm;width:8mm;text-align:center;">2c</div>
						<div class="styLNAmountBox" style="height:4.825mm;width:30mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/NonBusinessEnergyCr2ndPYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.825mm;width:40mm;background-color:lightgrey;"/>
					</div>
					<!-- 2d -->
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">d.</div>
						<div class="styLNDesc" style="height:4mm;width:100mm">
							Amount, if any, from line 11 of your 2010 Form 5695
						</div>
						<div  class="styLNRightNumBox" style="height:4.825mm;width:8mm;text-align:center;">2d</div>
						<div class="styLNAmountBox" style="height:4.825mm;width:30mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/NonBusinessEnergyCrPYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.825mm;width:40mm;background-color:lightgrey;"/>
					</div>
					<!-- 2e -->
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">e.</div>
						<div class="styLNDesc" style="height:4mm;">
							Add lines 2a through 2d. If $500 or more, <b>stop</b>; you cannot take the nonbusiness energy property credit.
						</div>
						<div class="styLNRightNumBox" style="height:4.7mm">2e</div>
						<div class="styLNAmountBox" style="height:4.7mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/TotNonBusinessRsdntlEgyCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 3 -->
					<div class="styGenericDiv" style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBox">3.</div>
						<div class="styLNDesc" >
							Qualified energy efficiency improvements (original use must begin with you and the component must reasonably be expected to
							last for at least 5 years; do not include labor costs) (see instructions)
						</div>
						<div class="styLNAmountBox" style="width:40mm;background-color:lightgrey;height:7.3mm"/>
					</div>
					<!--3a-->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">a.</div>
						<div class="styLNDesc" style="height:4mm;">
							Insulation material or system specifically and primarily designed to reduce heat loss or gain of your home.
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">3a</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/InsulationOrSysHtGnLossCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--3b-->
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">b.</div>
						<div class="styLNDesc" style="height:4mm;">
							Exterior doors (including certain storm doors) that meet or exceed the Energy Star program requirements. 
						</div>
						<div class="styLNRightNumBox" style="height:4.7mm">3b</div>
						<div class="styLNAmountBox" style="height:4.7mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ExteriorDoorsCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--3c-->
					<div class="styGenericDiv" style="width:187mm;height:7mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">c.</div>
						<div class="styLNDesc" style="height:4mm;">
							Metal or asphalt roof that meets or exceeds the Energy Star Program requirements and has appropriate pigmented coatings or cooling
							granules which are specifically and primarily designed to reduce the heat gain of your home.
						</div>
						<div class="styLNRightNumBox" style="height:7.3mm">3c</div>
						<div class="styLNAmountBox" style="height:7.3mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MetalOrAsphaltRoofCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--3d-->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">d.</div>
						<div class="styLNDesc" style="height:4mm;width:100mm">
							Exterior windows (including storm windows) and skylights that meet or exceed the Energy Star program requirements.
						</div>
						<div  class="styLNRightNumBox" style="width:8mm;text-align:center;border-top:1px solid black;height:8mm">3d</div>
						<div class="styLNAmountBox" style="width:30mm;border-top:1px solid black;height:8mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/ExteriorWndwOrSkylightCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:40mm;background-color:lightgrey;"/>
					</div>
					<!--3e-->
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">e.</div>
						<div class="styLNDesc" style="height:4mm;width:100mm">
							Maximum amount of cost on which the credit can be figured.
						</div>
						<div  class="styLNRightNumBox" style="height:4.825mm;width:8mm;text-align:center;">3e</div>
						<div class="styLNAmountBox" style="height:4.825mm;width:30mm;">$2,000</div>
						<div class="styLNAmountBox" style="height:4.825mm;width:40mm;background-color:lightgrey;"/>
					</div>
					<!--3f-->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">f.</div>
						<div class="styLNDesc" style="width:100mm">
							If you claimed window expenses on your Form 5695 for 2006, 2007, 2009, or 2010, enter the amount
							from the Window Expense Worksheet (see instructions); otherwise enter -0-
						</div>
						<div  class="styLNRightNumBox" style="height:8mm;width:8mm;text-align:center;">3f</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/PriorYearWindowExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:40mm;background-color:lightgrey;"/>
					</div>
					<!--3g-->
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">g.</div>
						<div class="styLNDesc" style="height:4mm;width:100mm">
							Subtract line 3f from line 3e. If zero or less, enter -0-
						</div>
						<div  class="styLNRightNumBox" style="height:4.5mm;width:8mm;text-align:center;">3g</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30mm;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MaxEgyCrLessPYWindowExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:40mm;background-color:lightgrey;"/>
					</div>
					<!--3h-->
					<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">h.</div>
						<div class="styLNDesc" style="height:4mm;">
							Enter the smaller of line 3d or line 3g
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm">3h</div>
						<div class="styLNAmountBox" style="height:4.5mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/CrAfterAppWndwExpnsLimitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--4-->
					<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">4.</div>
						<div class="styLNDesc" style="height:4mm;">
							Add lines 3a, 3b, 3c, and 3h
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm">4</div>
						<div class="styLNAmountBox" style="height:4.5mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/PartialEnergyImprvCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--5-->
					<div class="styGenericDiv" style="width:187mm;height:4.5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">5.</div>
						<div class="styLNDesc" style="height:4mm;">
							Multiply line 4 by 10% (.10)
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm">5</div>
						<div class="styLNAmountBox" style="height:4.5mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EnergyEffcntImprvStdPctCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--6-->
					<div class="styGenericDiv" style="width:187mm;height:6mm;">
						<div class="styLNLeftNumBox">6.</div>
						<div class="styLNDesc" >
							Residential energy property costs (must be placed in service by you; include labor costs for onsite preparation, assembly, and
							original installation) (see instructions)
						</div>
						<div class="styLNAmountBox" style="width:40mm;background-color:lightgrey;height:7.3mm"/>
					</div>
					<!--6a-->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">a.</div>
						<div class="styLNDesc" style="height:4mm;">
							Energy-efficient building property. Do not enter more than <b>$300</b>
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">6a</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EnergyEffcntBldgPropCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--6b-->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">b.</div>
						<div class="styLNDesc" style="height:4mm;">
							Qualified natural gas, propane, or oil furnace or hot water boiler. Do not enter more than <b>$150</b>
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">6b</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/QualifiedNaturalGasCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--6c-->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm">c.</div>
						<div class="styLNDesc" style="height:4mm;">
							Advanced main air circulating fan used in a natural gas, propane, or oil furnace. Do not enter more than <b>$50</b>
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">6c</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/AdvncMainAirCirctngFanCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--7-->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">7.</div>
						<div class="styLNDesc" style="height:4mm;">
							Add lines 6a through 6c
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">7</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/InternalEnergyImprvCostAmt"/>
							</xsl:call-template>	
						</div>
					</div>
					<!--8-->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">8.</div>
						<div class="styLNDesc" style="height:4mm;">
							Add lines 5 and 7
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">8</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/TotalEnergyImprovementsCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--9-->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">9.</div>
						<div class="styLNDesc" style="height:4mm;">
							Maximum credit amount. (If you jointly occupied the home, see instructions)
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">9</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MaximumResidentialEnergyCrAmt/@marriedTPMoreThanOneHomeCd"/>
								<xsl:with-param name="Desc">Line 9 - Married Tax Period More Than One Home Code </xsl:with-param>
							</xsl:call-template>
							<span style="width:10px"/>
							<span>$</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MaximumResidentialEnergyCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--10-->
					<div class="styGenericDiv" style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">10.</div>
						<div class="styLNDesc" style="height:4mm;">
							Enter the amount, if any, from line 2e
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">10</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/EnergyEffcntImprvAllwblCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--11-->
					<div style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">11.</div>
						<div class="styLNDesc" style="height:4mm;">
							Subtract line 10 from line 9. If zero or less, <b>stop</b>; you cannot take the nonbusiness energy property credit
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">11</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/AdjustedCreditLimitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--12-->
					<div  style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">12.</div>
						<div class="styLNDesc" style="height:4mm;">
							Enter the smaller of line 8 or line 11
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">12</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/LessorOfActCrOrAdjCrLimitAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--13-->
					<div  style="width:187mm;height:5mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">13.</div>
						<div class="styLNDesc" style="height:4mm;">
							Limitation based on tax liability. Enter the amount from the Credit Limit Worksheet (see instructions)
						</div>
						<div class="styLNRightNumBox" style="height:5.2mm">13</div>
						<div class="styLNAmountBox" style="height:5.2mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/TaxesLessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--14-->
					<div  style="width:187mm;height:8mm;">
						<div class="styLNLeftNumBox" style="padding-left:1mm">14.</div>
						<div class="styLNDesc" style="">
							<b>Nonbusiness energy property credit.</b> Enter the smaller of line 12 or line 13. Also include this amount on Form 1040, line 52,
							or Form 1040NR, line 49
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0;height:8mm">14</div>
						<div class="styLNAmountBox" style="border-bottom-width:0;height:8mm">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/NonBusinessEnergyCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1px solid black">
						<div style="float:left;">
							<span class="styBoldText">
								For Paperwork Reduction Act Notice, see your tax return instructions.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">5695</span> (2011)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 13540P
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- BEGIN Page Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							Form 5695 (2011)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- END Page Header -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Begin Part II																								 -->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Header -->
					<div style="width:187mm;padding:0px 0px 0px 0px;" class="styBB">
						<!-- Content -->
						<div style="padding:1.5mm 0px 1.5mm 0px; border-width:0px 0px 0px 0px;width:100%;">
							<div class="styPartName" style="width:15mm;">Part II</div>
							<div class="styPartDesc" style="padding-left:3mm;font-size:8.5pt;">
								Residential Energy Efficient Property Credit
								<span class="styNormalText"> (See instructions before completing this part.)</span>
							</div>
						</div>
					</div>
					<!-- Body -->
					<!--<div class="styTBB" style="width:187mm;">-->
						<div class="styIRS5695LineItem" style="height:8mm;border-bottom-width:1px;border-color:black;">
							<div class="styIRS5695LNDesc" style="width:100%;height:auto;padding-left:0px;padding-top:2mm;">
								<b>Note.</b>
								<span class="styItalicText"> Skip lines 15 through 25 if you only have a <b>credit carryforward from 2010.</b></span>
							</div>
						</div>

						<!-- (15) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">15</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified solar electric property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.

											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">15</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/SolarElecPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpSolarElecPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (16) ////////////////////////////////////////////////////-->

						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">16</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified solar water heating property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">16</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/SolarWaterHtPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpSolarWaterHtPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (17) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">17</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified small wind energy property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.

											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">17</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/SmallWindPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpSmallWindPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (18) ////////////////////////////////////////////////////-->

						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">18</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified geothermal heat pump property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.

											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">18</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/GeothrmlHtPumpPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpGeothrmlHtPumpPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (19) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">19</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Add lines 15 through 18
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.

											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">19</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/TotalEnergyCreditsAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpTotalEnergyCreditsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- (20) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">20</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Multiply line 19 by 30% (.30)
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">20</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/GeothrmlHtPumpPropStdPctCrAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpGeothrmlHtPumpPropStdPctCrAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (21a) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;padding-top:1mm">21a</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;padding-top:1mm;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified fuel cell property. Was the qualified fuel cell property installed on or in connection with your main home located 
										in the United States? (See instructions)
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;border-bottom-width:0;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="height:10mm;border-left-width:0;width:26mm;padding-top:5.5mm;padding-bottom:0;border-bottom-width:0">
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEnergyPropCrGrp/HomeLocatedInUSA"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
											<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpQlfyFuelCellPropertyInUSInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:3px;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
										<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpQlfyFuelCellPropertyInUSInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">Yes</span>
								</label>
								<span style="width:5mm;"/>
								<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
											<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpQlfyFuelCellPropertyInUSInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<span style="width:3px;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyInUSInd"/>
										<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpQlfyFuelCellPropertyInUSInd</xsl:with-param>
									</xsl:call-template>
									<span class="styBoldText">No</span>
								</label>
							</div>
						</div>
						
						<!-- Caution -->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;padding-top:3mm"></div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;padding-top:3mm;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										<b>Caution.</b> If you checked the "No" box, you cannot take a credit for qualified fuel cell property. Skip lines 21b through 25.
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.

											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="height:12mm;border-left-width:0;width:26mm;padding-top:7.5mm;padding-bottom:0">

							</div>
						</div>
						
						<!-- (21b) /////////////////////////////////////////////////// -->
						
						
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;padding-top:3mm">21b</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;padding-top:3mm;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Print the complete address of the main home where you installed the fuel cell property.

										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:12mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;border-bottom-width:0;background-color:lightgrey"/>
							<div class="styLNAmountBox" style="height:12mm;border-left-width:0;width:26mm;border-bottom-width:0;padding-top:7.5mm;padding-bottom:0">

							</div>
						</div>
						<!-- Address////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="height:22mm;">
							<div class="styGenericDiv" style="padding-left:1.2mm;font-weight:bold;font-size:8pt;width:9.25mm;padding-top:3mm;"/>
							<div class="styGenericDiv" style="width:142mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyHmAddress/AddressLine1"/>
								</xsl:call-template>
								<xsl:if test="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyHmAddress/AddressLine2 !=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyHmAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
								<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:.5mm;height:8.5mm;">
									Number and street<span style="width:80mm"/>Apt.No. <br/><br/>
									<xsl:call-template name="PopulateCityStateInfo">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/QlfyFuelCellPropertyHmAddress"/>
								</xsl:call-template>
								</div>
								<div class="styGenericDiv" style="width:110mm;border-top:1px solid black;margin-top:1mm">
									City, State, ZIP code
								</div>
							</div>	
							<div class="styGenericDiv" style="background-color:lightgrey;border-left:1px solid black;border-right:1px solid black;height:22mm;width:8.3mm"/>
							<div class="styGenericDiv" style="width:27mm;height:22mm"/>
						</div>						

						<!-- (22) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">22</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Qualified fuel cell property costs
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">22</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpFuelCellPropCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						<!-- (23) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">23</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Multiply line 22 by 30% (.30)
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">23</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropStdPctCrAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpFuelCellPropStdPctCrAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						
						<!-- (24) ////////////////////////////////////////////////////-->
						
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">24</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Kilowatt capacity of property on line 22 above<span style="width:3px;"/>
										<img src="{$ImagePath}/5695_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="height:4mm;font-size:6pt;width:28mm;border-width:0px 0px 1px 0px;border-style:solid;border-color:black;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropKWCapNum"/>
											</xsl:call-template>
										</span>
										x $1,000
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">24</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropStdPctCrAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpFuelCellPropStdPctCrAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						
						<!-- (25) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">25</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Enter the smaller of line 23 or line 24
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">25</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/FuelCellPropAllwblCostAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpFuelCellPropAllwblCostAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (26) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">26</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Credit carryforward from 2010. Enter the amount, if any, from your 2010 Form 5695, line 28
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												
												
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">26</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/PYCarryfwdEnergyEffPropertyAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpPYCarryfwdEnergyEffPropertyAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (27) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">27</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Add lines 20, 25, and 26
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">27</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/TotalOfEnergyCreditsAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpTotalOfEnergyCreditsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- (28) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">28</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Enter the amount from Form 1040, line 46, or Form 1040NR, line 44
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">28</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/TotalTxBeforeCrAndOtherTxsAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpTotalTxBeforeCrAndOtherTxsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						
						<!-- (29) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">29</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
										<div class="styIRS5695LNDesc" style="width:94%;height:13mm;">
										<b>1040 filers:</b> Enter the total, if any, of your credits from Form 1040,<br/>
										lines 47 through 50; line 14 of this form; line 12 of the Line 11<br/>
										worksheet in Pub. 972 (see instructions); Form 8396, line 9;<br/>
										Form 8859, line 9; Form 8834, line 23; Form 8910, line 22;<br/>
										Form 8936, line 15; and Schedule R, line 22.
									</div>
									<div class="styIRS5695CleanDiv" style="width:6%;height:26mm;float:right;">
										<img src="{$ImagePath}/5695_Bracket_Lg.gif" alt="Large Bracket"/>
									</div>
									<div class="styIRS5695LNDesc" style="width:94%;height:13mm;padding-top:2mm;">
										<b>1040NR filers:</b> Enter the amount, if any, from Form 1040NR, lines<br/>
										45 through 47; line 14 of this form; line 12 of the Line 11<br/>
										worksheet in Pub. 972 (see instructions); Form 8396, line 9;<br/>
										Form 8859, line 9; Form 8834, line 23; Form 8910, line 22; and<br/>
										Form 8936, line 15.
									</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="margin-top:16.5mm;height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;">29</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;margin-top:16.5mm;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/OtherCreditsAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpOtherCreditsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:42.5mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						<!-- (30) ////////////////////////////////////////////////////-->
							<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">30</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										Subtract line 29 from line 28. If zero or less, enter -0- here and on line 31
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:2mm">30</div>
							<div class="styLNAmountBox" style="height:6mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:2mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/TaxLessCreditsAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpTaxLessCreditsAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- (31) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">31</div>
							<div class="styIRS5695CleanDiv" style="width:144mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="padding-left:2.5mm;width:auto;height:100%;">
										<b>Residential energy efficient property credit.</b> Enter the smaller of line 27 or line 30. Also include<br/> this amount on Form 1040, line 52, or Form 1040NR, line 49
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:5mm">31</div>
							<div class="styLNAmountBox" style="height:9mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/ResidentialEnergyCreditAmt"/>
									<xsl:with-param name="BackupName">IRS5695RsdntlEnergyEffcntPropCrGrpResidentialEnergyCreditAmt</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						
						<!-- (32) ////////////////////////////////////////////////////-->
						<div class="styIRS5695LineItem" style="">
						<div class="styGenericDiv" style="padding-left:1.2mm;width:7.5mm;font-weight:bold;font-size:8pt;height:6mm">32</div>
							<div class="styIRS5695CleanDiv" style="width:109.8mm;height:auto;">
								<div class="styIRS5695LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
									<div class="styIRS5695LNDesc" style="width:auto;height:100%;">
										Credit carryforward to 2011. If line 31 is less than line 27, subtract line<br/>
										31 from line 27
										<!--Dotted Line-->
											<span class="styBoldText">.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
												<span style="width:11px"/>.
											</span>
										</div>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;padding-top:5mm">32</div>
							<div class="styLNAmountBox" style="height:9mm;border-left-width:0;width:26mm;padding-bottom:0;padding-top:5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5695Data/RsdntlEnergyEffcntPropCrGrp/CarryfwdEnergyEffPropertyCrAmt"/>
									<xsl:with-param name="BackupName">$Form5695DataRsdntlEnergyEffcntPropCrGrpCarryfwdEnergyEffPropertyCrAmt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;width:31.5px;border-right:1px solid black;border-left:1px solid black;background-color:lightgrey"/>

						</div>
						
					
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:20px;"/>
							Form<span class="styBoldText" style="font-size:7pt;"> 5695 </span>(2011)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<xsl:variable name="TableWidth">120</xsl:variable>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form5695Data"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						
						<xsl:if test="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MaximumResidentialEnergyCrAmt/@marriedTPMoreThanOneHomeCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part I - Line 9 - Married Tax Period More Than One Home Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form5695Data/NonBusinessEgyEffcntPropCrGrp/MaximumResidentialEnergyCrAmt/@marriedTPMoreThanOneHomeCd"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
