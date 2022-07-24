<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 01/27/2022 -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY ndash "&#8211;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1040Style.xsl" />
	<xsl:include href="IRS1040SR.xsl" />
	<xsl:include href="IRS1040SRStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040" />
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$FormData/Form1040SRInd">
				<xsl:call-template name="DisplayIRS1040SR"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="DisplayIRS1040"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="DisplayIRS1040">
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
						<xsl:call-template name="IRS1040Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:22.8mm;height:42px;padding-top:4px;">
							<span class="" style="margin-top:3.5mm;margin-left:-1mm;margin-right:-1mm;;transform:rotate(270deg);float:left;">Form</span>
							<span class="styFormNumber" style="margin-top:1mm;">1040</span>
						</div>
						<div class="styGenericDiv" style="width:65mm;padding-right:1mm;padding-top:6px;height:42px;">
							<span class="styAgency">Department of the Treasury&#8212;Internal Revenue Service</span>
							<span style="width:4mm;"/>(99)<br/>
							<span class="styMainTitle" style="font-family:Arial-Narrow;font-size:12pt">U.S. Individual Income Tax Return</span>
						</div>
						<div class="styTYBox" style="width:18mm;border-right-width:1px;height:42px;padding-top:4px;">
							<span class="styTaxYear">20<span class="styTYColor">20</span></span>
						</div>
						<div class="styOMB" style="width:28mm;height:42px;padding:25px 1mm 1mm 1mm;float:left;
						  border-width:0px 1px 0px 0px;vertical-align:bottom;">
							OMB No. 1545-0074
						</div>
						<div class="styGenericDiv" style="width:48mm;height:42px;font-family:Arial-Narrow;font-size:6.5pt;padding:3px 0px 1mm 1mm;vertical-align:bottom;">
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
							</xsl:call-template><br/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Refund Product Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Refund Product Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/RefundProductCodeTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Filed Pursuant To Section 30191002 Code</xsl:with-param>
								<xsl:with-param name="TargetNode" 
									select="$FormData/FiledPursuantToSect30191002Cd"/>
							</xsl:call-template>
							&nbsp;
							IRS Use Only&#8212;Do not write or staple in this space.
						</div>
					</div>
					<!-- Filing status section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div style="width:25mm;height:15mm;padding-top:1mm;float:left;">
							<input type="checkbox" class="styCkboxNM" alt="Amended Return" style="float:left;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">F1040AmendedBox</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="font-weight:bold;font-size:7pt;font-family:Arial;float:left;padding-left:0.5mm;padding-top:0.5mm;">
								<label><xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
										<xsl:with-param name="BackupName">F1040AmendedBox</xsl:with-param>
								</xsl:call-template>Amended Return</label>
							</span><br />
							<span style="font-weight:bold;margin-top:2px;">Filing Status</span><br />
							<span style="padding-top:0.5mm;">Check only <br />one box</span>
						</div>
						<div style="width:162mm;min-height:15mm;padding-top:1.0mm;float:left;">
							<span style="display:inline;font-family:Arial;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
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
								<span style="width:3mm;"/>
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
								<span style="width:3mm;"/>
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
								<span style="width:3mm;"/>
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
								<span style="width:3mm;"/>
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
							</span>
							<br />
							If you checked the MFS box, enter the name of spouse. If you checked the HOH or QW box, enter the child's name if the qualifying person is a child but not your dependent. 
							<span style="width:4px;"/>
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:4px;"/>
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
						<div class="styIRS1040HeaderCell" style="width:78mm;">
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
						<div class="styIRS1040HeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:46mm;border-right-width:0px;padding-left:1px;">
							<strong>Your social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040HeaderCell" style="width:78mm;">
							If joint return, spouse's first name and middle initial <br /> 
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:46mm;border-right-width:0px;padding-left:1px;">
							<strong>Spouse's social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040HeaderCell" style="width:129mm;height:10.5mm;">
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
						<div class="styIRS1040HeaderCell" style="width:12.06mm;height:10.5mm;font-family:Arial;">
							Apt. no. <br /> &nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:45.9mm;height:28.5mm;border-right-width:0px;float:right;">
							<strong>Presidential Election Campaign</strong><br />
							<span style="font-size:7.5pt;">Check here if you, or your spouse if filing jointly, want $3 to go to this fund. Checking a box below will not change your tax or refund.<br/>
								<input type="checkbox" class="styCkboxNM" style="margin:2mm 0mm 0mm 17mm;"
									alt="PECF Primary Ind You">
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
								<input type="checkbox" class="styCkboxNM" alt="PECF Spouse Ind Spouse">
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
						<div class="styIRS1040HeaderCell" style="width:101mm;">
							<span style="font-family:Arial;">City, town, or post office. If you have a
							   foreign address, also complete spaces below.</span><br />
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040HeaderCell" style="width:20mm;">
							<span style="font-family:Arial;">State
							</span><br />
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040HeaderCell" style="width:20.06mm;">
							<span style="font-family:Arial;">ZIP code
							</span><br />
							<xsl:if test="$RtnHdrData/Filer/USAddress">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styIRS1040HeaderCell" style="width:60mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign country name</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm" select="true()"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:41mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign province/state/county</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040HeaderCell" style="width:40.06mm;height:10.5mm;font-family:Arial;">
							<span style="font-family:Arial;">Foreign postal code</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
					</div>
					<div style="width:187mm;height:6mm;">
						<div class="styIRS1040HeaderCell" style="height:6mm;width:187mm;font-size:pt;padding-top:1.25mm;padding-left:0mm;border-width:0px 0px 1px 0px;">At any time during 2020, did you receive, sell, send, exchange, or otherwise acquire any financial interest in any virtual currency?
							<span style="font-size:7.5pt;">
								<input type="checkbox" class="styCkboxNM" alt="Virtual Cur Acquired Dur TY Ind Yes" >
									<xsl:call-template name="PopulateYesCheckbox">
									 <xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName" select="IRS1040VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
									 <xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName" select="IRS1040VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
									<b>Yes</b>
								</label>
								<span style="width:10px;"/>
								<input type="checkbox" class="styCkboxNM" alt="Virtual Cur Acquired Dur TY Ind No" >
									<xsl:call-template name="PopulateNoCheckbox">
									 <xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName" select="IRS1040VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
									 <xsl:with-param name="TargetNode" select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName" select="IRS1040VirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
									<b>No</b>
								</label>
							</span>
						</div>
					</div>					
					<!-- Standard Deduction and Age/Blindness section -->
					<div class="styStdDiv" style="">
						<div style="width:20mm;height:8mm;padding-top:0.5mm;float:left;">
							<strong>Standard Deduction</strong>
						</div>
						<div style="width:167mm;height:8mm;padding-top:0mm;float:left;border-bottom:1px solid black;">
							<span style="display:inline;font-family:Arial;">
								<strong>Someone can claim:</strong>
								<input type="checkbox" class="styCkboxNM" alt="Primary Claim As Dependent Ind" style="margin-right:1mm;margin-bottom:0.5mm;margin-top:0.5mm;margin-left:1.5mm;">
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
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" alt="Spouse Claim As Dependent Ind" style="margin-right:1mm;">
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
									<span style="width:4px"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNm"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Standard Deduction - Exempt Spouse Name Control</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseNameControlTxt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Standard Deduction - Total Exempt Primary And Spouse Cnt</xsl:with-param>
										<xsl:with-param name="TargetNode" 
											select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
									</xsl:call-template>
									<br />
								<input type="checkbox" class="styCkboxNM" alt="Must Itemize Ind" style="margin-right:1mm;">
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
						<div style="width:20mm;height:7mm;padding-top:3mm;float:left;font-family:Arial;">
							<strong>Age/Blindness</strong>
						</div>
						<div style="width:167mm;height:7mm;padding-top:2.2mm;float:left;">
							<span style="display:inline;font-family:Arial;">
								<strong>You:</strong>
								<input type="checkbox" class="styCkboxNM" alt="Primary 65 Or Older Ind" style="margin-right:1mm;margin-bottom:0.5mm;margin-top:0.5mm;margin-left:1.5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
										<xsl:with-param name="BackupName">IRS1040Primary65OrOlderInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Primary65OrOlderInd"/>
										<xsl:with-param name="BackupName">IRS1040Primary65OrOlderInd</xsl:with-param>
									</xsl:call-template>Were born before January 2, 1956</label>
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" alt="Primary Blind Ind" style="margin-right:1mm;">
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
								<span style="width:5mm;"/>
								<strong>Spouse:</strong>
								<input type="checkbox" class="styCkboxNM" alt="Spouse 65 Or Older Ind" style="margin-right:1mm;margin-bottom:0.5mm;margin-top:0.5mm;margin-left:1.5mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
										<xsl:with-param name="BackupName">IRS1040Spouse65OrOlderInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Spouse65OrOlderInd"/>
										<xsl:with-param name="BackupName">IRS1040Spouse65OrOlderInd</xsl:with-param>
									</xsl:call-template>Was born before January 2, 1956</label>
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" alt="Spouse Blind Ind" style="margin-right:1mm;">
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
							<span style="width:4px"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Age/Blindness - Total Boxes Checked Count</xsl:with-param>
								<xsl:with-param name="TargetNode" 
									select="$FormData/TotalBoxesCheckedCnt"/>
							</xsl:call-template>
							<span style="float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="headerHeight" select="2"/>
									<xsl:with-param name="containerID" select=" 'depdContainerId'  "/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Dependents area -->
					<div class="sty1040DepdContainer" style="">
						<div class="styGenericDiv" style="width:20mm;padding-top:1mm;
							font-family:Arial;font-size:8pt;border-bottom:0px solid black;height:24.3mm;">
							<div style="width:100%;padding-bottom:3mm;padding-left:1mm;">
								<strong>Dependents</strong><br /><br/>
								<span style="font-size:7pt;font-family:Arial Narrow">
									If more<br/>than four <br/>dependents,<br/>see instructions<br/>and check<br/>here
						  			<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
											<xsl:with-param name="BackupName">IRS1040NRMoreDependentsInd
										    </xsl:with-param>
										</xsl:call-template>
									</label>
						    		<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
						    		<span style="width:2px"/>
									<input type="checkbox" class="styCkboxNM" style="" alt="More Dependents Ind">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
											<xsl:with-param name="BackupName">IRS1040NRMoreDependentsInd
											</xsl:with-param>
									   </xsl:call-template>
									</input>
								</span>
							</div>
						</div>
					
					
					
					
				  <!--<div class="styGenericDiv" style="display:block">-->
					<!--<div class="styGeneric" style="width:187mm">-->
					<!--<div style="width:16mm;padding-top:1mm;">
						<label>
							<xsl:call-template name="PopulateLabel">
							   <xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
							   <xsl:with-param name="BackupName">IRS1040MoreDependentsInd</xsl:with-param>
						    </xsl:call-template><strong>Dependents</strong><br/><br/>If more <br/>than four<br/>
								 dependents,<br/>
						</label>see<br/>instructions<br/>and check<br/>here<span style="width:4px;"/>
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:4px;"/>
						<input type="checkbox" class="styCkboxNM" style="">
						   <xsl:call-template name="PopulateCheckbox">
							    <xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
							    <xsl:with-param name="BackupName">IRS1040MoreDependentsInd</xsl:with-param>
						   </xsl:call-template>
						</input>
					</div>
					<div style="width:166mm;float:right">
						<div class="sty1040DepdContainer" style="width:166mm;" id="depdContainerId">-->
						<div class="sty1040DepdContainer2" style="" id="depdContainerId">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="display:table;font-size:6pt;">	
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" rowspan="2" scope="col"
											style="min-width:59.4mm;width:59.4mm;text-align:left;padding-left:1mm;
											padding-top:0mm;">
											<span style="font-size:7pt;font-weight:normal">(see instructions):
												<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Dependents - Children Who Lived You Count</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ChldWhoLivedWithYouCnt"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Dependents - Other Dependents Listed Count</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/OtherDependentsListedCnt"/>
												</xsl:call-template>
												<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Dependents - Total Exemptions Count</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
												</xsl:call-template>
											</span>
											<br/>
											<div style="font-weight:normal;padding-top:15px;">
												<span style="styBoldText">(1)</span>First name
												<span style="width:12mm;"/>Last name
											</div>
										</th>
										<th class="styTableCellHeader" rowspan="2" scope="col" style="min-width:24mm;
									    width:30.2mm;border-right-width:1px;vertical-align:top;">
											<span style="font-weight:normal">
												<b>(2)</b><span style="width:.5mm"/>
												Social security number
											</span>														
										</th>
										<th class="styTableCellHeader" rowspan="2" scope="col" style="min-width:24mm;
									    width:25.6mm;border-right-width:1px;vertical-align:top;">
											<span style="font-weight:normal;">
												<b>(3)</b><span style="width:.5mm"/>
											   Relationship to <br/>you
											</span>
										</th>
										<th class="styTableCellHeader" colspan="2" scope="colgroup" style="width:52.6mm;
									    border-right-width:0px;border-bottom-width:0px;vertical-align:top;">
											<span style="font-weight:normal">
												<b>(4) </b> <img src="{$ImagePath}/1040_Check.gif" alt="Check"/>
												<span style="width:.5mm"/>if qualifies for (see instructions):
											</span>
										</th>
									</tr>
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:19.6mm;font-weight:normal;
									   border-right-width:0px;">Child tax credit
										</th>
										<th class="styTableCellHeader" scope="col" style="width:33mm;font-weight:normal;
										border-right-width:0px;">Credit for other dependents
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="($Print != $Separated) or (count($FormData/DependentDetail) &lt;= 4)">
										<xsl:for-each select="$FormData/DependentDetail">
											<tr>
												<td class="styTableCellTextInherit">
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
												<td class="styTableCellCtrInherit">
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
												<td class="styTableCellTextInherit">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit">
													<input type="Checkbox" class="styCkboxNM">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
															<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
														</xsl:call-template>
														<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for CTC Indicator</xsl:attribute>
													</input>
												</td>
												<td class="styTableCellCtrInherit" style="border-right-width:0px;">
													<input type="Checkbox" class="styCkboxNM">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
															<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
														</xsl:call-template>
														<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for ODC Indicator</xsl:attribute>
													</input>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
								<!-- Table Filler Rows -->
								<xsl:if test="count($FormData/DependentDetail) &lt; 1 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtrInherit">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellTextInherit">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="Checkbox" class="styCkboxNM"  alt="Dependent 1 Eligible for CTC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation1EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 1 Eligible for ODC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation1EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/DependentDetail) &lt; 2 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellTextInherit">
											<span class="styTableCellPad"/>
										</td> 
										<td class="styTableCellCtrInherit">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellTextInherit">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 2 Eligible for CTC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation2EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 2 Eligible for ODC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation2EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/DependentDetail) &lt; 3 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellTextInherit">
											<span class="styTableCellPad"/>
										</td> 
										<td class="styTableCellCtrInherit">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellTextInherit">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 3 Eligible for CTC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation3EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 3 Eligible for ODC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation3EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/DependentDetail) &lt; 4 or ((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
									<tr>
										<td class="styTableCellTextInherit">
											<span class="styTableCellPad"/>
										</td> 
										<td class="styTableCellCtrInherit">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellTextInherit">
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 4 Eligible for CTC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation4EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 4 Eligible for ODC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation4EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if>
								<!-- End of filler rows -->
							</tbody>
						</table>
					  </div>	
					</div>
					<!--</div>
					</div>-->
					<!-- Set Initial Height of Above Table -->
					<xsl:if test="(count($FormData/DependentDetail) &gt;= 4) and ($Print != $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'depdContainerId' "/>
						</xsl:call-template>
					</xsl:if>
						<!-- End Dependents table -->
						<div class="styGenericDiv" style="width:20mm;padding-top:3mm;height:68mm;">
						<div style="width:100%;border:1px solid black;border-bottom:none;border-right:none;border-radius:8px 8px 0px 0px;padding-left:1mm;">
								<span style="float:left;	width:16.5mm;padding-left:2mm;">Attach</span>
							</div>
							<div style="width:100%;border-left:1px solid black;border-right:none;padding-left:3mm;">
								<span style="float:left;width:16.5mm;">Sch. B if</span>
							</div>
							<div style="width:100%;border:1px solid black;border-top:none;border-right:none;border-radius:0px 0px 8px 8px;padding-left:3mm;">
								<span style="float:left;width:16.5mm;">required.</span>
							</div>					
							<div style="height:3mm;"></div>						
							<div style="width:100%;border:1px solid black;border-bottom:none;border-radius:8px 8px 0px 0px;padding-top:1mm;padding-left:1mm;font-family:Arial;">
								<strong>Standard Deduction for &ndash;</strong><br />
								<span style="width:1.5mm;height:5mm;float:left;">&#8226;</span>
								<span style="float:left;width:16.5mm;">Single or Married filing separately, $12,400</span>
							</div>
							<div style="width:100%;border-left:1px solid black;border-right:1px solid black;padding-left:1mm;font-family:Arial;">
								<span style="width:1.5mm;height:5mm;float:left;">&#8226;</span>
								<span style="float:left;width:16.5mm;">Married filing jointly or Qualifying widow(er), $24,800</span>
							</div>
							<div style="width:100%;border-left:1px solid black;border-right:1px solid black;padding-left:1mm;font-family:Arial;">
								<span style="width:1.5mm;height:5mm;float:left;">&#8226;</span>
								<span style="float:left;width:16.5mm;">Head of household, $18,650</span>
							</div>
							<div style="width:100%;border:1px solid black;border-top:none;border-radius:0px 0px 8px 8px;padding-left:1mm;font-family:Arial;">
								<span style="width:1.5mm;height:5mm;float:left;">&#8226;</span>
								<span style="float:left;width:16.5mm;">If you checked any box under <span style="font-style:italic;display:inline">Standard Deduction,</span> see instructions.</span>
							</div>
						</div>
						<!-- Line 1 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm">1</div>
							<div class="sty1040Desc">
								Wages, salaries, tips, etc. Attach Form(s) W-2
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 1 - Wages Not Shown Lit Only Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/WagesSalariesAndTipsAmt/@wagesNotShownLitOnlyCd"/>
								</xsl:call-template>
								<span class="sty1040DotLn">...............</span>
							</div>
							<div class="sty1040RightNumBox">1</div>
							<div class="sty1040AmountBox">
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
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="border-top:1px solid black;border-left:2px solid white;padding-left:1mm;margin-left:-2px;margin-right:2px;">2a</div>
							<div class="sty1040Desc" style="width:31mm;">Tax-exempt interest <span class="sty1040DotLn">.</span></div>
							<div class="sty1040RightNumBox">2a</div>
							<div class="sty1040AmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;font-family:Arial Narrow;">Taxable interest. Attach Sch. B if required <span class="sty1040DotLn">..</span></div>
							<div class="sty1040RightNumBox">2b</div>
							<div class="sty1040AmountBox" style="width:29mm;">
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
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="border-bottom:1px solid black;border-left:2px solid white;margin-left:-2px;margin-right:2px;padding-left:1mm">3a</div>
							<div class="sty1040Desc" style="width:31mm;">
								Qualified dividends
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3a -  Qualified Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBox">3a</div>
							<div class="sty1040AmountBox" style="border-right-width:1px;">
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
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;font-family:Arial Narrow">
								Ordinary dividends. Attach Sch. B if required
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBox">3b</div>
							<div class="sty1040AmountBox">
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
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm">4a</div>
							<div class="sty1040Desc" style="width:31mm;">IRA distributions <span class="sty1040DotLn">..</span></div>
							<div class="sty1040RightNumBox">4a</div>
							<div class="sty1040AmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;">
								Taxable amount
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsLiteralCd"/>
								</xsl:call-template>
								<span class="sty1040DotLn">......</span>
							</div>
							<div class="sty1040RightNumBox">4b</div>
							<div class="sty1040AmountBox">
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
						<!-- Line 5 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">5a</div>
							<div class="sty1040Desc" style="width:31mm;">Pensions and annuities</div>
							<div class="sty1040RightNumBox">5a</div>
							<div class="sty1040AmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;">
								Taxable amount
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5b - Pensions and Annuities Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5b - Foreign Employer Pension Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 5b - Taxable Foreign Pensions Total Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
								</xsl:call-template>
								<span class="sty1040DotLn">....</span>
							</div>
							<div class="sty1040RightNumBox">5b</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm">6a</div>
							<div class="sty1040Desc" style="width:31mm;">
								Social security benefits
							</div>
							<div class="sty1040RightNumBox">6a</div>
							<div class="sty1040AmountBox" style="border-right-width:1px;">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 6a - Social Security Benefits Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
								</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040Desc" style="width:49mm;">Taxable amount <span class="sty1040DotLn">......</span></div>
							<div class="sty1040RightNumBox">6b</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableSocSecAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm">7</div>
							<div class="sty1040Desc">
								Capital gain or (loss). Attach Schedule D if required. If not required, check here 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 7 - Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 7 - Form 8814 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
								</xsl:call-template>
								<span style="float:right;">
									<span class="sty1040DotLn" style="float:none;margin-right:-3px;">.</span>
									<span style="width:4px;"/>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/> 
									<input type="checkbox" class="styCkboxNM" style="margin-right:6px;"
										alt="Schedule D not required">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
											<xsl:with-param name="BackupName">IRS1040CapitalDistributionInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040RightNumBox">7</div>
							<div class="sty1040AmountBox">
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
						<!-- Line 8 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm">8</div>
							<div class="sty1040Desc">
								Other income from Schedule 1, line 9
								<span class="sty1040DotLn">..................</span>
							</div>
							<div class="sty1040RightNumBox">8</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">9</div>
							<div class="sty1040Desc">
								Add lines 1, 2b, 3b, 4b, 5b, 6b, 7, and 8. This is your <strong>total income</strong>
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">........</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox">9</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm">10</div>
							<div class="sty1040Desc">
								Adjustments to income: 
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 10a -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">a</div>
							<div class="sty1040Desc" style="width:87mm;">
								From Schedule 1, line 22
								<span class="sty1040DotLn" style="padding-right:1px;">.............</span>
							</div>
							<div class="sty1040RightNumBox">10a</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>			
						<!-- Line 10b -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-top:.75mm;padding-left:4mm;">b</div>
							<div class="sty1040Desc" style="width:87mm;font-family:arial;font-size:7.25pt;
								padding-top:.75mm;">
								Charitable contributions if you take the standard deduction. See instructions
							</div>
							<div class="sty1040RightNumBox">10b</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CharitableContributionAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 10c -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">c</div>
							<div class="sty1040Desc">
								Add lines 10a and 10b. These are your <b>total adjustments to income</b>
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">.......</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox">10c</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsToIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>									
						<!-- Line 11 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;padding-top:.3mm">11</div>
							<div class="sty1040Desc" style="padding-top:0mm">
								Subtract line 10c from line 9. This is your <strong>adjusted gross income</strong>
								<span style="width:4px"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11 - Excluded Section 933 Puerto Rico Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11 - Excluded Section 933 Puerto Rico Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
								</xsl:call-template>
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">......</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox">11</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 12 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="border-top:1px solid black;
								border-bottom:1px solid black;border-left:2px solid white;padding-left:1mm;margin-left:-2px;
								margin-right:2px;">12</div>
							<div class="sty1040Desc" style="width:123mm;padding-top:0.7mm;">
								<strong>Standard deduction or itemized deductions </strong> (from Schedule A) 
								<span class="sty1040DotLn">.........</span>
							</div>
							<div class="sty1040RightNumBox">12</div>
							<div class="sty1040AmountBox">
								<!--<span style="float:left;">-->
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 12 - Modified Standard Deduction Ind</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
									</xsl:call-template>
								<!--</span>-->
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">13</div>
							<div class="sty1040Desc" style="width:123mm;font-family:Arial;">
								Qualified business income deduction. Attach Form 8995 or Form 8995-A
								<span class="sty1040DotLn">..........</span>
							</div>
							<div class="sty1040RightNumBox">13</div>
							<div class="sty1040AmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">14</div>
							<div class="sty1040Desc">
								Add lines 12 and 13
								<span class="sty1040DotLn">........................</span>
							</div>
							<div class="sty1040RightNumBox">14</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm;">15</div>
							<div class="sty1040Desc">
								<strong>Taxable income. </strong> Subtract line 14 from line 11. If zero or less, enter -0-
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Schedule Q Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
								</xsl:call-template>
								<span class="sty1040DotLn">....</span>
							</div>
							<div class="sty1040RightNumBoxNBB">15</div>
							<div class="sty1040AmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End -->
					<!--</div>-->
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;padding-top:.5mm">
						<span style="font-weight:bold;font-family:Arial;">For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:13mm;font-size:6.5pt;">Cat. No. 11320B</span>
						<span style="float:right;font-size:6.5pt;">Form <strong>1040</strong> (2020)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 1040 (2020)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;overflow:visible;">
						<div class="styGenericDiv" style="width:20mm;padding-top:38mm;height:84mm;">
							<div style="width:100%;border:1px solid black;border-radius:8px;padding-top:1mm;
								padding-left:1mm;font-family:Arial;">
								<span style="width:1.5mm;height:5mm;float:left;">&#8226;</span>
								<span style="float:left;width:16.5mm;">If you have a qualifying child, attach Sch. EIC.</span>
								<br />
								<span style="width:1.5mm;height:5mm;float:left;">&#8226;</span>
								<span style="float:left;width:16.5mm;">If you have nontaxable combat pay, see instructions.</span>
							</div>
						</div>
						<!-- Line 16 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm;padding-top:1mm" >16</div>
							<div class="sty1040Desc" style="width:123mm;font-family:Arial Narrow;">
								<span style="font-weight:bold;font-family:Verdana;">Tax </span> (see instructions). Check if any from Form(s): 
								<span style="font-weight:bold;font-family:Verdana;width:3mm;text-align:center;">1</span>
								<input type="checkbox" class="styCkboxNM" alt="Form 8814 Ind" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">F1040Form8814Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:1mm;font-family:Arial;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">F1040Form8814Ind</xsl:with-param>
									</xsl:call-template>8814</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
								</xsl:call-template>
								<span style="width:1mm;height:3mm;"/>
								<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">2</span>
								<input type="checkbox" class="styCkboxNM" alt="Form 4972 Ind" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">F1040Form4972Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:1mm;font-family:Arial;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">F1040Form4972Ind</xsl:with-param>
									</xsl:call-template>4972</label>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
									</xsl:call-template>
								<span style="width:1mm;height:3mm;"/>
								<span style="font-weight:bold;font-family:Verdana;width:3.5mm;text-align:center;">3</span>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;" alt="Other Tax Amounts">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
										<xsl:with-param name="BackupName">F1040OtherTaxAmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:15mm;border-bottom:1px solid black;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
									</xsl:call-template>
									<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="count($FormData/OtherTaxAmtGrp) &gt;= 2">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Groups</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span class="sty1040DotLn">....</span>
							</div>
							<div class="sty1040RightNumBox">16</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">17</div>
							<div class="sty1040Desc">
								Amount from Schedule 2, line 3
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">...................</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox">17</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdditionalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 18 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">18</div>
							<div class="sty1040Desc">
								Add lines 16 and 17
								<span class="sty1040DotLn">........................</span>
							</div>
							<div class="sty1040RightNumBox">18</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 19 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">19</div>
							<div class="sty1040Desc" style="width:123mm;font-family:Arial;">
								Child tax credit or credit for other dependents
								<span class="sty1040DotLn" style="padding-right:1px;">..................</span>
							</div>
							<div class="sty1040RightNumBox">19</div>
							<div class="sty1040AmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CTCODCAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CTCODCAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">20</div>
							<div class="sty1040Desc">
								Amount from Schedule 3, line 7
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">...................</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox">20</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalNonrefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">21</div>
							<div class="sty1040Desc">
								Add lines 19 and 20
								<span class="sty1040DotLn">........................</span>
							</div>
							<div class="sty1040RightNumBox">21</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 22 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">22</div>
							<div class="sty1040Desc">
								Subtract line 21 from line 18. If zero or less, enter -0-
								<span class="sty1040DotLn">.............</span>
							</div>
							<div class="sty1040RightNumBox">22</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 23 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">23</div>
							<div class="sty1040Desc">
								Other taxes, including self-employment tax, from Schedule 2, line 10
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 23 - Deferred Tax 1 Total Tax Deferred Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/TotalTaxDeferredAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 23 - Deferred Tax 1 Expatriation Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/ExpatriationCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 23 - Deferred Tax 2 Total Tax Deferred Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/TotalTaxDeferredAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 23 - Deferred Tax 2 Expatriation Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/ExpatriationCd"/>
								</xsl:call-template>
								<span class="sty1040DotLn">.....</span>
							</div>
							<div class="sty1040RightNumBox">23</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 24 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">24</div>
							<div class="sty1040Desc">
								Add lines 22 and 23. This is your <strong>total tax </strong> 
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">................</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBox">24</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 25 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">25</div>
							<div class="sty1040Desc">
								Federal income tax withheld from: 
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 25a -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;">a</div>
							<div class="sty1040Desc" style="width:87mm;">
								Form(s) W-2
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 25a - Form W-2 Tax Withheld</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/FormW2WithheldTaxAmt"/>
								</xsl:call-template>								
								<span class="sty1040DotLn" style="padding-right:1px;">................</span>
							</div>
							<div class="sty1040RightNumBox">25a</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FormW2WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>			
						<!-- Line 25b -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:.75mm;">b</div>
							<div class="sty1040Desc" style="width:87mm;">
								Form(s) 1099
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 25b - Form 1099 Tax Withheld</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form1099WithheldTaxAmt"/>
								</xsl:call-template>	
								<span style="width:1mm"/>																	
								<span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form1099WithheldTaxAmt"/>
									</xsl:call-template>
								</span>								
								<span class="sty1040DotLn" style="padding-right:1px;">...............</span>
							</div>
							<div class="sty1040RightNumBox">25b</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Form1099WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 25c -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:4mm;padding-top:.75mm;">c</div>
							<div class="sty1040Desc" style="width:87mm;">
								Other forms (see instructions)
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 25c - Other Tax Withheld</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TaxWithheldOtherAmt"/>
								</xsl:call-template>									
								<span style="width:1mm;"/>
								<span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxWithheldOtherAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm;"/>
								<span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxWithheldOtherAmt"/>
									</xsl:call-template>
								</span>								
								<span class="sty1040DotLn" style="padding-right:1px;">........</span>
							</div>
							<div class="sty1040RightNumBox">25c</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxWithheldOtherAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>																		
						<!-- Line 25d -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:4mm">d</div>
							<div class="sty1040Desc">
								Add lines 25a through 25c
								<span class="sty1040DotLn">......................</span>
							</div>
							<div class="sty1040RightNumBox">25d</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 26 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">26</div>
							<div class="sty1040Desc">
								2020 estimated tax payments and amount applied from 2019 return
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 26 - Divorced Spouse SSN</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 26 - Divorced Literal Cd</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
									</xsl:call-template>	
									<span class="sty1040DotLn">.......</span>
							</div>
							<div class="sty1040RightNumBox">26</div>
							<div class="sty1040AmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/EstimatedTaxPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 27 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="border-top:1px solid black;
								border-bottom:1px solid black;border-left:2px solid white;margin-left:-2px;
								margin-right:2px;padding-left:1mm;">27</div>
							<div class="sty1040Desc" style="width:87mm;padding-top:0.7mm;">
								Earned income credit (EIC) 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - Earned Income Credit Eligibility Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - EIC Prior Year Earned Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - EIC Prior Year Earned Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode"
										select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - Nontaxable Combat Pay Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/NontaxableCombatPayCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - Nontaxable Combat Pay Election Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
										select="$FormData/NontxCombatPayElectionAmt"/>
								</xsl:call-template>
								<span class="sty1040DotLn" style="padding-right:1px;">.........</span>
							</div>
							<div class="sty1040RightNumBox">27</div>
							<div class="sty1040AmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/EarnedIncomeCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 28 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">28</div>
							<div class="sty1040Desc" style="width:87mm;">
								Additional child tax credit. Attach Schedule 8812
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 28 - Additional Child Prior Year Earned Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 28 - Additional Child Prior Year Earned Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeAmt"/>
								</xsl:call-template>
								<span class="sty1040DotLn" style="padding-right:1px;">....</span>
							</div>
							<div class="sty1040RightNumBox">28</div>
							<div class="sty1040AmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 29 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">29</div>
							<div class="sty1040Desc" style="width:87mm;">
								American opportunity credit from Form 8863, line 8
								<span class="sty1040DotLn" style="padding-right:1px;">.....</span>
							</div>
							<div class="sty1040RightNumBox">29</div>
							<div class="sty1040AmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundableAmerOppCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 30 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">30</div>
							<div class="sty1040Desc" style="width:87mm;">
								Recovery rebate credit. See instructions
								<span class="sty1040DotLn" style="padding-right:1px;">.........</span>
							</div>
							<div class="sty1040RightNumBox">30</div>
							<div class="sty1040AmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RecoveryRebateCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RecoveryRebateCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>						
						<!-- Line 31 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1mm;">31</div>
							<div class="sty1040Desc" style="width:87mm;">
								Amount from Schedule 3, line 13
								<span class="sty1040DotLn" style="padding-right:1px;">...........</span>
							</div>
							<div class="sty1040RightNumBox">31</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 32 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm;">32</div>
							<div class="sty1040Desc">
								Add lines 27 through 31. These are your <strong>total other payments and refundable credits </strong>
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">.</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span> 
							</div>
							<div class="sty1040RightNumBox">32</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 33 -->
						<div class="sty1040LN">
							<div class="styLNLeftNumBox" style="padding-left:1mm">33</div>
							<div class="sty1040Desc">
								Add lines 25d, 26, and 32. These are your <strong>total payments </strong> 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32 - Form 8689 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 32 - Form 8689 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
								</xsl:call-template>
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">.........</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBoxNBB">33</div>
							<div class="sty1040AmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end -->
					</div>
					<!-- Refund -->
					<div class="styGenericDiv" style="width:20mm;height:20mm;">
						<span style="font-weight:bold;font-size:10pt;">Refund</span>
						<br /><br />
						<span style="font-family:Arial;">
							Direct deposit? See instructions.
						</span>
					</div>
					<!-- Line 34 -->
					<div class="sty1040LN">
						<div class="styLNLeftNumBox" style="padding-left:1mm">34</div>
						<div class="sty1040Desc">
							If line 33 is more than line 24, subtract line 24 from line 33. This is the amount you <strong>overpaid </strong> 
						</div>
						<div class="sty1040RightNumBox">34</div>
						<div class="sty1040AmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 35a -->
					<div class="sty1040LN">
						<div class="styLNLeftNumBox" style="padding:.75mm 0mm .5mm 1mm;">35a</div>
						<div class="sty1040Desc">
							Amount of line 34 you want <strong>refunded to you. </strong> If Form 8888 is attached, check here
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
							</xsl:call-template>
							<span style="float:right;">
								<span class="sty1040DotLn" style="float:none;margin-right:-2px;">.</span>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:8px;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" 
									alt="Form 8888 attached">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
										<xsl:with-param name="BackupName">IRS1040Form8888Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="sty1040RightNumBox">35a</div>
						<div class="sty1040AmountBox">
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
					<!-- Line 35b, 35c -->
					<div class="sty1040LN">
						<div class="styLNLeftNumBox">
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:1px;"/>b</div>
						<div class="sty1040Desc">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm">
							   Routing number
							</span>
							<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
							<span style="width:27px;"/>
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:4px;"/>
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
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
									<xsl:with-param name="BackupName">IRS1040BankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
								Checking
							</label>
							<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;">
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
						<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty1040AmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 35d -->
					<div class="sty1040LN">
						<div class="styLNLeftNumBox">
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:1px;"/>d</div>
						<div class="sty1040Desc" style="height:4.4mm;">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm">
							   Account number
							</span>
							<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1040RightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty1040AmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Line 36 -->
					<div class="sty1040LN">
						<div class="styLNLeftNumBox">36</div>
						<div class="sty1040Desc" style="width:87mm;">
							<span style="display:inline;font-family:Arial;">Amount of line 34 you want <strong>applied to your 2021 estimated tax </strong></span>
							<span style="float:right">
								<span class="sty1040DotLn" style="float:none;margin-right:-2px;">..</span>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:8px;"/>
							</span>
						</div>
						<div class="sty1040RightNumBoxNBB">36</div>
						<div class="sty1040AmountBoxNBB">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040RightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty1040AmountBoxNBB" style="">&nbsp;</div>
					</div>
					<!-- You Owe -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:20mm;height:12mm;">
							<span style="font-weight:bold;font-size:9pt;">Amount <br />You Owe</span>
							<span style="font-family:Arial;">
									For details on how to pay, see instructions.
								</span>							
						</div>
						<!-- Line 37 -->
						<div class="sty1040LN" style="height:10mm;">
							<div class="styLNLeftNumBox">37</div>
							<div class="sty1040Desc">
								Subtract line 33 from line 24. This is the <strong>amount you owe now</strong>  
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">........</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span><br/>
							</div>
							<div class="sty1040RightNumBox">37</div>
							<div class="sty1040AmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBox"/>
							<div class="sty1040Desc">
								<b>Note:</b> Schedule H and Schedule SE filers, line 37 may not represent all of the taxes you owe for 2020. See Schedule 3, line 12e, and its instructions for details.
							</div>
							<div class="sty1040RightNumBoxNBB" style="height:6mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="height:6mm;background-color:lightgrey;">&nbsp;</div>							
						</div>
						<!-- Line 38 -->
						<div class="sty1040LN" style="height:6mm;">
							<div class="styLNLeftNumBox" style="margin-top:2mm;">38</div>
							<div class="sty1040Desc" style="width:87mm;margin-top:2mm;">
								Estimated tax penalty (see instructions)
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">........</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span>
							</div>
							<div class="sty1040RightNumBoxNBB" style="margin-top:2mm;">38</div>
							<div class="sty1040AmountBoxNBB" style="margin-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040RightNumBoxNBB" style="height:6mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty1040AmountBoxNBB" style="height:6mm;background-color:lightgrey;">&nbsp;</div>
						</div>
					</div>
					<!-- Third Party -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:20mm;height:14mm;">
							<span style="font-weight:bold;font-size:8pt;">Third Party Designee</span>
							<br />
						</div>
						<div style="width:167mm;height:7mm;">
							<span style="width:105mm;padding-left:4mm">Do you want to allow another person to discuss this return with the IRS? See <br/>instructions
								<span style="float:right">
									<span class="sty1040DotLn" style="float:none;margin-right:-2px;">....................</span>
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
								</span>
							</span>					  
							<div style="width:62mm;">
								<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" 
									alt="Third Party Designee Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>Yes. </label> <span> Complete below.</span>
							  <span style="width:3mm;"/>									
								<input type="checkbox" class="styCkboxNM" style="margin-right:2px;"
									alt="Third Party Designee Ind No">
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
							</div>
						</div>
						<div style="width:167mm;height:7mm;">
							<span style="padding-left:4mm;width:70mm;">
								Designee's <br /> name 
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
								<span style="width:8px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</span>
							<span style="width:11mm;">
								Phone <br /> no. 
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
							</span>
							<span style="width:26mm;">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePhoneNum"/>
								</xsl:call-template>
							</span>
							<span style="width:30mm;">
								Personal identification <br /> number (PIN) 
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:8px;"/>
							</span>
							<span style="width:20mm;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Sign Here -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:20mm;height:28mm;">
							<!--<span style="font-weight:bold;font-size:10pt;">Third Party Designee</span>-->
							<span style="font-weight:bold;font-size:10pt;">Sign Here</span>
							<br /><br /><br />
							Joint return? See instructions. Keep a copy for your records.
						</div>
						<div style="padding-top:9.5mm;padding-left:8px;padding-right:0px;float:left;clear:none;width:4mm;margin-left:-2px;margin-right:2px;">
							<img src="{$ImagePath}/1040_Bullet_SuperLg.gif" alt="Right pointing arrowhead image" height="48" width="10"/>
						</div>
						<div style="float:left;clear:none;width:163mm;">
							<div class="" style="width:163mm;font-size:6pt;font-family:Arial;float:left;clear:none;">
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
										<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">
											If the IRS sent you an Identity Protection PIN, enter it here </span>
										<br/>
										<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
											(see inst.)
											<img src="{$ImagePath}/1040_Bullet.gif" 
												alt="Right pointing arrowhead image"/>
											<span style="width:8px;"/>
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
									<div class="styFNBox" style="height:9mm;width:70mm;padding-top:1.5mm;float:left;
									    clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;height:12mm;float:left;clear:none;">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
									  Date
									</div>
									<div style="height:8mm;width:18mm;padding-top:1.5mm;text-align:center;float:left;
									    clear:none;font-size:7pt;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;height:12mm;float:left;clear:none;">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
									   Spouse's occupation
									</div>
									<div style="height:8mm;width:36mm;padding-top:1.5mm;padding-left:2mm;float:left;
										clear:none;font-family:Arial;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseOccupationTxt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styGenericDiv" style="height:11mm;width:38.5mm;border-left-width:0px;
									font-size:7pt;">
									<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">
										If the IRS sent your spouse an Identity Protection PIN, enter it here </span>
									<br/>
									<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
										(see inst.)
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:8px;"/>
									</span>
									<span style="width:60%;padding-top:0px;padding-right:5mm;float:right;text-align:center;
										padding-top:0.8mm">
										<div class="styLNCtrNumBox" style="height:3mm;width:23mm;border-top-width:1px;
											font-weight:normal">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseIdentityProtectionPIN"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
							</div>
							<div class="" style="width:163mm;float:left;clear:none;border-top:1px solid black;">
								<div style="width:69.6mm;float:left;font-size:7pt;">
									Phone no. 
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/Filer/PhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div style="width:92.5mm;float:left;padding-left:2mm;font-size:7pt;
									border-left:1px solid black;">
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
			<div class="" style="width:187mm;font-size:7pt;float:none;clear:both;height:auto;
				border-top:1px solid black;">
				<div style="width:22.75mm;padding-top:2mm;float:left;clear:none;">
					<span class="styMainTitle" style="font-size:11pt;">
						Paid
						Preparer
						Use Only
					</span>
				</div>
				<div style="width:164mm;float:left;clear:none;display:block;">
					<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;
						border-width:0px 0px 1px 0px;">
						<div class="styFNBox" style="height:8mm;width:52mm;padding-top:0mm;
							border-right:1 solid black;">
							<span style="display:inline;font-size:7pt;">Preparer's name</span><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styFNBox" style="height:8mm;width:41mm;padding-top:0mm;
							border-right:1 solid black;padding-left:1mm;font-size:7pt;">
							Preparer's signature
						</div>
						<div class="styFNBox" style="height:8mm;width:22mm;padding-top:0mm;padding-left:1mm;
							border-right:1 solid black;">
							<span style="font-size:7pt;">Date</span>
							<br />
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styFNBox" style="height:8mm;width:20mm;padding-left:1mm;">
							<span style="font-size:7pt;">PTIN</span>
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
						<div class="styLNDesc" style="height:8mm;width:29mm;padding-top:.5mm;padding-bottom:0mm;
							padding-left:1mm;font-family:Arial;">
							<span style="font-size:7pt;">Check if:</span><br/>
								<input class="styCkbox" type="checkbox" alt="Self Employed Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
									</xsl:call-template>
									<span style="width:4px;"/>Self-employed
								</label>
						</div>
					</div>
					<div style="width:164mm;height:9.5mm;float:left;clear:none;border-style:solid;
						border-color:black;border-width:0px 0px 0px 0px;">
						<div class="styFNBox" style="height:9.5mm;width:124mm;border-right:1px solid black;">
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
						<div class="styFNBox" style="height:9.5mm;width:40mm;padding-left:1mm;
							border-right:0px solid black;word-break:break-all;"> Phone no. 
 							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">Phone</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
								<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="" style="width:164mm;border-top:1px solid black;;border-right-width:0px;float:left;
						clear:none;">
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
				
			</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;padding-top:.5mm">
						Go to <span style="font-style:italic">www.irs.gov/Form1040 </span> for instructions and the latest information.
						<span style="float:right;font-size:6.5pt;">Form <strong>1040</strong> (2020)</span>
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
							<xsl:with-param name="Desc">Top Right Margin - Filed Pursuant To Sect 30191002 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/FiledPursuantToSect30191002Cd"/>
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
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Standard Deduction - Total Exempt Primary And Spouse Cnt</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Age/Blindness - Total Boxes Checked Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalBoxesCheckedCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dependents - Children Who Lived With You Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ChldWhoLivedWithYouCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dependents - Other Dependents Listed Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherDependentsListedCnt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dependents - Total Exemptions Count</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
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
							<xsl:with-param name="Desc">Line 5b - Foreign Employer Pension Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ForeignEmployerPensionCd"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 5b - Taxable Foreign Pensions Total Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableForeignPensionsTotalAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5b - Pensions Annuities Literal Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt/@pensionsAnnuitiesLiteralCd"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 6a - Social Security Benefits Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 7 - Form 8814 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 7 - Form 8814 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 11 - Excluded Sect 933 Puerto Rico Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 11 - Excluded Sect 933 Puerto Rico Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 12 - Modified Standard Deduction Ind</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
						</xsl:call-template>	
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 15 - Schedule Q Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
						</xsl:call-template>
						<!-- OtherTaxAmtGrp separate repeating -->
						<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 23 - Deferred Tax 1 Total Tax Deferred Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/TotalTaxDeferredAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 23 - Deferred Tax 1 Expatriation Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/ExpatriationCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 23 - Deferred Tax 2 Total Tax Deferred Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/TotalTaxDeferredAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 23 - Deferred Tax 2 Expatriation Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[2]/ExpatriationCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 25a - Form W-2 Tax Withheld</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/FormW2WithheldTaxAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 25b - Form 1099 Tax Withheld</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/Form1099WithheldTaxAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 25c - Other Tax Withheld</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TaxWithheldOtherAmt"/>
						</xsl:call-template>						
						<xsl:if test="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" 
									scope="row">Line 26 - Divorced Spouse SSN:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" 
										select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
									</xsl:call-template>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 26 - Divorced Literal Cd</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 27 - Earned Income Credit Eligibility Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 27 - EIC Prior Year Earned Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 27 - EIC Prior Year Earned Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 27 - Nontaxable Combat Pay Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NontaxableCombatPayCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 27 - Nontaxable Combat Pay Election Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 28 - Additional Child Prior Year Earned Income Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 28 - Additional Child Prior Year Earned Income Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmAdditonalChldTxGrp/PriorYearEarnedIncomeAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 32 - Form 8689 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 32 - Form 8689 Amount</xsl:with-param>
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
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:67.4mm;text-align:left;padding-left:1mm;padding-top:0mm;">
										<span style="font-size:7pt;">Dependents <span style="font-weight:normal">(see instructions):</span>
											<br/>
											<span style="styBoldText">(1)</span>
											<span style="font-weight:normal;padding-top:15px">
												<span style="width:1mm"/>First name
												<span style="width:12mm;"/>Last name
											</span>
										</span>
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="min-width:24mm;width:27.2mm;border-right-width:1px;vertical-align:top;">
										<span style="font-weight:normal">
											<b>(2)</b><span style="width:.5mm"/>
											Social security number
										</span>														
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:30.6mm;border-right-width:1px;vertical-align:top;">
										<span style="font-weight:normal;">
											<b>(3)</b><span style="width:.5mm"/>
										   Relationship to you
										</span>
									</th>
									<th class="styDepTblCell" colspan="2" scope="colgroup" style="width:61.6mm;border-right-width:0px;vertical-align:top;">
										<span style="font-weight:normal">
											<b>(4) </b> <img src="{$ImagePath}/1040_Check.gif" alt="Check"/><span style="width:.5mm"/>
										   if qualifies for (see instructions):
									   </span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:28.6mm;font-weight:normal;">
										Child tax credit
									</th>
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;border-right-width:0px;">
										Credit for other dependents
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DependentDetail">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<div style="float:left;clear:none;width:5mm;">
												<span style="text-align:right;float:left;width:4.25mm;font-weight:bold;" class="styGenericDiv">
													<xsl:number value="position()" format="1"/>
												</span>
											</div>
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
										<td class="styTableCellCtrInherit">
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
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="Checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for CTC Indicator</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="Checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">IRS1040DependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for ODC Indicator</xsl:attribute>
											</input>
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
						<span class="styRepeatingDataTitle">Line 16(3) - Other Tax Groups</span>
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
