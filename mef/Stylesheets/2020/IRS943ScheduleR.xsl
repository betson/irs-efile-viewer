<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS943ScheduleRStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest. -->
	<xsl:param name="FormData" select="$RtnDoc/IRS943ScheduleR"/>
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
				<meta name="Description" content="IRS Form 943 Schedule R"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS943ScheduleRStyle"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass" style="width:256mm">
				<form name="IRS943ScheduleR">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- BEGIN FORM HEADER -->
					<!-- header -->
					<div class="styTBB" style="width:256mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styMainTitle" style="width:150mm;float:left;padding-top:2mm;">
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							Schedule R (Form 943):
							<span class="styFBT" style="font-size:9pt;padding-left:4mm;">Allocation Schedule for Aggregate Form 943 Filers</span>
						</div>
						<div style="width:190mm;float:left;">
							<div class="styAgency" style="line-height:150%;font-size:8pt;">(Rev. December 2020)
									<span class="styAgency" style="line-height:150%;padding-left:35mm;font-size:8pt;">Department of the Treasury—Internal Revenue Service</span>
								<span class="styAgency" style="line-height:150%;padding-left:35mm;font-size:8pt;">OMB No. 1545-0035</span>
							</div>
							<div class="styBB" style="width:185mm;height:22mm;border-top-width:1px;border-left-width:1px;border-right-width:1px;float:left;padding-left:2mm;padding-bottom:0mm;">
								<div style="width:130mm;padding-top:2mm;">
									<span style="float:left;">
										<b>Employer identification number (EIN)</b>
									</span>
									<span class="styLNCtrNumBox" style="width:73mm;height:auto;border-top-width:1px;padding-top:1mm;float:right;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
								<div style="width:180mm;padding-bottom:1mm;padding-top:1mm;">
									<span style="float:left;padding-top:1.4mm;">
										<b>Name</b>
										<i> as shown on Form 943</i>
									</span>
									<span class="styLNCtrNumBox" style="width:140mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>&nbsp;
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header Area - Business Name Control Text</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Business94XFilerGrp/BusinessNameControlTxt"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Header Area - In Care Of Name</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Business94XFilerGrp/InCareOfName"/>
										</xsl:call-template>
									</span>
								</div>
								<div style="width:180mm;padding-bottom:1mm;padding-top:0mm;">
									<span style="float:left;padding-top:.5mm;">
										<b>Type of filer</b> (check one):
									</span>
									<span style="float:left;clear:none;width:5mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<input type="checkbox" class="styCkbox" alt="Section 3504 Agent Indicator">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Section3504AgentInd"/>
												<xsl:with-param name="BackupName">IRS943ScheduleRSection3504AgentInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											Section 3504 Agent
										</label>
										<br/>
									</span>
									<span style="float:left;clear:none;width:25mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<input type="checkbox" class="styCkbox" alt="Certified Professional Employer Organization (CPEO)">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/CPEOInd"/>
												<xsl:with-param name="BackupName">IRS943ScheduleRCertifiedProfessionalEmployerOrganizationInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											CPEO
										</label>
										<br/>
									</span>
									<span style="float:left;clear:none;width:25mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<input type="checkbox" class="styCkbox" alt="Other Third Party">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherThirdPartyInd"/>
												<xsl:with-param name="BackupName">IRS943ScheduleROtherThirdPartyInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											Other Third Party
										</label>
										<br/>
									</span>
								</div>
							</div>
							<div class="styLNDesc" style="padding-top:1mm;width:190mm;height:8mm;padding-bottom:4mm;">
								Read the instructions before you complete Schedule R. Type or print within the boxes. Complete a separate line for the amounts allocated to each of
								your clients. The term “client” as used on this form includes the term “customer”. See the instructions.
							</div>
						</div>
						<div style="float:right;padding-bottom:0mm;">
							<div style="font-size:12pt;font-family:Courier New;font-weight:bold;padding-left:1mm;writing-mode:tb-rl">430120</div>
							<div class="styBB" style="width:54mm;height:18mm;border: black solid 2px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:48mm;height:auto;text-align:left;padding-left:1mm;">Report for 
									calendar year:</div>
								<div class="styBB" style="padding-top:1mm;width:48mm;border-bottom-width:0px;">
									<span style="width:53mm;padding-bottom:1mm;float:none;clear:both;">
										(Same as Form 943):
									</span>
									<span class="styLNCtrNumBox" style="width:20mm;border-top-width:1px;height:4mm;float:left;background-color:white;">										
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
										</xsl:call-template>
									</span>
								</div>
								
								<!--<xsl:variable name="Date">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
									</xsl:call-template>
								</xsl:variable>
								<div style="width:49mm;float:none;clear:both;">
									<div style="width:49mm;float:none;clear:both;">
										<div style="width:49mm;padding-top:.5mm;float:none;clear:both;">
											<input type="checkbox" alt="FirstQuarter" class="styCkbox">
												<xsl:call-template name="PopulateEnumeratedCheckbox">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS943QuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
													<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '03')"/>
													<xsl:with-param name="BackupName">IRS943QuarterEndingDt[1]</xsl:with-param>
												</xsl:call-template>
												<b>1:</b> January, February, March 
											</label>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:.5mm;">
												<input type="checkbox" alt="SecondQuarter" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS943QuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '06')"/>
														<xsl:with-param name="BackupName">IRS943QuarterEndingDt[2]</xsl:with-param>
													</xsl:call-template>
													<b>2:</b> April, May, June
												</label>
											</div>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:.5mm;">
												<input type="checkbox" alt="ThirdQuarter" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS943QuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '09')"/>
														<xsl:with-param name="BackupName">IRS943QuarterEndingDt[3]</xsl:with-param>
													</xsl:call-template>
													<b>3:</b> July, August, September
												</label>
											</div>
										</div>
										<div style="width:49mm;">
											<div style="float:left;clear:none;padding-top:.5mm;padding-bottom:0.5mm;">
												<input type="checkbox" alt="FourthQuarter" class="styCkbox">
													<xsl:call-template name="PopulateEnumeratedCheckbox">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS943QuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
														<xsl:with-param name="DisplayedCheckboxValue" select="concat(substring($Date, 1, 5), '12')"/>
														<xsl:with-param name="BackupName">IRS943QuarterEndingDt[4]</xsl:with-param>
													</xsl:call-template>
													<b>4:</b> October, November, December
												</label>
											</div>
										</div>-->
								<!--	</div>
								</div>-->
							</div>
						</div>
					</div>
					<div class="IRS943ScheduleRTableContainer" style="display:block;padding-top:1mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;">
							<thead class="styTableThead">
								<tr>
									<!-- Column a -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:26mm;">(a) Client’s EIN</div>
									</th>
									<!-- Column b -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:28mm;">(b) Type of wages<br/>
											<span style="font-weight:normal;">(CPEO Only)</span>
										</div>
									</th>
									<!-- Column c -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:33.5mm;">(c) Form 943, line 1</div>
									</th>
									<!-- Column d -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:25.1mm;">(d) Form 943, line 2</div>
									</th>
									<!-- Column e -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:26mm;">(e) Form 943, line 2a</div>
									</th>
									<!-- Column f -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:30.1mm;">(f) Form 943, line 2b</div>
									</th>
									<!-- Column g-->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:30mm;">(g) Form 943, line 4</div>
									</th>
									<!-- Column h-->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:25.4mm;">(h) Form 943, line 6</div>
									</th>
									<!-- Column i-->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="border-right-width:0px;height:10mm">
										<div style="width:25mm;vertical-align:none">(i) Form 943, line 8</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="NumberOfClientInfGrp" select="$FormData/PayerInformationGrp"/>
								<xsl:for-each select="$NumberOfClientInfGrp">
									<tr>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
												<xsl:choose>
													<xsl:when test="position() &gt; 5">
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="position()"/>
													</xsl:otherwise>
												</xsl:choose>
											</div>
											<div style="text-align:center;padding-top:1mm">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:center;border-right-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="WagesTypeCd"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/EmployeeCnt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/SocialSecurityTaxCashWagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/SocialSecurityQlfyPdSLWageAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/SocialSecurityQlfyPdFMLWageAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/MedicareTaxCashWagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/TotMedcrTaxCashWagesAddnlWhAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/FederalIncomeTaxWithheldAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($NumberOfClientInfGrp) &lt; 5">
									<xsl:call-template name="FillTable1Rows">
										<xsl:with-param name="LineNumber" select="5 - count($NumberOfClientInfGrp)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- line 6 to line 9 first table -->
					<div class="IRS943ScheduleRTableContainer" style="display:block">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
												6
											</div>
											<div style="text-align:left;padding-top:1mm;padding-left:1mm;width:50mm;colspan=2">
											<b>Subtotals for clients.</b> Add lines 1 through 5
											</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:34.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:25.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/SocialSecurityTaxCashWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:26.7mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/SocialSecurityQlfyPdSLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:31mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/SocialSecurityQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:30.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/MedicareTaxCashWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:26.2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/TotMedcrTaxCashWagesAddnlWhAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;width:25mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 7-->
								<tr>
								<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">
												7
											</div>
										<div style="text-align:left;padding-left:1mm;padding-top:.5mm;width:50mm;colspan=2;font-size:5.5pt;">
											<b>Enter the combined subtotal from line 9 of<br/>all Continuation Sheets for Schedule R</b>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:34.5mm;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:25.8mm;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:25.8mm;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:31mm;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:30.5mm;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:26.2mm;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;width:25mm;">
										<br/>
									</td>
								</tr>
								<!--Line 8-->
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:0.5mm;">
												8
											</div>
										<div style="text-align:left;padding-top:1mm;padding-left:1mm;width:50mm;colspan=2;font-size:5.5pt;">
											<b>Enter Form 943 amounts for your employees</b>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:34.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:25.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/SocialSecurityTaxCashWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:25.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/SocialSecurityQlfyPdSLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:31mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/SocialSecurityQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:30.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/MedicareTaxCashWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:26.2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/TotMedcrTaxCashWagesAddnlWhAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;width:25mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">
												9
											</div>
										<div style="text-align:left;padding-top:1mm;padding-left:1mm;width:50mm;colspan=2;">
											<b>Totals.</b> Add lines 6, 7, and 8.
											</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:34.5mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:25.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/SocialSecurityTaxCashWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:25.8mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/SocialSecurityQlfyPdSLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:31mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/SocialSecurityQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:30.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/MedicareTaxCashWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;width:26.2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/TotMedcrTaxCashWagesAddnlWhAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;width:25mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="IRS943ScheduleRTableContainer" style="display:block" id="SchRCtn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;">
							<thead class="styTableThead">
								<tr>
									<!-- Column j -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:33mm;padding-left:4mm;">(j) Form 943, line 10</div>
									</th>
									<!-- Column k -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(k) Form 943, line 12a</div>
									</th>
									<!-- Column l -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(l) Form 943, line 12b</div>
									</th>
									<!-- Column m -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(m) Form 943, line 12c</div>
									</th>
									<!-- Column n -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(n) Form 943, line 13</div>
									</th>
									<!-- Column o -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(o) Form 943, line 14a</div>
									</th>
									<!-- Column p-->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(p) Form 943, line 14b</div>
									</th>
									<!-- Column q-->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="border-right-width:0px;height:10mm">
										<div style="width:30mm;">(q) Form 943, line 14c</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="NumberOfClientInfGrp" select="$FormData/PayerInformationGrp"/>
								<xsl:for-each select="$NumberOfClientInfGrp">
									<tr>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
												<xsl:choose>
													<xsl:when test="position() &gt; 5">
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="position()"/>
													</xsl:otherwise>
												</xsl:choose>
											</div>
											<div style="text-align:right;padding-top:1mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/CurrentYearAdjustmentAmt"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/PayrollTaxCreditAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/NrfdblCrQlfySLFMLWagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/NrfdblEmplRtntnCrCOVIDAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/TotalTaxAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/TotalTaxDepositAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/DeferredPaymentEmplrShrSSTAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($NumberOfClientInfGrp) &lt; 5">
									<xsl:call-template name="FillSecTable1Rows">
										<xsl:with-param name="LineNumber" select="5 - count($NumberOfClientInfGrp)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="IRS943ScheduleRTableContainer" style="display:block">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
											6
											</div>
										<div style="width:28.4mm;text-align:right;padding-top:1mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/CurrentYearAdjustmentAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.6mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/NrfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/NrfdblEmplRtntnCrCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:32mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/DeferredPaymentEmplrShrSSTAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:30mm;text-align:right;border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
											7
											</div>
										<div style="width:28.4mm;text-align:right;padding-top:1mm">
											<br/>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.6mm;text-align:right;border-right-width:1px;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:32mm;text-align:right;border-right-width:1px">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:30mm;text-align:right;border-right-width:0px">
										<br/>
									</td>
								</tr>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
											8
											</div>
										<div style="width:28.4mm;text-align:right;padding-top:1mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/CurrentYearAdjustmentAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.6mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/NrfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/NrfdblEmplRtntnCrCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:32mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/DeferredPaymentEmplrShrSSTAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:30mm;text-align:right;border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
											9
											</div>
										<div style="width:28.4mm;text-align:right;padding-top:1mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/CurrentYearAdjustmentAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.6mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/NrfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/NrfdblEmplRtntnCrCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:32mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/DeferredPaymentEmplrShrSSTAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:30mm;text-align:right;border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--Third Table-->
					<div class="IRS943ScheduleRTableContainer" style="display:block">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;">
							<thead class="styTableThead">
								
								<tr>
									<!-- Column r-->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:33mm;padding-left:4mm;">(r) Form 943, line 14d</div>
									</th>
									<!-- Column s -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(s) Form 943, line 14e</div>
									</th>
									<!-- Column t -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(t) Form 943, line 14g</div>
									</th>
									<!-- Column u -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(u) Form 943, line 18</div>
									</th>
									<!-- Column v -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(v) Form 943, line 19</div>
									</th>
									<!-- Column w -->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(w) Form 943, lines 20</div>
									</th>
									<!-- Column x-->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="height:10mm">
										<div style="width:31mm;">(x) Form 943, line 21</div>
									</th>
									<!-- Column y-->
									<th class="IRS943ScheduleR_GenericCellHeader" scope="col" style="border-right-width:0px;height:10mm">
										<div style="width:30mm;">(y) Form 943, line 22</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="NumberOfClientInfGrp" select="$FormData/PayerInformationGrp"/>
								<xsl:for-each select="$NumberOfClientInfGrp">
									<tr>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
												<xsl:choose>
													<xsl:when test="position() &gt; 5">
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="position()"/>
													</xsl:otherwise>
												</xsl:choose>
											</div>
											<div style="text-align:right;padding-top:1mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/RfdblEmplRtntnCrCOVIDAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/TotAdvncPymtEmplrCrReqQtrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/QlfyWgsPdRtnEmplCOVIDAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/QHPExpnssWgsPdRtnEmplCOVIDAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS943ScheduleR_GenericCell" style="text-align:right;border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PayerAllocationInfoGrp/WorkOpportunityCreditAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($NumberOfClientInfGrp) &lt; 5">
									<xsl:call-template name="FillSecTable1Rows">
										<xsl:with-param name="LineNumber" select="5 - count($NumberOfClientInfGrp)"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="IRS943ScheduleRTableContainer" style="display:block">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
											6
											</div>
										<div style="width:28.4mm;text-align:right;padding-top:1mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.6mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/RfdblEmplRtntnCrCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/TotAdvncPymtEmplrCrReqQtrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:32mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/QlfyWgsPdRtnEmplCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/QHPExpnssWgsPdRtnEmplCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:30mm;text-align:right;border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtlPayerAllocationInfoGrp/WorkOpportunityCreditAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
											7
											</div>
										<div style="width:28.4mm;text-align:right;padding-top:1mm">
											<br/>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.6mm;text-align:right;border-right-width:1px;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:32mm;text-align:right;border-right-width:1px">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px">
										<br/>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:30mm;text-align:right;border-right-width:0px">
										<br/>
									</td>
								</tr>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
											8
											</div>
										<div style="width:28.4mm;text-align:right;padding-top:1mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.6mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/RfdblEmplRtntnCrCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/TotAdvncPymtEmplrCrReqQtrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:32mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/QlfyWgsPdRtnEmplCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/QHPExpnssWgsPdRtnEmplCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:30mm;text-align:right;border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AgriculturalEmployeeInfoGrp/WorkOpportunityCreditAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
											9
											</div>
										<div style="width:28.4mm;text-align:right;padding-top:1mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.6mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/RfdblEmplRtntnCrCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/TotAdvncPymtEmplrCrReqQtrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.8mm;text-align:right;border-right-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:32mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/QlfyWgsPdRtnEmplCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:31.7mm;text-align:right;border-right-width:1px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/QHPExpnssWgsPdRtnEmplCOVIDAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS943ScheduleR_GenericCell" style="width:30mm;text-align:right;border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalPayerAllocationInfoGrp/WorkOpportunityCreditAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--Third Table-->
					<!--Page Footer-->
					<div class="pageEnd" style="width:256mm;border-top-width:1px;border-bottom-width:0px;">
						<div style="font-weight:bold;width:90mm;float:left;padding-left:0mm;">
							For Paperwork Reduction Act Notice, see the instructions.
					  </div>
						<div style="width:90mm;float:left;text-align:center;padding-top:0.2mm">
							www.irs.gov/Form943<span style="width:20mm;"/>Cat. No. 69329E
					  </div>
						<div style="width:74mm;text-align:right;float:left;">
							<span style="font-weight:bold;">Schedule R (Form 943) (Rev. 12-2020)</span>
						</div>
					</div>
					<!--END Page Footer-->
					<div class="styLeftOverTitleLineLandscape" id="LeftOverData">
						<div class="styLeftOverTitle">
							Additional Data
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header Area - Business Name Control Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Business94XFilerGrp/BusinessNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="105"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header Area - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Business94XFilerGrp/InCareOfName"/>
							<xsl:with-param name="DescWidth" select="105"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="FillTable1Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr>
			<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
				<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">
					<xsl:number value="$MaxLine -  $LineNumber + 1"/>
				</div>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell" style="border-right-width:0px;">
				<br/>
			</td>
		</tr>
		<xsl:if test="$LineNumber &gt; 1">
			<xsl:call-template name="FillTable1Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber - 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillSecTable1Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr>
			<td class="IRS943ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
				<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">
					<xsl:number value="$MaxLine -  $LineNumber + 1"/>
				</div>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS943ScheduleR_GenericCell" style="border-right-width:0px;">
				<br/>
			</td>
		</tr>
		<xsl:if test="$LineNumber &gt; 1">
			<xsl:call-template name="FillSecTable1Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber - 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
