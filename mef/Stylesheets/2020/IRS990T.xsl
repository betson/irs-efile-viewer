<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS990TStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS990T" />
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
				<meta name="Description" content="IRS Form 990-T" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS990TStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form990T">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:24.3mm;">
							Form <span class="styFN" style="font-size:18pt;">990-T</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description</xsl:with-param>
							</xsl:call-template>
							<br /><br />
							<span class="styAgency">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:24.3mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:0.2mm;padding-bottom:0.5mm;">
								Exempt Organization Business Income Tax Return
							</span><br />
							<span style="font-weight:bold;font-size:9pt">(and proxy tax under section 6033(e))</span><br />
							<span style="font-family:Arial;font-weight:bold;padding-top:2mm;padding-bottom:2mm;">
								For calendar year 2020 or other tax year beginning 
								<span style="width:20mm;text-align:center;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>
								and ending 
								<span style="width:20mm;text-align:center;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form990T</span>
								for instructions and the latest information.
							</span><br />
							<span style="font-weight:bold;font-family:Arial;">
								&#9658;Do not enter SSN numbers on this form as it may be made public if your organization is a 501(c)(3).
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:24.3mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0047</div>
							<div class="styTY">20<span class="styTYColor">20</span></div>
							<div style="text-align:center;background-color:black;font-size:7pt;font-family:Arial;padding:0.5mm;">
								<span class="styBoldText" style="color:white">Open to Public Inspection for 501(c)(3) Organizations Only</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styGenericDiv" style="height:auto;width:30mm;border-top:1px solid black;border-right:1px solid black;">
						<div class="sty990THeaderCell" style="height:9mm;border-left-width:0px;padding-top:1.5mm;">
							<span class="sty990TLeftLtrBox" style="">A</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Address Change Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
										<xsl:with-param name="BackupName">IRS990TAddressChangeInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:20mm;float:left;font-family:Arial;">
								Check box if address changed.
							</span>
						</div>
						<div class="sty990THeaderCell" style="height:22.5mm;border-left-width:0px;padding-top:1mm;border-bottom-width:0px;">
							<span class="sty990TLeftLtrBox" style="">B</span>
							<span style="width:24mm;float:left;font-family:Arial;padding-top:1px;padding-bottom:4px;">
								Exempt under section
							</span>
							<br />
							<span class="sty990TLeftLtrBox" style="margin-left:2mm;">
								<input type="checkbox" class="styCkboxNM" alt="section 501">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Organization501IndicatorGrp/Organization501Ind"/>
										<xsl:with-param name="BackupName">IRS990TOrganization501Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:20mm;height:4mm;padding-top:2px;float:left;font-family:Arial;">
								501(
								<xsl:choose>
									<xsl:when test="$FormData/Organization501IndicatorGrp/Organization501aTypeTxt">
										<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/Organization501IndicatorGrp/Organization501aTypeTxt"/></xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$FormData/Organization501IndicatorGrp/Organization501cTypeTxt"/></xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								)
							</span>
							<br />
							<span class="sty990TLeftLtrBox" style="margin-left:2mm;">
								<input type="checkbox" class="styCkboxNM" alt="Section 408 e">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section408eInd"/>
										<xsl:with-param name="BackupName">IRS990TSection408eInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:10mm;float:left;font-family:Arial;">	408(e)	</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Section 220 e">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section220eInd"/>
										<xsl:with-param name="BackupName">IRS990TSection220eInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:8mm;height:4mm;float:left;font-family:Arial;">220(e)</span>
							<br />
							<span class="sty990TLeftLtrBox" style="margin-left:2mm;">
								<input type="checkbox" class="styCkboxNM" alt="Section 408A">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section408AInd"/>
										<xsl:with-param name="BackupName">IRS990TSection408AInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:10mm;height:4mm;float:left;font-family:Arial;">408A</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Section 530 a">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section530aInd"/>
										<xsl:with-param name="BackupName">IRS990TSection530aInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:8mm;height:4mm;float:left;font-family:Arial;">530(a)</span>
							<br />
							<span class="sty990TLeftLtrBox" style="margin-left:2mm;">
								<input type="checkbox" class="styCkboxNM" alt="Section 529 a">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section529aInd"/>
										<xsl:with-param name="BackupName">IRS990TSection529aInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:10mm;height:4mm;float:left;font-family:Arial;">529(a)</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Section 529A">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Section529AInd"/>
										<xsl:with-param name="BackupName">IRS990TSection529AInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:8mm;float:left;font-family:Arial;">529A</span>
						</div>
					</div>
					<div class="styGenericDiv" style="height:auto;width:117mm;border-top:1px solid black;border-right:1px solid black;">
						<div class="styGenericDiv" style="width:10mm;height:23mm;text-align:center;font-weight:bold;padding-top:7mm;">Print or Type</div>
						<div class="sty990THeaderCell" style="height:10.5mm;width:106.7mm;">
							Name of organization (
							<input type="checkbox" class="styCkboxNM" alt="Organization Name Changed">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/NameChangeInd"/>
									<xsl:with-param name="BackupName">IRS990TNameChangeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Check box if name changed and see instructions.)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NameChangeInd"/>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="sty990THeaderCell" style="height:10mm;width:106.7mm;">
							<span>Number, street, and room or suite no. If a P.O. box, see instructions.</span>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="sty990THeaderCell" style="min-height:7mm;width:106.7mm;border-bottom-width:0px;height:auto;">
							<span>City or town, state or province, and ZIP or foreign postal code</span>
							<br />
							<span style="display:inline;">
								<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
									<xsl:attribute name="style">display:inline;font-size:6pt;</xsl:attribute>
								</xsl:if>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
								<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
									<span style="width:7px;"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
						<div class="sty990THeaderCell" style="width:117mm;height:4mm;border-left:none;border-top-width:1px;border-bottom-width:0px;">
							<span class="sty990TLeftLtrBox" style="">C</span>
							Book value of all assets at end of year
							<span class="sty990TDotLn" style="float:none;">.....&#9658;</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BookValueAssetsEOYAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styGenericDiv" style="height:auto;width:40mm;border-top:1px solid black;">
						<div class="styEINBox" style="width:100%;height:10mm;padding-left:1mm;font-weight:normal;border-bottom:1px solid black;font-size:inherit;">
							<strong>D &nbsp; <span style="font-family:Arial;font-size:6pt;">Employer identification number</span></strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"><xsl:with-param name="EINChanged" select="true()"/></xsl:call-template>
						</div>
						<div class="sty990THeaderCell" style="height:10.5mm;width:100%;border-left-width:0px;">
							<strong>E &nbsp; <span style="font-family:Arial;">Group exemption number</span></strong><br />
							&nbsp;&nbsp;&nbsp; <span style="font-family:Arial;">(see instructions)</span><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/GroupExemptionNum"/>
							</xsl:call-template>
						</div>
						<div class="sty990THeaderCell" style="width:100%;height:9mm;border-left-width:0px;border-bottom-width:0px;padding-top:1.5mm;">
							<span class="sty990TLeftLtrBox" style="">F</span>
							<span class="sty990TLeftLtrBox" style="">
								<input type="checkbox" class="styCkboxNM" alt="Amended Return Indicator">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
										<xsl:with-param name="BackupName">IRS990TAmendedReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="width:20mm;float:left;font-family:Arial;">
								Check box if an amended return.
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">G</div>
						<div class="styGenericDiv" style="width:35mm;">
							Check organization type &#9658;
						</div>
						<div class="styGenericDiv" style="width:147mm;">
							<input type="checkbox" class="styCkboxNM" alt="501 c corporation">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Organization501cCorporationInd"/>
									<xsl:with-param name="BackupName">IRS990TOrganization501cCorporationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							501(c) corporation
							<input type="checkbox" class="styCkboxNM" alt="501 c trust" style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Organization501cTrustInd"/>
									<xsl:with-param name="BackupName">IRS990TOrganization501cTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							501(c) trust
							<input type="checkbox" class="styCkboxNM" alt="401 A trust" style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Organization401aTrustInd"/>
									<xsl:with-param name="BackupName">IRS990TOrganization401aTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							401(a) trust
							<input type="checkbox" class="styCkboxNM" alt="other trust" style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OrganizationOtherTrustIndGrp/OrganizationOtherTrustInd"/>
									<xsl:with-param name="BackupName">IRS990TOrganizationOtherTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Other trust
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OrganizationOtherTrustIndGrp/OtherTrustTypeCd"/>
								<xsl:with-param name="Desc">Line G - Other Trust Type Code</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OrganizationOtherTrustIndGrp/OtherTrustTypeDesc"/>
								<xsl:with-param name="Desc">Line G - Other Trust Type Description</xsl:with-param>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Applicable Reinsurance Entity" style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ApplicableReinsuranceEntityInd"/>
									<xsl:with-param name="BackupName">IRS990TApplicableReinsuranceEntityInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Applicable reinsurance entity
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">H</div>
						<div class="styGenericDiv" style="width:35mm;">
							Check if filing only to &#9658;
						</div>
						<div class="styGenericDiv" style="width:147mm;">
							<input type="checkbox" class="styCkboxNM" alt="claim credit from form 8941">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ClaimCreditForm8941Ind"/>
									<xsl:with-param name="BackupName">IRS990TClaimCreditForm8941Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Claim credit from Form 8941
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ClaimCreditForm8941Ind"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="claim refund from form 2439" style="margin-left:3mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ClaimRefundForm2439Ind"/>
									<xsl:with-param name="BackupName">IRS990TClaimRefundForm2439Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Claim a refund shown on Form 2439
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ClaimRefundForm2439Ind"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line I -->
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">I</div>
						<div class="styGenericDiv">
							Check if a 501(c)(3) organization filing a consolidated return with a 501(c)(2) titleholding corporation
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ConsolidatedReturn501c3c2Ind"/>
							</xsl:call-template>
							<span class="sty990TDotLn" style="float:none;">.........&#9658;</span>
						</div>
						<div class="styGenericDiv">
							<input type="checkbox" class="styCkboxNM" alt="consolidated return 501 c 3 c 2" style="">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ConsolidatedReturn501c3c2Ind"/>
									<xsl:with-param name="BackupName">IRS990TConsolidatedReturn501c3c2Ind</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Line J -->
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">J</div>
						<div class="styGenericDiv">
							Enter the number of attached Schedules A (Form 990-T)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form990TScheduleAAttachedCnt"/>
							</xsl:call-template>
							<span class="sty990TDotLn" style="float:none;">...............&#9658;</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Form990TScheduleAAttachedCnt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line K -->
					<div class="styStdDiv" style="border-top:1px solid black;padding:1px;">
						<div class="sty990TLeftLtrBox">K</div>
						<div class="styGenericDiv">
							During the tax year, was the corporation a subsidiary in an affiliated group or a parent-subsidiary controlled group? 
							<span class="sty990TDotLn" style="float:none;">...&#9658;</span>
						</div>
						<div class="styGenericDiv">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryCorporationInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="subsidiary corporation yes" style="">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryCorporationInd"/>
									<xsl:with-param name="BackupName">IRS990TSubsidiaryCorporationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Yes
							<input type="checkbox" class="styCkboxNM" alt="subsidiary corporation no" style="margin-left:2mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SubsidiaryCorporationInd"/>
									<xsl:with-param name="BackupName">IRS990TSubsidiaryCorporationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							No
						</div>
					</div>
					<div class="styStdDiv" style="padding:1px;">
						<div class="sty990TLeftLtrBox">&nbsp;</div>
						<div class="styGenericDiv" style="width:96mm;">
							If "Yes," enter the name and identifying number of the parent corporation &#9658;
						</div>
						<div class="styGenericDiv" style="width:86mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="$FormData/ParentCorporationName/BusinessNameLine2Txt">
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/PrntCorporationNameControlTxt"/>
								<xsl:with-param name="Desc">Line K - Parent Corporation Name Control</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="$FormData/ParentCorporationEIN">
								<xsl:if test="$FormData/ParentCorporationName"><br /></xsl:if>
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationEIN"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- Line L -->
					<div class="styStdDiv" style="padding:1px;border-top:1px solid black;">
						<div class="sty990TLeftLtrBox">L</div>
						<div class="styGenericDiv" style="width:34mm;">
							The books are in care of &#9658;
						</div>
						<div class="styGenericDiv" style="width:98mm;">
							<xsl:choose>
								<xsl:when test="$FormData/BooksInCareOfDetail/PersonNm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/PersonNm"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="$FormData/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="$FormData/BooksInCareOfDetail"><br /></xsl:if>
							<xsl:choose>
								<xsl:when test="$FormData/BooksInCareOfDetail/ForeignAddress">
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/ForeignAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/USAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styGenericDiv" style="width:50mm;">
							Telephone number &#9658; 
							<xsl:choose>
								<xsl:when test="$FormData/BooksInCareOfDetail/ForeignPhoneNum">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/ForeignPhoneNum"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfDetail/PhoneNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="">
							Total Unrelated Business Taxable Income
						</div>
					</div>
					<!-- Part 1, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;">
							Total of unrelated business taxable income computed from all unrelated trades or businesses (see instructions)
							<span class="sty990TDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />1</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIComputedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Reserved
							<span class="sty990TDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Add lines 1 and 2
							<span class="sty990TDotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIComputedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Charitable contributions (see instructions for limitation rules)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CharitableContributionsDedAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CharitableContributionsDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Total unrelated business taxable income before net operating losses. Subtract line 4 from line 3
							<span class="sty990TDotLn">....</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIBeforeNOLSpecificAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							Deduction for net operating loss. See instructions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="height:auto;">
							Total of unrelated business taxable income before specific deduction and section 199A deduction. <br />
							Subtract line 6 from line 5
							<span class="sty990TDotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:auto;"><br />7</div>
						<div class="styLNAmountBox" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIBeforeSection199AAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc">
							Specific deduction (generally $1,000, but see instructions for exceptions)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SpecificDeductionAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SpecificDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							<strong>Trusts. </strong> Section 199A deduction. See instructions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Section199ADeductionAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section199ADeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							<strong>Total deductions. </strong> Add lines 8 and 9
							<span class="sty990TDotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Unrelated business taxable income. </strong> 
							Subtract line 10 from line 7. If line 10 is greater than line 7, enter zero
							<span class="sty990TDotLn">................................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:auto;"><br />11</div>
						<div class="styLNAmountBoxNBB" style="height:auto;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUBTIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="">
							Tax Computation
						</div>
					</div>
					<!-- Part 2, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							<strong>Organizations taxable as corporations. </strong> Multiply Part I, line 11 by 21% (0.21)
							<span class="sty990TDotLn" style="margin-right:-5px;">.......&#9658;</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableCorporationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Trusts taxable at trust rates. </strong> See instructions for tax computation. Income tax on the amount on <br />
							Part I, line 11 from: 
							<input type="checkbox" class="styCkboxNM" style="margin-left:2mm;" alt="Tax rate schedule">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TaxRateScheduleInd"/>
									<xsl:with-param name="BackupName">IRS990TTaxRateScheduleInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Tax rate schedule or
							<input type="checkbox" class="styCkboxNM" style="margin-left:3mm;" alt="Schedule D Form 1041">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form1041ScheduleDInd"/>
									<xsl:with-param name="BackupName">IRS990TForm1041ScheduleDInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Schedule D (Form 1041)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form1041ScheduleDInd"/>
							</xsl:call-template>
							<span class="sty990TDotLn" style="margin-right:-5px;">........&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm;"><br />2</div>
						<div class="styLNAmountBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableTrustAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							<strong>Proxy tax. </strong> See instructions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ProxyTaxAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn" style="margin-right:-5px;">.......................&#9658;</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ProxyTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc">
							Other tax amounts. See instructions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt/@section1291InterestCd"/>
								<xsl:with-param name="Desc">Part II, Line 4 - Section 1291 Interest Code</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt/@section1291InterestAmt"/>
								<xsl:with-param name="Desc">Part II, Line 4 - Section 1291 Interest Amount</xsl:with-param>
							</xsl:call-template>
							<span class="sty990TDotLn">....................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Alternative minimum tax (trusts only)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc">
							<strong>Tax on noncompliant facility income. </strong> See instructions
							<span class="sty990TDotLn">................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NoncompliantFacilityIncmTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							<strong>Total. </strong> Add lines 3 through 6 to	 line 1 or 2, whichever applies
							<span class="sty990TDotLn">...............</span>
						</div>
						<div class="styLNRightNumBoxNBB">7</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxComputationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 11291J</span>
						<span style="float:right;">Form <strong>990-T</strong> (2020)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 990-T (2020)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							Tax and Payments
						</div>
					</div>
					<!-- Part 3, Line 1a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="styLNDesc" style="width:98mm;">
							Foreign tax credit (corporations attach Form 1118; trusts attach Form 1116)
						</div>
						<div class="styLNRightNumBox">1a</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 1b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;">
							Other credits (see instructions)
							<span class="sty990TDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">1b</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 1c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:98mm;">
							General business credit. Attach Form 3800 (see instructions)
							<span class="sty990TDotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">1c</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CYGenBusinessCreditAllowedAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYGenBusinessCreditAllowedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 1d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:98mm;">
							Credit for prior year minimum tax (attach Form 8801 or 8827)
							<span class="sty990TDotLn">....</span>
						</div>
						<div class="styLNRightNumBox">1d</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinimumTaxCreditAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CurrentYearMinimumTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 1e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc">
							<strong>Total credits. </strong> Add lines 1a through 1d
							<span class="sty990TDotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">1e</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc">
							Subtract line 1e from Part II, line 7
							<span class="sty990TDotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="height:auto;">
							Other taxes. Check if from: 
							<input type="checkbox" class="styCkboxNM" alt="Form 4255 indicator" style="margin-left:2mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form4255Ind"/>
									<xsl:with-param name="BackupName">IRS990TForm4255Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Form 4255 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form4255Ind"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Form 8611 indicator" style="margin-left:4mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8611Ind"/>
									<xsl:with-param name="BackupName">IRS990TForm8611Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Form 8611 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8611Ind"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Form 8697 indicator" style="margin-left:4mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8697Ind"/>
									<xsl:with-param name="BackupName">IRS990TForm8697Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Form 8697 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8697Ind"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkboxNM" alt="Form 8866 indicator" style="margin-left:4mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8866Ind"/>
									<xsl:with-param name="BackupName">IRS990TForm8866Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Form 8866 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8866Ind"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" alt="Other tax indicator" style="margin-left:37mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
									<xsl:with-param name="BackupName">IRS990TOtherInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Other (attach statement)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
							</xsl:call-template>
							<span class="sty990TDotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8.6mm;padding-top:2mm;"><br />3</div>
						<div class="styLNAmountBox" style="height:8.6mm;padding-top:2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherTaxesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="height:auto;">
							<strong>Total tax. </strong> Add lines 2 and 3 (see instructions). 
							<input type="checkbox" class="styCkboxNM" alt="section 1294 interest indicator" style="margin-left:1mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section1294InterestInd"/>
									<xsl:with-param name="BackupName">IRS990TSection1294InterestInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Check if includes tax previously deferred under <br /> section 1294. Enter the tax amount here
							<span style="width:75mm;height:auto;border-bottom:1px solid black;text-align:right;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Section1294InterestInd"/>
								</xsl:call-template>
								<span style="width:7px;"/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Section1294InterestAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:8.2mm;padding-top:1.4mm;"><br />4</div>
						<div class="styLNAmountBox" style="height:8.2mm;padding-top:1.4mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							2020 net 965 tax liability paid from Form 965-A or Form 965-B, Part II, column (k), line 4
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/PaidTaxLiabilityAmt"/>
							</xsl:call-template>
							<span class="sty990TDotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PaidTaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 6a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6a</div>
						<div class="styLNDesc" style="width:98mm;">
							Payments: A 2019 overpayment credited to 2020
							<span class="sty990TDotLn">........</span>
						</div>
						<div class="styLNRightNumBox">6a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PriorYearOverpaymentCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:98mm;height:4.4mm;">
							2020 estimated tax payments. Check if section 643(g) election applies &#9658;
							<input type="checkbox" class="styCkboxNM" alt="section 643 g election indicator">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section643gElectionInd"/>
									<xsl:with-param name="BackupName">IRS990TSection643gElectionInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">6b</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<span style="float:left;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/Section643gElectionInd/@section643gElectionAmt"/>
									<xsl:with-param name="Desc">Part III, Line 6b - Section 643(g) Election Amount</xsl:with-param>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="width:98mm;">
							Tax deposited with Form 8868
							<span class="sty990TDotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">6c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExtsnRequestIncomeTaxPaidAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6d -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">d</div>
						<div class="styLNDesc" style="width:98mm;">
							Foreign organizations: Tax paid or withheld at source (see instructions)
							<span class="sty990TDotLn">.</span>
						</div>
						<div class="styLNRightNumBox">6d</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxPdWithheldAtSrceAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxPdWithheldAtSrceAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6e -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">e</div>
						<div class="styLNDesc" style="width:98mm;">
							Backup withholding (see instructions)
							<span class="sty990TDotLn">............</span>
						</div>
						<div class="styLNRightNumBox">6e</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/BackupWithholdingAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BackupWithholdingAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6f -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">f</div>
						<div class="styLNDesc" style="width:98mm;">
							Credit for small employer health insurance premiums (attach Form 8941)
							<span class="sty990TDotLn">.</span>
						</div>
						<div class="styLNRightNumBox">6f</div>
						<div class="styLNAmountBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/SmllEmplrHIPTaxExemptCreditAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllEmplrHIPTaxExemptCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 3, Line 6g -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">g</div>
						<div class="styLNDesc" style="width:98mm;height:auto;">
							Other credits, adjustments, and payments: 
							<input type="checkbox" class="styCkboxNM" alt="Form 2439 indicator" style="margin-left:2mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
									<xsl:with-param name="BackupName">IRS990TForm2439Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Form 2439 
							<span style="border-bottom:1px solid black;width:15mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind/@totalUndistributedLTCapGainAmt"/>
									<xsl:with-param name="Desc">Part III, Line 6g - Total Undistributed Long-Term Capital Gains Amount</xsl:with-param>
								</xsl:call-template>
							</span>
							<br />
							<input type="checkbox" class="styCkboxNM" alt="Form 4136 indicator">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form4136Ind"/>
									<xsl:with-param name="BackupName">IRS990TForm4136Ind</xsl:with-param>
								</xsl:call-template>
							</input>
							Form 4136 
							<span style="border-bottom:1px solid black;width:20mm;min-height:3mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form4136Ind"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form4136Ind/@totalFuelTaxCreditAmt"/>
									<xsl:with-param name="Desc">Part III, Line 6g - Total Fuel Tax Credit Amount</xsl:with-param>
								</xsl:call-template>
							</span>
							<input type="checkbox" class="styCkboxNM" alt="Other credits adjustments or payments indicator" style="margin-left:4mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CreditsAdjPaymentOtherInd"/>
									<xsl:with-param name="BackupName">IRS990TCreditsAdjPaymentOtherInd</xsl:with-param>
								</xsl:call-template>
							</input>
							Other 
							<span style="border-bottom:1px solid black;width:20mm;min-height:3mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CreditsAdjPaymentOtherInd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/CreditsAdjPaymentOtherInd/@creditsAdjPaymentOtherAmt"/>
									<xsl:with-param name="Desc">Part III, Line 6g - Other Credits, Adjustments, and Payments Amount</xsl:with-param>
								</xsl:call-template>
							</span>
							<span style="width:12mm;height:2mm;"/>
							Total &#9658;
						</div>
						<div class="styLNRightNumBox" style="height:8.6mm;padding-top:2mm;"><br />6g</div>
						<div class="styLNAmountBox" style="height:8.6mm;padding-top:2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOtherCreditsAdjPaymentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:8.6mm;background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="height:8.6mm;">&nbsp;</div>
					</div>
					<!-- Part 3, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc">
							<strong>Total payments. </strong> Add lines 6a through 6g
							<span class="sty990TDotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="height:4.5mm;">
							Estimated tax penalty (see instructions). Check if Form 2220 is attached 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form2220AttachedInd"/>
							</xsl:call-template>
							<span style="float:right;">
								<span class="sty990TDotLn" style="float:none;padding-right:1px;">........</span>
								&#9658;
								<input type="checkbox" class="styCkboxNM" alt="form 2220 attached indicator" style="margin-right:1mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form2220AttachedInd"/>
										<xsl:with-param name="BackupName">IRS990TForm2220AttachedInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ESPenaltyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							<strong>Tax due. </strong> If line 7 is smaller than the total of lines 4, 5, and 8, enter amount owed
							<span class="sty990TDotLn" style="margin-right:-6px;">.......&#9658;</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							<strong>Overpayment. </strong> If line 7 is larger than the total of lines 4, 5, and 8, enter amount overpaid
							<span class="sty990TDotLn" style="margin-right:-6px;">....&#9658;</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/OverpaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc">
							Enter the amount of line 10 you want: <strong>Credited to 2021 estimated tax</strong>&#9658;
							<span style="width:25mm;text-align:right;padding-right:3px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/AppliedToESTaxAmt"/>
								</xsl:call-template>
							</span>
							<strong>Refunded</strong>&#9658;
						</div>
						<div class="styLNRightNumBoxNBB">11</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/RefundAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="">
							Statements Regarding Certain Activities and Other Information 
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!-- Part 4, Line 1 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:auto;width:162mm;">
							At any time during the 2020 calendar year, did the organization have an interest in or a signature or other authority 
							over a financial account (bank, securities, or other) in a foreign country? If "Yes," the organization may have to file 
							FinCEN Form 114, Report of Foreign Bank and Financial Accounts. If "Yes," enter the name of the foreign country 
							here &#9658;
							<span style="width:160mm;border-bottom:1px dashed black;">
								<xsl:for-each select="$FormData/ForeignCountryCd">
									<xsl:if test="position() &gt; 1">&nbsp;</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</span>
						</div>
						<div class="styLNRightNumBox">Yes</div>
						<div class="styLNRightNumBox">No</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5.5mm;">&nbsp;</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:162mm;">
							During the tax year, did the organization receive a distribution from, or was it the grantor of, or transferor to, a foreign trust?
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">&nbsp;</div>
						<div class="styLNDesc" style="width:162mm;">
							If "Yes," see instructions for other forms the organization may have to file.
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:162mm;">
							Enter the amount of tax-exempt interest received or accrued during the tax year 
							<span class="sty990TDotLn" style="float:none;padding-left:4mm;">.....</span>
							&#9658; $ 
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 4, Line 4a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="styLNDesc" style="width:162mm;">
							Did the organization change its method of accounting? (see instructions) 
							<span class="sty990TDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ChangeInMethodOfAccountingInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ChangeInMethodOfAccountingInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 4, Line 4b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4b</div>
						<div class="styLNDesc" style="width:162mm;">
							If 4a is "Yes," has the organization described the change on Form 990, 990-EZ, 990-PF, or Form 1128? If "No," explain in Part V
						</div>
						<div class="styLNRightNumBoxNBB">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ProvChangeMethodOfAcctDescInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/ProvChangeMethodOfAcctDescInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc" style="height:auto;">
							Supplemental Information 
						</div>
					</div>
					<div class="styStdDiv" style="padding-top:1mm;padding-bottom:1mm;border-bottom:1px solid black;">
						Provide the explanation required by Part IV, line 4b. Also, provide any other addtional information. See instructions.
					</div>
					<!-- Supplemental Information -->
					<xsl:choose>
						<xsl:when test="$FormData/ItmzdSupplementalInfoGrp">
							<table class="styTable" style="width:187mm;border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" style="width:30mm;">
											Part Number
										</th>
										<th class="styTableCellHeader" style="width:30mm;">
											Line Number
										</th>
										<th class="styTableCellHeader" style="min-width:70mm;width:97mm;">
											Explanation
										</th>
										<th class="styTableCellHeader" style="width:30mm;border-right-width:0px;">
											Amount
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/ItmzdSupplementalInfoGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExplanationAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<div class="styStdDiv" style="padding-bottom:2px;">
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span>
							</div>
						</xsl:otherwise>
					</xsl:choose>
					<!-- Sign Here -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styGenericDiv" style="width:13mm;height:22.5mm;font-size:12pt;font-weight:bold;padding-top:6mm;border-right:1px solid black;">
							Sign Here
						</div>
						<div class="styGenericDiv" style="width:174mm;font-size:6pt;padding:0.5mm;margin-bottom:4mm;">
							Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
							and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) 
							is based on all information of which preparer has any knowledge.<br />
						</div>
						<div class="styGenericDiv" style="width:174mm;">
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:52mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;border-right:1px solid black;vertical-align:bottom;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">PersonNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span>Signature of officer</span>
							</div>
							<div class="styGenericDiv" style="width:16mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;padding-left:0.5mm;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">SignatureDt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span>Date</span>
							</div>
							<div class="styGenericDiv" style="width:6mm;height:12mm;padding-left:1mm;">
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="30" width="10" style="margin-top:3px;"/>
							</div>
							<div class="styGenericDiv" style="width:52mm;">
								<span style="width:100%;height:8mm;border-bottom:1px solid black;">
									<br />
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">PersonTitleTxt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span>Title</span>
							</div>
							<div class="styGenericDiv" style="width:40mm;border:2px solid black;font-size:6pt;margin-left:3px;padding:3px;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/DiscussWithPaidPreparerInd"/>
								</xsl:call-template>
								May the IRS discuss this return with the preparer shown below (see instructions)?
								<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" alt="Discuss with paid preparer Yes">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">IRS990TAuthorizeThirdPartyYesCheckbox</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="font-weight:bold;">Yes</span>
								<input type="checkbox" class="styCkboxNM" style="margin-left:6px;margin-right:2px;" alt="Discuss with paid preparer No">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">IRS990TAuthorizeThirdPartyNoCheckbox</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="font-weight:bold;">No</span>
							</div>
						</div>
					</div>
					
					<!-- Implementing the preparer section in table -->
					<div class="styStdDiv" style="font-size:6pt;">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;height:auto;">
              <span class="styMainTitle" style="font-size:11pt;height:auto;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
									Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
              </div>
                <div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1px solid black;border-left:1px ;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                  <input type="checkbox" class="styCkboxNM" alt="Self Employed Checkbox">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                  <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-bottom:1px ">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black; border-left:1px solid black;padding-left:1mm;border-bottom:1px solid black;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:42mm;padding-left:1mm;border-bottom:0px solid black;">Firm's EIN
                <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <span style="width:4px;"/>
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
                  </div>
                </div>
                <div class="styLNDesc" style="width:55mm;padding-left:1mm;height:auto;border-top:1px solid black;"> Phone no. 
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
            </div>
          </div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <strong>990-T</strong> (2020)</span>
					</div>
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
						<xsl:for-each select="$FormData/SpecialConditionDesc">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="."/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description <xsl:value-of select="position()"/></xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OrganizationOtherTrustIndGrp/OtherTrustTypeCd"/>
							<xsl:with-param name="Desc">Line G - Other Trust Type Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OrganizationOtherTrustIndGrp/OtherTrustTypeDesc"/>
							<xsl:with-param name="Desc">Line G - Other Trust Type Description</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/PrntCorporationNameControlTxt"/>
							<xsl:with-param name="Desc">Line K - Parent Corporation Name Control</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt/@section1291InterestCd"/>
							<xsl:with-param name="Desc">Part II, Line 4 - Section 1291 Interest Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmt/@section1291InterestAmt"/>
							<xsl:with-param name="Desc">Part II, Line 4 - Section 1291 Interest Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Section643gElectionInd/@section643gElectionAmt"/>
							<xsl:with-param name="Desc">Part III, Line 6b - Section 643(g) Election Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind/@totalUndistributedLTCapGainAmt"/>
							<xsl:with-param name="Desc">Part III, Line 6g - Total Undistributed Long-Term Capital Gains Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form4136Ind/@totalFuelTaxCreditAmt"/>
							<xsl:with-param name="Desc">Part III, Line 6g - Total Fuel Tax Credit Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CreditsAdjPaymentOtherInd/@creditsAdjPaymentOtherAmt"/>
							<xsl:with-param name="Desc">Part III, Line 6g - Other Credits, Adjustments, and Payments Amount</xsl:with-param>
						</xsl:call-template>
					</table>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
