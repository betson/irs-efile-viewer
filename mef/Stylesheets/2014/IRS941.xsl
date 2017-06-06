<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS941Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS941"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
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
				<meta name="Description" content="IRS Form 941"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS941Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="IRS941">
					<xsl:call-template name="DocumentHeader"/>
					<!-- BEGIN FORM HEADER -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInfoStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/TransferOfBusinessStatement"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleR"/>
						</xsl:call-template>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleD"/>
						</xsl:call-template>
						<br/>
						<div class="styFNBox" style="width:43mm;height:10mm;border:0px;">
						Form
						<span class="styFormNumber" style="font-size:15pt;">  
							941 for 2014:
						</span>
							<div class="styFST" style="height:4mm;">
								<span class="styAgency" style="font-weight:normal">(Rev. January 2014)</span>
							</div>
						</div>
						<div class="styFTBox" style="width:100mm;text-align:left;height:10mm;">
							<div class="styMainTitle" style="font-size:12pt;padding-top:1mm;">
							Employer’s QUARTERLY Federal Tax Return
						</div>
							<div class="styFST" style="height:4mm;">
								<span class="styAgency" style="font-weight:normal">Department of the Treasury — Internal Revenue Service</span>
							</div>
						</div>
						<div class="styTYBox" style="width:43.7mm;height:10mm;border:0px;">
							<div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;padding-left:28mm;">950114</div>
							<div class="styOMB" style="font-size:7pt;text-align:right;border:0px;padding-top:1mm;">OMB No. 1545-0029</div>
						</div>
						<div class="styBB" style="width:128mm;height:auto;float:left;border:black solid 1px;padding-top:2mm;padding-left:2mm;padding-right:2mm;">
							<div style="width:124mm;padding-top:0mm;">
								<span style="float:left;padding-top:2mm;">
									<b>Employer identification number</b> (EIN)</span>
								<span class="styLNCtrNumBox" style="width:72mm;border-top-width:1px;padding-top:1mm;float:right;height:6mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										<xsl:with-param name="EINChanged">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<!-- 5/13/2015 AM: Adjusted Filer name and Trade name height from 8mm to auto (font 6pt) per Defect 42786 -->
							<div style="width:124mm;height:16mm;padding-bottom:2mm;padding-top:2mm;">
								<span style="float:left;padding-top:4mm;">
									<b>Name</b>
									<i> (not your trade name)</i>
								</span>
								<span class="styLNCtrNumBox" style="width:86mm;border-top-width:1px;padding-left:1mm;float:right;text-align:left;height:auto;font-size:6pt;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:124mm;height:13mm;padding-bottom:2mm;">
								<span style="float:left;padding-top:4mm;">
									<b>Trade name</b>
									<i> (if any)</i>
								</span>
								<span class="styLNCtrNumBox" style="width:96mm;border-top-width:1px;padding-left:1mm;text-align:left;float:right;height:auto;font-size:6pt;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</span>
							</div>
							<div style="width:124mm;padding-bottom:0mm;">
								<span style="width:14mm;height:15mm;float:left;font-weight:bold;">Address</span>
								<span class="styLNCtrNumBox" style="width:110mm;height:7mm;float:right;border-top-width:1px;padding-left:1mm;text-align:left;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>&nbsp;
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:108mm;font-size:6pt;padding-left:3mm;">
									Number<span style="width:16mm"/>Street<span style="width:50mm;"/>Suite or room number
								</span>
								<span class="styLNCtrNumBox" style="width:66mm;border-top-width:.2px;height:6.9mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityNm</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:13mm;border-top-width:1px;padding-top:1mm;height:6.8mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">StateAbbreviationCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
								<span class="styLNCtrNumBox" style="width:26mm;border-top-width:1px;padding-top:1mm;height:6.8mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">ZIPCd</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:124mm;font-size:6pt;padding-left:15mm;">
									<span style="width:66mm;">City</span>
									<span style="width:13mm;text-align:center;">State</span>
									<span style="width:24mm;text-align:center;">ZIP code</span>
								</span>
								<span style="width:124mm;padding-left:14mm;">
									<span class="styLNCtrNumBox" style="width:52mm;height:6.9mm;border-top-width:1px;padding-top:1mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:29mm;border-top-width:1px;height:6.9mm;word-wrap:break-word;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ProvinceOrStateNm</xsl:with-param>
										</xsl:call-template>
									</span>
									<span class="styLNCtrNumBox" style="width:2.5mm;float:left;border:none"/>
									<span class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;height:6.9mm;word-wrap:break-word;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">ForeignPostalCd</xsl:with-param>
										</xsl:call-template>
									</span>
								</span>
								<span style="width:124mm;font-size:6pt;padding-left:14mm;">
									<span style="width:53mm;padding-left:1mm;">Country</span>
									<span style="width:29mm;text-align:center;">Foreign province/county</span>
									<span style="width:24mm;text-align:center;">Foreign postal code</span>
								</span>
							</div>
						</div>
						<div style="width:56mm;float:right;padding-right:2mm;">
							<div class="styBB" style="width:54mm;height:50mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:49mm;height:9mm;text-align:left;padding-left:1mm;padding-top:0.4mm;padding-bottom:0.4mm;font-family:Arial Narrow;font-size:10pt;">Report for this Quarter of 2014<br/>
									<span style="font-size:7pt;">(Check one.)</span>
								</div>
								<xsl:variable name="Date">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
									</xsl:call-template>
								</xsl:variable>
								<div style="width:49mm;float:none;clear:both;">
									<div style="width:49mm;float:none;clear:both;">
										<div style="width:49mm;padding-top:1.6mm;float:none;clear:both;">
											<input type="checkbox" class="styCkbox" alt="First Quarter: January, February, March">
												<xsl:call-template name="PopulateEnumeratedCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS941QuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS941QuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
												<b>1:</b> January, February, March 
											</label>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:2.6mm;">
												<input type="checkbox" class="styCkbox" alt="Second Quarter: April, May, June">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
													<b>2:</b> April, May, June
												</label>
											</div>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:2.6mm;">
												<input type="checkbox" class="styCkbox" alt="Third Quarter: July, August, September">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
													<b>3:</b> July, August, September
												</label>
											</div>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:2.6mm;padding-bottom:1.6mm;">
												<input type="checkbox" class="styCkbox" alt="Fourth Quarter: October, November, December">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS941QuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
													<b>4:</b> October, November, December
												</label>
											</div>
										</div>
									</div>
								</div>
								<div style="width:51mm;padding-bottom:0mm;float:none;clear:both;">
									Instructions and prior year forms are available at <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form941" title="Link to IRS.gov">
										<i>www.irs.gov/form941</i>.</a>
								</div>
							</div>
						</div>
					</div>
					<div class="styLNDesc" style="width:187mm;">
					Read the separate instructions before you complete Form 941. Type or print within the boxes.
				</div>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:4mm;padding-top:0mm;">Part 1:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;">Answer these questions for this quarter.</div>
					</div>
					<div style="width:187mm;padding-left:0mm;padding-top:2mm;padding-bottom:0px;">
						<!--Line 1-->
						<div style="width:187mm;height:8mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">1</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
								Number of employees who received wages, tips, or other compensation for the pay period<br/>
								including: <i>Mar. 12</i> (Quarter 1), <i>June 12</i> (Quarter 2), <i>Sept. 12</i> (Quarter 3), or <i>Dec. 12</i> (Quarter 4)
							</div>
							</span>
							<span style="float:right;padding-top:2mm;">
								<div class="styIRS941RightNumBox">1</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/EmployeeCnt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 2-->
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">2</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Wages, tips, and other compensation </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</div>
							</span>
							<span style="float:right">
								<div class="styIRS941RightNumBox">2</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 3-->
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">3</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
									<span style="float:left;">Federal income tax withheld from wages, tips, and other compensation </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">3</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 4-->
						<div style="width:187mm;height:6mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;">4</div>
							<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
							If no wages, tips, and other compensation are subject to social security or Medicare tax
						</div>
							<div class="styIRS941RightNumBox"/>
							<input type="checkbox" class="styCkbox" alt="Wages are not subject to Social Security or Medicare tax">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
									<xsl:with-param name="BackupName">941WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/WagesNotSubjToSSMedcrTaxInd"/>
									<xsl:with-param name="BackupName">941WagesNotSubjToSSMedcrTaxInd</xsl:with-param>
								</xsl:call-template>
								<b>
									<span style="width:1mm;"/>Check and go to line 6.</b>
								<br/>
							</label>
						</div>
						<!--Line 5 Header-->
						<div style="width:187mm">
							<span style="width:60mm;"/>
							<span style="width:36mm;font-weight:bold;text-align:center;">Column 1</span>
							<span style="width:14mm;"/>
							<span style="width:36mm;font-weight:bold;text-align:center;">Column 2</span>
						</div>
						<!--Line 5a-->
						<div style="width:187mm;height:6mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5a</div>
							<div class="styLNDesc" style="width:52mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
								<span style="float:left;">Taxable social security wages </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxCashWagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:1mm;">
							x .124 =
						</div>
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWageAndTaxGrp/SocialSecurityTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5b-->
						<div style="width:187mm;height:6mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5b</div>
							<div class="styLNDesc" style="width:52mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
								<span style="float:left;">Taxable social security tips </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
							</div>
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxableSocSecTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:1mm;">
							x .124 =
						</div>
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAndTaxGrp/TaxOnSocialSecurityTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5c-->
						<div style="width:187mm;height:6mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5c</div>
							<div class="styLNDesc" style="width:52mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
								<span style="float:left;">Taxable Medicare wages &amp; tips </span>
								<!--Dotted Line-->
								<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxableMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:1mm;">
							x .029 =
						</div>
							<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MedicareWageTipsAndTaxGrp/TaxOnMedicareWagesTipsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Line 5d-->
						<div style="width:187mm;height:6mm;">
							<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5d</div>
							<div class="styLNDesc" style="width:52mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
							Taxable wages &amp; tips subject to<br/>Additional Medicare Tax withholding
						</div>
							<div style="float:left;padding-top:2mm;">
								<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TxblWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:14mm;text-align:center;padding-top:1mm;">
								x .009 =
							</div>
								<div class="styLNCtrNumBox" style="width:36mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareWageTipsAndTaxGrp/TaxOnWageTipsSubjAddnlMedcrAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
						<!--Line 5e-->
						<div style="width:187mm;height:auto;padding-top:3mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5e</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
									<span style="float:left;">Add Column 2 from lines 5a, 5b, 5c, and 5d </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">5e</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalSSMdcrTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 5f-->
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">5f</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
									<span style="float:left;">
										<b>Section 3121(q) Notice and Demand—Tax due on unreported tips</b> (see instructions) </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">5f</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxOnUnreportedTips3121qAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 6-->
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">6</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
									<span style="float:left;">
										<b>Total taxes before adjustments</b>. Add lines 3, 5e, and 5f </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">6</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 7-->
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">7</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
									<span style="float:left;">Current quarter’s adjustment for fractions of cents </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">7</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<!-- 7/9/2015 AM: Per KISAM IM02060648, choose statement added to properly display negative numbers and cents only.-->
									<xsl:choose>
										<xsl:when test="starts-with($FormData/CurrentQtrFractionsCentsAmt,'-') or starts-with($FormData/CurrentQtrFractionsCentsAmt,'.')">
											<span style="color:darkblue;">
												<xsl:call-template name="PlaceCommas">
													<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/CurrentQtrFractionsCentsAmt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</span>
						</div>
						<!--Line 8-->
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">8</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
									<span style="float:left;">Current quarter’s adjustment for sick pay </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">8</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CurrentQuarterSickPaymentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 9-->
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;padding-top:1mm;">9</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;font-weight:bold;">
									<span style="float:left;">Current quarter’s adjustments for tips and group-term life insurance </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">9</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CurrQtrTipGrpTermLifeInsAdjAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 10-->
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">10</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
									<span style="float:left;">
										<b>Total taxes after adjustments.</b> Combine lines 6 through 9 </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">10</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 11-->
						<div style="width:187mm;height:9mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">11</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
								Total deposits for this quarter, including overpayment applied from a prior quarter and
								<span style="float:left;">overpayment applied from Form 941-X, 941-X (PR), 944-X, or 944-X (SP) filed in the current quarter </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</div>
							</span>
							<span style="float:right;padding-top:2mm;">
								<div class="styIRS941RightNumBox">11</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 12-->
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">12</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;padding-top:1mm;">
									<span style="float:left;">
										<b>Balance due.</b> If line 10 is more than line 11, enter the difference and see instructions </span>
									<!--Dotted Line-->
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS941RightNumBox">12</div>
								<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- 9/15/2015 AM: Decreased font size to 6.5pt and adjusted width to fix overpayment amount (Defect 44718) -->
						<!--Line 13-->
						<div style="width:187mm;height:6mm;">
							<div class="styLNLeftNumBox" style="width:8mm;padding-top:1mm;">13</div>
							<div class="styLNDesc" style="width:83mm;font-size:6.5pt;padding-left:1mm;padding-top:1mm;">
								<b>Overpayment.</b> If line 11 is more than line 10, enter the difference
						</div>
							<div class="styLNCtrNumBox" style="width:32mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNDesc" style="width:16mm;text-align:center;padding-top:1mm;">
							Check one: 
						</div>
							<div style="width:48mm;padding-top:1mm;float:left;">
								<input type="checkbox" class="styCkbox" alt="Apply Overpayment to next return">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">941ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
										<xsl:with-param name="BackupName">941ApplyOverpaymentNextReturnInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:5.5pt;">Apply to next return.</span>
								</label>
								<input type="checkbox" class="styCkbox" alt="Send a Refund">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">941RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
										<xsl:with-param name="BackupName">941RefundOverpaymentInd</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:5.5pt;">Send a refund.</span>
								</label>
							</div>
						</div>
						<div style="width:187mm;height:6mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:4mm;text-align:center;padding-left:2mm;">
									<img src="{$ImagePath}/941_Bullet.gif" alt="Bullet Image"/>
								</div>
								<div class="styLNDesc" style="width:130mm;padding-left:1mm;font-weight:bold;">
								You MUST complete both pages of Form 941 and SIGN it.
							</div>
							</span>
							<span style="float:right;">
								<div style="width:30mm;text-align:right;padding-bottom:2mm;">
									<img src="{$ImagePath}/941_Next.gif" alt="Next Page Arrow Image"/>
								</div>
							</span>
						</div>
					</div>
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;border-top-width:1px;">
						<span style="float:left;clear:none;font-weight:bold;">For Privacy Act and Paperwork Reduction Act Notice, see the back of the Payment Voucher.</span>
						<span style="float:left;clear:none;margin-left:5mm;">Cat. No. 17001Z</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">941</span> (Rev. 1-2014)</span>
					</div>
					<p style="page-break-before: always"/>
					<!--Begin Page 2-->
					<div style="width:187mm;">
						<div style="width:187mm;font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;">950214</div>
						<!--Name Shown on return-->
						<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
							<div class="styFNBox" style="width:126mm; height:9mm;">
								<b>Name</b>
								<i> (not your trade name)</i>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
							</div>
							<b>Employer identification number (EIN)</b>
							<br/>
							<div style="text-align:center;padding-top:2.5mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Part 2-->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;">Part 2:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;">Tell us about your deposit schedule and tax liability for this quarter.</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:8mm;font-weight:bold;padding-left:2mm;">
			If you are unsure about whether you are a monthly schedule depositor or a semiweekly schedule depositor, see Pub. 15 (Circular E), section 11.
		</div>
					<!--Line 14-->
					<div style="width:187mm;padding-bottom:3mm;padding-top:1mm;">
						<div class="styLNLeftNumBox" style="width:6mm;">14</div>
						<div class="styLNDesc" style="width:17mm;padding-left:1mm;height:20mm">
							<b>Check one:</b>
						</div>
						<span style="vertical-align:top;">
							<input type="checkbox" class="styCkbox" alt="Total Tax is less than the limit">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
									<xsl:with-param name="BackupName">941TotalTaxLessThanLimitAmtInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLessThanLimitAmtInd"/>
								<xsl:with-param name="BackupName">941TotalTaxLessThanLimitAmtInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:158mm;font-size:6pt;padding-top:1mm;">
								<b>Line 10 on this return is less than $2,500 or line 
					10 on the return for the prior quarter was less than $2,500, and you did not incur a $100,000 next-day deposit 
					obligation during the current quarter.</b> If line 10 for the prior quarter was less than $2,500 but line 10 on this 
					return is $100,000 or more, you must provide a record of your federal tax liability. If you are a monthly schedule 
					depositor, complete the deposit schedule below; if you are a semiweekly schedule depositor, attach Schedule 
					B (Form 941). Go to Part 3.
				</span>
						</label>
						<br/>
						<br/>
						<input type="checkbox" class="styCkbox" alt="Monthly schedule depositor for the entire quarter">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">941MonthlyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/MonthlyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">941MonthlyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:158mm;vertical-align:top;padding-top:1mm;">
								<b>You were a monthly schedule depositor for the entire quarter.</b> Enter your 
				tax liability for each month and total liability for the quarter, then go to Part 3.
				</span>
						</label>
					</div>
					<div style="width:187mm;height:7mm;">
						<div class="styLNDesc" style="font-weight:bold;width:66mm;padding-top:1mm;padding-left:32mm;text-align:right;padding-right:4mm;">
							<div style="float:left;text-align:left;">Tax liability:</div>Month 1
			</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth1Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;height:7mm;">
						<div class="styLNDesc" style="font-weight:bold;width:66mm;padding-right:4mm;padding-left:32mm;padding-top:1mm;text-align:right;">
				Month 2
			</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth2Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;height:7mm;">
						<div class="styLNDesc" style="font-weight:bold;width:66mm;padding-right:4mm;padding-left:32mm;padding-top:1mm;text-align:right;">
				Month 3
			</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TaxLiabilityMonth3Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;height:6mm;">
						<div class="styLNDesc" style="font-weight:bold;width:66mm;padding-top:1mm;text-align:right;padding-right:4mm;">
				Total liability for quarter
			</div>
						<div class="styLNCtrNumBox" style="width:37mm;border-top-width:1px;height:5mm;text-align:right;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorGrp/TotalQuarterTaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="font-weight:bold;width:40mm;padding-left:2mm;padding-top:1mm;">
				Total must equal line 10.
			</div>
					</div>
					<div style="width:187mm;padding-left:24mm; padding-bottom:3mm;">
						<input type="checkbox" class="styCkbox" alt="Semiweekly schedule depositor for any part of this quarter">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">941SemiweeklyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">941SemiweeklyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:155mm;vertical-align:top;">
								<b>You were a semiweekly schedule depositor for any part of this quarter.</b> 
				Complete Schedule B (Form 941), Report of Tax Liability for Semiweekly Schedule Depositors, and attach 
				it to Form 941.
				</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
							</xsl:call-template>
						</label>
					</div>
					<!--Part 3-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;">Part 3:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;">Tell us about your business. If a question does NOT apply to your business, leave it blank.</div>
					</div>
					<!--Line 15-->
					<div style="width:187mm;padding-bottom:2mm;padding-top:2mm;">
						<div class="styLNLeftNumBox" style="width:8mm;">15</div>
						<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
				If your business has closed or you stopped paying wages
				<span class="styBoldText">
								<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
				</span>
						</div>
						<input type="checkbox" class="styCkbox" alt="Final Return. Future Filing Not Required">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
								<xsl:with-param name="BackupName">941FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FutureFilingNotRequiredInd"/>
								<xsl:with-param name="BackupName">941FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:1mm;"/>Check here, and<br/>
							<br/>
						</label>
						<div class="styLNDesc" style="width:56mm;padding-left:9mm;padding-top:1mm;">
				enter the final date you paid wages
			</div>
						<div class="styLNCtrNumBox" style="width:31mm;border-top-width:1px;height:5mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessClosedGrp/FinalWagesPaidDt"/>
							</xsl:call-template>
						</div>
						<div style="padding-top:1mm">.</div>
					</div>
					<!--Line 16-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:8mm;">16</div>
						<div class="styLNDesc" style="width:147mm;padding-left:1mm;font-weight:bold;">
				If you are a seasonal employer and you do not have to file a return for every quarter of the year
				<span class="styBoldText">
								<span style="width:10px"/>.
					<span style="width:10px"/>.
				</span>
						</div>
						<input type="checkbox" class="styCkbox" alt="Seasonal employer, quarterly returns not required">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
								<xsl:with-param name="BackupName">941SeasonalEmployerInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/SeasonalEmployerInd"/>
								<xsl:with-param name="BackupName">941SeasonalEmployerInd</xsl:with-param>
							</xsl:call-template>
							<span style="width:1mm;"/>Check here.<br/>
						</label>
					</div>
					<!--Part 4-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;">Part 4:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;">May 
			we speak with your third-party designee?</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:auto;padding-left:9mm;padding-bottom:2mm;">
						<b>Do you want to allow an employee, a paid tax preparer, or another person to discuss this return with the IRS?</b> 
			See the instructions for details.
		</div>
					<div style="width:187mm;float:none;clear:both;padding-bottom:1mm;">
						<div style="width:19mm;float:left;padding-top:1mm;">
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="Yes, you may discuss the return with a third party">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										<xsl:with-param name="BackupName">941DiscussWithThirdPartyYesInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
									<xsl:with-param name="BackupName">941DiscussWithThirdPartyYesInd</xsl:with-param>
								</xsl:call-template>
					Yes.
				</label>
							<br/>
							<br/>
							<br/>
							<br/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkbox" alt="No, do not discuss the return with a third party">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
										<xsl:with-param name="BackupName">941DiscussWithThirdPartyNoInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
									<xsl:with-param name="BackupName">941DiscussWithThirdPartyNoInd</xsl:with-param>
								</xsl:call-template>
					No.
				</label>
						</div>
						<div style="width:167mm;float:right;">
							<div style="width:167mm;height:6mm;">
								<div class="styLNDesc" style="width:50mm;height:6mm;float:left;padding-top:2mm;">Designee’s name and phone number </div>
								<div class="styLNCtrNumBox" style="width:60mm;height:7.5mm;border-top-width:1px;padding-top:.5mm;float:left;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
									</xsl:call-template>
								</div>
								<span class="styLNCtrNumBox" style="width:10mm;border:none"/>
								<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:7.5mm;padding-top:.5mm;word-wrap:break-word;">
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:167mm;height:6mm;padding-top:3mm;">
								<div class="styLNDesc" style="width:112.6mm;padding-top:1.5mm;">
						Select a 5-digit Personal Identification Number (PIN) to use when talking to the IRS.
					</div>
								<div style="float:left;">
									<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;float:left;">
										<xsl:call-template name="PopulatePin">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Part 5-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:13mm;text-align:center;height:6mm;padding-top:1mm;">Part 5:</div>
						<div class="styPartDesc" style="width:173.9mm;text-align:left;height:6mm;padding-top:1mm;padding-left:2mm;">Sign here. You MUST complete both pages of Form 941 and SIGN it.</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:8mm;padding-left:2mm;font-size:6pt;">
			Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and 
			statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other 
			than taxpayer) is based on all information of which preparer has any knowledge.
		</div>
					<div style="width:187mm;float:none;clear:both;">
						<div style="padding-right:5mm;float:left;padding-bottom:2mm;">
							<img src="{$ImagePath}/941_Signature.GIF" alt="Signature Image"/>
						</div>
						<div style="width:22mm;height:15mm;padding-top:3mm;font-weight:bold;font-size:9pt;float:left;">
				Sign your name here
			</div>
						<div class="styLNCtrNumBox" style="width:75mm;border-top-width:1px;height:15mm;float:left;word-wrap:break-word;text-align:left;padding-left:1mm;padding-right:1mm;">
							<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/PIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN">
								<xsl:call-template name="PopulatePin">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="width:72.5mm;height:15mm;float:left;padding-left:4mm;padding-top:0mm;">
							<div style="height:10mm;">
								<div style="width:17mm;float:left;">Print your name here</div>
								<div style="height:5mm;padding-top:1mm;float:right;padding-right:2mm;">
									<div class="styLNCtrNumBox" style="width:48mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
							</div>
							<div style="height:7mm;">
								<div style="width:17mm;float:left;">Print your title here</div>
								<div style="padding-top:1mm;float:right;padding-right:2mm;">
									<div class="styLNCtrNumBox" style="width:48mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;padding-top:4mm">
						<div class="styLNDesc" style="width:39.4mm;text-align:right;padding-right:3mm;">
				Date
			</div>
						<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:5mm;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:67mm;padding-left:39mm;">
				Best daytime phone
			</div>
						<div class="styLNCtrNumBox" style="width:38.4mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:48mm;font-size:9pt;font-weight:bold;float:left;padding-left:5mm;">
				Paid Preparer Use Only
			</div>
						<div class="styLNDesc" style="width:63mm;float:right;">
				Check if you are self-employed
				<span style="width:2px;"/>
							<span class="styBoldText">
								<span style="width:10px"/>.
					<span style="width:10px"/>.
					<span style="width:10px"/>.
				</span>
							<input type="checkbox" class="styCkbox" alt="Self-employment Indicator">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">941SelfEmployedInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">941SelfEmployedInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">
				Preparer's name
			</div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:5mm;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:25mm;padding-left:8mm;">
				PTIN
			</div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
							<xsl:choose>
								<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">
				Preparer's signature
			</div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:5mm;word-wrap:break-word;text-align:left;padding-right:1mm;padding-left:1mm;">
			</div>
						<div class="styLNDesc" style="width:25mm;padding-left:8mm;">
				Date
			</div>
						<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:5mm;">
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- 5/13/2015 AM: Adjusted Firm name height from 5mm to auto per Defect 42786 -->
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:0mm;padding-bottom:0mm;">
				Firm's name (or yours if self-employed)
			</div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</div>
						<div class="styLNDesc" style="width:25mm;padding-left:8mm;">
				EIN
			</div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">Address </div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:25mm;padding-left:8mm;">
				Phone
			</div>
						<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:7mm;word-wrap:break-word;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
								<xsl:call-template name="PopulatePhoneNumber">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!-- 9/23/2015 AM: Per Analyst discussion and Defect 44718, Height adjusted on all foreign address fields (city, prov./st., country, and postal code) to 10mm. -->
					<div class="styBB" style="width:187mm;padding-bottom:2mm;border-bottom-width:2px;">
						<xsl:choose>
							<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">
						City
					</div>
								<div class="styLNCtrNumBox" style="width:44mm;border-top-width:1px;height:10mm;padding-top:.5mm;text-align:left;padding-left:1mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:13mm;text-align:center;">
						Prov./St.
					</div>
								<div class="styLNCtrNumBox" style="width:20mm;border-top-width:1px;height:10mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:13mm;text-align:center;">
						Country
					</div>
								<div class="styLNCtrNumBox" style="width:8mm;border-top-width:1px;height:10mm;padding-top:2mm;word-wrap:break-word;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:20mm;padding-left:4mm;">
						Postal Code
					</div>
								<div style="float:right;padding-right:2mm;">
									<div class="styLNCtrNumBox" style="width:35mm;border-top-width:1px;height:10mm;padding-top:2mm;word-wrap:break-word;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">
						City
					</div>
								<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:5mm;text-align:left;padding-left:1mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:15mm;padding-left:5mm;">
						State
					</div>
								<div class="styLNCtrNumBox" style="width:10mm;border-top-width:1px;height:5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="width:24mm;padding-left:8mm;">
						ZIP code
					</div>
								<div style="float:right;padding-right:2mm;">
									<div class="styLNCtrNumBox" style="width:38mm;border-top-width:1px;height:5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;clear:none;">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</span>
						<span style="float:right;clear:none;">Form <span class="styBoldText" style="font-size:8pt;">941</span> (Rev. 1-2014)</span>
					</div>
					<!--END Page Footer-->
					<!-- BEGIN Left Over Table -->
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
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
