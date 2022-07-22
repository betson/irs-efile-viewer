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
			<body class="styBodyClass" style="width:256mm">
				<form name="IRS941ScheduleR">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- BEGIN FORM HEADER -->
					<!-- header -->
					<div class="styTBB" style="width:256mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styMainTitle" style="width:150mm;float:left;padding-top:4mm;">
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							Schedule R (Form 941):
							<span class="styFBT" style="font-size:9pt;padding-left:4mm;">Allocation Schedule for Aggregate Form 941 Filers</span>
						</div>
						<div class="styTYBox" style="width:30mm;float:right;border-left-width:0px;">
							<div class="styOMB" style="border-bottom-width:0px;padding-top:5mm;text-align:right;">OMB No. 1545-0029</div>
						</div>
					</div>
					<div class="styBB" style="width:256mm;border-bottom-width:0px;padding-bottom:0mm;">
						<div style="width:190mm;float:left;">
							<div class="styAgency" style="padding-bottom:1mm;line-height:150%;">(Rev. January 2017)<br/>Department of the Treasury—Internal Revenue Service</div>
							<div class="styBB" style="width:185mm;height:25mm;border-top-width:1px;border-left-width:1px;border-right-width:1px;float:left;padding-left:2mm;padding-bottom:0mm;">
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
										<i> as shown on Form 941</i>
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
								<div style="width:180mm;padding-bottom:1mm;padding-top:1mm;">
									<span style="float:left;padding-top:1.4mm;">
										<b>Type of filer</b> (check one):

									</span>
									<span style="float:left;clear:none;width:5mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<input type="checkbox" class="styCkbox" alt="Section 3504 Agent Indicator">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Section3504AgentInd"/>
												<xsl:with-param name="BackupName">IRS941ScheduleRSection3504AgentInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											Section 3504 Agent
										</label>
										<br/>
									</span>
									<span style="float:left;clear:none;width:5mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<input type="checkbox" class="styCkbox" alt="Certified Professional Employer Organization (CPEO)">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/CPEOInd"/>
												<xsl:with-param name="BackupName">IRS941ScheduleRCertifiedProfessionalEmployerOrganizationInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											Certified Professional Employer Organization (CPEO)
										</label>
										<br/>
									</span>
								</div>
							</div>
							<div class="styLNDesc" style="padding-top:1mm;width:190mm;padding-bottom:4mm;">
								Read the instructions before you complete Schedule R. Type or print within the boxes. Complete a separate line for the amounts allocated to each of
								your clients. The term "client" as used on this form includes the term "customer". See the instructions.
							</div>
						</div>
						<div style="float:right;padding-bottom:0mm;">
						<div style="font-size:12pt;font-family:Courier New;font-weight:bold;padding-left:1mm;writing-mode:tb-rl">950417</div>
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
								<div style="width:53mm;padding-bottom:0mm;float:none;clear:both;">
									Check the quarter (same as Form 941):
								</div>
								<xsl:variable name="Date">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
									</xsl:call-template>
								</xsl:variable>
								<div style="width:48mm;float:none;clear:both;">
									<div style="width:48mm;float:none;clear:both;padding-left:2mm;">
										<div style="width:48mm;padding-top:1mm;float:none;clear:both;">
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
										<div style="width:48mm;">
											<div style="float:left;clear:none;padding-top:1mm;">
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
										<div style="width:48mm;">
											<div style="float:left;clear:none;padding-top:1mm;">
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
										<div style="width:48mm;">
											<div style="float:left;clear:none;padding-top:1mm;padding-bottom:1mm;">
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
					<div style="width:256mm;height:2mm;float:none;clear:both;text-align:right;padding-top:0.5mm;">
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$FormData/ClientInformationGrp"/>
							<xsl:with-param name="containerHeight" select="10"/>
							<xsl:with-param name="headerRowCount" select="1"/>
							<xsl:with-param name="containerID" select="'SchRCtn'"/>
						</xsl:call-template>
					</div>
					<div class="IRS941ScheduleRTableContainer" style="display:block" id="SchRCtn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;">
							<thead class="styTableThead">
								<!-- Column a -->
								<tr>
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:26mm;">
											(a)<br/>Client's<br/>Employer<br/>identification<br/>number (EIN)
										</div>
									</th>
									<!-- Column b -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:20mm;">
											(b)<br/>Type of wages,<br/>tips, and other<br/>compensation<br/>
											<span style="font-weight:normal;">
											(CPEO Use Only)</span>
										</div>
									</th>
									<!-- Column c -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.5mm;">
											(c)<br/>Wages, tips, and<br/>other compensation<br/>
											<span style="font-weight:normal;">
											allocated to the<br/>listed client EIN from<br/>Form 941, line 2</span>
										</div>
									</th>
									<!-- Column d -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">
											(d)<br/>Federal income tax<br/>withheld from wages,<br/>tips, and other<br/>compensation
											<b style="font-weight:normal;">allocated<br/> to the listed client EIN<br/>from Form 941, line 3</b>
										</div>
									</th>
									<!-- Column e -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.8mm;">
											(e)<br/>Total social security<br/>and Medicare taxes<br/>
											<span style="font-weight:normal">
											allocated to the <br/>listed client EIN from <br/>Form 941, line 5e</span>
										</div>
									</th>
									<!-- Column f -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">
											(f)<br/>Section 3121(q)Notice <br/>and Demand-Tax due<br/> on unreported tips<br/>
											<span style="font-weight:normal;">allocated to the listed<br/>client EIN from<br/>Form 941, line 5f</span>
										</div>
									</th>
									<!-- Column g-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:30mm;font-size:5.5pt;">
											(g)<br/>Qualified small business<br/>payroll tax credit for<br/>increasing research<br/>activities 
											<b style="font-weight:normal;">allocated to the <br/>listed client EIN from<br/>Form 941, line 11</b>
										</div>
									</th>
									<!-- Column h-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.4mm;">
											(h)<br/>Total taxes<br/>after adjustments<br/>and credits<span style="font-weight:normal;">allocated to the<br/> 
											listed client EIN from<br/>Form 941, line 12</span>
										</div>
									</th>
									<!-- Column i-->
									<th class="IRS941ScheduleR_GenericCellHeader" style="border-right-width:0px;" scope="col">
										<div style="width:30mm;vertical-align:none">
											(i) <br/> Total deposits <br/>from 
											Form 941, line 13,<br/><span style="font-weight:normal;">plus any payments<br/> made with the return<br/> allocated to the<br/> 
											listed client EIN</span>
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($FormData/ClientInformationGrp) &lt;= 10)">
									<xsl:for-each select="$FormData/ClientInformationGrp">
										<tr>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
												<xsl:choose>
													<xsl:when test="position() &gt; 9">
														<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;">
															<xsl:if test="position() &lt;= 10">
																<xsl:value-of select="position()"/>
															</xsl:if>
														</div>
													</xsl:when>
													<xsl:otherwise>
														<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;">
															<xsl:value-of select="position()"/>
														</div>
													</xsl:otherwise>
												</xsl:choose>
												<div style="text-align:center;padding-top:1mm">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:center;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="WagesTypeCd"/>
												</xsl:call-template>
											</td>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/WagesAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/FederalIncomeTaxWithheldAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalSSMdcrTaxAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TaxOnUnreportedTips3121qAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/PayrollTaxCreditAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalTaxAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalPaymentCreditAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 1) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm">1</div>
											<xsl:if test="((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage">true</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/ClientInformationGrp"/>
												</xsl:call-template>
											</xsl:if>
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
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 2) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">2</div>
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
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 3) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">3</div>
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
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 4) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">4</div>
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
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 5) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">5</div>
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
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 6) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;padding-top:1mm;">6</div>
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
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 7) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">7</div>
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
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 8) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">8</div>
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
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 9) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">9</div>
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
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 10) or ((count($FormData/ClientInformationGrp) &gt; 10) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;">10</div>
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
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="IRS941ScheduleRTableContainer" style="display:block">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="width:26.8mm;height:12mm;text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:12mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;text-align:right;">11</div>
										<div style="font-size:6pt;padding-top:0.5mm;">
											<b>Subtotals for<br/>clients.</b> Add all<br/>amounts on lines<br/>1 through 10	
											</div>
									</td>
									<!--The following cell is to space and shade the table correctly.-->
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:20mm;">
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.5mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/WagesAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:31mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/FederalIncomeTaxWithheldAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalSSMdcrTaxAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:31mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/PayrollTaxCreditAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalTaxAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalPaymentCreditAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:left;font-weight:bold;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;height:20mm">
										<div class="styLNLeftNumBox" style="width:5mm;background-color:lightgrey;height:20mm;padding-right:1mm;padding-left:0.5mm;text-align:right;">12</div>
										<div style="font-size:6pt;padding-top:0.5mm;">Enter the<br/>combined<br/>
										subtotal from <br/>line 24 of all<br/>Continuation<br/>Sheets for<br/>Schedule R
										</div>
									</td>
									<!--The following cell is to space and shade the table correctly.-->
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:20mm;">
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
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px">
										<br/>
									</td>
								</tr>
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:left;font-weight:bold;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:12mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:0.5mm;text-align:right;">13</div>
										<div style="font-size:6pt;padding-top:0.5mm;">Enter Form 941<br/>amounts <br/>for your <br/>employees</div>
									</td>
									<!--The following cell is to space and shade the table correctly.-->
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:20mm;">
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/WagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalSSMdcrTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TaxOnUnreportedTips3121qAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalPaymentCreditAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;height:21mm;">
										<div class="styLNLeftNumBox" style="width:5mm;height:21mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;text-align:right;">14</div>
										<div style="font-size:6pt;padding-top:0.5mm;">
											<b>Totals.</b> Add lines<br/>11, 12, and 13.<br/>The column<br/> totals must<br/> match the <br/> related lines on <br/>the aggregate <br/>Form 941.
										</div>
									</td>
									<!--The following cell is to space and shade the table correctly.-->
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:20mm;">
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/WagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/FederalIncomeTaxWithheldAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalSSMdcrTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TaxOnUnreportedTips3121qAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/PayrollTaxCreditAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalTaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalPaymentCreditAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<xsl:if test="($Print != $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ClientInformationGrp/ClientAllocationInformationGrp"/>
							<xsl:with-param name="containerHeight" select="10"/>
							<xsl:with-param name="headerRowCount" select="1"/>
							<xsl:with-param name="containerID" select="'SchRCtn'"/>
						</xsl:call-template>
					</xsl:if>
					<!--Page Footer-->
					<div class="pageEnd" style="width:256mm;border-top-width:1px;border-bottom-width:0px;">
						<div style="font-weight:bold;width:90mm;float:left;padding-left:0mm;">
							For Paperwork Reduction Act Notice, see the instructions.
					  </div>
						<div style="width:90mm;float:left;text-align:center;padding-top:0.2mm">
							IRS.gov/form941<span style="width:20mm;"/>Cat. No. 49301K
					  </div>
						<div style="width:74mm;text-align:right;float:left;">
							<span style="font-weight:bold;">Schedule R (Form 941) (Rev. 1-2017)</span>
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
					<!--Begin Separated Table-->
					<xsl:if test="($Print = $Separated) and (count($FormData/ClientInformationGrp) &gt; 10)">
						<br/>
						<span class="styRepeatingDataTitle">Schedule R (Form 941): Allocation Schedule for Aggregate Form 941 Filers</span>
						<table class="styDepTbl" style="font-size:6.0pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<!-- Column a -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:26mm;">
											(a)<br/>Clientâ€™s<br/>Employer<br/>identification<br/>number (EIN)
										</div>
									</th>
									<!-- Column b -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:20mm;">
											(b)<br/>Type of wages,<br/>tips, and other<br/>compensation<br/>
											<span style="font-weight:normal;">(CPEO Use Only)</span>
										</div>
									</th>
									<!-- Column c -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.5mm;">
											(c)<br/>Wages, tips, and<br/>other compensation<br/>
											<span style="font-weight:normal;">
											allocated to the<br/>listed client EIN from<br/>Form 941, line 2</span>
										</div>
									</th>
									<!-- Column d -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">
											(d)<br/>Federal income tax<br/>withheld from wages,<br/>tips, and other<br/>compensation
											<b style="font-weight:normal;">allocated<br/> to the listed client EIN<br/>from Form 941, line 3</b>
										</div>
									</th>
									<!-- Column e -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.8mm;">
											(e)<br/>Total social security<br/>and Medicare taxes<br/>
											<span style="font-weight:normal">
											allocated to the <br/>listed client EIN from <br/>Form 941, line 5e</span>
										</div>
									</th>
									<!-- Column f -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:31mm;">
											(f)<br/>Section 3121(q)Notice <br/>and Demand-Tax due<br/> on unreported tips<br/>
											<span style="font-weight:normal;">allocated to the listed<br/>client EIN from<br/>Form 941, line 5f</span>
										</div>
									</th>
									<!-- Column g-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:30mm;font-size:5.5pt;">
											(g)<br/>Qualified small business<br/>payroll tax credit for<br/>increasing research<br/>activities 
											<b style="font-weight:normal;">allocated to the <br/>listed client EIN from<br/>Form 941, line 11</b>
										</div>
									</th>
									<!-- Column h-->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.4mm;">
											(h)<br/>Total taxes<br/>after adjustments<br/>and credits<span style="font-weight:normal;">allocated to the<br/> 
											listed client EIN from<br/>Form 941, line 12</span>
										</div>
									</th>
									<!-- Column i-->
									<th class="IRS941ScheduleR_GenericCellHeader" style="border-right-width:0px;" scope="col">
										<div style="width:30mm;vertical-align:none">
											(i) <br/> Total deposits <br/>from 
											Form 941, line 13,<br/><span style="font-weight:normal;">plus any payments<br/> made with the return<br/> allocated to the<br/> 
											listed client EIN</span>
										</div>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/ClientInformationGrp">
									<tr style="border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;height:3mm;">
											<xsl:choose>
												<xsl:when test="position() &gt; 9">
													<div class="styLNLeftNumBox" style="width:5mm;height:2mm;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;">
														<xsl:if test="position() &lt;= 10">
															<xsl:value-of select="position()"/>
														</xsl:if>
													</div>
												</xsl:when>
												<xsl:otherwise>
													<div class="styLNLeftNumBox" style="width:5mm;height:3mm;padding-right:1mm;padding-left:2mm;padding-top:1mm;">
														<xsl:value-of select="position()"/>
													</div>
												</xsl:otherwise>
											</xsl:choose>
											<div style="padding-top:1mm;text-align:center">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:center;border-right-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="WagesTypeCd"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/WagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/FederalIncomeTaxWithheldAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalSSMdcrTaxAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/PayrollTaxCreditAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalTaxAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalPaymentCreditAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
