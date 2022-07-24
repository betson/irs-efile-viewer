<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 02/24/2022 -->
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
	<xsl:include href="IRS1040NRStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040NR" />
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
				<meta name="Description" content="IRS Form 1040NR" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040NRStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040NR">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styGenericDiv" style="width:34.8mm;height:42px;padding-top:4px;">
							<span class="" style="margin-top:3.5mm;margin-left:-1mm;margin-right:-1mm;
								transform:rotate(270deg);float:left;">Form</span>
							<span class="styFormNumber" style="margin-top:1mm;">	1040-NR</span>
						</div>
						<div class="styGenericDiv" style="width:73mm;padding-right:.5mm;padding-top:6px;
							height:42px;">
							<span class="styAgency">Department of the Treasury&#8212;Internal Revenue
							Service</span>
							<span style="width:4mm;"/>(99)<br/>
							<span class="styMainTitle" style="font-family:Arial-Narrow;font-size:11pt">
								U.S. Nonresident Alien Income Tax Return</span>
						</div>
						<div class="styTYBox" style="width:17mm;border-right-width:1px;height:42px;
							padding-top:4px;">
							<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">21
							</span></span>
						</div>
						<div class="styOMB" style="width:27mm;height:42px;padding:25px .5mm 1mm .5mm;
							float:left;border-width:0px 1px 0px 0px;vertical-align:bottom;">OMB No. 1545-0074
						</div>
						<div class="styGenericDiv" style="width:34mm;height:42px;font-family:Arial-Narrow;
							font-size:6.5pt;padding:3px 0px 1mm 1mm;vertical-align:bottom;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Condition Description	</xsl:with-param>
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
								<xsl:with-param name="Desc">Top Right Margin - Special Processing Literal Code	</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/SpecialProcessingLiteralCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Combat Zone Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/CombatZoneCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Combat Zone Date</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/CombatZoneCd/@combatZoneDt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Special Processing Code Text</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/SpecialProcessingCodeTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Community Property Return Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/CommPropStateRtnInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="Desc">Top Right Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
								<xsl:with-param name="TargetNode" 
								select="$FormData/PowerOfAttorneySignedByInd"/>
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
								<xsl:with-param name="TargetNode" 
								select="$FormData/PersonalRepresentativeInd"/>
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
							</xsl:call-template><br/>
							&nbsp;IRS Use Only&#8212;Do not write or staple in this space.
						</div>
					</div>
					<!-- Filing status section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styIRS1040NRHeaderCell" style="width:20mm;height:15mm;
							padding-top:.3mm;float:left;border-width:0px 1px 0px 0px;	font-size:7pt;">
							<span style="font-weight:bold;margin-top:1px;">Filing<br/> Status</span><br />
							<span style="padding-top:0.5mm;">Check only <br />one box.</span>
						</div>
						<div style="width:167mm;min-height:15mm;padding-top:1.0mm;
							padding-left:2mm;float:left;">
							<span style="display:inline;font-family:Arial;font-size:10pt">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" 
									select="$FormData/IndividualReturnFilingStatusCd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;
									margin-bottom:1.5mm;" alt="Individual Return Filing Status Cd Single">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" 
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" 
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[1]</xsl:with-param>
									</xsl:call-template>Single</label>
								<span style="width:3mm;"/>
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;"
									alt="Individual Return Filing Status Cd Married Filing Separately">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode"
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" 
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="3"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[3]</xsl:with-param>
									</xsl:call-template>Married filing separately (MFS)</label>
								<span style="width:3mm;"/>
								<span style="width:3mm;"/>
								<input type="checkbox" class="styCkboxNM" style="margin-right:1mm;"
									alt="Individual Return Filing Status Cd Qualifying widow(er) (QW)">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" 
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" 
										select="$FormData/IndividualReturnFilingStatusCd"/>
										<xsl:with-param name="DisplayedCheckboxValue" select="5"/>
										<xsl:with-param name="BackupName">
										IRS1040NRIndividualReturnFilingStatusCd[5]</xsl:with-param>
									</xsl:call-template>Qualifying widow(er) (QW)</label>
									<span style="width:6mm"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Filing Status - Protective Return Ind</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturnInd"/>
									</xsl:call-template>	
							</span>
							<br />
							<span style="width:0mm;"/><span style="font-size:7pt">
								If you checked the QW box, enter the child's name if the 
								<br/>qualifying person is a	child but not your dependent <img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								<span style="width:97mm;border-bottom:dotted 1px;padding-left:0mm;">
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
									<xsl:if test="$FormData/QualifyingHOHNm or $FormData/QualifyingHOHSSN">
										<span style="width:8px;"/></xsl:if>
									<xsl:if test="$FormData/QualifyingPersonName">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
												select="$FormData/QualifyingPersonName/PersonFirstNm"/>
										</xsl:call-template>
										<span style="width:4px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
												select="$FormData/QualifyingPersonName/PersonLastNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Filing Status - Qualifying Person SSN</xsl:with-param>
										<xsl:with-param name="TargetNode" 
											select="$FormData/QualifyingPersonSSN"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv">
						<div class="styIRS1040NRHeaderCell" style="width:78mm;height:12mm">
							Your first name and middle initial <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<span style="width:4px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" 
									select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:63mm;height:12mm">
							Last name <br /> &nbsp;
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:46mm;height:12mm;
							border-right-width:0px;padding-left:1mm;">
							<strong>Your identifying number</strong><br />
								(see instructions)<br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN">
								<xsl:with-param name="EINChanged" select="true()"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040NRHeaderCell" style="width:129mm;height:10.5mm;">
							<span style="font-family:Arial;">Home address (number and street or rural route).
								If you have a P.O. box, see instructions.</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:12.06mm;
							height:10.5mm;font-family:Arial;">Apt. no. <br /> &nbsp;</div>
						<div class="styIRS1040NRHeaderCell" style="width:45.9mm;
							float:left;padding-left:3px;height:10.5mm;border-right-width:0mm">
							<span style="width:15mm;height:6mm;float:left;">Check if:</span>
							<span style="float:left;">
								<input type="checkbox" class="sty1040NRCkbox" style="margin-top:1px;"
									checked="checked" alt="Individual Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/IndividualInd
										</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="margin-left:3px;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/IndividualInd
										</xsl:with-param>
									</xsl:call-template>Individual</label>
									<br/>
									<input type="checkbox" class="sty1040NRCkbox" alt="Estate Or Trust Ind">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" 
											select="$FormData/EstateOrTrustInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/EstateOrTrustInd
											</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="margin-left:3px;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" 
											select="$FormData/EstateOrTrustInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/EstateOrTrustInd
											</xsl:with-param>
										</xsl:call-template>Estate or Trust</label>
								</span>
							</div>
							<div class="styIRS1040NRHeaderCell" style="width:45.9mm;height:18mm;
								border-right-width:0px;float:right">
						</div>
						<div class="styIRS1040NRHeaderCell"
							style="width:141.06mm;">
							<div class="styIRS1040NRHeaderCell" style="font-family:Arial;	width:95mm;
								padding-left:0px">City, town, or post office. If you have a foreign address,
								also complete spaces below.<br />
								<xsl:if test="$RtnHdrData/Filer/USAddress">
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
									select="$RtnHdrData/Filer/USAddress/CityNm">
									</xsl:with-param>
								</xsl:call-template>
								<!--<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>-->
								</xsl:if>
								<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="styIRS1040NRHeaderCell" style="font-family:Arial;width:20mm;">State
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
										select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd">
									</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS1040NRHeaderCell" style="font-family:Arial;	width:24mm;
								border-right-width:0px">ZIP code
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
										select="$RtnHdrData/Filer/USAddress/ZIPCd">
									</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:60mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign country name</span>
							<br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
								<xsl:with-param name="MainForm" select="true()"/>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:41mm;height:10.5mm;">
							<span style="font-family:Arial;">Foreign province/state/county</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
						<div class="styIRS1040NRHeaderCell" style="width:40.06mm;height:10.5mm;
							font-family:Arial;">
							<span style="font-family:Arial;">Foreign postal code</span> <br /> 
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
							</xsl:call-template>
							&nbsp;
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styIRS1040NRHeaderCell" style="width:187mm;height:7.5mm;
							border-right-width:0mm;">At any time during 2021, did you receive, sell, exchange, or otherwise dispose of any financial interest in any virtual currency? 
							<span style="font-family:Arial Narrow;font-size:8pt;">
								<input type="checkbox" class="styCkboxNM" 
									style="margin-left:2mm;margin-top:2mm" alt="Virtual Cur Acquired Dur TY Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
									 <xsl:with-param name="TargetNode" 
										select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName"
										select="IRS1040NRVirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabelYes">
									 <xsl:with-param name="TargetNode" 
										select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName"
										select="IRS1040NRVirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
									<b>Yes</b>
								</label>
								<span style="width:10px;"/>
								<input type="checkbox" class="styCkboxNM"
									alt="Virtual Cur Acquired Dur TY Ind No">
									<xsl:call-template name="PopulateNoCheckbox">
									 <xsl:with-param name="TargetNode" 
										select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName"
										select="IRS1040NRVirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabelNo">
									 <xsl:with-param name="TargetNode" 
										select="$FormData/VirtualCurAcquiredDurTYInd"/>
									 <xsl:with-param name="BackupName"
										select="IRS1040NRVirtualCurAcquiredDurTYInd"/>
									</xsl:call-template>
									<b>No</b>
								</label>
							</span>
						</div>
					</div>
					<!-- Virtual Currency section -->
					<div class="styStdDiv">
						<div class="styIRS1040NRHeaderCell" style="width:187mm;height:12mm;
							border-right-width:0mm">
							<span style="float:right;padding-top:7.5mm">
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
					<div class="sty1040NRDepdContainer" style="">
						<div class="styGenericDiv" style="width:20mm;padding-top:1mm;
							font-family:Arial;font-size:9pt;border-bottom:0px solid black;height:29mm">
							<div style="width:100%;padding-bottom:3mm;padding-left:1mm;">
								<strong>Dependents</strong><br />
								<span style="font-size:8pt;font-family:Arial Narrow">(see instructions):
									<br/><br/>If more than four dependents, see instructions and check here
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
						<div class="sty1040NRDepdContainer2" style="" id="depdContainerId">
						  <xsl:call-template name="SetInitialState"/>
						  <table class="styTable" style="display:table;font-size:6pt;border-collapse:collapse;
							width:167mm;">	
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" rowspan="2"	scope="col" 
										style="min-width:59.4mm;width:59.4mm;text-align:left;padding-left:1mm;
										padding-top:0mm;">
										<br/>
										<div style="font-weight:normal;padding-top:15px;padding-left:1mm">
											<span style="font-weight:bold">(1)</span><span style="width:1mm;"/>
												First name
											<span style="width:12mm;"/>Last name
										</div>
									</th>
									<th class="styTableCellHeader" rowspan="2"
										scope="col" style="min-width:24mm;width:30.2mm;border-right-width:1px;
										vertical-align:top;">
										<span style="font-weight:normal">
											<b>(2)</b><span style="width:.5mm"/>Dependent's <br/>
											identifying number
										</span>														
									</th>
									<th class="styTableCellHeader" rowspan="2"	scope="col" 
										style="min-width:24mm;width:25.6mm;
										border-right-width:1px;vertical-align:top;">
										<span style="font-weight:normal;">
											<b>(3)</b><span style="width:.5mm"/>Dependent's relationship to you
										</span>
									</th>
									<th class="styTableCellHeader" colspan="2"
										scope="colgroup" style="width:45.6mm;border-right-width:0px;
										border-bottom-width:0px;vertical-align:top;">
										<span style="font-weight:normal">
											<b>(4)</b><img src="{$ImagePath}/1040_Check.gif" alt="Check"/>
											<span style="width:.5mm"/>if qualifies for (see instr.):
										</span>
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col"
										style="width:19.6mm;font-weight:normal;border-right-width:0px;">
										Child tax credit
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;
										font-weight:normal;border-right-width:0px;">Credit for other<br/>
										dependents
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
												<input type="Checkbox" class="styCkboxNM" alt="Eligible For Child Tax Credit Ind">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
														<xsl:with-param name="BackupName">
															IRS1040NRDependentInformation<xsl:number value="position()"/>
EligibleForChildTaxCreditInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for CTC Indicator</xsl:attribute>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="Checkbox" class="styCkboxNM" alt="Eligible For ODC Ind">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
														<xsl:with-param name="BackupName">
															IRS1040NRDependentInformation<xsl:number value="position()"/>
EligibleForODCInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for ODC Indicator</xsl:attribute>
												</input>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<!-- Table Filler Rows -->
								<xsl:if test="count($FormData/DependentDetail) &lt; 1 or 
									((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
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
													<xsl:with-param name="BackupName">
													IRS1040NRDependentInformation1EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 1 Eligible for ODC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">
													IRS1040NRDependentInformation1EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/DependentDetail) &lt; 2 or 
									((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
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
													<xsl:with-param name="TargetNode" 	select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">
													IRS1040NRDependentInformation2EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 2 Eligible for ODC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">
													IRS1040NRDependentInformation2EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/DependentDetail) &lt; 3 or
									((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
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
													<xsl:with-param name="TargetNode" 													select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">
													IRS1040NRDependentInformation3EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="Checkbox" class="styCkboxNM" alt="Dependent 3 Eligible for ODC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">
													IRS1040NRDependentInformation3EligibleForODCInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="count($FormData/DependentDetail) &lt; 4 or 
									((count($FormData/DependentDetail) &gt; 4) and ($Print = $Separated))">
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
											<input type="Checkbox" class="styCkboxNM" 
												alt="Dependent 4 Eligible for CTC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode"
														select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">
													IRS1040NRDependentInformation4EligibleForChildTaxCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="Checkbox" class="styCkboxNM" 
												alt="Dependent 4 Eligible for ODC Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
													<xsl:with-param name="BackupName">
													IRS1040NRDependentInformation4EligibleForODCInd</xsl:with-param>
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
						<div class="styGenericDiv" style="width:20mm;padding-top:2mm;height:106mm;">
							<div style="width:100%;padding-top:1mm;padding-left:1mm;font-family:Arial;
								font-size:10pt"><strong>Income<br/>Effectively<br/>Connected<br/>
								With U.S.<br/>Trade or<br/>Business</strong><br />
							</div>
						</div>
						<!-- Line 1a -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">1a</div>
							<div class="sty1040NRDesc">Wages, salaries, tips, etc. Attach Form(s) W-2
								<xsl:if test="count($FormData/WagesNotShownGrp) &lt; 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 1a - Wages Literal Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/WagesLiteralCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 1a - Other Wages Not Shown Text</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/OtherWagesNotShownTxt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 1a - Wages Not Shown Amount	</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/WagesNotShownAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/WagesNotShownGrp) &gt;= 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 1a - Wages Not Shown Group</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp"/>
									</xsl:call-template>
								</xsl:if>
								<span class="sty1040NRDotLn">..............</span>
							</div>
							<div class="sty1040NRRightNumBox">1a</div>
							<div class="sty1040NRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/WagesSalariesAndTipsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/WagesSalariesAndTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1b -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:3.4mm">b</div>
							<div class="sty1040NRDesc">
								Scholarship and fellowship grants. Attach Form(s) 1042-S or required statement.
									See instructions
							</div>
							<div class="sty1040NRRightNumBox">1b</div>
							<div class="sty1040NRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" 
											select="$FormData/GrantsOrScholarshipsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/GrantsOrScholarshipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 1c -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:3.4mm;">c</div>
							<div class="sty1040NRDesc" style="width:87mm;height:7.5mm;">
								Total income exempt by treaty from Schedule OI (Form 1040-NR),<br/>
								<span style="padding-top:1mm;">Item L, line 1(e) <span style="width:1mm"/>
									<span class="sty1040NRDotLn" style="">...............</span>
								</span>
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1.7mm;height:7.5mm;
								padding-top:3.5mm">1c	</div>
							<div class="sty1040NRAmountBox" style="height:7.5mm;padding-top:3.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TreatyTaxExemptUSIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:7.5mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:7.5mm">&nbsp;</div>
						</div>
						<!-- Line 2 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">2a</div>
							<div class="sty1040NRDesc" style="width:31mm;">Tax-exempt interest
								<span class="sty1040NRDotLn">.</span></div>
							<div class="sty1040NRRightNumBox">2a</div>
							<div class="sty1040NRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TaxExemptInterestAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040NRDesc" style="width:49mm;">
								Taxable interest 
								<span class="sty1040NRDotLn">......</span></div>
							<div class="sty1040NRRightNumBox">2b</div>
							<div class="sty1040NRAmountBox" style="width:29mm;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/TaxableInterestAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">3a</div>
							<div class="sty1040NRDesc" style="width:31mm;">
								Qualified dividends
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3a -  Qualified Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBox">3a</div>
							<div class="sty1040NRAmountBox" style="border-right-width:1px;">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 3a - Qualified Dividends Form 8814 Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" 
											select="$FormData/QualifiedF8814Amt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/QualifiedDividendsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040NRDesc" style="width:49mm;">
								Ordinary dividends. 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 3b - Ordinary Dividends Form 8814 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
								</xsl:call-template>
								<span class="sty1040NRDotLn">...</span>
							</div>
							<div class="sty1040NRRightNumBox">3b</div>
							<div class="sty1040NRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/OrdinaryDividendsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/OrdinaryDividendsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">4a</div>
							<div class="sty1040NRDesc" style="width:31mm;">IRA distributions 
								<span class="sty1040NRDotLn">..</span></div>
							<div class="sty1040NRRightNumBox">4a</div>
							<div class="sty1040NRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 	select="$FormData/IRADistributionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040NRDesc" style="width:49mm;">
								Taxable amount
								<xsl:if test="count($FormData/IRADistributionsGrp) &lt; 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsGrp/IRADistributionsLiteralCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Amount	</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsGrp/IRADistributionsLiteralAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/IRADistributionsGrp) &gt;= 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 4b - IRA Distributions Groups</xsl:with-param>
										<xsl:with-param name="TargetNode"	select="$FormData/IRADistributionsGrp"/>
									</xsl:call-template>
								</xsl:if>
								<span class="sty1040NRDotLn">.....</span>
							</div>
							<div class="sty1040NRRightNumBox">4b</div>
							<div class="sty1040NRAmountBox">
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
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm;">5a</div>
							<div class="sty1040NRDesc" style="width:31mm;">Pensions and annuities</div>
							<div class="sty1040NRRightNumBox">5a</div>
							<div class="sty1040NRAmountBox" style="border-right-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/PensionsAnnuitiesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftLtrBox" style="width:7mm;">b</div>
							<div class="sty1040NRDesc" style="width:49mm;">
								Taxable amount
								<xsl:if test="count($FormData/PensionsAnnuitiesGrp) &lt; 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 5b - Pensions Annuities Literal Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesGrp/PensionsAnnuitiesLiteralCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 5b - Pensions Annuities Literal Amount	</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesGrp/PensionsAnnuitiesLiteralAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/PensionsAnnuitiesGrp) &gt;= 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 5b - Pensions Annuities Groups</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesGrp"/>
									</xsl:call-template>
								</xsl:if>
								<span class="sty1040NRDotLn">.....</span>
							</div>
							<div class="sty1040NRRightNumBox">5b</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">6</div>
							<div class="sty1040NRDesc">Reserved for future use
								<span class="sty1040NRDotLn">.......................</span>
							</div>
							<div class="sty1040NRRightNumBox">6</div>
							<div class="sty1040NRAmountBox" style="background-color:lightgrey">
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocSecBnftAmt"/>
								</xsl:call-template>-->
							</div>
						</div>
						<!-- Line 7 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">7</div>
							<div class="sty1040NRDesc" style="font-size:6.5pt">
								Capital gain or (loss). Attach Schedule D (Form 1040) if required. If not required, 
								check here 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 7 - Form 8814 Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 7 - Form 8814 Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
								</xsl:call-template>
								<span style="float:right;"><img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/> 
									<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" alt="Schedule D not required">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" 
												select="$FormData/CapitalDistributionInd"/>
											<xsl:with-param name="BackupName">IRS1040NRCapitalDistributionInd
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
							</div>
							<div class="sty1040NRRightNumBox">7</div>
							<div class="sty1040NRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
											select="$FormData/CapitalGainLossAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/CapitalGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 8 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:1.7mm">8</div>
							<div class="sty1040NRDesc">Other income from Schedule 1, (Form 1040), line 10
								<span class="sty1040NRDotLn">..............</span>
							</div>
							<div class="sty1040NRRightNumBox">8</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalAdditionalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD"	style="padding-left:1.7mm;">9</div>
							<div class="sty1040NRDesc">Add lines 1a, 1b, 2b, 3b, 4b, 5b, 7, and 8. This is your
								<strong>total effectively connected income</strong>
								<span style="width:5px"/><img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							</div>
							<div class="sty1040NRRightNumBox">9</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalECIAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD"	style="padding-left:0mm;">10</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								Adjustments to income:
							</div>
							<div class="sty1040NRRightNumBox" style="height:4mm;
								border-bottom-width:0mm">
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;border-bottom-width:0mm">
							</div>
							<div class="sty1040NRRightNumBoxNBB" 
								style="background-color:lightgrey;height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>	
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD"	style="padding-left:2.8mm;">a</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								<span style="padding-top:0mm;">From Schedule 1 (Form 1040), line 26 
									<span style="width:1.7mm"/>
									<span class="sty1040NRDotLn" style="">.........</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">10a
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalAdjustmentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD"	style="padding-left:2.8mm;">b</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								<span style="padding-top:0mm;">Reserved for future use 
									<span style="width:4.1mm"/>
									<span class="sty1040NRDotLn" style="">.............</span>
							</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">10b
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm;background-color:lightgrey">
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/CharitableContributionAmt"/>
								</xsl:call-template>-->
							</div>
							<div class="sty1040NRRightNumBoxNBB" 
								style="background-color:lightgrey;height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:2.8mm;">c</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								<span style="padding-top:0mm;">Scholarship and fellowship grants excluded
									<span style="width:3.7mm"/>
									<span class="sty1040NRDotLn" style="">.......</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">10c
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									select="$FormData/GrantsOrScholarshipsExcldAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:2.8mm;">d</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Add lines 10a and 10c. These are your 
									<strong>total adjustments to income</strong> 
									<span style="width:2.6mm"/>
									<span class="sty1040NRDotLn" style="padding-right:0px;
										width:32mm;">.......<img src="{$ImagePath}/1040_Bullet.gif"	alt="Right arrow"/>
									</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">10d
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalAdjustmentsToIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">11</div>
							<div class="sty1040NRDesc">
								Subtract line 10d from line 9. This is your <strong>adjusted gross income</strong>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11 - Excluded Section 933 Puerto Rico Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ExcldSect933PuertoRicoIncmAmt/@excldSect933PuertoRicoIncmCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 11 - Excluded Section 933 Puerto Rico Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
								</xsl:call-template>
								<span class="sty1040NRDotLn" style="padding-right:0px;
									margin-right:8px;">........<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								</span>
							</div>
							<div class="sty1040NRRightNumBox">11</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 12 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="border-left:2px solid white;
								padding-left:0mm;margin-left:-2px;margin-right:2px;">12a</div>
							<div class="sty1040NRDesc" style="width:87mm;padding-top:0.7mm;height:7.5">
								<strong>Itemized deductions</strong> (from Schedule A	(Form 1040-NR)) or, 
								for certain residents of India, standard deduction. See instructions 
								<span style="width:.5mm"/><span class="sty1040NRDotLn">.</span>
							</div>
							<div class="sty1040NRRightNumBox"
								style="height:7.5mm;padding-top:3.5mm">12a</div>
							<div class="sty1040NRAmountBox" style="height:7.5mm;padding-top:3.5mm">
								<xsl:choose>
									<xsl:when test="$FormData/IndiaStandardDedTaxTreatyGrp">
										<span style="float:left;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" 
						select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyCd"/>
												<xsl:with-param name="Desc">Line 12 - India Standard Deduction Tax Treaty Code</xsl:with-param>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
						select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" 
												select="$FormData/TotalItemizedDeductionsAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<div class="sty1040NRRightNumBoxNBB" 
								style="background-color:lightgrey;height:7.5mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:7.5mm">&nbsp;</div>
							<div class="sty1040NRLN">	
								<div class="styLNLeftNumBoxSD"	style="padding-left:3.6mm;">b</div>
								<div class="sty1040NRDesc" style="width:87mm;height:4mm;font-size:6.8pt;">
									<span style="padding-top:.3mm;">Charitable contributions for certain residents of 
									India. See instructions
									<!--<span style="width:0mm"/>
									<span class="sty1040NRDotLn" style="">.</span>-->
									</span>	
								</div>
								<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">12b
								</div>
								<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/CharitableContributionAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" 
								style="background-color:lightgrey;height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
							</div>
							<div class="styLNLeftNumBoxSD" style="border-left:2px solid white;
								padding-left:0mm;margin-left:-2px;margin-right:2px;">12c</div>
							<div class="sty1040NRDesc" style="width:123mm;padding-top:0.7mm;height:7.5">
								Add lines 12a and 12b 
								<span class="sty1040NRDotLn">.......................</span>
							</div>
							<div class="sty1040NRRightNumBox"
								style="height:4mm;padding-top:.3mm">12c</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.3mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
						select="$FormData/TotDedCharitableContriAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13 -->
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD"	style="padding-left:0mm;">13a</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;font-size:6.7pt">
								<span style="padding-top:.5mm;">Qualified business income deduction from Form 8995 or Form 8995-A
									<!--<span class="sty1040NRDotLn" style="">..</span>-->
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" 
								style="padding-left:1mm;height:4mm;">13a</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm;">
								<span style="float:left">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
									select="$FormData/QualifiedBusinessIncomeDedAmt"/>
									</xsl:call-template>
								</span>
								<span style="width:0mm"/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									select="$FormData/QualifiedBusinessIncomeDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">b</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								<span style="padding-top:.3mm;">Exemptions for estates and trusts only. 
									See instructions
									<span style="width:1.7mm"/>
									<span class="sty1040NRDotLn" style="">...</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">13b
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm;">
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotQlfyBusinessIncomeDedAmt"/>
								</xsl:call-template>-->
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" 
								style="padding-left:3.5mm;">c</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Add lines 13a and 13b
									<span style="width:1.5mm"/>
									<span class="sty1040NRDotLn" 
										style="padding-right:0px;width:28mm;">.......................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">13c
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotQlfyBusinessIncomeDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" 
								style="padding-left:0mm;">14</div>
							<div class="sty1040NRDesc">
								Add lines 12c and 13c
								<span class="sty1040NRDotLn">.......................</span>
							</div>
							<div class="sty1040NRRightNumBox">14</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm;">15</div>
							<div class="sty1040NRDesc" style="padding-top:0mm">
								<strong>Taxable income. </strong> Subtract line 14 from line 11.	If zero or
									less, enter -0-
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Code</xsl:with-param>
									<xsl:with-param name="TargetNode"
									select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 15 - Schedule Q Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
								</xsl:call-template>
								<span class="sty1040NRDotLn">......</span>
							</div>
							<div class="sty1040NRRightNumBoxNBB">15</div>
							<div class="sty1040NRAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									select="$FormData/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- End -->
					<!--</div>-->
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Disclosure, Privacy Act, and
							Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:17mm;font-size:6.5pt;">Cat. No. 11364D</span>
						<span style="float:right;font-size:6.5pt;">Form <strong>1040-NR</strong> (2021)
						</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						Form 1040-NR (2021)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;	overflow:visible;">
						<div class="styGenericDiv" style="width:20mm;height:120mm;">
						</div>
						<!-- Line 16 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm;padding-top:1mm">16</div>
							<div class="sty1040NRDesc" style="width:123mm;
								font-family:Arial;font-size:7pt">
								<span style="font-weight:bold;font-family:Verdana;">Tax 
								</span> (see instructions). Check if any from Form(s): 
								<span style="font-weight:bold;font-family:Verdana;
									width:3mm;text-align:center;">1</span>
								<input type="checkbox" class="styCkboxNM"
									alt="8814 Indicator" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">F1040NRForm8814Ind
										</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:1mm;font-family:Arial;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">F1040NRForm8814Ind
										</xsl:with-param>
									</xsl:call-template>8814
								</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
									<xsl:with-param name="TargetNode"
			select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
								</xsl:call-template>
								<span style="width:1mm;height:3mm;"/>
								<span style="font-weight:bold;font-family:Verdana;padding-left:1mm;
									padding-right:1mm">2
								</span>
								<input type="checkbox" class="styCkboxNM" alt="4972 Indicator" style="">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">F1040NRForm4972Ind
										</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:1mm;font-family:Arial;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">F1040NRForm4972Ind
										</xsl:with-param>
									</xsl:call-template>4972
								</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
								</xsl:call-template>
								<span style="width:1mm;height:3mm;"/>
								<span style="font-weight:bold;font-family:Verdana;padding-left:1mm;
									padding-right:1mm">3
								</span>
								<input type="checkbox" class="styCkboxNM" 
									style="margin-right:1mm;" alt="Other Tax Amounts">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode"
											select="$FormData/OtherTaxAmtInd"/>
										<xsl:with-param name="BackupName">
											F1040NROtherTaxAmtInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="border-bottom:1px solid black;
									width:10mm">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtInd"/>
									</xsl:call-template>
									<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
										<xsl:call-template
											name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
											<xsl:with-param name="TargetNode"
									 select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
										</xsl:call-template>
										<xsl:call-template
											name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount</xsl:with-param>
											<xsl:with-param name="TargetNode"
										select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="count($FormData/OtherTaxAmtGrp) &gt;= 2">
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Line 16(3) - Other Tax Groups</xsl:with-param>
											<xsl:with-param name="TargetNode"
												select="$FormData/OtherTaxAmtGrp"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode"
										select="$FormData/TaxAmt"/>
								</xsl:call-template>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode"
									select="$FormData/CanadaIncomeTaxTreatyArtXXVCd"/>
								</xsl:call-template>
								<xsl:call-template
											name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Canada Income Tax Treaty Article XXV Code</xsl:with-param>
											<xsl:with-param name="TargetNode"
										select="$FormData/CanadaIncomeTaxTreatyArtXXVCd"/>
										</xsl:call-template>
								
							</div>
							<div class="sty1040NRRightNumBox">16</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">17</div>
							<div class="sty1040NRDesc">
								Amount from Schedule 2, (Form 1040), line 3
								<span class="sty1040NRDotLn">................</span>
							</div>
							<div class="sty1040NRRightNumBox">17</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/AdditionalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 18 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm">18
							</div>
							<div class="sty1040NRDesc">
								Add lines 16 and 17
								<span class="sty1040NRDotLn">........................</span>
							</div>
							<div class="sty1040NRRightNumBox">18</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 19 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm">19</div>
							<div class="sty1040NRDesc" style="width:123mm;">
								Nonrefundable child tax credit or credit for other dependents from Schedule 8812
								<span class="sty1040NRDotLn" style="padding-right:1px;">.....</span>
							</div>
							<div class="sty1040NRRightNumBox">19</div>
							<div class="sty1040NRAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/CTCODCAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/NrfdblCTCODCOrNrfdblODCAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">20</div>
							<div class="sty1040NRDesc">
								Amount from Schedule 3 (Form 1040), line 8
								<span class="sty1040NRDotLn">................</span>
							</div>
							<div class="sty1040NRRightNumBox">20</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalNonrefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm">21</div>
							<div class="sty1040NRDesc">
								Add lines 19 and 20
								<span class="sty1040NRDotLn">........................</span>
							</div>
							<div class="sty1040NRRightNumBox">21</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 22 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm">22</div>
							<div class="sty1040NRDesc">
								Subtract line 21 from line 18. If zero or less, enter -0-
								<span class="sty1040NRDotLn">.............</span>
							</div>
							<div class="sty1040NRRightNumBox">22</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 23 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD"	style="padding-left:0mm;">23a</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								Tax on income not effectively connected with a U.S. trade or 
							</div>
							<div class="sty1040NRRightNumBox" style="height:4mm;
								border-bottom-width:0mm">
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;border-bottom-width:0mm">
							</div>
							<div class="sty1040NRRightNumBoxNBB" 
								style="background-color:lightgrey;height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>	
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD"	style="padding-left:2.8mm;"></div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								<span style="padding-top:0mm;">business from Schedule NEC (Form 1040-NR),
									line 15<span style="width:3.5mm"/>
									<span class="sty1040NRDotLn" style="">....</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">23a
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/IncomeNotUSBusinessTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD"	style="padding-left:3.5mm;">b</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								Other taxes, including self-employment tax, from Schedule 2 (Form  
							</div>
							<div class="sty1040NRRightNumBox" style="height:4mm;
								border-bottom-width:0mm">
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;border-bottom-width:0mm">
							</div>
							<div class="sty1040NRRightNumBoxNBB" 
								style="background-color:lightgrey;height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>	
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD"	style="padding-left:2.8mm;"></div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								<span style="padding-top:0mm;">1040), line 21<span style="width:3.5mm"/>
									<span class="sty1040NRDotLn" style="">................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">23b
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalOtherTaxesAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">c</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								<span style="padding-top:0mm;">Transporation tax (see instructions)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/TotalUSSourceGrossTransIncmAmt"/>
									</xsl:call-template>
									<span style="width:0mm"/>
									<span class="sty1040NRDotLn" style="">.........</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">23c
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									select="$FormData/TotalUSSourceGrossTransIncmAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">d</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Add lines 23a through 23c 
									<span style="width:1.5mm"/>
									<span class="sty1040NRDotLn"	style="padding-right:0px;
										width:28mm;">......................	</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">23d
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/TotalNECTransOtherTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 24 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm">24</div>
							<div class="sty1040NRDesc">
								Add lines 22 and 23d. This is your <strong>total tax </strong> 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Total Tax Deferred Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/Form8854DeferredTaxGrp[1]/TotalTaxDeferredAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
						<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Expatriation Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 	
									select="$FormData/Form8854DeferredTaxGrp[1]/ExpatriationCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 24 - Deferred Tax 2 Total Tax Deferred							Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/Form8854DeferredTaxGrp[2]/TotalTaxDeferredAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 24 - Deferred Tax 2 Expatriation Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/Form8854DeferredTaxGrp[2]/ExpatriationCd"/>
								</xsl:call-template>
								<span class="sty1040NRDotLn" style="padding-right:0px;margin-right:8px;">
									.............<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								</span>
							</div>
							<div class="sty1040NRRightNumBox">24</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 25 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD"	style="padding-left:0mm;">25</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								Federal income tax withheld from: 
							</div>
							<div class="sty1040NRRightNumBox" style="height:4mm;
								border-bottom-width:0mm">
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;border-bottom-width:0mm">
							</div>
							<div class="sty1040NRRightNumBoxNBB" 
								style="background-color:lightgrey;height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD"	style="padding-left:3.5mm;">a</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">Form(s) W-2
								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/FormW2WithheldTaxAmt"/>
									</xsl:call-template>
									<span style="width:.5mm"/>
								<span class="sty1040NRDotLn" style="">................</span>
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25a
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/FormW2WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD"	style="padding-left:3.5mm;">b</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								<span style="padding-top:0mm;">Form(s) 1099<span style="width:1.5mm"/>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/Form1099WithheldTaxAmt"/>
									</xsl:call-template>
									<span style="width:.5mm"/>
									<span class="sty1040NRDotLn" style="">................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25b
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
									<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/Form1099WithheldTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">c</div>
							<div class="sty1040NRDesc" style="width:87mm;height:4mm;">
								<span style="padding-top:0mm;">Other forms (see instructions)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/TaxWithheldOtherAmt"/>
									</xsl:call-template>
									<span style="width:.5mm"/>
									<span class="sty1040NRDotLn" style="">...........</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25c
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode"
									select="$FormData/TaxWithheldOtherAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;
								height:4mm">&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:4mm">&nbsp;</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">d</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Add lines 25a through 25c
									<span style="width:2.5mm"/>
									<span class="sty1040NRDotLn"	style="padding-right:0px;
										width:28mm;">......................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25d
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/WithholdingTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">e</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Form(s) 8805 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/WithholdingTxFrom8805Amt"/>
									</xsl:call-template>
									<span style="width:2.5mm"/>
									<span class="sty1040NRDotLn"	style="padding-right:0px;
										width:28mm;">.........................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25e
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/WithholdingTxFrom8805Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">f</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Form(s) 8288-A
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/WithholdingTxFrom8288AAmt"/>
									</xsl:call-template>
									<span style="width:3.5mm"/>
									<span class="sty1040NRDotLn"	style="padding-right:0px;
										width:28mm;">........................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25f
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/WithholdingTxFrom8288AAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="sty1040NRLN">	
							<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm;">g</div>
							<div class="sty1040NRDesc" style="height:4mm;">
								<span style="padding-top:0mm;">Forms(s) 1042-S 
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/WithholdingTxFrom1042SAmt"/>
									</xsl:call-template>
									<span style="width:2mm"/>
									<span class="sty1040NRDotLn"	style="padding-right:0px;
										width:28mm;">........................</span>
								</span>	
							</div>
							<div class="sty1040NRRightNumBox" style="padding-left:1mm;height:4mm;">25g
							</div>
							<div class="sty1040NRAmountBox" style="height:4mm;padding-top:.5mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/WithholdingTxFrom1042SAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 26 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm">26</div>
							<div class="sty1040NRDesc">
								2021 estimated tax payments and amount applied from 2020 return
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 26 - Divorced Spouse SSN</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 26 - Divorced Literal Cd</xsl:with-param>
										<xsl:with-param name="TargetNode" 
										select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
									</xsl:call-template>
									<span style="width:2px"/>	
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode"
											select="$FormData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
									<span style="width:2.1mm"/>
									<span class="sty1040NRDotLn">......</span>
							</div>
							<div class="sty1040NRRightNumBox">26</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/EstimatedTaxPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 27 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="border-top:0px solid black;
								border-bottom:0px solid black;border-left:2px solid white;margin-left:-2px;
								margin-right:2px;padding-left:0mm;">27</div>
							<div class="sty1040NRDesc" style="width:87mm;padding-top:0.7mm;">
								Reserved for future use 
								<!--<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - Earned Income Credit Eligibility Literal Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/EICEligibilityLiteralCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - EIC Prior Year Earned Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - EIC Prior Year Earned Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/PYEarnedIncmEICGrp/PriorYearEarnedIncomeAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - Nontaxable Combat Pay Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NontaxableCombatPayCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 27 - Nontaxable Combat Pay Election Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/NontxCombatPayElectionAmt"/>
								</xsl:call-template>-->
								<span class="sty1040NRDotLn" style="padding-right:1px;">..............</span>
							</div>
							<div class="sty1040NRRightNumBox">27</div>
							<div class="sty1040NRAmountBox" style="background-color:lightgrey;">
								<!--<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
										select="$FormData/EarnedIncomeCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EarnedIncomeCreditAmt"/>
								</xsl:call-template>-->
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040NRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 28 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">28</div>
							<div class="sty1040NRDesc" style="width:87mm;">
								Refundable child tax credit or additional child tax credit from <br/>
								Schedule 8812 (Form 1040)
								<span class="sty1040NRDotLn" style="padding-right:1px;">..........</span>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 28 - Additional Child Prior Year Earned Income Code</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/PriorYearEarnedIncomeCd"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 28 - Additional Child Prior Year Earned Income Amount</xsl:with-param>
									<xsl:with-param name="TargetNode" 
									select="$FormData/PriorYearEarnedIncomeAmt"/>
								</xsl:call-template>
								<span class="sty1040NRDotLn" style="padding-right:1px;"></span>
							</div>
							<div class="sty1040NRRightNumBox" style="height:7.5mm;padding-top:4mm">28</div>
							<div class="sty1040NRAmountBox" style="height:7.5mm;padding-top:4mm">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" 
										select="$FormData/RefundableCTCOrACTCAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/RefundableCTCOrACTCAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;height:7.5mm">
								&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="height:7.5mm">&nbsp;</div>
						</div>
						<!-- Line 29 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">29</div>
							<div class="sty1040NRDesc" style="width:87mm;">
								Credit for amount paid with Form 1040-C
								<span class="sty1040NRDotLn" style="padding-right:1px;">........</span>
							</div>
							<div class="sty1040NRRightNumBox">29</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/PaidWithForm1040CAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">
								&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 30 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">30</div>
							<div class="sty1040NRDesc" style="width:87mm;">
								Reserved for future use
								<span class="sty1040NRDotLn" style="padding-right:1px;">..............</span>
							</div>
							<div class="sty1040NRRightNumBox">30</div>
							<div class="sty1040NRAmountBox" style="background-color:lightgrey;">
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">
								&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 31 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;">31</div>
							<div class="sty1040NRDesc" style="width:87mm;">
								Amount from Schedule 3 (Form 1040), line 15
								<span class="sty1040NRDotLn" style="padding-right:1px;">.......</span>
							</div>
							<div class="sty1040NRRightNumBox">31</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
										select="$FormData/TotalOtherPaymentsRfdblCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">
								&nbsp;</div>
							<div class="sty1040NRAmountBoxNBB" style="">&nbsp;</div>
						</div>
						<!-- Line 32 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox" style="padding-left:0mm;">32</div>
							<div class="sty1040NRDesc">
								Add lines 28, 29, and 31. These are your <strong>total other payments and refundable credits </strong> 
								<span class="sty1040NRDotLn" style="padding-right:0px;margin-right:8px;">
									.<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								</span>
							</div>
							<div class="sty1040NRRightNumBox">32</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" 
									select="$FormData/RefundableCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 33 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBoxSD" style="padding-left:0mm;
								border-top:0px solid black;border-bottom:0px solid black;
								border-left:2px solid white;margin-left:-2px;margin-right:2px;">33</div>
							<div class="sty1040NRDesc">
								Add lines 25d, 25e, 25f, 25g, 26 and 32. These are your <strong>total payments </strong> 
								<span class="sty1040NRDotLn" style="padding-right:0px;margin-right:8px;">
								    ......<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								</span>
							</div>
							<div class="sty1040NRRightNumBoxNBB">33</div>
							<div class="sty1040NRAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Refund -->
					<div class="styGenericDiv" style="width:20mm;height:28mm;">
						<span style="font-weight:bold;font-size:10pt;">Refund</span>
						<br /><br />
						<span style="font-family:Arial;">
							Direct deposit? See instructions.
						</span>
					</div>
					<!-- Line 34 -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox" style="padding-left:0mm">34</div>
						<div class="sty1040NRDesc">
							If line 33 is more than line 24, subtract line 24 from line 33. This is the amount you
							<strong>overpaid </strong> 
						</div>
						<div class="sty1040NRRightNumBox">34</div>
						<div class="sty1040NRAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 35a -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox" style="padding-left:0mm">35a</div>
						<div class="sty1040NRDesc">
							Amount of line 34 you want <strong>refunded to you. </strong> If Form 8888 is
							attached, check here
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
							</xsl:call-template>
							<span style="float:right;">
								<span class="sty1040NRDotLn" style="float:none;margin-right:7px;
									letter-spacing:2mm;">.</span><img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								<span style="width:2px"/> 
								<input type="checkbox" class="styCkboxNM" style="margin-right:6px;" alt="Form 8888 attached">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
										<xsl:with-param name="BackupName">IRS1040NRForm8888Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="sty1040NRRightNumBox">35a</div>
						<div class="sty1040NRAmountBox">
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
					<!-- Line 35b, 35d -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox"><img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							b
						</div>
						<div class="sty1040NRDesc">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm">
							   Routing number
							</span>
							<span class="styLNCtrNumBox" style="width:34mm;border-top-width:1px;
								padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
								</xsl:call-template>
							</span>
							<span style="width:27px;"/>
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							<span style="width:4px;"/>
							<span class="styBoldText">c</span> Type:
							<span style="width:4px;"/>
							<!-- Checkbox  1=checking, 2 = savings -->
							<input type="checkbox" class="styCkboxNM" alt="Checking">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
									<xsl:with-param name="BackupName">IRS1040NRBankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="1"/>
									<xsl:with-param name="BackupName">IRS1040NRBankAccountTypeCd[1]</xsl:with-param>
								</xsl:call-template>
								Checking
							</label>
							<input type="checkbox" class="styCkboxNM" style="margin-left:5mm;" alt="Savings">
								<xsl:call-template name="PopulateEnumeratedCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040NRBankAccountTypeCd[2]</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
									<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
									<xsl:with-param name="BackupName">IRS1040NRBankAccountTypeCd[2]</xsl:with-param>
								</xsl:call-template>
								Savings
							</label>
						</div>
						<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">
							&nbsp;</div>
						<div class="sty1040NRAmountBoxNBB" style="background-color:lightgrey">&nbsp;</div>
					</div>
					<!-- Line 35d -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox"><img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							d
						</div>
						<div class="sty1040NRDesc" style="height:4.4mm;">
							<span style="width:25mm;float:left;clear:none;padding-top:0mm">
							   Account number
							</span>
							<span class="styLNCtrNumBox" style="width:84mm;border-top-width:1px;
								padding-top:0mm;padding-bottom:0mm;font-weight:normal">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="sty1040NRRightNumBoxNBB" style="height:4.4mm;
							background-color:lightgrey;">&nbsp;</div>
						<div class="sty1040NRAmountBoxNBB" style="height:4.4mm;background-color:lightgrey;">
							&nbsp;</div>
					</div>
					<!-- Line 35e -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox"><img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							e
						</div>
						<xsl:choose>
						    <xsl:when test="not($FormData/SeparateMailingAddress) or 
								$FormData/SeparateMailingAddress='' or 
								$FormData/SeparateMailingAddress/USAddress='' or
								$FormData/SeparateMailingAddress/USAddress/AddressLine1Txt=''"> 
								<div class="sty1040NRDesc" style="height:auto;">
									<span style="width:123mm;float:left;clear:none;padding-top:0mm;">
									   If you want your refund check mailed to an address outside the United states
									   not shown on page<br/>
									   1, enter it here. <span style="width:101mm;border-bottom:dotted 1px;
									   padding-left:0mm;"></span>
									</span>
							  	</div>
								<div class="sty1040NRRightNumBoxNBB" style="height:7.4mm;
									background-color:lightgrey;">&nbsp;</div>
								<div class="sty1040NRAmountBoxNBB" style="height:7.4mm;
									background-color:lightgrey;">&nbsp;</div>
							</xsl:when>
							<xsl:otherwise>
								<xsl:if test="not($FormData/SeparateMailingAddress)='' or 
								    not($FormData/SeparateMailingAddress/USAddress)=''">
								    <div class="sty1040NRDesc" style="height:auto;"> 
										<span style="width:125mm;float:left;clear:none;padding-top:0mm;">
											If you want your refund check mailed to an address outside the United
											states not shown on page<br/>
											<span style="width:123mm;border-bottom:dotted 1px;padding-left:0mm;">
												1, enter it here. 
												<xsl:choose>
													<xsl:when test="$FormData/SeparateMailingAddress/USAddress">
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/CityNm"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/StateAbbreviationCd"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/USAddress/ZIPCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<span style="width:4px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/AddressLine1Txt"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/CityNm"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/ProvinceOrStateNm"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/CountryCd"/>
														</xsl:call-template>
														<span style="width:5px"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" 
								select="$FormData/SeparateMailingAddress/ForeignAddress/ForeignPostalCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</span>
									</div>
									<div class="sty1040NRRightNumBoxNBB" style="height:10.4mm;
										background-color:lightgrey;">&nbsp;</div>
									<div class="sty1040NRAmountBoxNBB" style="height:10.4mm;
										background-color:lightgrey;">&nbsp;</div>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!-- Line 36 -->
					<div class="sty1040NRLN">
						<div class="styLNLeftNumBox">36</div>
						<div class="sty1040NRDesc" style="width:87mm;">
							<span style="display:inline;font-family:Arial;">Amount of line 34 you want
								<strong>applied to your 2022 estimated tax </strong></span>
							<span class="sty1040NRDotLn" style="padding-right:0px;
								margin-right:8px;">..<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							</span>
						</div>
						<div class="sty1040NRRightNumBoxNBB">36</div>
						<div class="sty1040NRAmountBoxNBB">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
						</div>
						<div class="sty1040NRAmountBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- You Owe -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:20mm;height:8mm;">
							<span style="font-weight:bold;font-size:9pt;">Amount <br />You Owe</span>
						</div>
						<!-- Line 37 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox">37</div>
							<div class="sty1040NRDesc">
								Subtract line 33 from line 24. This is the<strong> amount you owe </strong>
								<xsl:if test="count($FormData/InterestPenaltyTypeAndAmt) &lt; 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 37 - Interest Penalty Decription</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/InterestPenaltyTypeAndAmt/Desc"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 37 - Interest Penalty Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/InterestPenaltyTypeAndAmt/Amt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="count($FormData/InterestPenaltyTypeAndAmt) &gt;= 2">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Line 37 - Interest Penalty Type And Amt</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/InterestPenaltyTypeAndAmt"/>
									</xsl:call-template>
								</xsl:if>
								<span class="sty1040NRDotLn" style="padding-right:0px;
								    margin-right:8px;">..........<img src="{$ImagePath}/1040_Bullet.gif"
									alt="Right arrow"/>
								</span>
							</div>
							<div class="sty1040NRRightNumBox">37</div>
							<div class="sty1040NRAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 38 -->
						<div class="sty1040NRLN">
							<div class="styLNLeftNumBox">38</div>
							<div class="sty1040NRDesc" style="width:87mm;">
								Estimated tax penalty (see instructions)
								<span class="sty1040NRDotLn" style="padding-right:0px;margin-right:8px;">
									........<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								</span>
							</div>
							<div class="sty1040NRRightNumBoxNBB">38</div>
							<div class="sty1040NRAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
								</xsl:call-template>
							</div>
							<div class="sty1040NRRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
							<div class="sty1040NRAmountBoxNBB" style="background-color:lightgrey;">&nbsp;
							</div>
						</div>
					</div>
					<!-- Third Party -->
					<div style="display:block;width:187mm;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:20mm;height:14mm;border-right:1px solid black;padding-top:1mm">
							<span style="font-weight:bold;font-size:8pt;">Third Party Designee</span>
							<br />
						</div>
						<div style="width:167mm;height:7mm;">
							<span style="">
								<span style="width:5px"/>
								Do you want to allow another person to discuss this
								<br/>
								<span>
									<span style="width:8px"/>return with the IRS? See instructions
									<span class="sty1040NRDotLn" style="padding-right:0px;margin-right:8px;">
										.............<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
									</span>
								</span>	
								<span style="width:59mm;float:right;">
									<input type="checkbox" class="styCkboxNM" style="margin-right:2px;" 
										alt="Third Party Designee Ind Yes">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ThirdPartyDesigneeInd"/>
											<xsl:with-param name="BackupName">F1040NRThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-weight:bold;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ThirdPartyDesigneeInd"/>
											<xsl:with-param name="BackupName">F1040NRThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>Yes.
									</label><span style=""> Complete below.</span>
									<span style="width:10px"/>
									<input type="checkbox" class="styCkboxNM" style="margin-right:2px;"
										alt="Third Party Designee Ind No">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode"
											 select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040NRThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-weight:bold;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" 
											select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">F1040NRThirdPartyDesigneeInd</xsl:with-param>
										</xsl:call-template>No</label>
								</span>	
							</span>
						</div>	
						<div style="width:167mm;height:7mm;">
							<span style="width:16mm;">
								<span style="width:5px"/>Designee's <br /><span style="width:5px"/> name 
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							</span>
							<span style="width:54mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</span>
							<span style="width:11mm;">
								Phone <br /> no. <img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							</span>
							<span style="width:26mm;">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode"
									 select="$FormData/ThirdPartyDesigneePhoneNum"/>
								</xsl:call-template>
							</span>
							<span style="width:30mm;">
								Personal identification <br /> number (PIN) <span style="width:9mm"/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
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
						<div class="styGenericDiv" style="width:20mm;height:24mm;border-right:1px solid black;">
							<span style="font-weight:bold;font-size:12pt;">Sign<br /> Here</span>
							<br /><br />
						</div>
						<div style="padding-top:5.5mm;padding-left:8px;padding-right:0px;float:left;clear:none;
							width:4mm;margin-left:-2px;margin-right:2px;height:17mm;">
							<img src="{$ImagePath}/1040_Bullet_SuperLg.gif" alt="Right arrow" height="38" width="10"/>
						</div>
						<div style="float:left;clear:none;width:163mm;height:17mm;">
							<div class="" style="width:163mm;font-size:6.5pt;font-family:Arial;float:left;clear:none;">
								Under penalties of perjury, I declare that I have examined this return and
								accompanying schedules and statements, and to the best of my knowledge and belief,
								they are true, correct, and complete. Declaration of preparer (other than taxpayer) is 
								based on all information of which preparer has any knowledge.
							</div>
							<div style="width:163mm;float:left;clear:none;"/>
							<div class="styBB" style="width:163mm;float:left;clear:none;border-bottom:0mm">
								<div style="width:70mm;float:left;clear:none;padding-top:2mm">
									<div class="styFNBox" style="width:70mm;float:left;clear:none;">
									  Your signature
									</div>
									<div class="styFNBox" style="height:7mm;width:70mm;padding-top:1.5mm;
										float:left;clear:none;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode"
											 select="$RtnHdrData/PrimarySignaturePIN"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:18mm;float:left;clear:none;padding-top:2mm">
									<div style="width:16mm;padding-left:2mm;float:left;clear:none;">
										  Date
									</div>
									<div style="height:7mm;width:18mm;padding-top:1.5mm;text-align:center;
										float:left;clear:none;font-size:7pt;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" 
											select="$RtnHdrData/PrimarySignatureDt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="styFNBox" style="width:36mm;float:left;clear:none;padding-top:2mm">
									<div style="width:36.8mm;padding-left:2mm;float:left;clear:none;">
									   Your occupation
									</div>
									<div style="height:7mm;width:36mm;padding-top:1.5mm;padding-left:2mm;
										float:left;clear:none;font-family:Arial;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											select="$FormData/PrimaryOccupationTxt"/>
										</xsl:call-template>
									</div>
								</div>
								<div class="" style="width:35mm;float:left;clear:none;padding-top:2mm">
									<div class="styGenericDiv" style="height:11mm;width:38.5mm;border-left-width:0px;
										font-size:7pt;">
										<span style="width:100%;padding-left:4px;font-family:Arial-Narrow;">If the IRS
											sent you an Identity Protection PIN, enter it here 
										</span><br/>
										<span style="width:40%;padding-left:4px;font-family:Arial-Narrow;float:left;">
											(see inst.)<span style="width:4px"/><img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
										</span>
										<span style="width:60%;padding-top:0px;padding-right:5mm;float:right;
											text-align:center;padding-top:0.8mm">
											<div class="styLNCtrNumBox" style="height:3mm;width:23mm;
												border-top-width:1px;font-weight:normal">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" 
													select="$RtnHdrData/IdentityProtectionPIN"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
								</div>
							</div>
							</div>
							<div class="" style="width:167mm;float:left;clear:none;border-top:1px solid black;
								height:7mm;padding-top:0mm;">
								<div style="width:73.6mm;float:left;font-size:7pt;padding-top:.2mm;padding-left:2mm">
									Phone no. 
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/Filer/PhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
											select="$RtnHdrData/Filer/ForeignPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
								<div style="width:88.5mm;float:left;padding-left:2mm;font-size:7pt;
									border-left:1px solid black;height:7mm;">
									Email address 
									<span style="width:4px;"/> 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
						select="$RtnHdrData/AdditionalFilerInformation/AtSubmissionFilingGrp/EmailAddressTxt"/>
									</xsl:call-template>
								</div>
							</div>
						<!--</div>-->
					</div>
					<!-- Paid preparer -->
					<div class="" style="width:187mm;font-size:7pt;float:none;clear:both;
						border-top:1px solid black;">
						<div style="width:20mm;padding-top:4mm;float:left;clear:none;
							border-right:1px solid black;height:22.3mm;">
							<span class="styMainTitle" style="font-size:12pt;">
								Paid
								Preparer
								Use Only
							</span>
						</div>
						<div style="width:166mm;float:left;clear:none;display:block;">
							<div style="width:166mm;float:left;clear:none;border-style:solid;border-color:black;
								border-width:0px 0px 1px 0px;">
								<div class="styFNBox" style="height:9.8mm;width:52mm;padding-top:0mm;
									border-right:1 solid black;padding-left:5px">
									<span style="display:inline;font-size:7pt;">
										Preparer's name</span><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode"
										 select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
									</xsl:call-template>
								</div>
								<div class="styFNBox" style="height:9.8mm;width:41mm;padding-top:0mm;
									border-right:1 solid black;padding-left:1mm;font-size:7pt;">
									Preparer's signature
								</div>
								<div class="styFNBox" style="height:9.8mm;width:22mm;padding-top:0mm;
									padding-left:1mm;border-right:1 solid black;">
									<span style="font-size:7pt;">Date</span>
									<br />
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styFNBox" style="height:9.8mm;width:20mm;padding-left:1mm;">
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
								<div class="styLNDesc" style="height:9.8mm;width:29mm;padding-top:.5mm;
									padding-bottom:0mm;padding-left:1mm;font-family:Arial;">
									<span style="font-size:7pt;">Check if:</span><br/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" 
											select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
										<input class="styCkbox" type="checkbox" alt="Self Employed Ind">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode"
												 select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>Self-employed
									</label>
								</div>
							</div>
							<div style="width:164mm;height:auto;float:left;clear:none;border-style:solid;
								border-color:black;border-width:0px 0px 0px 0px;">
								<div class="styFNBox" style="height:7.5mm;width:124mm;
									border-right:1px solid black;padding-left:8px;">
									<span style="padding-top:.5mm;padding-right:.5mm">
										Firm's name 
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
										<span style="width:1mm"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
			select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<span style="width:2px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" 
			select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styFNBox" style="height:7.5mm;width:40mm;padding-left:1mm;
									padding-top:.5mm;border-right:0px solid black;word-break:break-all;"> Phone no. 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" 
								select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
									</xsl:call-template>
								</div>
							</div>
							<div class="" style="width:164mm;border-top:1px solid black;
								border-right-width:0px;float:left;clear:none;height:auto;">
								<div class="styFNBox" style="width:124mm;min-height:6.5mm;
									border-right:1px solid black;padding-left:8px;">
									<span style="padding-right:.5mm;padding-top:.5mm;">
										Firm's address 
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
										<span style="width:1mm"/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
											</xsl:call-template>
											<span style="width:4px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</span>
								</div>
								<div class="styFNBox" style="width:40mm;border-right-width:0px;">
								<div class="styGenericDiv" style="padding-right:.5mm;padding-left:0.5mm;
									padding-top:.5mm">Firm's EIN 
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								</div>
								<div class="styGenericDiv" style="padding-right:.5mm;padding-left:0.5mm;
									padding-top:.5mm">
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
				<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
					Go to <span style="font-style:italic">www.irs.gov/Form1040NR </span> for instructions and
					the latest information.
					<span style="float:right;font-size:6.5pt;">Form <strong>1040-NR</strong> (2021)</span>
				</div>
				<!-- Additional Data title bar and button -->
				<div class="styLeftOverTitleLine" id="LeftoverData">
					<div class="styLeftOverTitle">
						Additional Data        
					</div>
					<div class="styLeftOverButtonContainer">
						<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form"
							onclick="javascript:returnToWriteInImage();"/>
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
							<td class="styLeftOverTableRowDesc" style="width:100mm;" 
								scope="row">Filing Status - Qualifying HOH SSN:</td>
							<td class="styLeftOverTableRowAmount" style="width:87mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingHOHSSN"/>
								</xsl:call-template>
							</td>                          
						</tr>
					</xsl:if>
					<xsl:if test="$FormData/QualifyingPersonSSN">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" 
								scope="row">Filing Status - Qualifying Person SSN:</td>
							<td class="styLeftOverTableRowAmount" style="width:87mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonSSN"/>
								</xsl:call-template>
							</td>                          
						</tr>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Filing Status - Protective Return Ind</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturnInd"/>
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
						<xsl:with-param name="Desc">Total Exemption Primary and Spouse Cnt</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Child Who Lived With You Cnt</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ChldWhoLivedWithYouCnt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Child Who Lived With You Cnt</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/OtherDependentsListedCnt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Total Exemptions Cnt</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
					</xsl:call-template>
					
					<!-- WagesNotShownGrp separate repeating -->
					<xsl:if test="count($FormData/WagesNotShownGrp) &lt; 2">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1a - Wages Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/WagesLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 1a - Other Wages Not Shown Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/OtherWagesNotShownTxt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 1a - Wages Not Shown Amt</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/WagesNotShownAmt"/>
						</xsl:call-template>
					</xsl:if>
					<!--<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 1 - Wages Not Shown Lit Only Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp/WagesLiteralCd"/>
					</xsl:call-template>-->
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
					<!-- IRADistributionsGrp separate repeating -->
					<xsl:if test="count($FormData/IRADistributionsGrp) &lt; 2">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsGrp/IRADistributionsLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 4b - IRA Distributions Literal Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsGrp/IRADistributionsLiteralAmt"/>
						</xsl:call-template>
					</xsl:if>
					<!-- PensionsAnnuitiesGrp separate repeating -->
					<xsl:if test="count($FormData/PensionsAnnuitiesGrp) &lt; 2">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 5b - Pensions Annuities Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesGrp/PensionsAnnuitiesLiteralCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 5b - Pensions Annuities Literal Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesGrp/PensionsAnnuitiesLiteralAmt"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 6a - Social Security Benefits Code</xsl:with-param>
						<xsl:with-param name="TargetNode"
						 select="$FormData/SocSecBnftAmt/@socSecBnftCd"/>
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
						<xsl:with-param name="TargetNode" 
						select="$FormData/ExcldSect933PuertoRicoIncmAmt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 12 - Modified Standard Deduction Ind</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedOrStandardDedAmt/@modifiedStandardDeductionInd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 12 - India Standard Deduction Tax Treaty Code</xsl:with-param>
						<xsl:with-param name="TargetNode" 
							select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 12 - India Standard Deduction Tax Treaty Amount</xsl:with-param>
						<xsl:with-param name="TargetNode"
							select="$FormData/TaxableIncomeAmt/IndiaStandardDedTaxTreatyAmt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Code</xsl:with-param>
						<xsl:with-param name="TargetNode" 
							select="$FormData/TaxableIncomeAmt/@capitalConstructionFundCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 15 - Capital Construction Fund Amount</xsl:with-param>
						<xsl:with-param name="TargetNode"
							select="$FormData/TaxableIncomeAmt/@capitalConstructionFundAmt"/>
					</xsl:call-template>	
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 15 - Schedule Q Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 16 - Canada Income Tax Treaty Article XXV Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/CanadaIncomeTaxTreatyArtXXVCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 16(1) - Child Interest and Dividend Tax Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
					</xsl:call-template>
					<!-- OtherTaxAmtGrp separate repeating -->
					<xsl:if test="count($FormData/OtherTaxAmtGrp) &lt; 2">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount Code</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/OtherTaxAmtGrp/OtherTaxAmtCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 16(3) - Other Tax Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxAmtGrp/OtherTaxAmt"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Total Tax Deferred Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp[1]/TotalTaxDeferredAmt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 24 - Deferred Tax 1 Expatriation Code</xsl:with-param>
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
					<xsl:if test="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN">
						<tr>
							<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Line 26 - Divorced Spouse SSN:</td>
							<td class="styLeftOverTableRowAmount" style="width:87mm;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
								</xsl:call-template>
							</td>                          
						</tr>
					</xsl:if>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 26 - Divorced Literal Cd</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
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
						<xsl:with-param name="TargetNode" select="$FormData/PriorYearEarnedIncomeCd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 28 - Additional Child Prior Year Earned Income Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/PriorYearEarnedIncomeAmt"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRow">
						<xsl:with-param name="Desc">Line 32 - Form 8689 Code</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Cd"/>
					</xsl:call-template>
					<xsl:call-template name="PopulateLeftoverRowAmount">
						<xsl:with-param name="Desc">Line 32 - Form 8689 Amount</xsl:with-param>
						<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@form8689Amt"/>
					</xsl:call-template>
					<!-- Interest Penalty Type And Amount separate repeating -->
					<xsl:if test="count($FormData/InterestPenaltyTypeAndAmt) &lt; 5">
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 37 - Interest Penalty Description</xsl:with-param>
							<xsl:with-param name="TargetNode" 
								select="$FormData/InterestPenaltyTypeAndAmt/Desc"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 37 - Interest Penalty Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/InterestPenaltyTypeAndAmt/Amt"/>
						</xsl:call-template>
					</xsl:if>
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
					<span class="styRepeatingDataTitle">Form 1040NR - Dependents </span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" rowspan="2" scope="col" style="width:67.4mm;text-align:left;padding-left:1mm;padding-top:0mm;">
									<span style="font-size:7pt;">Dependents <span style="font-weight:normal">(see instructions):</span>
										<br/>
										<span style="font-weight:bold">(1)</span>
										<span style="font-weight:normal;padding-top:15px">
											<span style="width:2mm"/>First name 
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
										<b>(4) </b> <img src="{$ImagePath}/1040_Check.gif" alt="Check"/>
										<span style="width:.5mm"/>if qualifies for (see instructions):
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
										<input type="Checkbox" class="styCkboxNM"
											alt="Eligible For Child Tax Credit Ind" >
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
												<xsl:with-param name="BackupName">IRS1040NRDependentInformation<xsl:number value="position()"/>EligibleForChildTaxCreditInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for CTC Indicator</xsl:attribute>
										</input>
									</td>
									<td class="styTableCellCtrInherit">
										<input type="Checkbox" class="styCkboxNM" alt="Eligible For ODC Ind">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="EligibleForODCInd"/>
												<xsl:with-param name="BackupName">IRS1040NRDependentInformation<xsl:number value="position()"/>EligibleForODCInd</xsl:with-param>
											</xsl:call-template>
											<xsl:attribute name="alt">Dependent <xsl:number value="position()"/> Eligible for ODC Indicator</xsl:attribute>
										</input>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				
				<!-- Wages Not Shown Group -->
				<xsl:if test="count($FormData/WagesNotShownGrp) &gt; 1">
					<br/>
					<br/>
					<span class="styRepeatingDataTitle">Line 1a - Wages Not Shown Group</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Wages Literal Code
								</th>
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Other Wages Not Shown Text
								</th>
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Wages Not Shown Amount
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/WagesNotShownGrp">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="WagesLiteralCd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OtherWagesNotShownTxt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="WagesNotShownAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- IRA Distributions Group -->
				<xsl:if test="count($FormData/IRADistributionsGrp) &gt; 1">
					<br/>
					<br/>
					<span class="styRepeatingDataTitle">Line 4b - IRA Distributions Group</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									IRA Distributions Literal Code
								</th>
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									IRA Distributions Literal Amount
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/IRADistributionsGrp">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="IRADistributionsLiteralCd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="IRADistributionsLiteralAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</xsl:if>
				<!-- Pensions Annuities Group -->
				<xsl:if test="count($FormData/PensionsAnnuitiesGrp) &gt; 1">
					<br/>
					<br/>
					<span class="styRepeatingDataTitle">Line 5b - Pensions Annuities Group</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Pensions Annuities Literal Code
								</th>
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Pensions Annuities Literal Amount
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/PensionsAnnuitiesGrp">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="PensionsAnnuitiesLiteralCd"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="PensionsAnnuitiesLiteralAmt"/>
										</xsl:call-template>
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
				<xsl:if test="count($FormData/InterestPenaltyTypeAndAmt) &gt; 1">
					<br/>
					<br/>
					<span class="styRepeatingDataTitle">Line 37 - Interest Penalty Type And Amount</span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Description
								</th>
								<th class="styDepTblCell" scope="col" style="width:32mm;">
									Amount
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="$FormData/InterestPenaltyTypeAndAmt">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellTextInherit">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Desc"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="Amt"/>
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
