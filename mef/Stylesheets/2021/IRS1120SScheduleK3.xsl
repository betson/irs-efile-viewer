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
	<xsl:include href="IRS1120SScheduleK3Style.xsl" />
	<xsl:include href="ScheduleK2K3Common.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1120SScheduleK3" />
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
				<meta name="Description" content="IRS Schedule K3 Form 1120S" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120SScheduleK3Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1120SScheduleK3" style="width:256mm;">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<div class="styStdDiv" style="padding-left:95mm;text-align:bottom;">
						<input type="checkbox" class="styCkboxNM" style="margin-top:3px;" alt="Final K3">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FinalK3Ind"/>
								<xsl:with-param name="BackupName">K31065FinalK3Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						Final K-3
						<input type="checkbox" class="styCkboxNM" style="margin-left:20mm;margin-top:3px;" alt="Amended K3">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedK3Ind"/>
								<xsl:with-param name="BackupName">K31065AmendedK3Ind</xsl:with-param>
							</xsl:call-template>
						</input>
						Amended K-3
					</div>
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:21mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE K-3<br />(Form 1120-S)</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<span class="styAgency" style="padding-top:1mm;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:21mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;">
								Shareholder's Share of Income, Deductions, <br /> Credits, etc. &mdash; International
							</span>
							<br /><br />
							<span style="">
								For calendar year 2021, or tax year beginning 
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								, ending 
								<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
							</span>
							<br />
							<span style="font-weight:bold;">
								&#9658; See separate instructions.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm;">
							<div class="styOMB" style="font-size:6pt;">OMB No. 1545-0123</div>
							<div class="styTY" style="margin-top:1mm;">20<span class="styTYColor">21</span></div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="overflow:visible;border-top:2px solid black;">
						<div class="styGenericDiv" style="width:94mm;border-right:2px solid black;">
							<div class="" style="width:100%;text-align:center;font-weight:bold;font-size:8pt;">Information About the Corporation</div>
							<div class="" style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">A</div>
								<div class="styLNDesc" style="width:87mm;">Corporation's employer identification number (EIN)</div>
								<div class="styLNDesc" style="width:100%;height:4mm;padding-right:0.5mm;">
									<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
								</div>
							</div>
							<div class="" style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">B</div>
								<div class="styLNDesc" style="width:87mm;">Corporation's name, address, city, state, and ZIP code</div>
								<div class="styLNDesc" style="width:100%;min-height:20mm;padding-right:0.5mm;font-size:6pt;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
									<br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
									<br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<span style="width:9px;"/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<div class="styGenericDiv" style="width:93mm;">
							<div class="" style="width:100%;text-align:center;font-weight:bold;font-size:8pt;">Information About the Shareholder</div>
							<div class="" style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">C</div>
								<div class="styLNDesc" style="width:87mm;height:4mm;">Shareholder's identifying number</div>
								<div class="styLNDesc" style="width:100%;height:4mm;padding-left:0.5mm;">
									<xsl:choose>
										<xsl:when test="$FormData/ShareholderSSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderSSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderEIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<div class="" style="width:100%;border-top:1px solid black;">
								<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">D</div>
								<div class="styLNDesc" style="width:87mm;">Shareholder's name, address, city, state, and ZIP code</div>
								<div class="styLNDesc" style="width:100%;min-height:20mm;padding-right:0.5mm;padding-left:0.5mm;font-size:6pt;">
									<xsl:choose>
										<xsl:when test="$FormData/ShareholderPersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="$FormData/ShareholderName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ShareholderName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
									<br />
									<xsl:choose>
										<xsl:when test="$FormData/ShareholderUSAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderUSAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/ShareholderForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
						</div>
						</div>
					</div>
					<!-- Line E -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">E</div>
						<div class="styLNDesc" style="width:157mm;">
							Check to indicate the parts of Schedule K-3 that apply.
						</div>
						<div class="styLNRightNumBox" style="margin-top:6px;border-left:none;">&nbsp;</div>
						<div class="styLNRightNumBox" style="margin-top:6px;border-top-width:1px;">Yes</div>
						<div class="styLNRightNumBox" style="margin-top:6px;border-top-width:1px;border-right-width:1px;">No</div>
					</div>
					<!-- E1 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">1</div>
						<div class="styLNDesc" style="width:151mm;">
							Does Part I apply? If "Yes," complete and attach Part I
							<span class="sty1065K2DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">1</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 1 Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 1 No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- E2 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">2</div>
						<div class="styLNDesc" style="width:151mm;">
							Does Part II apply? If "Yes," complete and attach Part II
							<span class="sty1065K2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 2 Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartIIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartIIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 2 No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartIIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartIIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- E3 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">3</div>
						<div class="styLNDesc" style="width:151mm;">
							Does Part III apply? If "Yes," complete and attach Part III
							<span class="sty1065K2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 3 Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartIIIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartIIIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 3 No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartIIIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartIIIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- E4 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">4</div>
						<div class="styLNDesc" style="width:151mm;">
							Does Part IV apply? If "Yes," complete and attach Part IV
							<span class="sty1065K2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 4 Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartIVAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartIVAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 4 No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartIVAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartIVAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- E5 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">5</div>
						<div class="styLNDesc" style="width:151mm;">
							Does Part V apply? If "Yes," complete and attach Part V
							<span class="sty1065K2DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 5 Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartVAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartVAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 5 No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartVAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartVAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- E6 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">6</div>
						<div class="styLNDesc" style="width:151mm;">
							Does Part VI apply? If "Yes," complete and attach Part VI
							<span class="sty1065K2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 6 Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartVIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartVIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 6 No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartVIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartVIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- E7 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftLtrBox" style="width:6mm;">&nbsp;</div>
						<div class="styLNLeftLtrBox" style="width:6mm;padding-left:2mm;">7</div>
						<div class="styLNDesc" style="width:151mm;">
							Does Part VII apply? If "Yes," complete and attach Part VII
							<span class="sty1065K2DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 7 Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartVIIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartVIIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;border-right-width:1px;">
							<input type="checkbox" class="styCkboxNM" style="" alt="Part 7 No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/PartVIIAttachedInd"/>
									<xsl:with-param name="BackupName">F1065SK2PartVIIAttachedInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;height:34mm;">
						<div style="transform:rotate(270deg);font-size:8pt;margin-top:15mm;margin-left:-10mm;">&nbsp; For IRS Use Only &nbsp;</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;font-weight:bold;font-family:Arial;">
						For Paperwork Reduction Act Notice, see the Instructions for Form 1120-S. 
						<span style="margin-left:3mm;font-weight:normal;">www.irs.gov/Form1120S</span>
						<span style="margin-left:8mm;font-weight:normal;">Cat. No. 74747C</span>
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<!--Part 1 -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part I</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Shareholder's Share of Corporation's Other Current Year International Information
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNDesc" style="width:255mm;">Check box(es) for additional specified attachments. See instructions.</div>
					</div>
					<div class="styStdDivLS">
						<div class="styGenericDiv" style="width:64mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Gain On Personal Property Sale Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/GainOnPersonalPropertySaleInd"/>
									<xsl:with-param name="BackupName">F1065SK2GainOnPersonalPropertySaleInd</xsl:with-param>
								</xsl:call-template>
							</input>
							1. Gain on personal property sale
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/GainOnPersonalPropertySaleInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Foreign Oil And Gas Taxes Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasTaxesInd"/>
									<xsl:with-param name="BackupName">F1065SK2ForeignOilAndGasTaxesInd</xsl:with-param>
								</xsl:call-template>
							</input>
							2. Foreign oil and gas taxes
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignOilAndGasTaxesInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Splitter Arrangements Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SplitterArrangementsInd"/>
									<xsl:with-param name="BackupName">F1065SK2SplitterArrangementsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							3. Splitter arrangements
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SplitterArrangementsInd"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:64mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Foreign Tax Translation Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxTranslationInd"/>
									<xsl:with-param name="BackupName">F1065SK2ForeignTaxTranslationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							4. Foreign tax translation
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxTranslationInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="High Taxed Income Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/HighTaxedIncomeInd"/>
									<xsl:with-param name="BackupName">F1065SK2HighTaxedIncomeInd</xsl:with-param>
								</xsl:call-template>
							</input>
							5. High-taxed income
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/HighTaxedIncomeInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Sect 267A Disallowed Deduction Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Sect267ADisallowedDedInd"/>
									<xsl:with-param name="BackupName">F1065SKSect267ADisallowedDedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							6. Section 267A disallowed deduction
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Sect267ADisallowedDedInd"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:64mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Form 8858 Attachment Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form8858AttachmentInd"/>
									<xsl:with-param name="BackupName">F1065SK2Form8858AttachmentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							7. Form 8858 information
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form8858AttachmentInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Form 5471 Attachment Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form5471AttachmentInd"/>
									<xsl:with-param name="BackupName">F1065SK2Form5471AttachmentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							8. Form 5471 information
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Form5471AttachmentInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Other Forms Attachment Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherFormsAttachmentInd"/>
									<xsl:with-param name="BackupName">F1065SKOtherFormsAttachmentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							9. Other forms
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherFormsAttachmentInd"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:64mm;">
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Shareholder Loan Transactions Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ShareholderLoanTransactionsInd"/>
									<xsl:with-param name="BackupName">F1120SK2ShareholderLoanTransactionsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							10. Shareholder loan transactions
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ShareholderLoanTransactionsInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Entity treatment for certain S corporations Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/EntityTreatmentCertainSCorpInd"/>
									<xsl:with-param name="BackupName">F1120SK2EntityTreatmentCertainSCorpInd</xsl:with-param>
								</xsl:call-template>
							</input>
							11. Entity treatment for certain S corporations
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/EntityTreatmentCertainSCorpInd"/>
							</xsl:call-template>
							<br />
							<input type="checkbox" class="styCkboxNM" style="margin-right:2mm;" alt="Other International Items Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OtherInternationalItemsInd"/>
									<xsl:with-param name="BackupName">F1065SKOtherInternationalItemsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							12. Other international items <br /> <span style="width:5mm;"/>(attach description and statement)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherInternationalItemsInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Part 2 -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; Gross Income</div>
					</div>
					<xsl:variable name="sep2-1" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrSalesGrossIncomeGrp) &gt; 3)"/>
					<xsl:variable name="sep2-2" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrGrossIncmPerfOfSrvcGrp) &gt; 3)"/>
					<xsl:variable name="sep2-3" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrGroRntlRealEstateIncmGrp) &gt; 3)"/>
					<xsl:variable name="sep2-4" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrOthGrossRentalIncomeGrp) &gt; 3)"/>
					<xsl:variable name="sep2-6" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrInterestIncomeGrp) &gt; 3)"/>
					<xsl:variable name="sep2-7" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrOrdinaryDividendsGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page1Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:auto;" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by shareholder
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">1</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Sales
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrSalesGrossIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep2-1"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 2 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">2</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;font-family:Arial;">
										Gross income from performance of services
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrGrossIncmPerfOfSrvcGrp"/>
									<xsl:with-param name="Sep" select="$sep2-2"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 3 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">3</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Gross rental real estate income
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrGroRntlRealEstateIncmGrp"/>
									<xsl:with-param name="Sep" select="$sep2-3"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 4 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">4</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Other gross rental income
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrOthGrossRentalIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep2-4"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 5 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">5</td>
									<td class="styTableCellTextInherit" style="">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 6 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">6</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Interest Income
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrInterestIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep2-6"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 7 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">7</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Ordinary dividends (exclude amount on line 8)
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrOrdinaryDividendsGrp"/>
									<xsl:with-param name="Sep" select="$sep2-7"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; Gross Income <span style="font-style:italic;font-weight:normal;">(continued)</span></div>
					</div>
					<xsl:variable name="sep2-8" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrQualifiedDividendsGrp) &gt; 3)"/>
					<xsl:variable name="sep2-10" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrRoyaltiesLicenseFeesGrp) &gt; 3)"/>
					<xsl:variable name="sep2-11" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrNetShortTermCapGainGrp) &gt; 3)"/>
					<xsl:variable name="sep2-12" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrNetLongTermCapGainGrp) &gt; 3)"/>
					<xsl:variable name="sep2-13" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrCollectiblesGainGrp) &gt; 3)"/>
					<xsl:variable name="sep2-14" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrUnrcptrSect1250GainGrp) &gt; 3)"/>
					<xsl:variable name="sep2-15" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrNetSection1231GainGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page2Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:auto;" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by shareholder
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 8 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">8</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Qualified dividends
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrQualifiedDividendsGrp"/>
									<xsl:with-param name="Sep" select="$sep2-8"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 9 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">9</td>
									<td class="styTableCellTextInherit" style="">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 10 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">10</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Royalties and license fees
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrRoyaltiesLicenseFeesGrp"/>
									<xsl:with-param name="Sep" select="$sep2-10"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 11 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">11</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Net short-term capital gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrNetShortTermCapGainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-11"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 12 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">12</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Net long-term capital gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrNetLongTermCapGainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-12"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 13 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">13</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Collectibles (28%) gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrCollectiblesGainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-13"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 14 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">14</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Unrecaptured section 1250 gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrUnrcptrSect1250GainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-14"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 15 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">15</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Net section 1231 gain
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrNetSection1231GainGrp"/>
									<xsl:with-param name="Sep" select="$sep2-15"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; Gross Income <span style="font-style:italic;font-weight:normal;">(continued)</span></div>
					</div>
					<xsl:variable name="sep2-19" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrSection951aInclusionsGrp) &gt; 3)"/>
					<xsl:variable name="sep2-20" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/ShrOtherIncomeGrp) &gt; 3)"/>
					<xsl:variable name="sep2-24" select="($Print = $Separated) and (count($FormData/Frm1120SGrossIncomeGrp/TotShrGrossIncmByCountryGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page3Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:auto;" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by shareholder
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 16 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">16</td>
									<td class="styTableCellTextInherit" style="">
										Section 986(c) gain
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrSection986cGainGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 17 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">17</td>
									<td class="styTableCellTextInherit" style="">
										Section 987 gain
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrSection987GainGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 18 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;">18</td>
									<td class="styTableCellTextInherit" style="">
										Section 988 gain
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrSection988GainGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 19 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">19</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Section 951(a) inclusions
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrSection951aInclusionsGrp"/>
									<xsl:with-param name="Sep" select="$sep2-19"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 20 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">20</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Other income (see instructions)
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrOtherIncomeGrp"/>
									<xsl:with-param name="Sep" select="$sep2-20"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Line 21 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="border-bottom-width:1px;vertical-align:top;">21</td>
									<td class="styTableCellTextInherit" style="">
										Section 951A(a) inclusions (see instructions)
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrSect951AaInclusionsGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 22 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;">22</td>
									<td class="styTableCellTextInherit" style="background-color:white;border-bottom-width:0px;">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">A</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">B</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">C</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 23 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;">23</td>
									<td class="styTableCellTextInherit" style="background-color:white;border-bottom-width:0px;">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">A</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">B</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr style="background-color:lightgrey;">
									<td class="styTableCellAmtInherit" style="background-color:white;font-weight:bold;border:none;">C</td>
									<td class="styTableCellTextInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 24 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;">24</td>
									<td class="styTableCellTextInherit" style="">
										<strong>Total gross income </strong> (combine lines 1 through 23)
										<span class="sty1065K2DotLn" style="margin-right:-4px;">........&#9658;</span>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/TotUSSourceIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/TotForeignBranchIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/TotalPassiveIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/TotalGeneralCategoryIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:for-each select="$FormData/Frm1120SGrossIncomeGrp/TotalSeparateCategoryGrp">
											<span style="float:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
											</xsl:call-template>
											<xsl:if test="position() != last()"><br /></xsl:if>
										</xsl:for-each>
										<xsl:if test="count($FormData/Frm1120SGrossIncomeGrp/TotalSeparateCategoryGrp) = 0">&nbsp;</xsl:if>
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/TotalSourcedAtShrLvlIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/TotalGrossIncomeAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<xsl:call-template name="UnitLineIncDedSource">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/TotShrGrossIncmByCountryGrp"/>
									<xsl:with-param name="Sep" select="$sep2-24"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 5 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">5</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 2 &mdash; Deductions</div>
					</div>
					<xsl:variable name="sep2-32" select="($Print = $Separated) and (count($FormData/Frm1120SDeductionsGrp/ShrREExpensesGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page4Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by shareholder
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 25 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">25</td>
									<td class="styTableCellTextInherit" style="">
										Expenses allocable to sales income
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrExpnsAllcblToSalesIncmGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 26 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">26</td>
									<td class="styTableCellTextInherit" style="">
										Expenses allocable to gross income from performances of services
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ExpnsAllcblGroIncmPerfSrvc2Grp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 27 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">27</td>
									<td class="styTableCellTextInherit" style="">
										Net short-term capital loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrNetShortTermCapLossGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 28 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">28</td>
									<td class="styTableCellTextInherit" style="">
										Net long-term capital loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrNetLongTermCapLossGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 29 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">29</td>
									<td class="styTableCellTextInherit" style="">
										Collectibles loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrCollectablesLossGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 30 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">30</td>
									<td class="styTableCellTextInherit" style="">
										Net section 1231 loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrNetSection1231LossGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 31 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">31</td>
									<td class="styTableCellTextInherit" style="">
										Other losses
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrOtherLossesGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 32 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="vertical-align:top;">32</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Research &amp; experimental (R&amp;E) expenses
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:if test="not($sep2-32)">
									<xsl:for-each select="$FormData/Frm1120SDeductionsGrp/ShrREExpensesGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellTextInherit" style="">
												SIC code 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SICCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SourcedAtShrLvlIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep2-32 or (count($FormData/Frm1120SDeductionsGrp/ShrREExpensesGrp) &lt; 1)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">A</td>
										<td class="styTableCellTextInherit" style="">
											SIC code
											<xsl:if test="$sep2-32">See Add'l Data</xsl:if>&nbsp;
										</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep2-32 or (count($FormData/Frm1120SDeductionsGrp/ShrREExpensesGrp) &lt; 2)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">B</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep2-32 or (count($FormData/Frm1120SDeductionsGrp/ShrREExpensesGrp) &lt; 3)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">C</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<!-- Line 33 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">33</td>
									<td class="styTableCellTextInherit" style="">
										Allocable rental expenses &mdash; <br /> depreciation, depletion, and amortization
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrAllocableRentalExpensesGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 34 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">34</td>
									<td class="styTableCellTextInherit" style="">
										Allocable rental expenses &mdash; other than <br /> depreciation, depletion, and amortization
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrOthAllocableRentalExpnssGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 35 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">35</td>
									<td class="styTableCellTextInherit" style="font-family:Arial;">
										Allocable royalty and licensing expenses &mdash; depreciation, depletion, and amortization
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrAllcblRyltyLncsExpnssGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 36 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">36</td>
									<td class="styTableCellTextInherit" style="font-family:Arial;">
										Allocable royalty and licensing expenses &mdash; other than depreciation, depletion, and amortization
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrOthAllcblRyltyLcnsExpnssGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 37 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">37</td>
									<td class="styTableCellTextInherit" style="">
										Depreciation not included on line 33 or 35
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrOthAllocableDepreciationGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 38 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">38</td>
									<td class="styTableCellTextInherit" style="">
										Charitable contributions
									</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrCharitableContriGrp/USSourceIncomeAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrCharitableContriGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 39 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">39</td>
									<td class="styTableCellTextInherit" style="">
										Interest epxense specifically allocable under Regulations section 1.861-10(e)
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrIntExpnsUnderSect186110eGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 40 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">40</td>
									<td class="styTableCellTextInherit" style="">
										Other interest expense specifically allocable under Regulations <br /> section 1.861-10T
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrOthIntExpnsSect186110TGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 41 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">41</td>
									<td class="styTableCellTextInherit" style="">
										Other interest expense&mdash;business
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrBusinessOthIntExpnsGrp/SourcedAtShrLvlIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrBusinessOthIntExpnsGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 42 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">42</td>
									<td class="styTableCellTextInherit" style="">
										Other interest expense&mdash;investment
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrInvestmenttOthIntExpnsGrp/SourcedAtShrLvlIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrInvestmenttOthIntExpnsGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 43 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">43</td>
									<td class="styTableCellTextInherit" style="">
										Other interest expense&mdash;passive activity
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrPassiveActyOthIntExpnsGrp/SourcedAtShrLvlIncmAmt"/>
										</xsl:call-template>
									</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrPassiveActyOthIntExpnsGrp/TotalAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!-- Line 44 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">44</td>
									<td class="styTableCellTextInherit" style="">
										Section 59(e)(2) expenditures, excluding R&amp;E expenses on line 32
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrSect59e2ExpendNoREExpnsGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 45 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">45</td>
									<td class="styTableCellTextInherit" style="">
										Foreign taxes not creditable but deductible
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrFrgnTxsNotCreditableDedGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 6 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part II</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Foreign Tax Credit Limitation <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 2 &mdash; Deductions <span style="font-style:italic;font-weight:normal;">(continued)</span></div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page5Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by shareholder
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 46 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">46</td>
									<td class="styTableCellTextInherit" style="">
										Section 986(c) loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrSection986cLossGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 47 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">47</td>
									<td class="styTableCellTextInherit" style="">
										Section 987 loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrSection987LossGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 48 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">48</td>
									<td class="styTableCellTextInherit" style="">
										Section 988 loss
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrSection988LossGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 49 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">49</td>
									<td class="styTableCellTextInherit" style="">
										Other allocable deductions (see instructions) 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrOtherAllocableDeductionsGrp"/>
										</xsl:call-template>
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrOtherAllocableDeductionsGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 50 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">50</td>
									<td class="styTableCellTextInherit" style="">
										Other apportioned share of deductions (see instructions) 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrOthApportionedShrDedGrp"/>
										</xsl:call-template>
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrOthApportionedShrDedGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 51 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;border-bottom-width:1px;">51</td>
									<td class="styTableCellTextInherit" style="background-color:white;">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 52 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;border-bottom-width:1px;">52</td>
									<td class="styTableCellTextInherit" style="background-color:white;">
										Reserved for future use 
									</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 53 -->
								<tr style="background-color:lightgrey;">
									<td class="sty1065K2RowIDCell" style="background-color:white;border-bottom-width:1px;">53</td>
									<td class="styTableCellTextInherit" style="background-color:white;">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 54 -->
								<tr style="vertical-align:bottom;border-top:1px solid black;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">54</td>
									<td class="styTableCellTextInherit" style="">
										<strong>Total deductions </strong> (combine lines 25 through 53)
										<span class="sty1065K2DotLn" style="margin-right:-5px;">........&#9658;</span>
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrTotalDeductionsGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Line 55 -->
								<tr style="vertical-align:bottom;border-top:1px solid black;">
									<td class="sty1065K2RowIDCell" style="vertical-align:top;border-bottom-width:1px;">55</td>
									<td class="styTableCellTextInherit" style="">
										<strong>Net income (loss) </strong> (subtract line 54 from line 24)
										<span class="sty1065K2DotLn" style="margin-right:-5px;">.........&#9658;</span>
									</td>
									<xsl:call-template name="UnitLineIncDedSourceSingle">
										<xsl:with-param name="TargetNode" select="$FormData/Frm1120SDeductionsGrp/ShrNetIncomeLossGrp"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- Part 3, Section 1 --> 
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; R&amp;E Expenses Apportionment Factors</div>
					</div>
					<xsl:variable name="sep3-1" select="($Print = $Separated) and (count($FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeShrGrp) &gt; 6)"/>
					<xsl:variable name="P3OthGrp" select="$FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeOtherGrp"/>
					<div class="styTableContainerLandscapeNBB" id="Page5Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by shareholder
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___) <br /> (country code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="vertical-align:top;">1</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Gross receipts by SIC code
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:if test="not($sep3-1)">
									<xsl:for-each select="$FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeShrGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
												<xsl:number format="A" value="position()"/>
											</td>
											<td class="styTableCellTextInherit" style="">
												SIC code 
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SICCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="USSourceIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ForeignBranchIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PassiveCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GeneralCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:variable name="cnode" select="."/>
												<xsl:choose>
													<xsl:when test="count($P3OthGrp[SICCd = $cnode/SICCd]) &gt; 0">See next page</xsl:when>
													<xsl:otherwise>&nbsp;</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SourcedAtShrLvlIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeShrGrp) &lt; 1)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">A</td>
										<td class="styTableCellTextInherit" style="">
											SIC code
											<xsl:if test="$sep3-1">See Add'l Data</xsl:if>&nbsp;
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeShrGrp) &lt; 2)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">B</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeShrGrp) &lt; 3)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">C</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeShrGrp) &lt; 4)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">D</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeShrGrp) &lt; 5)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">E</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-1 or (count($FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeShrGrp) &lt; 6)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">F</td>
										<td class="styTableCellTextInherit" style="">SIC code </td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Line 2 -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;text-align:center;padding:none;">2</div>
						<div class="styLNDesc" style="width:201mm;">
							Exclusive apportionment with respect to total R&amp;E expenses entered on Part II, line 32. Enter the following.
						</div>
						<div class="styLNRightNumBoxNBB" style="width:16mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 2A -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;text-align:right;padding:2px 4px 0px 0px;">A</div>
						<div class="styLNDesc" style="width:201mm;">
							R&amp;E expense with respect to activity performed in the United States
						</div>
						<div class="styLNRightNumBoxNBB" style="width:16mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<xsl:for-each select="$FormData/Frm1120SREExpnssApprtnFctrGrp/REExpnsActivityInsideUSGrp">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(<xsl:number value="position()" format="i"/>)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SICCd"/>
									</xsl:call-template>
								</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;height:auto;min-height:4.26mm;">2A(<xsl:number value="position()" format="i"/>)</div>
							<div class="styLNAmountBox" style="height:4.26mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/Frm1120SREExpnssApprtnFctrGrp/REExpnsActivityInsideUSGrp) &lt; 1">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(i)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2A(i)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/Frm1120SREExpnssApprtnFctrGrp/REExpnsActivityInsideUSGrp) &lt; 2">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(ii)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2A(ii)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/Frm1120SREExpnssApprtnFctrGrp/REExpnsActivityInsideUSGrp) &lt; 3">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(iii)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2A(iii)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Line 2B -->
					<div class="styStdIBDivLS">
						<div class="styLNLeftNumBox" style="width:7mm;text-align:right;padding:2px 4px 0px 0px;">B</div>
						<div class="styLNDesc" style="width:201mm;">
							R&amp;E expense with respect to activity performed outside the United States
						</div>
						<div class="styLNRightNumBoxNBB" style="width:16mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<xsl:for-each select="$FormData/Frm1120SREExpnssApprtnFctrGrp/REExpnsActivityOutsdUSGrp">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(<xsl:number value="position()" format="i"/>)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="SICCd"/>
									</xsl:call-template>
								</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;height:auto;min-height:4mm;">2B(<xsl:number value="position()" format="i"/>)</div>
							<div class="styLNAmountBox" style="height:4.26mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/Frm1120SREExpnssApprtnFctrGrp/REExpnsActivityOutsdUSGrp) &lt; 1">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(i)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2B(i)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/Frm1120SREExpnssApprtnFctrGrp/REExpnsActivityOutsdUSGrp) &lt; 2">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(ii)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2B(ii)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="count($FormData/Frm1120SREExpnssApprtnFctrGrp/REExpnsActivityOutsdUSGrp) &lt; 3">
						<div class="styStdIBDivLS">
							<div class="styLNLeftNumBox" style="width:7mm;">&nbsp;</div>
							<div class="styLNDesc" style="width:201mm;">
								<span style="width:10mm;font-weight:bold;">(iii)</span>
								SIC code 
								<span style="width:12mm;border-bottom:1px solid black;text-align:center;">&nbsp;</span>
								<span class="sty1065K2DotLn">.......................................&#9658;</span>
							</div>
							<div class="styLNRightNumBox" style="width:16mm;">2B(iii)</div>
							<div class="styLNAmountBox">&nbsp;</div>
						</div>
					</xsl:if>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 6 extra -->
					<xsl:if test="count($P3OthGrp) &gt; 0">
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">6</span> (continued)</span>
					</div>
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 1 &mdash; R&amp;E Expenses Apportionment Factors <span style="font-weight:normal;">(Line 1 additional data)</span></div>
					</div>
					<xsl:variable name="OthMultGrp" select="$P3OthGrp[SICCd = following-sibling::GrossReceiptsSICCodeOtherGrp/SICCd or SICCd =  preceding-sibling::GrossReceiptsSICCodeOtherGrp/SICCd]"/>
					<div class="styTableContainerLandscapeNBB" id="Page5TableEX">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(e) </strong> Other income <br />
										SIC &nbsp; Category &nbsp; Country
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$P3OthGrp">
									<xsl:if test="(position() mod 8) = 1">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 1]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 1]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 1]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 1]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 2]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 2]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 2]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 3]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 3]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 3]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 4]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 4]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 4]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 5]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 5]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 5]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 6]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 6]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 6]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 7]/SICCd"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 7]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 7]/ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P3OthGrp[$pos + 7]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					</xsl:if>
					<!-- Page 7 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">7</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 2 &mdash; Interest Expense Apportionment Factors</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page6Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:59mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styTableCellHeader" scope="col" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by shareholder
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> 
										(category code <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[1]/SeparateCategoryCd"/>
										</xsl:call-template>) 
										<br /> (country code <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[1]/ForeignCountryOrUSPossessionCd"/>
										</xsl:call-template>)
									</th>
								</tr>
							</thead>
							<tbody>
								<!-- Line 1 -->
								<tr>
									<td class="sty1065K2RowNumCell">1</td>
									<td class="styTableCellTextInherit">
										Total average value of assets
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'TotalAvgValueAssetsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 2 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">2</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
									</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<!-- Line 3 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">3</td>
									<td class="styTableCellTextInherit">
										Assets attracting directly allocable interest expense under Regulations section <br /> 1.861-10(e)
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AstAttrtIntExpnsSect186110eAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 4 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">4</td>
									<td class="styTableCellTextInherit">
										Other assets attracting directly allocable interest expense under Regulations section 1.861-10T
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'OthAstAttrtIntExpns186110TAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 5 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">5</td>
									<td class="styTableCellTextInherit">
										Assets excluded from apportionment formula
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AssetsExcludedApprtnAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 6a -->
								<tr style="vertical-align:bottom;border-top:2px solid black;">
									<td class="sty1065K2RowNumCell">6a</td>
									<td class="styTableCellTextInherit">
										Total assets used for apportionment <br /> (subtract the sum of lines 3, 4, and 5 from the sum of lines 1 and 2)
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'TotAssetsUsedApprtnAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 6b -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">b</td>
									<td class="styTableCellTextInherit">
										Assets attracting business interest expense
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AssetsAttrtBusIntExpnsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 6c -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">c</td>
									<td class="styTableCellTextInherit">
										Assets attracting investment interest expense
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AssetsAttrtInvstIntExpnsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 6d -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">d</td>
									<td class="styTableCellTextInherit">
										Assets attracting passive activity interest expense
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'AstAttrtPssvActyIntExpnsAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 7 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">7</td>
									<td class="styTableCellTextInherit">
										Basis in stock of 10%-owned noncontrolled foreign corporations (see attachment) 
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										</xsl:call-template>
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'BasisInStkOf10PctOwnNonCFCAmt'"/>
									</xsl:call-template>
								</tr>
								<!-- Line 8 -->
								<tr style="vertical-align:bottom;">
									<td class="sty1065K2RowNumCell">8</td>
									<td class="styTableCellTextInherit">
										Basis in stock of CFCs (see attachment)
									</td>
									<xsl:call-template name="LineIntExpnsApprt1120SMain">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
										<xsl:with-param name="LineElement" select="'BasisInStockOfCFCAmt'"/>
									</xsl:call-template>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 7 extra -->
					<xsl:if test="count($FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp) &gt; 1">
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">7</span> (continued)</span>
					</div>
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">
							Section 2 &mdash; Interest Expense Apportionment Factors 
							<span style="font-weight:normal;"> (Additional data)</span>
						</div>
					</div>
					<xsl:for-each select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[position() &gt; 1]">
						<xsl:if test="(position() mod 7) = 1">
							<xsl:variable name="pos" select="position()"/>
							<div class="styTableContainerLandscapeNBB" id="Page6EXTable1">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
									<thead class="styTableThead">
										<tr style="border-top:1px solid black;">
											<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
											<th class="styTableCellHeader" scope="col" style="width:59mm;" rowspan="2">
												Description
											</th>
											<th class="styTableCellHeader" scope="colgroup" style="border-right-width:0px;" colspan="7">
												Foreign Source
											</th>
										</tr>
										<tr>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 2]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 3]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 4]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 5]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 6]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;">
												<strong>(e)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 7]/SeparateCategoryCd"/>
												</xsl:call-template>) 
												<br /> (country code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp/ShrOthIntExpnsApprtnFctrGrp[$pos + 7]/ForeignCountryOrUSPossessionCd"/>
												</xsl:call-template>)
											</th>
										</tr>
									</thead>
									<tbody>
										<!-- Line 1 -->
										<tr>
											<td class="sty1065K2RowNumCell">1</td>
											<td class="styTableCellTextInherit">
												Total average value of assets
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'TotalAvgValueAssetsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 2 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">2</td>
											<td class="styTableCellTextInherit">
												Reserved for future use
											</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
										</tr>
										<!-- Line 3 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">3</td>
											<td class="styTableCellTextInherit">
												Assets attracting directly allocable interest expense under Regulations section <br /> 1.861-10(e)
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AstAttrtIntExpnsSect186110eAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 4 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">4</td>
											<td class="styTableCellTextInherit">
												Other assets attracting directly allocable interest expense under Regulations section 1.861-10T
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'OthAstAttrtIntExpns186110TAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 5 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">5</td>
											<td class="styTableCellTextInherit">
												Assets excluded from apportionment formula
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AssetsExcludedApprtnAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 6a -->
										<tr style="vertical-align:bottom;border-top:2px solid black;">
											<td class="sty1065K2RowNumCell">6a</td>
											<td class="styTableCellTextInherit">
												Total assets used for apportionment <br /> (subtract the sum of lines 3, 4, and 5 from the sum of lines 1 and 2)
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'TotAssetsUsedApprtnAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 6b -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">b</td>
											<td class="styTableCellTextInherit">
												Assets attracting business interest expense
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AssetsAttrtBusIntExpnsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 6c -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">c</td>
											<td class="styTableCellTextInherit">
												Assets attracting investment interest expense
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AssetsAttrtInvstIntExpnsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 6d -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell" style="padding-left:3.3mm;">d</td>
											<td class="styTableCellTextInherit">
												Assets attracting passive activity interest expense
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'AstAttrtPssvActyIntExpnsAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 7 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">7</td>
											<td class="styTableCellTextInherit">
												Basis in stock of 10%-owned noncontrolled foreign corporations (see attachment)
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'BasisInStkOf10PctOwnNonCFCAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
										<!-- Line 8 -->
										<tr style="vertical-align:bottom;">
											<td class="sty1065K2RowNumCell">8</td>
											<td class="styTableCellTextInherit">
												Basis in stock of CFCs (see attachment)
											</td>
											<xsl:call-template name="LineIntExpnsApprt1120SOther">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SIntExpnsApprtnFctrGrp"/>
												<xsl:with-param name="LineElement" select="'BasisInStockOfCFCAmt'"/>
												<xsl:with-param name="Pos" select="$pos"/>
											</xsl:call-template>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
					</xsl:for-each>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					</xsl:if>
					<!-- Page 8 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">8</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 3 &mdash; Foreign Taxes</div>
					</div>
					<xsl:variable name="sep3-4-1" select="($Print = $Separated) and (count($FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsShrGrp) &gt; 6)"/>
					<xsl:variable name="sep3-4-3" select="($Print = $Separated) and (count($FormData/Frm1120SForeignTaxesGrp/Frm1120SFrgnTaxRedetermGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="Page7Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:81mm;" rowspan="2">
										Description
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> Type of tax
									</th>
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;font-weight:normal;" colspan="2">
										<strong>(b)</strong> Section 951A category income
									</th>
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;font-weight:normal;border-right-width:0px;" colspan="3">
										<strong>(c)</strong> Foreign branch category income
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">Shareholder</th>
								</tr>
							</thead>
							<tbody>
								<!-- Part 3, Section 4, Line 1 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="vertical-align:top;">1</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Direct (section 901 or <br /> 903) foreign taxes: 
										<span style="width:7mm;"/>
										<input class="styCkboxNM" type="checkbox" style="" alt="Direct Foreign Taxes Paid Ind">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/ForeignTaxesPaidInd"/>
												<xsl:with-param name="BackupName">F1065K2ForeignTaxesGrpPaidInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:10mm;padding-left:1mm;">Paid</span>
										<input class="styCkboxNM" type="checkbox" style="" alt="Direct Foreign Taxes Accrued Ind">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/ForeignTaxesAccruedInd"/>
												<xsl:with-param name="BackupName">F1065K2ForeignTaxesGrpPaidInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="padding-left:1mm;">Accrued</span>
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:variable name="count341" select="count($FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsShrGrp)"/>
								<xsl:if test="not($sep3-4-1)">
									<xsl:for-each select="$FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsShrGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
												<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:choose>
													<xsl:when test="OtherCategoryDescriptionCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<xsl:call-template name="LineForeignTax1120SSingleP1">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 1)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">A</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:if test="$sep3-4-1">See Add'l Data</xsl:if>&nbsp;
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 2)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">B</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 3)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">C</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 4)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">D</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 5)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">E</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-1 or ($count341 &lt; 6)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">F</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<!-- Part 3, Section 4, Line 2 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">2</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Reduction of taxes (total)
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">A</td>
									<td class="styTableCellTextInherit">
										Taxes on foreign mineral income
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'FrgnMineralIncmTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'TxsOnFrgnMineralIncmAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">B</td>
									<td class="styTableCellTextInherit">
										Reserved for future use
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">C</td>
									<td class="styTableCellTextInherit">
										International boycott provisions
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'IntntlByctPrvsnTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'IntntlBoycottProvisionsAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">D</td>
									<td class="styTableCellTextInherit">
										Failure-to-file penalties
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'FailureToFilePenaltyTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'FailureToFilePenaltyAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">E</td>
									<td class="styTableCellTextInherit">
										Taxes with respect to splitter arrangements
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'SplitterArrangementTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'SplitterArrangementTaxAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">F</td>
									<td class="styTableCellTextInherit">
										Taxes on foreign corporate distributions
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'FrgnCorpDistriTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'TxsOnFrgnCorpDistributionsAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">G</td>
									<td class="styTableCellTextInherit">
										Other
									</td>
									<xsl:call-template name="LineForeignTaxL2P1">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineCode" select="'OtherReductionsTaxTypeCd'"/>
										<xsl:with-param name="LineElement" select="'OtherTaxReductionsAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Part 3, Section 4, Line 3 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">3</td>
									<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
										Foreign tax redeterminations
									</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:variable name="count343" select="count($FormData/Frm1120SForeignTaxesGrp/Frm1120SFrgnTaxRedetermGrp)"/>
								<xsl:if test="not($sep3-4-3)">
									<xsl:for-each select="$FormData/Frm1120SForeignTaxesGrp/Frm1120SFrgnTaxRedetermGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">
												<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<span style="border-bottom:1px dashed black;width:100%;">
													<xsl:choose>
														<xsl:when test="OtherCategoryDescriptionCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>
												<br />
												Related tax year &#9658; 
												<span style="border-bottom:1px dashed black;width:55mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="RelatedTaxYr"/>
													</xsl:call-template>
												</span>
												<br />
												Date tax paid &#9658; 
												<xsl:choose>
													<xsl:when test="count(TaxPaidDt) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="TargetNode" select="TaxPaidDt"/>
															<xsl:with-param name="Desc">Part III, Section 3, Line 3 - Dates tax paid</xsl:with-param>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="TaxPaidDt"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<xsl:call-template name="LineForeignTax1120SSingleP1">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep3-4-3 or ($count343 &lt; 1)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">A</td>
										<td class="styTableCellTextInherit" style="">
											<span style="width:100%;border-bottom:1px dashed black;">
												<xsl:if test="$sep3-4-3">See Add'l Data</xsl:if>&nbsp;
											</span>
											<br />
											Related tax year &#9658;
											<span style="width:55mm;border-bottom:1px dashed black;">&nbsp;</span>
											<br />
											Date tax paid &#9658;  
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-3 or ($count343 &lt; 2)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">B</td>
										<td class="styTableCellTextInherit" style="">
											<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span> <br /> 
											Related tax year &#9658; <span style="width:55mm;border-bottom:1px dashed black;">&nbsp;</span> <br /> 
											Date tax paid &#9658; 
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$sep3-4-3 or ($count343 &lt; 3)">
									<tr>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">C</td>
										<td class="styTableCellTextInherit" style="">
											<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span> <br /> 
											Related tax year &#9658; <span style="width:55mm;border-bottom:1px dashed black;">&nbsp;</span> <br /> 
											Date tax paid &#9658;  
										</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<!-- Part 3, Section 4, Line 4 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">4</td>
									<td class="styTableCellTextInherit" style="">
										Reserved for future use
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="sty1065K2RowIDCell" style="">5</td>
									<td class="styTableCellTextInherit" style="">
										Reserved for future use
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom:1px solid black;">6</td>
									<td class="styTableCellTextInherit" style="">
										Reserved for future use
									</td>
									<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 9 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">9</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 3 &mdash; Foreign Taxes <span style="font-style:italic;font-weight:normal;">(continued)</span></div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page8Table">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;" rowspan="2">&nbsp;</th>
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(d)</strong> Passive category income
									</th>
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(e)</strong> General category income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Other <br /> (category code 
										<span style="min-width:6mm;border-bottom:1px solid black;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/OtherFrgnTaxReductionsGrp[1]/SeparateCategoryCd"/>
											</xsl:call-template>
										</span>)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">Shareholder</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">Shareholder</th>
								</tr>
							</thead>
							<tbody>
								<!-- Part 3, Section 4, Line 1 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">1</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="LineForeignTaxP2">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsShrGrp"/>
									<xsl:with-param name="OtherNode" select="$FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsOtherGrp"/>
									<xsl:with-param name="Sep" select="$sep3-4-1"/>
									<xsl:with-param name="SixLine" select="true()"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
								<!-- Part 3, Section 4, Line 2 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">2</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">A</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'TxsOnFrgnMineralIncmAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">B</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">C</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'IntntlBoycottProvisionsAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">D</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'FailureToFilePenaltyAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">E</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'SplitterArrangementTaxAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">F</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'TxsOnFrgnCorpDistributionsAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<tr>
									<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">G</td>
									<xsl:call-template name="LineForeignTaxL2P2">
										<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
										<xsl:with-param name="LineElement" select="'OtherTaxReductionsAmt'"/>
										<xsl:with-param name="K2-1120S" select="true()"/>
									</xsl:call-template>
								</tr>
								<!-- Part 3, Section 4, Line 3 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">3</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
								</tr>
								<xsl:call-template name="LineForeignTaxP2">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/Frm1120SFrgnTaxRedetermGrp"/>
									<xsl:with-param name="OtherNode" select="$FormData/Frm1120SForeignTaxesGrp/FrgnTaxRedeterminationsOthGrp"/>
									<xsl:with-param name="Sep" select="$sep3-4-3"/>
									<xsl:with-param name="SixLine" select="false()"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
								</xsl:call-template>
									<!-- Part 3, Section 4, Line 4 -->
								<tr>
									<td class="sty1065K2RowIDCell" style="">4</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="sty1065K2RowIDCell" style="">5</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
								<tr>
									<td class="sty1065K2RowIDCell" style="border-bottom:1px solid black;">6</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
									<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 9 extra -->
					<xsl:if test="(count($FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsOtherGrp) &gt; 0) or 
					(count($FormData/Frm1120SForeignTaxesGrp/OtherFrgnTaxReductionsGrp) &gt; 1) or 
					(count($FormData/Frm1120SForeignTaxesGrp/FrgnTaxRedeterminationsOthGrp) &gt; 0)">
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">9</span> (continued)</span>
					</div>
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part III</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Other Information for Preparation of Form 1116 or 1118 <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 3 &mdash; R&amp;E Foreign taxes <span style="font-weight:normal;">(Line 1 additional data)</span></div>
					</div>
					<xsl:variable name="P8OthGrp1" select="$FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsOtherGrp"/>
					<div class="styTableContainerLandscapeNBB" id="Page8TableEX1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$P8OthGrp1">
									<xsl:if test="(position() mod 8) = 1">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 1]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 1]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 2]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 2]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 3]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 3]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 4]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 4]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 5]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 5]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 6]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 6]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp1[$pos + 7]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp1[$pos + 7]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 3 &mdash; R&amp;E Foreign taxes <span style="font-weight:normal;">(Line 2 additional data)</span></div>
					</div>
					<!--<xsl:variable name="P8OthGrp2" select="$FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsShrGrp"/>-->
					<xsl:for-each select="$FormData/Frm1120SForeignTaxesGrp/OtherFrgnTaxReductionsGrp[position() &gt; 1]">
						<xsl:if test="(position() mod 6) = 1">
							<xsl:variable name="pos" select="position()"/>
							<div class="styTableContainerLandscapeNBB" id="Page8EXTable2">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
									<thead class="styTableThead">
										<tr style="border-top:1px solid black;">
											<th class="styTableCellHeader" scope="col" style="width:7mm;">&nbsp;</th>
											<th class="styTableCellHeader" scope="col" style="width:63mm;">
												Description
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 2]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 3]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 4]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 5]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;">
												<strong>(f)</strong> Other <br /> 
												(category code <xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/OtherFrgnTaxReductionsGrp[$pos + 6]/SeparateCategoryCd"/>
												</xsl:call-template>) 
											</th>
										</tr>
									</thead>
									<tbody>
										<!-- Part 3, Section 4, Line 2 -->
										<tr>
											<td class="sty1065K2RowIDCell" style="">2</td>
											<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
												Reduction of taxes (total)
											</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-bottom-width:0px;border-right-width:0px;">&nbsp;</td>
										</tr>
										<!-- 2A -->
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">A</td>
											<td class="styTableCellTextInherit">
												Taxes on foreign mineral income
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'TxsOnFrgnMineralIncmAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">B</td>
											<td class="styTableCellTextInherit">
												Reserved for future use
											</td>
											<td class="styTableCellTextInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="background-color:lightgrey;border-right-width:0px;">&nbsp;</td>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">C</td>
											<td class="styTableCellTextInherit">
												International boycott provisions
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'IntntlBoycottProvisionsAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">D</td>
											<td class="styTableCellTextInherit">
												Failure-to-file penalties
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'FailureToFilePenaltyAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">E</td>
											<td class="styTableCellTextInherit">
												Taxes with respect to splitter arrangements
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'SplitterArrangementTaxAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">F</td>
											<td class="styTableCellTextInherit">
												Taxes on foreign corporate distributions
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'TxsOnFrgnCorpDistributionsAmt'"/>
											</xsl:call-template>
										</tr>
										<tr>
											<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;vertical-align:top;">G</td>
											<td class="styTableCellTextInherit">
												Other
											</td>
											<xsl:call-template name="LineForeignTaxL2Other">
												<xsl:with-param name="SubGroup" select="$FormData/Frm1120SForeignTaxesGrp"/>
												<xsl:with-param name="Pos" select="$pos"/>
												<xsl:with-param name="LineElement" select="'OtherTaxReductionsAmt'"/>
											</xsl:call-template>
										</tr>
									</tbody>
								</table>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:variable name="P8OthGrp3" select="$FormData/Frm1120SForeignTaxesGrp/FrgnTaxRedeterminationsOthGrp"/>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;border-top:1px solid black;">
						<div class="styLNDesc" style="width:255mm;height:auto;">Section 3 &mdash; R&amp;E Foreign taxes <span style="font-weight:normal;">(Line 3 additional data)</span></div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page8TableEX3">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(f) </strong> Other income <br />
										Row &nbsp; Desc &nbsp; Category
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$P8OthGrp3">
									<xsl:if test="(position() mod 8) = 1">
										<xsl:variable name="pos" select="position()"/>
										<tr>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 1]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 1]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 2]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 2]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 3]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 3]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 4]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 4]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 5]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 5]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 6]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 6]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<div style="width:100%;text-align:center;">
													<span style="float:left;text-align:left;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/AlphaRowId"/>
														</xsl:call-template>
													</span>
													<span style="">
														<xsl:choose>
															<xsl:when test="$P8OthGrp3[$pos + 7]/OtherCategoryDescriptionCd">
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/OtherCategoryDescriptionCd"/>
																</xsl:call-template>
															</xsl:when>
															<xsl:otherwise>
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/ForeignCountryOrUSPossessionCd"/>
																</xsl:call-template>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<span style="float:right;text-align:right;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/SeparateCategoryCd"/>
														</xsl:call-template>
													</span>
												</div>
												<br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$P8OthGrp3[$pos + 7]/OtherCategoryIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					</xsl:if>
					<!-- Page 10 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">10</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part IV</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Distributions From Foreign Corporations to Corporation
						</div>
					</div>
					<!-- Part 5 tables -->
					<xsl:variable name="sep5" select="($Print = $Separated) and (count($FormData/SchK2K3FrgnCorpDistriToCorpGrp) &gt; 15)"/>
					<div class="styTableContainerLandscapeNBB" id="Page10Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;border-right:none;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:124mm;font-weight:normal;">
										<strong>(a)</strong> Name of distributing foreign corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:33mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Date of distribution
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(d)</strong> Functional currency of distributing foreign corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:34mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Amount of distribution in functional currency
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep5)">
									<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriToCorpGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="DistributingForeignCorpName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part V, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DistributionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionFuncCurAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep5 or (count($FormData/SchK2K3FrgnCorpDistriToCorpGrp) &lt; 15)">
									<xsl:call-template name="FillTable6Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3FrgnCorpDistriToCorpGrp)"/>
										<xsl:with-param name="SepMessage" select="$sep5"/>
										<xsl:with-param name="MaxLine" select="15"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page10Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:42mm;font-weight:normal;">
										<strong>(f)</strong> Amount of E&amp;P distribution <br /> in functional currency
									</th>
									<th class="styTableCellHeader" scope="col" style="width:46mm;font-weight:normal;">
										<strong>(g)</strong> Spot rate (functional <br /> currency to U.S. dollars)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(h)</strong> Amount of distribution <br /> in U.S. dollars
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(i)</strong> Amount of E&amp;P distribution <br /> in U.S. dollars
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(j)</strong> Qualified foreign corporation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-right-width:0px;">
										<strong>(k)</strong> Reserved for <br /> future use
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep5)">
									<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriToCorpGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionFromEPFuncCurAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SpotRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DistributionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EPDistributionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="padding-top:0.5mm;">
												<input type="checkbox" class="styCkboxNM" style="">
													<xsl:attribute name="alt">Row <xsl:value-of select="AlphaRowId"/> Qualified Foreign Corporation Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="QualifiedForeignCorporationInd"/>
														<xsl:with-param name="BackupName">SchK2K3FrgnCorpDistriToCorpGrpQualifiedForeignCorporationInd<xsl:value-of select="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;background-color:lightgrey;">&nbsp;</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep5 or (count($FormData/SchK2K3FrgnCorpDistriToCorpGrp) &lt; 15)">
									<xsl:call-template name="FillPart5Table2">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3FrgnCorpDistriToCorpGrp)"/>
										<xsl:with-param name="SepMessage" select="$sep5"/>
										<xsl:with-param name="MaxLine" select="15"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 11 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">11</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part V</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Information on Shareholder's Section 951(a)(1) and Section 951A Inclusions
						</div>
					</div>
					<!-- Part 6, Line a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">a</div>
						<div class="styLNDesc" style="width:216mm;">
							Separate category (enter code)
							<span class="sty1065K2DotLn">...........................................</span>
						</div>
						<div class="styLNAmountBox" style="border-left:none;text-align:center;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/SeparateCategoryCd"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">b</div>
						<div class="styLNDesc" style="width:240mm;">
							If box is checked, this is completed with respect to U.S. source income
							<span class="sty1065K2DotLn" style="margin-right:-6px;">....................................&#9658;</span>
						</div>
						<div class="styGenericDiv" style="width:8mm;text-align:center;">
							<input type="checkbox" class="styCkboxNM" style="margin-top:2px;" alt="U.S. source income">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/USSourceIncomeInd"/>
									<xsl:with-param name="BackupName">F1065K2USSourceIncomeInd1</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!-- Part 6 tables -->
					<xsl:variable name="sep6" select="($Print = $Separated) and (count($FormData/SchK2K3ShrSect951a1InclsnGrp[1]/SchK2K3ShrCFCOwnrInfoGrp) &gt; 11)"/>
					<div class="styTableContainerLandscapeNBB" id="Page11Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:92mm;font-weight:normal;">
										<strong>(a)</strong> Name of CFC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong> Ending of CFC tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> Shareholder's share of CFC items through their ownership in its corporation ("shareholder's share")
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(e)</strong> Shareholder's share of subpart F income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
										<strong>(f)</strong> Shareholder's section 951(a)(1)(B) inclusion
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;">
										<strong>(g)</strong> Tested income
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep6)">
									<xsl:for-each select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/SchK2K3ShrCFCOwnrInfoGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="CFCName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part VI, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="CFCTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AggrgtShrCFCItemsShrOwnrRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareSubpartFIncomeAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtSect951a1BInclsnAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep6 or (count($FormData/SchK2K3ShrSect951a1InclsnGrp[1]/SchK2K3ShrCFCOwnrInfoGrp) &lt; 11)">
									<xsl:call-template name="FillTable8Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3ShrSect951a1InclsnGrp[1]/SchK2K3ShrCFCOwnrInfoGrp)"/>
										<xsl:with-param name="SepMessage" select="$sep6"/>
										<xsl:with-param name="MaxLine" select="11"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 6, Table 1 Totals -->
					<div class="styStdDivLS" style="border-color:black;border-style:solid;border-width:1px 0px;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:163mm;">
							<strong>Shareholder's total </strong> (sum for all CFCs)
							<span class="sty1065K2DotLn">.........................&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotAggrgtShareSubpartFIncmAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:29mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotAggrgtSect951a1BInclsnAmt"/>
								<xsl:with-param name="MaxSize" select="17"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:27mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotalTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page11Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
										<strong>(h)</strong> Tested loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
										<strong>(i)</strong> Shareholder's share of tested income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
										<strong>(j)</strong> Shareholder's share of tested loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
										<strong>(k)</strong> Shareholder's share of Qualified Business Asset Investment (QBAI)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
										<strong>(l)</strong> Shareholder's share of the tested loss QBAI amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
										<strong>(m)</strong> Shareholder's share of tested interest income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;border-right-width:0px;">
										<strong>(n)</strong> Shareholder's share of tested interest expense
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep6)">
									<xsl:for-each select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/SchK2K3ShrCFCOwnrInfoGrp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareTestedIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareTestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShrTestedLossQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntExpenseAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep6 or (count($FormData/SchK2K3ShrSect951a1InclsnGrp[1]/SchK2K3ShrCFCOwnrInfoGrp) &lt; 11)">
									<xsl:call-template name="FillTable8Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/SchK2K3ShrSect951a1InclsnGrp[1]/SchK2K3ShrCFCOwnrInfoGrp)"/>
										<xsl:with-param name="SepMessage" select="$sep6"/>
										<xsl:with-param name="MaxLine" select="11"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 6, Table 2 Totals -->
					<div class="styStdDivLS" style="border-color:black;border-style:solid;border-width:1px 0px;">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotalTestedLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:34.9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotAggrgtShareTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotAggregateShareTestedLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:34.9mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotAggregateShareQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotAggrgtShrTestedLossQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:35.1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotAggrgtShareTestedIntIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SchK2K3ShrSect951a1InclsnGrp[1]/TotAggrgtShrTestedIntExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 10 extra -->
					<xsl:for-each select="$FormData/SchK2K3ShrSect951a1InclsnGrp[position() &gt; 1]">
						<div class="styStdDivLS">
							Schedule K-3 (Form 1120-S) 2021
							<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">10</span> (continued)</span>
						</div>
						<!-- Filer information section -->
						<xsl:call-template name="SchK3PageEntity1120S"/>
						<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
							<div class="styPartName" style="width:15mm;">Part V</div>
							<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
								Information on Shareholder's Section 951(a)(1) and Section 951A Inclusions <span style="font-weight:normal;">(continued)</span>
							</div>
						</div>
						<!-- Part 6, Line a -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">a</div>
							<div class="styLNDesc" style="width:216mm;">
								Separate category (enter code)
								<span class="sty1065K2DotLn">...........................................</span>
							</div>
							<div class="styLNAmountBox" style="border-left:none;text-align:center;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="SeparateCategoryCd"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">b</div>
							<div class="styLNDesc" style="width:240mm;">
								If box is checked, this is completed with respect to U.S. source income
								<span class="sty1065K2DotLn" style="margin-right:-6px;">....................................&#9658;</span>
							</div>
							<div class="styGenericDiv" style="width:8mm;text-align:center;">
								<input type="checkbox" class="styCkboxNM" style="margin-top:2px;" alt="U.S. source income">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="USSourceIncomeInd"/>
										<xsl:with-param name="BackupName">F1065K2USSourceIncomeInd<xsl:value-of select="position() + 1"/></xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
						</div>
						<!-- Part 6 tables -->
						<xsl:variable name="sep6x" select="($Print = $Separated) and (count(SchK2K3ShrCFCOwnrInfoGrp) &gt; 11)"/>
						<div class="styTableContainerLandscapeNBB" id="Page11Table1x">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr style="border-top:1px solid black;">
										<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
										<th class="styTableCellHeader" scope="col" style="width:92mm;font-weight:normal;">
											<strong>(a)</strong> Name of CFC
										</th>
										<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
											<strong>(b)</strong> EIN or reference ID number
										</th>
										<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
											<strong>(c)</strong> Ending of CFC tax year
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
											<strong>(d)</strong> Shareholder's share of CFC items through their ownership in its corporation ("shareholder's share")
										</th>
										<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
											<strong>(e)</strong> Shareholder's share of subpart F income
										</th>
										<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;">
											<strong>(f)</strong> Shareholder's section 951(a)(1)(B) inclusion
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;">
											<strong>(g)</strong> Tested income
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="not($sep6x)">
										<xsl:for-each select="SchK2K3ShrCFCOwnrInfoGrp">
											<tr style="vertical-align:bottom;">
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AlphaRowId"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellTextInherit" style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="CFCName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellCtrInherit" style="word-break:break-all;">
													<xsl:choose>
														<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
															<xsl:call-template name="LinkToLeftoverDataTableInline">
																<xsl:with-param name="Desc">Part VI, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
																<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="ForeignEntityIdentificationGrp">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="CFCTaxYearEndDt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellCtrInherit" style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AggrgtShrCFCItemsShrOwnrRt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggrgtShareSubpartFIncomeAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggrgtSect951a1BInclsnAmt"/>
														<xsl:with-param name="MaxSize" select="17"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TestedIncomeAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="$sep6x or (count(SchK2K3ShrCFCOwnrInfoGrp) &lt; 11)">
										<xsl:call-template name="FillTable8Cols">
											<xsl:with-param name="LineNumber" select="1 + count(SchK2K3ShrCFCOwnrInfoGrp)"/>
											<xsl:with-param name="SepMessage" select="$sep6x"/>
											<xsl:with-param name="MaxLine" select="11"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Part 6, Table 1 Totals -->
						<div class="styStdDivLS" style="border-color:black;border-style:solid;border-width:1px 0px;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:163mm;">
								<strong>Shareholder's total </strong> (sum for all CFCs)
								<span class="sty1065K2DotLn">.........................&#9658;</span>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:29mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShareSubpartFIncmAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:29mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtSect951a1BInclsnAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="width:27mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalTestedIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styTableContainerLandscapeNBB" id="Page11Table2x">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr style="border-top:1px solid black;">
										<th class="styTableCellHeader" scope="col" style="width:8mm;">&nbsp;</th>
										<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(h)</strong> Tested loss
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(i)</strong> Shareholder's share of tested income
										</th>
										<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(j)</strong> Shareholder's share of tested loss
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(k)</strong> Shareholder's share of Qualified Business Asset Investment (QBAI)
										</th>
										<th class="styTableCellHeader" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(l)</strong> Shareholder's share of the tested loss QBAI amount
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(m)</strong> Shareholder's share of tested interest income
										</th>
										<th class="styTableCellHeader" scope="col" style="width:35mm;font-weight:normal;border-right-width:0px;">
											<strong>(n)</strong> Shareholder's share of tested interest expense
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="not($sep6x)">
										<xsl:for-each select="SchK2K3ShrCFCOwnrInfoGrp">
											<tr style="vertical-align:bottom;">
												<td class="styTableCellCtrInherit" style="font-weight:bold;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="AlphaRowId"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TestedLossAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggregateShareTestedIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggregateShareTestedLossAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggregateShareQBAIAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggregateShrTestedLossQBAIAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntExpenseAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="$sep6x or (count(SchK2K3ShrCFCOwnrInfoGrp) &lt; 11)">
										<xsl:call-template name="FillTable8Cols">
											<xsl:with-param name="LineNumber" select="1 + count(SchK2K3ShrCFCOwnrInfoGrp)"/>
											<xsl:with-param name="SepMessage" select="$sep6x"/>
											<xsl:with-param name="MaxLine" select="11"/>
										</xsl:call-template>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<!-- Part 6, Table 2 Totals -->
						<div class="styStdDivLS" style="border-color:black;border-style:solid;border-width:1px 0px;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalTestedLossAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:34.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShareTestedIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggregateShareTestedLossAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:34.9mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggregateShareQBAIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:36mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShrTestedLossQBAIAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="padding-right:0.5mm;width:35.1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShareTestedIntIncmAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="width:35mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotAggrgtShrTestedIntExpnsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
							<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
						</div>
					</xsl:for-each>
					<!-- Page 12 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">12</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part VI</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Information To Complete Form 8621
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;border-bottom:1px solid black;">
							Section 1 &mdash; General Information on Passive Foreign Investment Company (PFIC), Qualified Electing Fund (QEF), or Qualifying Insurance Corporation (QIC)
						</div>
					</div>
					<!-- Part 7 tables -->
					<xsl:variable name="sep7" select="($Print = $Separated) and (count($FormData/F1120SSchK2K3InfoToComp8621Grp) &gt; 12)"/>
					<div class="styTableContainerLandscapeNBB" id="Page12Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="">
									<th class="styTableCellHeader" scope="colgroup" style="width:auto;" colspan="5">General Information</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:102mm;font-weight:normal;">
										<strong>(a)</strong> Name of PFIC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:90mm;font-weight:normal;">
										<strong>(c)</strong> Address of PFIC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(d)</strong> Beginning of PFIC tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Ending of PFIC tax year
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep7)">
									<xsl:for-each select="$FormData/F1120SSchK2K3InfoToComp8621Grp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PFICOrQEFName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part VI, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:choose>
													<xsl:when test="PFICOrQEFForeignAddress">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="PFICOrQEFForeignAddress"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="PFICOrQEFUSAddress"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="TaxYearBeginDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="TaxYearEndDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep7 or (count($FormData/F1120SSchK2K3InfoToComp8621Grp) &lt; 12)">
									<xsl:call-template name="FillTable5Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/F1120SSchK2K3InfoToComp8621Grp)"/>
										<xsl:with-param name="SepMessage" select="$sep7"/>
										<xsl:with-param name="MaxLine" select="12"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page12Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="border-top:1px solid black;">
									<th class="styTableCellHeader" scope="colgroup" colspan="4" style="width:auto;">Summary of Annual Information</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="5" style="width:auto;">Information Regarding Elections</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(f)</strong> Description of each <br /> class of PFIC shares
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(g)</strong> Dates PFIC <br /> shares acquired <br /> during tax year <br /> (if applicable)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:41mm;font-weight:normal;">
										<strong>(h)</strong> Shareholder's share <br /> of total number of <br /> PFIC shares held by <br /> corporation at end of <br /> tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(i)</strong> Shareholder's share of total value of <br /> PFIC shares held by corporation at end of tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(j)</strong> Election made by corporation <br /> (enter code &mdash; see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(k)</strong> Box is checked if foreign corporation has documented its eligiblity to be treated as a qualifying insurance corporation under section <br /> 1297(f)(2).
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(l)</strong> Box is checked if PFIC has indicated its shares are "marketable stock" within the meaning of section 1296(e).
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(m)</strong> Box is checked if PFIC is also a controlled foreign corporation (CFC) within the meaning of section 957.
									</th>
									<th class="styTableCellHeader" scope="col" style="width:25mm;font-weight:normal;border-right-width:0px;">
										<strong>(n)</strong> Box is checked if PFIC meets the income test or asset test of section 1297(a) for the tax year.
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep7)">
									<xsl:for-each select="$FormData/F1120SSchK2K3InfoToComp8621Grp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ClassOfShareCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="SharesAcquiredDuringTYDt"/>
												</xsl:call-template>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TotalPFICSharesTaxYearEndCnt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalPFICSharesTaxYearEndAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CorporationElectionCd"/>
												</xsl:call-template>
											</td>
											<xsl:variable name="pos" select="position()"/>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="margin:2px;">
													<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> Qualified Insurance Corporation Election Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="QualifiedInsuranceCorpElectInd"/>
														<xsl:with-param name="BackupName">K2QualifiedInsuranceCorpElectInd<xsl:value-of select="$pos"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="margin:2px;">
													<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC election to mark Marketable Stock Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ElectionToMarkToMrktPFICStkInd"/>
														<xsl:with-param name="BackupName">K2ElectionToMarkToMrktPFICStkInd<xsl:value-of select="$pos"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<input type="checkbox" class="styCkboxNM" style="margin:2px;">
													<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC CFC under Section 957 Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PFICCFCUnderSect957Ind"/>
														<xsl:with-param name="BackupName">K2PFICCFCUnderSect957Ind<xsl:value-of select="$pos"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM" style="margin:2px;">
													<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC Income Asset Test Met Section 1297 A Ind</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PFICIncmAstTestMetSect1297aInd"/>
														<xsl:with-param name="BackupName">K2PFICIncmAstTestMetSect1297aInd<xsl:value-of select="$pos"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep7 or (count($FormData/F1120SSchK2K3InfoToComp8621Grp) &lt; 12)">
									<xsl:call-template name="FillPart7Table2">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/F1120SSchK2K3InfoToComp8621Grp)"/>
										<xsl:with-param name="SepMessage" select="$sep7"/>
										<xsl:with-param name="MaxLine" select="12"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 13 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">13</span></span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part VI</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Information To Complete Form 8621 <span style="font-style:italic;">(continued)</span>
						</div>
					</div>
					<div class="styStdDivLS" style="font-size:8pt;font-weight:bold;">
						<div class="styLNDesc" style="width:255mm;height:auto;border-bottom:1px solid black;">
							Section 2 &mdash; Additional Information on PFIC or QEF
						</div>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page13Table1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:auto;">General Information</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:auto;">QEF Information</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:auto;">Mark-to-Market Information</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="1" style="width:auto;border-right-width:0px;">Section 1291 and Other Information</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:104mm;font-weight:normal;">
										<strong>(a)</strong> Name of PFIC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(c)</strong> Shareholder's share of ordinary earnings
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(d)</strong> Shareholder's share of net capital gain
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(e)</strong> Shareholder's share of fair market value of PFIC shares held by corporation at beginning of tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(f)</strong> Shareholder's share of fair market value of PFIC shares held by corporation at end of tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(g)</strong> Dates PFIC shares were acquired
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep7)">
									<xsl:for-each select="$FormData/F1120SSchK2K3InfoToComp8621Grp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="PFICOrQEFName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part VII, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OrdinaryEarningsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NetCapitalGainAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FMVOfPFICSharesTYBegngAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FMVOfPFICSharesTYEndAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="SharesAcquiredDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep7 or (count($FormData/F1120SSchK2K3InfoToComp8621Grp) &lt; 12)">
									<xsl:call-template name="FillTable7ColsR">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/F1120SSchK2K3InfoToComp8621Grp)"/>
										<xsl:with-param name="SepMessage" select="$sep7"/>
										<xsl:with-param name="MaxLine" select="12"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styTableContainerLandscapeNBB" id="Page13Table2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="colgroup" colspan="8" style="height:8mm;width:auto;border-right-width:0px;">Section 1291 and Other Information</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(h)</strong> Shareholder's share of amount of cash and fair market value of property distributed by PFIC during the current tax year (if applicable)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(i)</strong> Dates of distribution
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(j)</strong> Shareholder's share of total creditable foreign taxes attributable to distribution by PFIC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(k)</strong> Shareholder's share of total distributions from PFIC in preceding 3 tax years
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(l)</strong> Dates PFIC shares disposed of during tax year (if applicable)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(m)</strong> Shareholder's share of amount realized by corporation on disposition of PFIC shares
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(n)</strong> Shareholder's share of corproration's tax basis in PFIC shares on dates of disposition (including shareholder-specific adjustments)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:32mm;font-weight:normal;border-right-width:0px;">
										<strong>(o)</strong> Shareholder's share of gain (loss) on disposition by corporation of PFIC shares
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($sep7)">
									<xsl:for-each select="$FormData/F1120SSchK2K3InfoToComp8621Grp">
										<tr style="vertical-align:bottom;">
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PFICCashDistributedPropFMVAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DistributionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotPFICCrdblFrgnTxsDistriAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotPFICDistriPrec3TaxYearsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="DispositionDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PFICSharesDisposRealizedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PFICSharesTaxBasisAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PFICSharesDisposGainLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$sep7 or (count($FormData/F1120SSchK2K3InfoToComp8621Grp) &lt; 12)">
									<xsl:call-template name="FillTable8ColsR">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/F1120SSchK2K3InfoToComp8621Grp)"/>
										<xsl:with-param name="SepMessage" select="$sep7"/>
										<xsl:with-param name="MaxLine" select="12"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
					<!-- Page 14 -->
					<xsl:for-each select="$FormData/SchK2K3ShrIntInFrgnCorpIncmGrp">
						<div class="styStdDivLS">
							Schedule K-3 (Form 1120-S) 2021
							<span style="float:right;">
								Page <span style="font-weight:bold;font-size:8pt;">14</span> 
								<xsl:if test="position() &gt; 1"> (continued)</xsl:if>
							</span>
						</div>
						<xsl:call-template name="S960Page1"><xsl:with-param name="K3-1120S" select="true()"/></xsl:call-template>
						<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
							<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
						</div>
						<xsl:if test="position() != last()">
							<!-- Page 15 -->
							<div class="styStdDivLS">
								Schedule K-3 (Form 1120-S) 2021
								<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">15</span> (excerpt)</span>
							</div>
							<xsl:call-template name="S960Page2"><xsl:with-param name="K3-1120S" select="true()"/></xsl:call-template>
							<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
								<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="count($FormData/SchK2K3ShrIntInFrgnCorpIncmGrp) &lt; 1">
						<div class="styStdDivLS">
							Schedule K-3 (Form 1120-S) 2021
							<span style="float:right;">
								Page <span style="font-weight:bold;font-size:8pt;">14</span> 
							</span>
						</div>
						<xsl:call-template name="S960Page1"><xsl:with-param name="K3-1120S" select="true()"/></xsl:call-template>
						<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
							<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
						</div>
					</xsl:if>
					<!-- Page 15 -->
					<div class="styStdDivLS">
						Schedule K-3 (Form 1120-S) 2021
						<span style="float:right;">
							Page <span style="font-weight:bold;font-size:8pt;">15</span> 
						</span>
					</div>
					<!-- Filer information section -->
					<xsl:call-template name="SchK3PageEntity1120S"/>
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:15mm;">Part VII</div>
						<div class="styPartDesc" style="padding-left:3mm;width:230mm;">
							Corporation's Interest in Foreign Corporation Income (Section 960) <span style="font-style:italic;font-weight:normal;">(continued)</span>
						</div>
					</div>
					<xsl:for-each select="$FormData/SchK2K3ShrIntInFrgnCorpIncmGrp[position() = last()]">
						<xsl:call-template name="S960Page2"><xsl:with-param name="K3-1120S" select="true()"/></xsl:call-template>
					</xsl:for-each>
					<xsl:if test="count($FormData/SchK2K3ShrIntInFrgnCorpIncmGrp) &lt; 1">
						<xsl:call-template name="S960Page2"><xsl:with-param name="K3-1120S" select="true()"/></xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;font-weight:bold;">
						<span style="float:right;">Schedule K-3 (Form 1120-S) 2021</span>
					</div>
<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Line 1a separated table -->
					<xsl:if test="$sep2-1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 1 - Sales</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrSalesGrossIncomeGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 2 - Gross income from performance of services</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrGrossIncmPerfOfSrvcGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 3 - Gross rental real estate income</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrGroRntlRealEstateIncmGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-4">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 4 - Other gross rental income</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrOthGrossRentalIncomeGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-6">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 6 - Interest Income</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrInterestIncomeGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-7">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 7 - Ordinary Dividends</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrOrdinaryDividendsGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-8">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 8 - Qualified Dividends</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrQualifiedDividendsGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-10">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 10 - Royalties and license fees</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrRoyaltiesLicenseFeesGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-11">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 11 - Net short-term capital gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrNetShortTermCapGainGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-12">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 12 - Net long-term capital gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrNetLongTermCapGainGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-13">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 13 - Collectibles (28%) gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrCollectiblesGainGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-14">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 14 - Unrecaptured section 1250 gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrUnrcptrSect1250GainGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-15">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 15 - Net section 1231 gain</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrNetSection1231GainGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-19">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 19 - Section 951(a) inclusions</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrSection951aInclusionsGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-20">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 20 - Other income</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/ShrOtherIncomeGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-24">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 1, Line 24 - Total gross income (by country)</span>
						<xsl:call-template name="UnitLineIncDedSourceSep">
							<xsl:with-param name="TargetNode" select="$FormData/Frm1120SGrossIncomeGrp/TotShrGrossIncmByCountryGrp"/>
							<xsl:with-param name="K2-1120S" select="true()"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$sep2-32">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II, Section 2, Line 32 - R&amp;E expenses</span>
						<table class="styDepTbl" style="font-size:7pt;width:auto;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left;width:34mm;">
										SIC code
									</th>
									<th class="styDepTblCell" style="text-align:left;width:34mm;">
										<strong>(f) </strong> Sourced by shareholder
									</th>
									<th class="styDepTblCell" style="text-align:left;width:34mm;">
										<strong>(g) </strong> Total
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Frm1120SDeductionsGrp/ShrREExpensesGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;width:auto;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SICCd"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styDepTblCell" style="text-align:right;width:auto;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="SourcedAtShrLvlIncmAmt"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styDepTblCell" style="text-align:right;width:auto;">
											<span style="font-size:7pt;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalAmt"/>
												</xsl:call-template>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$sep3-1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III, Section 1, Line 1 - R&amp;E Expenses Apportionment Factors</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:55mm;" rowspan="2">
										Description
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> U.S. source
									</th>
									<th class="styDepTblCell" scope="colgroup" style="" colspan="4">
										Foreign Source
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Sourced by shareholder
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong> Foreign branch category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Passive <br /> category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> General <br /> category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;font-weight:normal;">
										<strong>(e)</strong> Other <br /> (category code ___) <br /> (country code ___)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Frm1120SREExpnssApprtnFctrGrp/GrossReceiptsSICCodeShrGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
											<xsl:number format="A" value="position()"/>
										</td>
										<td class="styTableCellTextInherit" style="">
											SIC code 
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SICCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="USSourceIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignBranchIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PassiveCategoryIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GeneralCategoryIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:variable name="cnode" select="."/>
											<xsl:choose>
												<xsl:when test="count($P3OthGrp[SICCd = $cnode/SICCd]) &gt; 0">See Page 5 (continued)</xsl:when>
												<xsl:otherwise>&nbsp;</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SourcedAtShrLvlIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$sep3-4-1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III, Section 3, Line 1 -  Direct (section 901 or 903) foreign taxes </span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:81mm;" rowspan="2">
										Description
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> Type of tax
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="2">
										<strong>(b)</strong> Section 951A category income
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;border-right-width:0px;" colspan="3">
										<strong>(c)</strong> Foreign branch category income
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">Shareholder</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsShrGrp">
									<tr style="vertical-align:bottom;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
											<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:choose>
												<xsl:when test="OtherCategoryDescriptionCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:call-template name="LineForeignTax1120SSingleP1">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(d)</strong> Passive category income
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(e)</strong> General category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Other <br /> (category code 
										<span style="min-width:6mm;border-bottom:1px solid black;"/>)
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Shareholder</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Shareholder</th>
								</tr>
							</thead>
							<tbody>
								<xsl:call-template name="LineForeignTaxP2Sep">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsShrGrp"/>
									<xsl:with-param name="OtherNode" select="$FormData/Frm1120SForeignTaxesGrp/DrtSect901Or903FrgnTxsOtherGrp"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
									<xsl:with-param name="K3-page" select="true()"/>
								</xsl:call-template>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$sep3-4-3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III, Section 3, Line 3 -  Foreign tax redeterminations </span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:7mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:81mm;" rowspan="2">
										Description
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;" rowspan="2">
										<strong>(a)</strong> Type of tax
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="2">
										<strong>(b)</strong> Section 951A category income
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;border-right-width:0px;" colspan="3">
										<strong>(c)</strong> Foreign branch category income
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">Shareholder</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Frm1120SForeignTaxesGrp/Frm1120SFrgnTaxRedetermGrp">
									<tr style="vertical-align:bottom;border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit" style="font-weight:bold;border:none;">
											<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="AlphaRowId"/></xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<span style="border-bottom:1px dashed black;width:100%;">
												<xsl:choose>
													<xsl:when test="OtherCategoryDescriptionCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="OtherCategoryDescriptionCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
											<br />
											Related tax year &#9658; 
											<span style="border-bottom:1px dashed black;width:50mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="RelatedTaxYr"/>
												</xsl:call-template>
											</span>
											<br />
											Date tax paid &#9658; 
											<xsl:choose>
												<xsl:when test="count(TaxPaidDt) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="TargetNode" select="TaxPaidDt"/>
														<xsl:with-param name="Desc">Part III, Section 3, Line 3 - Dates tax paid</xsl:with-param>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="TaxPaidDt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<xsl:call-template name="LineForeignTax1120SSingleP1">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;" rowspan="2">&nbsp;</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(d)</strong> Passive category income
									</th>
									<th class="styDepTblCell" scope="colgroup" style="width:auto;font-weight:normal;" colspan="3">
										<strong>(e)</strong> General category income
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;" rowspan="2">
										<strong>(f)</strong> Other <br /> (category code 
										<span style="min-width:6mm;border-bottom:1px solid black;"/>)
									</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;border-right-width:0px;" rowspan="2">
										<strong>(g)</strong> Total
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Shareholder</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">U.S.</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Foreign</th>
									<th class="styDepTblCell" scope="col" style="width:31mm;font-weight:normal;">Shareholder</th>
								</tr>
							</thead>
							<tbody>
								<xsl:call-template name="LineForeignTaxP2Sep">
									<xsl:with-param name="TargetNode" select="$FormData/Frm1120SForeignTaxesGrp/Frm1120SFrgnTaxRedetermGrp"/>
									<xsl:with-param name="OtherNode" select="$FormData/Frm1120SForeignTaxesGrp/FrgnTaxRedeterminationsOthGrp"/>
									<xsl:with-param name="K2-1120S" select="true()"/>
									<xsl:with-param name="K3-page" select="true()"/>
								</xsl:call-template>
							</tbody>
						</table>
					</xsl:if>
					<xsl:for-each select="$FormData/Frm1120SForeignTaxesGrp/Frm1120SFrgnTaxRedetermGrp">
						<xsl:if test="count(TaxPaidDt) &gt; 1">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part III, Section 3, Line 3 - Row <xsl:value-of select="AlphaRowId"/> - Tax Paid Dates</span>
							<table class="styDepTbl" style="font-size:7pt;width:70mm;">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:center;">
											Tax Paid Date
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="TaxPaidDt">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="text-align:center;">
												<span style="font-size:7pt;">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="$sep5">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part V - Distributions From Foreign Corporations to Corporation</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;border-right:none;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:124mm;font-weight:normal;">
										<strong>(a)</strong> Name of distributing foreign corporation
									</th>
									<th class="styDepTblCell" scope="col" style="width:33mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Date of distribution
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(d)</strong> Functional currency of distributing foreign corporation
									</th>
									<th class="styDepTblCell" scope="col" style="width:34mm;font-weight:normal;">
										<strong>(e)</strong> Amount of distribution in functional currency
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriToCorpGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AlphaRowId"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="DistributingForeignCorpName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DistributingForeignCorpName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part V, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="DistributingForeignCorpEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DistributionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FunctionalCurrencyCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionFuncCurAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;border-right:none;">&nbsp;</th>
									<th class="styDepTblCell" scope="col" style="width:42mm;font-weight:normal;">
										<strong>(f)</strong> Amount of E&amp;P distribution <br /> in functional currency
									</th>
									<th class="styDepTblCell" scope="col" style="width:46mm;font-weight:normal;">
										<strong>(g)</strong> Spot rate (functional <br /> currency to U.S. dollars)
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(h)</strong> Amount of distribution <br /> in U.S. dollars
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(i)</strong> Amount of E&amp;P distribution <br /> in U.S. dollars
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(j)</strong> Qualified foreign corporations
									</th>
									<th class="styDepTblCell" scope="col" style="width:40mm;font-weight:normal;">
										<strong>(k)</strong> Reserved for <br /> future use
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriToCorpGrp">
									<tr>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AlphaRowId"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionFromEPFuncCurAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SpotRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DistributionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EPDistributionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="padding-top:0.5mm;">
											<input type="checkbox" class="styCkboxNM" style="">
												<xsl:attribute name="alt">Row <xsl:value-of select="AlphaRowId"/> Qualified Foreign Corporation Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="QualifiedForeignCorporationInd"/>
													<xsl:with-param name="BackupName">SchK2K3FrgnCorpDistriToCorpGrpQualifiedForeignCorporationInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;background-color:lightgrey;">&nbsp;</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part IV Reference ID Number -->
					<xsl:for-each select="$FormData/SchK2K3FrgnCorpDistriToCorpGrp">
						<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part IV - Distributing foreign corporation - Row <xsl:value-of select="AlphaRowId"/></span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
											Reference ID number
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="text-align:left;">
												<span style="font-size:7pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<!-- Part 5 repeating -->
					<xsl:for-each select="$FormData/SchK2K3ShrSect951a1InclsnGrp">
						<xsl:if test="($Print = $Separated) and (count(SchK2K3ShrCFCOwnrInfoGrp) &gt; 11)">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part V - Information on Shareholder's Section 951(a)(1) and Section 951A Inclusions</span><br />
							Separate Category: <strong><xsl:value-of select="SeparateCategoryCd"/></strong><br />
							U.S. Source: <strong><xsl:choose>
								<xsl:when test="USSourceIncomeInd">Yes</xsl:when>
								<xsl:otherwise>No</xsl:otherwise>
							</xsl:choose></strong>
							<table class="styDepTbl" style="font-size:7pt;width:256mm;">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col" style="width:8mm;">&nbsp;</th>
										<th class="styDepTblCell" scope="col" style="width:92mm;font-weight:normal;">
											<strong>(a)</strong> Name of CFC
										</th>
										<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
											<strong>(b)</strong> EIN or reference ID number
										</th>
										<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
											<strong>(c)</strong> Ending of CFC tax year
										</th>
										<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
											<strong>(d)</strong> Shareholder's share of CFC items through their ownership in its corporation ("shareholder's share")
										</th>
										<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
											<strong>(e)</strong> Shareholder's share of subpart F income
										</th>
										<th class="styDepTblCell" scope="col" style="width:29mm;font-weight:normal;">
											<strong>(f)</strong> Shareholder's section 951(a)(1)(B) inclusion
										</th>
										<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
											<strong>(g)</strong> Tested income
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="SchK2K3ShrCFCOwnrInfoGrp">
										<tr style="vertical-align:top;">
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="CFCName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:choose>
													<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Part V, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="ForeignCorporationEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="CFCTaxYearEndDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AggrgtShrCFCItemsPrtshpOwnrRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareSubpartFIncomeAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtSect951a1BInclsnAmt"/>
													<xsl:with-param name="MaxSize" select="17"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							<table class="styDepTbl" style="font-size:7pt;width:256mm;">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col" style="width:8mm;">&nbsp;</th>
										<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(h)</strong> Tested loss
										</th>
										<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(i)</strong> Shareholder's share of tested income
										</th>
										<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(j)</strong> Shareholder's share of tested loss
										</th>
										<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(k)</strong> Shareholder's share of Qualified Business Asset Investment (QBAI)
										</th>
										<th class="styDepTblCell" scope="col" style="width:36mm;font-weight:normal;">
											<strong>(l)</strong> Shareholder's share of the tested loss QBAI amount
										</th>
										<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(m)</strong> Shareholder's share of tested interest income
										</th>
										<th class="styDepTblCell" scope="col" style="width:35mm;font-weight:normal;">
											<strong>(n)</strong> Shareholder's share of tested interest expense
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="SchK2K3ShrCFCOwnrInfoGrp">
										<tr style="vertical-align:top;">
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styTableCellCtrInherit" style="font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="AlphaRowId"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareTestedIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareTestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShareQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateShrTestedLossQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggrgtShareTestedIntExpenseAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
						<xsl:for-each select="SchK2K3ShrCFCOwnrInfoGrp">
							<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
								<br />
								<br />
								<span class="styRepeatingDataTitle">Part VI - CFC Reference IDs - Row <xsl:value-of select="AlphaRowId"/></span><br />
								Separate Category: <strong><xsl:value-of select="../SeparateCategoryCd"/></strong><br />
								U.S. Source: <strong><xsl:choose>
									<xsl:when test="../USSourceIncomeInd">Yes</xsl:when>
									<xsl:otherwise>No</xsl:otherwise>
								</xsl:choose></strong>
								<table class="styDepTbl" style="font-size:7pt">
									<thead class="styTableHead">
										<tr class="styDepTblHdr">
											<th class="styDepTblCell" style="text-align:left">
												Reference ID number
											</th>
										</tr>
									</thead>
									<tbody>
										<xsl:for-each select="ForeignEntityIdentificationGrp">
											<tr>
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
														<xsl:otherwise>styDepTblRow2</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<td class="styDepTblCell" style="text-align:left;">
													<span style="font-size:7pt;">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
														</xsl:call-template>
													</span>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</xsl:if>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:if test="$sep7">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part VI - Information to Complete Form 8621 - Section 1</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:102mm;font-weight:normal;">
										<strong>(a)</strong> Name of PFIC
									</th>
									<th class="styDepTblCell" scope="col" style="width:24mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styDepTblCell" scope="col" style="width:90mm;font-weight:normal;">
										<strong>(c)</strong> Address of PFIC
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(d)</strong> Beginning of PFIC tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong> Ending of PFIC tax year
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/F1120SSchK2K3InfoToComp8621Grp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PFICOrQEFName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part VI, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:choose>
												<xsl:when test="PFICOrQEFForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="PFICOrQEFForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="PFICOrQEFUSAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="TaxYearBeginDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="TaxYearEndDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(f)</strong> Description of each <br /> class of PFIC shares
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(g)</strong> Dates PFIC <br /> shares acquired <br /> during tax year <br /> (if applicable)
									</th>
									<th class="styDepTblCell" scope="col" style="width:41mm;font-weight:normal;">
										<strong>(h)</strong> Shareholder's share <br /> of total number of <br /> PFIC shares held by <br /> corporation at end of <br /> tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-weight:normal;">
										<strong>(i)</strong> Shareholder's share of total value of <br /> PFIC shares held by corporation at end of tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(j)</strong> Election made by corporation <br /> (enter code &mdash; see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(k)</strong> Box is checked if foreign corporation has documented its eligiblity to be treated as a qualifying insurance corporation under section <br /> 1297(f)(2).
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(l)</strong> Box is checked if PFIC has indicated its shares are "marketable stock" within the meaning of section 1296(e).
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;">
										<strong>(m)</strong> Box is checked if PFIC is also a controlled foreign corporation (CFC) within the meaning of section 957.
									</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;font-weight:normal;border-right-width:0px;">
										<strong>(n)</strong> Box is checked if PFIC meets the income test or asset test of section 1297(a) for the tax year.
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/F1120SSchK2K3InfoToComp8621Grp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ClassOfShareCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="SharesAcquiredDuringTYDt"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TotalPFICSharesTaxYearEndCnt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalPFICSharesTaxYearEndAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CorporationElectionCd"/>
											</xsl:call-template>
										</td>
										<xsl:variable name="pos" select="position()"/>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="margin:2px;">
												<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> Qualified Insurance Corporation Election Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="QualifiedInsuranceCorpElectInd"/>
													<xsl:with-param name="BackupName">SepK2QualifiedInsuranceCorpElectInd<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="margin:2px;">
												<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC election to mark Marketable Stock Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ElectionToMarkToMrktPFICStkInd"/>
													<xsl:with-param name="BackupName">SepK2ElectionToMarkToMrktPFICStkInd<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<input type="checkbox" class="styCkboxNM" style="margin:2px;">
												<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC CFC under Section 957 Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="PFICCFCUnderSect957Ind"/>
													<xsl:with-param name="BackupName">SepK2PFICCFCUnderSect957Ind<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM" style="margin:2px;">
												<xsl:attribute name="alt">Row <xsl:value-of select="$pos"/> PFIC Income Asset Test Met Section 1297 A Ind</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="PFICIncmAstTestMetSect1297aInd"/>
													<xsl:with-param name="BackupName">SepK2PFICIncmAstTestMetSect1297aInd<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part VI - Information to Complete Form 8621 - Section 2</span>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:61mm;font-weight:normal;">
										<strong>(a)</strong> Name of PFIC
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong> EIN or reference ID number
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong> Ordinary earnings
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(d)</strong> Net capital gain
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(e)</strong> Fair market value of PFIC shares at beginning of tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(f)</strong> Fair market value of PFIC shares at end of tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(g)</strong> Dates PFIC shares were acquired
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(h)</strong> Amount of cash and fair market value of property distributed by PFIC during the current tax year (if applicable)
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(i)</strong> Dates of distribution
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/F1120SSchK2K3InfoToComp8621Grp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="PFICOrQEFName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PFICOrQEFName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit" style="word-break:break-all;">
											<xsl:choose>
												<xsl:when test="count(ForeignEntityIdentificationGrp) &gt; 1">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Part VII, Row <xsl:value-of select="AlphaRowId"/> - Foreign Entity Identification</xsl:with-param>
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="PFICOrQEFEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OrdinaryEarningsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NetCapitalGainAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FMVOfPFICSharesTYBegngAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FMVOfPFICSharesTYEndAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="SharesAcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PFICCashDistributedPropFMVAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DistributionDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" style="font-size:7pt;width:256mm;">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(j)</strong> Total creditable foreign taxes attributable to distribution by PFIC
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(k)</strong> Total distributions from PFIC in preceding 3 tax years
									</th>
									<th class="styDepTblCell" scope="col" style="width:41mm;font-weight:normal;">
										<strong>(l)</strong> Dates PFIC shares disposed of during tax year (if applicable)
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(m)</strong> Amount realized on disposition of PFIC shares
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;">
										<strong>(n)</strong> Tax basis of PFIC shares on dates of disposition
									</th>
									<th class="styDepTblCell" scope="col" style="width:43mm;font-weight:normal;border-right-width:0px;">
										<strong>(o)</strong> Gain (loss) on disposition of PFIC shares
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/F1120SSchK2K3InfoToComp8621Grp">
									<tr style="vertical-align:top;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotPFICCrdblFrgnTxsDistriAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotPFICDistriPrec3TaxYearsAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DispositionDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PFICSharesDisposRealizedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PFICSharesTaxBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PFICSharesDisposGainLossAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>					
					<!-- Part 6 Reference ID Number -->
					<xsl:for-each select="$FormData/F1120SSchK2K3InfoToComp8621Grp">
						<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part VI - PFIC or QEF - Row <xsl:value-of select="position()"/></span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
											Reference ID number
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="text-align:left;">
												<span style="font-size:7pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<!-- Part 7 Reference ID Number -->
					<xsl:for-each select="$FormData/SchK2K3ShrIntInFrgnCorpIncmGrp">
						<xsl:if test="(count(ForeignEntityIdentificationGrp) &gt; 1)">
							<br />
							<br />
							<span class="styRepeatingDataTitle">Part VII - CFC - Instance <xsl:value-of select="position()"/></span>
							<table class="styDepTbl" style="font-size:7pt">
								<thead class="styTableHead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" style="text-align:left">
											Reference ID number
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
													<xsl:otherwise>styDepTblRow2</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="styDepTblCell" style="text-align:left;">
												<span style="font-size:7pt;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
												</span>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
