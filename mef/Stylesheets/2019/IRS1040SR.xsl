<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<!--<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1040SRStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040" />
	<xsl:template match="/">-->
	<!-- For local testing, swap comments above for the line below -->
	<xsl:template name="DisplayIRS1040SR">
		<xsl:param name="FormData" select="$RtnDoc/IRS1040" />
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge" />
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)" />
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="IRS Form 1040" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040SRStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040SR" style="font-size:10pt;font-family:Arial;">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:31.8mm;height:42px;padding-top:4px;">
							<span class="" style="margin-top:3.5mm;margin-left:-1mm;margin-right:-1mm;;transform:rotate(270deg);float:left;font-family:Verdana;font-size:7pt;">Form</span>
							<span class="styFormNumber" style="margin-top:1mm;font-family:Arial Narrow;">1040-SR</span>
						</div>
						<div class="styGenericDiv" style="width:56mm;padding-right:1mm;padding-top:6px;height:42px;">
							<span class="styAgency">Department of the Treasury&#8212;Internal Revenue Service</span>
							<span style="margin-left:1mm;font-size:7pt;">(99)</span><br/>
							<span class="styMainTitle" style="font-family:Arial-Narrow;font-size:12pt">U.S. Tax Return for Seniors</span>
						</div>
						<div class="styTYBox" style="width:18mm;border-right-width:1px;height:42px;padding-top:4px;">
							<span class="styTaxYear">20<span class="styTYColor">19</span></span>
						</div>
						<div class="styOMB" style="width:28mm;height:42px;padding:25px 1mm 1mm 1mm;float:left;
						  border-width:0px 1px 0px 0px;vertical-align:bottom;font-family:Verdana;font-size:7pt;">
							OMB No. 1545-0074
						</div>
						<div class="styGenericDiv" style="width:52.5mm;height:42px;font-family:Arial-Narrow;font-size:6.5pt;padding:15px 0px 1mm 1mm;vertical-align:bottom;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Condition Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Primary Date Of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Spouse Date Of Death</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Processing Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Combat Zone Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Combat Zone Date</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd/@combatZoneDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Processing Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Community Property Return Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Power Of Attorney Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Personal Representative</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Refund Product Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Refund Product Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCodeTxt"/>
							</xsl:call-template>
							&nbsp;<br />
							IRS Use Only&#8212;Do not write or staple in this space.
						</div>
					</div>
					<!-- Filing status section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div style="width:20mm;height:16mm;padding-top:0.5mm;float:left;">
							<strong>Filing Status</strong><br />
							<span style="padding-top:1mm;font-size:7pt;">Check only <br />one box</span>
						</div>
						<div style="width:167mm;min-height:16mm;padding-top:0.5mm;float:left;font-size:8pt;">
							<span style="display:inline;font-family:Arial;font-size:10pt;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
								<div style="width:55mm;height:4mm;">
									<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;margin-bottom:1.5mm;">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[1]</xsl:with-param>
										</xsl:call-template>Single</label>
								</div>
								<div style="height:4mm;width:50mm;">
									<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[2]</xsl:with-param>
										</xsl:call-template>Married filing jointly</label>
								</div>
								<div style="height:4mm;width:60mm;">
									<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[3]</xsl:with-param>
										</xsl:call-template>Married filing separately (MFS)</label>
								</div>
								<br />
								<div style="height:4mm;width:55mm;">
									<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[4]</xsl:with-param>
										</xsl:call-template>Head of Household (HOH)</label>
								</div>
								<div style="height:4mm;width:50mm;">
									<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
										<xsl:call-template name="PopulateEnumeratedCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
											<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
											<xsl:with-param name="BackupName">IRS1040IndividualReturnFilingStatusCd[5]</xsl:with-param>
										</xsl:call-template>Qualifying widow(er) (QW)</label>
								</div>
							</span>
							<br />
							If you checked the MFS box, enter the name of spouse. If you check the HOH or QW box, enter the child's name if the qualifying person is a child but not your dependent. &#9658;
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SpouseNm"/>
							</xsl:call-template>
							<xsl:if test="$FormData/SpouseNm"><span style="width:8px;"/></xsl:if>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
							</xsl:call-template>
							<xsl:if test="$FormData/NRALiteralCd"><span style="width:8px;"/></xsl:if>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHNm"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Filing Status - Qualifying HOH SSN</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
							</xsl:call-template>
							<xsl:if test="$FormData/QualifyingHOHNm or $FormData/QualifyingHOHSSN"><span style="width:8px;"/></xsl:if>
							<xsl:if test="$FormData/QualifyingPersonName">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonFirstNm"/>
								</xsl:call-template>
								<span style="width:4px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonLastNm"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Filing Status - Qualifying Person SSN</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonSSN"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv">
						<div class="styIRS1040SRHeaderCell" style="width:78mm;">
							Your first name and middle initial <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
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
						<div class="styIRS1040SRHeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:46mm;border-right-width:0px;">
							<strong>Your social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040SRHeaderCell" style="width:78mm;">
							If joint return, spouse's first name and middle initial <br /> 
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:46mm;border-right-width:0px;">
							<strong>Spouse's social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040SRHeaderCell" style="width:129mm;height:10.5mm;">
							<span style="font-family:Arial;">Home address (number and street). If you have a P.O. box, see instructions.</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:12mm;height:10.5mm;font-family:Arial;">
							Apt. no. <br /> &nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:45.9mm;height:18mm;border-right-width:0px;float:right;">
							<strong>Presidential Election Campaign</strong><br />
							<span style="font-family:Arial Narrow;font-size:8pt;">Check here if you, or your spouse if filing jointly, want $3 to go to this fund.<br /> Checking a box below will not change your tax or refund.
								<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;">
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
								<span style="width:10px;"/>
								<input type="checkbox" class="styCkboxNM">
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
							</span>
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:141mm;">
							<span style="font-family:Arial Narrow;">City, town, or post office, state, and ZIP code. If you have a foreign address, also complete spaces below (see instructions).</span><br />
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
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040SRHeaderCell" style="width:60mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign country name</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm" select="true()"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:41mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign province/state/county</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:40mm;height:10.5mm;font-family:Arial;">
							<span style="font-family:Arial;">Foreign postal code</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040SRHeaderCell" style="width:45.8mm;height:10.5mm;border-right-width:0px;">
							If <label><xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
								<xsl:with-param name="BackupName">IRS1040MoreDependentsInd</xsl:with-param>
							</xsl:call-template>more than four dependents</label>, see instructions and <img src="{$ImagePath}/1040_Check.gif" alt="Check"/> here &#9658;
							<input type="checkbox" class="styCkboxNM" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
									<xsl:with-param name="BackupName">IRS1040MoreDependentsInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Standard Deduction and Age/Blindness section -->
					<div class="styStdDiv" style="">
						<div style="width:20mm;height:9mm;padding-top:0.5mm;float:left;">
							<strong>Standard Deduction</strong>
						</div>
						<div style="width:167mm;height:9mm;padding-top:0.0mm;float:left;border-bottom:1px solid black;">
							<span style="display:inline;font-family:Arial;">
								<strong>Someone can claim:</strong>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;margin-bottom:0.5mm;margin-top:0.5mm;margin-left:1.5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PrimaryClaimAsDependentInd"/>
										<xsl:with-param name="BackupName">IRS1040PrimaryClaimAsDependentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PrimaryClaimAsDependentInd"/>
										<xsl:with-param name="BackupName">IRS1040PrimaryClaimAsDependentInd</xsl:with-param>
									</xsl:call-template>You as a dependent</label>
								<span style="width:6mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SpouseClaimAsDependentInd"/>
										<xsl:with-param name="BackupName">IRS1040SpouseClaimAsDependentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SpouseClaimAsDependentInd"/>
										<xsl:with-param name="BackupName">IRS1040SpouseClaimAsDependentInd</xsl:with-param>
									</xsl:call-template>Your spouse as a dependent</label>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name Control</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
								</xsl:call-template>
								<br />
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
										<xsl:with-param name="BackupName">IRS1040MustItemizeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/MustItemizeInd"/>
										<xsl:with-param name="BackupName">IRS1040MustItemizeInd</xsl:with-param>
									</xsl:call-template>Spouse itemizes on a separate return or you were a dual-status alien</label>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div style="width:20mm;height:9mm;padding-top:3mm;float:left;font-family:Arial;font-size:7pt;">
							<strong>Age/Blindness</strong>
						</div>
						<div style="width:167mm;height:9mm;padding-top:0.2mm;float:left;">
							<span style="display:inline;font-family:Arial;">
								<strong>You:</strong>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;margin-bottom:0.5mm;margin-top:0.5mm;margin-left:1.5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
										<xsl:with-param name="BackupName">IRS1040Primary65OrOlderInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
										<xsl:with-param name="BackupName">IRS1040Primary65OrOlderInd</xsl:with-param>
									</xsl:call-template>Were born before January 2, 1955</label>
								<span style="width:9.7mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
										<xsl:with-param name="BackupName">IRS1040PrimaryBlindInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PrimaryBlindInd"/>
										<xsl:with-param name="BackupName">IRS1040PrimaryBlindInd</xsl:with-param>
									</xsl:call-template>Are blind</label>
								<br />
								<strong>Spouse:</strong>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;margin-bottom:0.5mm;margin-top:0.5mm;margin-left:1.5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
										<xsl:with-param name="BackupName">IRS1040Spouse65OrOlderInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
										<xsl:with-param name="BackupName">IRS1040Spouse65OrOlderInd</xsl:with-param>
									</xsl:call-template>Was born before January 2, 1955</label>
								<span style="width:5mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
										<xsl:with-param name="BackupName">IRS1040SpouseBlindInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SpouseBlindInd"/>
										<xsl:with-param name="BackupName">IRS1040SpouseBlindInd</xsl:with-param>
									</xsl:call-template>Is blind</label>
							</span>
							<span style="float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'depdContainerId'  "/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Dependents area -->
					<div class="sty1040SRDepdContainer" style="" id="depdContainerId">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="display:table;font-size:6pt;border-collapse:collapse;width:187mm;;">	
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:59.4mm;text-align:left;padding-left:1mm;padding-top:0mm;">
										<span style="">
											<span style="font-size:10pt;">Dependents <span style="font-weight:normal">(see instructions):</span></span>
											<br/>
											<span style="styBoldText">(1)</span>
											<span style="font-weight:normal;padding-top:2px;font-size:7pt;">
												<span style="width:1mm"/>First name
												<span style="width:13mm;"/>Last name
											</span>
										</span>
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35.2mm;border-right-width:1px;vertical-align:top;font-size:8pt;">
									<!-- uncomment and change table header literals here or use 'cellpad' -->
										<span style="font-weight:normal">
											<b>(2)</b><span style="width:.5mm"/>
											Social security number
										</span>														
										<!-- span class="styTableCellPad"></span -->
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30.6mm;border-right-width:1px;vertical-align:top;font-size:8pt;">
									<!-- uncomment and change table header literals here or use 'cellpad' -->
										<span style="font-weight:normal;">
											<b>(3)</b><span style="width:.5mm"/>
										   Relationship to you
										</span>
										<!-- span class="styTableCellPad"></span -->
									</th>
									<th class="styTableCellHeader" scope="col" style="width:61.6mm;border-right-width:0px;vertical-align:top;font-size:8pt;">
										<span style="font-weight:normal">
											<b>(4)</b><img src="{$ImagePath}/1040_Check.gif" alt="Check"/><span style="width:.5mm"/>
										   if qualifies for (see inst.):
										   <br/>
										   Child tax credit
										   <span style="margin-left:7.5mm;font-family:Arial Narrow;">Credit for other dependents</span>
									   </span>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($FormData/DependentDetail) &lt;= 4)">
									<xsl:for-each select="$FormData/DependentDetail">
										<tr>
											<!-- Column 1 -->
											<td class="styTableCell" style="width:59.4mm;height:4mm;border-right-width:1px;">
												<span style="width:29mm;text-align:left;float:left;clear:none;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentFirstNm"/>
													</xsl:call-template>
												</span>
												<span style="width:29mm;text-align:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentLastNm"/>
													</xsl:call-template>
													<span style="float:right;">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Dependent <xsl:number value="position()"/> Name Control</xsl:with-param>
															<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
														</xsl:call-template>
													</span>
												</span>
											</td>
											<!-- Column 2 -->
											<td class="styTableCell" style="text-align:center;width:35.2mm;height:4mm;border-right-width:1px;">
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
											<td class="styTableCell" style="width:30.6mm;height:4mm;text-align:left;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
												</xsl:call-template>
											</td>
											<!-- Column 4 -->
											<td class="styTableCell" style="text-align:left;height:4mm;padding-top:0px;padding-bottom:0px;border-right:0px solid black">
												<div style="width:50%;height:4mm;border-right:1px solid black;padding:0.5mm;text-align:center;">
													<input type="Checkbox" class="styCkboxNM">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
															<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
														</xsl:call-template>
														<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for CTC Indicator</xsl:attribute>
													</input>
												</div>
												<div style="width:45%;padding:0.5mm;text-align:center;height:4mm;">
													<input type="Checkbox" class="styCkboxNM">
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
										<td class="styTableCell" style="text-align:left;height:3mm;padding:0px;border-right-width:0px;">
											<div style="width:50%;height:4mm;border-right:1px solid black;padding:0.5mm;text-align:center;">
												<input type="Checkbox" class="styCkboxNM" alt="Dependent 1 Eligible for CTC Indicator">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformation1EligibleForChildTaxCreditInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</div>
											<div style="width:45%;padding:0.5mm;text-align:center;height:4mm;">
												<input type="Checkbox" class="styCkboxNM" alt="Dependent 1 Eligible for ODC Indicator">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformation1EligibleForODCInd</xsl:with-param>
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
										<td class="styTableCell" style="text-align:left;height:3mm;padding:0px;border-right-width:0px;">
											<div style="width:50%;height:4mm;border-right:1px solid black;padding:0.5mm;text-align:center;">
												<input type="Checkbox" class="styCkboxNM" alt="Dependent 2 Eligible for CTC Indicator">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformation2EligibleForChildTaxCreditInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</div>
											<div style="width:45%;padding:0.5mm;text-align:center;height:4mm;">
												<input type="Checkbox" class="styCkboxNM" alt="Dependent 2 Eligible for ODC Indicator">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformation2EligibleForODCInd</xsl:with-param>
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
										<td class="styTableCell" style="text-align:left;height:3mm;padding:0px;border-right-width:0px;">
											<div style="width:50%;height:4mm;border-right:1px solid black;padding:0.5mm;text-align:center;">
												<input type="Checkbox" class="styCkboxNM" alt="Dependent 3 Eligible for CTC Indicator">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformation3EligibleForChildTaxCreditInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</div>
											<div style="width:45%;padding:0.5mm;text-align:center;height:4mm;">
												<input type="Checkbox" class="styCkboxNM" alt="Dependent 3 Eligible for ODC Indicator">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformation3EligibleForODCInd</xsl:with-param>
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
										<td class="styTableCell" style="text-align:left;height:3mm;padding:0px;border-right-width:0px;">
											<div style="width:50%;height:4mm;border-right:1px solid black;padding:0.5mm;text-align:center;">
												<input type="Checkbox" class="styCkboxNM" alt="Dependent 4 Eligible for CTC Indicator">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformation4EligibleForChildTaxCreditInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</div>
											<div style="width:45%;padding:0.5mm;text-align:center;height:4mm;">
												<input type="Checkbox" class="styCkboxNM" alt="Dependent 4 Eligible for ODC Indicator">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformation4EligibleForODCInd</xsl:with-param>
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
					<!-- Set Initial Height of Above Table -->
					<xsl:if test="(count($FormData/DependentDetail) &gt;= 4) and ($Print != $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="containerID" select=" 'depdContainerId' "/>
						</xsl:call-template>
					</xsl:if>
						<!-- End Dependents table -->
					<!--<div class="styStdDiv" style="overflow:visible;">-->
						<div class="styGenericDiv" style="width:20mm;padding-top:4mm;height:89mm;font-family:Arial;font-size:8pt;">
							<div style="width:100%;border:1px solid black;border-radius:8px;padding-top:3mm;padding-bottom:3mm;padding-left:1mm;">
								Attach Schedule B <br />if required.
							</div>
							<div style="width:50%;height:40mm;">&nbsp;</div>
							<div style="width:100%;border:1px solid black;border-radius:8px;padding-top:1mm;padding-left:1mm;padding-bottom:1mm;">
								<strong style="font-size:12pt;font-family:Arial Narrow;">Standard Deduction</strong><br />
								See <span style="font-style:italic;display:inline">Standard Deduction Chart</span> below.
							</div>
						</div>
						<!-- Line 1 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD">1</div>
							<div class="sty1040SRDesc">
								Wages, salaries, tips, etc. Attach Form(s) W-2
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 1 - Wages Not Shown Lit Only Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn">..........</span>
							</div>
							<div class="sty1040SRRightNumBox">1</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="border-top:1px solid black;border-left:2px solid white;margin-left:-2px;margin-right:2px;">2a</div>
							<div class="sty1040SRDesc" style="width:40mm;">Tax-exempt interest<span class="sty1040SRDotLn">.</span></div>
							<div class="sty1040SRRightNumBox">2a</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;height:6mm;padding-top:1.5mm;">b</div>
							<div class="sty1040SRDesc" style="width:40mm;">Taxable interest<span class="sty1040SRDotLn">...</span></div>
							<div class="sty1040SRRightNumBox">2b</div>
							<div class="sty1040SRAmountBox" style="width:29mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="border-bottom:1px solid black;border-left:2px solid white;margin-left:-2px;margin-right:2px;">3a</div>
							<div class="sty1040SRDesc" style="width:40mm;">
								Qualified dividends
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3a -  Qualified Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn">.</span>
							</div>
							<div class="sty1040SRRightNumBox">3a</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 3a - Qualified Dividends Form 8814 Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;height:6mm;padding-top:1.5mm;">b</div>
							<div class="sty1040SRDesc" style="width:40mm;">
								Ordinary dividends
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBox">3b</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD">4a</div>
							<div class="sty1040SRDesc" style="width:40mm;">IRA distributions<span class="sty1040SRDotLn">...</span></div>
							<div class="sty1040SRRightNumBox">4a</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;height:6mm;padding-top:1.5mm;">b</div>
							<div class="sty1040SRDesc" style="width:40mm;">
								Taxable amount
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn">..</span>
							</div>
							<div class="sty1040SRRightNumBox">4b</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
							<div class="sty1040SRDesc" style="width:40mm;">Pensions and annuities</div>
							<div class="sty1040SRRightNumBox">4c</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;height:6mm;padding-top:1.5mm;">d</div>
							<div class="sty1040SRDesc" style="width:40mm;">
								Taxable amount
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4d - Pensions and Annuities Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4d - Foreign Employer Pension Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4d - Taxable Foreign Pensions Total Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBox">4d</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD">5a</div>
							<div class="sty1040SRDesc" style="width:40mm;">
								Social security benefits
							</div>
							<div class="sty1040SRRightNumBox">5a</div>
							<div class="sty1040SRAmountBox" style="border-right-width:1px;">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5a - Social Security Benefits Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
								</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;height:6mm;padding-top:1.5mm;">b</div>
							<div class="sty1040SRDesc" style="width:40mm;">Taxable amount<span class="sty1040SRDotLn">...</span></div>
							<div class="sty1040SRRightNumBox">5b</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableSocSecAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD">6</div>
							<div class="sty1040SRDesc">
								<span style="display:inline;font-family:Arial Narrow;">Capital gain or (loss). Attach Schedule D if required. If not required, check here </span>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6 - Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6 - Form 8814 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
								</xsl:call-template>
								<span style="float:right;">
									<span class="sty1040SRDotLn" style="float:none;margin-right:-6px;">.</span>
									&#9658; 
									<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" alt="Schedule D not required">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
											<xsl:with-param name="BackupName">IRS1040CapitalDistributionInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040SRRightNumBox">6</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7a -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD">7a</div>
							<div class="sty1040SRDesc">Other income from Schedule 1, line 9<span class="sty1040SRDotLn">..............</span></div>
							<div class="sty1040SRRightNumBox">7a</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7b -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
							<div class="sty1040SRDesc">
								Add lines 1, 2b, 3b, 4b, 4d, 5b, 6, and 7a. This is your <strong>total income</strong>
								<span class="sty1040SRDotLn" style="margin-right:-9px;">...&#9658;</span>
							</div>
							<div class="sty1040SRRightNumBox">7b</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 8a -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD">8a</div>
							<div class="sty1040SRDesc">Adjustments to income from Schedule 1, line 22<span class="sty1040SRDotLn">..........</span></div>
							<div class="sty1040SRRightNumBox">8a</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 8b -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
							<div class="sty1040SRDesc">
								Subtract line 8a from line 7b. This is your <strong>adjusted gross income</strong>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 8b - Excluded Section 933 Puerto Rico Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 8b - Excluded Section 933 Puerto Rico Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn" style="margin-right:-9px;">..&#9658;</span>
							</div>
							<div class="sty1040SRRightNumBox">8b</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="border-top:1px solid black;border-bottom:1px solid black;border-left:2px solid white;margin-left:-2px;margin-right:2px;">9</div>
							<div class="sty1040SRDesc" style="width:87mm;padding-top:1.5mm;font-family:Arial Narrow;">
								<strong>Standard deduction or itemized deductions </strong> (from Schedule A) 
							</div>
							<div class="sty1040SRRightNumBox">9</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 9 - Modified Standard Deduction Ind</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 10 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">10</div>
							<div class="sty1040SRDesc" style="width:87mm;font-size:9pt;font-family:Arial Narrow;padding-top:1.7mm;">
								Qualified business income deduction. Attach Form 8995 or Form 8995-A
							</div>
							<div class="sty1040SRRightNumBox">10</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 11a -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">11a</div>
							<div class="sty1040SRDesc">
								Add lines 9 and 10
								<span class="sty1040SRDotLn">.....................</span>
							</div>
							<div class="sty1040SRRightNumBox">11a</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11b -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox" style="padding-left:4.2mm;">b</div>
							<div class="sty1040SRDesc">
								<strong>Taxable income. </strong> Subtract line 11a from line 8b. If zero or less, enter -0-
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11b - Capital Construction Fund Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11b - Capital Construction Fund Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
								</xsl:call-template>
								<!--<span class="sty1040SRDotLn">.</span>-->
							</div>
							<div class="sty1040SRRightNumBoxNBB">11b</div>
							<div class="sty1040SRAmountBoxNBB">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 11b - Schedule Q Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End -->
					<!--</div>-->
					<!-- Standard Deduction Chart -->
					<div class="styStdDiv" style="font-size:0pt;"/>
					<div class="styStdIBDiv">
					<div class="styGenericDiv" style="width:24mm;padding-top:0mm;height:44.8mm;font-family:Arial Narrow;font-size:7pt;border-top:1px solid black;">
						<div style="width:20mm;padding-top:0.5mm;padding-left:1mm;">
							<strong style="font-size:12pt;font-family:Arial Narrow;">Standard Deduction Chart</strong><br />
							Don't use this chart if someone can claim you (or your spouse if filing jointly) as a dependent, your 
							spouse itemizes on a separate return, or you were a dual-status alien. Instead, see instructions.
						</div>
					</div>
					<div class="sty1040Desc" style="width:163mm;border-top:1px solid black;float:none;">
						Add the number of boxes checked in the "Age/Blindness" section of <span style="display:inline;font-style:italic;">Standard Deduction</span>
						<span style="float:right;">
							<span class="sty1040SRDotLn" style="float:none;">..</span>
							&#9658; 
							<span style="width:6mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalBoxesCheckedCnt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<div style="width:163mm;border-top:1px solid black;font-weight:bold;font-size:7pt;">
						<div style="width:27mm;padding-top:1mm;float:left;">
							IF your filing <br /> status is. . .
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;">
							AND the number of <br /> boxes checked is. . .
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;border-right:2px solid black;">
							THEN your standard <br /> deduction is. . .
						</div>
						<div style="width:27mm;padding-top:1mm;padding-left:2mm;float:left;">
							IF your filing <br /> status is. . .
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;">
							AND the number of <br /> boxes checked is. . .
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;">
							THEN your standard <br /> deduction is. . .
						</div>
					</div>
					<div style="width:163mm;border-top:1px solid black;font-size:9pt;">
						<div style="width:27mm;padding-top:4mm;float:left;">
							Single
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;">
							0 <br /> 1 <br /> 2
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;border-right:2px solid black;padding-bottom:0.5mm;">
							$12,200 <br /> 13,850 <br /> 15,500
						</div>
						<div style="width:27mm;padding-top:2.5mm;padding-left:2mm;float:left;">
							Head of <br /> household
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;">
							0 <br /> 1 <br /> 2
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;">
							$18,350 <br /> 20,000 <br /> 21,650
						</div>
					</div>
					<div style="width:163mm;border-top:1px solid black;font-size:9pt;">
						<div style="width:27mm;padding-top:0.7mm;float:left;">
							Married <br /> filing jointly <br /> or <br /> Qualifying <br /> widow(er)
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;">
							0 <br /> 1 <br /> 2 <br /> 3 <br /> 4
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;border-right:2px solid black;padding-bottom:0.5mm">
							24,400 <br /> 25,700 <br /> 27,000 <br /> 28,300 <br /> 29,600
						</div>
						<div style="width:27mm;padding-top:6mm;padding-left:2mm;float:left;">
							Married filing <br /> separately
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;">
							0 <br /> 1 <br /> 2 <br /> 3 <br /> 4
						</div>
						<div style="width:27mm;padding-top:1mm;float:left;text-align:center;">
							12,200 <br /> 13,500 <br /> 14,800 <br /> 16,100 <br /> 17,400
						</div>
					</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;font-size:7pt;">For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:13mm;font-size:6.5pt;">Cat. No. 71930F</span>
						<span style="float:right;font-size:6.5pt;">Form <strong style="font-size:10pt;">1040-SR</strong> (2019)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;font-size:7pt;font-family:Verdana;">
						Form 1040-SR (2019)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;overflow:visible;">
						<div class="styGenericDiv" style="width:20mm;padding-top:57mm;height:90mm;">
							<div style="width:100%;border:1px solid black;border-radius:8px;padding-top:1mm;padding-left:1mm;font-family:Arial;font-size:7pt;">
								<span style="width:1.5mm;height:5mm;float:left;">&#8226;</span>
								<span style="float:left;width:16.5mm;">If you have a qualifying child, attach Sch. EIC.</span>
								<br />
								<span style="width:1.5mm;height:5mm;float:left;">&#8226;</span>
								<span style="float:left;width:16.5mm;">If you have nontaxable combat pay, see instructions.</span>
							</div>
						</div>
						<!-- Line 12a -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">12a</div>
							<div class="sty1040SRDesc">
								<span style="font-weight:bold;">Tax </span> (see instuctions). Check if any from: 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 12a(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
								</xsl:call-template>
								<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 12a(3) - Other Tax Amount Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 12a(3) - Other Tax Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/OtherTaxAmtGrp) &gt;= 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 12a(3) - Other Tax Groups</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp"/>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="text-align:left;">&nbsp;</div>
						</div>
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">&nbsp;</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								<span style="font-weight:bold;width:5mm;text-align:center;">1</span>
								<input type="checkbox" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">F1040Form8814Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:1mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">F1040Form8814Ind</xsl:with-param>
									</xsl:call-template>Form(s) 8814</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
								</xsl:call-template>
								<span style="width:3mm;height:3mm;"/>
								<span style="font-weight:bold;width:5mm;text-align:center;">2</span>
								<input type="checkbox" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">F1040Form4972Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:1mm;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">F1040Form4972Ind</xsl:with-param>
									</xsl:call-template>Form 4972</label>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
									</xsl:call-template>
								<span style="width:3mm;height:3mm;"/>
								<span style="font-weight:bold;width:5mm;text-align:center;">3</span>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" alt="Other Tax Amounts">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
										<xsl:with-param name="BackupName">F1040OtherTaxAmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:6mm;border-bottom:1px solid black;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="sty1040SRRightNumBox">12a</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 12b -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.4mm;">b</div>
							<div class="sty1040SRDesc">
								Add Schedule 2, line 3, and line 12a and enter the total
								<span class="sty1040SRDotLn" style="margin-right:-9px;">.......&#9658;</span>
							</div>
							<div class="sty1040SRRightNumBox">12b</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13a -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">13a</div>
							<div class="sty1040SRDesc" style="width:87mm;font-family:Arial;">
								Child tax credit or credit for other dependents
								<span class="sty1040SRDotLn">...</span>
							</div>
							<div class="sty1040SRRightNumBox">13a</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CTCODCAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CTCODCAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 13b -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.4mm;">b</div>
							<div class="sty1040SRDesc">
								Add Schedule 3, line 7, and line 13a and enter the total
								<span class="sty1040SRDotLn" style="margin-right:-9px;">.......&#9658;</span>
							</div>
							<div class="sty1040SRRightNumBox">13b</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">14</div>
							<div class="sty1040SRDesc">
								Subtract line 13b from line 12b. If zero or less, enter -0-
								<span class="sty1040SRDotLn">........</span>
							</div>
							<div class="sty1040SRRightNumBox">14</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">15</div>
							<div class="sty1040SRDesc">
								Other taxes, including self-employment tax, from Schedule 2, line 10
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Deferred Tax 1 Total Tax Deferred Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/TotalTaxDeferredAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Deferred Tax 1 Expatriation Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/ExpatriationCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Deferred Tax 2 Total Tax Deferred Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/TotalTaxDeferredAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Deferred Tax 2 Expatriation Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/ExpatriationCd"/>
								</xsl:call-template>
								
							</div>
							<div class="sty1040SRRightNumBox">15</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 16 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">16</div>
							<div class="sty1040SRDesc">
								Add lines 14 and 15. This is your <strong>total tax </strong> 
								<span class="sty1040SRDotLn" style="margin-right:-9px;">............&#9658;</span>
							</div>
							<div class="sty1040SRRightNumBox">16</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">17</div>
							<div class="sty1040SRDesc">
								Federal income tax withheld from Forms W-2 and 1099
								<span class="sty1040SRDotLn">........</span>
							</div>
							<div class="sty1040SRRightNumBox">17</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 18 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">18</div>
							<div class="sty1040SRDesc">Other payments and refundable credits: </div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB">&nbsp;</div>
						</div>
						<!-- Line 18a -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="border-top:1px solid black;border-bottom:1px solid black;border-left:2px solid white;margin-left:-2px;margin-right:2px;padding-left:4.4mm;">a</div>
							<div class="sty1040SRDesc" style="width:87mm;padding-top:1.7mm;">
								Earned income credit (EIC) 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 18a - Earned Income Credit Eligibility Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 18a - EIC Prior Year Earned Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 18a - EIC Prior Year Earned Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 18a - Nontaxable Combat Pay Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NontaxableCombatPayCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 18a - Nontaxable Combat Pay Election Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn">......</span>
							</div>
							<div class="sty1040SRRightNumBox">18a</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 18b -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.4mm;">b</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								Additional child tax credit. Attach Schedule 8812
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 18b - Additional Child Prior Year Earned Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 18b - Additional Child Prior Year Earned Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBox">18b</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 18c -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.4mm;">c</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								American opportunity credit from Form 8863, line 8
								<span class="sty1040SRDotLn">.</span>
							</div>
							<div class="sty1040SRRightNumBox">18c</div>
							<div class="sty1040SRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 18d -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBoxSD" style="padding-left:4.4mm;">d</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								Schedule 3, line 14
								<span class="sty1040SRDotLn">.............</span>
							</div>
							<div class="sty1040SRRightNumBox">18d</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 18e -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox" style="padding-left:4.4mm;">e</div>
							<div class="sty1040SRDesc" style="font-family:Arial Narrow;">
								Add lines 18a through 18d. These are your <strong>total other payments and refundable credits </strong> 
								<span style="float:right;margin-right:2px;">&#9658;</span>
							</div>
							<div class="sty1040SRRightNumBox">18e</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 19 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">19</div>
							<div class="sty1040SRDesc">
								Add lines 17 and 18e. These are your <strong>total payments </strong> 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 19 - Form 8689 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 19 - Form 8689 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
								</xsl:call-template>
								<span class="sty1040SRDotLn" style="margin-right:-9px;">.....&#9658;</span>
							</div>
							<div class="sty1040SRRightNumBoxNBB">19</div>
							<div class="sty1040SRAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end -->
					</div>
					<!-- Refund -->
					<div class="styGenericDiv" style="width:20mm;height:25mm;">
						<span style="font-weight:bold;font-size:12pt;">Refund</span>
						<br /><br />
						<span style="font-family:Arial;font-size:8pt;">
							Direct deposit? See instructions.
						</span>
					</div>
					<!-- Line 20 -->
					<div class="sty1040SRLN">
						<div class="sty1040SRLeftNumBox">20</div>
						<div class="sty1040SRDesc" style="font-family:Arial Narrow;">
							If line 19 is more than line 16, subtract line 16 from line 19. This is the amount you <strong>overpaid </strong> 
						</div>
						<div class="sty1040SRRightNumBox">20</div>
						<div class="sty1040SRAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21a -->
					<div class="sty1040SRLN">
						<div class="sty1040SRLeftNumBox">21a</div>
						<div class="sty1040SRDesc" style="font-family:Arial Narrow;">
							Amount of line 20 you want <strong>refunded to you. </strong> If Form 8888 is attached, check here
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
							</xsl:call-template>
							<span style="float:right;">
								
								&#9658; 
								<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" alt="Form 8888 attached">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
										<xsl:with-param name="BackupName">IRS1040Form8888Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="sty1040SRRightNumBox">21a</div>
						<div class="sty1040SRAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21b, 21c -->
					<div class="sty1040SRLN">
						<div class="sty1040SRLeftNumBox">&#9658;b</div>
						<div class="sty1040SRDesc">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm;font-family:Arial Narrow;">
							   Routing number
							</span>
							<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
							<span style="width:14px;"/>
							&#9658;
							<span class="styBoldText">c</span> Type:
							<span style="width:4px;"/>
							<!-- Checkbox  1=checking, 2 = savings -->
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-size:9pt;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
								Checking
							</label>
							<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="font-size:9pt;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[2]</xsl:with-param>
								</xsl:call-template>
								Savings
							</label>
						</div>
						<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty1040SRAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 21d -->
					<div class="sty1040SRLN">
						<div class="sty1040SRLeftNumBox">&#9658;d</div>
						<div class="sty1040SRDesc">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm;font-family:Arial Narrow;">
							   Account number
							</span>
							<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty1040SRAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 22 -->
					<div class="sty1040SRLN">
						<div class="sty1040SRLeftNumBox">22</div>
						<div class="sty1040SRDesc" style="width:87mm;">
							<span style="display:inline;font-family:Arial Narrow;">Amount of line 20 you want <strong>applied to your 2020 estimated tax</strong></span>&#9658;
						</div>
						<div class="sty1040SRRightNumBoxNBB">22</div>
						<div class="sty1040SRAmountBoxNBB">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- You Owe -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:20mm;height:8mm;">
							<span style="font-weight:bold;font-size:12pt;">Amount <br />You Owe</span>
						</div>
						<!-- Line 23 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">23</div>
							<div class="sty1040SRDesc" style="font-family:Arial Narrow;">
								<strong>Amount you owe. </strong> Subtract line 19 from line 16. For details on how to pay, see instructions 
								&#9658;
							</div>
							<div class="sty1040SRRightNumBox">23</div>
							<div class="sty1040SRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 24 -->
						<div class="sty1040SRLN">
							<div class="sty1040SRLeftNumBox">24</div>
							<div class="sty1040SRDesc" style="width:87mm;">
								Estimated tax penalty (see instructions)
								<span class="sty1040SRDotLn" style="margin-right:-9px;">....&#9658;</span>
							</div>
							<div class="sty1040SRRightNumBoxNBB">24</div>
							<div class="sty1040SRAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040SRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040SRAmountBoxNBB" style="">&nbsp;</div>
						</div>
					</div>
					<!-- Third Party -->
					<div style="display:block;width:187mm;border-top:1px solid black;font-size:7pt;font-family:Verdana;">
						<div class="styGenericDiv" style="width:20mm;height:14mm;">
							<span style="font-weight:bold;font-size:8pt;">Third Party Designee</span>
							<br />
							<span style="font-family:Arial;font-size:7pt;">(Other than<br /> paid preparer)</span>
						</div>
						<div style="width:167mm;height:7mm;">
							<span style="font-family:Arial;width:133mm;">Do you want to allow another person (other than your paid preparer) to discuss this return with the IRS? See instructions.</span>
							<span style="width:30mm;float:right;">
								<input type="checkbox" class="styCkboxNM" style="margin-right:2px;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>Yes. </label> <span style="font-family:Arial;"> Complete below.</span>
								<br />
								<input type="checkbox" class="styCkboxNM" style="margin-right:2px;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span>
						</div>
						<div style="width:167mm;height:7mm;">
							<span style="width:16mm;">
								Designee's <br /> name &#9658;
							</span>
							<span style="width:54mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</span>
							<span style="width:11mm;">
								Phone <br /> no. &#9658;
							</span>
							<span style="width:26mm;">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePhoneNum"/>
								</xsl:call-template>
							</span>
							<span style="width:30mm;">
								Personal identification <br /> number (PIN) &#9658;
							</span>
							<span style="width:20mm;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Sign Here -->
					<div style="display:block;width:187mm;border-top:1px solid black;font-size:8pt;font-family:Verdana;">
						<div class="styGenericDiv" style="width:20mm;height:28mm;font-size:7pt;">
							<span style="font-weight:bold;font-size:12pt;">Sign Here</span>
							<br /><br /><br />
							Joint return? See instructions. Keep a copy for your records.
						</div>
						<div style="padding-top:14.7mm;padding-left:8px;padding-right:0px;float:left;clear:none;width:4mm;margin-left:-2px;margin-right:2px;">
							<img src="{$ImagePath}/1040_Bullet_SuperLg.gif" alt="Right pointing arrowhead image" height="48" width="10"/>
						</div>
						<div style="float:left;clear:none;width:163mm;">
							<div class="" style="width:163mm;font-size:8pt;font-family:Arial;float:left;clear:none;">
								Under penalties of perjury, I declare that I have examined this return and accompanying schedules and statements, and to 
								the best of my knowledge and belief, they are true, correct, and complete. Declaration of preparer (other than taxpayer) is 
								based on all information of which preparer has any knowledge.
							</div>
							<div style="width:163mm;float:left;clear:none;"/>
							<div class="styBB" style="width:163mm;float:left;clear:none;">
								<div style="width:70mm;float:left;clear:none;">
									<div class="styFNBox" style="width:70mm;float:left;clear:none;">
									  Your signature
									</div>
									<div class="styFNBox" style="height:8mm;width:70mm;padding-top:1.5mm;float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
										  Date
									</div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;clear:none;font-size:7pt;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
									   Your occupation
									</div>
									<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;font-family:Arial;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PrimaryOccupationTxt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="" style="width:35mm;float:left;clear:none;">
									<div class="styGenericDiv" style="height:11mm;width:38.5mm;border-left-width:0px;font-size:7pt;">
										<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">If the IRS sent you an Identity Protection PIN, 
										  enter it here </span>
										<br/>
										<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
											 (see inst.)
										</span>
										<span style="width:60%;padding-top:0px;padding-right:5mm;float:right;text-align:center;padding-top:0.8mm">
											<div class="styLNCtrNumBox" style="height:3mm;width:23mm;border-top-width:1px;font-weight:normal">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
								</div>
							</div>
							<div class="" style="width:163mm;float:left;clear:none;">
								<div style="width:70mm;float:left;clear:none;">
									<div class="styFNBox" style="width:70mm;float:left;clear:none;font-family:Arial;">
									   Spouse's signature. If a joint return, <span class="styBoldText"> both</span> must sign.
									</div>
									<div class="styFNBox" style="height:9mm;width:70mm;padding-top:1.5mm;float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;height:12mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
									  Date
									</div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;clear:none;font-size:7pt;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;height:11mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
									   Spouse's occupation
									</div>
									<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;clear:none;font-family:Arial;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseOccupationTxt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styGenericDiv" style="height:11mm;width:38.5mm;border-left-width:0px;font-size:7pt;">
									<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">If the IRS sent your spouse an Identity Protection PIN, 
									  enter it here </span>
									<br/>
									<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
										(see inst.)
									</span>
									<span style="width:60%;padding-top:0px;padding-right:5mm;float:right;text-align:center;padding-top:0.8mm">
										<div class="styLNCtrNumBox" style="height:3mm;width:23mm;border-top-width:1px;font-weight:normal">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
							</div>
							<div class="" style="width:163mm;float:left;clear:none;border-top:1px solid black;">
								<div style="width:69.6mm;float:left;font-size:7pt;">
									Phone no. 
									<span style="width:4px;"/>
									<xsl:if test="$FormData/PhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$FormData/PhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$FormData/ForeignPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div style="width:92.5mm;float:left;padding-left:2mm;font-size:7pt;border-left:1px solid black;">
									Email address 
									<span style="width:4px;"/> 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/AdditionalFilerInformation/AtSubmissionFilingGrp/EmailAddressTxt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- paid preparer -->
					<div class="" style="width:187mm;font-size:7pt;float:none;clear:both;height:30mm;border-top:1px solid black;">
						<div style="width:22.75mm;padding-top:2mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:11pt;">
								Paid
								Preparer
								Use Only
							</span>
						</div>
						<div style="width:135mm;float:left;clear:none;display:block;">
							<div style="width:135mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styFNBox" style="height:8mm;width:52mm;padding-top:0mm;border-right:1 solid black;">
									<span style="display:inline;font-size:8pt;">Preparer's name</span><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
									</xsl:call-template>
								</div>
								<div class="styFNBox" style="height:8mm;width:41mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;font-size:8pt;">
									Preparer's signature
								</div>
								<div class="styFNBox" style="height:8mm;width:22mm;padding-top:0mm;padding-left:1mm;border-right:1 solid black;">
									<span style="font-size:8pt;">Date</span>
									<br />
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styFNBox" style="height:8mm;width:20mm;padding-left:1mm;">
									<span style="font-size:8pt;">PTIN</span>
									<br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
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
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="height:8mm;width:42mm;padding-left:1mm;border-right:1 solid black"> Phone no. 
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div class="" style="width:164mm;border-top:1px solid black;;border-right-width:0px;float:left;clear:none;">
								<div class="styFNBox" style="width:124mm;min-height:14mm;border-right:1px solid black;">
									<div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styFNBox" style="width:40mm;border-right-width:0px;">
									<div class="styGenericDiv" style="padding-right:.5mm;padding-left:0.5mm;">Firm's EIN 
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;padding-left:0.5mm;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
							</div>
						</div>
						<div class="styLNDesc" style="height:16mm;width:29mm;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ThirdPartyDesigneeInd"/>
									<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationThirdPartyDesigneeInd</xsl:with-param>
								</xsl:call-template>
								<span style="font-size:8pt;">Check if:</span><br/>
								<input class="styCkbox" type="checkbox">
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
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
								</xsl:call-template>
								<br/>
								<input class="styCkbox" type="checkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>Self-employed
							</label>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;font-size:7pt;">
						Go to <span style="display:inline;font-style:italic;">www.irs.gov/Form1040SR</span> for instructions and the latest information.
						<span style="float:right;">Form <strong style="font-size:10pt;">1040-SR</strong> (2019)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<!-- Special Condition Desc separate repeating -->
						<xsl:if test="count($FormData/SpecialConditionDesc) &lt; 2">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Right Margin - Special Condition Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Primary Date Of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Spouse Date Of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Special Processing Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Combat Zone Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Combat Zone Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd/@combatZoneDt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Special Processing Code Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpecialProcessingCodeTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Community Property Return Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CommPropStateRtnInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Power Of Attorney Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Personal Representative</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
						</xsl:call-template>
						<xsl:if test="count($FormData/RefundProductCd) &lt; 2">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Right Margin - Refund Product Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCd"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Refund Product Code Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/RefundProductCodeTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Filing Status - Spouse's Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpouseNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Filing Status - Non-Resident Alien Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NRALiteralCd"/>
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
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
						</xsl:call-template>
						<xsl:if test="($Print != $Separated) or (count($FormData/DependentDetail) &lt;= 4)">
							<xsl:for-each select="$FormData/DependentDetail">
								<xsl:call-template name="PopulateLeftoverRow">
									<xsl:with-param name="Desc">Dependent <xsl:number value="position()" format="1"/> Name Control</xsl:with-param>
									<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
								</xsl:call-template>
							</xsl:for-each>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1 - Wages Not Shown Lit Only Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 3a - Qualified Form 8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
							<xsl:with-param name="Desc">Line 3a - Qualified Form 8814 Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 3b - Ordinary Form 8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 3b - Ordinary Form 8814 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
						</xsl:call-template>
						<xsl:if test="count($FormData/IRADistributionsLiteralCd) &lt; 2">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
							</xsl:call-template>	
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4d - Foreign Employer Pension Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 4d - Taxable Foreign Pensions Total Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4d - Pensions Annuities Literal Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5a - Social Security Benefits Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6 - Form 8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 6 - Form 8814 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 8b - Excluded Sect 933 Puerto Rico Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 8b - Excluded Sect 933 Puerto Rico Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 9 - Modified Standard Deduction Ind</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 11b - Capital Construction Fund Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 11b - Capital Construction Fund Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 11b - Schedule Q Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 12a(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
						</xsl:call-template>
						<!-- OtherTaxAmtGrp separate repeating -->
						<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 12a(3) - Other Tax Amount Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Line 12a(3) - Other Tax Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 15 - Deferred Tax 1 Total Tax Deferred Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/TotalTaxDeferredAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 15 - Deferred Tax 1 Expatriation Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/ExpatriationCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 15 - Deferred Tax 2 Total Tax Deferred Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/TotalTaxDeferredAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 15 - Deferred Tax 2 Expatriation Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/ExpatriationCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 18a - Earned Income Credit Eligibility Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 18a - EIC Prior Year Earned Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 18a - EIC Prior Year Earned Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 18a - Nontaxable Combat Pay Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NontaxableCombatPayCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 18a - Nontaxable Combat Pay Election Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 18b - Additional Child Prior Year Earned Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 18b - Additional Child Prior Year Earned Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 19 - Form 8689 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 19 - Form 8689 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
						</xsl:call-template>
					</table>
					
					<!-- Special Condition Descriptions -->
					<xsl:if test="count($FormData/SpecialConditionDesc) &gt; 1">
						<span class="styRepeatingDataTitle" style="padding-top:5mm;">Top Right Margin - Special Condition Description</span>
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
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Refund Product Codes -->
					<xsl:if test="count($FormData/RefundProductCd) &gt; 1">
						<span class="styRepeatingDataTitle" style="padding-top:5mm;">Top Right Margin - Refund Product Code</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
									  Refund Product Code
								   </th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/RefundProductCd">
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
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- Begin Separated Repeating data table for DependentInformations -->
					<xsl:if test="($Print = $Separated) and (count($FormData/DependentDetail) &gt; 4)">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Form 1040 - Dependents </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="text-align:left;width:90.4mm;">
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
									<th class="styDepTblCell" scope="col" style="width:29.2mm;font-size:6pt">
										<span style="font-weight:bold;">(2)</span>
										<span style="width:4px;"/> 
										<span class="styNormalText">
										   Social security number
									   </span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:24.6mm;font-size:6pt">
										<span style="font-weight:bold;">(3)</span>
										<span style="width:3px;"/> 
										<span class="styNormalText">
										   Relationship to you
									   </span>
									</th>
									<th class="styDepTblCell" scope="col" style="width:62.6mm;font-size:6pt">
										<span class="styNormalText" style="text-align:left">
											<span style="font-weight:bold;padding-left:8mm">(4)</span><span style="width:.5mm"/><img src="{$ImagePath}/1040_Check.gif" alt="Check"/><span style="width:.5mm"/>
												if qualifies for (see inst.):
											<br/>
											<br/>
											<span style="width:45%"> Child tax credit</span>
											  
											<span style="width:50%">Credit for other dependents</span>
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
													</xsl:call-template>
												</span>
												<span style="width:5px;"/>
												<span style="width:25mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentLastNm"/>
													</xsl:call-template>
												</span>
												<span style="width:5px;"/>
												<span style="width:5mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
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
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="text-align:left;height:4mm;padding-top:0px;padding-bottom:0px;border-right:0px solid black">
											<div style="width:50%;height:4mm;border-right:1px solid black;padding:0.5mm;text-align:center;">
												<input type="Checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
														<xsl:with-param name="BackupName">IRS1040DependentInformations<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</div>
											<div style="width:45%;padding:0.5mm;text-align:center;height:4mm;">
												<input type="Checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
														<xsl:with-param name="BackupName">IRS1040OtherDependentInformations<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
													</xsl:call-template>
												</input>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<!-- IRA Distributions Literal Codes -->
					<xsl:if test="count($FormData/IRADistributionsLiteralCd) &gt; 1">
						<span class="styRepeatingDataTitle" style="padding-top:5mm;">Line 4b - IRA Distributions Literal Code</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">
									  IRA Distributions Literal code
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
												</xsl:call-template>
											</div>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					
					<xsl:if test="count($FormData/OtherTaxAmtGrp) &gt; 1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 12a(3) - Other Tax Groups</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										Other Tax Amount Code
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										Other Tax Amount
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherTaxAmtGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OtherTaxAmtCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherTaxAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br />
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
