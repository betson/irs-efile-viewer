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
		<html>
			<head>
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
			<body class="styBodyClass">
				<form name="IRS941ScheduleR">
					<xsl:call-template name="DocumentHeader"/>
					<!-- BEGIN FORM HEADER -->
					<!-- header -->
					<div class="styTBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styMainTitle" style="width:150mm;float:left;padding-top:4mm;">
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							Schedule R (Form 941):
							<span class="styFBT" style="font-size:9pt;padding-left:4mm;">Allocation Schedule for Aggregate Form 941 Filers</span>
						</div>
						<div class="styTYBox" style="width:30mm;float:right;border-left-width:0px;">
							<div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;">950413</div>
							<div class="styOMB" style="border-bottom-width:0px;text-align:right;">OMB No. 1545-0029</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;border-bottom-width:0px;padding-bottom:0mm;">
						<div style="width:118mm;float:left;">
							<div class="styAgency" style="padding-bottom:2mm;line-height:150%;">(Rev. January 2013)<br/>Department of the Treasury—Internal Revenue Service</div>
							<div class="styBB" style="width:123mm;height:8mm;border-top-width:1px;border-left-width:1px;border-right-width:1px;float:left;padding-left:2mm;padding-bottom:0mm;">
								<div style="width:118mm;padding-top:4mm;">
									<span style="float:left;">
										<b>Employer identification number<br/>(EIN)</b>
									</span>
									<span class="styLNCtrNumBox" style="width:73mm;border-top-width:1px;padding-top:2mm;float:right;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
								    </span>
								</div>
								<div style="width:118mm;padding-bottom:2mm;padding-top:2mm;">
									<span style="float:left;padding-top:1.4mm;">
										<b>Name</b>
										<i> as shown on<br/>
Form 941</i>
									</span>
									<span class="styLNCtrNumBox" style="width:92mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
										</xsl:call-template><br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<div class="styLNDesc" style="padding-top:2mm;width:123mm;padding-bottom:0mm;">
								Read the instructions before you complete Schedule R (Form 941). Type or print within the boxes.
								Complete a separate line for the amounts allocated to each of your clients.
							</div>
						</div>
						<div style="float:right;padding-left:3mm;padding-top:1mm;padding-bottom:0mm;padding-right:2mm;">
							<div class="styBB" style="width:54mm;height:40mm;border: black solid 2px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:48mm;text-align:left;padding-left:1mm;">Report for 
									calendar year:</div>
								<div class="styBB" style="padding-top:2mm;width:48mm;border-bottom-width:0px;">
									<span class="styLNCtrNumBox" style="width:20mm;border-top-width:1px;height:4mm;float:left;background-color:white;">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
										</xsl:call-template>
									</span>
								</div>
								<xsl:variable name="Date">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
									</xsl:call-template>
								</xsl:variable>
								<div style="width:53mm;padding-bottom:0mm;float:none;clear:both;">
									Check the quarter (same as Form 941):
								</div>
								<div style="width:48mm;float:none;clear:both;">
									<div style="width:48mm;float:none;clear:both;padding-left:2mm;">
										<div style="width:48mm;padding-top:3mm;float:none;clear:both;">
											<input type="checkbox" class="styCkbox">
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
											<div style="float:left;clear:none;padding-top:2mm;">
												<input type="checkbox" class="styCkbox">
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
											<div style="float:left;clear:none;padding-top:2mm;">
												<input type="checkbox" class="styCkbox">
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
											<div style="float:left;clear:none;padding-top:2mm;padding-bottom:2mm;">
												<input type="checkbox" class="styCkbox">
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
					
					<div style="width:188mm;height:1mm;float:none;clear:both;text-align:right;padding-top:0mm;">
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$FormData/ClientInformationGrp"/>
							<xsl:with-param name="containerHeight" select="15"/>
							<xsl:with-param name="headerRowCount" select="1"/>
							<xsl:with-param name="containerID" select="'SchRCtn'"/>
						</xsl:call-template>
					</div>
					
					<div class="IRS941ScheduleRTableContainer" style="float:none;clear:both;" id="SchRCtn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm">
							<thead class="styTableThead">
								<!-- Column a -->
								<tr>
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:27.7mm;">
											(a)<br/>Client’s Employer<br/>Identification<br/>Number (EIN)
										</div>
									</th>
									<!-- Column b -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.6mm;">
											(b)<br/>Wages, tips, and<br/>other compensation<br/><span style="font-weight:normal;">
											allocated to the listed<br/>client EIN from<br/>Form 941, line 2</span>
										</div>
									</th>
									<!-- Column c -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:26.4mm;">
											(c)<br/>Total income tax<br/>withheld from wages,<br/>tips, and other<br/>compensation<br/> 
											<span style="font-weight:normal;">allocated to the listed<br/>client EIN from<br/>Form 941, line 3</span>
										</div>
									</th>
									<!-- Column d -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.8mm;">
											(d)<br/>Total social security<br/>and Medicare taxes<br/><span style="font-weight:normal">
											allocated to the listed<br/>client EIN from Form<br/>941, line 5e</span>
										</div>
									</th>
									<!-- Column e -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.8mm;">
											(e)<br/>Section 3121(q)<br/>Notice and Demand-<br/>Tax due on<br/>unreported tips<br/><span 
											style="font-weight:normal;">allocated to the listed<br/>client EIN from<br/>Form 941, line 5f</span>
										</div>
									</th>
									<!-- Column f -->
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">
										<div style="width:25.4mm;">
											(f)<br/>Total taxes after<br/>adjustments<br/><span style="font-weight:normal;">allocated to the 
											listed<br/>client EIN from<br/>Form 941, line 10</span>
										</div>
									</th>
									<!-- Column g -->
									<th class="IRS941ScheduleR_GenericCellHeader" style="border-right-width:0px;" scope="col">
										<div style="width:25.8mm;">
											(g)<br/>Total deposits and<br/>COBRA payments<br/><span style="font-weight:normal;">from 
											Form 941, line 13,<br/>plus any payments<br/>made with the return<br/>allocated to the 
											listed<br/>client EIN</span>
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($FormData/ClientInformationGrp) &lt;= 15)">
									<xsl:for-each select="$FormData/ClientInformationGrp">
										<tr>
											<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
												<xsl:choose>
													<xsl:when test="position() &gt; 9">
														<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">
															<xsl:if test="position() &lt;= 15">
																<xsl:value-of select="position()"/>
															</xsl:if>
														</div>
													</xsl:when>
													<xsl:otherwise>
														<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">
															<xsl:value-of select="position()"/>
														</div>
													</xsl:otherwise>
												</xsl:choose>
												<div style="padding-top:1.6mm;text-align:center;">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</div>
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
													<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalTaxAfterAdjustmentAmt"/>
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
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 1) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">1</div>
											<xsl:if test="((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$FormData/ClientInformationGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 2) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">2</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 3) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">3</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 4) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">4</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 5) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">5</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 6) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;padding-top:3mm;">6</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 7) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">7</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 8) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">8</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 9) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">9</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 10) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">10</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 11) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">11</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 12) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">12</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 13) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">13</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 14) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">14</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInformationGrp) &lt; 15) or ((count($FormData/ClientInformationGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">15</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell"><br/></td>
										<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="IRS941ScheduleRTableContainer" style="float:none;clear:both;">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;height:100%;">
										<div style="width:28.2mm;height:100%;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:100%;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;text-align:right;">16</div>
											<div style="font-size:6pt;padding-top:0.5mm;padding-bottom:1mm;">
												<b>Subtotals for<br/>clients.</b> Add all<br/>amounts on lines<br/>1 through 15	
											</div>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.6mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/WagesAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:26.4mm;">
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
										<div style="width:25.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalTaxAfterAdjustmentAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.8mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientGrp/TotalPaymentCreditAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:left;font-weight:bold;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;height:22mm">
										<div class="styLNLeftNumBox" style="width:5mm;background-color:lightgrey;height:22mm;padding-right:1mm;padding-left:0.5mm;text-align:right;">17</div>
										<div style="font-size:6pt;padding-top:0.5mm;padding-bottom:0.2mm;">Enter the<br/>combined<br/>
										subtotal from line<br/>26 of all<br/>Continuation<br/>Sheets for<br/>Schedule R<br/>(Form 941)
										</div>
									</td>
									<td class="IRS941ScheduleR_GenericCell"><br/></td>
									<td class="IRS941ScheduleR_GenericCell"><br/></td>
									<td class="IRS941ScheduleR_GenericCell"><br/></td>
									<td class="IRS941ScheduleR_GenericCell"><br/></td>
									<td class="IRS941ScheduleR_GenericCell"><br/></td>
									<td class="IRS941ScheduleR_GenericCell" style="border-right-width:0px"><br/></td>
								</tr>
								
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:left;font-weight:bold;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;height:100%">
										<div class="styLNLeftNumBox" style="width:5mm;height:10mm;background-color:lightgrey;height:100%;padding-right:1mm;padding-left:0.5mm;padding-top:2mm;text-align:right;">18</div>
										<div style="font-size:6pt;padding-top:2mm;padding-bottom:2mm;">Enter Form 941<br/>amounts for 
										your<br/>employees</div>
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
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalTaxAfterAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateEmployeeInfoGrp/TotalPaymentCreditAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<tr>
									<td class="IRS941ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;height:100%">
										<div class="styLNLeftNumBox" style="width:5mm;height:26mm;background-color:lightgrey;height:100%;padding-right:1mm;padding-left:0.5mm;text-align:right;">19</div>
										<div style="font-size:6pt;padding-top:0.5mm;padding-bottom:1mm;">
											<b>Totals.</b> Add lines<br/>16, 17, and 18.<br/>The column<br/>totals must<br/>match the<br/>
											related lines on<br/>the aggregate<br/>Form 941
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
											<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateAndClientInfoGrp/TotalTaxAfterAdjustmentAmt"/>
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

					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/ClientInformationGrp/ClientAllocationInformationGrp"/>
						<xsl:with-param name="containerHeight" select="15"/>
						<xsl:with-param name="headerRowCount" select="1"/>
						<xsl:with-param name="containerID" select="'SchRCtn'"/>
					</xsl:call-template>
					
					<!--Page Footer-->
					<div class="pageEnd" style="width:188mm;float:none;clear:both;">
						<div style="font-weight:bold;width:88mm;float:left;padding-left:0mm;">
            For Paperwork Reduction Act Notice, see the instructions.
          </div>
						<div style="width:44mm;float:left;text-align:center;padding-top:0.2mm">
            Cat. No. 49301K
          </div>
						<div style="width:55.9mm;text-align:right;float:left;">
							<span style="font-weight:bold;">Schedule R (Form 941) (Rev. 1-2013)</span>
						</div>
					</div>
					<!--END Page Footer-->
					
					<div class="styLeftOverTitleLine" id="LeftOverData">
						<div class="styLeftOverTitle">
							Additional Data
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					
					<!--Begin Separated Table-->
					<xsl:if test="($Print = $Separated) and (count($FormData/ClientInformationGrp) &gt; 15)">
						<br/>
						<span class="styRepeatingDataTitle">Schedule R (Form 941): Allocation Schedule for Aggregate Form 941 Filers</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">(a)<br/>
										<span style="text-align:center;"> Client’s Employer Identification Number (EIN)</span>
									</th>
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">(b)<br/>
										<span class="styNormalText" style="text-align:center;">
											<b>Wages, tips, and other compensation</b>
allocated to the listed client EIN from Form 941, line 2</span>
									</th>
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">(c)<br/>
										<span class="styNormalText" style="text-align:center;">
											<b>Total income tax withheld from wages, tips, and other compensation</b> allocated to the listed client EIN from Form 941, line 3</span>
									</th>
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">(d)<br/>
										<span class="styNormalText" style="text-align:center;">
											<b>Total social security and Medicare taxes</b>
allocated to the listed client EIN from Form 941, line 5e</span>
									</th>
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">(e)<br/>
										<span class="styNormalText" style="text-align:center;">
											<b>Section 3121(q) Notice and Demand-Tax due on unreported tips</b> allocated to the listed client EIN from Form 941, line 5f</span>
									</th>
									<th class="IRS941ScheduleR_GenericCellHeader" scope="col">(f)<br/>
										<span class="styNormalText" style="text-align:center;">
											<b>Total taxes after adjustments</b> allocated to the listed client EIN from Form 941, line 10</span>
									</th>
									<th class="IRS941ScheduleR_GenericCellHeader" style="border-right-width:0px;" scope="col">(g)<br/>
										<span class="styNormalText" style="text-align:center;">
											<b>Total deposits and COBRA payments</b>
from Form 941, line 13, plus any payments made with the return allocated to the listed client EIN</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/ClientInformationGrp">
									<tr style="border-color:black;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<xsl:choose>
												<xsl:when test="position() &gt; 9">
													<div class="styLNLeftNumBox" style="width:5mm;height:6mm;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">
														<xsl:if test="position() &lt;= 15">
															<xsl:value-of select="position()"/>
														</xsl:if>
													</div>
												</xsl:when>
												<xsl:otherwise>
													<div class="styLNLeftNumBox" style="width:5mm;height:6mm;padding-right:1mm;padding-left:2mm;padding-top:3mm;">
														<xsl:value-of select="position()"/>
													</div>
												</xsl:otherwise>
											</xsl:choose>
											<div style="padding-top:1.6mm;text-align:center">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/WagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/FederalIncomeTaxWithheldAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalSSMdcrTaxAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TaxOnUnreportedTips3121qAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS941ScheduleR_GenericCell" style="text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientAllocationInformationGrp/TotalTaxAfterAdjustmentAmt"/>
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
