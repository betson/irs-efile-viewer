<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040NRStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040NR"/>
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
				<meta name="Description" content="IRS Form 1040NR"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040NRStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form1040NR">
					<xsl:call-template name="DocumentHeader"/>
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:27mm;height:14.5mm;">
							Form <span class="styFN" style="font-size:12pt;">1040NR</span><br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturnInd"/>
								<xsl:with-param name="Desc">Top Left Header - Check this box for a protective return</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
								<xsl:with-param name="Desc">Top Left Header - Primary Date of Death</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
								<xsl:with-param name="Desc">Top Left Header - Special Condition Description</xsl:with-param>
							</xsl:call-template>
							<br />
							<span class="styAgency">Department of the Treasury<br />Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:135mm;height:14.5mm;">
							<span class="styFMT" style="font-size:10pt;">U.S. Nonresident Alien Income Tax Return</span><br />
							<span style="font-weight:bold;">&#9658;Information about Form 1040NR and its separate instructions is at <span style="font-style:italic">www.irs.gov/form1040nr</span>.</span><br />
							For the year January 1&#8211;December 31, 2016, or other tax year <br />
							beginning <span style="width:40mm;"><xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/></span> 
							and ending <span style="width:40mm;"><xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/></span>
						</div>
						<div class="styTYBox" style="width:25mm;height:14.5mm;">
							<div class="styOMB" style="font-size:6pt;">OMB No. 1545-0074</div>
							<span class="styTaxYear">20<span class="styTYColor" style="display:inline;">16</span></span>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:29.7mm;font-weight:normal;border-right:1px solid black;">
							<br /><br /><br />Please print <br />or type
						</div>
						<div style="width:167mm;float:left;">
							<div style="width:73mm;height:6.5mm;float:left;padding-left:3px;border-right:1px solid black;">
								Your first name and initial <br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
									<xsl:with-param name="Desc">Filer Information - Primary Name Control</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
									<xsl:with-param name="Desc">Filer Information - In Care Of name</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:47mm;height:6.5mm;float:left;padding-left:3px;border-right:1px solid black;">
								Last name <br />
								&#8194;
							</div>
							<div style="width:47mm;float:left;padding-left:3px;">
								<strong style="font-size:6pt;">Identifying number (see instructions)</strong><br />
								<xsl:call-template name="PopulateReturnHeaderFilerTIN">
									<xsl:with-param name="EINChanged" select="true()"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Street Address and Individual checkbox -->
						<div style="width:167mm;float:left;border-top:1px solid black;">
							<div style="width:120mm;float:left;padding-left:3px;border-right:1px solid black;height:10mm;">
								<span style="font-family:Arial;">Present home address (number, street, and apt. no., or rural route). If you have a P.O. box, see instructions.</span><br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template><br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:47mm;float:left;padding-left:3px;">
								<span style="width:15mm;height:6mm;float:left;">Check if:</span>
								<span style="float:left;">
								<input type="checkbox" class="sty1040NRCkbox" style="margin-top:1px;" checked="checked">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/IndividualInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="margin-left:3px;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IndividualInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/IndividualInd</xsl:with-param>
									</xsl:call-template>Individual</label>
								<br />
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/EstateOrTrustInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="margin-left:3px;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/EstateOrTrustInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/EstateOrTrustInd</xsl:with-param>
									</xsl:call-template>Estate or Trust</label>
								</span>
							</div>
						</div>
						<!-- US CityStateInfo or Foreign City -->
						<div style="width:167mm;float:left;padding-left:3px;border-top:1px solid black;">
							City, town or post office, state, and ZIP code. If you have a foreign address, also complete spaces below (see instructions).<br />
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/USAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<!-- Foreign address city country, provice, postal -->
						<div style="width:167mm;float:left;border-top:1px solid black;">
							<div style="width:85mm;height:6.5mm;float:left;padding-left:3px;border-right:1px solid black;">
								<span style="">Foreign country name</span><br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									<xsl:with-param name="MainForm" select="true()"/>
								</xsl:call-template>
							</div>
							<div style="width:45mm;height:6.5mm;float:left;padding-left:3px;border-right:1px solid black;">
								Foreign province/state/county <br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:37mm;float:left;padding-left:3px;">
								Foreign postal code <br />
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Filing Status section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:23.7mm;border-right:1px solid black;">
							Filing <br />Status
							<br /><br />
							<span style="display:inline;font-weight:normal;">Check only <br />one box.</span>
						</div>
						<div style="width:167mm;height:16mm;float:left;">
							<div style="width:83mm;float:left;">
								<div class="styLNLeftLtrBox" style="width:7mm;">1</div>
								<div class="styLNDesc" style="width:75mm;font-family:Arial;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/SnglResCanadaMexicoUSNatlInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/SnglResCanadaMexicoUSNatlInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/SnglResCanadaMexicoUSNatlInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/SnglResCanadaMexicoUSNatlInd</xsl:with-param>
										</xsl:call-template>Single resident of Canada or Mexico or single U.S. national
									</label>
								</div><br />
								<div class="styLNLeftLtrBox" style="width:7mm;">2</div>
								<div class="styLNDesc" style="width:75mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OtherSingleNonresidentAlienInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/OtherSingleNonresidentAlienInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/OtherSingleNonresidentAlienInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/OtherSingleNonresidentAlienInd</xsl:with-param>
										</xsl:call-template>Other single nonresident alien
									</label>
								</div><br />
								<div class="styLNLeftLtrBox" style="width:7mm;">3</div>
								<div class="styLNDesc" style="width:75mm;font-family:Arial;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MarResCanadaMexicoUSNatlInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/MarResCanadaMexicoUSNatlInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MarResCanadaMexicoUSNatlInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/MarResCanadaMexicoUSNatlInd</xsl:with-param>
										</xsl:call-template>Married resident of Canada or Mexico or married U.S. national
									</label>
								</div>
							</div>
							<div style="width:83mm;float:left;">
								<div class="styLNLeftLtrBox" style="width:7mm;">4</div>
								<div class="styLNDesc" style="width:75mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MarResSouthKoreaInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/MarResSouthKoreaInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MarResSouthKoreaInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/MarResSouthKoreaInd</xsl:with-param>
										</xsl:call-template>Married resident of South Korea
									</label>
								</div><br />
								<div class="styLNLeftLtrBox" style="width:7mm;">5</div>
								<div class="styLNDesc" style="width:75mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/OtherMarNonresidentAlienInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/OtherMarNonresidentAlienInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/OtherMarNonresidentAlienInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/OtherMarNonresidentAlienInd</xsl:with-param>
										</xsl:call-template>Other married nonresident alien
									</label>
								</div><br />
								<div class="styLNLeftLtrBox" style="width:7mm;">6</div>
								<div class="styLNDesc" style="width:75mm;font-family:Arial;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/QlfyWidowWithDepdChildInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/QlfyWidowWithDepdChildInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="padding-left:1mm;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/QlfyWidowWithDepdChildInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/QlfyWidowWithDepdChildInd</xsl:with-param>
										</xsl:call-template>Qualifying widow(er) with dependent child (see instructions)
									</label>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName"/>
										<xsl:with-param name="Desc">Line 6 - Qualifying Person Name (see additional data)</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:120mm;padding-left:3.5mm;">
								If you checked box 3 or 4 above, enter the information below.
							</div>
						</div>
						<div style="width:167mm;height:7.7mm;float:left;border-top:1px solid black;">
							<div class="styLNDesc" style="width:56mm;height:7.4mm;border-right:1px solid black;padding-left:1mm;">
								<span style="font-weight:bold;">(i) </span> Spouse's first name and initial <br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/SpouseName/PersonFirstNm"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:56mm;height:7.4mm;border-right:1px solid black;padding-left:1mm;">
								<span style="font-weight:bold;">(ii) </span> Spouse's last name <br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/SpouseName/PersonLastNm"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/SpouseNameControlTxt"/>
									<xsl:with-param name="Desc">Line (i)/(ii) - Spouse Name Control</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/SpouseDeathDt"/>
									<xsl:with-param name="Desc">Line (i)/(ii) - Spouse Death Date</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:55mm;height:7.4mm;padding-left:1mm;">
								<span style="font-weight:bold;">(iii) </span> Spouse's identifying number <br />
								<xsl:choose>
									<xsl:when test="$FormData/SpouseInformationGrp/NRALiteralCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/NRALiteralCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$FormData/SpouseInformationGrp/MissingSSNReasonCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/MissingSSNReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$FormData/SpouseInformationGrp/MissingSSNNRALiteralCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/MissingSSNNRALiteralCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/SpouseSSN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>
					<!-- Exemptions section -->
					<div class="styStdDiv" style="border-top:1px solid black;overflow:visible;">
						<div class="sty1040NRIndentSection" style="width:19.8mm;border-right:none;clear:none;">
							Exemptions
							<br /><br /><br /><br />
							<span style="display:inline;font-weight:normal;font-size:7pt;">If more <br />than four <br />dependents, <br />see instructions.</span>
						</div>
						<div style="width:167.2mm;float:left;border-left:1px solid black;">
							<div style="width:127mm;float:left;">
							<!-- Line 7a -->
							<div style="width:127mm;float:left;">
								<div class="styLNLeftNumBoxSD">7a</div>
								<div class="sty1040NRIndentDesc" style="height:auto;min-height:4mm;">
									<input type="checkbox" class="sty1040NRCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExemptPrimaryInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ExemptPrimaryInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-weight:bold;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ExemptPrimaryInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ExemptPrimaryInd</xsl:with-param>
										</xsl:call-template>Yourself.
									</label>
									If someone can claim you as a dependent, <strong>do not</strong> check box 7a
									<span class="sty1040NRDotLn">....</span>
								</div>
							</div>
							<!-- Line 7b -->
							<div style="width:127mm;float:left;">
								<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</div>
								<div class="sty1040NRIndentDesc" style="height:auto;min-height:4mm;">
									<input type="checkbox" class="sty1040NRCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ExemptSpouseInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-weight:bold;">
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ExemptSpouseInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ExemptSpouseInd</xsl:with-param>
										</xsl:call-template>Spouse.
									</label>
									Check box 7b only if you checked box 3 or 4 above <strong>and</strong> your spouse <strong>did not</strong><br />
									<span style="width:15px;"/>have any U.S. gross income<span class="sty1040NRDotLn">...................</span>
									<span style="float:right;">
										<xsl:call-template name="SetDynamicTableToggleButton">
											<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
											<xsl:with-param name="containerHeight" select="4"/>
											<xsl:with-param name="headerHeight" select="1"/>
											<xsl:with-param name="containerID" select=" 'dpntContainerId' "/>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<!-- Table 7c -->
							<div class="sty1040NRTableContainerD" style="" id="dpntContainerId">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="display:table;font-size:6pt;border-collapse:collapse;">
									<thead class="styTableThead">
										<tr>
											<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;">
												<div style="font-weight:bold;font-size:7pt;padding-left:4.5mm;">c </div>
												<strong> Dependents: </strong> (see instructions)<br /><br />
												<strong>(1)</strong> First name <span style="width:10mm;"/> Last Name
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(2)</strong> Dependent's <br />identifying number
											</th>
											<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
												<strong>(3)</strong> Dependent's <br />relationship to you
											</th>
											<th class="styTableCellHeader" scope="col" style="width:24mm;font-weight:normal;">
												<strong>(4)</strong> &#10004; if qualifying <br />child for child tax <br />credit (see instr.)
											</th>
										</tr>
									</thead>
									<tbody>
										<xsl:if test="not(($Print = $Separated) and (count($FormData/DependentDetail) &gt; 4))">
											<xsl:for-each select="$FormData/DependentDetail">
												<tr>
													<td class="sty1040NRTableCellText">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DependentFirstNm"/>
														</xsl:call-template>
														<span style="width:4mm;"/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DependentLastNm"/>
														</xsl:call-template>
														<span style="float:right;">
															<xsl:call-template name="LinkToLeftoverDataTableInline">
																<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
																<xsl:with-param name="Desc">Line 7c(1) - Dependent <xsl:value-of select="position()"/> Name Control</xsl:with-param>
															</xsl:call-template>
														</span>
													</td>
													<td class="sty1040NRTableCellCenter">
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
													<td class="sty1040NRTableCellText">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
														</xsl:call-template>
													</td>
													<td class="sty1040NRTableCellCenter">
														<input type="checkbox" class="sty1040NRCkbox" style="margin:0px;">
															<xsl:call-template name="PopulateCheckbox">
																<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																<xsl:with-param name="BackupName">IRS1040NR/Dependent<xsl:value-of select="position()"/>/ChildCreditInd</xsl:with-param>
															</xsl:call-template>
														</input>
														<label style="font-size:0pt;">
															<xsl:call-template name="PopulateLabel">
																<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
																<xsl:with-param name="BackupName">IRS1040NR/Dependent<xsl:value-of select="position()"/>/ChildCreditInd</xsl:with-param>
															</xsl:call-template>Eligible for child tax credit</label>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="(count($FormData/DependentDetail) &lt; 1) or (($Print = $Separated) and (count($FormData/DependentDetail) &gt; 4))">
											<tr>
												<td class="sty1040NRTableCellText">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
													</xsl:call-template>
												</td>
												<td class="sty1040NRTableCellCenter">
													&#8194;
												</td>
												<td class="sty1040NRTableCellText">
													&#8194;
												</td>
												<td class="sty1040NRTableCellCenter">
													<div style="border:1px solid black;width:10px;height:10px;">&#8194;</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="(count($FormData/DependentDetail) &lt; 2) or (($Print = $Separated) and (count($FormData/DependentDetail) &gt; 4))">
											<tr>
												<td class="sty1040NRTableCellText">
													&#8194;
												</td>
												<td class="sty1040NRTableCellCenter">
													&#8194;
												</td>
												<td class="sty1040NRTableCellText">
													&#8194;
												</td>
												<td class="sty1040NRTableCellCenter">
													<div style="border:1px solid black;width:10px;height:10px;">&#8194;</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="(count($FormData/DependentDetail) &lt; 3) or (($Print = $Separated) and (count($FormData/DependentDetail) &gt; 4))">
											<tr>
												<td class="sty1040NRTableCellText">
													&#8194;
												</td>
												<td class="sty1040NRTableCellCenter">
													&#8194;
												</td>
												<td class="sty1040NRTableCellText">
													&#8194;
												</td>
												<td class="sty1040NRTableCellCenter">
													<div style="border:1px solid black;width:10px;height:10px;">&#8194;</div>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="(count($FormData/DependentDetail) &lt; 4) or (($Print = $Separated) and (count($FormData/DependentDetail) &gt; 4))">
											<tr>
												<td class="sty1040NRTableCellText">
													&#8194;
												</td>
												<td class="sty1040NRTableCellCenter">
													&#8194;
												</td>
												<td class="sty1040NRTableCellText">
													&#8194;
												</td>
												<td class="sty1040NRTableCellCenter">
													<div style="border:1px solid black;width:10px;height:10px;">&#8194;</div>
												</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$FormData/DependentDetail"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'dpntContainerId' "/>
							</xsl:call-template>
							</div>
							<!-- Exemptions counts -->
							<div style="width:39.8mm;float:right;">
								<div style="width:2.5mm;height:33mm;float:left;"><img alt="Curled bracket" src="{$ImagePath}/720_Bracket_Sm.gif"></img></div>
								<div style="width:27mm;font-weight:bold;float:left;margin-top:2mm;">
									Boxes checked <br />on 7a and 7b
								</div>
								<div style="width:10mm;border-bottom:1px solid black;text-align:center;float:left;margin-top:2mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalExemptPrimaryAndSpouseCnt"/>
									</xsl:call-template>
								</div>
								<div style="width:27mm;font-weight:bold;float:left;">
									No. of children <br />on 7c who: <br /> &#8226; lived with you
								</div>
								<div style="width:9.6mm;border-bottom:1px solid black;text-align:center;float:left;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ChldWhoLivedWithYouCnt"/>
									</xsl:call-template>
								</div>
								<div style="width:27mm;font-weight:bold;float:left;">
									<span style="float:left;margin-right:2px;">&#8226;</span> <span style="font-size:6pt;float:left;">did not live with <br />you due to divorce <br />or separation (see <br />instructions)</span>
								</div>
								<div style="width:9.6mm;border-bottom:1px solid black;text-align:center;float:left;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ChldNotLivingWithYouCnt"/>
									</xsl:call-template>
								</div>
								<div style="width:27mm;font-weight:bold;float:left;">
									Dependents on 7c <br /> not entered above
								</div>
								<div style="width:9.6mm;border-bottom:1px solid black;text-align:center;float:left;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OtherDependentsListedCnt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 7d -->
							<div style="width:166.8mm;float:left;">
								<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;margin-top:2mm;">d</div>
								<div class="sty1040NRIndentDesc" style="height:auto;min-height:4mm;margin-top:2mm;">
									Total number of exemptions claimed <span class="sty1040NRDotLn">.................</span>
								</div>
								<div style="width:2.5mm;float:left;">&#8194;</div>
								<div style="width:27mm;float:left;font-weight:bold;">
									Add numbers on <br /> lines above &#9658;
								</div>
								<div style="float:left;width:10mm;min-height:6mm;border:2px solid black;text-align:center;padding-top:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalExemptionsCnt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- Income Effectively Connected With U.S. Trade/Business section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:76mm;border-right:1px solid black;">
							Income <br />Effectively <br />Connected <br /> With U.S. <br /> Trade/ <br />Business
							<br /><br /><br /><br />
							<span style="display:inline;font-size:6pt;">Attach Form(s) <br />W-2, 1042-S, <br />SSA-1042S, <br />RRB-1042S,
							<br />and 8288-A <br />here. Also <br />attach Form(s) <br />1099-R if tax <br />was withheld.</span>
						</div>
						<!-- Line 8 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="sty1040NRIndentDesc">
								Wages, salaries, tips, etc. Attach Form(s) W-2 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotShownGrp"/>
									<xsl:with-param name="Desc">Line 8 - Wages Not Shown group (see additional data)</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRDotLn">.............</span>
							</div>
							<div class="styLNRightNumBox">8</div>
							<div class="styLNAmountBox">
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
						<!-- Line 9a -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD">9a</div>
							<div class="sty1040NRIndentDesc">
								<strong>Taxable </strong> interest <span class="sty1040NRDotLn">........................</span>
							</div>
							<div class="styLNRightNumBox">9a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9b -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
							<div class="sty1040NRIndent2Desc">
								<strong>Tax-exempt </strong> interest. <strong>Do not </strong> include on line 9a <span class="sty1040NRDotLn">....</span>
							</div>
							<div class="styLNRightNumBox">9b</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 10a -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">10a</div>
							<div class="sty1040NRIndentDesc">
								Ordinary dividends
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
									<xsl:with-param name="Desc">Line 10a - Ordinary F8814 code</xsl:with-param>
								</xsl:call-template> 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
									<xsl:with-param name="Desc">Line 10a - Ordinary F8814 amount</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRDotLn">.....................</span>
							</div>
							<div class="styLNRightNumBox">10a</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OrdinaryDividendsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10b -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
							<div class="sty1040NRIndent2Desc">
								Qualified dividends (see instructions)
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
									<xsl:with-param name="Desc">Line 10a - Qualified F8814 code</xsl:with-param>
								</xsl:call-template> 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
									<xsl:with-param name="Desc">Line 10a - Qualified F8814 amount</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRDotLn">......</span>
							</div>
							<div class="styLNRightNumBox">10b</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 11 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">11</div>
							<div class="sty1040NRIndentDesc">
								Taxable refunds, credits, or offsets of state and local income taxes (see instructions) <span class="sty1040NRDotLn">..</span>
							</div>
							<div class="styLNRightNumBox">11</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StateLocalIncomeTaxRefundAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 12 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">12</div>
							<div class="sty1040NRIndentDesc" style="font-family:Arial;font-size:larger;">
								Scholarship and fellowship grants. Attach Form(s) 1042-S or required statement (see instructions)
							</div>
							<div class="styLNRightNumBox">12</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/GrantsOrScholarshipsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GrantsOrScholarshipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">13</div>
							<div class="sty1040NRIndentDesc">
								Business income or (loss). Attach Schedule C or C-EZ (Form 1040) <span class="sty1040NRDotLn">........</span>
							</div>
							<div class="styLNRightNumBox">13</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">14</div>
							<div class="sty1040NRIndentDesc" style="font-family:Arial;font-size:larger;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/CapitalDistributionInd</xsl:with-param>
									</xsl:call-template>Capital gain or (loss). Attach Schedule D (Form 1040) if required. If not required, check here</label>
								<input type="checkbox" class="styCkboxNM" style="margin-top:-1px;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CapitalDistributionInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/CapitalDistributionInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
								</xsl:call-template>
								<!-- Notes: Display Form8814Cd/Amt in RRD at the bottom of page 2(???) nah -->
							</div>
							<div class="styLNRightNumBox">14</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Cd"/>
										<xsl:with-param name="Desc">Line 14 - Form 8814 code</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
										<xsl:with-param name="Desc">Line 14 - Form 8814 amount</xsl:with-param>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">15</div>
							<div class="sty1040NRIndentDesc">
								Other gains or (losses). Attach Form 4797
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt/@form4684Cd"/>
									<xsl:with-param name="Desc">Line 15 - Form 4684 Code</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRDotLn">...............</span>
							</div>
							<div class="styLNRightNumBox">15</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 16 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">16a</div>
							<div class="sty1040NRIndentDesc" style="width:34mm;">
								IRA distributions <span class="sty1040NRDotLn">..</span>
							</div>
							<div class="styLNRightNumBox">16a</div>
							<div class="styLNAmountBox" style="border-right:1px solid black;padding-right:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBox">16b</div>
							<div class="sty1040NRIndentDesc" style="width:37mm;font-family:Arial Narrow;font-size:larger;">
								Taxable amount (see instructions)
							</div>
							<div class="styLNRightNumBox">16b</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRADistributionsGrp"/>
										<xsl:with-param name="Desc">Line 16 - IRA Distributions Groups (see additional data)</xsl:with-param>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIRAAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">17a</div>
							<div class="sty1040NRIndentDesc" style="width:34mm;">
								Pensions and annuities
							</div>
							<div class="styLNRightNumBox">17a</div>
							<div class="styLNAmountBox" style="border-right:1px solid black;padding-right:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNLeftNumBox">17b</div>
							<div class="sty1040NRIndentDesc" style="width:37mm;font-family:Arial Narrow;font-size:larger;">
								Taxable amount (see instructions)
							</div>
							<div class="styLNRightNumBox">17b</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/PensionsAnnuitiesGrp"/>
										<xsl:with-param name="Desc">Line 16b - Pensions Annuities Grp (see additional data)</xsl:with-param>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxablePensionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 18 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">18</div>
							<div class="sty1040NRIndentDesc">
								Rental real estate, royalties, partnerships, trusts, etc. Attach Schedule E (Form 1040) <span class="sty1040NRDotLn">..</span>
							</div>
							<div class="styLNRightNumBox">18</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 19 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">19</div>
							<div class="sty1040NRIndentDesc">
								Farm income or (loss). Attach Schedule F (Form 1040) <span class="sty1040NRDotLn">............</span>
							</div>
							<div class="styLNRightNumBox">19</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">20</div>
							<div class="sty1040NRIndentDesc">
								Unemployment compensation
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
									<xsl:with-param name="Desc">Line 20 - Repayment Code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
									<xsl:with-param name="Desc">Line 20 - Repayment Amount</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRDotLn">..................</span>
							</div>
							<div class="styLNRightNumBox">20</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">21</div>
							<div class="sty1040NRIndentDesc">
								Other income. List type and amount (see instructions) 
								<span style="border-bottom:1px dashed black;width:48mm;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeTypeGrp"/>
										<xsl:with-param name="Desc">Line 21 - Other Income group (see additional data)</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
										<xsl:with-param name="Desc">Line 21 - Protective Section 108(i) ELC Record indicator</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox">21</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 22 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">22</div>
							<div class="sty1040NRIndent2Desc" style="font-family:Arial Narrow;font-size:larger;">
								Total income exempt by a treaty from page 5, Schedule OI, Item L (1)(e)
							</div>
							<div class="styLNRightNumBox">22</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TreatyTaxExemptUSIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 23 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">23</div>
							<div class="sty1040NRIndentDesc" style="min-height:7mm;height:auto;">
								Combine the amounts in the far right column for lines 8 through 21. This is your <strong>total </strong><br />
								<strong>effectively connected income</strong> <span class="sty1040NRDotLn">.................<span style="letter-spacing:6px;">&#9658;</span></span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="border-bottom:none;">23</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalECIAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Adjusted Gross Income -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:52mm;border-right:1px solid black;">
							Adjusted <br />Gross <br />Income
						</div>
						<!-- Line 24 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">24</div>
							<div class="sty1040NRIndent2Desc">
								Educator expenses (see instructions) <span class="sty1040NRDotLn">.......</span>
							</div>
							<div class="styLNRightNumBox">24</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 25 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">25</div>
							<div class="sty1040NRIndent2Desc">
								Health savings account deduction. Attach Form 8889 <span class="sty1040NRDotLn">...</span>
							</div>
							<div class="styLNRightNumBox">25</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 26 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">26</div>
							<div class="sty1040NRIndent2Desc">
								Moving expenses. Attach Form 3903 <span class="sty1040NRDotLn">.......</span>
							</div>
							<div class="styLNRightNumBox">26</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 27 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">27</div>
							<div class="sty1040NRIndent2Desc" style="font-family:Arial Narrow;font-size:larger;">
								Deductible part of self-employment tax. Attach Schedule SE (Form 1040) <span class="sty1040NRDotLn">.</span>
							</div>
							<div class="styLNRightNumBox">27</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 28 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">28</div>
							<div class="sty1040NRIndent2Desc">
								Self-employed SEP, SIMPLE, and qualified plans <span class="sty1040NRDotLn">....</span>
							</div>
							<div class="styLNRightNumBox">28</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldSepSimpleQlfyPlansAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 29 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">29</div>
							<div class="sty1040NRIndent2Desc">
								Self-employed health insurance deduction (see instructions)
							</div>
							<div class="styLNRightNumBox">29</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldHealthInsDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 30 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">30</div>
							<div class="sty1040NRIndent2Desc">
								Penalty on early withdrawal of savings <span class="sty1040NRDotLn">.......</span>
							</div>
							<div class="styLNRightNumBox">30</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PnltyOnErlyWthdrwOfSavingsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 31-->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">31</div>
							<div class="sty1040NRIndent2Desc">
								Scholarship and fellowship grants excluded <span class="sty1040NRDotLn">......</span>
							</div>
							<div class="styLNRightNumBox">31</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GrantsOrScholarshipsExcldAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 32 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">32</div>
							<div class="sty1040NRIndent2Desc">
								IRA deduction (see instructions) <span class="sty1040NRDotLn">.........</span>
							</div>
							<div class="styLNRightNumBox">32</div>
							<div class="styLNAmountBox">
								<span style="float:left;padding-left:2px;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRADeductionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 33 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">33</div>
							<div class="sty1040NRIndent2Desc">
								Student loan interest deduction (see instructions) <span class="sty1040NRDotLn">....</span>
							</div>
							<div class="styLNRightNumBox">33</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StudentLoanInterestDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 34 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">34</div>
							<div class="sty1040NRIndent2Desc">
								Domestic production activities deduction. Attach Form 8903
							</div>
							<div class="styLNRightNumBox">34</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DomesticProductionActDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 35 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">35</div>
							<div class="sty1040NRIndentDesc">
								Add lines 24 through 34
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsGrp"/>
									<xsl:with-param name="Desc">Line 35 - Other Adjustments group (see additional data)</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
									<xsl:with-param name="Desc">Line 35 - Other Adjustments Total Amount (sum of all groups)</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRDotLn">....................</span>
							</div>
							<div class="styLNRightNumBox">35</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TotalECIAdjustmentsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalECIAdjustmentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 36 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">36</div>
							<div class="sty1040NRIndentDesc">
								Subtract line 35 from line 23. This is your <strong>adjusted gross income</strong>
								<span class="sty1040NRDotLn" style="text-align:right;">.......<span style="letter-spacing:6px;">&#9658;</span></span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">36</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<strong>For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see instructions.</strong>
						<span style="float:right;">
							Cat. No. 11364D
							<span style="width:10mm;"/>
							Form <span style="font-size:larger;font-weight:bold;">1040NR</span> (2016)
						</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv">
						Form 1040NR (2016)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Tax and Credits section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:67.8mm;border-right:1px solid black;">
							Tax and <br />Credits
						</div>
						<!-- Line 37 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">37</div>
							<div class="sty1040NRIndentDesc">
								Amount from line 36 (adjusted gross income) <span class="sty1040NRDotLn">...............</span>
							</div>
							<div class="styLNRightNumBox">37</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 38 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">38</div>
							<div class="sty1040NRIndentDesc">
								<strong>Itemized deductions </strong> from page 3, Schedule A, line 15
								<span class="sty1040NRDotLn">...........</span>
							</div>
							<div class="styLNRightNumBox">38</div>
							<div class="styLNAmountBox">
								<xsl:choose>
									<xsl:when test="$FormData/IndiaStandardDedTaxTreatyGrp">
										<span style="float:left;">
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="TargetNode" select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyCd"/>
												<xsl:with-param name="Desc">Line 38 - India standard deduction tax treaty code</xsl:with-param>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedDeductionsAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<!-- Line 39 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">39</div>
							<div class="sty1040NRIndentDesc">
								Subtract line 38 from line 37 <span class="sty1040NRDotLn">....................</span>
							</div>
							<div class="styLNRightNumBox">39</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AGILessDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 40 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">40</div>
							<div class="sty1040NRIndentDesc">
								Exemptions (see instructions) <span class="sty1040NRDotLn">....................</span>
							</div>
							<div class="styLNRightNumBox">40</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExemptionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 41 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">41</div>
							<div class="sty1040NRIndentDesc">
								<strong>Taxable income. </strong> Subtract line 40 from line 39. If line 40 is more than line 39, enter -0-
								 <span class="sty1040NRDotLn">.</span>
							</div>
							<div class="styLNRightNumBox">41</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
										<xsl:with-param name="Desc">Line 41 - IRS Schedule Q code</xsl:with-param>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 42 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">42</div>
							<div class="sty1040NRIndentDesc">
								<strong>Tax </strong> (see instructions). 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
								</xsl:call-template>
								Check if any tax is from: 
								<div style="width:2mm;font-weight:bold;padding-left:0.0mm;">a</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8814Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8814Ind</xsl:with-param>
									</xsl:call-template>Form(s) 8814</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
									<xsl:with-param name="Desc">Line 42a - Child Interest and Dividend Tax Amount</xsl:with-param>
								</xsl:call-template>
								<xsl:if test="not($FormData/Form8814Ind/@*)"><span style="width:3mm;"/></xsl:if>
								<div style="width:2mm;font-weight:bold;padding-left:0mm;">b</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form4972Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form4972Ind</xsl:with-param>
									</xsl:call-template>Form 4972</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form4972Ind"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox">42</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/CanadaIncomeTaxTreatyArtXXVCd"/>
										<xsl:with-param name="Desc">Line 42 - Income from Canada under tax treaty article XXV code</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CanadaIncomeTaxTreatyArtXXVCd"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 43 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">43</div>
							<div class="sty1040NRIndentDesc">
								<strong>Alternative minimum tax </strong> (see instructions). Attach Form 6251  <span class="sty1040NRDotLn">.........</span>
							</div>
							<div class="styLNRightNumBox">43</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 44 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">44</div>
							<div class="sty1040NRIndentDesc">
								Excess advance premium tax credit repayment. Attach Form 8962  <span class="sty1040NRDotLn">........</span>
							</div>
							<div class="styLNRightNumBox">44</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PremiumTaxCreditTaxLiabAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 45 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">45</div>
							<div class="sty1040NRIndentDesc">
								Add lines 42, 43, and 44  <span class="sty1040NRDotLn">....................<span style="letter-spacing:6px;">&#9658;</span></span>
							</div>
							<div class="styLNRightNumBox">45</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeCrAndOthTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 46 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">46</div>
							<div class="sty1040NRIndent2Desc">
								Foreign tax credit. Attach Form 1116 if required  <span class="sty1040NRDotLn">....</span>
							</div>
							<div class="styLNRightNumBox">46</div>
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
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 47 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">47</div>
							<div class="sty1040NRIndent2Desc" style="font-family:Arial;font-size:larger;">
								Credit for child and dependent care expenses. Attach Form 2441
							</div>
							<div class="styLNRightNumBox">47</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CreditForChildAndDepdCareAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CreditForChildAndDepdCareAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 48 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">48</div>
							<div class="sty1040NRIndent2Desc">
								Retirement savings contributions credit. Attach Form 8880 <span class="sty1040NRDotLn">.</span>
							</div>
							<div class="styLNRightNumBox">48</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RtrSavingsContributionsCrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 49 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">49</div>
							<div class="sty1040NRIndent2Desc">
								Child tax credit. Attach Schedule 8812, if required <span class="sty1040NRDotLn">...</span>
							</div>
							<div class="styLNRightNumBox">49</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ChildTaxCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ChildTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 50 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">50</div>
							<div class="sty1040NRIndent2Desc">
								Residential energy credits. Attach Form 5695 <span class="sty1040NRDotLn">.....</span>
							</div>
							<div class="styLNRightNumBox">50</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ResidentialEnergyCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 51 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">51</div>
							<div class="sty1040NRIndent2Desc">
								Other credits from Form:
								<div style="width:2mm;font-weight:bold;padding-left:0mm;">a</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form3800Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form3800Ind</xsl:with-param>
									</xsl:call-template>3800</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form3800Ind"/>
								</xsl:call-template>
								<div style="width:3mm;font-weight:bold;padding-left:1mm;">b</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8801Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8801Ind</xsl:with-param>
									</xsl:call-template>8801</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8801Ind"/>
								</xsl:call-template>
								<div style="width:3mm;font-weight:bold;padding-left:1mm;">c</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/SpecificOtherCreditsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-size:0pt;"><xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/SpecificOtherCreditsInd</xsl:with-param>
									</xsl:call-template>Specific Other Credits</label>
								<span style="border-bottom:1px solid black;width:6mm;">
									<xsl:call-template name="SetFormLinkInline"><xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd"/></xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox">51</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherCreditsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;text-align:left;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
									<xsl:with-param name="Desc">Line 51c - Other Credit Form 8396 code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
									<xsl:with-param name="Desc">Line 51c - Other Credit Form 8834 code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
									<xsl:with-param name="Desc">Line 51c - Other Credit Form 8839 code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
									<xsl:with-param name="Desc">Line 51c - Other Credit Form 8859 code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
									<xsl:with-param name="Desc">Line 51c - Other Credit Form 8910 code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
									<xsl:with-param name="Desc">Line 51c - Other Credit Form 8911 code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
									<xsl:with-param name="Desc">Line 51c - Other Credit Form 8912 code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
									<xsl:with-param name="Desc">Line 51c - Other Credit Form 8936 code</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 52 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">52</div>
							<div class="sty1040NRIndentDesc">
								Add lines 46 through 51. These are your <strong>total credits</strong>
								<span class="sty1040NRDotLn">............</span>
							</div>
							<div class="styLNRightNumBox">52</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 53 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">53</div>
							<div class="sty1040NRIndentDesc">
								Subtract line 52 from line 45. If line 52 is more than line 45, enter -0- <span class="sty1040NRDotLn">......<span style="letter-spacing:6px;">&#9658;</span></span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">53</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxLessCreditsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Other Taxes section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:36mm;border-right:1px solid black;">
							Other <br />Taxes
						</div>
						<!-- Line 54 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">54</div>
							<div class="sty1040NRIndentDesc" style="font-family:Arial;">
								Tax on income not effectively connected with a U.S. trade or business from page 4, Schedule NEC, line 15
							</div>
							<div class="styLNRightNumBox">54</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeNotUSBusinessTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 55 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">55</div>
							<div class="sty1040NRIndentDesc">
								Self-employment tax. Attach Schedule SE (Form 1040)
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
									<xsl:with-param name="Desc">Line 55 - Exempt SE Tax Literal code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/RailroadRetirementCd"/>
									<xsl:with-param name="Desc">Line 55 - Railroad Retirement code</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRDotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">55</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 56-->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">56</div>
							<div class="sty1040NRIndentDesc">
								Unreported social security and Medicare tax from Form: 
								<div style="width:6mm;font-weight:bold;padding-left:4mm;">a</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form4137Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form4137Ind</xsl:with-param>
									</xsl:call-template>4137</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form4137Ind"/>
								</xsl:call-template>
								<div style="width:10mm;font-weight:bold;padding-left:8mm;">b</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8919Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8919Ind</xsl:with-param>
									</xsl:call-template>8919</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8919Ind"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox">56</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/UnrprtdSocSecAndMedcrTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 57 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">57</div>
							<div class="sty1040NRIndentDesc">
								Additional tax on IRAs, other qualified retirement plans, etc. Attach Form 5329 if required
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
									<xsl:with-param name="Desc">Line 57 - Retirement Tax Plan Literal code</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox">57</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 58 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">58</div>
							<div class="sty1040NRIndentDesc">
								Transportation tax (see instructions) <span class="sty1040NRDotLn">.................</span>
							</div>
							<div class="styLNRightNumBox">58</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TotalUSSourceGrossTransIncmAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalUSSourceGrossTransIncmAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 59a -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">59a</div>
							<div class="sty1040NRIndentDesc">
								Household employment taxes from Schedule H (Form 1040) <span class="sty1040NRDotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">59a</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/HouseholdEmploymentTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 59b -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm;">b</div>
							<div class="sty1040NRIndentDesc">
								First-time homebuyer credit repayment. Attach Form 5405 if required <span class="sty1040NRDotLn">.......</span>
							</div>
							<div class="styLNRightNumBox">59b</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FirstTimeHmByrRepaymentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 60-->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">60</div>
							<div class="sty1040NRIndentDesc">
								Taxes from: 
								<div style="width:3mm;font-weight:bold;padding-left:1mm;">a</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8959Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8959Ind</xsl:with-param>
									</xsl:call-template>Form 8959</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8959Ind"/>
								</xsl:call-template>
								<div style="width:4mm;font-weight:bold;padding-left:2mm;">b</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxCdInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/OtherTaxCdInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxCdInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/OtherTaxCdInd</xsl:with-param>
									</xsl:call-template>Instructions; </label> enter code(s)
								<span style="border-bottom:1px dashed black;width:35mm;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherTaxGrp"/>
										<xsl:with-param name="Desc">Line 60b - Other Tax Group (see additional data)</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox">60</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 61 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">61</div>
							<div class="sty1040NRIndentDesc">
								Add lines 53 through 60. This is your <strong>total tax</strong>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp/TotalTaxDeferredAmt"/>
									<xsl:with-param name="Desc">Line 61 - Form 8854 Total Tax Deferred amount</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp/ExpatriationCd"/>
									<xsl:with-param name="Desc">Line 61 - Form 8854 Expatriation code</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRDotLn">............<span style="letter-spacing:6px;">&#9658;</span></span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">61</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Payments section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:56mm;border-right:1px solid black;">
							Payments
						</div>
						<!-- Line 62 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">62</div>
							<div class="sty1040NRIndent2Desc">
								Federal income tax withheld from:
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 62a -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm;">a</div>
							<div class="sty1040NRIndent2Desc">
								Form(s) W-2 and 1099 
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherWithholdingGrp"/>
									<xsl:with-param name="Desc">Line 62a - Other Withholding Group (see additional data)</xsl:with-param>
								</xsl:call-template>
								<span class="sty1040NRDotLn">...........</span>
							</div>
							<div class="styLNRightNumBox">62a</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/WthldTxFromW2And1099Amt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WthldTxFromW2And1099Amt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;text-align:left;"></div>
						</div>
						<!-- Line 62b -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm;">b</div>
							<div class="sty1040NRIndent2Desc">
								Form(s) 8805 <span class="sty1040NRDotLn">...............</span>
							</div>
							<div class="styLNRightNumBox">62b</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/WithholdingTxFrom8805Amt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingTxFrom8805Amt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 62c -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm;">c</div>
							<div class="sty1040NRIndent2Desc">
								Form(s) 8288-A <span class="sty1040NRDotLn">..............</span>
							</div>
							<div class="styLNRightNumBox">62c</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/WithholdingTxFrom8288AAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingTxFrom8288AAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 62d -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm;">d</div>
							<div class="sty1040NRIndent2Desc">
								Form(s) 1042-S <span class="sty1040NRDotLn">..............</span>
							</div>
							<div class="styLNRightNumBox">62d</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/WithholdingTxFrom1042SAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/WithholdingTxFrom1042SAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 63 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">63</div>
							<div class="sty1040NRIndent2Desc" style="font-family:Arial;padding-top:3px;">
								2016 estimated tax payments and amount applied from 2015 return
							</div>
							<div class="styLNRightNumBox">63</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;text-align:left;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
									<xsl:with-param name="Desc">Line 63 - Divorced Spouse SSN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
									<xsl:with-param name="Desc">Line 63 - Divorced Literal code</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 64 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">64</div>
							<div class="sty1040NRIndent2Desc">
								Additional child tax credit. Attach Schedule 8812 <span class="sty1040NRDotLn">....</span>
							</div>
							<div class="styLNRightNumBox">64</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdditionalChildTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 65 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">65</div>
							<div class="sty1040NRIndent2Desc">
								Net premium tax credit. Attach Form 8962 <span class="sty1040NRDotLn">......</span>
							</div>
							<div class="styLNRightNumBox">65</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ReconciledPremiumTaxCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ReconciledPremiumTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 66 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">66</div>
							<div class="sty1040NRIndent2Desc" style="font-family:Arial;font-size:larger;padding-top:3px;">
								Amount paid with request for extension to file (see instructions)
							</div>
							<div class="styLNRightNumBox">66</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RequestForExtensionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 67 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">67</div>
							<div class="sty1040NRIndent2Desc" style="font-family:Arial;padding-top:3px;">
								Excess social security and tier 1 RRTA tax withheld (see instructions)
							</div>
							<div class="styLNRightNumBox">67</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExcessSocSecAndTier1RRTATaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 68 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">68</div>
							<div class="sty1040NRIndent2Desc">
								Credit for federal tax paid on fuels. Attach Form 4136 <span class="sty1040NRDotLn">..</span>
							</div>
							<div class="styLNRightNumBox">68</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 69 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">69</div>
							<div class="sty1040NRIndent2Desc" style="font-family:Arial;">
								Credits from Form:
								<div style="width:2mm;font-weight:bold;padding-left:1px;">a</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form2439Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form2439Ind</xsl:with-param>
									</xsl:call-template>2439</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form2439Ind"/>
								</xsl:call-template>
								<div style="width:2mm;font-weight:bold;padding-left:1mm;">b</div>
								<div class="sty1040NRCkbox" style="border:1px solid black;background-color:lightgrey;margin:-4px 0px 2px 0px;"></div>
								<span style="font-family:Arial Narrow;">Reserved</span>
								<div style="width:2.5mm;font-weight:bold;padding-left:1mm;">c</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8885Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8885Ind</xsl:with-param>
									</xsl:call-template>8885</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/Form8885Ind"/>
								</xsl:call-template>
								<div style="width:3.5mm;font-weight:bold;padding-left:2mm;">d</div>
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/OtherPaymentsInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-size:0pt;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/OtherPaymentsInd</xsl:with-param>
									</xsl:call-template>Other Payments</label>
								<span style="border-bottom:1px solid black;width:4mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsInd"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox">69</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherPaymentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;text-align:left;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/CreditForRepaymentCd"/>
									<xsl:with-param name="Desc">Line 69d - Credit for repayment code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/CreditForRepaymentAmt"/>
									<xsl:with-param name="Desc">Line 69d - Credit for repayment amount</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxPaymentCd"/>
									<xsl:with-param name="Desc">Line 69d - Other tax payment code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherTaxPaymentAmt"/>
									<xsl:with-param name="Desc">Line 69d - Other tax payment amount</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 70 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">70</div>
							<div class="sty1040NRIndent2Desc">
								Credit for amount paid with Form 1040-C <span class="sty1040NRDotLn">......</span>
							</div>
							<div class="styLNRightNumBox">70</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PaidWithForm1040CAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 71 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">71</div>
							<div class="sty1040NRIndentDesc">
								Add lines 62a through 70. These are your <strong>total payments</strong> <span class="sty1040NRDotLn">.........<span style="letter-spacing:6px;">&#9658;</span></span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">71</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Refund section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:28mm;border-right:1px solid black;">
							Refund <br />
							<span style="display:inline;font-weight:normal;font-size:7pt;">Direct deposit? <br />See<br />instructions.</span>
						</div>
						<!-- Line 72 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">72</div>
							<div class="sty1040NRIndentDesc">
								If line 71 is more than line 61, subtract line 61 from line 71. This is the amount you <strong>overpaid</strong>
							</div>
							<div class="styLNRightNumBox">72</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaidAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 73a -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">73a</div>
							<div class="sty1040NRIndentDesc">
								Amount of line 72 you want <strong>refunded to you. </strong> 
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8888Ind</xsl:with-param>
									</xsl:call-template>If Form 8888 is attached, check here</label> 
								<span style="width:4mm;text-align:center;font-weight:bold;"> . </span> &#9658;
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
										<xsl:with-param name="BackupName">IRS1040NR/Form8888Ind</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<div class="styLNRightNumBox">73a</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/Form8888Ind"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RefundAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 73b-c -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm;">b</div>
							<div class="sty1040NRIndentDesc" style="padding-top:0px;">
								Routing number 
								<span style="border:1px solid black;height:3.5mm;width:50mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/RoutingTransitNum"/>
									</xsl:call-template>
								</span>
								&#9658;
								<div class="styLNLeftNumBox" style="width:3mm;padding-left:1.5mm;float:none;height:3mm;padding-top:0px;">c</div>
								Type: 
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue">1</xsl:with-param>
										<xsl:with-param name="BackupName">IRS1040NR/BankAccountTypeCd[1]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="margin-right:8px;">
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue">1</xsl:with-param>
										<xsl:with-param name="BackupName">IRS1040NR/BankAccountTypeCd[1]</xsl:with-param>
									</xsl:call-template>Checking</label> 
								<input type="checkbox" class="sty1040NRCkbox">
									<xsl:call-template name="PopulateEnumeratedCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue">2</xsl:with-param>
										<xsl:with-param name="BackupName">IRS1040NR/BankAccountTypeCd[2]</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/BankAccountTypeCd"/>
										<xsl:with-param name="DisplayedCheckboxValue">2</xsl:with-param>
										<xsl:with-param name="BackupName">IRS1040NR/BankAccountTypeCd[2]</xsl:with-param>
									</xsl:call-template>Savings</label> 
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 73d -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm;">d</div>
							<div class="sty1040NRIndentDesc" style="padding-top:0px;">
								<span style="padding-top:2px;width:21mm;">Account number </span>
								<span style="border:1px solid black;height:3.5mm;width:90mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/DepositorAccountNum"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 73e -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox" style="padding-left:4.5mm;">e</div>
							<div class="sty1040NRIndentDesc" style="font-family:Arial Narrow;font-size:8pt;">
								If you want your refund check mailed to an address outside the United States not shown on page 1, enter it here.
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox"></div>
							<div class="sty1040NRIndentDesc" style="border-bottom:1px dashed black;">
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/SeparateMailingAddress"/>
									<xsl:with-param name="Desc">Line 73d - Separate Mailing Address (see additional data)</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Line 74 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">74</div>
							<div class="sty1040NRIndent2Desc" style="font-family:Arial;">
								Amount of line 72 you want <strong>applied to your 2017 estimated tax</strong> &#9658;
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">74</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AppliedToEsTaxAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
					</div>
					<!-- Amount You Owe section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:8mm;border-right:1px solid black;">
							Amount <br />You Owe
						</div>
						<!-- Line 75 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">75</div>
							<div class="sty1040NRIndentDesc" style="">
								<strong>Amount you owe.</strong> Subtract line 71 from line 61. For details on how to pay, see instructions &#9658;
							</div>
							<div class="styLNRightNumBox">75</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="$FormData/InterestPenaltyTypeAndAmt"/>
										<xsl:with-param name="Desc">Line 75 - Interest Penalty, instructions pg. 55 (See additional data table)</xsl:with-param>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OwedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 76 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">76</div>
							<div class="sty1040NRIndent2Desc">
								Estimated tax penalty (see instructions) <span class="sty1040NRDotLn">.......</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">76</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;border-left:none;background-color:lightgrey;"> </div>
						</div>
					</div>
					<!-- Third Party Designee section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:10.4mm;border-right:1px solid black;">
							Third Party <br />Designee
						</div>
						<!-- Third party designee -->
						<div class="sty1040NRIndentDesc" style="width:167mm;float:left;padding-left:2px;">
							Do you want to allow another person to discuss this return with the IRS? See instructions.
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>Yes.</label> Complete below. <span style="width:4mm"/>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/ThirdPartyDesigneeInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span>
						</div>
						<div class="sty1040NRIndentDesc" style="width:167mm;float:left;padding-left:2px;height:6.4mm;">
							<span style="font-size:6pt;width:21.5mm;"><br />
								Designee's name &#9658;
							</span>
							<span style="width:58mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeNm"/>
								</xsl:call-template>
							</span>
							<span style="font-size:6pt;width:8mm;">
								Phone <br />no. &#9658;
							</span>
							<span style="width:40mm;">
								<xsl:choose>
									<xsl:when test="$FormData/ThirdPartyDesigneeFrgnPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneeFrgnPhoneNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
							<span style="font-size:6pt;width:26mm;">
								Personal identification <br />number (PIN) &#9658;
							</span>
							<span style="width:12mm;height:4mm;text-align:center;border:1px solid black;margin-bottom:1px;padding-top:2px;">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdPartyDesigneePIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Sign Here section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="height:17.6mm;border-right:1px solid black;">
							Sign Here <br /><br /><span style="font-size:6pt;font-weight:normal;">Keep a copy of <br />this return for <br />your records.</span>
						</div>
						<!-- sign -->
						<div class="sty1040NRIndentDesc" style="width:167mm;float:left;padding-left:2px;padding-bottom:0px;height:auto;">
							<span style="width:100%;font-size:8pt;font-family:Arial Narrow;height:7mm;">
								Under penalties of perjury, I declare that I have examined this return and accompanying schedules and statements, and to the best of my knowledge and 
								belief, they are true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.
							</span>
							<div style="float:left;width:40mm;height:10mm;border-right:1px solid black;">
								Your signature<br />
								<img alt="Right arrow" src="{$ImagePath}/1040_Bullet_Lg.gif" height="15" width="5" style="margin-top:3px;"/>
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
									<xsl:with-param name="Desc">Sign Here box - Power Of Attorney Signed By Indicator</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
									<xsl:with-param name="Desc">Sign Here box - Power Of Attorney Name</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="float:left;width:30mm;height:10mm;padding-left:3px;border-right:1px solid black;">
								Date<br /><br />
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
								</xsl:call-template>
							</div>
							<div style="float:left;width:55mm;height:10mm;padding-left:3px;border-right:1px solid black;">
								Your occupation in the United States<br />
								<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
									<xsl:with-param name="Desc">Sign Here box - Personal Representative Indicator</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/DaytimePhoneNum"/>
									<xsl:with-param name="Desc">Sign Here box - Daytime Phone Number</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/OptionalForeignTelephoneNum"/>
									<xsl:with-param name="Desc">Sign Here box - Optional Foreign Telephone Number</xsl:with-param>
								</xsl:call-template>
								<br />
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PrimaryOccupationTxt"/>
								</xsl:call-template>
							</div>
							<div style="float:left;width:40mm;height:10mm;padding-left:3px;font-size:6pt;">
								If the IRS sent you an Identity Protection PIN, enter it here <br />(see inst.)
								<span style="float:right;font-size:7pt;border:1px solid black;text-align:center;width:12mm;height:4mm;padding-top:2px;">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="width:19.8mm;height:16mm;">
							Paid Preparer Use Only
						</div>
						<div style="width:167.2mm;float:left;border-left:1px solid black;">
							<div style="width:62mm;border-right:1px solid black;padding-left:3px;float:left;min-height:6.3mm;">
								Print/Type preparer's name <br />
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PreparerPersonNm</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:32mm;border-right:1px solid black;padding-left:3px;float:left;min-height:6.3mm;">
								Preparer's signature <br />
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
									<xsl:with-param name="Desc">Paid Preparer box - Non Paid Preparer Code</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="TargetNode" select="$FormData/RefundAnticipationLoanCd"/>
									<xsl:with-param name="Desc">Paid Preparer box - Refund Anticipation Loan Code</xsl:with-param>
								</xsl:call-template>
								&#8194;
							</div>
							<div style="width:24mm;border-right:1px solid black;padding-left:3px;float:left;min-height:6.3mm;">
								Date <br />
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="width:20mm;border-right:1px solid black;padding-left:3px;float:left;min-height:6.3mm;">
								<label>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
										<xsl:with-param name="BackupName">IRS1040NR/SelfEmployedLabel</xsl:with-param>
									</xsl:call-template>
									Check 
									<input type="checkbox" class="sty1040NRCkbox" style="margin-right:2px;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">IRS1040NR/SelfEmployedCheckbox</xsl:with-param>
										</xsl:call-template>
									</input>
									if <br />self-employed
								</label>
							</div>
							<div style="width:28mm;padding-left:3px;float:left;">
								PTIN <br />
								<xsl:choose>
									<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div style="width:167.2mm;float:left;border-top:1px solid black;border-left:1px solid black;">
							<div style="width:130mm;border-right:1px solid black;padding-left:3px;padding-bottom:1px;float:left;">
								<span style="width:19mm;height:3.2mm;float:left;">Firm's name &#9658; </span>
								<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName">
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt">
										<br />
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</xsl:if>
							</div>
							<div style="width:36.8mm;padding-left:3px;float:left;">
								Firm's EIN &#9658; 
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:167.2mm;float:left;border-top:1px solid black;border-left:1px solid black;">
							<div style="width:130mm;border-right:1px solid black;padding-left:3px;float:left;">
								<span style="width:22mm;height:6.2mm;float:left;">Firm's address &#9658; </span>
								<span style="width:106mm;min-height:6mm;float:left;">
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp//AddressLine2Txt"><br />
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:if><br />
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<span style="width:7px;"/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:36.8mm;padding-left:3px;float:left;word-break:break-all;">
								Phone no. <span style="width:6px;"/>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong style="font-size:larger;">1040NR</strong> (2016)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDiv">
						Form 1040NR (2016)
						<div style="float:right;">Page <strong>3</strong></div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;border-bottom:1px solid black;padding-top:1mm;padding-bottom:1mm;">
						<span style="font-weight:bold;font-size:larger;">Schedule A &#8212; Itemized Deductions <span style="font-weight:normal;"> (see instructions)</span></span>
						<span style="float:right;">07</span>
					</div>
					<!-- Taxes You Paid section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection">
							Taxes You <br /> Paid
						</div>
						<!-- Sch A Line 1 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndentDesc" style=""></div>
							<div class="styLNRightNumBox" style="border-bottom:none;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="sty1040NRIndentDesc" style="">
								State and local income taxes <span class="sty1040NRDotLn">....................</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">1</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/StateAndLocalTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Gifts to US Charities section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection">
							Gifts <br />to U.S <br /> Charities
						</div>
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox"></div>
							<div class="sty1040NRIndent2Desc" style="height:7mm;">
								<strong>Caution: </strong> If you made a gift and received a benefit in <br /> return, see instructions. 
							</div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 2 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="sty1040NRIndent2Desc" style="height:7mm;">
								Gifts by cash or check. If you made any gift of $250 or more, <br /> see instructions <span class="sty1040NRDotLn">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:3mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:3mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="height:3mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:3mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="">2</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GiftsByCashOrCheckAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 3 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="sty1040NRIndent2Desc" style="height:10mm;">
								Other than by cash or check. If you made any gift of $250 or <br /> 
								more, see instructions.  You <strong>must</strong> attach Form 8283 if the <br /> 
								amount of your deduction is over $500 <span class="sty1040NRDotLn">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:6mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:6mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="">3</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherThanByCashOrCheckAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 4 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndent2Desc" style=""></div>
							<div class="styLNRightNumBox" style="border-bottom:none;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="sty1040NRIndent2Desc" style="">
								Carryover from prior year <span class="sty1040NRDotLn">...........</span>
							</div>
							<div class="styLNRightNumBox" style="">4</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CarryoverFromPriorYearAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 5 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndentDesc" style=""></div>
							<div class="styLNRightNumBox" style="border-bottom:none;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="sty1040NRIndentDesc" style="">
								Add lines 2 through 4 <span class="sty1040NRDotLn">......................</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">5</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalCharitableContriAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Casualty and Theft Losses section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection" style="font-size:7pt;">
							Casualty and <br /> Theft Losses
						</div>
						<!-- Sch A Line 6 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndentDesc" style=""></div>
							<div class="styLNRightNumBox" style="border-bottom:none;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="sty1040NRIndentDesc" style="">
								Casualty or theft loss(es). Attach Form 4684. See instructions <span class="sty1040NRDotLn">.........</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">6</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CasualtyOrTheftLossesAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CasualtyOrTheftLossesAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Expenses and Certain Misc Deductions section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection">
							Job <br /> Expenses <br /> and Certain <br /> Miscellaneous <br /> Deductions
						</div>
						<!-- Sch A Line 7 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="sty1040NRIndent2Desc" style="height:13mm;">
								Unreimbursed employee expenses&#8212;job travel, union dues, <br /> 
								job education, etc. You <strong>must</strong> attach Form 2106 or Form <br /> 
								2106-EZ if required. See instructions &#9658; 
								<span style="border-bottom:1px dashed black;width:25mm;">
								</span> <br />
								<span style="border-bottom:1px dashed black;width:96%">
									<xsl:if test="$FormData/UnreimbursedExpenseGrp">
										See Additional Data Table
									</xsl:if>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:9mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="height:9mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:9mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="">7</div>
							<div class="styLNAmountBox">
								<span style="float:left;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/UnreimEmployeeBusExpnsAmt"/>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/UnreimEmployeeBusExpnsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 8 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndent2Desc" style=""></div>
							<div class="styLNRightNumBox" style="height:4.2mm;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:4.2mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="height:4.2mm;border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="height:4.2mm;border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="sty1040NRIndent2Desc" style="">
								Tax preparation fees <span class="sty1040NRDotLn">............</span>
							</div>
							<div class="styLNRightNumBox" style="">8</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxPreparationFeesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 9 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndent2Desc" style=""></div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="sty1040NRIndent2Desc" style="height:19mm;">
								Other expenses. See instructions for expenses to deduct <br /> 
								here. List type and amount &#9658; <span style="border-bottom:1px dashed black;width:35mm;"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%">
									<xsl:if test="$FormData/OtherExpenseDetail">
										See Additional Data Table
									</xsl:if>
								</span> 
							</div>
							<div class="styLNRightNumBox" style="height:15mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:15mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="height:15mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:15mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="">9</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherExpensesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 10 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndent2Desc" style=""></div>
							<div class="styLNRightNumBox" style="border-bottom:none;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBox">10</div>
							<div class="sty1040NRIndent2Desc" style="">
								Add lines 7 through 9 <span class="sty1040NRDotLn">............</span>
							</div>
							<div class="styLNRightNumBox" style="">10</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotJobExpnssAndCrtnMiscDedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 11 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndent2Desc" style=""></div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBox">11</div>
							<div class="sty1040NRIndent2Desc" style="height:7mm;width:39mm;">
								Enter the amount from Form <br />1040NR, line 37 <span class="sty1040NRDotLn">....</span>
							</div>
							<div class="styLNRightNumBox" style="margin-top:3mm;">11</div>
							<div class="styLNAmountBox" style="margin-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AdjustedGrossIncomeAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="height:7mm;border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 12 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndent2Desc" style=""></div>
							<div class="styLNRightNumBox" style="border-bottom:none;"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBox">12</div>
							<div class="sty1040NRIndent2Desc" style="">
								Multiply line 11 by 2% (0.02) <span class="sty1040NRDotLn">..........</span>
							</div>
							<div class="styLNRightNumBox" style="">12</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CalcJobExpnssMiscDedAllwncAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<!-- Sch A Line 13 -->
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBoxSD"></div>
							<div class="sty1040NRIndentDesc" style=""></div>
							<div class="styLNRightNumBox" style="border-bottom:none;background-color:lightgrey"></div>
							<div class="styLNAmountBox" style="border-bottom:none;"></div>
						</div>
						<div style="width:167mm;float:left;margin-left:20mm;">
							<div class="styLNLeftNumBox">13</div>
							<div class="sty1040NRIndentDesc" style="">
								Subtract line 12 from line 10. If line 12 is more than line 10, enter -0- <span class="sty1040NRDotLn">.......</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;">13</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMiscellaneousDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Other Misc Deductions section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection">
							Other <br /> Miscellaneous <br /> Deductions
						</div>
						<!-- Sch A Line 14 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">14</div>
							<div class="sty1040NRIndentDesc" style="height:26mm;">
								Other&#8212;see instructions for expenses to deduct here. List type and amount &#9658; <span style="border-bottom:1px dashed black;width:16mm;"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%"> </span> <br />
								<span style="border-bottom:1px dashed black;width:96%">
									<xsl:if test="$FormData/OtherMiscDedTypeAndAmt">
										See Additional Data Table
									</xsl:if>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:22mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:22mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="border-bottom:none;">14</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OtherMiscellaneousDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Total Itemized Deductions section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="sty1040NRIndentSection">
							Total <br /> Itemized <br /> Deductions
						</div>
						<!-- Sch A Line 15 -->
						<div style="width:167mm;float:left;">
							<div class="styLNLeftNumBox">15</div>
							<div class="sty1040NRIndentDesc" style="height:31mm;">
								Is Form 1040NR, line 37, over the amount shown below for the filing status box you <br />
								checked on page 1 of Form 1040NR: <br />
								&#8226; $311,300 if you checked box 6; <br />
								&#8226; $259,400 if you checked box 1 or 2; or <br />
								&#8226; $155,650 if you checked box 3, 4, or 5? <br />
								<span style="margin-top:3px;">
									<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/></xsl:call-template>
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ItemizedLimitationsByFSInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-weight:bold;margin-left:5px;">
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ItemizedLimitationsByFSInd</xsl:with-param>
										</xsl:call-template>No.</label>
								</span>
								Your deduction is not limited. Add the amounts in the far right column for lines 1 <br /> 
								through 14. Also enter this amount on Form 1040NR, line 38. <br />
								<span style="margin-top:5px;">
									<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/></xsl:call-template>
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ItemizedLimitationsByFSInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label style="font-weight:bold;margin-left:5px;">
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/ItemizedLimitationsByFSInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ItemizedLimitationsByFSInd</xsl:with-param>
										</xsl:call-template>Yes.</label>
								</span>
								Your deduction may be limited. See the Itemized Deductions Worksheet in the <br /> 
								instructions to figure the amount to enter here and on Form 1040NR, line 38.
							</div>
							<div class="styLNRightNumBox" style="height:27mm;background-color:lightgrey;border-bottom:none;"></div>
							<div class="styLNAmountBox" style="height:27mm;border-bottom:none;"></div>
							<div class="styLNRightNumBox" style="border-bottom:none;">15</div>
							<div class="styLNAmountBox" style="border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalItemizedDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong style="font-size:larger;">1040NR</strong> (2016)</span>
					</div>
					<!-- Page 4 -->
					<div class="sty1040NRLandDiv" style="display:inline;width:256mm;">
					<div class="styStdDivLS">
						Form 1040NR (2016)
						<div style="float:right;">Page <strong>4</strong></div>
					</div>
					<div class="styStdDivLS" style="border-top:2px solid black;border-bottom:1px solid black;text-align:center">
						<span style="font-weight:bold;font-size:larger;padding-top:0.5mm;padding-bottom:0.5mm;">
							Schedule NEC &#8212; Tax on Income Not Effectively Connected With a U.S. Trade or Business <span style="font-weight:normal;"> (see instructions)</span>
						</span> 
					</div>
					<div class="styStdDivLS">
						<div style="width:96.2mm;height:9mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;font-weight:bold;text-align:center;float:left;">
							<br />Nature of income
						</div>
						<div style="width:159.8mm;height:3mm;padding-left:4px;border-bottom:1px solid black;float:left;">
							Enter <strong>amount of income</strong> under the appropriate rate of tax (see instructions)
						</div>
						<div style="width:32mm;height:6mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;text-align:center;float:left;padding-top:4px;">
							<strong>(a)</strong> 10%
						</div>
						<div style="width:32.1mm;height:6mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;text-align:center;float:left;padding-top:4px;">
							<strong>(b)</strong> 15%
						</div>
						<div style="width:32mm;height:6mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;text-align:center;float:left;padding-top:4px;">
							<strong>(c)</strong> 30%
						</div>
						<div style="width:63.6mm;height:3mm;border-bottom:1px solid black;text-align:center;float:left;">
							<strong>(d)</strong> Other (specify)
						</div>
						<div style="width:32mm;height:3mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;text-align:right;float:left;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/TaxRt"/>
							</xsl:call-template>
							<xsl:if test="not($FormData/IncomeTaxRtOthUndTrtyRuleGrp/TaxRt)">%</xsl:if>
						</div>
						<div style="width:31.6mm;height:3mm;border-bottom:1px solid black;text-align:right;float:left;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOth2UndTrtyRuleGrp/TaxRt"/>
							</xsl:call-template>
							<xsl:if test="not($FormData/IncomeTaxRtOth2UndTrtyRuleGrp/TaxRt)">%</xsl:if>
						</div>
					</div>
					<!-- Sch NEC Line 1 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:80mm;">
							Dividends paid by:
						</div>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Sch NEC Line 1a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">a</div>
						<div class="styLNDesc" style="width:80mm;">
							U.S. corporations
							<span class="sty1040NRDotLn">..............</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">1a</xsl:with-param>
							<xsl:with-param name="NECName">DividendsPaidDomCorpAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 1b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width:80mm;">
							Foreign corporations
							<span class="sty1040NRDotLn">.............</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">1b</xsl:with-param>
							<xsl:with-param name="NECName">DividendsPaidFrgnCorpAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:80mm;">
							Interest:
						</div>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Sch NEC Line 2a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">a</div>
						<div class="styLNDesc" style="width:80mm;">
							Mortgage
							<span class="sty1040NRDotLn">................</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">2a</xsl:with-param>
							<xsl:with-param name="NECName">MortgageInterestAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 2b -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width:80mm;">
							Paid by foreign corporations
							<span class="sty1040NRDotLn">...........</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">2b</xsl:with-param>
							<xsl:with-param name="NECName">InterestPaidFrgnCorpAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 2c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">c</div>
						<div class="styLNDesc" style="width:80mm;">
							Other
							<span class="sty1040NRDotLn">.................</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">2c</xsl:with-param>
							<xsl:with-param name="NECName">OtherInterestAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:80mm;">
							Industrial royalties (patents, trademarks, etc.)
							<span class="sty1040NRDotLn">.....</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">3</xsl:with-param>
							<xsl:with-param name="NECName">IndustrialRoyaltiesAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:80mm;">
							Motion picture or T.V. copyright royalties
							<span class="sty1040NRDotLn">......</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">4</xsl:with-param>
							<xsl:with-param name="NECName">CopyrightRoyaltiesAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width:80mm;">
							Other royalties (copyrights, recording, publishing, etc.)
							<span class="sty1040NRDotLn">..</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">5</xsl:with-param>
							<xsl:with-param name="NECName">OtherRoyaltiesAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 6 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:80mm;">
							Real property income and natural resources royalties
							<span class="sty1040NRDotLn">...</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">6</xsl:with-param>
							<xsl:with-param name="NECName">RealPropNatRscRoyaltiesAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 7 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:80mm;">
							Pensions and annuities
							<span class="sty1040NRDotLn">............</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">7</xsl:with-param>
							<xsl:with-param name="NECName">PensionsAnnuitiesAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 8 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:80mm;">
							Social security benefits
							<span class="sty1040NRDotLn">............</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">8</xsl:with-param>
							<xsl:with-param name="NECName">SocSecBnftAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 9 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc" style="width:80mm;">
							Capital gain from line 18 below
							<span class="sty1040NRDotLn">..........</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">9</xsl:with-param>
							<xsl:with-param name="NECName">NetCapitalGainOrLossAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 10 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="">10</div>
						<div class="styLNDesc" style="height:7mm;width:80mm;">
							Gambling&#8213;Residents of Canada only. Enter net income in column (c). <strong>If zero or less, enter -0-.</strong>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;border-bottom:none;"></div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"></div>
					</div>
					<!-- Sch NEC Line 10a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">a</div>
						<div class="styLNDesc" style="width:80mm;">
							<span style="width:20mm;">Winnings</span>
							<span class="styLNAmountBox" style="height:3mm;border-left:none;padding:0px;float:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GmblWinCanadaResidentsAmt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom:none;"></div>
						<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"></div>
					</div>
					<!-- Sch NEC Line 10b / 10c -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</div>
						<div class="styLNDesc" style="width:80mm;">
							<span style="width:20mm;">Losses</span>
							<span class="styLNAmountBox" style="height:3mm;border-left:none;padding:0px;float:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GmblLossCanadaResidentsAmt"/>
								</xsl:call-template>
							</span>
							<span class="sty1040NRDotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="">10c</div>
						<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt30UndTrtyRuleGrp/NetGmblCanadaResidentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/NetGmblCanadaResidentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"></div>
					</div>
					<!-- Sch NEC Line 11 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="">11</div>
						<div class="styLNDesc" style="width:80mm;">
							Gambling winnings&#8213;Residents of countries other than Canada.
						</div>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"></div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;"></div>
						<div class="styLNDesc" style="width:80mm;">
							<strong>Note: </strong> Losses not allowed
							<span class="sty1040NRDotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="">11</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt10UndTrtyRuleGrp/GmblWinNotCanadaResidentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt30UndTrtyRuleGrp/GmblWinNotCanadaResidentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/GmblWinNotCanadaResidentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="background-color:lightgrey;"></div>
					</div>
					<!-- Sch NEC Line 12 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox" style="">12</div>
						<div class="styLNDesc" style="width:80mm;">
							Other (specify) &#9658; 
							<span style="width:56mm;border-bottom:1px dashed black;">&#8194;
								<xsl:if test="$FormData//OtherIncomeTyp">
									See additional data table
								</xsl:if>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;"></div>
						<div class="styLNDesc" style="width:80mm;border-bottom:1px dashed black;">
							&#8194;
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">12</xsl:with-param>
							<xsl:with-param name="NECName">OtherIncomeAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 13-->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:80mm;">
							Add lines 1a through 12 in columns (a) through (d)
							<span class="sty1040NRDotLn">...</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">13</xsl:with-param>
							<xsl:with-param name="NECName">TotalIncomeAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 14 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width:80mm;">
							<strong>Multiply line 13 by rate of tax at top of each column</strong>
							<span class="sty1040NRDotLn">.</span>
						</div>
						<xsl:call-template name="SchNECtable1">
							<xsl:with-param name="NECLine">14</xsl:with-param>
							<xsl:with-param name="NECName">TotalIncomeTimesTaxRtAmt</xsl:with-param>
						</xsl:call-template>
					</div>
					<!-- Sch NEC Line 15 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDescLandscape" style="height:7mm;width:208mm;">
							<strong>Tax on income not effectively connected with a U.S. trade or business. </strong> Add columns (a) through (d) of line 14. Enter the total here and on <br />
							Form 1040NR, line 54
							<span class="sty1040NRDotLn">...........................................&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />15</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeNotUSBusinessTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Schedule NEC table 2 -->
					<div class="styStdDivLS" style="border-top:2px solid black;border-bottom:1px solid black;text-align:center">
						<span style="font-weight:bold;font-size:larger;padding-top:0.5mm;padding-bottom:0.5mm;">
							Capital Gains and Losses From Sales or Exchanges of Property
						</span> 
						<span style="float:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="TargetNode" select="$FormData/CapGainLossSlsOrExchPropGrp"/>
								<xsl:with-param name="containerID" select=" 'propertyGainLossContainer' "/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Sch NEC Lines 16-18 -->
					<div class="styStdDivLS">
						<div class="sty1040NRIndentSection" style="width:35mm;font-size:7pt;font-family:Arial Narrow;text-align:justify;padding-right:1mm;">
							Enter only the capital gains and losses from property sales or exchanges that are from sources within the United States and not effectively
							connected with a U.S. business. 
							Do not include a gain or loss on disposing of a U.S. real property interest; report these gains and losses on Schedule D (Form 1040).<br />
							Report property sales or exchanges that are effectively connected with a U.S. business on Schedule D (Form 1040), Form 4797, or both.
						</div>
						<div style="width:221mm;border-left:1px solid black;float:left;">
							<xsl:variable name="countNEC16" select="count($FormData/CapGainLossSlsOrExchPropGrp)"/>
							<div class="sty1040NRTableContainer16" id="propertyGainLossContainer">
								<xsl:call-template name="SetInitialState"/>
								<table class="styTable" style="display:table;border-collapse:collapse;font-size:7pt;">
									<thead class="styTableThead">
										<tr>
											<th class="styTableCellHeader" scope="col" style="width:69mm;font-weight:normal;">
												<span style="float:left;font-weight:bold;">16</span>
												<strong>(a)</strong> Kind of property and description <br />
												(if necessary, attach statement of <br />descriptive details not shown below)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
												<strong>(b)</strong> Date <br /> acquired <br /> (mo., day, yr.)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
												<strong>(c)</strong> Date <br /> sold <br /> (mo., day, yr.)
											</th>
											<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
												<strong>(d)</strong> Sales price
											</th>
											<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
												<strong>(e)</strong> Cost or other <br /> basis
											</th>
											<th class="styTableCellHeader" scope="col" style="width:28.1mm;font-weight:normal;">
												<strong>(f) LOSS</strong><br /> If (e) is more <br /> than (d), subtract (d) <br /> from (e) 
											</th>
											<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right:none;">
												<strong>(g) GAIN</strong><br /> If (d) is more <br /> than (e), subtract (e) <br /> from (d) 
											</th>
										</tr>
									</thead>
									<tbody>
										<xsl:if test="not((($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12)))">
											<xsl:for-each select="$FormData/CapGainLossSlsOrExchPropGrp">
												<tr>
													<td class="sty1040NRTableCellText">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PropertyDesc"/>
														</xsl:call-template>
													</td>
													<td class="sty1040NRTableCellCenter">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="AcquiredDt"/>
														</xsl:call-template>
													</td>
													<td class="sty1040NRTableCellCenter">
														<xsl:call-template name="PopulateMonthDayYear">
															<xsl:with-param name="TargetNode" select="SoldDt"/>
														</xsl:call-template>
													</td>
													<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="SalesPriceAmt"/>
														</xsl:call-template>
													</td>
													<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
														</xsl:call-template>
													</td>
													<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="LossAmt"/>
														</xsl:call-template>
													</td>
													<td class="sty1040NRTableCellAmt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="GainAmt"/>
														</xsl:call-template>
													</td>
												</tr>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="($countNEC16 &lt; 1) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
											<tr>
												<td class="sty1040NRTableCellText">&#8194;
													<xsl:if test="($Print and not($Print='')) and ($countNEC16 &gt; 0)">
														See Additional Data Table
													</xsl:if>
												</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt">&#8194;</td>
											</tr>
										</xsl:if>
										<xsl:if test="($countNEC16 &lt; 2) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
											<tr>
												<td class="sty1040NRTableCellText">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt">&#8194;</td>
											</tr>
										</xsl:if>
										<xsl:if test="($countNEC16 &lt; 3) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
											<tr>
												<td class="sty1040NRTableCellText">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt">&#8194;</td>
											</tr>
										</xsl:if>
										<xsl:if test="($countNEC16 &lt; 4) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
											<tr>
												<td class="sty1040NRTableCellText">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt">&#8194;</td>
											</tr>
										</xsl:if>
										<xsl:if test="($countNEC16 &lt; 5) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
											<tr>
												<td class="sty1040NRTableCellText">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt">&#8194;</td>
											</tr>
										</xsl:if>
										<xsl:if test="($countNEC16 &lt; 6) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
											<tr>
												<td class="sty1040NRTableCellText">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellCenter">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt" style="border-right-width:1px;">&#8194;</td>
												<td class="sty1040NRTableCellAmt">&#8194;</td>
											</tr>
										</xsl:if>
									</tbody>
								</table>
							</div>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="containerHeight" select="6"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="TargetNode" select="$FormData/CapGainLossSlsOrExchPropGrp"/>
								<xsl:with-param name="containerID" select=" 'propertyGainLossContainer' "/>
							</xsl:call-template>
							<!-- Line 17 -->
							<div class="styStdDivLS" style="width:220.7mm;">
								<div class="styLNLeftNumBox">17</div>
								<div class="styLNDesc" style="width:148.6mm;">
									Add columns (f) and (g) of line 16
									<span class="sty1040NRDotLn">..........................</span>
								</div>
								<div class="styLNRightNumBox">17</div>
								<div class="styLNAmountBox" style="width:28mm;">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:28mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalGainAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 18 -->
							<div class="styStdDivLS" style="width:220.7mm;">
								<div class="styLNLeftNumBox">18</div>
								<div class="styLNDesc" style="width:176.6mm;">
									<strong>Capital gain. </strong> Combine columns (f) and (g) of line 17. Enter the net gain here and on line 9 above (if a loss, enter -0-) 
									<span class="sty1040NRDotLn">.....&#9658;</span>
								</div>
								<div class="styLNRightNumBoxNBB">18</div>
								<div class="styLNAmountBoxNBB" style="width:28mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NetCapitalGainOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong style="font-size:larger;">1040NR</strong> (2016)</span>
					</div>
					</div>
					<!-- Page 5 -->
					<div class="styStdDiv">
						Form 1040NR (2016)
						<div style="float:right;">Page <strong>5</strong></div>
					</div>
					<div style="display:inline">
					<div class="styStdDiv" style="border-top:2px solid black;border-bottom:1px solid black;text-align:center">
						<span style="font-weight:bold;font-size:larger;padding-top:0.5mm;padding-bottom:0.5mm;">
							Schedule OI &#8212; Other Information <span style="font-weight:normal;"> (see instructions)</span>
						</span> <br />
						Answer all questions
					</div>
					<!-- Sch OI Line A -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">A</div>
						<div class="sty1040NRLongDesc">
							Of what country or countries were you a citizen or national during the tax year? 
							<span style="border-bottom:1px dashed black;width:78mm;">
								<xsl:for-each select="$FormData/CitizenCountryCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
					</div>
					<!-- Sch OI Line B -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">B</div>
						<div class="sty1040NRLongDesc">
							In what country did you claim residence for tax purposes during the tax year? 
							<span style="border-bottom:1px dashed black;width:80mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTaxResidenceCountryCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Sch OI Line C -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">C</div>
						<div class="sty1040NRLongDesc">
							<span style="width:606px;">
								Have you ever applied to be a green card holder (lawful permanent resident) of the United States?
								<span class="sty1040NRDotLn">.........</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span>
						</div>
					</div>
					<!-- Sch OI Line D -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">D</div>
						<div class="sty1040NRLongDesc" style="">
							Were you ever: <br />
							<span style="width:606px;">
								<strong>1. </strong> A U.S. citizen?
								<span class="sty1040NRDotLn">..................................</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USCitizenInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USCitizenInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USCitizenInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/USCitizenInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USCitizenInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span><span style="height:3mm;"/><br />
							<span style="width:606px;">
								<strong>2. </strong> A green card holder (lawful permanent resident) of the United States?
								<span class="sty1040NRDotLn">................</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/LawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/LawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/LawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/LawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/LawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span><br />
							If you answer "Yes" to (1) or (2), see Pub. 519, chapter 4, for expatriation rules that apply to you.
						</div>
					</div>
					<!-- Sch OI Line E -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">E</div>
						<div class="sty1040NRLongDesc">
							If you had a visa on the last day of the tax year, enter your visa type. If you did not have a visa, enter your U.S. <br />
							immigration status on the last day of the tax year.
							<span style="border-bottom:1px dashed black;width:93mm;">
								<xsl:choose>
									<xsl:when test="$FormData/NonImmigrantVisaTypeCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/NonImmigrantVisaTypeCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$FormData/ImmigrantVisaTypeCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ImmigrantVisaTypeCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatusDesc"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Sch OI Line F -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">F</div>
						<div class="sty1040NRLongDesc">
							<span style="width:606px;">
								Have you ever changed your visa type (nonimmigrant status) or U.S. immigration status?
								<span class="sty1040NRDotLn">...........</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USImmigrationStatVisaTypChgInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USImmigrationStatVisaTypChgInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USImmigrationStatVisaTypChgInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatVisaTypChgInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USImmigrationStatVisaTypChgInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span> <br />
							If you answered "Yes," indicate the date and nature of the change. &#9658; 
							<span style="border-bottom:1px dashed black;width:70mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/VisaChangeDt"/>
								</xsl:call-template>
								<span style="width:12px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/VisaChangeDesc"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Sch OI Line G -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">G</div>
						<div class="sty1040NRLongDesc">
							List all dates you entered and left the United States during 2016 (see instructions). <br />
							<strong>Note: </strong> If you are a resident of Canada or Mexico AND commute to work in the United States at frequent intervals, <br />
							<strong>check the box for Canada or Mexico </strong> and skip to item H
							<span style="letter-spacing:13px;font-weight:bold;padding-left:2mm;padding-right:1mm;">.........</span>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/CanadaResidentWorkInUSInd"/>
									<xsl:with-param name="BackupName">IRS1040NR/CanadaResidentWorkInUSInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:3px;padding-right:4mm;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/CanadaResidentWorkInUSInd"/>
									<xsl:with-param name="BackupName">IRS1040NR/CanadaResidentWorkInUSInd</xsl:with-param>
								</xsl:call-template>Canada</label>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/MexicoResidentWorkInUSInd"/>
									<xsl:with-param name="BackupName">IRS1040NR/MexicoResidentWorkInUSInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:3px;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/MexicoResidentWorkInUSInd"/>
									<xsl:with-param name="BackupName">IRS1040NR/MexicoResidentWorkInUSInd</xsl:with-param>
								</xsl:call-template>Mexico</label>
							<span style="float:right;">
								<xsl:call-template name="SetDynamicTableToggleRowCount">
									<!--<xsl:with-param name="TargetNode" select="$FormData/EnteredDepartedUSGrp"/>-->
									<xsl:with-param name="DataRowCount" select="count($FormData/EnteredDepartedUSGrp) div 2"/>
									<xsl:with-param name="containerHeight" select="4"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerID" select=" 'enterexitContainerId' "/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- EnteredDepartedUSGrp table -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox"></div>
						<div class="sty1040NRTableContainerG" id="enterexitContainerId">
							<xsl:call-template name="SetInitialState"/>
							<table class="styTable" style="display:table;border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-top:1px solid black;padding-bottom:3px;">
											Date entered United States <br /> mm/dd/yy
										</th>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-top:1px solid black;padding-bottom:3px;">
											Date departed United States <br /> mm/dd/yy
										</th>
										<th scope="col" style="width:19mm;border-right:1px solid black;border-top:0px;"></th>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-top:1px solid black;padding-bottom:3px;">
											Date entered United States <br /> mm/dd/yy
										</th>
										<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;border-top:1px solid black;padding-bottom:3px;">
											Date departed United States <br /> mm/dd/yy
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="not(($Print = $Separated) and (count($FormData/EnteredDepartedUSGrp) &gt; 8))">
										<xsl:for-each select="$FormData/EnteredDepartedUSGrp[position() mod 2 = 1]">
											<xsl:variable name="RightNode" select="./following-sibling::EnteredDepartedUSGrp[1]"/>
											<tr>
												<td class="sty1040NRTableCellCenter">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="EnteredUSDt"/>
													</xsl:call-template>
												</td>
												<td class="sty1040NRTableCellCenter">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="DepartedUSDt"/>
													</xsl:call-template>
												</td>
												<td style="border-right:1px solid black;">&#8194;</td>
												<td class="sty1040NRTableCellCenter">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$RightNode/EnteredUSDt"/>
													</xsl:call-template>
												</td>
												<td class="sty1040NRTableCellCenter">
													<xsl:call-template name="PopulateMonthDayYear">
														<xsl:with-param name="TargetNode" select="$RightNode/DepartedUSDt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:variable name="EDUG" select="count($FormData/EnteredDepartedUSGrp)"/>
									<xsl:if test="($EDUG &lt; 1) or (($Print = $Separated) and ($EDUG &gt; 8))">
										<tr>
											<td class="sty1040NRTableCellCenter">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$FormData/EnteredDepartedUSGrp"/>
												</xsl:call-template>
											</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td style="border-right:1px solid black;">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
										</tr>
									</xsl:if>
									<xsl:if test="($EDUG &lt; 3) or (($Print = $Separated) and ($EDUG &gt; 8))">
										<tr>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td style="border-right:1px solid black;">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
										</tr>
									</xsl:if>
									<xsl:if test="($EDUG &lt; 5) or (($Print = $Separated) and ($EDUG &gt; 8))">
										<tr>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td style="border-right:1px solid black;">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
										</tr>
									</xsl:if>
									<xsl:if test="($EDUG &lt; 7) or (($Print = $Separated) and ($EDUG &gt; 8))">
										<tr>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td style="border-right:1px solid black;">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
											<td class="sty1040NRTableCellCenter">&#8194;</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeightRowCount">
						<!--<xsl:with-param name="TargetNode" select="$FormData/EnteredDepartedUSGrp"/>-->
						<xsl:with-param name="DataRowCount" select="count($FormData/EnteredDepartedUSGrp) div 2"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerID" select=" 'enterexitContainerId' "/>
					</xsl:call-template>
					<!-- Sch OI Line H -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">H</div>
						<div class="sty1040NRLongDesc">
							Give the number of days (including vacation, nonworkdays, and partial days) you were present in the United States during: <br />
							2014
							<span style="border-bottom:1px dashed black;width:30mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PhysicallyPresUSPYLess2DayCnt"/>
								</xsl:call-template>
							</span>
							, 2015
							<span style="border-bottom:1px dashed black;width:30mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PhysicallyPresUSPYLess1DayCnt"/>
								</xsl:call-template>
							</span>
							, and 2016
							<span style="border-bottom:1px dashed black;width:30mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PhysicallyPresUSPYDayCnt"/>
								</xsl:call-template>
							</span>.
						</div>
					</div>
					<!-- Sch OI Line I -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">I</div>
						<div class="sty1040NRLongDesc">
							<span style="width:606px;">
								Did you file a U.S. income tax return for any prior year?
								<span class="sty1040NRDotLn">......................</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USTaxRetFiledForAnyPYInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USTaxRetFiledForAnyPYInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USTaxRetFiledForAnyPYInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/USTaxRetFiledForAnyPYInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/USTaxRetFiledForAnyPYInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span> <br />
							If "Yes," give the latest year and form number you filed <span style="letter-spacing:3.1mm;font-weight:bold;padding-left:7px;">...</span> &#9658; 
							<span style="border-bottom:1px dashed black;width:60mm;">
								<xsl:call-template name="PopulateYear">
									<xsl:with-param name="TargetNode" select="$FormData/ReturnFiledYr"/>
								</xsl:call-template>
								<span style="width:12px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/FormTypeCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Sch OI Line J -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">J</div>
						<div class="sty1040NRLongDesc">
							<span style="width:606px;">
								Are you filing a return for a trust?
								<span class="sty1040NRDotLn">.............................</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/FilingReturnForTrustInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/FilingReturnForTrustInd</xsl:with-param>
									</xsl:call-template>Yes</label>
					<!-- Note that for release 10, business has specified that this checkbox must be always marked No -->
								<input type="checkbox" class="styCkboxNM" checked="checked">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/FilingReturnForTrustInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/FilingReturnForTrustInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/FilingReturnForTrustInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span> <br />
							If "Yes," did the trust have a U.S. or foreign owner under the grantor trust rules, make a distribution or loan to a <br />
							<span style="width:606px;">
								U.S. person, or receive a contribution from a U.S. person?
								<span class="sty1040NRDotLn">.....................</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/GrantorTrDistriLoanOrContriInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/GrantorTrDistriLoanOrContriInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/GrantorTrDistriLoanOrContriInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/GrantorTrDistriLoanOrContriInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/GrantorTrDistriLoanOrContriInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span>
						</div>
					</div>
					<!-- Sch OI Line K -->
					<div class="styStdDiv" style="margin-bottom:3mm;">
						<div class="styLNLeftNumBox">K</div>
						<div class="sty1040NRLongDesc">
							<span style="width:606px;">
								Did you receive total compensation of $250,000 or more during the tax year?
								<span class="sty1040NRDotLn">...............</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/TotalComp250KOrMoreInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/TotalComp250KOrMoreInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/TotalComp250KOrMoreInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/TotalComp250KOrMoreInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/TotalComp250KOrMoreInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span><span style="height:3mm;"/> <br />
							<span style="width:606px;">
								If "Yes," did you use an alternative method to determine the source of this compensation?
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
								</xsl:call-template>
								<span class="sty1040NRDotLn">..........</span>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/AltBasisCompensationSourceInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/AltBasisCompensationSourceInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/AltBasisCompensationSourceInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/AltBasisCompensationSourceInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/AltBasisCompensationSourceInd</xsl:with-param>
									</xsl:call-template>No</label>
							</span><span style="height:3mm;"/>
						</div>
					</div>
					<!-- Sch OI Line L -->
					<!-- $L1Data is a way to conglomerate all of the different line L(1) schema groups into a single XPath grouping. 
							The second part is to exclude IndiaStandardDedTaxTreatyGrp (line 38), if present -->
					<xsl:variable name="L1Data" select="$FormData/*[contains(local-name(),'TreatyGrp') and not(contains(local-name(),'Tax'))]"/>
					<xsl:variable name="CL1" select="count($L1Data)"/>
					<div class="styStdDiv" style="margin-bottom:1mm;">
						<div class="styLNLeftNumBox">L</div>
						<div class="sty1040NRLongDesc">
							Income Exempt from Tax &#8212; If you are claiming exemption from income tax under a U.S. income tax treaty with a <br />
							foreign country, complete (1) through (3) below. See Pub. 901 for more information on tax treaties. <br />
							<span style="font-weight:bold;height:5mm;width:4mm;float:left;">1. </span>
							Enter the name of the country, the applicable tax treaty article, the number of months in prior years you claimed the treaty <br />
							benefit, and the amount of exempt income in the columns below. Attach Form 8833 if required (see instructions).
							<span style="float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$L1Data"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerHeight" select="3"/>
									<xsl:with-param name="containerID" select=" 'treatyContainerId' "/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Table for L-1 -->
					<div class="sty1040NRTableContainerL" id="treatyContainerId">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="display:table;border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:47mm;font-weight:normal;padding-bottom:3px;">
										<strong>(a)</strong> Country
									</th>
									<th class="styTableCellHeader" scope="col" style="width:55mm;font-weight:normal;padding-bottom:3px;">
										<strong>(b)</strong> Tax treaty <br /> article
									</th>
									<th class="styTableCellHeader" scope="col" style="width:40mm;font-weight:normal;padding-bottom:3px;">
										<strong>(c)</strong> Number of months <br /> claimed in prior tax years
									</th>
									<th class="styTableCellHeader" scope="col" style="width:45mm;font-weight:normal;padding-bottom:3px;border-right:none;">
										<strong>(d)</strong> Amount of exempt <br /> income in current tax year
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not(($Print = $Separated) and ($CL1 &gt; 3))">
									<xsl:for-each select="$L1Data">
										<tr style="min-height:7mm;">
											<td class="sty1040NRTableCellCenter">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CountryCd"/>
												</xsl:call-template>
											</td>
											<td class="sty1040NRTableCellText">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TaxTreatyArticleCd"/>
												</xsl:call-template>
											</td>
											<td class="sty1040NRTableCellCenter">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="MnthExemptClmPriorTYNum"/>
												</xsl:call-template>
											</td>
											<td class="sty1040NRTableCellAmt">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExemptIncomeCurrentTYAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="($CL1 &lt; 1) or (($Print = $Separated) and ($CL1 &gt; 3))">
									<tr style="min-height:7mm;">
										<td class="sty1040NRTableCellCenter">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$L1Data"/>
											</xsl:call-template>
										</td>
										<td class="sty1040NRTableCellText">&#8194;</td>
										<td class="sty1040NRTableCellCenter">&#8194;</td>
										<td class="sty1040NRTableCellAmt">&#8194;</td>
									</tr>
								</xsl:if>
								<xsl:if test="($CL1 &lt; 2) or (($Print = $Separated) and ($CL1 &gt; 3))">
									<tr style="min-height:7mm;">
										<td class="sty1040NRTableCellCenter">&#8194;</td>
										<td class="sty1040NRTableCellText">&#8194;</td>
										<td class="sty1040NRTableCellCenter">&#8194;</td>
										<td class="sty1040NRTableCellAmt">&#8194;</td>
									</tr>
								</xsl:if>
								<xsl:if test="($CL1 &lt; 3) or (($Print = $Separated) and ($CL1 &gt; 3))">
									<tr style="min-height:7mm;">
										<td class="sty1040NRTableCellCenter">&#8194;</td>
										<td class="sty1040NRTableCellText">&#8194;</td>
										<td class="sty1040NRTableCellCenter">&#8194;</td>
										<td class="sty1040NRTableCellAmt">&#8194;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="styStdDiv" style="margin-bottom:2px;">
						<div class="styLNDesc" style="width:141.9mm;height:7.5mm;float:left;border-bottom:1px solid black;">
							<br />
							<strong>(e) <span style="width:2mm;"/> Total. </strong> 
							Enter this amount on Form 1040NR, line 22. Do not enter it on line 8 or line 12
							<span class="sty1040NRDotLn" style="padding-right:8px;">.....</span>
						</div>
						<div class="styLNAmountBox" style="width:45.1mm;height:7.5mm;"><br />
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TreatyTaxExemptUSIncomeAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TreatyTaxExemptUSIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$L1Data"/>
						<xsl:with-param name="headerHeight" select="1"/>
						<xsl:with-param name="containerHeight" select="3"/>
						<xsl:with-param name="containerID" select=" 'treatyContainerId' "/>
					</xsl:call-template>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="height:9mm;"/>
						<span style="width:606px;">
						<span style="font-weight:bold;width:4mm;float:left;">2. </span>
							Were you subject to tax in a foreign country on any of the income shown in 1(d) above?
							<span class="sty1040NRDotLn">...........</span>
						</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/></xsl:call-template>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/>
									<xsl:with-param name="BackupName">IRS1040NR/TxFrgnCntryExemptIncmCurrTYInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/>
									<xsl:with-param name="BackupName">IRS1040NR/TxFrgnCntryExemptIncmCurrTYInd</xsl:with-param>
								</xsl:call-template>Yes</label>
							<input type="checkbox" class="styCkboxNM">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/>
									<xsl:with-param name="BackupName">IRS1040NR/TxFrgnCntryExemptIncmCurrTYInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label style="padding-left:3px;font-weight:bold;">
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/TxFrgnCntryExemptIncmCurrTYInd"/>
									<xsl:with-param name="BackupName">IRS1040NR/TxFrgnCntryExemptIncmCurrTYInd</xsl:with-param>
								</xsl:call-template>No</label>
						</span><span style="height:3mm;"/> <br />
						<span style="width:606px;">
							<span style="font-weight:bold;width:4mm;float:left;">3. </span>
							Are you claiming treaty benefits pursuant to a Competent Authority determination?
							<span class="sty1040NRDotLn">............</span>
						</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateSpan"><xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/></xsl:call-template>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/CompetentAuthorityDetermInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;padding-right:2mm;font-weight:bold;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/CompetentAuthorityDetermInd</xsl:with-param>
									</xsl:call-template>Yes</label>
								<input type="checkbox" class="styCkboxNM">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/CompetentAuthorityDetermInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="padding-left:3px;font-weight:bold;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/CompetentAuthorityDetermInd</xsl:with-param>
									</xsl:call-template>No</label>
						</span><span style="height:3mm;"/> <br />
						<span style="font-weight:bold;width:4mm;float:left;">&#8201;</span>
						If "Yes," attach a copy of the Competent Authority determination letter to your return.
					</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong style="font-size:larger;">1040NR</strong> (2016)</span>
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
						<xsl:if test="$FormData/ProtectiveReturnInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row"><label><xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturnInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/ProtectiveReturnInd</xsl:with-param>
									</xsl:call-template>Top Left Header - Check this box for a protective return</label>:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturnInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ProtectiveReturnInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
							<xsl:with-param name="Desc">Top Left Header - Primary Date of Death</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							<xsl:with-param name="Desc">Filer Information - Primary Name Control</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							<xsl:with-param name="Desc">Filer Information - In Care Of name</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="$FormData/QualifyingPersonName">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Line 6 - Qualifying Person Name:</td>  
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonFirstNm"/>
									</xsl:call-template>
									<span style="width:8px;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/QualifyingPersonName/PersonLastNm"/>
									</xsl:call-template>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/SpouseNameControlTxt"/>
							<xsl:with-param name="Desc">Line (i)/(ii) - Spouse Name Control</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpouseInformationGrp/SpouseDeathDt"/>
							<xsl:with-param name="Desc">Line (i)/(ii) - Spouse Death Date</xsl:with-param>
						</xsl:call-template>
						<xsl:for-each select="$FormData/DependentDetail">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="$FormData/DependentNameControlTxt"/>
								<xsl:with-param name="Desc">Line 7c - Dependent <xsl:value-of select="position()"/> Name Control</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Cd"/>
							<xsl:with-param name="Desc">Line 10a - Ordinary F8814 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OrdinaryF8814Amt"/>
							<xsl:with-param name="Desc">Line 10a - Ordinary F8814 amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Cd"/>
							<xsl:with-param name="Desc">Line 10b - Qualified F8814 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedF8814Amt"/>
							<xsl:with-param name="Desc">Line 10b - Qualified F8814 amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt/@form4684Cd"/>
							<xsl:with-param name="Desc">Line 15 - Form 4684 Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
							<xsl:with-param name="Desc">Line 20 - Repayment Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
							<xsl:with-param name="Desc">Line 20 - Repayment Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="$FormData/ProtectiveSec108iELCRecordInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row"><label><xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/ProtectiveSec108iELCRecordInd</xsl:with-param>
									</xsl:call-template>Line 21 - Protective Section 108(i) ELC Record indicator</label>:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/ProtectiveSec108iELCRecordInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/IndiaStandardDedTaxTreatyGrp/IndiaStandardDedTaxTreatyCd"/>
							<xsl:with-param name="Desc">Line 38 - India standard deduction tax treaty code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/ScheduleQCd"/>
							<xsl:with-param name="Desc">Line 41 - IRS Schedule Q code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form8814Ind/@childInterestAndDividendTaxAmt"/>
							<xsl:with-param name="Desc">Line 42a - Child Interest and Dividend Tax Amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/CanadaIncomeTaxTreatyArtXXVCd"/>
							<xsl:with-param name="Desc">Line 42 - Income from Canada under tax treaty article XXV code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8396Cd"/>
							<xsl:with-param name="Desc">Line 51c - Other Credit Form 8396 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8834Cd"/>
							<xsl:with-param name="Desc">Line 51c - Other Credit Form 8834 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8839Cd"/>
							<xsl:with-param name="Desc">Line 51c - Other Credit Form 8839 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8859Cd"/>
							<xsl:with-param name="Desc">Line 51c - Other Credit Form 8859 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8910Cd"/>
							<xsl:with-param name="Desc">Line 51c - Other Credit Form 8910 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8911Cd"/>
							<xsl:with-param name="Desc">Line 51c - Other Credit Form 8911 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8912Cd"/>
							<xsl:with-param name="Desc">Line 51c - Other Credit Form 8912 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SpecificOtherCreditsInd/@creditFormsStatement8936Cd"/>
							<xsl:with-param name="Desc">Line 51c - Other Credit Form 8936 code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/SelfEmploymentTaxAmt/@exemptSETaxLiteralCd"/>
							<xsl:with-param name="Desc">Line 55 - Exempt SE Tax Literal code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/RailroadRetirementCd"/>
							<xsl:with-param name="Desc">Line 55 - Railroad Retirement code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/TaxOnIRAsAmt/@retirementTaxPlanLiteralCd"/>
							<xsl:with-param name="Desc">Line 57 - Retirement Tax Plan Literal code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp/TotalTaxDeferredAmt"/>
							<xsl:with-param name="Desc">Line 61 - Form 8854 Total Tax Deferred amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/Form8854DeferredTaxGrp/ExpatriationCd"/>
							<xsl:with-param name="Desc">Line 61 - Form 8854 Expatriation code</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Line 63 - Divorced Spouse SSN:</td>  
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedSpouseSSN"/>
									</xsl:call-template>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@divorcedLiteralCd"/>
							<xsl:with-param name="Desc">Line 63 - Divorced Literal code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/CreditForRepaymentCd"/>
							<xsl:with-param name="Desc">Line 69d - Credit for repayment code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/CreditForRepaymentAmt"/>
							<xsl:with-param name="Desc">Line 69d - Credit for repayment amount</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxPaymentCd"/>
							<xsl:with-param name="Desc">Line 69d - Other tax payment code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="TargetNode" select="$FormData/OtherTaxPaymentAmt"/>
							<xsl:with-param name="Desc">Line 69d - Other tax payment amount</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="$FormData/SeparateMailingAddress">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Line 73e - Separate Mailing Address:</td>  
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/SeparateMailingAddress//AddressLine1Txt"/>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/SeparateMailingAddress//AddressLine2Txt"/>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="$FormData/SeparateMailingAddress/USAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="$FormData/SeparateMailingAddress/ForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="$FormData/SeparateMailingAddress/ForeignAddress">
										<span style="width:10px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SeparateMailingAddress/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
								</td>                          
							</tr>
						</xsl:if>
						<xsl:if test="$FormData/PowerOfAttorneySignedByInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row"><label><xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/PowerOfAttorneySignedByInd</xsl:with-param>
									</xsl:call-template>Sign Here box - Power Of Attorney Signed By Indicator</label>:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneySignedByInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/PowerOfAttorneySignedByInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/PowerOfAttorneyNm"/>
							<xsl:with-param name="Desc">Sign Here box - Power Of Attorney Name</xsl:with-param>
						</xsl:call-template>
						<xsl:if test="$FormData/PersonalRepresentativeInd">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row"><label><xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
										<xsl:with-param name="BackupName">IRS1040NR/PersonalRepresentativeInd</xsl:with-param>
									</xsl:call-template>Sign Here box - Personal Representative Indicator</label>:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PersonalRepresentativeInd"/>
											<xsl:with-param name="BackupName">IRS1040NR/PersonalRepresentativeInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="$FormData/DaytimePhoneNum">
							<tr>
								<td class="styLeftOverTableRowDesc" style="width:100mm;" scope="row">Sign Here box - Daytime Phone Number:</td>
								<td class="styLeftOverTableRowAmount" style="width:87mm;">
									<xsl:call-template name="PopulatePhoneNumber">
										<xsl:with-param name="TargetNode" select="$FormData/DaytimePhoneNum"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OptionalForeignTelephoneNum"/>
							<xsl:with-param name="Desc">Sign Here box - Optional Foreign Telephone Number</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/NonPaidPreparerCd"/>
							<xsl:with-param name="Desc">Paid Preparer box - Non Paid Preparer Code</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/RefundAnticipationLoanCd"/>
							<xsl:with-param name="Desc">Paid Preparer box - Refund Anticipation Loan Code</xsl:with-param>
						</xsl:call-template>
					</table>
					<xsl:if test="$FormData/SpecialConditionDesc">
						<br /><br />
						<span class="styRepeatingDataTitle">Top Left Header - Special Condition Description</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">Special Condition Description</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SpecialConditionDesc">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/DependentDetail and not(($Print = $Separated) and count($FormData/DependentDetail) &gt; 4)">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 7c(1) - Dependent Name Controls</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:91.5mm;">Dependent name control</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DependentDetail">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and count($FormData/DependentDetail) &gt; 4">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 7c - Dependents</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:77mm;">(1) First Name <span style="width:6mm;"/> Last Name <span style="width:15mm;"/> Name Control</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;">(2) Dependent's identifying number</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;">(3) Dependent's relationship to you</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;">(4) &#10004; if qualifying child for child tax credit (see instr.)</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/DependentDetail">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentFirstNm"/>
											</xsl:call-template>
											<span style="width:8px;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentLastNm"/>
											</xsl:call-template>
											<div style="width:8mm;float:right;text-align:right;padding-right:2px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DependentNameControlTxt"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="styTableCellText" style="text-align:center;">
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
										<td class="styTableCellText" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DependentRelationshipCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="text-align:center;">
											<input type="checkbox" class="sty1040NRCkbox" style="margin:0px;">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">SepIRS1040NR/Dependent<xsl:value-of select="position()"/>/ChildCreditInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label style="font-size:0pt;">
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="EligibleForChildTaxCreditInd"/>
													<xsl:with-param name="BackupName">SepIRS1040NR/Dependent<xsl:value-of select="position()"/>/ChildCreditInd</xsl:with-param>
												</xsl:call-template>Eligible for child tax credit</label>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/WagesNotShownGrp">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 8 - Wages Not Shown</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Wages Not Shown literal/code</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Wages Not Shown amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/WagesNotShownGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:choose>
												<xsl:when test="WagesLiteralCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="WagesLiteralCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherWagesNotShownTxt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="WagesNotShownAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/IRADistributionsGrp">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 16 - IRA Distributions</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">IRA Distributions literal</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">IRA Distributions amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IRADistributionsGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IRADistributionsLiteralCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IRADistributionsLiteralAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/PensionsAnnuitiesGrp">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 17b - Pension Annuities</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Pension Annuities literal</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Pension Annuities amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/PensionsAnnuitiesGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PensionsAnnuitiesLiteralCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PensionsAnnuitiesLiteralAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/OtherIncomeTypeGrp">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 21 - Other Income</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Income literal/code</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Income amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherIncomeTypeGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:choose>
												<xsl:when test="OtherIncomeLitCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherIncomeLitCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherIncomeCodeTxt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/OtherAdjustmentsGrp">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 35 - Other Adjustments</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Adjustments literal/code</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Adjustments amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherAdjustmentsGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:choose>
												<xsl:when test="OtherAdjustmentsLitCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherAdjustmentsLitCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherAdjustmentsCodeTxt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherAdjustmentsAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/OtherTaxGrp">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 60b - Other Tax</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Tax literal/code</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Tax amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherTaxGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:choose>
												<xsl:when test="OtherTaxLitCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherTaxLitCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="OtherTaxTxt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherTaxAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/OtherWithholdingGrp">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 62a - Other Withholding</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Withholding literal/code</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Withholding amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherWithholdingGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:choose>
												<xsl:when test="WithholdingCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="WithholdingCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="WithholdingTxt"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="WithholdingAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/InterestPenaltyTypeAndAmt">
						<br /><br />
						<span class="styRepeatingDataTitle">Line 75 - Interest Penalty (Form 1040NR instructions, pg. 55)</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Interest Penalty type</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Interest Penalty amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/InterestPenaltyTypeAndAmt">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/UnreimbursedExpenseGrp">
						<br /><br />
						<span class="styRepeatingDataTitle">Schedule A, Line 7 - Unreimbursed Expenses</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Unreimbursed Expense type</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Unreimbursed Expense amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/UnreimbursedExpenseGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/OtherExpenseDetail">
						<br /><br />
						<span class="styRepeatingDataTitle">Schedule A, Line 9 - Other Expenses</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Expense type</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Expense amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherExpenseDetail">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData/OtherMiscDedTypeAndAmt">
						<br /><br />
						<span class="styRepeatingDataTitle">Schedule A, Line 14 - Other Miscellaneous Deductions</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Miscellaneous Deductions type</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Other Miscellaneous Deductions amount</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OtherMiscDedTypeAndAmt">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:91.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$FormData//OtherIncomeTyp">
						<br /><br />
						<span class="styRepeatingDataTitle">Schedule NEC, Line 12 - Other Income Type</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:140mm;">Other Income Description</th>
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:20mm;">Tax Rate</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IncomeTaxRt10UndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											10%
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="priorA" select="count($FormData/IncomeTaxRt10UndTrtyRuleGrp/OtherIncomeTyp)"/>
								<xsl:for-each select="$FormData/IncomeTaxRt15UndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $priorA) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											15%
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="priorB" select="$priorA + count($FormData/IncomeTaxRt15UndTrtyRuleGrp/OtherIncomeTyp)"/>
								<xsl:for-each select="$FormData/IncomeTaxRt30UndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $priorB) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											30%
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="priorC" select="$priorB + count($FormData/IncomeTaxRt30UndTrtyRuleGrp/OtherIncomeTyp)"/>
								<xsl:for-each select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $priorC) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="../TaxRt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="priorD" select="$priorC + count($FormData/IncomeTaxRtOthUndTrtyRuleGrp/OtherIncomeTyp)"/>
								<xsl:for-each select="$FormData/IncomeTaxRtOth2UndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $priorD) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="../TaxRt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="(($Print = $Separated) and (count($FormData/CapGainLossSlsOrExchPropGrp) &gt; 6)) or (($Print = 'inline') and (count($FormData/CapGainLossSlsOrExchPropGrp) &gt; 12))">
						<br /><br />
						<span class="styRepeatingDataTitle">Schedule NEC, Line 16 - Capital Gains and Losses From Sales or Exchanges of Property</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:35mm;">(a) Kind of property and description</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">(b) Date acquired</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">(c) Date sold</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">(d) Sales price</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">(e) Cost or other basis</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">(f) LOSS</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">(g) GAIN</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/CapGainLossSlsOrExchPropGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:35mm;text-align:left;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SoldDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:28mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SalesPriceAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:28mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:28mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:28mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="($Print = $Separated) and (count($FormData/EnteredDepartedUSGrp) &gt; 8)">
						<br /><br />
						<span class="styRepeatingDataTitle">Schedule OI, Line G - Other Miscellaneous Deductions</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Entered U.S. date</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Departed U.S. date</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/EnteredDepartedUSGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;text-align:center;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="EnteredUSDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:91.5mm;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DepartedUSDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- $L1Data is a way to conglomerate all of the different line L(1) schema groups into a single XPath grouping. 
							The second part is to exclude IndiaStandardDedTaxTreatyGrp (line 38), if present -->
					<xsl:variable name="SepL1Data" select="$FormData/*[contains(local-name(),'TreatyGrp') and not(contains(local-name(),'Tax'))]"/>
					<xsl:variable name="SepCL1" select="count($SepL1Data)"/>
					<xsl:if test="($Print = $Separated) and ($SepCL1 &gt; 3)">
						<br /><br />
						<span class="styRepeatingDataTitle">Schedule OI, Line L(1) - Income Exempt From Income Tax Under U.S. Income Tax Treaty</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:35mm;">Country</th>
									<th class="styDepTblCell" scope="col" style="width:39mm;">Tax treaty article</th>
									<th class="styDepTblCell" scope="col" style="width:39mm;">Number of months claimed in prior tax years</th>
									<th class="styDepTblCell" scope="col" style="width:39mm;">Amount of exempt income in current tax year</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$SepL1Data">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:35mm;text-align:center;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:39mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TaxTreatyArticleCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:39mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MnthExemptClmPriorTYNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:39mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExemptIncomeCurrentTYAmt"/>
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
	<xsl:template name="SchNECtable1">
		<xsl:param name="NECTarget" select="/.."/>
		<xsl:param name="NECName">None</xsl:param>
		<xsl:param name="NECLine"/>
		<div class="styLNRightNumBox"><xsl:value-of select="$NECLine"/></div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt10UndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt15UndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt30UndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOth2UndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
	</xsl:template>
</xsl:stylesheet>