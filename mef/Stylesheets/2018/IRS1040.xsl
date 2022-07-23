<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 10/22/2020 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form1040">
					<!-- *****************************Start Page Header -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm;">
						<!-- Extra data line -->
						<div class="styGenericDiv" style="width:187mm;padding-top:2px;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Condition Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Primary Date Of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Spouse Date Of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code 2</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Combat Zone Date</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd/@combatZoneDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Special Processing Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Community Property Return Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Surviving Spouse Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Personal Representative</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Refund Product Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Left Margin - Refund Product Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCodeTxt"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:24.8mm;height:42px;padding-top:4px;">
							<img alt="Form" src="{$ImagePath}/1040_Form.gif" height="34" width="19"/>
							<span class="styFormNumber">1040</span>
						</div>
						<div class="styGenericDiv" style="width:65mm;padding-right:1mm;padding-top:6px;height:42px;">
							<span class="styAgency">Department of the Treasury&#8212;Internal Revenue Service</span>
							<span style="width:4mm;"/>(99)<br/>
							<span class="styMainTitle" style="font-family:Arial-Narrow;font-size:12pt">U.S. Individual Income Tax Return</span>
						</div>
						<div class="styTYBox" style="width:18mm;border-right-width:1px;height:42px;padding-top:7px;">
							<span class="styTaxYear">20<span class="styTYColor">18</span>
							</span>
						</div>
						<div class="styOMB" style="width:28mm;height:42px;padding:25px 1mm 1mm 1mm;float:left;
						  border-width:0px 1px 0px 0px;vertical-align:bottom;">
							OMB No. 1545-0074
						</div>
						<div class="styGenericDiv" style="width:50.5mm;height:42px;font-family:Arial-Narrow;font-size:6.5pt;padding:27px 0px 1mm 1mm;">
							IRS Use Only&#8212;Do not write or staple in this space.
						</div>
					</div>
					<!-- ************************End Page Header *************************** -->
					<!-- Entity Data -->
					<!-- Filing Status -->
					<div class="styIRS1040HeaderCell" style="width:187mm;height:5mm;font-size:7pt;border-right-width:0px;
						border-bottom-width:1px;font-size:6.5pt">
					  <span style="width:186mm">
						<div class="styIRS1040HeaderCell" style="width:17mm;height:4mm;border-right-width:0px;padding-top:1mm;
							border-bottom-width:0px;">
							Filing status: <span style="width:1mm;"/>
						</div>
						<!-- Filing Status Single Indicator -->
						<div class="styIRS1040HeaderCell" style="width:14mm;height:4mm;border-right-width:0px;padding-top:0mm;
							border-bottom-width:0px;font-size:6.5pt">
	 					 <span>
						    <xsl:call-template name="PopulateSpan">
							  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
						    </xsl:call-template>							
							<input type="checkbox" class="styCkbox" alt="Single" style="height:2.5mm;
								width:2.5mm">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
								</xsl:call-template>
							</input>
						 </span>
							<label>
								<xsl:call-template name="PopulateSpan">
								  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>							
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
								</xsl:call-template>
								Single
							</label>
						</div>
						<span style="width:.5mm;"/>
						<!-- Filing Status Married Filing Jointly Indicator -->
						<div class="styIRS1040HeaderCell" style="width:31mm;height:4mm;border-right-width:0px;padding-top:0mm;
							border-bottom-width:0px;font-size:6.5pt">
	 					 <span>
						    <xsl:call-template name="PopulateSpan">
							  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
						    </xsl:call-template>								
							<input type="checkbox" class="styCkbox" alt="Married filing jointly" style="height:2.5mm;
								width:2.5mm">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
								</xsl:call-template>
							</input>
						 </span>							
							<label>
								<xsl:call-template name="PopulateSpan">
								  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>							
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
								</xsl:call-template>
								 Married filing jointly 
							</label>
						</div>
						<span style="width:.5mm;"/>	 
						<!-- Filing Status Married Filing Separately Indicator -->
						<div class="styIRS1040HeaderCell" style="width:35mm;height:4mm;border-right-width:0px;padding-top:0mm;
							border-bottom-width:0px;font-size:6.5pt">
	 					 <span>
						    <xsl:call-template name="PopulateSpan">
							  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
						    </xsl:call-template>							
							<input type="checkbox" class="styCkbox" alt="Married filing separately"
								style="height:2.5mm;
								width:2.5mm">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
									<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
								</xsl:call-template>
							</input>
						 </span>							
							<label>
								<xsl:call-template name="PopulateSpan">
								  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>							
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'3'"/>
									<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
								</xsl:call-template>
								   Married filing separately<br/>
							</label>
						</div>
						<span style="width:.5mm;"/>	
						<!-- Filing Status Head Of Household Indicator -->
						<div class="styIRS1040HeaderCell" style="width:36mm;height:4mm;border-right-width:0px;padding-top:0mm;
						border-bottom-width:0px;font-size:6.5pt">
	 					 <span>
						    <xsl:call-template name="PopulateSpan">
							  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
						    </xsl:call-template>						
						    <input type="checkbox" class="styCkbox" alt="Head of household"
								style="height:2.5mm; width:2.5mm">
							    <xsl:call-template name="PopulateEnumeratedCheckbox">
								    <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
							    	<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
								    <xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
							    </xsl:call-template>
						    </input>
						 </span>						    
							<label>
								<xsl:call-template name="PopulateSpan">
								  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>							
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'4'"/>
									<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
								</xsl:call-template>
						    	   Head of household 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Filing Status - Qualifying HOH Name</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Filing Status - Qualifying HOH SSN</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
								</xsl:call-template>
							</label>
						</div><span style="width:.5mm;"/>
						<!-- Filing Status Qualifying Widow Indicator -->
						<div class="styIRS1040HeaderCell" style="width:46mm;height:4mm;border-right-width:0px;
							padding-top:0mm;border-bottom-width:0px;">
	 					 <span>
						    <xsl:call-template name="PopulateSpan">
							  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
						    </xsl:call-template>							
							<input type="checkbox" class="styCkbox" alt="Qualifying widow(er)"
								style="height:2.5mm;width:2.5mm">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
									<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
								</xsl:call-template>
							</input>
						 </span>								
							<label>
								<xsl:call-template name="PopulateSpan">
								  <xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>							
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'5'"/>
									<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
								</xsl:call-template>
								Qualifying widow(er)
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Filing Status - Spouse's Name</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpouseNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Filing Status - Non-Resident Alien Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Filing Status - Qualifying Person First Name</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonFirstNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Filing Status - Qualifying Person Last Name</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonLastNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Filing Status - Qualifying Person SSN</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonSSN"/>
								</xsl:call-template>
							</label>
						</div>
				      </span>
					</div>
					<!-- End Filing status area -->
						<!-- Line i -->
						<div class="styIRS1040HeaderCell" style="width:67mm;height:6.5mm">
							Your first name and initial<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
							<span style="width:4px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040HeaderCell" style="width:80mm;height:6.5mm">
							Last name <br/>
						</div>
						<div class="styIRS1040HeaderCell" style="width:40mm;border-right-width:0px;height:6.5mm">
							<span class="styBoldText" style="font-family:Arial Bold;font-size:8pt;">Your social security number</span>
							<br/>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!-- Your standard deduction -->
						<div class="styIRS1040HeaderCell" style="width:187mm;height:5mm;font-size:6.5pt;border-right-width:0px;
							border-bottom-width:1px;">
							<div class="styIRS1040HeaderCell" style="width:33mm;height:4mm;border-right-width:0px;padding-top:1.7mm;
								border-bottom-width:0px;">
								Your standard deduction: <span style="width:2mm;"/>
							</div>
							<!-- Someone can claim you as a dependent -->
							<div class="styIRS1040HeaderCell" style="width:56mm;height:4mm;border-right-width:0px;padding-top:.4mm;
								border-bottom-width:0px;">
								<input type="checkbox" class="styCkbox" 
									alt="Someone can claim you as a dependent">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PrimaryClaimAsDependentInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PrimaryClaimAsDependentInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PrimaryClaimAsDependentInd"/>
										<xsl:with-param name="BackupName">IRS1040PrimaryClaimAsDependentInd</xsl:with-param>
									</xsl:call-template>
									Someone can claim you as a dependent
								</label>
							</div>
							<span style="width:2mm;"/>
							<!-- You were born before January 2, 1954 -->
							<div class="styIRS1040HeaderCell" style="width:56mm;height:4mm;border-right-width:0px;padding-top:.4mm;
								border-bottom-width:0px;">
								<input type="checkbox" class="styCkbox"
									alt="You were born before January 2, 1954 ">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
										<xsl:with-param name="BackupName" select="IRS1040Primary65OrOlderInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
										<xsl:with-param name="BackupName">IRS1040Primary65OrOlderInd</xsl:with-param>
									</xsl:call-template>
									 You were born before January 2, 1954 
								</label>
							</div>
							<!-- You are blind -->
							<div class="styIRS1040HeaderCell" style="width:23mm;height:4mm;border-right-width:0px;padding-top:.4mm;
								border-bottom-width:0px;">
								<input type="checkbox" class="styCkbox" alt="You are blind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PrimaryBlindInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
										<xsl:with-param name="BackupName">IRS1040PrimaryBlindInd</xsl:with-param>
									</xsl:call-template>
									 You are blind 
								</label>
							</div>
						</div>
						<!-- End Your standard deduction -->
						<!-- Joint Return -->
						<div class="styIRS1040HeaderCell" style="width:67mm;height:6.5mm">
							If a joint return, spouse's first name and initial<br/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040HeaderCell" style="width:80mm;height:6.5mm">
							Last name <br/>
						</div>
						<div class="styIRS1040HeaderCell" style="width:40mm;border-right-width:0px;height:6.5mm">
							<span class="styBoldText" style="font-family:Arial Bold;font-size:8pt;">Spouse's social security number</span>
							<br/>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!-- Spouse standard deduction -->
						<div class="styIRS1040HeaderCell" style="width:187mm;height:9mm;font-size:6pt;border-right-width:0px;
							border-bottom-width:1px;">
							<div class="styIRS1040HeaderCell" style="width:146mm;height:9mm;font-size:6pt;border-right-width:1px;
								border-bottom-width:1px;padding-left:0mm;">
								<div class="styIRS1040HeaderCell" style="width:30.5mm;height:4mm;font-size:6pt;border-right-width:0px;padding-top:1.7mm;
									border-bottom-width:0px;padding-left:0mm;">
									Spouse standard deduction: 
								</div>
								<!-- Someone can claim your spouse as a dependent -->
								<div class="styIRS1040HeaderCell" style="width:64.5mm;height:4mm;font-size:6pt;border-right-width:0px;padding-top:.4mm;
									border-bottom-width:0px;padding-left:0mm">
									<input type="checkbox" class="styCkbox" 
										alt="Someone can claim your spouse as a dependent" style="height:2.3mm;
											width:2.3mm;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseClaimAsDependentInd"/>
											<xsl:with-param name="BackupName" select="IRS1040SpouseClaimAsDependentInd"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseClaimAsDependentInd"/>
											<xsl:with-param name="BackupName">IRS1040SpouseClaimAsDependentInd</xsl:with-param>
										</xsl:call-template>
										Someone can claim your spouse as a dependent
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Spouse Standard Deduction - Exempt Spouse Name</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Spouse Standard Deduction - Exempt Spouse Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
										</xsl:call-template>
									</label>
								</div>
								<!-- Spouse was born before January 2, 1954 -->
								<div class="styIRS1040HeaderCell" style="width:50mm;height:4mm;font-size:6pt;border-right-width:0px;padding-top:.4mm;
									border-bottom-width:0px;padding-left:0mm">
									<input type="checkbox" class="styCkbox" 
										alt="Spouse was born before January 2, 1954" style="height:2.3mm;
											width:2.3mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
											<xsl:with-param name="BackupName" select="IRS1040Spouse65OrOlderInd"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
											<xsl:with-param name="BackupName">IRS1040Spouse65OrOlderInd</xsl:with-param>
										</xsl:call-template>
										Spouse was born before January 2, 1954 
									</label>
								</div>
								<br/>
								<!-- Spouse is blind -->
								<div class="styIRS1040HeaderCell" style="width:30mm;height:4mm;font-size:6pt;border-right-width:0px;padding-top:.4mm;
									border-bottom-width:0px;padding-left:0mm">
									<input type="checkbox" class="styCkbox" alt="Spouse is blind"
										style="height:2.3mm;width:2.3mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
											<xsl:with-param name="BackupName" select="IRS1040SpouseBlindInd"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
											<xsl:with-param name="BackupName">IRS1040SpouseBlindInd</xsl:with-param>
										</xsl:call-template>
										Spouse is blind
									</label>
								</div>
								<!-- Spouse itemizes on a separate return or you were dual-status alien -->
							   <div class="styIRS1040HeaderCell" style="width:80mm;height:4mm;font-size:6pt;border-right-width:0px;padding-top:.4mm;
									border-bottom-width:0px;padding-left:0mm">
									<input type="checkbox" class="styCkbox"
										alt="Spouse itemizes on a separate return or you were dual-status alien"
										style="height:2.3mm; width:2.3mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
											<xsl:with-param name="BackupName" select="IRS1040MustItemizeInd"/>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
											<xsl:with-param name="BackupName">IRS1040MustItemizeInd</xsl:with-param>
										</xsl:call-template>
										Spouse itemizes on a separate return or you were dual-status alien 
									</label>
								</div>
							</div>
							<!-- Full Year Health Coverage -->
							<div class="styIRS1040HeaderCell" style="width:39mm;font-size:6pt;border-right-width:0px;height:9mm;padding-left:0mm">
								<input type="checkbox" class="styCkbox" alt="Full-year health care coverage"
									style="height:2.5mm; width:2.5mm">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsCoverageInd"/>
										<xsl:with-param name="BackupName" select="IRS1040HealthCareRspnsCoverageInd"/>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsCoverageInd"/>
										<xsl:with-param name="BackupName">IRS1040HealthCareRspnsCoverageInd</xsl:with-param>
									</xsl:call-template>
									   Full-year health care coverage
									<br/><span style="width:15px"/> or exempt (see inst.)
								</label>
							</div>
					</div>
					<!-- End Spouse standard deduction -->
						<!-- Line iii -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS1040HeaderCell" style="width:120mm;height:10mm;">
								Home address (number and street). If you have a P.O. box, see instructions.<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS1040HeaderCell" style="width:27mm;height:10mm;">
								Apt. no.<br/>
								<span style="width:0px;"/>
							</div>
						<div class="styIRS1040HeaderCell" style="width:40mm;height:10mm;float:right;font-family:Arial-Narrow;
						  border-right-width:0px;border-bottom-width:1px;">
							<span style="font-family:Arial;font-weight:bold;padding-left:4px;">Presidential Election Campaign</span>
							<br/>(see inst.)
							<span style="float:right">
								<input type="checkbox" class="styCkbox" alt="You">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFPrimaryInd"/>
									</xsl:call-template>
									<b>You</b>
								</label>
								<span style="width:4px;"/>
								<input type="checkbox" class="styCkbox" alt="Spouse">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFSpousend"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040PECFSpouseInd"/>
									</xsl:call-template>
									<b>Spouse</b>
								</label>
								<span style="width:4px;"/>
							</span>
						  </div>	
						</div>
						<!-- Line iv -->
						<div class="styIRS1040HeaderCell" style="width:147mm;height:7.9mm;border-bottom-width:0px">
							<span style="font-family:Arial;">City, town or post office, state, and ZIP code. If you have a foreign address, attach Schedule 6.</span>
							<br/>
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040HeaderCell" style="width:40mm;height:7.9mm;float:right;font-family:Arial-Narrow;
						  border-right-width:0px;border-bottom-width:0px;">
						  If more than four dependents, <br/>see inst and <img src="{$ImagePath}/1040_Check.gif" alt="Check"/> here
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
										<xsl:with-param name="BackupName">IRS1040NumOfOtherDepdListedInd</xsl:with-param>
									</xsl:call-template>
								</label>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:2px;"/>
								<input type="Checkbox" class="styCkbox" alt="More Dependents Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
										<xsl:with-param name="BackupName">IRS1040NumOfOtherDepdListedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
					<!-- End Entity Data -->
						<!-- Dependents area -->
						<!--<div style="width:187mm; height:auto;border-style:solid; border-color: black; border-width: 0px 0px 1px 0px;
						  display:block;clear:both;">
						</div>-->
						<div class="styStdDiv" style="border-top:1px solid black;overflow:visible;">
						<!--<div style="width:187mm;float:left;clear:none;display:block;height:auto">-->
							<!--<div style="width:187mm;">
								<div style="width:180mm;">
										</div>
									</div>-->
								
									<!-- Table expand/collapse toggle button -->
									<span style="float:right;">
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
											<xsl:with-param name="containerHeight" select="4"/>
											<xsl:with-param name="headerHeight" select="1"/>
											<xsl:with-param name="containerID" select=" 'depdContainerId'  "/>
										</xsl:call-template>
									</span>
								<div style="width:187mm;border-top:0px solid black">
									
									<!-- Dependents table -->
									<!-- Column widths used 
49.4
30.2 c/to 26.2
20.6 c/to 18.6
18.6 c/to 22.6 to 24.6
-->
									<!-- Generated Table (Start) -->
									<div class="sty1040DepdContainer" style="height:33mm;width:187mm;border-top:0px solid black" id="depdContainerId">
										<!-- print logic -->
										<xsl:call-template name="SetInitialState"/>
										<!-- end -->
										<!--<table class="styTable" cellspacing="0">-->
										<table class="styTable" style="display:table;font-size:6pt;border-collapse:collapse;width:187mm;;">	
											<thead class="styTableThead">
												<tr>
													<th class="styTableCellHeader" scope="col" style="width:59.4mm;text-align:left;padding-left:1mm;padding-top:0mm;">
														<span style="font-size:7pt;">Dependents <span style="font-weight:normal">(see instructions):</span>
															<br/>
															<span style="styBoldText">(1)</span>
															<span style="font-weight:normal;padding-top:15px">
																<span style="width:1mm"/>First name
																<span style="width:12mm;"/>Last name
															</span>
														</span>
													</th>
													<th class="styTableCellHeader" scope="col" style="width:35.2mm;border-right-width:1px;vertical-align:top;">
													<!-- uncomment and change table header literals here or use 'cellpad' -->
														<span style="font-weight:normal">
															<b>(2)</b><span style="width:.5mm"/>
														    Social security number
													    </span>														
														<!-- span class="styTableCellPad"></span -->
													</th>
													<th class="styTableCellHeader" scope="col" style="width:30.6mm;border-right-width:1px;vertical-align:top;">
													<!-- uncomment and change table header literals here or use 'cellpad' -->
														<span style="font-weight:normal;">
														    <b>(3)</b><span style="width:.5mm"/>
														   Relationship to you
													    </span>
													    <!-- span class="styTableCellPad"></span -->
													</th>
													<th class="styTableCellHeader" scope="col" style="width:61.6mm;border-right-width:0px;vertical-align:top;">
														<span style="font-weight:normal">
														    <b>(4)</b><img src="{$ImagePath}/1040_Check.gif" alt="Check"/><span style="width:.5mm"/>
														   if qualifies for (see inst.):
														   <br/>
														   <br/>
														   Child tax credit
														   <span style="width:7mm"/>Credit for other dependents
													   </span>
													</th>
												</tr>
											</thead>
											<tbody>
												<xsl:if test="($Print != $Separated) or (count($FormData/DependentDetail) &lt;= 4)">
													<xsl:for-each select="$FormData/DependentDetail">
														<tr>
															<!-- Column 1 -->
															<td class="styTableCell" style="width:59.4mm;height:3mm;
															  border-right-width:1px;">
																	<span style="width:29mm;text-align:left;float:left;clear:none;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="DependentFirstNm"/>
																			<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentFirstName</xsl:with-param>
																		</xsl:call-template>
																	</span>
																	<span style="width:29mm;text-align:left;">
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="DependentLastNm"/>
																			<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentLastName</xsl:with-param>
																		</xsl:call-template>
																	</span>
																<span style="width:4mm;align:left;">
																	<xsl:call-template name="LinkToLeftoverDataTableInline">
																		<xsl:with-param name="Desc">Dependent<xsl:number value="position()"/> 
																		Name Control</xsl:with-param>
																		<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
																	</xsl:call-template>
																</span>
															</td>
														<!-- Column 2 -->
														<td class="styTableCell" style="text-align:center;width:35.2mm;height:3mm;
														  border-right-width:1px;">
															<xsl:choose>
																<xsl:when test="DiedLiteralCd">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="PopulateSSN">
																		<xsl:with-param name="TargetNode" select="DependentSSN"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
														</td>
														<!-- Column 3 -->
														<td class="styTableCell" style="width:30.6mm;height:3mm;text-align:left;
														 border-right-width:1px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
																<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentRelationship</xsl:with-param>
															</xsl:call-template>
														</td>
														<!-- Column 4 -->
														<td class="styTableCell" style="text-align:left;height:3mm;padding-left:10mm;border-right:0px solid black">
															<div style="width:18.8mm;height:5.5mm;border-right:1px solid black">
																<!-- Checkbox -->
																<input type="Checkbox" class="styCkbox" 
																	alt="Eligible For Child Tax Credit Ind">
																	<xsl:call-template name="PopulateCheckbox">
																		<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																		<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
																	</xsl:call-template>
																	<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for CTC Indicator</xsl:attribute>
																</input>
															</div>
															<!-- Checkbox -->
															<div style="width:22.8mm;padding-left:10mm;height:5.5mm">
																<input type="Checkbox" class="styCkbox"
																	alt="Eligible For ODC Ind">
																	<xsl:call-template name="PopulateCheckbox">
																		<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
																		<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
																	</xsl:call-template>
																	<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for ODC Indicator</xsl:attribute>
																</input>
															</div>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<!-- Table Filler Rows -->
											<xsl:if test="count($FormData/DependentDetail) &lt; 1 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:59.4mm;text-align:left;height:4mm;
													  border-right-width:1px;">
														<xsl:call-template name="PopulateAdditionalDataTableMessage">
															<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
														</xsl:call-template>
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:35.2mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:30.6mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="text-align:left;height:3mm;padding-left:10mm;border-right-width:0px;">
														<!-- Checkbox -->
														<div style="width:18.8mm;border-right:1px solid black">
															<input type="Checkbox" class="styCkbox" alt="Dependent 1 Eligible for CTC Indicator">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformation1EligibleForChildTaxCreditInd</xsl:with-param>
																</xsl:call-template>
															</input>
														</div>
														<!-- Checkbox -->
														<div style="width:22.8mm;padding-left:10mm">
															<input type="Checkbox" class="styCkbox" alt="Dependent 1 Eligible for ODC Indicator">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformation1EligibleForODCInd></xsl:with-param>
																</xsl:call-template>
															</input>
														</div>
													</td>	
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentDetail) &lt; 2 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:59.4mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td> 
													<td class="styTableCell" style="width:35.2mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:30.6mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="text-align:left;height:3mm;padding-left:10mm;border-right-width:0px;">
														<!-- Checkbox -->
														<div style="width:18.8mm;border-right:1px solid black">
															<input type="Checkbox" class="styCkbox" alt="Dependent 2 Eligible for CTC Indicator">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformation2EligibleForChildTaxCreditInd</xsl:with-param>
																</xsl:call-template>
															</input>
														</div>
														<!-- Checkbox -->
														<div style="width:22.8mm;padding-left:10mm">
															<input type="Checkbox" class="styCkbox" alt="Dependent 2 Eligible for ODC Indicator">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformation2EligibleForODCInd></xsl:with-param>
																</xsl:call-template>
															</input>
														</div>
													</td>
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentDetail) &lt; 3 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:59.4mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:35.2mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:30.6mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="text-align:left;height:3mm;padding-left:10mm;border-right-width:0px;">
														<!-- Checkbox -->
														<div style="width:18.8mm;border-right:1px solid black">
															<input type="Checkbox" class="styCkbox" alt="Dependent 3 Eligible for CTC Indicator">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformation3EligibleForChildTaxCreditInd</xsl:with-param>
																</xsl:call-template>
															</input>
														</div>
														<!-- Checkbox -->
														<div style="width:22.8mm;padding-left:10mm">
															<input type="Checkbox" class="styCkbox" alt="Dependent 3 Eligible for ODC Indicator">
																<xsl:call-template name="PopulateCheckbox">
																	<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
																	<xsl:with-param name="BackupName">IRS1040DependentInformation3EligibleForODCInd></xsl:with-param>
																</xsl:call-template>
															</input>
														</div>
													</td>	
												</tr>
											</xsl:if>
											<xsl:if test="count($FormData/DependentDetail) &lt; 4 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
												<tr>
													<td class="styTableCell" style="width:59.4mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:35.2mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:30.6mm;height:4mm;border-right-width:1px;">
														<span class="styTableCellPad"/>
													</td>
													<td class="styTableCell" style="width:61.6mm;text-align:left;height:3mm;padding-left:10mm;border-right-width:0px;">
															<!-- Checkbox -->
															<div style="width:18.8mm;border-right:1px solid black">
																<input type="Checkbox" class="styCkbox" alt="Dependent 4 Eligible for CTC Indicator">
																	<xsl:call-template name="PopulateCheckbox">
																		<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																		<xsl:with-param name="BackupName">IRS1040DependentInformation4EligibleForChildTaxCreditInd</xsl:with-param>
																	</xsl:call-template>
																</input>
															</div>
															<!-- Checkbox -->
															<div style="width:22.8mm;padding-left:10mm;">
																<input type="Checkbox" class="styCkbox" alt="Dependent 4 Eligible for ODC Indicator">
																	<xsl:call-template name="PopulateCheckbox">
																		<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
																		<xsl:with-param name="BackupName">IRS1040DependentInformation4EligibleForODCInd></xsl:with-param>
																	</xsl:call-template>
																</input>
															</div>
													</td>	
												</tr>
											</xsl:if>
											<!-- End of filler rows -->
										</tbody>
									</table>
								</div>
							</div>
							<!-- Set Initial Height of Above Table -->
							<!-- xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$FormData/DependentInformations"/>
                <xsl:with-param name="containerHeight" select="4"/>
                <xsl:with-param name="containerID" select=" 'depdContainerId' "/>
              </xsl:call-template -->
							<!-- Generated Table (End) -->
							<!-- End Dependents table -->
							
						</div>
						
					
					<!-- End Exemptions area -->
					
					<!-- signature -->
				<div class="styBB" style="width:187mm;padding-top:0mm;float:none;clear:both;">
					<div style="width:23mm;float:left;clear:none;display:block">
						<div style="width:18mm;float:left;clear:none;">
							<div style="float:left;clear:none;">
								<span class="styMainTitle" style="font-size:11pt;float:left;clear:none;">
								   Sign
								   Here
								</span>
								<br/>
								<br/>
								<br/>
								Joint return?<br/>
								See instructions.<br/>
								Keep a copy<br/>
								for your<br/>
								records.                
							</div>
						</div>
						<div style="padding-top:10.7mm;padding-left:8px;padding-right:0px;float:left;clear:none;width:4mm;">
							<img src="{$ImagePath}/1040_Bullet_SuperLg.gif" alt="Right pointing arrowhead image" height="48" width="10"/>
						</div>
					</div>
					<div style="float:left;clear:none;width:164mm;">
						<div class="" style="width:164mm;font-size:6pt;font-family:Arial-Narrow;float:left;clear:none;">
						  Under penalties of perjury, I declare that I have examined this return and accompanying schedules and statements, and to 
						  the best of my knowledge and belief, they are true, correct, and complete. Declaration of preparer (other than taxpayer) is 
						  based on all information of which preparer has any knowledge.
					</div>
					<div style="width:164mm;float:left;clear:none;"/>
					<div class="styBB" style="width:164mm;float:left;clear:none;">
						<div style="width:71mm;float:left;clear:none;">
							<div class="styFNBox" style="width:71mm;float:left;clear:none;">
							  Your signature
							</div>
							<div class="styFNBox" style="height:8mm;width:71mm;padding-top:1.5mm;float:left;clear:none;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
									<xsl:with-param name="BackupName">$RtnHdrDataPrimarySignature</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styFNBox" style="width:18mm;float:left;clear:none;">
							<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
							  Date
                        </div>
						<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;clear:none;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
								<xsl:with-param name="BackupName">$RtnHdrDataPrimarySignatureDate</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styFNBox" style="width:36mm;float:left;clear:none;">
						<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
						   Your occupation
                        </div>
						<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PrimaryOccupationTxt"/>
								<xsl:with-param name="BackupName">IRS1040PrimaryOccupation</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="" style="width:35mm;float:left;clear:none;">
						<div class="styGenericDiv" style="height:12mm;width:37mm;border-left-width:0px;">
							<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">If the IRS sent you an Identity Protection PIN, 
							  enter it here (see </span>
								<br/>
								<span style="width:20%;padding-left:4px;font-family:Arial-Narrow;float:left;">
									inst.)
								</span>
								<span style="width:80%;padding-top:0px;padding-right:5mm;float:right;text-align:center;padding-top:1.8mm">
									<div class="styLNCtrNumBox" style="float:right;height:4mm;width:23mm;border-top-width:1px;font-weight:normal">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
						</div>
					</div>
					<div class="" style="width:164mm;float:left;clear:none;">
						<div style="width:71mm;float:left;clear:none;">
							<div class="styFNBox" style="width:71mm;float:left;clear:none;">
							   Spouse's signature. If a joint return, <span class="styBoldText"> both</span> must sign.
							</div>
							<div class="styFNBox" style="height:9mm;width:71mm;padding-top:1.5mm;float:left;clear:none;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
									<xsl:with-param name="BackupName">$RtnHdrDataSpouseSignature</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					<div class="styFNBox" style="width:18mm;height:12mm;float:left;clear:none;">
						<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
                          Date
                        </div>
						<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;clear:none;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
								<xsl:with-param name="BackupName">$RtnHdrDataSpouseSignatureDate</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styFNBox" style="width:36mm;height:12mm;float:left;clear:none;">
						<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
						   Spouse's occupation
                        </div>
						<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseOccupationTxt"/>
								<xsl:with-param name="BackupName">IRS1040SpouseOccupation</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styGenericDiv" style="height:11mm;width:37mm;border-left-width:0px;">
						<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">If the IRS sent you an Identity Protection PIN, 
						  enter it here (see </span>
							<br/>
							<span style="width:20%;padding-left:4px;font-family:Arial-Narrow;float:left;">
								inst.)
							</span>
							<span style="width:80%;padding-top:0px;padding-right:5mm;float:right;text-align:center;padding-top:1.8mm">
								<div class="styLNCtrNumBox" style="float:right;height:4mm;width:23mm;border-top-width:1px;font-weight:normal">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
					</div>
				</div>
			</div>
			<!-- paid preparer -->
			<div class="styBB" style="width:187mm;font-size:6pt;float:none;clear:both;height:30mm;">
				<div style="width:22.75mm;padding-top:2mm;float:left;clear:none;">
					<span class="styMainTitle" style="font-size:11pt;">
						Paid
						Preparer
						Use Only
					</span>
				</div>
				<div style="width:135mm;float:left;clear:none;display:block;">
					<div style="width:135mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
						<div class="styFNBox" style="height:8mm;width:41mm;padding-top:0mm;border-right:1 solid black;">
						Preparer's name<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styFNBox" style="height:8mm;width:52mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
							Preparer's signature
						</div>
						<div class="styFNBox" style="height:8mm;width:22mm;padding-top:0mm;padding-left:1mm;border-right:1 solid black;">PTIN
                            <br/>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">STIN</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styFNBox" style="height:8mm;width:20mm;padding-left:1mm;">Firm's EIN
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:135mm;height:8mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 0px 0px;">
						<div class="styFNBox" style="height:8mm;width:93mm;border-right:1 solid black;">
							<span class="styGenericDiv" style="">Firm's name 
							<span style="width:2.2mm;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:4px;"/>
							</span>
							<div class="styGenericDiv" style="padding-right:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styFNBox" style="height:8mm;width:42mm;padding-left:1mm;border-right:1 solid black"> Phone no. 
 							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styFNBox" style="width:164mm;border-top-width:1px;border-right-width:0px;float:left;clear:none;">
						<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
						</div>
						<div class="styGenericDiv" style="padding-right:.5mm;">
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCd</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountryCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
				</div>
				<div class="styLNDesc" style="height:16mm;width:26mm;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
							<xsl:with-param name="BackupName">$FormData/ThirdPartyDesigneeInd</xsl:with-param>
						</xsl:call-template>
						Check if:<br/>
						<input class="styCkbox" type="checkbox" alt="Third Party Designee Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ThirdPartyDesigneeInd"/>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationThirdPartyDesigneeInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:4px;"/>3rd Party Designee
					</label>  
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
							<xsl:with-param name="BackupName"></xsl:with-param>
						</xsl:call-template>
						<br/>
						<input class="styCkbox" type="checkbox" alt="Self Employed Ind">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
								<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:4px;"/>Self-employed
					</label>
				</div>
			</div>
			<!-- END PREPARER SIGNATURE SECTION -->
				<!-- page 1 footer -->
						<div class="pageEnd" style="width:187mm;border-top:1px solid black;clear:both">
							<!--<div style="width:187mm; font-size:6.5pt; border-top:1 solid black; padding-top:0.5mm">-->
								<div style="float:left; font-size:6.5pt;height:2mm;padding-top:.7mm">
									<b>For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</b>
								</div>
								<span style="width:8mm"/>Cat. No. 11320B
								<span style="width:14mm"/>Form <b style="font-size:8.5pt">1040</b> (2018)
							</div>
							<p style="page-break-before: always"/>
						<!-- end page 1 footer -->
					    <!-- page 2 -->
							<div class="styTBB" style="width:187mm;padding-top:.5mm;">
								<span class="" style="float:left;clear:none;">Form 1040 (2018)</span>
								<span style="float:right;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
								</span>
							</div>	
					<!-- Income -->
					<!--<div class="styBB" style="width:187mm;">-->
					<div style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; 
					   border-left-width: 0px; border-right-width: 0px;display:block;clear:both">
						<div style="width:24.5mm;float:left;clear:none;padding-top:8mm;font-size:6.5pt;">
						 Attach Form(s)<br/>
						 W-2. Also attach
						 Form(s) W-2G and 
                        1099-R if tax was 
                         withheld.
                       		<br/>
							<br/>
							<br/>
							<br/>        
							<div style="border-top:1px solid black;border-left:1px solid black;width:24.5mm"><b>Standard<br/>
								Deduction for-</b><br/>
							</div>	
							<div style="border-bottom:1px solid black;border-left:1px solid black;
								border-right:1px solid black;">
								<div style="font-size:12pt;width:1mm;font-weight:bold;float:left;clear:none;
									padding-top:0mm;">
									<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet image"/>
								</div>
								<span style="width:1mm"/>
								<div style="width:21mm;padding-top:2.5mm;font-size:6pt;"> Single or married</div>
								<br/>
								<span style="width:.5mm"/>
								<span style="font-size:6pt">filing separately,</span>
								<br/>
								<span style="width:.5mm"/>
								<span style="font-size:6pt">$12,000</span>
								
								<div style="font-size:12pt;width:1mm;font-weight:bold;float:left;clear:none;
									padding-top:1mm;">
									<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet image"/>
								</div>
								<div style="width:21mm;padding-top:1mm;padding-left:1mm;font-size:6pt;">
									Married filing</div>
								<span style="padding-left:2mm;font-size:6pt">jointly or Qualifying</span><br/>
								<span style="padding-left:2mm;font-size:6pt">widow(er),</span><br/>
								<span style="padding-left:1mm;font-size:6pt">$24,000</span>														
								<div style="font-size:12pt;width:1mm;font-weight:bold;float:left;clear:none;
									padding-top:1mm;">
									<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet image"/>
								</div>
								<div style="width:21mm;padding-top:1mm;padding-left:1mm;font-size:6pt;">
									Head of</div>
								<span style="padding-left:2mm;font-size:6pt">Household,</span><br/>
								<span style="padding-left:1mm;font-size:6pt">$18,000</span>														
								<div style="font-size:12pt;width:1mm;font-weight:bold;float:left;clear:none;
									padding-top:1mm;">
									<img src="{$ImagePath}/1040_Bullet_Round.gif" alt="Round Bullet image"/>
								</div>
								<div style="width:21mm;padding-top:1mm;padding-left:1mm;font-size:6pt;">
									If you checked</div>
								<span style="padding-left:2mm;font-size:6pt">any box under</span><br/>
								<span style="padding-left:2mm;font-size:6pt">Standard</span><br/>
								<span style="padding-left:2mm;font-size:6pt">deduction,</span><br/>
								<span style="padding-left:2mm;font-size:6pt">see instructions.</span>
							</div>
						</div>
						<div style="width:162.5mm;float:left;clear:none;">
							<!-- Line 1 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;">1</div>
								<div style="width:118mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
									   Wages, salaries, tips, etc. Attach Form(s) W-2
									</span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 1 - Wages Not Shown Literal Only Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">1</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
											<xsl:with-param name="BackupName">IRS1040WagesSalariesAndTipsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 1 -->
							<!-- Line 2 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:5mm;padding-top:1mm;">2a</div>
								<div style="width:116.2mm;padding-top:0mm;padding-left:2.3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="width:30.1mm;float:left;clear:none;padding-top:1.2mm">
										Tax-exempt interest
										</span>
										<!-- Form to Form Link -->
										<!-- **** -->
										<span class="styDotLn" style="float:left;clear:none;padding-right:1mm;padding-top:.8mm">.</span>
										<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;padding-top:.8mm">2a</div>
										<div class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;padding-top:.8mm">
											<!-- **** -->
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
												<xsl:with-param name="BackupName">IRS1040TaxExemptInterestAmt</xsl:with-param>
											</xsl:call-template>
										</div>
										<!-- **** -->
										<span style="width:2mm;"/>
										<span class="styBoldText" style="padding-top:1mm">b</span> Taxable interest
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
										</xsl:call-template>
										<span style="width:7px;"/>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;padding-top:.8mm">..</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.8mm;">2b</div>
									<div class="styLNAmountBox" style="padding-top:.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxableInterestAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 2 -->
							<!-- Line 3 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:5mm;padding-top:1mm;">3a</div>
								<div style="width:116.2mm;padding-top:0mm;padding-left:2.3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="width:35.1mm;float:left;clear:none;padding-top:1.2mm">
										Qualified dividends
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 3a - Qualified Form 8814 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
											<xsl:with-param name="Desc">Line 3a - Qualified Form 8814 Amount</xsl:with-param>
										</xsl:call-template>
										<!-- Form to Form Link -->
										<!-- **** -->
										</span>
										<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;padding-top:.8mm">3a</div>
										<div class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;padding-top:.8mm">
										<!-- **** -->
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
												<xsl:with-param name="BackupName">IRS1040QualifiedDividendsAmt</xsl:with-param>
											</xsl:call-template>
										</div>
										<!-- **** -->
										<span style="width:2mm;"/>
										<span class="styBoldText" style="padding-top:1mm">b</span> Ordinary dividends
										<!--Form to Form Link-->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 3b - Ordinary F8814 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 3b - Ordinary F8814 Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
										</xsl:call-template>
										<span style="width:2px;"/>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.8mm;">3b</div>
									<div class="styLNAmountBox" style="padding-top:.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
											<xsl:with-param name="BackupName">IRS1040OrdinaryDividendsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 3 -->
							<!-- Line 4 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:5mm;padding-top:1mm;">4a</div>
								<div style="width:116.2mm;padding-top:0mm;padding-left:2.3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="width:35.1mm;float:left;clear:none;padding-top:1.2mm;font-size:6.5pt">
										IRAs, pensions, and annuities
										</span>
										<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;padding-top:.8mm">4a</div>
										<div class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;padding-top:.8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesAmt"/>
											<xsl:with-param name="BackupName">IRS1040PensionsAnnuitiesAmt</xsl:with-param>
										</xsl:call-template>
									</div>
										<!-- **** -->
										<span style="width:2mm;"/>
										<span class="styBoldText" style="padding-top:1mm">b</span><span style="font-size:6.5pt;padding-left:1mm"> Taxable amount</span>
										<span style="width:1px;"/>
										<!--Form to Form Link-->
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
											<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
										</xsl:call-template>
										<span style="width:1px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
											<xsl:with-param name="Desc">Line 4b - Foreign Employer Pension Cd</xsl:with-param>
										</xsl:call-template>
										<span style="width:1px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
											<xsl:with-param name="Desc">Line 4b - Taxable Foreign Pensions Total Amt</xsl:with-param>
										</xsl:call-template>
										<span style="width:1px;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
											<xsl:with-param name="Desc">Line 4b - Pensions Annuities Literal Cd</xsl:with-param>
										</xsl:call-template>
										<span style="width:1px;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
										</xsl:call-template>
										<span style="width:1px;"/>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.8mm;">4b</div>
									<div class="styLNAmountBox" style="padding-top:.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalTaxablePensionsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 4 -->
							<!-- Line 5a -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:5mm;padding-top:1mm;">5a</div>
								<div style="width:116.2mm;padding-top:0mm;padding-left:2.3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="width:35.1mm;float:left;clear:none;padding-top:1.2mm;font-size:6.5pt">
										Social security benefits
										<!-- Form to Form Link -->
										<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 5a - Social Security Benefits Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
											</xsl:call-template>
										<!-- **** -->
									</span>
									<div class="styLNRightNumBox" style="width:6mm;padding-bottom:0mm;padding-top:.8mm">5a</div>
									<div class="styLNAmountBox" style="border-right-width:1px;padding-bottom:0mm;padding-top:.8mm">
										<!-- **** -->
										<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt"/>
												<xsl:with-param name="BackupName">IRS1040SocSecBnftAmt</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
									</div>
										<!-- **** -->
										<span style="width:2mm;"/>
										<span class="styBoldText" style="padding-top:1mm">b</span> Taxable amount
										<span style="width:2px;"/>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;padding-top:.8mm">..</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.8mm;">5b</div>
									<div class="styLNAmountBox" style="padding-top:.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableSocSecAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxableSocSecAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 5 -->
							<!-- Line 6 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;">6</div>
								<div style="width:118mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;font-size:6pt;">
									<span style="float:left;clear:none;">
									   Total income. Add lines 1 through 5. Add any amount from Schedule 1, line 22
									   <span style="width:4px"/>
									</span>
									<div class="styFixedUnderline" style="height:4mm;width:22.2mm;padding-top:0mm;
									padding-left:0mm;padding-right:0mm;font-size:6pt;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalIncomeAmt"/>
										<xsl:with-param name="BackupName">IRS1040TotalAdditionalIncomeAmt</xsl:with-param>
									</xsl:call-template>
									</div>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">6</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 6 -->
							<!-- Line 7 -->
							<div style="width:162.5mm;height:7mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;height:6.5mm;border-bottom:1px solid black;">7</div>
								<span style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									Adjusted gross income. If you have no adjustments to income, enter the amount from<br/> 
									line 6; otherwise, subtract Schedule 1 line 36, from line 6
									<span style="width:4px"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 7 - Excluded Sect 933 Puerto Rico Income Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
									</xsl:call-template>
									<span style="width:2px;"/>	
									<span class="styUnderlineAmount" style="width:22.2mm;padding-top:0mm;padding-left:0mm;padding-right:2mm;font-size:6pt;
										float:none;text-align:left;border-style:dotted">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
											<xsl:with-param name="BackupName">IRS1040ExcldSect933PuertoRicoIncmAmt</xsl:with-param>
										</xsl:call-template>
									</span>   
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;padding-top:0mm">...</span>
								</span>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm">7</div>
									<div class="styLNAmountBox" style="height:7mm;padding-top:4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040AdjustedGrossIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 7 -->
							<!-- Line 8 -->
							<div style="width:162.5mm;height:5mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;border-bottom:1px solid black;height:5.3mm">8</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;">
									<span class="styBoldText">Standard deduction or itemized deductions</span> (from Schedule A)
										<span style="width:4px"/>
										<!-- Form to Form Link -->
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 8 - Modified Standard Deduction Ind</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
										</xsl:call-template>
								   	<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:5mm;padding-top:1.5mm">8</div>
									<div class="styLNAmountBox" style="height:5mm;padding-top:1.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalItemizedOrStandardDedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 8 -->
							<!-- Line 9 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:2.5mm;">9</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3.5mm;">
									   Qualified business income deduction (see instructions)
									   <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..........</span>
								</div>
								<span style="float:right;padding-right:0px;">
									<div class="styLNRightNumBox" style="">9</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt"/>
											<xsl:with-param name="BackupName">IRS1040QualifiedBusinessIncomeDedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 9 -->
							<!-- Line 10 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;">10</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3.5mm;float:left;clear:none;">
								  Taxable income. Subtract lines 8 and 9 from line 7. If zero or less, enter -0- 
									<span style="width:2px"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 10 - Capital Construction Fund Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
									</xsl:call-template>
									<span style="width:2px"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 10 - Capital Construction Fund Amt</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
									</xsl:call-template>	
									<span class="styUnderlineAmount" style="width:10mm;height:3mm;padding-top:0mm;padding-left:0mm;padding-right:0mm;
										float:right;clear:none;text-align:left;border-style:dotted">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
											<xsl:with-param name="BackupName">IRS1040ScheduleQCd</xsl:with-param>
										</xsl:call-template>
									</span>   
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">10</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxableIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 10 -->
							<!-- Line 11 -->
							<div style="width:162.5mm;height:14mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1.5mm">11</div>
								<div style="width:117mm;padding-top:.3mm;padding-left:3mm;float:left;clear:none;">
									<b>a</b><span style="width:2px"/> Tax (see inst) 
									<span class="styFixedUnderline" style="width:23mm;float:none;padding-top:0mm;padding-left:0mm;
									  border-style:solid;text-align:left;">
									    <xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxAmt</xsl:with-param>
										</xsl:call-template>
									</span>
									<span style="width:7px"/>(check if any from:
									<span style="width:.5mm;"/>
									<span class="styBoldText">1</span>
									<span style="width:.5mm;"/>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox" alt="Form 8814 Ind"
										style="width:3.3mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form8814Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:1px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form8814Ind</xsl:with-param>
										</xsl:call-template>
										Form(s) 8814
										<span style="width:1px;"/>
									</label>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
									</xsl:call-template>
									<span style="width:2px"/>
										<!-- Form to Form Link -->
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 11a (1) - Child Interest and Dividend Tax Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
										</xsl:call-template>
										<br/>
									<span style="width:3mm;"/>
									<span class="styBoldText">2</span>
									<span style="width:.5mm;"/>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox" alt="Form 4972 Ind" 
										style="width:3.3mm" >
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form4972Ind</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
											<xsl:with-param name="BackupName">IRS1040Form4972Ind</xsl:with-param>
										</xsl:call-template>
										Form 4972
									</label>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
									</xsl:call-template>
									<span style="width:3mm"/>
									<span class="styBoldText">3</span>
									<span style="width:1mm;"/>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox" alt="Other Tax Amt Ind"
										style="width:3.3mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
											<xsl:with-param name="BackupName">IRS1040OtherTaxAmtInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<span style="width:1px;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
											<xsl:with-param name="BackupName">IRS1040OtherTaxAmtInd</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
										</xsl:call-template>
										<span style="width:1mm"/>
										<!-- Form to Form Link -->
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 11a (3) - Other Tax Amount Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
										</xsl:call-template>
									</label>
									<span class="styFixedUnderline" style="width:23mm;float:none;padding-top:0mm;padding-left:0mm;
									  border-style:solid;text-align:left;">
									</span> )
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Schedule2AttachedInd"/>
											<xsl:with-param name="BackupName">IRS1040Schedule2AttachedInd</xsl:with-param>
										</xsl:call-template>
										<br/>
										<span style="padding-top:1.5mm;padding-left:.3mm">
											<b>b</b><span style="width:2px"/><b> Add</b> any amount from Schedule 2 and check here
											<span style="width:1.2mm"/>
											<span class="styDotLn" style="float:right;clear:none;padding-right:0mm;">.........</span>
										</span>
											<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</label>
									<span style="width:.5mm"/>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox" alt="Schedule 2 Attached Indicator"
										style="width:3.3mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Schedule2AttachedInd"/>
											<xsl:with-param name="BackupName">IRS1040Schedule2AttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:14.5mm;padding-top:10mm">11</div>
									<div class="styLNAmountBox" style="height:14.5mm;padding-top:10mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalTaxBeforeCrAndOthTaxesAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 11 -->
							<!-- Line 12 -->
							<div style="width:162.5mm;height:9mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1.1mm;padding-top:1.5mm">12</div>
								<div style="width:117mm;padding-top:.3mm;padding-left:3mm;padding-top:1.5mm;float:left;clear:none;">
									<b>a</b><span style="width:2px"/> Child tax credit/credit for other dependents 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CTCODCAmt"/>
									</xsl:call-template>
									<span style="padding-left:1mm;"/>
									<span class="styFixedUnderline" style="width:25mm;float:none;padding-top:0mm;padding-left:0mm;
									  border-style:solid;text-align:left;">
									   <!-- Form to Form Link -->
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CTCODCAmt"/>
											<xsl:with-param name="BackupName">IRS1040CTCODCAmt</xsl:with-param>
										</xsl:call-template>
									</span>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Schedule3AttachedInd"/>
											<xsl:with-param name="BackupName">IRS1040Schedule3AttachedInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:5mm"/>
										<b>b</b><span style="width:1mm"/><b>Add</b> any amount<br/>
										<span style="width:2.7mm"/> from Schedule 3 and check here 
										<span style="width:.5mm"/>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</label>
									<span style="width:.5mm"/>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox" alt="Schedule 3 Attached Indicator"
										style="width:3.3mm">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/Schedule3AttachedInd"/>
											<xsl:with-param name="BackupName">IRS1040Schedule3AttachedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:9.5mm;padding-top:6mm">12</div>
									<div class="styLNAmountBox" style="height:9.5mm;padding-top:6mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalCreditsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 12 -->
							<!-- Line 13 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1.5mm;padding-left:1.1mm">13</div>
								<div style="width:117.8mm;padding-top:1.5mm;padding-left:3.2mm;">
									Subtract line 12 from line 11. If zero or less, enter -0-
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>	
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4.2mm">13</div>
									<div class="styLNAmountBox" style="height:4.2mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
											<xsl:with-param name="BackupName">IRS1040TaxLessCreditsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 13 -->
							<!-- Line 14 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1.1mm">14</div>
								<div style="width:117.8mm;padding-top:1mm;padding-left:3.2mm;">
									Other taxes. Attach Schedule 4 
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 14 - Total Tax Deferred Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredAmountGrp/TotalTaxDeferredAmt"/>
									</xsl:call-template>
									<span style="padding-left:.3mm"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 14 - Expatriation Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredAmountGrp/ExpatriationCd"/>
									</xsl:call-template>
									<span style="padding-left:.3mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
									</xsl:call-template>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...............</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.8mm">14</div>
									<div class="styLNAmountBox" style="padding-top:.8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 14 -->
							<!-- Line 15 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">15</div>
								<div style="width:117.8mm;padding-top:1mm;padding-left:3.2mm;">
									Total tax. Add lines 13 and 14
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.8mm;">15</div>
									<div class="styLNAmountBox" style="padding-top:.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateTaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040AggregateTaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 15 -->
							<!-- Line 16 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">16</div>
								<div style="width:117.8mm;padding-top:1mm;padding-left:3.2mm;">
									Federal income tax withheld from Forms W-2 and 1099
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
									</xsl:call-template>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.5mm;">16</div>
									<div class="styLNAmountBox" style="padding-top:.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040WithholdingTaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 16 -->
							<!-- Line 17 -->
							<div style="width:162.5mm;height:17mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:2.3mm;">17</div>
								<div style="width:117.8mm;padding-left:3mm;padding-top:1mm;float:left;clear:none;">
									Refundable credits:  
									<b>a</b> EIC (see inst.) 
									<div class="styFixedUnderline" style="width:38mm;float:none;padding-top:0mm;
										padding-left:0mm;border-style:solid;text-align:left;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 17a - Prior Year Earned Income Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeCd"/>
										</xsl:call-template>
										<span style="padding-left:.3mm"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 17a - Prior Year Earned Income Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeAmt"/>
										</xsl:call-template>
										<span style="padding-left:.3mm"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 17a - Non Tax Combat Pay Election Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
										</xsl:call-template>
										<span style="padding-left:1mm">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
											</xsl:call-template>
										</span>
										<span style="padding-left:1mm;font-size:6.5pt">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
												<xsl:with-param name="BackupName">IRS1040EarnedIncomeCreditAmt</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<br/>
									<b>b</b> Sch 8812 
									<div class="styFixedUnderline" style="font-size:7pt;width:35mm;float:none;padding-top:0mm;
										padding-left:0mm;border-style:solid;text-align:left;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 17b - Prior Year Earned Income Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeCd"/>
										</xsl:call-template>
										<span style="padding-left:.3mm"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 17b - Prior Year Earned Income Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeAmt"/>
										</xsl:call-template>
										<span style="padding-left:1mm">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
											</xsl:call-template>
										</span>
										<span style="padding-left:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
												<xsl:with-param name="BackupName">IRS1040AdditionalChildTaxCreditAmt</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<span style="width:5px"/>
									<b>c</b> Form 8863
									<div class="styFixedUnderline" style="width:35mm;float:none;padding-top:.3mm;
										padding-left:.3mm;border-style:solid;">
										<span style="padding-left:1mm">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
											</xsl:call-template>
										</span>
										<span style="padding-left:1mm"/>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040RefundableAmerOppCreditAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<br/>
									<b>Add</b> any amount from Schedule 5 <span class="styFixedUnderline" 
										style="width:25mm;float:none;padding-top:.5mm;padding-left:0mm;border-style:solid;">
											<span style="width:4px"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
												<xsl:with-param name="BackupName">IRS1040TotalOtherPayRfdblCrAmt</xsl:with-param>
											</xsl:call-template>
										</span>
									<span style="width:2px"/>   
									<span class="styDotLn" style="float:right;clear:none;padding-top:3mm;padding-right:2mm;">..........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:17mm;padding-top:13mm">17</div>
									<div class="styLNAmountBox" style="height:17mm;padding-top:13mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RefundableCreditsAmt"/>
											<xsl:with-param name="BackupName">IRS1040RefundableCreditsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 17 -->
							<!-- Line 18 -->
							<div style="width:162.5mm;height:5mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1.2mm">18</div>
								<div style="width:117.8mm;padding-top:1.4mm;padding-left:3.2mm;">
									Add lines 16 and 17. These are your total payments
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:5.2mm;padding-top:1.4mm">18</div>
									<div class="styLNAmountBox" style="height:5.2mm;padding-top:1.4mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 18 -->
						</div>
					</div>
				<div class="styBB" style="width:187mm;"/>
				<!-- Refund -->
				<div style="width:187mm;height:21.2mm;float:left;clear:none;display:block;border-top-width:1px">
					<div style="width:21.5mm;float:left;clear:none;">
						<div style="padding-top:0mm;">
							<span class="styMainTitle" style="font-size:11pt;">
							  Refund
							</span>
							<div style="padding-top:5mm;">
							  Direct deposit?<br/>See<br/> instructions.
							</div>
						</div>
					</div>
					<div style="width:165.5mm;height:4mm;float:left;clear:none;">
						<!-- Line 19 -->
						<div style="width:165.5mm;">
							<div class="styLNLeftNumBox" style="padding-left:4.1mm;padding-top:.5mm;">19</div>
							<div style="width:117.3mm;padding-left:2.5mm;float:left;clear:none;padding-top:1mm;font-size:6.5pt">
							   If line 18 is more than line 15, subtract line 15 from line 18. This is the amount you <b>overpaid</b>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="">19</div>
								<div class="styLNAmountBox" style="">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
										<xsl:with-param name="BackupName">IRS1040OverpaidAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--End Line 19 -->
						<!-- Line 20a -->
						<div style="width:165.5mm;height:5mm;">
							<div class="styLNLeftNumBox" style="padding-left:4mm;padding-top:.9mm">20a</div>
							<div style="width:116.3mm;padding-top:0mm;padding-left:2.5mm;float:left;clear:none;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
										<xsl:with-param name="BackupName">IRS1040Form8888Ind</xsl:with-param>
									</xsl:call-template>
									<span class="styAgency" style="font-size:8pt;">
							          Amount of line 19 you want <b>refunded to you. </b> If Form 8888 is attached, check here</span>
								</label>
								<span style="padding-left:1mm">
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="padding-left:0.75mm;float:none;clear:none;">....</span>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:2px;"/>
								<!-- Checkbox -->
								<input type="Checkbox" class="styCkbox" alt="Form 8888 Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
										<xsl:with-param name="BackupName">IRS1040Form8888Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="padding-top:1mm;float:left;clear:none;
								   height:5mm;">20a</div>
								<div class="styLNAmountBox" style="padding-top:1mm;float:left;clear:none;
								   height:5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
										<xsl:with-param name="BackupName">IRS1040RefundAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--End Line 20a -->
						<!-- Line 20b -->
						<div style="width:165.5mm;height:4mm">
							<div class="styLNLeftNumBox" style="width:9.5mm;padding-left:1mm;">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="padding-left:3.9mm;padding-top:.8mm">b</span>
							</div>
							<div style="width:116mm;padding-top:0mm;padding-left:1mm;float:left;clear:none;">
								<span style="width:25mm;float:left;clear:none;padding-top:1.2mm">
								   Routing number
								</span>
								<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
										<xsl:with-param name="BackupName">IRS1040RoutingTransitNumber</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:7px;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:4px;"/>
								<span class="styBoldText">c</span> Type:
							    <span style="width:4px;"/>
								<!-- Checkbox  1=checking, 2 = savings -->
								<input type="checkbox" class="styCkbox" alt="Checking">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
										<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
										<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
									</xsl:call-template>
									Checking
								</label>
								<input type="checkbox" class="styCkbox" alt="Savings">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
										<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
									</xsl:call-template>
									Savings
								</label>
							</div>
							<span style="float:right;">
								<div class="styShadingCell" style="height:25px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
								<div class="styLNAmountBox" style="height:25px;border-bottom-width:0px;border-left-width:1px;"/>
							</span>
						</div>
						<!--End Line 20b -->
						<!-- Line 20d -->
						<div style="width:165.5mm;height:4.3mm;float:left;clear:none">
							<div class="styLNLeftNumBox" style="width:9.5mm;padding-left:1mm;">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:3.9mm;"/>d
							</div>
							<div style="width:116mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
								<span style="width:25mm;float:left;clear:none;">
								   Account number
							   </span>
								<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
										<xsl:with-param name="BackupName">IRS1040DepositorAccountNumber</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<span style="float:right;">
								<div class="styShadingCell" style="height:21px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
								<div class="styLNAmountBox" style="height:21px;border-bottom-width:0px;border-left-width:1px;"/>
							</span>
						</div>
						<!--End Line 20d -->
						<!-- Line 21 -->
						<div style="width:165.5mm;height:4.2mm;float:left;clear:none">
							<div class="styLNLeftNumBox" style="padding-left:4.3mm;border-bottom-width:0mm;">21</div>
							<div style="height:4mm;width:77.3mm;padding-left:2.5mm;border-bottom-width:0mm;float:left;clear:none;">
								<span style="float:left;clear:none;padding-top:.3mm">
									<span class="styAgency" style="font-size:7.8pt;">Amount of line 19 you want<b> applied to your 2019 estimated tax</b>
									</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
									</xsl:call-template>
									<span style="width:1px;padding-left:1mm;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</span>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="border-bottom-width:0mm;">21</div>
								<div class="styLNAmountBox" style="border-bottom-width:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
										<xsl:with-param name="BackupName">IRS1040AppliedToEsTaxAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:8mm;padding-top:1.2mm;border-right-width:0px;"/>
								<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:0px;border-left-width:1px;text-align:left;"/>
							</span>
						</div>
						<!--End Line 21 -->
					</div>
				</div>
					<!-- Owe -->
					<div class="styBB" style="width:187mm;display:block">
						<div style="width:24.5mm;float:left;clear:none;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;">
							<div style="padding-top:0mm;padding-bottom:0mm;">
								<span class="styMainTitle" style="width:16mm;font-size:10pt;height:7mm;">
								 Amount
								 You Owe
								</span>
							</div>
						</div>
						<div style="width:162.5mm;float:left;clear:none;height:4mm;">
						<!-- Line 22 -->
						<div style="width:162.5mm;">
							<div class="styLNLeftNumBox" style="width:4mm;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;padding-left:1.2mm">22</div>
							<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;border-style:solid;border-color:black;
							  border-width:1px 0px 0px 0px;float:left;clear:none;">
								<b>Amount you owe.</b> Subtract line 18 from line 15. 
                                <span class="styAgency" style="font-size:7.5pt;">For details on how to pay, </span>
								  see instructions
                                <img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="padding-top:1mm;bording-width-top:0mm;float:left;clear:none;">22</div>
								<div class="styLNAmountBox" style="padding-top:1mm;bording-width-top:0mm;float:left;clear:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
										<xsl:with-param name="BackupName">IRS1040AmountOwedAmt</xsl:with-param>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--End Line 22 -->
						<!-- Line 23 -->
						<div style="width:162.5mm;height:4mm">
							<div class="styLNLeftNumBox" style="width:4mm;padding-left:1.2mm;">23</div>
							<div style="width:77.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
							   Estimated tax penalty (see instructions) 
								<span class="styDotLn" style="padding-left:2mm;float:none;clear:none;">....</span>
								<span style="width:1px;padding-left:.5mm;"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">23</div>
								<div class="styLNAmountBox" style="border-bottom-width:0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
										<xsl:with-param name="BackupName">IRS1040EsPenaltyAmt</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4mm;width:40mm;padding-top:1mm;float:left;clear:none;"/>
							</span>
						</div>
						<!--End Line 23 -->
					</div>
				</div>
				<div class="styBB" style="width:187mm;border-bottom-width:1px solid black"/>
				<!-- Form 1040 page 2 footer -->
				<div class="pageEnd" style="width:187mm;border-top:1px solid black;clear:both">
					<div style="float:left; font-size:7pt;height:2mm;padding-top:.7mm">
						Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1040" title="Link to IRS.gov"><i>www.irs.gov/Form1040</i></a>  for instructions and the latest information.
						<span style="width:69mm"/>Form <b style="font-size:8.5pt">1040</b> (2018)
					</div>
					<br/>
				</div>
				<p style="page-break-before: always"/>
				<!-- end Form 1040 page 2 footer -->
				<!--  Begin Header section Schedule 1 1040 -->
				<div class="styTBB" style="width:187mm;height:17.3mm;border-bottom-width:1px">
						<div class="styFNBox" style="width:29mm;height:17.3mm;">
							<div style="height:10mm;font-size:12px;font-weight:bold;">
								SCHEDULE 1<br/>
								(Form 1040)<br/>
							</div>
							<div style="height:4mm;padding-top:.5mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:129mm;height:17.5mm;">
							<div class="styMainTitle" style="height:7mm;padding-top:1.5mm;">
								Additional Income and Adjustments to Income
							</div>
							<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 2.5mm; font-size: 6.5pt;">	
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								    Attach to Form 1040. 																
							</div>
							<div class="styFST" style="width: 126mm; height: 5mm; padding-top: .5mm; font-size: 6.5pt;">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								    Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1040" title="Link to IRS.gov"><i>www.irs.gov/Form1040</i></a> for instructions and the latest information.<br/>
							</div>
						</div>
						<div class="styTYBox" style="width: 29mm; height: 17.5mm;">
							<div class="styOMB" style="height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
								20<span class="styTYColor">18</span>
							</div>
							<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">01</span>
							</div>
						</div>
					</div>
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;border-bottom-width:1px;">
						<div class="styNameBox" style="width:142mm;height:auto;padding-bottom:1mm;font-size:7pt;">
							<div>
								Name(s) shown on Form 1040
							</div><br/>
							<span style="padding-left:5mm;padding-top:2mm;">
								<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:44mm;height:auto,padding-bottom:1mm;padding-left:0mm;font-size:6.8pt;font-weight:bold;;">
							<div>
								<span style="width:4mm;"/>Your social security number
							</div><br/>
							<span style="padding-left:5mm;padding-top:2mm;font-weight:normal">
							<!--1040 Return Header data populated-->
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
								</xsl:call-template>
							</span>
							</div>
					</div>
					<!-- End Form Number and Name section -->	
					<!-- Additional Income -->
					<div class="styBB" style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; 
					   border-left-width: 0px; border-right-width: 0px;display:block;clear:both;">
						<div style="width:24.5mm;float:left;clear:none;">
							<div style="padding-top:.5mm;padding-bottom:4mm;">
								<span class="styMainTitle" style="font-size:11pt;">Additional <br/>Income</span>
							</div>
						</div>
						<div style="width:162.5mm;float:left;clear:none;">
							<!-- Lines 1-9b -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:7mm;padding-left:0mm;">1-9b</div>
								<div style="width:114mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
									   Reserved
									</span>
									<span class="styDotLn" style="float:right;padding-left:1mm;padding-right:1.5mm;">........................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">1-9b</div>
									<div class="styShadingCell" style="height:4mm;padding-top:.8mm;border-right-width:0px;border-top-width:0px;
									   border-bottom-width:1px"/>
									<!--<div class="styLNAmountBox" style="">
									</div>-->
								</span>
							</div>
							<!--End Line 1-9b -->
							<!-- Line 10 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;">10</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3.5mm;">
								  Taxable refunds, credits, or offsets of state and local income taxes 
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.......</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">10</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/StateLocalIncomeTaxRefundAmt"/>
											<xsl:with-param name="BackupName">IRS1040StateLocalIncomeTaxRefundAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 10 -->
							<!-- Line 11 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;">11</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3.5mm;">
									Alimony received
								    <span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">11</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AlimonyReceivedAmt"/>
											<xsl:with-param name="BackupName">IRS1040AlimonyReceivedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 11 -->
							<!-- Line 12 -->
							<div style="width:162.5mm;height:4mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1.1mm">12</div>
								<div style="width:117.8mm;padding-top:.3mm;padding-left:3.5mm;">
									Business income or (loss). Attach Schedule C or C-EZ
									<div style="padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">12</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
											<xsl:with-param name="BackupName">IRS1040BusinessIncomeLossAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 12 -->
							<!-- Line 13 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1.5mm;padding-left:1.1mm">13</div>
								<div style="width:117.8mm;padding-top:0mm;padding-left:3.2mm;font-size:6.5pt">
									Capital gain or (loss). Attach Schedule D if required.
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Schedule 1 Line 13 - Form F8814 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
											<xsl:with-param name="Desc">Schedule 1 Line 13 - Form F8814 Amount</xsl:with-param>
										</xsl:call-template>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
											<xsl:with-param name="BackupName">IRS1040CapitalDistributionInd</xsl:with-param>
										</xsl:call-template>
										<span style="width:1mm"/>
										<span style="font-size:6.5pt;">
										If not required, check here</span>
										<span style="width:1mm"/>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</label>
									<span style="width:2mm"/>
									<!-- Checkbox -->
									<input type="Checkbox" class="styCkbox" alt="Capital Distribution Ind">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
											<xsl:with-param name="BackupName">IRS1040CapitalDistributionInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4.5mm">13</div>
									<div class="styLNAmountBox" style="height:4.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
											<xsl:with-param name="BackupName">IRS1040CapitalGainLossAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 13 -->
							<!-- Line 14 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1.1mm">14</div>
								<div style="width:117.8mm;padding-top:.7mm;padding-left:3.2mm;">
									Other gains or (losses). Attach Form 4797 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Schedule 1 Line 14 - Form 4684 Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt/@form4684Cd"/>
									</xsl:call-template>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.8mm">14</div>
									<div class="styLNAmountBox" style="padding-top:.8mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 14 -->
							<!-- Line 15ab -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:5mm;padding-top:1mm;">15a</div>
								<div style="width:116.2mm;padding-top:0mm;padding-left:2.3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="width:14mm;float:left;clear:none;padding-top:1.2mm">
										Reserved
										</span>
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;padding-top:.8mm">........................</span>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.8mm;">15b</div>
									<div class="styShadingCell" style="height:4mm;padding-top:.8mm;border-right-width:0px;border-bottom-width:1px"/>
									<!--<div class="styLNAmountBox" style="padding-top:.5mm;"></div>-->
								</span>
							</div>
							<!--End Line 15a -->
							<!-- Line 16ab -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:5mm;padding-top:1mm;">16a</div>
								<div style="width:116.2mm;padding-top:0mm;padding-left:2.3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="width:14mm;font-size:7pt;float:left;clear:none;padding-top:1mm">
									      Reserved
										</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........................</span>
								</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.5mm;">16b</div>
									<div class="styShadingCell" style="height:4mm;padding-top:.8mm;border-right-width:0px;"/>
									<!--<div class="styLNAmountBox" style="padding-top:.5mm;">
									</div>-->
								</span>
							</div>
							<!--End Line 16a -->
							<!-- Line 17 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">17</div>
								<div style="width:117.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="padding-top:1mm;float:left;clear:none;font-size:7pt;padding-left:.2mm">
									   Rental real estate, royalties, partnerships, S corporations, trusts, etc. 
									   Attach Schedule E</span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">17</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
											<xsl:with-param name="BackupName">IRS1040RentalRealESTAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 17 -->
							<!-- Line 18 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:.8mm">18</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
								      Farm income or (loss). Attach Schedule F  
									    <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">18</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 18 -->
							<!-- Line 19 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;">19</div>
								<div style="width:117.8mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="width:40mm;float:left;clear:none;">
								      Unemployment compensation
								    </span>
									<div style="float:left;clear:none;">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Schedule 1 Line 19 - Repayment Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Schedule 1 Line 19 - Repayment Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="">19</div>
									<div class="styLNAmountBox" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt"/>
											<xsl:with-param name="BackupName">IRS1040UnemploymentCompAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 19 -->
							<!-- Line 20a -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:5mm;padding-top:0mm;">20a</div>
								<div style="width:116.2mm;padding-top:0mm;padding-left:2.5mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="width:14mm;float:left;clear:none">
									      Reserved
										</span>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:1.6mm;">........................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.5mm;">20b</div>
									<div class="styShadingCell" style="height:4mm;padding-top:.8mm;border-right-width:0px;"/>
									<!--<div class="styLNAmountBox" style="padding-top:.5mm;">
									</div>-->
								</span>
							</div>
							<!--End Line 20a -->
							<!-- Line 21 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;">21</div>
								<div style="width:117.8mm;padding-top:0mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;padding-top:.6mm">
									  Other income. List type and amount 
									</span>
									<div style="float:left;clear:none;padding-left:1mm">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Schedule 1 Line 21 - Protective Sec108i ELCRecord Indicator</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
										</xsl:call-template>
										<span style="width:4px"/>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</div>
									<span class="styUnderlineAmount" style="width:55mm;padding-top:3mm;padding-left:3mm;
									      border-style:dotted;text-align:left;">
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:.5mm;">21</div>
									<div class="styLNAmountBox" style="padding-top:.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalOtherIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 21 -->
							<!-- Line 22 -->
							<div style="width:162.5mm;height:7mm">
								<div class="styLNLeftNumBox" style="width:4mm;">22</div>
								<div style="width:117.8mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;padding-top:.6mm">
								      Combine the amounts in the far right column. If you don't have any adjustments to<br/> 
										  income, enter here and include on Form 1040, line 6. Otherwise, go to line 23
										 <span style="width:18px;"/>
										<span class="styDotLn" style="float:right;clear:none;padding-right:1.6mm;">..</span>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="border-bottom-width:0px;height:7mm;padding-top:3.5mm">22</div>
									<div class="styLNAmountBox" style="border-bottom-width:0px;height:7mm;padding-top:3.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalIncomeAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalAdditionalIncomeAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
								<!--End Line 22 -->
							</div>
						</div>
					</div>
					<!-- Adjustments to Income -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px"/>
						<div style="width:24.5mm;float:left;clear:both;display:block">
							<div style="padding-top:.5mm;padding-bottom:4mm;">
								<span class="styMainTitle" style="font-size:11pt;">
                     Adjustments
                     to Income
								 </span>
							</div>
						</div>
						<div style="width:162.5mm;float:left;clear:none;display:block">
							<!-- Line 23 -->
							<div style="width:162.5mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;padding-left:1mm;padding-bottom:0mm;">23</div>
								<div style="width:77mm;float:left;clear:none;padding-top:1mm;padding-left:3mm;">
									<span style="float:left;clear:none;">
										Educator expenses
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 23 - Educator Literal Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt/@educatorLiteralCd"/>
										</xsl:call-template>
									</span>
									<span style="width:4px;"/>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">23</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt"/>
											<xsl:with-param name="BackupName">IRS1040EducatorExpensesAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="width:8mm;height:19px;border-right-width:0px;border-left-width:1px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<div>
								<!--End Line 23 -->
								<!-- Line 24 -->
								<div style="width:162.5mm;height:6mm">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">24</div>
									<div style="width:76mm;float:left;clear:none;padding-top:.5mm;padding-left:3mm;">
										<span style="float:left;clear:none;font-size:6pt;">
                           Certain business expenses of reservists, performing artists, and<br/>
                           fee-basis government officials. Attach Form 2106 
										<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
											</xsl:call-template>
											<span style="width:18px;"/>
									   <span class="styDotLn" style="float:right;clear:none;padding-right:1.2mm;">..</span>
										</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:6.2mm;padding-top:2.8mm;">24</div>
										<div class="styLNAmountBox" style="height:6.2mm;padding-top:2.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
												<xsl:with-param name="BackupName">IRS1040BusExpnsReservistsAndOthersAmt</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="styShadingCell" style="height:6.2mm;width:8mm;padding-top:3.8mm;border-left-width:1px;"/>
										<div class="styLNAmountBox" style="height:6.2mm;border-bottom-width:0px;border-left-width:1px;"/>
									</span>
								</div>
							</div>
							<!--End Line 24 -->
							<!-- Line 25 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">25</div>
								<div style="width:77mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
									   Health savings account deduction. 
										<span >Attach Form 8889 </span>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:.8mm;">25</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-left-width:1px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 25 -->
							<!-- Line 26 -->
							<div style="width:162.5mm;height:7mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;">26</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;padding-top:.3.5mm">
									  Moving expenses for members of the armed forces.<br/>Attach Form 3903
									    <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
										</xsl:call-template>
										<span style="width:18px;"/>
										<span class="styDotLn" style="float:right;clear:none;padding-right:1mm;">..........</span>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:3.5mm;height:7mm">26</div>
									<div class="styLNAmountBox" style="padding-top:3.5mm;height:7mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:7mm;width:8mm;padding-top:3.5mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:7mm;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 26 -->
							<!-- Line 27 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:.86mm;">27</div>
								<div style="width:77mm;padding-top:.7mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="font-size:6.5pt;">
										Deductible part of self-employment tax. 
										Attach Schedule SE</span>
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="padding-top:1mm;">27</div>
									<div class="styLNAmountBox" style="padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 27 -->
							<!-- Line 28 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">28</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
								      Self-employed SEP, SIMPLE, and qualified plans
								    </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">..</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">28</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldSepSimpleQlfyPlansAmt"/>
											<xsl:with-param name="BackupName">IRS1040SelfEmpldSepSimpleQlfyPlansAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 28 -->
							<!-- Line 29 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">29</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
								      Self-employed health insurance deduction 
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1mm;">29</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldHealthInsDedAmt"/>
											<xsl:with-param name="BackupName">IRS1040SelfEmpldHealthInsDedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 29 -->
							<!-- Line 30 -->
							<div style="width:162.5mm;height:3mm;">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;">30</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;font-size:7pt">
									   Penalty on early withdrawal of savings
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:17px;padding-top:.5mm;">30</div>
									<div class="styLNAmountBox" style="height:17px;padding-top:.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/PnltyOnErlyWthdrwOfSavingsAmt"/>
											<xsl:with-param name="BackupName">IRS1040PnltyOnErlyWthdrwOfSavingsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:17px;width:8mm;padding-top:1.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:17px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 30 -->
							<!-- Line 31a -->
							<div style="width:162.5mm;height:3.5mm;">
								<div class="styLNLeftNumBox" style="width:5mm;padding-left:1mm;padding-top:1.5mm">31a</div>
								<div style="width:76mm;padding-top:1.4mm;padding-left:2mm;float:left;clear:none;">
									<span style="width:45mm;float:left;clear:none;padding-top:.2mm;font-size:7pt">
									  Alimony paid
										<span style="width:4px;"/>
										<b>b</b> Recipient's SSN
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</span>
									<xsl:if test="count($FormData/AlimonyAmountGrp) &gt;= 1">
										<span class="styUnderlineAmount" style="width:20mm;padding-top:0mm;padding-bottom:0mm;
										text-align:left;height:3mm;">
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 31a - Alimony Paid and SSN</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/RecipientSSN"/>
												</xsl:call-template>
												<span style="width:1mm"/>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 31a - Alimony Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/AlimonyPaidAmt"/>
												</xsl:call-template>
										</span>
									</xsl:if>
								</div>		
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:20px;padding-top:1mm;">31a</div>
									<div class="styLNAmountBox" style="height:20px;padding-top:1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAlimonyPaidAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalAlimonyPaidAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:20px;width:8mm;border-bottom-width:0px;padding-top:1.8mm;
									  border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:20px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 31a -->
							<!-- Line 32 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1.5mm">32</div>
								<div style="width:77mm;float:left;clear:none;padding-top:.5mm;padding-left:3mm;">
									<div style="width:25mm;padding-left:0mm;padding-top:.9mm;float:left;clear:none;">
									  IRA deduction 
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Schedule 1 Line 32 - IRA Deduction Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
										</xsl:call-template>
									</div>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;padding-top:.8mm">...........</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:19px;padding-top:1.3mm;">32</div>
									<div class="styLNAmountBox" style="height:19px;padding-top:1.3mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRADeductionAmt"/>
											<xsl:with-param name="BackupName">IRS1040IRADeductionAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:19px;width:8mm;border-top-width:0px;padding-top:1.8mm;
									  border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:19px;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 32 -->
							<!-- Line 33 -->
							<div style="width:162.5mm;height:4.5mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:.8mm">33</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;padding-top:.3mm">
									  Student loan interest deduction 
								    </span>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;padding-top:.3mm">.......</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4.5mm;padding-top:.8mm;">33</div>
									<div class="styLNAmountBox" style="height:4.5mm;padding-top:.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/StudentLoanInterestDedAmt"/>
											<xsl:with-param name="BackupName">IRS1040StudentLoanInterestDedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4.5mm;width:8mm;padding-top:1mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 33 -->
							<!-- Line 34 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:4mm;padding-left:1.1mm;padding-top:.7mm">34</div>
								<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
									   Tuition and fees. Attach Form 8917
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;clear:none;padding-left:3mm;padding-right:2mm;">.....</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">34</div>
									<div class="styLNAmountBox" style="height:4mm;padding-top:.5mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
											<xsl:with-param name="BackupName">IRS1040TuitionAndFeesDedAmt</xsl:with-param>
										</xsl:call-template>
									</div>
									<div class="styShadingCell" style="height:4mm;width:8mm;padding-top:.8mm;border-right-width:0px;"/>
									<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;border-left-width:1px;"/>
								</span>
							</div>
							<!--End Line 34 -->
							<!-- Line 35 -->
									<div style="width:162.5mm;height:4mm">
										<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:.5mm;">35</div>
										<div style="width:77mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
											<span style="float:left;clear:none;">
												Reserved
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt"/>
												</xsl:call-template>
												<span style="width:2px;"/>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 35 - Domestic Production Activities Literal Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt/@domesticProductionActLitCd"/>
												</xsl:call-template>
											</span>
											<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............</span>
										</div>
										<span style="float:right;">
											<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;">35</div>
											<div class="styShadingCell" style="height:4mm;padding-top:.8mm;border-bottom-width:1px">
											</div>
											<div class="styShadingCell" style="height:4mm;width:8mm;padding-top:.8mm;border-right-width:0px;"/>
											<div class="styLNAmountBox" style="height:4mm;border-bottom-width:0px;border-left-width:1px;"/>
										</span>
									</div>
									<!--End Line 35 -->
									<!-- Line 36 -->
									<div style="width:162.5mm;height:4mm">
										<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm">36</div>
										<div style="width:117.8mm;padding-top:.75mm;padding-left:3mm;float:left;clear:none;">
											<span style="float:left;clear:none;">
											   Add lines 23 through 35
												<!-- Form to Form Link -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
												</xsl:call-template>
												<span style="width:2px"/>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
												</xsl:call-template>
												<span style="width:2px"/>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Schedule 1 Line 36 - Other Adjustments Total Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
												</xsl:call-template>
											</span>
											<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.................</span>
										</div>
										<span style="float:right;">
											<div class="styLNRightNumBox" style="padding-top:1mm;border-bottom-width:0px">36</div>
											<div class="styLNAmountBox" style="padding-top:1mm;border-bottom-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
													<xsl:with-param name="BackupName">IRS1040TotalAdjustmentsAmt</xsl:with-param>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<!--End Line 36 -->
								</div>
								<div class="styBB" style="width:187mm;border-bottom-width:1px solid black"/>
								<!-- Schedule 1 page 3 footer -->
								<div class="pageEnd" style="width:187mm;border-top:1px solid black;clear:both">
									<div style="float:left; font-size:7pt;height:2mm;padding-top:.5mm">
										<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
										<span style="width:8mm;"/>Cat. No. 71479F
									<span style="width:19mm;"/><b>Schedule 1 (Form 1040) 2018</b>
									</div>
									<br/>
								</div>
								<p style="page-break-before: always"/>
								<!-- end Schedule 1 page 3 footer -->
							<!--  Begin Header section Schedule 2 1040 -->
							<div class="styTBB" style="width:187mm;height:17.3mm;border-bottom-width:1px">
								<div class="styFNBox" style="width:29mm;height:17.3mm;">
									<div style="height:10mm;font-size:12px;font-weight:bold;">
									SCHEDULE 2<br/>
									(Form 1040)<br/>
								</div>
								<div style="height:4mm;padding-top:.5mm;">
									<span class="styAgency">Department of the Treasury</span>
									<br/>
									<span class="styAgency">Internal Revenue Service</span>
								</div>
							</div>
							<div class="styFTBox" style="width:129mm;height:17.5mm;">
								<div class="styMainTitle" style="height:7mm;padding-top:1.5mm;">
									Tax
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 2.5mm; font-size: 6.5pt;">	
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Attach to Form 1040. 																
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: .5mm; font-size: 6.5pt;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1040" title="Link to IRS.gov"><i>www.irs.gov/Form1040</i></a> for instructions and the latest information.<br/>
								</div>
							</div>
							<div class="styTYBox" style="width: 29mm; height: 17.5mm;">
								<div class="styOMB" style="height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
									OMB No. 1545-0074
								</div>
								<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
									20<span class="styTYColor">18</span>
								</div>
								<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
									Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">02</span>
								</div>
							</div>
						</div>
						<!-- Begin Names and Identifying number section -->
						<div class="styBB" style="width:187mm;float:none;clear:none;border-bottom-width:0px">
							<div class="styNameBox" style="width:142mm;height:auto;padding-bottom:1mm;font-size:7pt;">
								<div>
									Name(s) shown on Form 1040
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINBox" style="width:44mm;height:auto,padding-bottom:1mm;padding-left:0mm;font-size:6.8pt;font-weight:bold;;">
								<div>
									<span style="width:4mm;"/>Your social security number
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;font-weight:normal">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- End Form Number and Name section -->
						<!-- Tax -->
					<div style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; 
					   border-left-width: 0px; border-right-width: 0px;display:block;clear:both">
						<div style="width:24.5mm;float:left;clear:none;">
							<div style="padding-top:.5mm;padding-bottom:4mm;">
								<span class="styMainTitle" style="font-size:11pt;">Tax</span>
							</div>
						</div>
						<div style="width:162.5mm;float:left;clear:none;">
							<!-- Lines 38-44 -->
							<div style="width:162.5mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:10mm;padding-left:0mm;">38-44</div>
								<div style="width:108mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
									   Reserved
									</span>
									<span class="styDotLn" style="float:right;padding-left:1mm;padding-right:1.5mm;">......................</span>
								</div>
								<span style="float:right;">
									<div class="styLNRightNumBox" style="width:8mm;font-family:Arial-Narrow;">38-44</div>
									<div class="styShadingCell" style="height:4mm;padding-top:.8mm;border-right-width:0px;border-top-width:1px;
									  border-bottom-width:1px"/>
									<!--<div class="styLNAmountBox" style="">
									</div>-->
								</span>
							</div>
							<!--End Line 38-44 -->
							<!-- Line 45 -->
								<div style="width:162.5mm;">
									<div class="styLNLeftNumBox" style="width:10mm;border-color:black;border-style:solid;
									  border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;
									  height:4.5mm;padding-top:1mm;padding-left:4.8mm">45</div>
									<div style="width:108mm;padding-top:.85mm;padding-left:1mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
											Alternative minimum tax. Attach Form 6251 
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;clear:none;padding-left:2mm;padding-right:2mm;">..........</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:4.5mm;">45</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 45 -->
								<!-- Line 46 -->
								<div style="width:162.5mm;">
									<div class="styLNLeftNumBox" style="width:10mm;width:4mm;border-color:black;border-style:solid;
									  border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4.5mm;
									  padding-top:0.85mm;padding-left:4.8mm">46</div>
									<div style="width:113mm;padding-top:.85mm;padding-left:6mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
											Excess advance premium tax credit. Attach Form 8962 
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">........</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:4.5mm;">46</div>
										<div class="styLNAmountBox" style="height:4.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 46 -->
								<!-- Line 47 -->
								<div style="width:162.5mm;">
									<div class="styLNLeftNumBox" style="width:10mm;border-color:black;border-style:solid;border-left-width:0px;
									  border-right-width:0px;border-top-width:0px;border-bottom-width:0px;height:4mm;padding-left:4.8mm">47</div>
									<div style="width:108mm;padding-top:.5mm;padding-left:1mm;float:left;clear:none;height:4mm;font-size:6.5pt">
										<span style="float:left;clear:none;">
										  Add the amounts in the far right column.  Enter here and include on Form 1040, line 11
										</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px">47</div>
										<div class="styLNAmountBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxAmt"/>
												<xsl:with-param name="BackupName">IRS1040AdditionalTaxAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 47 -->
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:1px solid black"/>
					<!-- Schedule 2 page 4 footer -->
					<div class="pageEnd" style="width:187mm;border-top:1px solid black;clear:both">
						<div style="float:left; font-size:7pt;height:2mm;padding-top:.5mm">
							<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
							<span style="width:8mm"/>Cat. No. 71478U
							<span style="width:18mm"/><b>Schedule 2 (Form 1040) 2018</b>
						</div>
						<br/>
					</div>
					<p style="page-break-before: always"/>
					<!-- end Schedule 2 page 4 footer -->
					<!--  Begin Header section Schedule 3 1040 -->
							<div class="styTBB" style="width:187mm;height:17.3mm;border-bottom-width:1px">
								<div class="styFNBox" style="width:29mm;height:17.3mm;">
									<div style="height:10mm;font-size:12px;font-weight:bold;">
									SCHEDULE 3<br/>
									(Form 1040)<br/>
								</div>
								<div style="height:4mm;padding-top:.5mm;">
									<span class="styAgency">Department of the Treasury</span>
									<br/>
									<span class="styAgency">Internal Revenue Service</span>
								</div>
							</div>
							<div class="styFTBox" style="width:129mm;height:17.5mm;">
								<div class="styMainTitle" style="height:7mm;padding-top:1.5mm;">
									Nonrefundable Credits
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 2.5mm; font-size: 6.5pt;">	
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Attach to Form 1040. 																
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: .5mm; font-size: 6.5pt;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1040" title="Link to IRS.gov"><i>www.irs.gov/Form1040</i></a> for instructions and the latest information.<br/>
								</div>
							</div>
							<div class="styTYBox" style="width: 29mm; height: 17.5mm;">
								<div class="styOMB" style="height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
									OMB No. 1545-0074
								</div>
								<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
									20<span class="styTYColor">18</span>
								</div>
								<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
									Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">03</span>
								</div>
							</div>
						</div>
						<!-- Begin Names and Identifying number section -->
						<div class="styBB" style="width:187mm;float:none;clear:none;border-bottom-width:0px">
							<div class="styNameBox" style="width:142mm;height:auto;padding-bottom:1mm;font-size:7pt;">
								<div>
									Name(s) shown on Form 1040
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINBox" style="width:44mm;height:auto,padding-bottom:1mm;padding-left:0mm;font-size:6.8pt;font-weight:bold;;">
								<div>
									<span style="width:4mm;"/>Your social security number
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;font-weight:normal">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- End Form Number and Name section -->
						<!-- Nonrefundable Credits -->
						<div style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; 
						   border-left-width: 0px; border-right-width: 0px;display:block;clear:both">
							<div style="width:28.5mm;float:left;clear:none;">
								<div style="padding-top:.5mm;padding-bottom:4mm;">
									<span class="styMainTitle" style="font-size:11pt;">Nonrefundable Credits</span>
								</div>
							</div>
							<div style="width:158.5mm;float:left;clear:none;">
							<!-- Line 48 -->
								<div style="width:158.5mm;">
									<div class="styLNLeftNumBox" style="width:4mm;padding-top:.8mm;padding-left:1mm;
									  border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;
									  border-bottom-width:0px;height:4.2mm;">48</div>
									<div class="styLNDesc" style="width:114mm;padding-top:.8mm;padding-left:3mm;">
										<span style="float:left;clear:none">
										  Foreign tax credit. Attach Form 1116 if required
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...........</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:20px;padding-top:1mm;">48</div>
										<div class="styLNAmountBox" style="height:20px;padding-top:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 48 -->
								<!-- Line 49 -->
								<div style="width:158.5mm;">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;width:4mm;border-color:black;
									  border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;
									  height:4mm;">49</div>
									<div style="width:114mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
										<span style="float:left;clear:none;font-size:7pt">
										   Credit for child and dependent care expenses. Attach Form 2441
										</span>
										<div style="float:left;clear:none;padding-left:1mm">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/CreditForChildAndDepdCareAmt"/>
											</xsl:call-template>
										</div>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.....</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:19px;padding-top:.5mm;">49</div>
										<div class="styLNAmountBox" style="height:19px;padding-top:.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/CreditForChildAndDepdCareAmt"/>
												<xsl:with-param name="BackupName">IRS1040CrForChildAndDEPDCareAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 49 -->
								<!-- Line 50 -->
								<div style="width:158.5mm;height:4mm">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;width:4mm;border-color:black;
									  border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;
									  height:4.1mm;">50</div>
									<div style="width:114mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
										   Education credits from Form 8863, line 19
										</span>
										<div style="float:left;clear:none;padding-left:1mm">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
											</xsl:call-template>
										</div>
										<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.............</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:20px;padding-top:1mm;">50</div>
										<div class="styLNAmountBox" style="height:20px;padding-top:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/EducationCreditAmt"/>
												<xsl:with-param name="BackupName">IRS1040EducationCreditAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 50 -->
								<!-- Line 51 -->
								<div style="width:158.5mm;height:5mm">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:0.7mm;
									border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;
									border-bottom-width:0px;height:5mm;">51</div>
									<div style="width:114mm;padding-top:.8mm;padding-left:3mm;float:left;clear:none;">
										<span style="float:left;clear:none;font-size:7pt">
										   Retirement savings contributions credit. Attach Form 8880</span>
										<div style="float:left;clear:none;padding-left:1mm">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
											</xsl:call-template>
										</div>
										<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.......</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:5mm;padding-top:1.3mm;">51</div>
										<div class="styLNAmountBox" style="height:5mm;padding-top:1.3mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
												<xsl:with-param name="BackupName">IRS1040RtrSavingsContributionsCrAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 51 -->
								<!-- Line 52 -->
								<div style="width:158.5mm;height:4mm">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1mm;width:4mm;
									   border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;
									   border-bottom-width:0px;height:2.5mm;">52</div>
									<div style="width:114mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
										<span style="float:left;clear:none;font-size:7pt;padding-top:0.6mm;">
										   Reserved
										</span>
										<div style="float:left;clear:none;padding-left:1mm">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/ChildTaxCreditAmt"/>
											</xsl:call-template>
										</div>
										<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.......................</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:4mm;padding-top:.8mm;">52</div>
										<div class="styShadingCell" style="height:4mm;padding-top:.8mm;border-bottom-width:1px"></div>
									</span>
								</div>
								<!--End Line 52 -->
								<!-- Line 53 -->
								<div style="width:158.5mm;height:4mm;">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1.3mm;
									border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;
									border-bottom-width:0px;">53</div>
									<div style="width:114mm;padding-top:1.1mm;padding-left:3mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
											Residential energy credit. Attach Form 5695 
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditAmt"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">............</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:4mm;padding-top:.8mm;">53</div>
										<div class="styLNAmountBox" style="height:4mm;padding-top:.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditAmt"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 53 -->
								<!-- Line 54 -->
								<div style="width:158.5mm;height:5.5mm;">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:2.3mm;width:4mm;
									  border-color:black;border-style:solid;border-left-width:0px;border-right-width:0px;border-top-width:0px;
									  border-bottom-width:0px;height:4mm;">54</div>
									<div style="width:114.5mm;padding-top:1.60mm;padding-left:3mm;font-size:7.5pt;float:left;clear:none;">
										<span style="float:left;clear:none;">
											<span class="styAgency" style="font-size:7.5pt">Other credits from Form</span>
											<span style="width:2mm"/>
											<span class="styBoldText">a</span>
											<span style="width:1mm"/>
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox" alt="Form 3800 Ind"
												style="width:2.4mm;height:2.4mm">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
													<xsl:with-param name="BackupName">IRS1040Form3800Ind</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
													<xsl:with-param name="BackupName">IRS1040Form3800Ind</xsl:with-param>
												</xsl:call-template>
												<span class="styAgency" style="font-size:7.5pt;">3800</span>
											</label>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
											</xsl:call-template>
											<span style="width:2mm"/>
											<span class="styBoldText">b</span>
											<span style="width:1mm"/>
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox" alt="Form 8801 Ind"
												style="width:2.4mm;height:2.4mm">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
													<xsl:with-param name="BackupName">IRS1040TaxAndCredits8801Ind</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
													<xsl:with-param name="BackupName">IRS1040TaxAndCredits8801Ind</xsl:with-param>
												</xsl:call-template>
												<span class="styAgency" style="font-size:7.5pt;">8801</span>
											</label>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
											</xsl:call-template>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
													<xsl:with-param name="BackupName">IRS1040SpecificOtherCreditsInd</xsl:with-param>
												</xsl:call-template>
												<span style="width:2mm"/>
												<b>c</b>
												<span style="width:1mm"/>
											</label>
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox" alt="Specific Other Credits Ind"
												style="width:2.4mm;height:2.4mm">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
													<xsl:with-param name="BackupName">IRS1040SpecificOtherCreditsInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<span class="styFixedUnderline" style="padding-top:0mm;padding-bottom:0mm;float:none;width:42.5mm;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
												</xsl:call-template>
												<span style="width:2mm"/>
												<xsl:if test="count($FormData/SpecificOtherCreditsInd/@*) &gt;= 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement Schedule R</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatementSchRCd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8396</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8834</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8839</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8859</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8910</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8911</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8912</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
													</xsl:call-template>
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8936</xsl:with-param>
														<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
													</xsl:call-template>
												</xsl:if>
											</span>
										</span>
									</div>
									<div class="styLNRightNumBox" style="height:5.5mm;padding-top:2mm;">54</div>
										<div class="styLNAmountBox" style="height:5.5mm;padding-top:2mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
												<xsl:with-param name="BackupName">IRS1040OtherCreditsAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</div>
									<!--End Line 54 -->
									<!-- Line 55 -->
									<div style="width:158.5mm;height:4mm;">
										<div class="styLNLeftNumBox" style="width:4mm;border-color:black;border-style:solid;
										  border-left-width:0px;border-right-width:0px;border-top-width:0px;border-bottom-width:0px;
										  padding-top:1mm">55</div>
										<div style="width:112mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
											<span style="float:left;clear:none;">
											   Add the amounts in the far right column. Enter here and include on Form 1040, line 12
											</span>
										</div>
										<span style="float:right;">
											<div class="styLNRightNumBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px">55</div>
											<div class="styLNAmountBox" style="height:4mm;padding-top:.5mm;border-bottom-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TotalNonrefundableCreditsAmt"/>
													<xsl:with-param name="BackupName">IRS1040TotalNonrefundableCreditsAmt</xsl:with-param>
												</xsl:call-template>
											</div>
										</span>
									</div>
								</div>
								<!--End Line 55 -->	
							</div>
							<div class="styBB" style="width:187mm;border-bottom-width:1px solid black"/>
							<!-- Schedule 3 page 5 footer -->
							<div class="pageEnd" style="width:187mm;border-top:1px solid black;clear:both">
								<div style="float:left; font-size:7pt;height:2mm;padding-top:.5mm">
									<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
									<span style="width:8mm"/>Cat. No. 71480G
									<span style="width:18mm"/><b>Schedule 3 (Form 1040) 2018</b>
								</div>
								<br/>
							</div>
							<p style="page-break-before: always"/>
							<!-- end Schedule 3 page 5 footer -->	
							<!--  Begin Header section Schedule 4 1040 -->
							<div class="styTBB" style="width:187mm;height:17.3mm;border-bottom-width:1px">
								<div class="styFNBox" style="width:29mm;height:17.3mm;">
									<div style="height:10mm;font-size:12px;font-weight:bold;">
									SCHEDULE 4<br/>
									(Form 1040)<br/>
								</div>
								<div style="height:4mm;padding-top:.5mm;">
									<span class="styAgency">Department of the Treasury</span>
									<br/>
									<span class="styAgency">Internal Revenue Service</span>
								</div>
							</div>
							<div class="styFTBox" style="width:129mm;height:17.5mm;">
								<div class="styMainTitle" style="height:7mm;padding-top:1.5mm;">
									Other Taxes
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 2.5mm; font-size: 6.5pt;">	
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Attach to Form 1040. 																
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: .5mm; font-size: 6.5pt;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1040" title="Link to IRS.gov"><i>www.irs.gov/Form1040</i></a> for instructions and the latest information.<br/>
								</div>
							</div>
							<div class="styTYBox" style="width: 29mm; height: 17.5mm;">
								<div class="styOMB" style="height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
									OMB No. 1545-0074
								</div>
								<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
									20<span class="styTYColor">18</span>
								</div>
								<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
									Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">04</span>
								</div>
							</div>
						</div>
						<!-- Begin Names and Identifying number section -->
						<div class="styBB" style="width:187mm;float:none;clear:none;border-bottom-width:0px">
							<div class="styNameBox" style="width:142mm;height:auto;padding-bottom:1mm;font-size:7pt;">
								<div>
									Name(s) shown on Form 1040
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINBox" style="width:44mm;height:auto,padding-bottom:1mm;padding-left:0mm;font-size:6.8pt;font-weight:bold;;">
								<div>
									<span style="width:4mm;"/>Your social security number
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;font-weight:normal">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- End Form Number and Name section -->
						<!-- Other Taxes -->
						<div style="width:187mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; 
						   border-left-width: 0px; border-right-width: 0px;display:block;clear:both">
							<div style="width:28.5mm;float:left;clear:none;">
								<div style="padding-top:.5mm;padding-bottom:4mm;">
									<span class="styMainTitle" style="font-size:11pt;">Other <br/> Taxes</span>
								</div>
							</div>
							<div style="width:158.5mm;float:left;clear:none;">
								<!-- Line 57 -->
								<div style="width:158.5mm;">
									<div class="styLNLeftNumBox" style="width:4mm;">57</div>
									<div style="width:114mm;padding-top:.5mm;padding-left:3mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
										   Self-employment tax. Attach Schedule SE
									    </span>
										<div style="float:left;clear:none; padding-left:2mm">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
											</xsl:call-template>
											<!-- Form to Form Link -->
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Schedule 4 Line 57 -  Exempt SE Tax Literal Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
											</xsl:call-template>
										</div>
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="">57</div>
										<div class="styLNAmountBox" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
												<xsl:with-param name="BackupName">IRS1040SelfEmploymentTaxAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 57 -->
								<!-- Line 58 -->
								<div style="width:158.5mm;height:5mm">
									<div class="styLNLeftNumBox" style="width:4mm;padding-top:1.5mm;">58</div>
									<div style="width:114mm;padding-top:0mm;padding-left:3mm;float:left;clear:none;">
										<span style="font-size:7pt;float:left;clear:none;">
										   Unreported social security and Medicare tax from: Form
											<span style="width:1mm;"/>
											<span class="styBoldText">a</span>
											<span style="width:1mm;"/>
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox" alt="Form 4137 Ind">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
													<xsl:with-param name="BackupName">IRS1040Form4137Ind</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
													<xsl:with-param name="BackupName">IRS1040Form4137Ind</xsl:with-param>
												</xsl:call-template>
												<span class="styAgency" style="font-size:7pt;">4137 </span>
											</label>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
											</xsl:call-template>
											<span style="width:3mm;"/>
											<span class="styBoldText">b</span>
											<span style="width:1mm;"/>
											<!-- Checkbox -->
											<input type="Checkbox" class="styCkbox" alt="Form 8919 Ind">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
													<xsl:with-param name="BackupName">IRS1040Form8919Ind</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:4px;"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
													<xsl:with-param name="BackupName">IRS1040Form8919Ind</xsl:with-param>
												</xsl:call-template>
												<span class="styAgency" style="font-size:7pt;padding-right:1mm;">8919</span>
											</label>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
											</xsl:call-template>
										</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="padding-top:1mm;height:5mm">58</div>
										<div class="styLNAmountBox" style="padding-top:1mm;height:5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/UnrprtdSocSecAndMedcrTaxAmt"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 58 -->
								<!-- Line 59 -->
								<div style="width:158.5mm;height:7mm">
									<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm;">59</div>
									<div style="width:114mm;padding-top:.7mm;padding-left:3mm;float:left;clear:none;">
										<span style="float:left;clear:none;font-size:7pt">
										   Additional tax on IRAs, other qualified retirement plans, and other tax-favored <br/> accounts. Attach Form 5329 if required
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
											</xsl:call-template>
											<span style="width:2px;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Schedule 4 Line 59 - Retirement Tax Plan Literal Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
											</xsl:call-template>
											<span style="width:6px;"/>
											<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.............</span>
										</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="padding-top:3mm;height:7mm">59</div>
										<div class="styLNAmountBox" style="padding-top:3mm;height:7mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
												<xsl:with-param name="BackupName">IRS1040TaxOnIRAsAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 59 -->
								<!-- Line 60a -->
								<div style="width:158.5mm;height:4.5mm">
									<div class="styLNLeftNumBox" style="width:4mm;">60a</div>
									<div style="width:114mm;padding-left:3mm;padding-top:.6mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
											Household employment taxes. Attach Schedule H 
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;clear:none;">..........</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:4.5mm">60a</div>
										<div class="styLNAmountBox" style="height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 60a -->
								<!-- Line 60b -->
								<div style="width:158.5mm;height:7mm">
									<div class="styLNLeftNumBox" style="padding-left:17px;width:4mm;">b</div>
									<div style="width:114mm;padding-left:3mm;padding-top:1px;float:left;clear:none;">
										<span style="float:left;clear:none;">
											Repayment of first-time homebuyer credit from Form 5405. Attach Form 5405 if required 
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
											</xsl:call-template>
										<span class="styDotLn" style="float:right;padding-right:1.7mm;clear:none;">.......................</span>
										</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:7mm;padding-top:3mm">60b</div>
										<div class="styLNAmountBox" style="height:7mm;padding-top:3mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 60b -->
								<!-- Line 61 -->
								<div style="width:158.5mm;height:4mm">
									<div class="styLNLeftNumBox" style="width:4mm;padding-top:1mm">61</div>
									<div style="width:114mm;padding-top:1mm;padding-left:3mm;float:left;clear:none;">
										<span style="float:left;clear:none;">
											Health care: individual responsibility (see instructions)
											<span style="width:10px;"/>
											<!--<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsCoverageInd"/>
													<xsl:with-param name="BackupName">IRS1040HealthCareRspnsCoverageInd</xsl:with-param>
												</xsl:call-template>
												<span class="styAgency" style="font-size:8pt;padding-right:1mm;">Full-year coverage</span>
											</label>-->
											<!-- Checkbox -->
											<!--<input type="Checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsCoverageInd"/>
													<xsl:with-param name="BackupName">IRS1040HealthCareRspnsCoverageInd</xsl:with-param>
												</xsl:call-template>
											</input>-->
										</span>
										<span class="styDotLn" style="float:right;padding-right:1.7mm;clear:none;">.........</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="padding-top:1mm;height:4.5mm">61</div>
										<div class="styLNAmountBox" style="padding-top:1mm;height:4.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsPenaltyAmt"/>
												<xsl:with-param name="BackupName">IRS1040HealthCareRspnsPenaltyAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 61 -->
								<!-- Line 62 -->
								<div style="width:158.5mm;height:8mm">
									<div class="styLNLeftNumBox" style="width:4mm;padding-top:1.5mm">62</div>
									<div style="width:114mm;padding-top:.3mm;padding-left:3mm;float:left;clear:none;font-size:8pt">
										Taxes from: 
										<span style="width:2mm;"/>
										<span class="styBoldText">a</span>
										<span style="width:1mm;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="Form 8959 Ind"
											style="width:2.5mm">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8959Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8959Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;">Form 8959</span>
											<span style="width:2px;"/>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
										</xsl:call-template>
										<span style="width:2mm;"/>
										<span class="styBoldText">b</span>
										<span style="width:1mm;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="Form 8960 Ind"
											style="width:2.5mm" >
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8960Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8960Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8960Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8960Ind</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;padding-right:1mm;">Form 8960</span>
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8960Ind"/>
										</xsl:call-template>
										<br/>
										<span class="styBoldText">c</span>
										<span style="width:1mm;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="Other Tax Cd Ind"
											style="width:2.5mm">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherTaxCdInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherTaxCdInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:2px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherTaxCdInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherTaxCdInd</xsl:with-param>
											</xsl:call-template>
											<span class="styAgency" style="font-size:8pt;padding-right:1mm;">
											  Instructions; enter codes(s)</span>
										</label>
										<span class="styFixedUnderline" style="width:70mm;float:none;padding-top:0mm;padding-left:0mm;
										  border-style:solid;text-align:left;">
										  	<span style="width:3px"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt"/>
											</xsl:call-template>
										</span>
									</div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:10mm;padding-top:5mm">62</div>
										<div class="styLNAmountBox" style="height:10mm;padding-top:5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt"/>
												<xsl:with-param name="BackupName">IRS1040TotalOtherTaxAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 62 -->
								<!-- Line 63 -->
								<div style="width:158.5mm;height:7;mm;padding-top:2mm;padding-bottom:.5mm">
									<div class="styLNLeftNumBox" style="width:4mm;">63</div>
									<div style="width:73mm;float:left;clear:none;padding-left:3mm;">
										<span style="float:left;clear:none;padding-top:.8mm;">
											 Section 965 net tax liability installment from Form <br/>965-A
											 <span style="width:2mm"/>
									   	<span class="styDotLn" style="float:right;clear:none;padding-right:3mm;">..............</span>
										</span>
								    </div>
									<span style="float:right;">
										<div class="styLNRightNumBox" style="height:7mm;border-bottom-width:1px;
												padding-top:3mm;">63</div>
										<div class="styLNAmountBox" style="height:7mm;border-bottom-width:1px;
											padding-top:3mm;">
											<span style="padding-right:1mm">
												<!-- Form to Form Link -->
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/Section965TaxInstallmentAmt"/>
													<xsl:with-param name="BackupName">IRS1040Section965TaxInstallmentAmt</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="height:7mm;width:8mm;padding-top:.8mm;
											border-right-width:0px;padding-top:3mm;"/>
										<div class="styShadingCell" style="height:7mm;padding-top:.8mm;border-bottom-width:1px;
											padding-top:3mm;">
										</div>
									</span>
								</div>
								<!--End Line 63 -->
								<!-- Line 64 -->
								<div style="width:158.5mm;height:7.5mm">
									<div class="styLNLeftNumBox" style="width:4mm;padding-left:1mm;padding-top:1.1mm">64</div>
									<div style="width:114mm;padding-top:.8mm;padding-left:3mm;float:left;clear:none;">
										<div style="padding-left:0mm;">
											<span style="padding-top:.8mm;font-size:6.5pt">
												Add the amounts in the far right column. These are your <b> total other taxes.</b> Enter here and on<br/>
											    Form 1040, line 14
												<div class="styDotLn" style="float:right;padding-right:2mm;clear:none;">.....................</div>
											</span>
										</div>
									</div>
									<span style="float:right;clear:none">
										<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;border-bottom-width:0px;">64</div>
										<div class="styLNAmountBox" style="height:7mm;padding-top:3.5mm;border-bottom-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
												<xsl:with-param name="BackupName">IRS1040TotalTaxAmt</xsl:with-param>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!--End Line 64 -->
							</div>
						</div>
						<!--End Other taxes -->
						<div class="styBB" style="width:187mm;border-bottom-width:1px solid black"/>
						<!-- Schedule 4 page 6 footer -->
						<div class="pageEnd" style="width:187mm;border-top:1px solid black;clear:both">
							<div style="float:left; font-size:7pt;height:2mm;padding-top:.5mm">
								<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
								<span style="width:8mm"/>Cat. No. 71481R
								<span style="width:18mm"/><b>Schedule 4 (Form 1040) 2018</b>
							</div>
							<br/>
						</div>
						<p style="page-break-before: always"/>
						<!-- end Schedule 4 page 6 footer -->	
						<!--  Begin Header section Schedule 5 1040 -->
							<div class="styTBB" style="width:187mm;height:17.3mm;border-bottom-width:1px">
								<div class="styFNBox" style="width:29mm;height:17.3mm;">
									<div style="height:10mm;font-size:12px;font-weight:bold;">
									SCHEDULE 5<br/>
									(Form 1040)<br/>
								</div>
								<div style="height:4mm;padding-top:.5mm;">
									<span class="styAgency">Department of the Treasury</span>
									<br/>
									<span class="styAgency">Internal Revenue Service</span>
								</div>
							</div>
							<div class="styFTBox" style="width:129mm;height:17.5mm;">
								<div class="styMainTitle" style="height:7mm;padding-top:1.5mm;">
									Other Payments and Refundable Credits
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 2.5mm; font-size: 6.5pt;">	
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Attach to Form 1040. 																
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: .5mm; font-size: 6.5pt;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1040" title="Link to IRS.gov"><i>www.irs.gov/Form1040</i></a> for instructions and the latest information.<br/>
								</div>
							</div>
							<div class="styTYBox" style="width: 29mm; height: 17.5mm;">
								<div class="styOMB" style="height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
									OMB No. 1545-0074
								</div>
								<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
									20<span class="styTYColor">18</span>
								</div>
								<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
									Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">05</span>
								</div>
							</div>
						</div>
						<!-- Begin Names and Identifying number section -->
						<div class="styBB" style="width:187mm;float:none;clear:none;border-bottom-width:0px">
							<div class="styNameBox" style="width:142mm;height:auto;padding-bottom:1mm;font-size:7pt;">
								<div>
									Name(s) shown on Form 1040
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINBox" style="width:44mm;height:auto,padding-bottom:1mm;padding-left:0mm;font-size:6.8pt;font-weight:bold">
								<div>
									<span style="width:4mm;"/>Your social security number
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;font-weight:normal">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- End Form Number and Name section -->
						<!-- Other Payments and Refundable Credits -->
						<div style="width:187mm;border-style: solid; border-color: black;border-top-width: 1px; border-bottom-width: 0px; 
						   border-left-width: 0px; border-right-width: 0px;">
							<div style="width:23mm;float:left;clear:none;">
								<div style="padding-top:.5mm;padding-bottom:4mm;height:50mm;">
									<span class="styMainTitle" style="font-size:11pt;">Other <br/> Payments<br/> and <br/> Refundable <br/> Credits</span>
								</div>
							</div>
							<!-- Line 65 -->
							<div style="width:163.8mm;height:4.5mm">
								<div class="styLNLeftNumBox" style="width:10mm;padding-left:1mm;padding-top:1mm;">65</div>
								<div style="width:110mm;padding-top:1mm;padding-left:2mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="font-size:8pt;">
										 Reserved</span>
									</span>
									<span style="width:14px"/>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="padding-top:1mm;height:4.9mm;width:10mm">65</div>
									<div class="styShadingCell" style="padding-top:1mm;height:4.9mm;"></div>
								</span>
							</div>
							<!--End Line 65 -->
							<!-- Line 66 -->
							<div style="width:163.8mm;height:4.5mm;">
								<div class="styLNLeftNumBox" style="width:10mm;padding-left:1mm;border-color:black;border-style:solid;
								  border-width:0px 0px;padding-bottom:4mm">66</div>
								<div style="width:110mm;padding-top:.5mm;padding-left:2mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="font-size:8pt;">2018 estimated tax payments and amount applied from 2017 return</span>
										<span style="width:.3px"/>
									</span>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Schedule 5 Line 66 - Divorced Spouse SSN</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
									</xsl:call-template>
									<span style="padding-left:.3mm"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Schedule 5 Line 66 - Divorced Literal Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
									</xsl:call-template>
									<span style="padding-left:.3mm"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>	
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="padding-top:1mm;height:4.5mm;width:10mm">66</div>
									<div class="styLNAmountBox" style="padding-top:1mm;height:4.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
											<xsl:with-param name="BackupName">IRS1040EstimatedTaxPaymentsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>	
							<!--End Line 66 -->
							<!-- Line 67a -->
							<div style="width:163.8mm;height:4.5mm">
								<div class="styLNLeftNumBox" style="width:10mm;padding-left:1mm;padding-top:1mm;">67a</div>
								<div style="width:110mm;padding-top:1mm;padding-left:2mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="font-size:8pt;">Reserved</span>
									</span>
									<span style="width:14px"/>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="padding-top:1mm;height:4.9mm;width:10mm">67a</div>
									<div class="styShadingCell" style="padding-top:1mm;height:4.9mm;"></div>
								</span>
							</div>
							<!--End Line 67a -->
							<!-- Line 67b -->
							<div style="width:163.8mm;height:4.5mm">
								<div class="styLNLeftNumBox" style="width:10mm;padding-left:1mm;padding-top:1mm;width:10mm">67b</div>
								<div style="width:110mm;padding-top:1mm;padding-left:2mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="font-size:8pt;">Reserved</span>
									</span>
									<span style="width:14px"/>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="padding-top:1mm;height:4.9mm;width:10mm">67b</div>
									<div class="styShadingCell" style="padding-top:1mm;height:4.9mm;"></div>
								</span>
							</div>
							<!--End Line 67a -->
							<!-- Line 68-69 -->
							<div style="width:163.8mm;height:4.5mm">
								<div class="styLNLeftNumBox" style="width:10mm;padding-left:1mm;padding-top:1mm;">68-69</div>
								<div style="width:110mm;padding-top:1mm;padding-left:2mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span style="font-size:8pt;">Reserved</span>
									</span>
									<span style="width:14px"/>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">......................</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="padding-top:1mm;height:4.9mm;width:10mm">68-69</div>
									<div class="styShadingCell" style="padding-top:1mm;height:4.9mm;"></div>
								</span>
							</div>
							<!--End Line 68-69 -->
							<!-- Line 70 -->
							<div style="width:163.8mm;height:4.5mm">
								<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.2mm;padding-top:1mm">70</div>
								<div style="width:110mm;padding-top:1mm;padding-left:2mm;float:left;clear:none;">
                                  Net premium tax credit.  Attach Form 8962 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ReconciledPremiumTaxCreditAmt"/>
									</xsl:call-template>
									<span style="width:14px"/>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm">...........</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="height:4.9mm;width:10mm;padding-top:1.5mm;">70</div>
									<div class="styLNAmountBox" style="height:4.9mm;padding-top:1.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ReconciledPremiumTaxCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040Form8962Amtt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 70 -->
							<!-- Line 71 -->
							<div style="width:163.8mm;height:4.5mm">
								<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.2mm;padding-top:.8mm">71</div>
								<div style="width:110mm;padding-top:1.2mm;padding-left:2mm;float:left;clear:none;">
                                  Amount paid with request for extension to file (see instructions)
                                  <span style="width:14px"/>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm">.....</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="height:4.9mm;padding-top:1.5mm;width:10mm">71</div>
									<div class="styLNAmountBox" style="height:4.9mm;padding-top:1.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt"/>
											<xsl:with-param name="BackupName">IRS1040RequestForExtensionAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 71 -->
							<!-- Line 72 -->
							<div style="width:163.8mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:10mm;padding-top:.6mm;padding-left:1.2mm;">72</div>
								<div style="width:110mm;padding-top:.5mm;padding-left:2mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
										<span class="styAgency" style="font-size:8pt;">Excess social security and tier 1 RRTA tax withheld</span>
									</span>
									<span style="width:14px"/>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">............</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="height:4.9mm;padding-top:1.5mm;width:10mm">72</div>
									<div class="styLNAmountBox" style="height:4.9mm;padding-top:1.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/ExcessSocSecAndTier1RRTATaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040ExcessSocSecAndTier1RRTATaxAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 72 -->
							<!-- Line 73 -->
							<div style="width:163.8mm;height:4mm">
								<div class="styLNLeftNumBox" style="width:10mm;padding-left:1mm;padding-top:1.2mm">73</div>
								<div style="width:110mm;padding-top:1.2mm;padding-left:2mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
									   Credit for federal tax on fuels. Attach Form 4136
									    <xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
										</xsl:call-template>
									</span>
									<span style="width:14px"/>
									<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">.........</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="height:4.9mm;padding-top:1.5mm;width:10mm">73</div>
									<div class="styLNAmountBox" style="height:4.9mm;padding-top:1.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalFuelTaxCreditAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 73 -->
							<!-- Line 74 -->
							<div style="width:163.8mm;height:5mm;">
								<div class="styLNLeftNumBox" style="width:10mm;padding-top:1.2mm;padding-left:1mm;">74</div>
								<div style="width:110mm;padding-top:1mm;padding-left:2mm;float:left;clear:none;font-size:7.5pt;">
									<span style="float:left;clear:none;">
										Credits from Form:	
										<span style="width:1px;"/>									
										<span style="font-weight:bold;font-size:8pt">a</span>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="A Form 2439 Ind"
											style="width:2.4mm;height:2.4mm">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form2439Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form2439Ind</xsl:with-param>
											</xsl:call-template>
											2439
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
										</xsl:call-template>
										<span style="width:2px;"/>
										<span style="font-weight:bold;font-size:8pt">b</span>
										<span style="width:3px;"/>
										<!-- Checkbox -->
										<span class="styShadingCell" alt="Reserved"
											style="width:2.4mm;height:2.4mm;border-right-width:1px;
										  border-left-width:1px;border-top-width:1px;border-bottom-width:1px;float:none">
										  <span style="width:2px;"/>
										</span>
										<label>
											Reserved
										</label>
										<span style="width:1px;"/>
										<span style="font-weight:bold;font-size:8pt">c</span>
										<span style="width:2px;"/>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="C Form 8885 Ind"
											style="width:2.4mm; height:2.4mm">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8885Ind</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
												<xsl:with-param name="BackupName">IRS1040Form8885Ind</xsl:with-param>
											</xsl:call-template>
										</label>
										<label>
											8885
										</label>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
										</xsl:call-template>
										<span style="width:1px;"/>
										<span style="font-weight:bold;font-size:8pt">d</span>
										<!-- Checkbox -->
										<input type="Checkbox" class="styCkbox" alt="D Other Payments Ind"
											style="width:2.4mm;height:2.4mm">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherPaymentsInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:0px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsInd"/>
												<xsl:with-param name="BackupName">IRS1040OtherPaymentsInd</xsl:with-param>
											</xsl:call-template>
											<span class="styFixedUnderline" style="padding-top:0mm;padding-bottom:0mm;
											  float:none;clear:none;width:13mm;">
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 74 - Credit for Repayment Code</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp/CreditForRepaymentCd"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
													<xsl:with-param name="Desc">Line 74 - Credit for Repayment Amount</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp/CreditForRepaymentAmt"/>
												</xsl:call-template>	
											</span>
										</label>
									</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="padding-top:1mm;width:10mm;height:5.2mm">74</div>
									<div class="styLNAmountBox" style="padding-top:1mm;height:5.2mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsAmt"/>
											<xsl:with-param name="BackupName">IRS1040OtherPaymentsAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 74 -->
							<!-- Line 75 -->
							<div style="width:163.8mm;height:6.5mm;float:left;clear:none">
								<div class="styLNLeftNumBox" style="width:10mm;padding-top:.5mm">75</div>
								<div style="width:110mm;padding-top:.5mm;padding-left:2mm;float:left;clear:none;">
									<span style="float:left;clear:none;">
									   Add the amounts in the far right column.  These are your total <b> other payments <br/> and refundable credits.</b>
									   Enter here and on Form 1040, line 17
									  	<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Schedule 5 Line 75 - Form 8689 Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt/@form8689Cd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Schedule 5 Line 75 - Form 8689 Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt/@form8689Amt"/>
										</xsl:call-template>
										<span style="width:14px"/>
										<span class="styDotLn" style="float:right;clear:none;padding-right:2mm;">...</span>
									</span>
								</div>
								<span style="float:right;clear:none">
									<div class="styLNRightNumBox" style="border-bottom-width:0px;padding-top:2.5mm;width:10mm;height:6.2mm">75</div>
									<div class="styLNAmountBox" style="border-bottom-width:0px;padding-top:2.5mm;height:6.2mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
											<xsl:with-param name="BackupName">IRS1040TotalOtherPaymentsRfdblCrAmt</xsl:with-param>
										</xsl:call-template>
									</div>
								</span>
							</div>
							<!--End Line 75 -->
						</div>
						<!--End Other Payments and Refundable Credits -->
						<div class="styBB" style="width:187mm;border-bottom-width:1px solid black; border-top-width:0px"/>
						<!-- Schedule 5 page 7 footer -->
						<div class="pageEnd" style="width:187mm;border-top:1px solid black;clear:both">
							<div style="float:left; font-size:7pt;height:2mm;padding-top:.5mm">
								<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
								<span style="width:8mm"/>Cat. No. 71482C
								<span style="width:18mm"/><b>Schedule 5 (Form 1040) 2018</b>
							</div>
							<br/>
						</div>
						<p style="page-break-before: always"/>
						<!-- end Schedule 5 page 7 footer -->	
						<!--  Begin Header section Schedule 6 1040 -->
						<div class="styTBB" style="width:187mm;height:17.3mm;border-bottom-width:1px;">
							<div class="styFNBox" style="width:29mm;height:17.3mm;">
								<div style="height:10mm;font-size:12px;font-weight:bold;">
									SCHEDULE 6<br/>
									(Form 1040)<br/>
								</div>
								<div style="height:4mm;padding-top:.5mm;">
									<span class="styAgency">Department of the Treasury</span>
									<br/>
									<span class="styAgency">Internal Revenue Service</span>
								</div>
							</div>
							<div class="styFTBox" style="width:129mm;height:17.5mm;">
								<div class="styMainTitle" style="height:7mm;padding-top:1.5mm;font-size:12pt">
									Foreign Address and Third Party Designee
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: 2.5mm; font-size: 6.5pt;">	
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Attach to Form 1040. 																
								</div>
								<div class="styFST" style="width: 126mm; height: 5mm; padding-top: .5mm; font-size: 6.5pt;">
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form1040" title="Link to IRS.gov"><i>www.irs.gov/Form1040</i></a> for instructions and the latest information.<br/>
								</div>
							</div>
							<div class="styTYBox" style="width: 29mm; height: 17.5mm;">
								<div class="styOMB" style="height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
									OMB No. 1545-0074
								</div>
								<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
									20<span class="styTYColor">18</span>
								</div>
								<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
									Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">05A</span>
								</div>
							</div>
						</div>
						<!-- Begin Names and Identifying number section -->
						<div class="styBB" style="width:187mm;float:none;clear:none;border-bottom-width:0px;">
							<div class="styNameBox" style="width:142mm;height:auto;padding-bottom:1mm;font-size:7pt;">
								<div>
									Name(s) shown on Form 1040
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styEINBox" style="width:44mm;height:auto,padding-bottom:1mm;padding-left:0mm;font-size:6.8pt;font-weight:bold">
								<div>
									<span style="width:4mm;"/>Your social security number
								</div><br/>
								<span style="padding-left:5mm;padding-top:2mm;font-weight:normal">
									<!--1040 Return Header data populated-->
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- End Form Number and Name section -->
						<!-- Foreign Address -->
						<div style="width:187mm;padding-top:.5mm;border-style:solid;border-color:black;border-width:1px 0px 0px 0px;
						  float:none;clear:both;height:11mm;">
						  <div class="styFNBox" style="width:22mm;float:left;clear:none;border-right-width:1px solid black; height:11mm">
								<div style="padding-top:1mm;padding-bottom:0mm;">
									<span class="styMainTitle" style="font-size:10pt;">
									  Foreign 
									  Address                
									</span>
								</div>
							</div>
							<div style="float:left;clear:none;width:165mm;height:4mm;padding-top:0mm;">
								<div class="styIRS1040HeaderCell" style="width:67mm;height:10mm;border-bottom:0px;">
									Foreign country name<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										<xsl:with-param name="MainForm">true</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040HeaderCell" style="width:53mm;height:10mm;border-bottom:0px;">
									Foreign province/county<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styIRS1040HeaderCell" style="width:30.8mm;height:10mm;border-bottom:0px;border-right-width:0px;">
									<span style="font-family:arial;">Foreign postal code</span>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!-- End Foreign Address -->
						<!-- 3rd party -->
						<div style="width:187mm;padding-top:.5mm;border-style:solid;border-color:black;border-width:1px 0px 1px 0px;
						  float:none;clear:both;height:11.3mm;display:block;">
							<div class="styFNBox" style="width:22mm;float:left;clear:none;border-right-width:1px solid black; height:10.3mm;">
								<div style="padding-top:1mm;padding-bottom:0mm;">
									<span class="styMainTitle" style="font-size:10pt;">
									  Third Party
									  Designee                
									</span>
								</div>
							</div>
							<div style="float:left;clear:none;width:165mm;height:4mm;padding-top:0mm;">
								<div style="font-size:7pt;float:left;clear:none;padding-left:2mm;">Do you want to allow another person to discuss this 
									return with the IRS (see instructions)?
								</div>
								<div style="float:left;clear:none;padding-left:1mm;">
									<!-- Checkbox -->
								<span>									
								   <xsl:call-template name="PopulateSpan">
									  <xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
								    </xsl:call-template>									
									<input type="Checkbox" class="styCkbox" alt="Yes" style="margin:-.5mm 0mm">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
											<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
									</input>
				                </span>	
									<label>
								       <xsl:call-template name="PopulateSpan">
									      <xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
  								       </xsl:call-template>									
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
											<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText" style="padding-left:1mm;">Yes.</span> 
										  Complete below.
									</label>
								</div>
								<div style="float:left;clear:none;padding-left:1mm;">
									<!-- Checkbox -->
								<span>									
								   <xsl:call-template name="PopulateSpan">
									  <xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
								    </xsl:call-template>									
									<input type="Checkbox" class="styCkbox" alt="No" style="margin:-.5mm 0mm">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
											<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
									</input>
				                </span>									
									<label>
								       <xsl:call-template name="PopulateSpan">
									      <xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
  								       </xsl:call-template>									
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
											<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
										<span class="styBoldText" style="padding-left:1mm;">No</span>
									</label>
								</div>
							</div>
							<div style="height:6mm;float:left;clear:none;width:165mm;padding-top:0mm;">
								<div style="height:6mm;float:left;clear:none;width:18mm;padding-left:2mm;">
								  Designee's
								  name
									<span style="width:18px;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<div style="width:46mm;float:left;clear:none;padding-top:3mm;font-size:6pt">
									<xsl:if test="$FormData/ThirdPartyDesigneeNm">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeNm"/>
											<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneeName</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/Preparer">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Preparer"/>
											<xsl:with-param name="BackupName">IRS1040Preparer</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div style="float:left;clear:none;width:13mm;padding-left:.5mm;">
								  Phone<br/>
								  no.
									<span style="width:18px;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<div style="float:left;clear:none;width:29mm;padding-top:3mm;">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePhoneNum"/>
										<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneePhone</xsl:with-param>
									</xsl:call-template>
								</div>
								<div style="float:left;clear:none;width:35mm;padding-left:.5mm;">
								  Personal identification
								  number (PIN)
									<span style="width:12mm;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								</div>
								<div style="height:5mm;width:24mm;float:left;clear:none;padding-top:2mm;">
									<div class="styLNCtrNumBox" style="float:right;width:23mm;border-top-width:1px;padding-top:.5mm;font-weight:normal">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePIN"/>
											<xsl:with-param name="BackupName">IRS1040ThirdPartyDesigneePIN</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<!-- End Thurd Party Designee-->
						<!-- END PREPARER SIGNATURE SECTION -->
						<!-- Schedule 6 page 8 footer -->
						<div class="pageEnd" style="width:187mm;border-top:1px solid black;clear:both">
							<div style="float:left; font-size:7pt;height:2mm;padding-top:.5mm">
								<b>For Paperwork Reduction Act Notice, see your tax return instructions.</b>
								<span style="width:8mm"/>Cat. No. 71483N
								<span style="width:18mm"/><b>Schedule 6 (Form 1040) 2018</b>
							</div>
							<br/>
						</div>
						<p style="page-break-before: always"/>
						<!-- end Schedule 6 page 8 footer -->	
			<!-- Additonal Data Title Bar and Button -->
			<div class="styLeftOverTitleLine" id="LeftoverData">
				<div class="styLeftOverTitle">
				   Additional Data        
                </div>
			    <div class="styLeftOverButtonContainer">
					<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
				</div>
			</div>
			<!-- Additional Data Table -->
			<table class="styLeftOverTbl">
			<xsl:call-template name="PopulateCommonLeftover">
				<xsl:with-param name="TargetNode" select="$FormData"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Filing Status - Qualifying HOH Name</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHNm"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:if test="$FormData/QualifyingHOHSSN">
					<tr>
						<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Filing Status - Qualifying HOH SSN:</td>
						<td class="styLeftOverTableRowAmount" style="width:87mm;">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
							</xsl:call-template>
						</td>                          
					</tr>
				</xsl:if>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Filing Status - Qualifying Person First Name</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonFirstNm"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Filing Status - Qualifying Person Last Name</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonLastNm"/>
				</xsl:call-template>
				<xsl:if test="$FormData/QualifyingPersonSSN">
					<tr>
						<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Filing Status - Qualifying Person SSN:</td>
						<td class="styLeftOverTableRowAmount" style="width:87mm;">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonSSN"/>
							</xsl:call-template>
						</td>                          
					</tr>
				</xsl:if>
				<xsl:if test="$FormData/SpouseNm">
					<tr>
						<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Filing Status - Spouse's Name:</td>
						<td class="styLeftOverTableRowAmount" style="width:87mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseNm"/>
							</xsl:call-template>
						</td>                          
					</tr>
				</xsl:if>
				<xsl:if test="$FormData/NRALiteralCd">
					<tr>
						<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Filing Status - Non-Resident Alien Literal Code:</td>
						<td class="styLeftOverTableRowAmount" style="width:87mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
							</xsl:call-template>
						</td>                          
					</tr>
				</xsl:if>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Spouse Standard Deduction - Exempt Spouse Name</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Spouse Standard Deduction - Exempt Spouse Name Control</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:if test="($Print != $Separated) or (count($FormData/DependentDetail) &lt;= 4)">
					<xsl:for-each select="$FormData/DependentDetail">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dependent <xsl:number value="position()" format="1"/> Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:if>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 1 - Wages Not Shown Lit Only Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 3a - Qualified Form 8814 Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
					<xsl:with-param name="Desc">Line 3a - Qualified Form 8814 Amount</xsl:with-param>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template><xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 3b - Ordinary Form 8814 Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="Desc">Line 3b - Ordinary Form 8814 Amt</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>	
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 4b - Foreign Employer Pension Cd</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>	
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="Desc">Line 4b - Taxable Foreign Pensions Total Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 4b - Pensions Annuities Literal Cd</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>	
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 5a - Social Security Benefits Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 7 - Excluded Sect 933 Puerto Rico Income Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 8 - Modified Standard Deduction Ind</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 10 - Capital Construction Fund Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="Desc">Line 10 - Capital Construction Fund Amt</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>	
				<!--<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 10 - Schedule Q Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>-->
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="Desc">Line 11a (1) - Child Interest and Dividend Tax Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>	
				<xsl:if test="count($FormData/OtherTaxAmtGrp) = 1">	
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
								<label>
								Line 11a (3) - Other Tax Amount Code:
								</label>
							</td>
							<td class="PopulateLeftoverRow" style="width:87mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
									<xsl:with-param name="BackupName">IRS1040OtherTaxAmtGrp/OtherTaxAmtCd</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
				</xsl:if>
				<xsl:if test="count($FormData/OtherTaxAmtGrp) = 1">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
								<label>
								  Line 11a (3) - Other Tax Amount:
								</label>
							</td>
							<td class="PopulateLeftoverRow" style="width:87mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
									<xsl:with-param name="BackupName">IRS1040OtherTaxAmtGrp/OtherTaxAmt</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
				</xsl:if>				
				<!-- Had to hardcode the table so brackets can be displayed.  There is no predefined template to add items to Populate Leftover Row entries -->
				<xsl:if test="count($FormData/Form8854DeferredAmountGrp) = 1">	
					<tr>
						<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
							<label>
							Line 14 - Total Tax Deferred Amount:
							</label>
						</td>
						<td class="PopulateLeftoverRow" style="width:87mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredAmountGrp/TotalTaxDeferredAmt"/>
								<xsl:with-param name="BackupName">IRS1040Form8854DeferredAmountGrp/TotalTaxDeferredAmt</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="count($FormData/Form8854DeferredAmountGrp) = 1">
					<tr>
						<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
							<label>
							  Line 14 - Expatriation Code:
							</label>
						</td>
						<td class="PopulateLeftoverRow" style="width:87mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredAmountGrp/ExpatriationCd"/>
								<xsl:with-param name="BackupName">IRS1040Form8854DeferredAmountGrp/ExpatriationCd</xsl:with-param>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:if>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 17a - Prior Year Earned Income Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="Desc">Line 17a - Prior Year Earned Income Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeAmt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>		
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="Desc">Line 17a - Non Tax Combat Pay Election Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>		
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 17b - Prior Year Earned Income Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="Desc">Line 17b - Prior Year Earned Income Amount</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeAmt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>				
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Schedule 1 Line 13 - Form F8814 Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="Desc">Schedule 1 Line 13 - Form F8814 Amt</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Schedule 1 Line 14 - Form 4684 Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt/@form4684Cd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Schedule 1 Line 19 - Repayment Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<xsl:call-template name="PopulateLeftoverRowAmount">
					<xsl:with-param name="Desc">Schedule 1 Line 19 - Repayment Amt</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>
				<!--<xsl:call-template name="PopulateLeftoverRow">
					<xsl:with-param name="Desc">Line 21 - Other Income Loss Literal Code</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeLitCd"/>
					<xsl:with-param name="DescWidth" select="100"/>
				</xsl:call-template>-->
				<!-- Had to hardcode the table as a checkbox has to be represented.  There is no predefined template to represent the checkbox -->
					<xsl:if test="$FormData/ProtectiveSec108iELCRecordInd">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:120mm;" scope="row">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
										<xsl:with-param name="BackupName">IRS1040ProtectiveSec108iELCRecordInd</xsl:with-param>
									</xsl:call-template>
								  Schedule 1 Line 21 - Protective Sec108i ELCRecord Indicator:
							   </label>
							</td>
							<td class="PopulateLeftoverRow" style="width:87mm;">
								<input type="checkbox" class="styCkbox" alt="Protective Sec108i ELC Record Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
											<xsl:with-param name="BackupName">IRS1040ProtectiveSec108iELCRecordInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</td>
						</tr>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 1 Line 23 - Educator Expenses Literal Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt/@educatorLiteralCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:if test="count($FormData/AlimonyAmountGrp) = 1">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Schedule 1 Line 31a - Alimony Paid and SSN:</td>
							<td class="styLeftOverTableRowAmount" style="width:87mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/RecipientSSN"/>
								</xsl:call-template>
							</td>                          
						</tr>
					</xsl:if>
					<xsl:if test="count($FormData/AlimonyAmountGrp) = 1">
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule 1 Line 31a - Alimony Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/AlimonyPaidAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</xsl:if> 
					<xsl:call-template name="PopulateLeftoverRow">
					   <xsl:with-param name="Desc">Schedule 1 Line 32 - IRA Deduction Code</xsl:with-param>
					   <xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd" />
					   <xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
<!--					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 35 - Domestic Production Activities Literal Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt/@domesticProductionActLitCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>-->
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Schedule 1 Line 36 - Other Adjustments Total Amt</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement Schedule R</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatementSchRCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8396</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8834</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8839</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8859</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8910</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8911</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8912</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 3 Line 54c - Credit Forms Statement 8936</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 4 Line 57 - Exempt SE Tax Literal Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 4 Line 59 - Retirement Tax Plan Literal Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<!-- Had to hardcode the table as a checkbox has to be represented.  There is no predefined template to represent the checkbox -->
					<!--<xsl:if test="$FormData/TotalOtherTaxAmt/@form8693ApprovedInd">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt/@form8693ApprovedInd"/>
										<xsl:with-param name="BackupName">IRS1040TotalOtherTaxAmtForm8693ApprovedInd</xsl:with-param>
									</xsl:call-template>
								Line 62 - Form 8693 Approved Indicator:
								</label>
							</td>
							<td class="PopulateLeftoverRow" style="width:87mm;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt/@form8693ApprovedInd"/>
										<xsl:with-param name="BackupName">IRS1040TotalOtherTaxAmtForm8693ApprovedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</td>
						</tr>
					</xsl:if>-->


					<xsl:if test="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Schedule 5 Line 66 - Divorced Spouse SSN:</td>
							<td class="styLeftOverTableRowAmount" style="width:87mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
								</xsl:call-template>
							</td>                          
						</tr>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 5 Line 66 - Divorced Literal Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<!--<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 66a - EIC Eligibility Literal Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 66a - Prior Year Earned Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 66a - Prior Year Earned Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 67 - Prior Year Earned Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 67 - Prior Year Earned Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>-->						
					<xsl:if test="count($FormData/CreditRepaymentGrp) = 1">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule 5 Line 74 - Credit for Repayment Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp/CreditForRepaymentCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule 5 Line 74 - Credit for Repayment Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CreditRepaymentGrp/CreditForRepaymentAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Schedule 5 Line 75 - Form 8689 Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt/@form8689Cd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Schedule 5 Line 75 - Form 8689 Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt/@form8689Amt"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<!-- Stuff w/out line references in the XSD -->
					<!--Community Property Return Indicator  -->
					<xsl:if test="$FormData/CommPropStateRtnInd">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
										<xsl:with-param name="BackupName">IRS1040CommPropStateRtnInd</xsl:with-param>
									</xsl:call-template>
									Top Left Margin - Community Property Return Indicator:
							   </label>
							</td>
							<td class="PopulateLeftoverRow" style="width:87mm;">
								<input type="checkbox" class="styCkbox" alt="Comm Prop State Rtn Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
										<xsl:with-param name="BackupName">IRS1040CommPropStateRtnInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</td>
						</tr>
					</xsl:if>
					<!-- Signed by Power Of Attorney Checkbox -->
					<xsl:if test="$FormData/PowerOfAttorneySignedByInd">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
										<xsl:with-param name="BackupName">IRS1040PowerOfAttorneySignedBy</xsl:with-param>
									</xsl:call-template>
									Top Left Margin - Signed by Power Of Attorney Checkbox:
							   </label>
							</td>
							<td class="PopulateLeftoverRow" style="width:87mm;">
								<input type="checkbox" class="styCkbox" alt="Power Of Attorney Signed By Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
										<xsl:with-param name="BackupName">IRS1040PowerOfAttorneySignedBy</xsl:with-param>
									</xsl:call-template>
								</input>
							</td>
						</tr>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Top Left Margin - Spouse Date Of Death</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<!-- Special Processing Literal -->
					<xsl:if test="$FormData/SpecialProcessingLiteralCd">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$FormData/CombatZoneCd">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code 2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Combat Zone Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd/@combatZoneDt"/>
						<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Special Processing Code Text -->
					<xsl:if test="$FormData/SpecialProcessingCodeTxt">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Special Processing Code Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Surviving Spouse Indicator -->
					<xsl:if test="$FormData/SurvivingSpouseInd">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
										<xsl:with-param name="BackupName">IRS1040SurvivingSpouseInd</xsl:with-param>
									</xsl:call-template>
									Top Left Margin - Surviving Spouse Ind:
							    </label>
							</td>
							<td class="PopulateLeftoverRow" style="width:87mm;">
								<input type="checkbox" class="styCkbox" alt="Surviving Spouse Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
										<xsl:with-param name="BackupName">IRS1040SurvivingSpouseInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</td>
						</tr>
					</xsl:if>
					<!-- Personal Representative Indicator -->
					<xsl:if test="$FormData/PersonalRepresentativeInd">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
										<xsl:with-param name="BackupName">IRS1040PersonalRepresentativeInd</xsl:with-param>
									</xsl:call-template>
									Top Left Margin - Personal Representative Ind:
							    </label>
							</td>
							<td class="PopulateLeftoverRow" style="width:87mm;">
								<input type="checkbox" class="styCkbox" alt="Personal Representative Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
										<xsl:with-param name="BackupName">IRS1040PersonalRepresentativeInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</td>
						</tr>
					</xsl:if>
					<!-- Non-Paid Preparer -->
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<!-- Refund Product Code -->
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Top Left Margin - Refund Product Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/RefundProductCd"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Top Left Margin - Refund Product Code Text</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/RefundProductCodeTxt"/>
						<xsl:with-param name="DescWidth" select="100"/>
					</xsl:call-template>
				</table>
				<br/>
				<!-- Column widths used 
49.4
30.2
20.6
18.6
-->
					<!-- Column widths used 
91.5
91.5
-->
				<!-- Begin Separated Repeating data table for Special Condition Description-->
				<xsl:if test="$FormData/SpecialConditionDesc">
					<span class="styRepeatingDataTitle">Top Left Margin - Special Condition Description</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
                          Special Condition Description
                       </th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/SpecialConditionDesc">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellText" style="width:91.5mm;">
										<div style="width:6.5mm;" class="styGenericDiv">
											<div style="width:6mm;font-weight:bold;float:right;clear:none;">
												<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
													<xsl:value-of select="position()"/>
												</span>
											</div>
										</div>
										<div style="width:80mm;float:none;clear:none;">
											<xsl:variable name="pos" select="position()"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="BackupName">IRS1040SpecialConditionDescription</xsl:with-param>
											</xsl:call-template>
										</div>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Separated Repeating data table for Special Condition Description-->
				<br/>
				<!-- Begin Separated Repeating data table for DependentInformations -->
				<xsl:if test="($Print = $Separated) and (count($FormData/DependentDetail) &gt; 4)">
					<span class="styRepeatingDataTitle">Form 1040 - Dependents </span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="text-align:left;width:74.4mm;">
									<span style="font-weight:bold;">Dependents</span> (see instructions):
									<br/>
									<br/>
									<br/>
									<span class="styNormalText" style="font-size:6pt">
								  (1) First name
									<span style="width:52px;"/> 
								  Last name
								  <span style="width:37px;"/> 
								  Name Control
								  </span>
								</th>
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:39.2mm;font-size:6pt">
									<span style="font-weight:bold;">(2)</span>
									<span style="width:4px;"/> 
									<span class="styNormalText">
									   Social security number
								   </span>
								</th>
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:32.6mm;font-size:6pt">
									<span style="font-weight:bold;">(3)</span>
									<span style="width:3px;"/> 
									<span class="styNormalText">
									   Relationship to you
								   </span>
								</th>
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:60.6mm;font-size:6pt">
									<span class="styNormalText" style="text-align:left">
										<span style="font-weight:bold;padding-left:8mm">(4)</span><span style="width:.5mm"/><img src="{$ImagePath}/1040_Check.gif" alt="Check"/><span style="width:.5mm"/>
										    if qualifies for (see inst.):
										<br/>
										<br/>
										   Child tax credit
										<span style="width:3mm"/>Credit for other dependents
									</span>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/DependentDetail">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellText" style="width:74.4mm;">
										<div style="float:left;clear:none;width:5mm;">
											<span style="text-align:right;float:left;width:4.25mm;font-weight:bold;" class="styGenericDiv">
												<xsl:number value="position()" format="1"/>
											</span>
										</div>
										<div style="padding-left:1mm;float:left;clear:none;width:60mm;font-size:6pt">
											<span style="width:22mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DependentFirstNm"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentFirstName</xsl:with-param>
												</xsl:call-template>
											</span>
											<span style="width:5px;"/>
											<span style="width:25mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DependentLastNm"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentLastName</xsl:with-param>
												</xsl:call-template>
											</span>
											<span style="width:5px;"/>
											<span style="width:5mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentNameControl</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
									</td>
									<td class="styTableCellText" style="text-align:center;width:39.2mm;font-size:6pt">
										<xsl:choose>
											<xsl:when test="DiedLiteralCd">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DiedLiteralCd"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="DependentSSN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</td>
									<td class="styTableCellText" style="width:32.6mm;font-size:6pt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
											<xsl:with-param name="BackupName">IRS1040DependentInformationsDependentRelationship</xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="styTableCellText" style="text-align:center;width:60.6mm;font-size:6pt;">
										<!-- Checkbox -->
										<div style="width:18.8mm;padding-left:0mm;height:5.5mm;border-right:1px solid black">
										<input type="Checkbox" class="styCkbox" alt="Eligible For Child Tax Credit Ind">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
												<xsl:with-param name="BackupName">IRS1040DependentInformations<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
												<xsl:with-param name="BackupName">IRS1040DependentInformations<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
											</xsl:call-template>
										</label>
										</div>
										<!-- Checkbox -->
										<div style="width:22.8mm;padding-left:0mm;height:5.5mm">
											<input type="Checkbox" class="styCkbox" alt="Eligible For ODC Ind">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">IRS1040OtherDependentInformations<xsl:number value="position()"/>
														EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">IRS1040OtherDependentInformations<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
											</label>
										</div>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Separated Repeating Dependent data table -->
				<br/>
				<!-- Begin Separated Repeating data table for  IRADistributionsLiteralCd-->
				<xsl:if test="(count($FormData/IRADistributionsLiteralCd) &gt; 1)">
					<span class="styRepeatingDataTitle">Line 4b - IRA Distributions Literal Codes</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
                          IRA Distributions Literal Cd
                       </th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/IRADistributionsLiteralCd">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellText" style="width:91.5mm;">
										<div style="width:6.5mm;" class="styGenericDiv">
											<div style="width:6mm;font-weight:bold;float:right;clear:none;">
												<span class="styBoldText" style="float:right;text-align:right;padding-right:2mm;">
													<xsl:value-of select="position()"/>
												</span>
											</div>
										</div>
										<div style="width:80mm;float:none;clear:none;">
											<xsl:variable name="pos" select="position()"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
												<xsl:with-param name="BackupName">IRS1040IRADistributionsLiteralCd</xsl:with-param>
											</xsl:call-template>
										</div>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Separated Repeating data table for  IRADistributionsLiteralCd-->
				<br/>
				<br/>
				<!-- Begin Separated Repeating data table for OtherTaxAmtGrp -->
				<xsl:if test="(count($FormData/OtherTaxAmtGrp) &gt; 1)">
					<span class="styRepeatingDataTitle">Form 1040 Line 11 - Other Tax Amount Code</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:93.5mm;border-bottom:0mm">
									<span style="font-weight:bold;">(a)</span>
									  Other Tax Amount Code
								</th>
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;height:6mm;border-bottom:0mm">
									<span style="font-weight:bold;">(b)</span>
									   Other Tax Amount
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/OtherTaxAmtGrp">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="width:94mm;float:right;clear:none;text-align:left;height:5.9mm;border-bottom:0mm;;">
										<span style="width:1px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherTaxAmtCd"/>
												<xsl:with-param name="BackupName">IRS1040OtherTaxAmtGrpOtherTaxAmtCd</xsl:with-param>
											</xsl:call-template>
											<span style="width:1px;"/>
									</td>
									<td class="styDepTblCell" style="width:91.5mm;text-align:right;height:6.1mm;border-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherTaxAmt"/>
											<xsl:with-param name="BackupName">IRS1040OtherTaxAmtGrpOtherTaxAmt</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Separated Repeating data table for Form8854DeferredAmountGrp -->

				<br/>
				<br/>
				<!-- Begin Separated Repeating data table for Form8854DeferredAmountGrp -->
				<xsl:if test="(count($FormData/Form8854DeferredAmountGrp) &gt; 1)">
					<span class="styRepeatingDataTitle">Form 1040 Line 14 - Total Tax Deferred Amount</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:93.5mm;border-bottom:0mm">
									<span style="font-weight:bold;">(a)</span>
									  Expatriation Amount
								</th>
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;height:6mm;border-bottom:0mm">
									<span style="font-weight:bold;">(b)</span>
									   Expatriation Code
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/Form8854DeferredAmountGrp">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="width:94mm;float:right;clear:none;text-align:right;height:5.9mm;border-bottom:0mm;;">
										<span>
											<span style="width:1px;"/>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalTaxDeferredAmt"/>
												<xsl:with-param name="BackupName">IRS1040Form8854DeferredAmountGrpTotalTaxDeferredAmt</xsl:with-param>
											</xsl:call-template>
											<span style="width:1px;"/>
										</span>
									</td>
									<td class="styDepTblCell" style="width:91.5mm;text-align:left;height:6.1mm;border-bottom:0mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ExpatriationCd"/>
											<xsl:with-param name="BackupName">IRS1040Form8854DeferredAmountGrpExpatriationCd</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Separated Repeating data table for Form8854DeferredAmountGrp -->
				<br/>
				<br/>
				<!-- Begin Separated Repeating data table for AlimonyAmountGrp -->
				<xsl:if test="(count($FormData/AlimonyAmountGrp) &gt; 1)">
					<span class="styRepeatingDataTitle">Form 1040 Line 31a - Alimony Amount</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:93.5mm;">
									<span style="font-weight:bold;">(a)</span>
									  SSN
								</th>
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;height:6.1mm;border-bottom:0mm">
									<span style="font-weight:bold;">(b)</span>
									   Alimony Paid
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/AlimonyAmountGrp">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="width:94mm;text-align:center;">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="RecipientSSN"/>
											<xsl:with-param name="BackupName">IRS1040AlimonyAmountGrpRecipientsSSN</xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="width:91.5mm;float:right;clear:none;text-align:right;height:6.2mm;
									  border-bottom:0mm">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AlimonyPaidAmt"/>
											<xsl:with-param name="BackupName">IRS1040AlimonyAmountGrpAlimonyPaidAmt</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Separated Repeating data table for AlimonyAmountGrp -->
				<br/>
				<br/>
				<!-- Begin Separated Repeating data table for CreditRepaymentGrp -->
				<xsl:if test="(count($FormData/CreditRepaymentGrp) &gt; 1)">
					<span class="styRepeatingDataTitle">Schedule 5 Line 74d - Credit For Repayment Amount</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:93.5mm;border-bottom:0mm">
									<span style="font-weight:bold;">(a)</span>
									  Credit For Repayment Cd
								</th>
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:91.5mm;height:5.9mm;border-bottom:0mm">
									<span style="font-weight:bold;">(b)</span>
									   Credit For Repayment Amt
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/CreditRepaymentGrp">
								<tr>
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styDepTblCell" style="width:91.5mm;text-align:left;height:6.1mm;padding-top:2mm;border-bottom:0mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="CreditForRepaymentCd"/>
											<xsl:with-param name="BackupName">IRS1040CreditRepaymentGrp/CreditForRepaymentCd</xsl:with-param>
										</xsl:call-template>
									</td>
									<td class="styDepTblCell" style="width:94mm;float:right;clear:none;text-align:right;height:6mm;border-bottom:0mm;;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CreditForRepaymentAmt"/>
											<xsl:with-param name="BackupName">IRS1040CreditRepaymentGrp/CreditForRepaymentAmt</xsl:with-param>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- End Separated Repeating data table for CreditRepaymentGrp -->
				<!-- End Separated Repeating data table -->
			</form>
		</body>
	 </html>
  </xsl:template>
</xsl:stylesheet>
