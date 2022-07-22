<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS940ScheduleRStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS940ScheduleR"/>
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
				<meta name="Description" content="IRS Form 940 Schedule R"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS940ScheduleRStyle"/>
						<xsl:call-template name="AddOnStyle"/>
				</xsl:if>
				</style>
			</head>
			<!-- 6/9/2017 AM: Per UWR 197907, Form 940 Sch R changed from portrait orientation to landscape orientation. 940 Sch R Style file has changed as well -->
			<body class="styBodyClass" style="width:256mm">
				<form name="IRS940ScheduleR">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- BEGIN FORM HEADER -->
					<!-- header -->
					<div class="styTBB" style="width:256mm;border-bottom-width:0px;float:none;clear:both;">
						<div class="styMainTitle" style="width:150mm;float:left;padding-top:4mm;">
							<!--General Dependency Push Pin-->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							Schedule R (Form 940):
							<span class="styFBT" style="font-size:9pt;padding-left:4mm;">Allocation Schedule for Aggregate Form 940 Filers</span>
						</div>
						<div class="styTYBox" style="width:30mm;float:right;border-left-width:0px;">
							<div class="styOMB" style="border-bottom-width:0px;padding-top:5mm;text-align:right;">OMB No. 1545-0028</div>
						</div>
					</div>
					<div class="styBB" style="width:256mm;border-bottom-width:0px;padding-bottom:0mm;">
						<div style="width:190mm;float:left;">
							<div class="styAgency" style="padding-bottom:1mm;line-height:150%;">(Rev. December 2017)<br/>Department of the Treasury—Internal Revenue Service</div>
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
										<i> as shown on Form 940</i>
									</span>
									<span class="styLNCtrNumBox" style="width:140mm;border-top-width:1px;height:8mm;float:right;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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
						</div>
						<div style="float:right;padding-left:3mm;padding-top:4mm;padding-right:2mm;">
							<div style="font-size:12pt;font-family:Courier New;font-weight:bold;padding-left:1mm;writing-mode:tb-rl">860517</div>
							<div class="styBB" style="width:54mm;height:22.4mm;border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:2mm;">
								<div class="styPartName" style="width:48mm;height:6mm;text-align:left;padding-left:1mm;padding-top:1mm;">Report for 
									calendar year:</div>
								<div class="styBB" style="padding-top:1.5mm;width:48mm;border-bottom-width:0px;">
									(Same as Form 940):
								</div>
								<div class="styBB" style="padding-top:1.5mm;width:48mm;border-bottom-width:0px;">
									<span class="styLNCtrNumBox" style="width:25mm;height:6mm;border-top-width:1px;padding-top:1mm;float:left;background-color:white;">
										<xsl:call-template name="PopulateReturnHeaderTaxYear">
											<xsl:with-param name="TargetNode">TaxYr</xsl:with-param>											
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="styLNDesc" style="padding-top:1mm;width:190mm;padding-bottom:4mm;">
								Read the instructions before you complete Schedule R (Form 940). Type or print within the boxes. Complete a separate line for the amounts allocated to each of your
								clients. The term “client” as used on this form includes the term “customer.” See the instructions.
					</div>
					<div style="width:256mm;height:2mm;float:none;clear:both;text-align:right;padding-top:0.5mm;">
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$FormData/ClientInfoGrp"/>
							<xsl:with-param name="containerHeight" select="15"/>
							<!--<xsl:with-param name="headerRowCount" select="1"/>-->
							<xsl:with-param name="containerID" select="'SchRCtn'"/>
						</xsl:call-template>
					</div>
					<div class="IRS940ScheduleRTableContainer" style="display:block" id="SchRCtn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:6pt;margin-left:0mm;">
							<thead class="styTableThead">
								<!-- Column a -->
								<tr>
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(a)<br/>Client’s Employer<br/>Identification Number <br/>(EIN)
										</div>
									</th>
									<!-- Column b -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:23mm;">
											(b)<br/>State<br/>abbreviation<br/>
											<span style="font-weight:normal;">
											from Form<br/>940, line 1a,<br/>or Schedule A<br/>(Form 940)</span>
										</div>
									</th>
									<!-- Column c -->									
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(c)<br/>Type of wages, tips, and<br/> other compensation<br/>
											<span style="font-weight:normal;">
											(CPEO use only)</span>
										</div>
									</th>
									<!-- Column d -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(d)<br/>Total taxable FUTA<br/>wages
											<b style="font-weight:normal;">
											allocated to<br/>the listed client EIN<br/>from Form 940, line 7</b>
										</div>
									</th>
									<!-- Column e -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(e)<br/>Total adjustments<br/>to FUTA tax<br/>
											<span style="font-weight:normal">
											allocated to the <br/>listed client EIN from <br/>Form 940, line 9 or line 10</span>
										</div>
									</th>
									<!-- Column f -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(f)<br/>Credit reduction amount<br/>
											<span style="font-weight:normal;">
											allocated to the<br/>listed client EIN from<br/>Form 940, line 11</span>
										</div>
									</th>
									<!-- Column g-->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:30mm;">
											(g)<br/>Total FUTA tax<br/>after adjustments<br/> 
											<b style="font-weight:normal;">
											allocated to the <br/>listed client EIN from<br/>Form 940, line 12</b>
										</div>
									</th>
									<!-- Column h-->
									<th class="IRS940ScheduleR_GenericCellHeader" style="border-right-width:0px;" scope="col">
										<div style="width:32mm;">
											(h)<br/>Total FUTA tax deposits<br/>
											<span style="font-weight:normal;">
											from Form 940, line 13,<br/>plus any payment made<br/>with the return allocated<br/>to the listed client EIN</span>
										</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($FormData/ClientInfoGrp) &lt;= 15)">
									<xsl:for-each select="$FormData/ClientInfoGrp">
										<tr>
											<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
												<xsl:choose>
													<xsl:when test="position() &gt; 9">
														<xsl:choose>														
															<xsl:when test="position() &lt;= 15">
																<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;">
																	<xsl:value-of select="position()"/>
																</div>
															</xsl:when>
															<xsl:otherwise>
																<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;"/>
															</xsl:otherwise>
														</xsl:choose>
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
											<td class="IRS940ScheduleR_GenericCell" style="text-align:center;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="FUTAStateCd"/>
												</xsl:call-template>
											</td>
											<td class="IRS940ScheduleR_GenericCell" style="text-align:center;border-right-width:1px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="WagesTypeCd"/>
												</xsl:call-template>
											</td>
											<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalTaxableWagesAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalAdjustmentToFUTATaxAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalCreditReductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientDetailGrp/FUTATaxAfterAdjustmentAmt"/>
												</xsl:call-template>
											</td>
											<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalTaxDepositAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 1) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm">1</div>
											<xsl:if test="((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="ShortMessage">true</xsl:with-param>
													<xsl:with-param name="TargetNode" select="$FormData/ClientInfoGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 2) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">2</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 3) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">3</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 4) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">4</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 5) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">5</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 6) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;padding-top:1mm;">6</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 7) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">7</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 8) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">8</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 9) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:1mm;">9</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 10) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;">10</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 11) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;">11</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 12) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;">12</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 13) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;">13</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 14) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;">14</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 15) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<div class="styLNLeftNumBox" style="width:5mm;height:5mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;">15</div>
										</td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell"><br/></td>
										<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<div class="IRS940ScheduleRTableContainer" style="display:block">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="IRS940ScheduleR_GenericCell" style="width:32.75mm;text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:10mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;text-align:right;">16</div>
										<div style="font-size:6pt;padding-top:0.5mm;">
											<b>Subtotals for clients.<br/></b> Add all amounts on<br/> lines 1 through 15	
											</div>
									</td>
									<!--The following cell is to space and shade the table correctly.-->
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:23mm;"/>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:32mm;"/>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/TotalTaxableWagesAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/TotalAdjustmentToFUTATaxAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/TotalCreditReductionAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:30mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/FUTATaxAfterAdjustmentAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:32mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/TotalTaxDepositAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<tr>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:left;font-weight:bold;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;background-color:lightgrey;height:16mm;padding-right:1mm;padding-left:0.5mm;text-align:right;">17</div>
										<div style="font-size:6pt;padding-top:0.5mm;">Enter the combined<br/>
										subtotal from line 23<br/> of all Continuation<br/>Sheets for Schedule R<br/> (Form 940).
										</div>
									</td>
									<!--The following cell is to space and shade the table correctly.-->
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:20mm;">
										</div>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:32mm;">
										</div>
									</td>
									<td class="IRS940ScheduleR_GenericCell"><br/></td>
									<td class="IRS940ScheduleR_GenericCell"><br/></td>
									<td class="IRS940ScheduleR_GenericCell"><br/></td>
									<td class="IRS940ScheduleR_GenericCell"><br/></td>
									<td class="IRS940ScheduleR_GenericCell" style="border-right-width:0px"><br/></td>
								</tr>
								<tr>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:left;font-weight:bold;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;height:10mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:0.5mm;text-align:right;">18</div>
										<div style="font-size:6pt;padding-top:0.5mm;">Enter Form 940<br/> amounts for your<br/>employees</div>
									</td>
									<!--The following cell is to space and shade the table correctly.-->
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:20mm;">
										</div>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:32mm;">
										</div>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/TotalTaxableWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/TotalAdjustmentToFUTATaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/TotalCreditReductionAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/FUTATaxAfterAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<tr>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:left;padding-left:0px;padding-top:0px;padding-bottom:0px;padding-right:0px;height:16mm;">
										<div class="styLNLeftNumBox" style="width:5mm;height:16mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;text-align:right;">19</div>
										<div style="font-size:6pt;padding-top:0.5mm;">
											<b>Totals.</b> Add lines 16, 17,<br/> and 18. The column<br/> totals must match the <br/> related lines on the<br/>aggregate Form 940.
										</div>
									</td>
									<!--The following cell is to space and shade the table correctly.-->
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:20mm;"/>											
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;background-color:lightgrey;">
										<div style="width:32mm;"/>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/TotalTaxableWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/TotalAdjustmentToFUTATaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/TotalCreditReductionAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/FUTATaxAfterAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:0px;vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<xsl:if test="($Print != $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/ClientInfoGrp"/>
							<xsl:with-param name="containerHeight" select="15"/>
							<!--<xsl:with-param name="headerRowCount" select="1"/>-->
							<xsl:with-param name="containerID" select="'SchRCtn'"/>
						</xsl:call-template>
					</xsl:if>
					<!--Page Footer-->
					<div class="pageEnd" style="width:256mm;border-top-width:1px;border-bottom-width:0px;">
						<div style="font-weight:bold;width:90mm;float:left;padding-left:0mm;">
							For Paperwork Reduction Act Notice, see the instructions.
					  </div>
						<div style="width:90mm;float:left;text-align:center;padding-top:0.2mm">
							<span style="width:20mm;"/>Cat. No. 53082A
					  </div>
						<div style="width:74mm;text-align:right;float:left;">
							<span style="font-weight:bold;">Schedule R (Form 940) (Rev. 12-2017)</span>
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
					</table>
					<!--Begin Separated Table-->
					<xsl:if test="($Print = $Separated) and (count($FormData/ClientInfoGrp) &gt; 15)">
						<br/>
						<span class="styRepeatingDataTitle">Schedule R (Form 940): Allocation Schedule for Aggregate Form 940 Filers</span>
						<table class="styDepTbl" style="font-size:6.0pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<!-- Column a -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(a)<br/>Client’s Employer<br/>Identification Number <br/>(EIN)
										</div>
									</th>
									<!-- Column b -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:23mm;">
											(b)<br/>State<br/>abbreviation<br/>
											<span style="font-weight:normal;">
											from Form<br/>940, line 1a,<br/>or Schedule A<br/>(Form 940)</span>
										</div>
									</th>
									<!-- Column c -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(c)<br/>Type of wages, tips, and<br/> other compensation<br/>
											<span style="font-weight:normal;">
											(CPEO Use Only)</span>
										</div>
									</th>
									<!-- Column d -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(d)<br/>Total taxable FUTA<br/>wages
											<b style="font-weight:normal;">
											allocated to<br/>the listed client EIN<br/>from Form 940, line 7</b>
										</div>
									</th>
									<!-- Column e -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(e)<br/>Total adjustments<br/>to FUTA tax<br/>
											<span style="font-weight:normal">
											allocated to the <br/>listed client EIN from <br/>Form 940, line 9 or line 10</span>
										</div>
									</th>
									<!-- Column f -->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(f)<br/>Credit reduction amount<br/>
											<span style="font-weight:normal;">
											allocated to the<br/>listed client EIN from<br/>Form 940, line 11</span>
										</div>
									</th>
									<!-- Column g-->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:30mm;">
											(g)<br/>Total FUTA tax<br/>after adjustments<br/> 
											<b style="font-weight:normal;">
											allocated to the <br/>listed client EIN from<br/>Form 940, line 12</b>
										</div>
									</th>
									<!-- Column h-->
									<th class="IRS940ScheduleR_GenericCellHeader" scope="col">
										<div style="width:32mm;">
											(h)<br/>Total FUTA tax deposits<br/>
											<span style="font-weight:normal;">
											from Form 940, line 13,<br/>plus any payment made<br/>with the return allocated<br/>to the listed client EIN</span>
										</div>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$FormData/ClientInfoGrp">
									<tr style="border-color:black;">
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
												<xsl:otherwise>styDepTblRow2</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;height:3mm;">
											<xsl:choose>
												<xsl:when test="position() &gt; 9">
													<xsl:choose>													
														<xsl:when test="position() &lt;= 15">
															<div class="styLNLeftNumBox" style="width:5mm;height:2mm;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;">
																<xsl:value-of select="position()"/>
															</div>
														</xsl:when>
														<xsl:otherwise>
															<div class="styLNLeftNumBox" style="width:5mm;height:2mm;padding-right:1mm;padding-left:0.5mm;padding-top:1mm;"/>
														</xsl:otherwise>
													</xsl:choose>
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
										<td class="IRS940ScheduleR_GenericCell" style="text-align:center;border-right-width:1px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FUTAStateCd"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalTaxableWagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalTaxableWagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalAdjustmentToFUTATaxAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalCreditReductionAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/FUTATaxAfterAdjustmentAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_GenericCell" style="text-align:right;border-right-width:0px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalTaxDepositAmt"/>
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
