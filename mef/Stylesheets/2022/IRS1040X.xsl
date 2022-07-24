<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 06/17/2021 -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS1040XStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040X" />
	<xsl:template match="/">
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
				<meta name="Description" content="IRS Form 1040-X" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle" />
						<xsl:call-template name="IRS1040XStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040X">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:13.5mm;">
							<span class="" style="margin-top:3.5mm;margin-left:-1mm;margin-right:-1mm;;transform:rotate(270deg);float:left;">Form</span>
							<span class="styFormNumber" style="margin-top:1mm;">1040-X</span>
							<br />
							<span class="styAgency">
								(Rev. July 2021)
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
						</div>
						<div class="styFTBox" style="width:127mm;height:13.5mm;padding-top:0.5mm;">
							Department of the Treasury&mdash;Internal Revenue Service
							<span class="styFMT" style="font-size:12pt;padding-bottom:0.5mm;">Amended U.S. Individual Income Tax Return</span>
							<br />
							<span style="font-weight:bold;">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>Go to
								<span style="font-style:italic">www.irs.gov/Form1040X</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:13.5mm;padding-top:0.5mm;">
							<div style="min-height:4.5mm;">
								<xsl:for-each select="$FormData/ReasonForFilingAmendedReturnCd">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Top Right Margin - Reason for Filing Amended Return Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Primary Filer Death Date</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Spouse Death Date</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Power of Attorney Signed By Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Power of Attorney Name</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Personal Representative Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Top Right Margin - TAS Case Type Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/TASCaseTypeCd"/>
								</xsl:call-template>
							</div>
							<div class="styOMB" style="height:auto;font-size:7pt;border:none;">OMB No. 1545-0074</div>
						</div>
					</div>
					<!-- Tax Period -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;padding-top:2px;">
						<span style="font-weight:bold;font-size:8pt;">This return is for calendar year </span>
						<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2021"></xsl:with-param>
								<xsl:with-param name="BackupName">F1040XAmendedReturnForCalendarYrCd[2021]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:0.7mm;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2021"></xsl:with-param>
								<xsl:with-param name="BackupName">F1040XAmendedReturnForCalendarYrCd[2021]</xsl:with-param>
							</xsl:call-template>2021</label>
						<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2020"></xsl:with-param>
								<xsl:with-param name="BackupName">F1040XAmendedReturnForCalendarYrCd[2020]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:0.7mm;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2020"></xsl:with-param>
								<xsl:with-param name="BackupName">F1040XAmendedReturnForCalendarYrCd[2020]</xsl:with-param>
							</xsl:call-template>2020</label>
						<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2019"></xsl:with-param>
								<xsl:with-param name="BackupName">F1040XAmendedReturnForCalendarYrCd[2019]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:0.7mm;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2019"></xsl:with-param>
								<xsl:with-param name="BackupName">F1040XAmendedReturnForCalendarYrCd[2019]</xsl:with-param>
							</xsl:call-template>2019</label>
						<input type="checkbox" class="styCkboxNM" style="margin-left:4mm;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2018"></xsl:with-param>
								<xsl:with-param name="BackupName">F1040XAmendedReturnForCalendarYrCd[2018]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label style="padding-left:0.7mm;">
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2018"></xsl:with-param>
								<xsl:with-param name="BackupName">F1040XAmendedReturnForCalendarYrCd[2018]</xsl:with-param>
							</xsl:call-template>2018</label>
						<br />
						<span style="font-size:8pt;"><strong>Other year. </strong> Enter one: calendar year </span>
						<span style="width:20mm;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnForCalendarYrCd"/>
							</xsl:call-template>
						</span>
						<span style="font-size:8pt;"><strong>or </strong> fiscal year (month and year ended): </span>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv">
						<div class="styIRS1040XHeaderCell" style="width:78mm;">
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
						<div class="styIRS1040XHeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:46mm;border-right-width:0px;">
							<strong style="font-family:Arial;">Your social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040XHeaderCell" style="width:78mm;">
							If joint return, spouse's first name and middle initial <br /> 
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:63mm;">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:46mm;border-right-width:0px;">
							<strong style="font-family:Arial;">Spouse's social security number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040XHeaderCell" style="width:129mm;height:10.5mm;">
							<span style="font-family:Arial;">Current home address (number and street). If you have a P.O. box, see instructions.</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:12mm;height:10.5mm;font-family:Arial;">
							Apt. no. <br /> &nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:45.9mm;height:10.5mm;border-right-width:0px;word-break:break-all;">
							<span style="font-family:Arial;">Your phone number</span> <br />
							<xsl:choose>
								<xsl:when test="$FormData/PhoneNum">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/PhoneNum"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/ForeignPhoneNum">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignPhoneNum"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PhoneNum</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040XHeaderCell" style="width:187mm;border-right-width:0px;">
							<span style="font-family:Arial;">City, town or post office, state, and ZIP code. If you have a foreign address, also complete spaces below. See instructions.</span><br />
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
						<div class="styIRS1040XHeaderCell" style="width:81mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign country name</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm" select="true()"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:56mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign province/state/county</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040XHeaderCell" style="width:50mm;height:10.5mm;font-family:Arial;border-right-width:0px;">
							<span style="font-family:Arial;">Foreign postal code</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
					</div>
					<!-- Changes section -->
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:107mm;height:10mm;padding-right:5mm;padding-top:2px;">
							<strong>Amended return filing status. </strong> You <strong>must</strong> check one box even if you are not changing your filing status. 
							<strong>Caution: </strong> In general, you can't change your filing status from a joint return to separate returns after the due date.
						</div>
						<div class="styGenericDiv" style="width:80mm;height:11mm;padding-top:2px;padding-left:2px;border-left:1px solid black;border-bottom:1px solid black;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsCoverageInd"/>
									<xsl:with-param name="BackupName">F1040XHealthCareRspnsCoverageInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="font-weight:bold;display:inline;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/HealthCareRspnsCoverageInd"/>
									<xsl:with-param name="BackupName">F1040XHealthCareRspnsCoverageInd</xsl:with-param>
								</xsl:call-template>Full-year health care coverage</label> 
							(or, for amended 2018 returns only, exempt). </span> 
							If amending a 2019 or later return, leave blank. See instructions.
						</div>
					</div>
					<div class="styStdDiv" style="padding-top:2px;padding-bottom:4px;">
						<input type="checkbox" class="styCkboxNM" style="margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[1]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[1]</xsl:with-param>
							</xsl:call-template>Single
						</label> 
						<input type="checkbox" class="styCkboxNM" style="margin-left:20px;margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[2]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="2"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[2]</xsl:with-param>
							</xsl:call-template>Married filing jointly
						</label> 
						<input type="checkbox" class="styCkboxNM" style="margin-left:20px;margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[3]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[3]</xsl:with-param>
							</xsl:call-template>Married filing separately (MFS)
						</label> 
						<input type="checkbox" class="styCkboxNM" style="margin-left:20px;margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[4]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="4"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[5]</xsl:with-param>
							</xsl:call-template>Head of household (HOH)
						</label> 
						<input type="checkbox" class="styCkboxNM" style="margin-left:20px;margin-right:4px;">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[5]</xsl:with-param>
							</xsl:call-template>
						</input>							
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/IndividualReturnFilingStatusCd"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
								<xsl:with-param name="BackupName">F1040XIndividualReturnFilingStatusCd[4]</xsl:with-param>
							</xsl:call-template>Qualifying widow(er) (QW)</label> 						
					</div>
					<div class="styStdDiv" style="padding-bottom:2px;">
						If you checked the MFS box, enter the name of your spouse. If you checked the HOH or QW box, enter the child's name if the qualifying <br /> 
						person is a child but not your dependent. <img src="{$ImagePath}/56_Bullet.gif" alt="Right arrow"/><span style="width:4px"/> 
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
					<!-- Column Headers -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="sty1040XDesc" style="padding-top:4.5mm;font-size:8pt;text-align:center;height:12mm;">Use Part III on the back to explain any changes</div>
						<div class="sty1040XRightNumBox" style="height:14mm;border-left-width:0px;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:14mm;padding-top:0.5mm;text-align:center;border-bottom-width:0px;">
							<strong>A. Original amount</strong> <br />
							reported or as previously adjusted (see instructions)
						</div>
						<div class="sty1040XAmtBox" style="height:14mm;padding-top:0.5mm;text-align:center;border-bottom-width:0px;">
							<strong>B. Net change &mdash;</strong> <br />
							amount of increase <br /> or (decrease) &mdash; <br /> explain in Part III
						</div>
						<div class="sty1040XAmtBox" style="height:14mm;padding-top:3.5mm;text-align:center;font-weight:bold;border-bottom-width:0px;">C. Correct <br />amount</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XDesc" style="width:90mm;font-weight:bold;font-size:8pt;height:4.5mm;">Income and Deductions</div>
						<div class="sty1040XRightNumBoxNBB" style="height:4.5mm">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty1040XDesc" style="height:7.5mm;">
							Adjusted gross income. If a net operating loss (NOL) carryback <br /> is included, check here  
							<span style="float:right;">
								<span class="sty1040XDotLn" style="float:none;margin-right:-3px;">..........</span>
								<img src="{$ImagePath}/56_Bullet.gif" alt="Right arrow"/><span style="width:4px"/> 
								<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" alt="Net Operating Loss Carryback included">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossCarrybackInd"/>
										<xsl:with-param name="BackupName">IRS1040XNetOperatingLossCarrybackInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7.5mm;"><br />1</div>
						<div class="sty1040XAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/AdjustedGrossIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/AdjustedGrossIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/AdjustedGrossIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty1040XDesc">
							Itemized deductions or standard deduction
							<span class="sty1040XDotLn">......</span>
						</div>
						<div class="sty1040XRightNumBox">2</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalItemizedOrStandardDedAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalItemizedOrStandardDedAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalItemizedOrStandardDedAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty1040XDesc">
							Subtract line 2 from line 1
							<span class="sty1040XDotLn">...........</span>
						</div>
						<div class="sty1040XRightNumBox">3</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/AGILessDeductionsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/AGILessDeductionsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/AGILessDeductionsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="sty1040XDesc" style="height:7mm;font-family:Arial;">
							Exemptions (amended 2017 or earler returns only). <strong>If changing, </strong><br />
							complete Part I on page 2 and enter the amount from line 29
							<span class="sty1040XDotLn" style="font-family:Verdana;">...</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7mm;"><br />4a</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/ExemptionAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/ExemptionAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/ExemptionAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty1040XDesc" style="font-family:Arial;">
							Qualified business income deduction (amended 2018 or later returns only)
						</div>
						<div class="sty1040XRightNumBox">4b</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/QualifiedBusinessIncomeDedAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/QualifiedBusinessIncomeDedAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/QualifiedBusinessIncomeDedAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty1040XDesc" style="height:7mm;">
							Taxable income. Subtract line 4a or 4b from line 3. If the result <br /> is zero or less, enter -0- 
							<span class="sty1040XDotLn">............</span>
						</div>
						<div class="sty1040XRightNumBoxNBB" style="height:7mm;"><br />5</div>
						<div class="sty1040XAmtBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TaxableIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TaxableIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TaxableIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XDesc" style="width:90mm;font-weight:bold;font-size:8pt;height:4.5mm;">Tax Liability</div>
						<div class="sty1040XRightNumBoxNBB" style="height:4.5mm">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty1040XDesc" style="height:7.7mm;">
							Tax. Enter method(s) used to figure tax (see instructions): <br /> 
							<span style="border-bottom:1px dotted black;width:97%;">
								<xsl:for-each select="$FormData/MethodUsedToFigureTaxCd | $FormData/MethodUsedToFigureTaxTxt">
									<xsl:choose>
										<xsl:when test="local-name(.) = 'MethodUsedToFigureTaxCd'">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 6 - Method Used To Figure Tax Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="." />
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Line 6 - Method Used To Figure Tax Text</xsl:with-param>
												<xsl:with-param name="TargetNode" select="." />
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7.7mm;"><br />6</div>
						<div class="sty1040XAmtBox" style="height:7.7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TaxAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TaxAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TaxAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty1040XDesc" style="height:7.5mm;">
							Credits. If a general business credit carryback is included, <br /> check here
							<span style="float:right;">
								<span class="sty1040XDotLn" style="float:none;margin-right:-3px;">..............</span>
								<img src="{$ImagePath}/56_Bullet.gif" alt="Right arrow"/><span style="width:4px"/> 
								<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" alt="General Business Carryback included">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/GeneralBusinessCrCarrybackInd"/>
										<xsl:with-param name="BackupName">IRS1040XGeneralBusinessCrCarrybackInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7.5mm;"><br />7</div>
						<div class="sty1040XAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalNonrefundableCreditsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalNonrefundableCreditsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalNonrefundableCreditsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty1040XDesc">
							Subtract line 7 from line 6. If the result is zero or less, enter -0-
							
						</div>
						<div class="sty1040XRightNumBox">8</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TaxLessCreditsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TaxLessCreditsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TaxLessCreditsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty1040XDesc" style="height:7mm;">
							Health care: individual responsibility (amended 2018 or earlier <br /> 
							returns only). See instructions
							<span class="sty1040XDotLn">..........</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7mm;"><br />9</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/HealthCareRspnsPenaltyAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/HealthCareRspnsPenaltyAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/HealthCareRspnsPenaltyAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="sty1040XDesc">
							Other taxes
							<span class="sty1040XDotLn">................</span>
						</div>
						<div class="sty1040XRightNumBox">10</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/OtherTaxesAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/OtherTaxesAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/OtherTaxesAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty1040XDesc">
							Total tax. Add lines 8, 9, and 10
							<span class="sty1040XDotLn">..........</span>
						</div>
						<div class="sty1040XRightNumBoxNBB">11</div>
						<div class="sty1040XAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalTaxAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalTaxAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalTaxAmt" />
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XDesc" style="width:90mm;font-weight:bold;font-size:8pt;height:4.5mm;">Payments</div>
						<div class="sty1040XRightNumBoxNBB" style="height:4.5mm">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty1040XDesc" style="height:7mm;">
							Federal income tax withheld and excess social security and <br /> 
							tier 1 RRTA tax withheld (<strong>If changing, </strong> see instructions)
							<span class="sty1040XDotLn">..</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7mm;"><br />12</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/FedIncmExSocSecRRTAWthldTxAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/FedIncmExSocSecRRTAWthldTxAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/FedIncmExSocSecRRTAWthldTxAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="sty1040XDesc" style="font-family:Arial;">
							Estimated tax payments, including amount applied from prior year's return
						</div>
						<div class="sty1040XRightNumBox">13</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/EstimatedTaxPaymentsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/EstimatedTaxPaymentsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/EstimatedTaxPaymentsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="sty1040XDesc">
							Earned Income Credit (EIC)
							<span class="sty1040XDotLn">...........</span>
						</div>
						<div class="sty1040XRightNumBox">14</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/EarnedIncomeCreditAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/EarnedIncomeCreditAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/EarnedIncomeCreditAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="sty1040XDesc" style="height:8mm;">
							Refundable credits from: 
							<input type="checkbox" class="styCkboxNM" alt="Schedule 8812" style="margin-left:4px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Schedule8812Ind"/>
									<xsl:with-param name="BackupName">IRS1040XSchedule8812Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Schedule8812Ind"/>
									<xsl:with-param name="BackupName">IRS1040XSchedule8812Ind</xsl:with-param>
								</xsl:call-template>Schedule 8812</label>
							<span style="width:2.5mm;"/>
							Form(s) 
							<input type="checkbox" class="styCkboxNM" alt="Form 2439" style="margin-left:4px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm2439Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm2439Ind</xsl:with-param>
								</xsl:call-template>2439</label>
							<br />
							<input type="checkbox" class="styCkboxNM" alt="Form 4136" style="margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form4136Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm4136Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form4136Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm4136Ind</xsl:with-param>
								</xsl:call-template>4136</label>
							<input type="checkbox" class="styCkboxNM" alt="Form 8863" style="margin-left:8px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8863Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8863Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8863Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8863Ind</xsl:with-param>
								</xsl:call-template>8863</label>
							<input type="checkbox" class="styCkboxNM" alt="Form 8885" style="margin-left:8px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8885Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8885Ind</xsl:with-param>
								</xsl:call-template>8885</label>
							<input type="checkbox" class="styCkboxNM" alt="Form 8962" style="margin-left:8px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8962Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8962Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form8962Ind"/>
									<xsl:with-param name="BackupName">IRS1040XForm8962Ind</xsl:with-param>
								</xsl:call-template>8962</label> 
							or 
							<input type="checkbox" class="styCkboxNM"  alt="Other" style="margin-left:4px;margin-right:4px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1040XOtherInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1040XOtherInd</xsl:with-param>
								</xsl:call-template>other</label> 
							(specify): 
							<span style="width:4mm;border-bottom:1px dotted black;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd/@otherRefundableCrTxt"/>
									<xsl:with-param name="Desc">Line 15 - Other Refundable Credit Text</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:8mm;padding-top:1.5mm;"><br />15</div>
						<div class="sty1040XAmtBox" style="height:8mm;padding-top:1.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/RefundableCreditsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:8mm;padding-top:1.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/RefundableCreditsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:8mm;padding-top:1.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/RefundableCreditsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="sty1040XLongDesc" style="height:7mm;">
							Total amount paid with request for extension of time to file, tax paid with original return, and additional <br /> 
							tax paid after return was filed
							<span class="sty1040XDotLn">.........................</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7mm;"><br />16</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTxPdWithReturnOrExtnsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="sty1040XLongDesc">
							Total payments. Add lines 12 through 15, column C, and line 16
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 17 - US Virgin Islands Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@uSVirginIslandCd" />
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 17 - US Virgin Islands Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@uSVirginIslandAmt" />
							</xsl:call-template>
							<span class="sty1040XDotLn">.............</span>
						</div>
						<div class="sty1040XRightNumBoxNBB">17</div>
						<div class="sty1040XAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040XLongDesc" style="width:150mm;font-weight:bold;font-size:8pt;height:4.5mm;">Refund or Amount You Owe</div>
						<div class="sty1040XRightNumBoxNBB" style="height:4.5mm">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:4.5mm;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="sty1040XLongDesc">
							Overpayment, if any, as shown on original return or as previously adjusted by the IRS
							<span class="sty1040XDotLn">........</span>
						</div>
						<div class="sty1040XRightNumBox">18</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="sty1040XLongDesc">
							Subtract line 18 from line 17. (If less than zero, see instructions.)
							<span class="sty1040XDotLn">..............</span>
						</div>
						<div class="sty1040XRightNumBox">19</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPaymentsLessOverpaymentAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="sty1040XLongDesc">
							<strong>Amount you owe. </strong> If line 11, column C, is more than line 19, enter the difference
							<span class="sty1040XDotLn">.........</span>
						</div>
						<div class="sty1040XRightNumBox">20</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OwedAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="sty1040XLongDesc">
							If line 11, column C, is less than line 19, enter the difference. This is the amount <strong>overpaid </strong> on this return
							<span class="sty1040XDotLn">..</span>
						</div>
						<div class="sty1040XRightNumBox">21</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetOverpaymentAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="sty1040XLongDesc">
							Amount of line 21 you want <strong>refunded to you</strong>
							<span class="sty1040XDotLn">....................</span>
						</div>
						<div class="sty1040XRightNumBox">22</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RefundAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="sty1040XDesc" style="width:105mm;font-family:Arial;">
							Amount of line 21 you want 
							<span style="display:inline;font-weight:bold;font-family:Verdana;">
								applied to your (enter year): 
								<span style="width:12mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/ElectOvpmtAppliedToEsTaxYr"/>
									</xsl:call-template>
								</span>
								estimated tax
							</span>
						</div>
						<div class="sty1040XRightNumBoxNBB" style="">23</div>
						<div class="sty1040XAmtBoxNBB" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty1040XAmtBoxNBB" style="background-color:lightgrey;border-left-width:0px;">&nbsp;</div>
					</div>
					<div class="styStdDiv" style="text-align:right;font-weight:bold;border-top:1px solid black;">
						Complete and sign this form on page 2.
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 11360L</span>
						<span style="float:right;">Form <span style="font-weight:bold;font-size:larger;">1040-X</span> (Rev. 7-2021)</span>
					</div>
					<div class="styStdDiv">
						Form 1040-X (Rev. 7-2021)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Exemptions and Dependents</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;padding-top:0.5mm;padding-bottom:0.5mm;">
						Complete this part with any information relating to exemptions (to dependents if amending your 2018 or later return). This would include a change in the number of exemptions (of dependents if amending your 2018 or later return).
					</div>
					<!-- Column Headers -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox" style="height:auto;padding:2px 0px;"><img src="{$ImagePath}/1040X_Caution.gif" alt="Caution" height="30" width="31"/></div>
						<div class="sty1040XDesc" style="height:16.5mm;padding-left:1mm;">
							<span style="font-style:italic;">For amended 2018 or later returns only, leave lines 24, 28, and 29 blank. Fill in all other applicable lines.</span>
							<br />
							<strong>Note: </strong> See the Forms 1040 and 1040-SR, or From 1040A, instructions for the tax year being amended. 
							See also the Form 1040-X instructions.
						</div>
						<div class="sty1040XRightNumBox" style="height:16.5mm;border-left-width:0px;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty1040XAmtBox" style="height:16.5mm;padding-top:1.5mm;text-align:center;border-bottom-width:0px;">
							<strong>A. Original number <br /> of exemptions or <br /> amount </strong> 
							reported or as previously adjusted
						</div>
						<div class="sty1040XAmtBox" style="height:16.5mm;padding-top:1.5mm;text-align:center;border-bottom-width:0px;">
							<strong>B. Net change</strong>
						</div>
						<div class="sty1040XAmtBox" style="height:16.5mm;padding-top:1.5mm;text-align:center;font-weight:bold;border-bottom-width:0px;">
							C. Correct <br /> number <br /> or amount
						</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBox">24</div>
						<div class="sty1040XDesc" style="height:10.5mm;">
							Yourself and spouse. <strong>Caution: </strong> If someone can claim you as a dependent, you can't claim an exemption for yourself. <br />
							If amending your 2018 or later return, leave line blank
							<span class="sty1040XDotLn">...</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:10.5mm;"><br /><br />24</div>
						<div class="sty1040XAmtBox" style="height:10.5mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalExemptPrimaryAndSpouseCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:10.5mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalExemptPrimaryAndSpouseCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:10.5mm;"><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalExemptPrimaryAndSpouseCnt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="sty1040XDesc">
							Your dependent children who lived with you
							<span class="sty1040XDotLn">......</span>
						</div>
						<div class="sty1040XRightNumBox">25</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/ChldWhoLivedWithYouCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/ChldWhoLivedWithYouCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/ChldWhoLivedWithYouCnt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="sty1040XDesc" style="font-family:Arial Narrow;font-size:8pt;height:4.2mm;">
							Your dependent children who didn't live with you due to divorce or separation
						</div>
						<div class="sty1040XRightNumBox" style="height:4.2mm;padding-top:0.7mm;">26</div>
						<div class="sty1040XAmtBox" style="height:4.2mm;padding-top:0.7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/ChldNotLivingWithYouCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:4.2mm;padding-top:0.7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/ChldNotLivingWithYouCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:4.2mm;padding-top:0.7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/ChldNotLivingWithYouCnt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 27 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">27</div>
						<div class="sty1040XDesc">
							Other dependents
							<span class="sty1040XDotLn">..............</span>
						</div>
						<div class="sty1040XRightNumBox">27</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/OtherDependentsListedCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/OtherDependentsListedCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/OtherDependentsListedCnt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 28 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="sty1040XDesc" style="height:7mm;">
							Total number of exemptions. Add lines 24 through 27. <br /> If amending your 2018 or later return, leave line blank 
							<span class="sty1040XDotLn">...</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:7mm;"><br />28</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/TotalExemptionsCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/TotalExemptionsCnt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/TotalExemptionsCnt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 29 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">29</div>
						<div class="sty1040XDesc" style="height:16mm;">
							Multiply the number of exemptions claimed on line 28 by <br /> 
							the exemption amount shown in the instructions for line 29 <br /> 
							for the year you are amending. Enter the result here and <br /> 
							on line 4a on page 1 of this form. If amending your 2018 or later return, leave line blank 
							<span class="sty1040XDotLn">.............</span>
						</div>
						<div class="sty1040XRightNumBox" style="height:16mm;"><br /><br /><br /><br />29</div>
						<div class="sty1040XAmtBox" style="height:16mm;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OriginalRptOrAsPrevAdjGrp/CalculatedExemptionAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:16mm;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetChangeOrigRptOrPrevAdjGrp/CalculatedExemptionAmt" />
							</xsl:call-template>
						</div>
						<div class="sty1040XAmtBox" style="height:16mm;"><br /><br /><br /><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CorrectNumberOrAmountGrp/CalculatedExemptionAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 30 -->
					<div class="styStdDiv" style="min-height:4.7mm;height:auto;">
						<div class="styLNLeftNumBox">30</div>
						<div class="sty1040XDesc" style="width:178mm;min-height:4.7mm;height:auto;">
							List <strong>ALL</strong> dependents (children and others) claimed on this amended return. 
							If more than 4 dependents, see inst. and <img src="{$ImagePath}/1040X_Check.gif" alt="Check"/> here
							<span style="float:right;">
								<span class="sty1040XDotLn" style="float:none;margin-right:-3px;">...</span>
								<img src="{$ImagePath}/56_Bullet.gif" alt="Right arrow"/><span style="width:4px"/> 
								<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" alt="More than four dependents">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/MoreDependentsInd"/>
										<xsl:with-param name="BackupName">IRS1040XMoreDependentsInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<!-- Dependents table -->
					<xsl:if test="(count($FormData/DependentDetail) &gt; 4) and (not($Print) or $Print='')">
						<div class="styStdDiv" style="text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'depdContainerId' "/>
							</xsl:call-template>
						</div>
					</xsl:if>
					<!-- Dependents area -->
					<div class="sty1040XDepdContainer" style="" id="depdContainerId">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="display:table;font-size:6pt;border-collapse:collapse;">	
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="min-width:59.4mm;width:59.4mm;text-align:left;padding-left:1mm;padding-top:0mm;">
										<span style="font-size:7pt;">Dependents <span style="font-weight:normal">(see instructions):</span>
											<br/>
											<span style="styBoldText">(a)</span>
											<span style="font-weight:normal;padding-top:15px">
												<span style="width:1mm"/>First name
												<span style="width:12mm;"/>Last name
											</span>
										</span>
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="min-width:24mm;width:35.2mm;border-right-width:1px;vertical-align:top;">
										<span style="font-weight:normal">
											<b>(b)</b><span style="width:.5mm"/>
											Social security number
										</span>														
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="min-width:24mm;width:30.6mm;border-right-width:1px;vertical-align:top;">
										<span style="font-weight:normal;">
											<b>(c)</b><span style="width:.5mm"/>
										   Relationship to you
										</span>
									</th>
									<th class="styTableCellHeader" colspan="2" scope="colgroup" style="width:61.6mm;border-right-width:0px;vertical-align:top;">
										<span style="font-weight:normal">
											<b>(d) </b> <img src="{$ImagePath}/1040X_Check.gif" alt="Check"/><span style="width:.5mm"/>
										   if qualifies for (see instructions):
									   </span>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:28.6mm;font-weight:normal;">
										Child tax credit
									</th>
									<th class="styTableCellHeader" scope="col" style="width:33mm;font-weight:normal;border-right-width:0px;">
										Credit for other dependents <br />
										(amended 2018 or later returns only)
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
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 1 Eligible for CTC Indicator">
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
					<!-- Set Initial Height of Above Table -->
					<xsl:if test="(count($FormData/DependentDetail) &gt;= 4) and ($Print != $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
							<xsl:with-param name="containerHeight" select="4"/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerID" select=" 'depdContainerId' "/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Presidential Election Campaign Fund</div>
					</div>
					<div class="styStdDiv" style="padding-top:2px;">
						Checking below won't increase your tax or reduce your refund.
					</div>
					<div class="styStdDiv" style="padding-top:1px;">
						<input type="checkbox" class="styCkboxNM" style="margin:0px 6px;" alt="Change to P E C F election">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ChangeInElectToContriToPECFInd"/>
								<xsl:with-param name="BackupName">F1040XChangeInElectToContriToPECFInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Check here if you didn't previously want $3 to go to the fund, but now do.
					</div>
					<div class="styStdDiv" style="padding:2px 0px;">
						<input type="checkbox" class="styCkboxNM" style="margin:0px 6px;" alt="Spouse Change to P E C F election">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/ChangeInSpouseContriToPECFInd"/>
								<xsl:with-param name="BackupName">F1040XChangeInSpouseContriToPECFInd</xsl:with-param>
							</xsl:call-template>
						</input>
						Check here if this is a joint return and your spouse did not previously want $3 to go to the fund, but now does.
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Explanation of Changes. 
							<span style="font-weight:normal;">In the space provided below, tell us why you are filing Form 1040-X.</span>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="sty1040XDesc" style="width:179mm;">
							<img src="{$ImagePath}/56_Bullet.gif" alt="Right arrow"/><span style="width:4px"/>Attach any supporting documents and new or changed forms and schedules
						</div>
					</div>
					<div class="styStdDiv" style="min-height:34mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/ReasonForFilingAmdReturnTxt"/>
						</xsl:call-template>
					</div>
					<div class="styStdDiv">
						<strong>Remember to keep a copy of this form for your records.</strong><br />
						<span style="font-size:6pt;">
							Under penalties of perjury, I declare that I have filed an original return and that I have examined this amended return, 
							including accompanying schedules and statements, and to the best of my knowledge and belief, this amended return 
							is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information about which 
							the preparer has any knowledge.
						</span><br />
					</div>
					<!-- Signatures -->
					<div class="styStdDiv"><span style="font-size:8pt;font-weight:bold;">Sign Here</span></div>
					<div class="styStdIBDiv" style="padding-top:0.5mm;">
						<div class="styGenericDiv" style="width:70mm;margin-right:3mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<img src="{$ImagePath}/56_Bullet.gif" alt="Right arrow"/><span style="width:4px"/> 
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN" />
								</xsl:call-template>
							</span>
							Your signature
						</div>
						<div class="styGenericDiv" style="width:20mm;margin-right:3mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
								</xsl:call-template>
							</span>
							Date
						</div>
						<div class="styGenericDiv" style="width:50mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PrimaryOccupationTxt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Signature - Signed for Minor Child by (relation)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ParentGrdnLegalResponsibleGrp/MinorChildSignedByCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Signature - Signed for Minor Child by (name)</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ParentGrdnLegalResponsibleGrp/PersonNm"/>
								</xsl:call-template>
							</span>
							Your occupation
						</div>
					</div>
					<div class="styStdIBDiv" style="padding-top:1mm;">
						<div class="styGenericDiv" style="width:70mm;margin-right:3mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<img src="{$ImagePath}/56_Bullet.gif" alt="Right arrow"/><span style="width:4px"/> 
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN" />
								</xsl:call-template>
							</span>
							Spouse's signature. If a joint return, <strong>both</strong> must sign.
						</div>
						<div class="styGenericDiv" style="width:20mm;margin-right:3mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
								</xsl:call-template>
							</span>
							Date
						</div>
						<div class="styGenericDiv" style="width:50mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SpouseOccupationTxt"/>
								</xsl:call-template>
							</span>
							Spouse's occupation
						</div>
					</div>
					<!-- Paid Preparer Use Only -->
					<div class="styStdDiv"><span style="font-size:8pt;font-weight:bold;">Paid Preparer Use Only</span></div>
					<div class="styStdIBDiv" style="padding-top:0.5mm;">
						<div class="styGenericDiv" style="width:70mm;margin-right:3mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<img src="{$ImagePath}/56_Bullet.gif" alt="Right arrow"/><span style="width:4px"/> 
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN" />
								</xsl:call-template>
							</span>
							Preparer's signature
						</div>
						<div class="styGenericDiv" style="width:20mm;margin-right:3mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</span>
							Date
						</div>
						<div class="styGenericDiv" style="width:90mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt">
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</span>
							Firm's name (or yours if self-employed)
						</div>
					</div>
					<div class="styStdIBDiv" style="padding-top:1.5mm;">
						<div class="styGenericDiv" style="width:93mm;margin-right:3mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
								</xsl:call-template>
							</span>
							Print/type preparer's name
						</div>
						<div class="styGenericDiv" style="width:90mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp//AddressLine2Txt">
									<br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
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
							</span>
							Firm's address and ZIP code
						</div>
					</div>
					<div class="styStdIBDiv" style="padding-top:1.5mm;margin-bottom:2px;">
						<div class="styGenericDiv" style="width:70mm;margin-right:3mm;">
							<span style="width:100%;border-bottom:1px solid black;">
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
							</span>
							PTIN
						</div>
						<div class="styGenericDiv" style="width:40mm;">
							<input type="checkbox" class="styCkbox" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">F1040XPaidPreparerInformationSelfEmployed</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">F1040XPaidPreparerInformationSelfEmployed</xsl:with-param>
								</xsl:call-template>Check if self-employed
							</label>
						</div>
						<div class="styGenericDiv" style="width:50mm;margin-right:3mm;">
							<span style="width:100%;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</span>
							Phone number
						</div>
						<div class="styGenericDiv" style="width:20mm;">
							<span style="width:100%;border-bottom:1px solid black;">
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
							</span>
							EIN
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						For forms and publications, visit <span style="font-style:italic;">www.irs.gov</span>.
						<span style="float:right;">Form <span style="font-weight:bold;font-size:larger;">1040-X</span> (Rev. 7-2021)</span>
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
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/ReasonForFilingAmendedReturnCd">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Top Right Margin - Reason for Filing Amended Return Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Primary Filer Death Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Spouse Death Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SpouseDeathDt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Power of Attorney Signed By Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Power of Attorney Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Surviving Spouse Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SurvivingSpouseInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowCheckbox">
							<xsl:with-param name="Desc">Top Right Margin - Personal Representative Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - Non Paid Preparer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Right Margin - TAS Case Type Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TASCaseTypeCd"/>
						</xsl:call-template>
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
							<xsl:with-param name="Desc">Filing Status - Qualifying HOH SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Filing Status - Qualifying Person SSN</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonSSN"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/MethodUsedToFigureTaxCd | $FormData/MethodUsedToFigureTaxTxt">
							<xsl:choose>
								<xsl:when test="local-name(.) = 'MethodUsedToFigureTaxCd'">
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Line 6 - Method Used To Figure Tax Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="." />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateLeftoverRow">
										<xsl:with-param name="Desc">Line 6 - Method Used To Figure Tax Text</xsl:with-param>
										<xsl:with-param name="TargetNode" select="." />
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherInd/@otherRefundableCrTxt"/>
							<xsl:with-param name="Desc">Line 15 - Other Refundable Credit Text</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 17 - US Virgin Islands Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@uSVirginIslandCd" />
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 17 - US Virgin Islands Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@uSVirginIslandAmt" />
						</xsl:call-template>
						<xsl:for-each select="$FormData/DependentDetail">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Dependent <xsl:number value="position()"/> Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
							</xsl:call-template>
						</xsl:for-each>
					</table>
					<!-- Begin Separated Repeating data table for DependentInformations -->
					<xsl:if test="($Print = $Separated) and (count($FormData/DependentDetail) &gt; 4)">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Form 1040X - Dependents </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:63.4mm;text-align:left;padding-left:1mm;padding-top:0mm;">
										<span style="font-size:7pt;">Dependents <span style="font-weight:normal">(see instructions):</span>
											<br/>
											<span style="styBoldText">(a)</span>
											<span style="font-weight:normal;padding-top:15px">
												<span style="width:1mm"/>First name
												<span style="width:12mm;"/>Last name
											</span>
										</span>
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="min-width:28mm;width:31.2mm;border-right-width:1px;vertical-align:top;">
										<span style="font-weight:normal">
											<b>(b)</b><span style="width:.5mm"/>
											Social security number
										</span>														
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:30.6mm;border-right-width:1px;vertical-align:top;">
										<span style="font-weight:normal;">
											<b>(c)</b><span style="width:.5mm"/>
										   Relationship to you
										</span>
									</th>
									<th class="styDepTblCell" colspan="2" scope="colgroup" style="width:61.6mm;border-right-width:0px;vertical-align:top;">
										<span style="font-weight:normal">
											<b>(d) </b> <img src="{$ImagePath}/1040X_Check.gif" alt="Check"/><span style="width:.5mm"/>
										   if qualifies for (see instructions):
									   </span>
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:28.6mm;font-weight:normal;">
										Child tax credit
									</th>
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;border-right-width:0px;">
										Credit for other dependents <br />
										(amended 2018 or later returns only)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DependentDetail">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
