<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS941ScheduleRStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS941ScheduleR"/>
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
				<meta name="Description" content="IRS Form 941 Schedule R"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
					<xsl:call-template name="IRS941ScheduleRStyle"/>
					<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
				</style>
			</head>
			<xsl:variable name="Date">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
				</xsl:call-template>
			</xsl:variable>
			<!-- 5/10/2021 AM: Choice inserted based on COVID UWR 369520 to split Q1 and Q2-Q4 -->
			<xsl:choose>
				<xsl:when test="substring($Date, 6, 2) = '03'">			
				<body class="styBodyClass" style="width:256mm">
					<form name="IRS941ScheduleR">
						<xsl:call-template name="DocumentHeaderLandscape"/>
						<!-- BEGIN FORM HEADER -->
						<!-- header -->
						<div class="styTBB" style="width:256mm;border-bottom-width:0px;float:none;clear:both;">
							<div class="styMainTitle" style="width:150mm;float:left;padding-top:2mm;">
								<!--General Dependency Push Pin-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
								Schedule R (Form 941):
								<span class="styFBT" style="font-size:9pt;padding-left:4mm;">Allocation Schedule for Aggregate Form 941 Filers</span>
							</div>
							<div style="width:190mm;float:left;">
								<div class="styAgency" style="line-height:150%;font-size:8pt;">(Rev. March 2022)
									<span class="styAgency" style="line-height:150%;padding-left:35mm;font-size:8pt;">Department of the Treasury—Internal Revenue Service</span>
									<span class="styAgency" style="line-height:150%;padding-left:35mm;font-size:8pt;">OMB No. 1545-0029</span>
								</div>
								<div class="styBB" style="width:185mm;height:22mm;border-top-width:1px;border-left-width:1px;border-right-width:1px;float:left;padding-left:2mm;padding-bottom:0mm;">
									<div style="width:130mm;padding-top:2mm;">
										<span style="float:left;"><b>Employer identification number (EIN)</b></span>
										<span class="styLNCtrNumBox" style="width:73mm;height:auto;border-top-width:1px;padding-top:1mm;float:right;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<div style="width:180mm;padding-bottom:1mm;padding-top:1mm;">
										<span style="float:left;padding-top:1.4mm;">
											<b>Name</b>
											<i> as shown on Form 941</i>
										</span>
										<span class="styLNCtrNumBox" style="width:140mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											</xsl:call-template>	<br/>
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
										<span style="float:left;padding-top:.5mm;"><b>Type of filer</b> (check one):</span>
										<span style="float:left;clear:none;width:5mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
										<span style="float:left">
											<input type="checkbox" class="styCkbox" alt="Section 3504 Agent Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Section3504AgentInd"/>
													<xsl:with-param name="BackupName">IRS941ScheduleRSection3504AgentInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>Section 3504 Agent</label><br/>
										</span>
										<span style="float:left;clear:none;width:25mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
										<span style="float:left">
											<input type="checkbox" class="styCkbox" alt="Certified Professional Employer Organization (CPEO)">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/CPEOInd"/>
													<xsl:with-param name="BackupName">IRS941ScheduleRCertifiedProfessionalEmployerOrganizationInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>CPEO</label><br/>
										</span>
										<span style="float:left;clear:none;width:25mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
										<span style="float:left">
											<input type="checkbox" class="styCkbox" alt="Other Third  Party">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/OtherThirdPartyInd"/>
													<xsl:with-param name="BackupName">IRS941ScheduleROtherThirdPartyInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>Other Third Party	</label>	<br/>
										</span>
									</div>
								</div>
								<div class="styLNDesc" style="padding-top:1mm;width:190mm;padding-bottom:4mm;">
								Read the instructions before you complete Schedule R. Type or print within the boxes. Complete a separate
								line for the amounts allocated to each of your clients. The term “client” as used on this form includes the
								term “customer”. See the instructions.
								</div>
							</div>
							<div style="float:right;padding-bottom:0mm;">
								<div style="font-size:12pt;font-family:Courier New;font-weight:bold;padding-left:1mm;writing-mode:tb-rl">950422</div>
								<div class="styBB" style="width:54mm;height:auto;border: black solid 2px;padding-left:2mm;padding-top:1mm;">
									<div class="styPartName" style="width:48mm;height:auto;text-align:left;padding-left:1mm;">Report for 
									calendar year:</div>
									<div class="styBB" style="padding-top:1mm;width:48mm;border-bottom-width:0px;">
										<span class="styLNCtrNumBox" style="width:20mm;border-top-width:1px;height:4mm;float:left;background-color:white;">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											</xsl:call-template>
										</span>
									</div>
									<div style="width:53mm;padding-top:0.5mm;float:none;clear:both;">	Check the quarter (same as Form 941):</div>
									<div style="width:49mm;float:none;clear:both;">
										<div style="width:49mm;float:none;clear:both;">
											<div style="width:49mm;padding-top:.5mm;float:none;clear:both;">
												<input type="checkbox" alt="FirstQuarter" class="styCkbox">
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
												<div style="float:left;clear:none;padding-top:.5mm;">
													<input type="checkbox" alt="SecondQuarter" class="styCkbox">
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
												<div style="float:left;clear:none;padding-top:.5mm;">
													<input type="checkbox" alt="ThirdQuarter" class="styCkbox">
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
												<div style="float:left;clear:none;padding-top:.5mm;padding-bottom:0.5mm;">
													<input type="checkbox" alt="FourthQuarter" class="styCkbox">
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
								</div>
							</div>
						</div>
						
							<!--First Table -->
					<div class="IRS941ScheduleRTableContainer" style="display:block;padding-top:1mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;">
							<thead class="styTableThead">
								<tr>
									<!-- Column a -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-left-width:0px;">
										<div style="width:29mm; padding-left:2.5mm;">(a) Client’s EIN</div>
									</th>
									<!-- Column b -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:28.5mm;">(b) Type of wages<br/>
											<span style="font-weight:normal;">(CPEO Only)</span>
										</div>
									</th>
									<!-- Column c -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25mm;">(c) Form 941, line 1</div>
									</th>
									<!-- Column d -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.5mm;">(d) Form 941, line 2</div>
									</th>
									<!-- Column e -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.5mm;">(e) Form 941, line 3</div>
									</th>
									<!-- Column f -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:29.5mm;">(f) Form 941, line 5a(i) and 5a(ii), column 1, <br/>total</div>
									</th>
									<!-- Column g-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:28.5mm;">(g) Form 941, line 5a and 5b, column 2, total</div>
									</th>
									<!-- Column h-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:27.5mm;">(h) Form 941, line 5c, column 2</div>
									</th>
									<!-- Column i-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-right-width:0px;">
										<div style="width:26.5mm;vertical-align:none">(i) Form 941, line 5e</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="NumberOfClientInfGrp" select="$FormData/ClientInformationGrp"/>
								<xsl:for-each select="$NumberOfClientInfGrp">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
												<xsl:choose>
													<xsl:when test="position() &gt; 5"/>
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
										<td class="IRS941ScheduleR_GenericCell" style="text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="WagesTypeCd"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/EmployeeCnt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/WagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/FederalIncomeTaxWithheldAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotSSQlfyPdSLFMLWageAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalSocialSecurityTaxTipAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TaxOnMedicareWagesTipsAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalSSMdcrTaxAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($NumberOfClientInfGrp) &lt; 5">
									<xsl:call-template name="FillTable1Rows">
										<xsl:with-param name="LineNumber" select="5 - count($NumberOfClientInfGrp)"/>
									</xsl:call-template>
								</xsl:if>
								
								<!-- Line 6 of first table -->
								<tr>
									<td colspan="2" class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">6</div>
										<div style="text-align:left;padding-top:1mm;padding-left:.5mm;">
											<b>Subtotals for clients.</b> Add lines 1 through 5
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/WagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotSSQlfyPdSLFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalSocialSecurityTaxTipAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TaxOnMedicareWagesTipsAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalSSMdcrTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 7 of first table -->
								<tr>
									<td colspan="2" class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:7mm;background-color:lightgrey;padding-top:2mm;padding-right:1mm;padding-left:2mm;">7</div>
										<div style="text-align:left;padding-top:1mm;padding-left:.5mm;font-size:6pt;">
											<b>Enter the combined subtotal from line 9 of<br/>all Continuation Sheets for Schedule R</b>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"/>
								</tr>
								
								<!-- Line 8 of first table -->
								<tr>
									<td colspan="2" class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">8</div>
										<div style="text-align:left;padding-top:1mm;padding-left:.5mm;font-size:6pt;"><b>Enter Form 941 amounts for your employees</b></div>
									</td>
									<td class="IRS941ScheduleR_GenericCell">	
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/WagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotSSQlfyPdSLFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalSocialSecurityTaxTipAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TaxOnMedicareWagesTipsAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalSSMdcrTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 9 of first table -->
								<tr>
									<td colspan="2" class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;border-bottom-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;padding-top:1mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">9</div>
										<div style="text-align:left;padding-top:1mm;padding-left:.5mm;"><b>Totals.</b> Add lines 6, 7, and 8.</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/WagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotSSQlfyPdSLFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalSocialSecurityTaxTipAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TaxOnMedicareWagesTipsAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalSSMdcrTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!--Second table -->
					<div class="IRS941ScheduleRTableContainer" style="display:block;padding-top:0mm;" id="SchRCtn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;">
							<thead class="styTableThead">
								<tr>
									<!-- Column j -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-left-width:0px;border-left-width:0px;">
										<div style="width:33mm;padding-left:4mm;">(j) Form 941, line 5f</div>
									</th>
									<!-- Column k -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(k) Form 941, line 11a</div>
									</th>
									<!-- Column l -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(l) Form 941, line 11b and 13c, total</div>
									</th>
									<!-- Column m -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(m) Reserved for future use</div>
									</th>
									<!-- Column n -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(n) Form 941, line 11d and 13e, total</div>
									</th>
									<!-- Column o -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:29mm;">(o) Form 941, line 11e and 13f, total</div>
									</th>
									<!-- Column p-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(p) Form 941, line 11f</div>
									</th>
									<!-- Column q-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-right-width:0px;">
										<div style="width:31mm;vertical-align:none">(q) Form 941, line 12</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="NumberOfClientInfGrp" select="$FormData/ClientInformationGrp"/>
								<xsl:for-each select="$NumberOfClientInfGrp">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
												<xsl:choose>
													<xsl:when test="position() &gt; 5"/>
													<xsl:otherwise>
														<xsl:value-of select="position()"/>
													</xsl:otherwise>
												</xsl:choose>
											</div>
											<div style="text-align:right;padding-top:1mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TaxOnUnreportedTips3121qAmt"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/PayrollTaxCreditAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalCrQlfySLFMLWagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;">
										
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalCrQlfySLFMLWagesAftrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalCOBRAPremiumSubsidyAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/COBRAPremiumSubsidyRcpntCnt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalTaxAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								
								<xsl:if test="count($NumberOfClientInfGrp) &lt; 5">
									<xsl:call-template name="FillSecTable1Rows">
										<xsl:with-param name="LineNumber" select="5 - count($NumberOfClientInfGrp)"/>
									</xsl:call-template>
								</xsl:if>
								
								<!-- Line 6 of Second table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">6</div>
										<div style="text-align:right;padding-top:1mm">
												<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
											</div>
									</td>									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey; "/>
									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalCOBRAPremiumSubsidyAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/COBRAPremiumSubsidyRcpntCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 7 of Second table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:2mm;padding-right:1mm;padding-left:2mm;">7</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"/>
								</tr>
								
								<!-- Line 8 of Second table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">8</div>
										<div style="text-align:right;padding-top:1mm;padding-left:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;"></td> 
									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalCOBRAPremiumSubsidyAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/COBRAPremiumSubsidyRcpntCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 9 of Second table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;border-bottom-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;padding-top:1mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">9</div>
										<div style="text-align:right;padding-top:1mm;padding-left:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
										</div>
									</td>									
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;border-bottom-width:0px;"/>
									
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalCOBRAPremiumSubsidyAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/COBRAPremiumSubsidyRcpntCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!--Third Table -->
					<div class="IRS941ScheduleRTableContainer" style="display:block;padding-top:0mm;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;">
							<thead class="styTableThead">
								<tr>
									<!-- Column r -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-left-width:0px;">
										<div style="width:33mm;padding-left:4mm;">(r) Form 941, line 13a</div>
									</th>
									<!-- Column s -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(s) Reserved for future use</div>
									</th>
									<!-- Column t -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(t) Reserved for future use</div>
									</th>
									<!-- Column u -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(u) Form 941, lines 19 and 20, total</div>
									</th>
									<!-- Column v -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(w) Form 941, lines 23 and 25, total</div>
									</th>
									<!-- Column w -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:29mm;">(w) Form 941, line 26</div>
									</th>
									<!-- Column x-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(x) Form 941, lines 24 and 27, total</div>
									</th>
									<!-- Column y-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-right-width:0px;">
										<div style="width:31mm;vertical-align:none">(y) Form 941, line 26 and 28, total</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="NumberOfClientInfGrp" select="$FormData/ClientInformationGrp"/>
								<xsl:for-each select="$NumberOfClientInfGrp">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
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
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalPaymentCreditAmt"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;">
										
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;">
										
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotQHPExpnssSSQlfyPdSLFMLWgAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;"/>
										
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotBrgnAgrmtQlfySLWgsAftrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotQHPExpnssQlfyLvWgsAftrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotBrgnAgrmtQlfyFMLWgsAftrAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								
								<xsl:if test="count($NumberOfClientInfGrp) &lt; 5">
									<xsl:call-template name="FillSecTable1Rows">
										<xsl:with-param name="LineNumber" select="5 - count($NumberOfClientInfGrp)"/>
									</xsl:call-template>
								</xsl:if>
								
								<!-- Line 6 of Third Table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">6</div>
										<div style="text-align:right;padding-top:1mm">
												<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalPaymentCreditAmt"/>
											</xsl:call-template>
											</div>
									</td>									
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey"> 
									</td>
									
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey"> 
									</td>
									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotQHPExpnssSSQlfyPdSLFMLWgAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey"> 
									</td>
									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotBrgnAgrmtQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotQHPExpnssQlfyLvWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="width:30mm;text-align:right;border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotBrgnAgrmtQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 7 of Third Table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:2mm;padding-right:1mm;padding-left:2mm;">7</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;"/>
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey;"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px"/>
								</tr>
								
								<!-- Line 8 of Third Table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">8</div>
										<div style="text-align:right;padding-top:1mm;padding-left:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalPaymentCreditAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey"/> 
									
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey"/> 
									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotQHPExpnssSSQlfyPdSLFMLWgAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey"> 
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotBrgnAgrmtQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotQHPExpnssQlfyLvWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotBrgnAgrmtQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 9 of Third Table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;padding-top:1mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">9</div>
										<div style="text-align:right;padding-top:1mm;padding-left:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalPaymentCreditAmt"/>
											</xsl:call-template>
										</div>
									</td>									
									
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey"/> 
									
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey"/> 
									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotQHPExpnssSSQlfyPdSLFMLWgAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey"> 
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotBrgnAgrmtQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotQHPExpnssQlfyLvWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotBrgnAgrmtQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!--Page Footer-->
					<div class="pageEnd" style="width:256mm;border-top-width:1px;border-bottom-width:0px;">
						<div style="font-weight:bold;width:98mm;float:left;padding-left:0mm;">
							For Paperwork Reduction Act Notice, see the separate instructions.
					  </div>
						<div style="width:83mm;float:left;text-align:center;padding-top:0.2mm">
							www.irs.gov/Form941<span style="width:20mm;"/>Cat. No. 49301K
					  </div>
						<div style="width:74mm;text-align:right;float:left;">
							<span style="font-weight:bold;">Schedule R (Form 941) (Rev. 3-2022)</span>
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
			</xsl:when>
			<xsl:otherwise>
			
				<!-- Q2 and subsequent quarters BEGIN -->
				<body class="styBodyClass" style="width:256mm">
					<form name="IRS941ScheduleR">
						<xsl:call-template name="DocumentHeaderLandscape"/>
						<!-- BEGIN FORM HEADER -->
						<!-- header -->
						<div class="styTBB" style="width:256mm;border-bottom-width:0px;float:none;clear:both;">
							<div class="styMainTitle" style="width:150mm;float:left;padding-top:2mm;">
								<!--General Dependency Push Pin-->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
								Schedule R (Form 941):
								<span class="styFBT" style="font-size:9pt;padding-left:4mm;">Allocation Schedule for Aggregate Form 941 Filers</span>
							</div>
							<div style="width:190mm;float:left;">
								<div class="styAgency" style="line-height:150%;font-size:8pt;">(Rev. June 2022)
									<span class="styAgency" style="line-height:150%;padding-left:35mm;font-size:8pt;">Department of the Treasury—Internal Revenue Service</span>
									<span class="styAgency" style="line-height:150%;padding-left:35mm;font-size:8pt;">OMB No. 1545-0029</span>
								</div>
								<div class="styBB" style="width:185mm;height:22mm;border-top-width:1px;border-left-width:1px;border-right-width:1px;float:left;padding-left:2mm;padding-bottom:0mm;">
									<div style="width:130mm;padding-top:2mm;">
										<span style="float:left;"><b>Employer identification number (EIN)</b></span>
										<span class="styLNCtrNumBox" style="width:73mm;height:auto;border-top-width:1px;padding-top:1mm;float:right;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											</xsl:call-template>
										</span>
									</div>
									<div style="width:180mm;padding-bottom:1mm;padding-top:1mm;">
										<span style="float:left;padding-top:1.4mm;">
											<b>Name</b>
											<i> as shown on Form 941</i>
										</span>
										<span class="styLNCtrNumBox" style="width:140mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
											</xsl:call-template>	<br/>
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
										<span style="float:left;padding-top:.5mm;"><b>Type of filer</b> (check one):</span>
										<span style="float:left;clear:none;width:5mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
										<span style="float:left">
											<input type="checkbox" class="styCkbox" alt="Section 3504 Agent Indicator">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Section3504AgentInd"/>
													<xsl:with-param name="BackupName">IRS941ScheduleRSection3504AgentInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>Section 3504 Agent</label><br/>
										</span>
										<span style="float:left;clear:none;width:25mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
										<span style="float:left">
											<input type="checkbox" class="styCkbox" alt="Certified Professional Employer Organization (CPEO)">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/CPEOInd"/>
													<xsl:with-param name="BackupName">IRS941ScheduleRCertifiedProfessionalEmployerOrganizationInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>CPEO</label><br/>
										</span>
										<span style="float:left;clear:none;width:25mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
										<span style="float:left">
											<input type="checkbox" class="styCkbox" alt="Other Third  Party">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/OtherThirdPartyInd"/>
													<xsl:with-param name="BackupName">IRS941ScheduleROtherThirdPartyInd</xsl:with-param>
												</xsl:call-template>
											</input>
											<label>Other Third Party	</label>	<br/>
										</span>
									</div>
								</div>
								<div class="styLNDesc" style="padding-top:1mm;width:190mm;padding-bottom:4mm;">
								Read the instructions before you complete Schedule R. Type or print within the boxes. Complete a separate
								line for the amounts allocated to each of your clients. The term “client” as used on this form includes the
								term “customer”. See the instructions.
								</div>
							</div>
							<div style="float:right;padding-bottom:0mm;">
								<div style="font-size:12pt;font-family:Courier New;font-weight:bold;padding-left:1mm;writing-mode:tb-rl">951422</div>
								<div class="styBB" style="width:54mm;height:auto;border: black solid 2px;padding-left:2mm;padding-top:1mm;">
									<div class="styPartName" style="width:48mm;height:auto;text-align:left;padding-left:1mm;">Report for 
									calendar year:</div>
									<div class="styBB" style="padding-top:1mm;width:48mm;border-bottom-width:0px;">
										<span class="styLNCtrNumBox" style="width:20mm;border-top-width:1px;height:4mm;float:left;background-color:white;">
											<xsl:call-template name="PopulateYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
											</xsl:call-template>
										</span>
									</div>
									<div style="width:53mm;padding-top:0.5mm;float:none;clear:both;">	Check the quarter (same as Form 941):</div>
									<div style="width:49mm;float:none;clear:both;">
										<div style="width:49mm;float:none;clear:both;">
											<div style="width:49mm;padding-top:.5mm;float:none;clear:both;">
												<input type="checkbox" alt="FirstQuarter" class="styCkbox">
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
												<div style="float:left;clear:none;padding-top:.5mm;">
													<input type="checkbox" alt="SecondQuarter" class="styCkbox">
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
												<div style="float:left;clear:none;padding-top:.5mm;">
													<input type="checkbox" alt="ThirdQuarter" class="styCkbox">
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
												<div style="float:left;clear:none;padding-top:.5mm;padding-bottom:0.5mm;">
													<input type="checkbox" alt="FourthQuarter" class="styCkbox">
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
								</div>
							</div>
						</div>	
						
					<!--First Table -->
					<div class="IRS941ScheduleRTableContainer" style="display:block;padding-top:1mm;border-bottom-width:0px;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;border-bottom-width:0px;">
							<thead class="styTableThead">
								<tr>
									<!-- Column a -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-left-width:0px;">
										<div style="width:29mm; padding-left:2.5mm;">(a) Client’s EIN</div>
									</th>
									<!-- Column b -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:28.5mm;">(b) Type of wages<br/>
											<span style="font-weight:normal;">(CPEO Only)</span>
										</div>
									</th>
									<!-- Column c -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25mm;">(c) Form 941, line 1</div>
									</th>
									<!-- Column d -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.5mm;">(d) Form 941, line 2</div>
									</th>
									<!-- Column e -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.5mm;">(e) Form 941, line 3</div>
									</th>
									<!-- Column f -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:29.5mm;">(f) Form 941, line 5a(i) and 5a(ii), column 1, <br/>total</div>
									</th>
									<!-- Column g-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:28.5mm;">(g) Form 941, line 5a and 5b, column 2, total</div>
									</th>
									<!-- Column h-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:27.5mm;">(h) Form 941, line 5c, column 2</div>
									</th>
									<!-- Column i-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-right-width:0px;">
										<div style="width:26.5mm;vertical-align:none">(i) Form 941, line 5e</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="NumberOfClientInfGrp" select="$FormData/ClientInformationGrp"/>
								<xsl:for-each select="$NumberOfClientInfGrp">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
												<xsl:choose>
													<xsl:when test="position() &gt; 5"/>
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
										<td class="IRS941ScheduleR_GenericCell" style="text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="WagesTypeCd"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/EmployeeCnt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/WagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/FederalIncomeTaxWithheldAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotSSQlfyPdSLFMLWageAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalSocialSecurityTaxTipAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TaxOnMedicareWagesTipsAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalSSMdcrTaxAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($NumberOfClientInfGrp) &lt; 5">
									<xsl:call-template name="FillTable1Rows">
										<xsl:with-param name="LineNumber" select="5 - count($NumberOfClientInfGrp)"/>
									</xsl:call-template>
								</xsl:if>
								
								<!-- Line 6 of first table -->
								<tr>
									<td colspan="2" class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">6</div>
										<div style="text-align:left;padding-top:1mm;padding-left:.5mm;">
											<b>Subtotals for clients.</b> Add lines 1 through 5
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/WagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotSSQlfyPdSLFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalSocialSecurityTaxTipAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TaxOnMedicareWagesTipsAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalSSMdcrTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 7 of first table -->
								<tr>
									<td colspan="2" class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:7mm;background-color:lightgrey;padding-top:2mm;padding-right:1mm;padding-left:2mm;">7</div>
										<div style="text-align:left;padding-top:1mm;padding-left:.5mm;font-size:6pt;">
											<b>Enter the combined subtotal from line 9 of<br/>all Continuation Sheets for Schedule R</b>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"/>
								</tr>
								
								<!-- Line 8 of first table -->
								<tr>
									<td colspan="2" class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">8</div>
										<div style="text-align:left;padding-top:1mm;padding-left:.5mm;font-size:6pt;"><b>Enter Form 941 amounts for your employees</b></div>
									</td>
									<td class="IRS941ScheduleR_GenericCell">	
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/WagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotSSQlfyPdSLFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalSocialSecurityTaxTipAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TaxOnMedicareWagesTipsAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalSSMdcrTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 9 of first table -->
								<tr>
									<td colspan="2" class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;border-bottom-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;padding-top:1mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">9</div>
										<div style="text-align:left;padding-top:1mm;padding-left:.5mm;"><b>Totals.</b> Add lines 6, 7, and 8.</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/EmployeeCnt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/WagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotSSQlfyPdSLFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalSocialSecurityTaxTipAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TaxOnMedicareWagesTipsAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalSSMdcrTaxAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!--Second table -->
					<div class="IRS941ScheduleRTableContainer" style="display:block;padding-top:0mm;" id="SchRCtn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;border-top-width:0px;">
							<thead class="styTableThead">
								<tr>
									<!-- Column j -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-left-width:0px;">
										<div style="width:33mm;padding-left:4mm;">(j) Form 941, line 5f</div>
									</th>
									<!-- Column k -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(k) Form 941, line 11a</div>
									</th>
									<!-- Column l -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(l) Form 941, line 11b</div>
									</th>
									<!-- Column m -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(m) Form 941, line 11d</div>
									</th>
									<!-- Column n -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(n) Form 941, lines 12</div>
									</th>
									<!-- Column o -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:29mm;">(o) Form 941, line 13a</div>
									</th>
									<!-- Column p-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(p) Form 941, line 13c</div>
									</th>
									<!-- Column q-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-right-width:0px;">
										<div style="width:31mm;vertical-align:none">(q) Form 941, line 13e</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="NumberOfClientInfGrp" select="$FormData/ClientInformationGrp"/>
								<xsl:for-each select="$NumberOfClientInfGrp">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
												<xsl:choose>
													<xsl:when test="position() &gt; 5"/>
													<xsl:otherwise>
														<xsl:value-of select="position()"/>
													</xsl:otherwise>
												</xsl:choose>
											</div>
											<div style="text-align:right;padding-top:1mm">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TaxOnUnreportedTips3121qAmt"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/PayrollTaxCreditAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/NrfdblCrQlfySLFMLWagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/NrfdblCrQlfySLFMLWagesAftrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalTaxAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalTaxDepositAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/RfdblCrQlfySLFMLWagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/RfdblCrQlfySLFMLWagesAftrAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								
								<xsl:if test="count($NumberOfClientInfGrp) &lt; 5">
									<xsl:call-template name="FillSecTable1Rows">
										<xsl:with-param name="LineNumber" select="5 - count($NumberOfClientInfGrp)"/>
									</xsl:call-template>
								</xsl:if>
								
								<!-- Line 6 of Second table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">6</div>
										<div style="text-align:right;padding-top:1mm">
												<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
											</div>
									</td>									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/NrfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/NrfdblCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/RfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/RfdblCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 7 of Second table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:2mm;padding-right:1mm;padding-left:2mm;">7</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"/>
								</tr>
								
								<!-- Line 8 of Second table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">8</div>
										<div style="text-align:right;padding-top:1mm;padding-left:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/NrfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/NrfdblCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/RfdblCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 9 of Second table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;border-bottom-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;padding-top:1mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">9</div>
										<div style="text-align:right;padding-top:1mm;padding-left:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
										</div>
									</td>									
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/NrfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/NrfdblCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/RfdblCrQlfySLFMLWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/RfdblCrQlfySLFMLWagesAftrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!--Third Table -->
					<div class="IRS941ScheduleRTableContainer" style="display:block;padding-top:0mm;border-top-width:0px;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;">
							<thead class="styTableThead">
								<tr>
									<!-- Column r -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-left-width:0px;">
										<div style="width:33mm;padding-left:4mm;">(r) Form 941, line 19</div>
									</th>
									<!-- Column s -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(s) Form 941, line 20</div>
									</th>
									<!-- Column t -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(t) Form 941, line 23</div>
									</th>
									<!-- Column u -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(u) Form 941, line 24</div>
									</th>
									<!-- Column v -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(v) Form 941, line 25</div>
									</th>
									<!-- Column w -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:29mm;">(w) Form 941, line 26</div>
									</th>
									<!-- Column x-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">(x) Form 941, line 27</div>
									</th>
									<!-- Column y-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col" style="border-right-width:0px;">
										<div style="width:31mm;vertical-align:none">(y) Form 941, line 28</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:variable name="NumberOfClientInfGrp" select="$FormData/ClientInformationGrp"/>
								<xsl:for-each select="$NumberOfClientInfGrp">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
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
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/QlfySLWgsAftrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/QHPExpnssQlfySLWgsAftrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/QlfyFMLWgsAftrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/QHPExpnssQlfyFMLWgsAftrAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="count($NumberOfClientInfGrp) &lt; 5">
									<xsl:call-template name="FillSecTable1Rows">
										<xsl:with-param name="LineNumber" select="5 - count($NumberOfClientInfGrp)"/>
									</xsl:call-template>
								</xsl:if>
								
								<!-- Line 6 of Third Table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">6</div>
										<div style="text-align:right;padding-top:1mm">
												<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
											</xsl:call-template>
											</div>
									</td>									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/QlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/QHPExpnssQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/QlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/QHPExpnssQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 7 of Third Table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:2mm;padding-right:1mm;padding-left:2mm;">7</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell"/>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px"/>
								</tr>
								
								<!-- Line 8 of Third Table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-top:1mm;padding-right:1mm;padding-left:2mm;">8</div>
										<div style="text-align:right;padding-top:1mm;padding-left:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/QlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/QHPExpnssQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/QlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/QHPExpnssQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<!-- Line 9 of Third Table -->
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;border-left-width:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:5mm;padding-top:1mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">9</div>
										<div style="text-align:right;padding-top:1mm;padding-left:1mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/QHPExpnssSSQlfyPdSLWageAmt"/>
											</xsl:call-template>
										</div>
									</td>									
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/QHPExpnssSSQlfyPdFMLWageAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/QlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/QHPExpnssQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/CrtnBrgnAgrmtQlfySLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/QlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/QHPExpnssQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/CrtnBrgnAgrmtQlfyFMLWgsAftrAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!--Page Footer-->
					<div class="pageEnd" style="width:256mm;border-top-width:1px;border-bottom-width:0px;">
						<div style="font-weight:bold;width:98mm;float:left;padding-left:0mm;">
							For Paperwork Reduction Act Notice, see the separate instructions.
					  </div>
						<div style="width:83mm;float:left;text-align:center;padding-top:0.2mm">
							www.irs.gov/Form941<span style="width:20mm;"/>Cat. No. 49301K
					  </div>
						<div style="width:74mm;text-align:right;float:left;">
							<span style="font-weight:bold;">Schedule R (Form 941) (Rev. 6-2022)</span>
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
				</xsl:otherwise>
			</xsl:choose>
		</html>
	</xsl:template>
	<xsl:template name="FillTable1Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr>
			<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
				<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">
					<xsl:number value="$MaxLine -  $LineNumber + 1"/>
				</div>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;">
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
			<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
				<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">
					<xsl:number value="$MaxLine -  $LineNumber + 1"/>
				</div>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;">
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
	<xsl:template name="FillQ1SecTable1Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr>
			<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
				<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">
					<xsl:number value="$MaxLine - $LineNumber + 1"/>
				</div>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;">
				<br/>
			</td>
		</tr>
		<xsl:if test="$LineNumber &gt; 1">
			<xsl:call-template name="FillQ1SecTable1Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber - 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="FillQ1SecTable2Rows">
		<xsl:param name="LineNumber"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr>
			<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
				<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">
					<xsl:number value="$MaxLine -  $LineNumber + 1"/>
				</div>
			</td>
			<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell" style="background-color:lightgrey">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell">
				<br/>
			</td>
			<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;">
				<br/>
			</td>
		</tr>
		<xsl:if test="$LineNumber &gt; 1">
			<xsl:call-template name="FillQ1SecTable2Rows">
				<xsl:with-param name="LineNumber" select="$LineNumber - 1"/>
				<xsl:with-param name="MaxLine" select="$MaxLine"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
