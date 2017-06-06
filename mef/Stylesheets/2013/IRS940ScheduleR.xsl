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
			<body class="styBodyClass">
				<form name="IRS940ScheduleR">
					<xsl:call-template name="DocumentHeader"/>
					<!-- BEGIN FORM HEADER -->
					<!--  Begin Header-->
                    <div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styFNBox" style="width:158mm;border:0px;padding-top:5mm;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<span class="styFormNumber" style="font-size:12.5pt;">  
								Schedule R (Form 940): Allocation Schedule for Aggregate Form 940 Filers
							</span>
						</div>
						
						<div class="styTYBox" style="width:29mm;height:10mm;border:0px;">
						  <div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;">860512</div>
						  <div class="styOMB" style="font-size:7pt;text-align:right;border:0px;padding-top:1mm;">OMB No. 1545-0028</div>
					    </div>
				   
					    <div style="width:123mm;float:left;padding-top:0mm;">
							<div class="styAgency" style="font-weight:normal;width:123mm;padding-top:0mm;line-height:200%;padding-bottom:2mm;">
								(December 2012)<br/>
								Department of the Treasury — Internal Revenue Service
							</div>
							<div class="styBB" style="width:123mm;border-top-width:1px;border-left-width:1px;border-right-width:1px;padding-left:2mm;">
								<div style="width:118mm;padding-top:2mm;">
									<span style="float:left;font-size:6pt;">
										<b>Employer identification number<br/>(EIN)</b>
									</span>
									<span class="styLNCtrNumBox" style="width:78mm;height:6mm;padding-top:1mm;border-top-width:1px;float:right;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
										</xsl:call-template>
								    </span>
								</div>
								<div style="width:118mm;padding-bottom:4mm;padding-top:2mm;">
									<span style="float:left;font-size:6pt;padding-top:2mm;">
										<b>Name</b>
										<i> as shown on<br/>
Form 940</i>
									</span>
									<span class="styLNCtrNumBox" style="width:95mm;height:8mm;border-top-width:1px;float:right;text-align:left;padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
										</xsl:call-template><br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
						</div>
					
						<div style="float:right;padding-left:3mm;padding-top:4mm;padding-right:2mm;">
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
				
					<div class="styLNDesc" style="padding-bottom:4mm;padding-top:2mm;width:187mm;font-size:8pt;float:none;clear:both;">
						Read the separate instructions before you complete Schedule R (Form 940). Type or print within the boxes. 	
						Complete a separate line for the amounts allocated to each of your clients.
					</div>
					<div class="styGenericDiv" style="text-align:right;width:188mm;">
						<xsl:call-template name="SetDynamicTableToggleButton">
							<xsl:with-param name="TargetNode" select="$FormData/ClientInfoGrp"/>
							<xsl:with-param name="containerHeight" select="15"/>
							<xsl:with-param name="containerID" select="'SchRCtn'"/>
						</xsl:call-template>
					</div>
					<div class="IRS940ScheduleRTableContainer" id="SchRCtn">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
							<thead class="styTableThead">
								<!-- Column a -->
								<tr style="font-size:6pt;">
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										<div style="text-align:center;width:35.5mm;">
											(a)<br/>Client Employer<br/>Identification Number<br/>(EIN)
										</div>
									</th>
									<!-- Column b -->
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										<div style="text-align:center;width:16.1mm;">
											(b)<br/>State<br/>abbreviation<br/><span style="font-weight:normal;">from Form<br/>940, line 
											1a,<br/>or Schedule<br/>A (Form 940)</span>
										</div>
									</th>
									<!-- Column c -->
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										<div style="text-align:center;width:26.2mm;">
											(c)<br/>Total taxable FUTA<br/>wages<span style="font-weight:normal;"> allocated to<br/>the 
											listed client EIN<br/>from Form 940, line 7</span>
										</div>
									</th>
									<!-- Column d -->
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										<div style="text-align:center;width:26.2mm;">
											(d)<br/>Total adjustments<br/>to FUTA tax<br/><span style="font-weight:normal;">allocated to 
											the<br/>listed client EIN from<br/>Form 940, line 9 or<br/>line 10</span>
										</div>
									</th>
									<!-- Column e -->
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										<div style="text-align:center;width:26.2mm;">
											(e)<br/>Credit reduction<br/>amount <span style="font-weight:normal;">allocated<br/>to the 
											listed client<br/>EIN from Form 940,<br/>line 11</span>
										</div>
									</th>
									<!-- Column f -->
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										<div style="text-align:center;width:26.2mm;">
											(f)<br/>Total FUTA tax<br/>after adjustments<br/><span style="font-weight:normal;">allocated to 
											the<br/>listed client EIN from<br/>Form 940, line 12</span>
										</div>
									</th>
									<!-- Column g -->
									<th class="IRS940ScheduleR_CellHeader" style="border-right-width:0px;" scope="col">
										<div style="text-align:center;width:26.2mm;">
											(g)<br/>Total FUTA tax<br/>deposits <span style="font-weight:normal;">from<br/>Form 940, line 
											13,<br/>plus any payment<br/>made with the<br/>return allocated to<br/>the listed client EIN
											</span>
										</div>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($FormData/ClientInfoGrp) &lt;= 15)">
									<xsl:for-each select="$FormData/ClientInfoGrp">
										<tr>
											<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
												<xsl:choose>
													<xsl:when test="position() &gt; 9">
														<xsl:choose>
															<xsl:when test="position() &lt;= 15">
																<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">
																	<xsl:value-of select="position()"/>
																</div>
															</xsl:when>
															<xsl:otherwise>
																<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;"/>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:when>
													<xsl:otherwise>
														<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">
															<xsl:value-of select="position()"/>
														</div>
													</xsl:otherwise>
												</xsl:choose>
												<div style="padding-top:1.8mm;text-align:center;">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="IRS940ScheduleR_Cell" style="font-size:10pt;text-align:center;">
												<div style="width:100%;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="FUTAStateCd"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="IRS940ScheduleR_Cell">
												<div style="width:25mm;overflow:hidden;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalTaxableWagesAmt"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="IRS940ScheduleR_Cell">
												<div style="width:25mm;overflow:hidden;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalAdjustmentToFUTATaxAmt"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="IRS940ScheduleR_Cell">
												<div style="width:25mm;overflow:hidden;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalCreditReductionAmt"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="IRS940ScheduleR_Cell">
												<div style="width:25mm;overflow:hidden;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ClientDetailGrp/FUTATaxAfterAdjustmentAmt"/>
													</xsl:call-template>
												</div>
											</td>
											<td class="IRS940ScheduleR_Cell" style="border-right-width:0px">
												<div style="width:25mm;overflow:hidden;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalTaxDepositAmt"/>
													</xsl:call-template>
												</div>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 1) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="text-align:left; padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">1</div>
											<div style="width:28.6mm;overflow:hidden;"><br/></div>
											<xsl:if test="((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="$FormData/ClientInfoGrp"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 2) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">2</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 3) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">3</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 4) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">4</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 5) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">5</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 6) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;padding-top:3mm;">6</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 7) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">7</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 8) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">8</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 9) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:2mm;padding-top:3mm;">9</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 10) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">10</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 11) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">11</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 12) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">12</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 13) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">13</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 14) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">14</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
								
								<xsl:if test="(count($FormData/ClientInfoGrp) &lt; 15) or ((count($FormData/ClientInfoGrp) &gt; 15) and ($Print = $Separated))">
									<tr>
										<td class="IRS940ScheduleR_Cell" style="padding-left:0mm;padding-bottom:0mm;padding-top:0mm;">
											<div class="styLNLeftNumBox" style="width:5mm;height:6mm;background-color:lightgrey;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">15</div>
										</td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell"><br/></td>
										<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;"><br/></td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					
					<div class="IRS940ScheduleRTableContainer">
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<table cellspacing="0" style="font-size:7pt;margin-left:0mm">
							<thead/>
							<tfoot/>
							<tbody>
								<tr>
									<td class="IRS940ScheduleR_Cell" style="text-align:left;padding-left:0px;padding-right:0px;height:100%;">
									<div style="width:36mm;height:100%;">
										<div class="styLNLeftNumBox" style="width:5mm;height:100%;background-color:lightgrey;padding-right:1mm;padding-left:0.9mm;">16</div>
										<div style="padding-top:1mm;padding-bottom:1mm;height:100%;">
											<b>Subtotals for clients.</b><br/>Add all amounts on lines 1<br/>through 15.
										</div>
									</div>
									</td>
									<td class="IRS940ScheduleR_Cell" style="text-align:left;border-right-width:1px;background-color:lightgrey;">
										<div style="width:15.3mm;"/>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.5399mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/TotalTaxableWagesAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.53mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/TotalAdjustmentToFUTATaxAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/TotalCreditReductionAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.539mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/FUTATaxAfterAdjustmentAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="IRS940ScheduleR_Cell" style="border-right-width:0px;vertical-align:bottom;padding-bottom:2mm;">
										<div style="width:25.4mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/SubtotalForClientInfoGrp/TotalTaxDepositAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="IRS940ScheduleR_Cell" style="text-align:left;font-weight:bold;padding-left:0px;padding-right:0px;height:100%">
										<div class="styLNLeftNumBox" style="width:5mm;background-color:lightgrey;height:100%;padding-right:1mm;padding-left:0.9mm;">17</div>
										<div style="font-size:6pt;padding-top:1mm;padding-bottom:1mm;height:100%;">Enter the combined
										<br/>subtotal from line 26 of<br/>all Continuation Sheets<br/>for Schedule R (Form<br/>940).</div>
									</td>
									<td class="IRS940ScheduleR_Cell" style="text-align:left;background-color:lightgrey;">
										<br/>
									</td>
									<td class="IRS940ScheduleR_Cell"><br/></td>
									<td class="IRS940ScheduleR_Cell"><br/></td>
									<td class="IRS940ScheduleR_Cell"><br/></td>
									<td class="IRS940ScheduleR_Cell"><br/></td>
									<td class="IRS940ScheduleR_Cell" style="border-right-width:0px"><br/></td>
								</tr>
								
								<tr>
									<td class="IRS940ScheduleR_Cell" style="text-align:left;font-weight:bold;padding-left:0px;padding-right:0px;height:100%">
										<div class="styLNLeftNumBox" style="width:5mm;background-color:lightgrey;height:100%;padding-right:1mm;padding-left:0.9mm;">18</div>
										<div style="font-size:6pt;padding-top:1mm;padding-bottom:1mm;height:100%;">Enter Form 940 
											amounts<br/>for employees of the<br/>agent.
										</div>
									</td>
									<td class="IRS940ScheduleR_Cell" style="text-align:left;background-color:lightgrey;">
										<br/>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/TotalTaxableWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/TotalAdjustmentToFUTATaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/TotalCreditReductionAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/FUTATaxAfterAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_Cell" style="border-right-width:0px; vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AggregateRecipientDetailGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								
								<tr>
									<td class="IRS940ScheduleR_Cell" style="text-align:left;height:100%;padding-left:0px;">
										<div class="styLNLeftNumBox" style="width:5mm;background-color:lightgrey;height:100%;padding-right:1mm;padding-left:0.9mm;">19</div>
										<div style="font-size:6pt;padding-top:1mm;padding-bottom:1mm;height:100%">
											<b>Totals.</b> Add lines 16, 17,<br/>and 18. The column totals<br/>must match the related<br/>
											lines on the aggregate<br/>Form 940.
										</div>
									</td>
									<td class="IRS940ScheduleR_Cell" style="text-align:left;background-color:lightgrey;">
										<br/>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/TotalTaxableWagesAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/TotalAdjustmentToFUTATaxAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/TotalCreditReductionAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_Cell" style="vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/FUTATaxAfterAdjustmentAmt"/>
										</xsl:call-template>
									</td>
									<td class="IRS940ScheduleR_Cell" style="border-right-width:0px; vertical-align:bottom;padding-bottom:2mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotAggregateRcpntClientInfoGrp/TotalTaxDepositAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$FormData/ClientInfoGrp"/>
						<xsl:with-param name="containerHeight" select="15"/>
						<xsl:with-param name="containerID" select="'SchRCtn'"/>
					</xsl:call-template>
					
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;border-top-width:1px;border-bottom-width:0px;">
						<div style="font-weight:bold;width:88mm;float:left;padding-left:0mm;">
            For Paperwork Reduction Act Notice, see the instructions.
						</div>
						<div style="width:44mm;float:left;text-align:center;padding-top:.5mm">
            Cat. No. 53082A
						</div>
						<div style="width:54.9mm;text-align:right;float:left;">
							<span style="font-weight:bold;">Schedule R (Form 940) (12-2012)</span>
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
					<xsl:if test="($Print = $Separated) and (count($FormData/ClientInfoGrp) &gt; 15)">
						<br/>
						<span class="styRepeatingDataTitle">Schedule R (Form 940): Allocation Schedule for Aggregate Form 940 Filers</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="font-size:6pt;">
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										(a)<br/>Client Employer<br/>Identification Number<br/>(EIN)
									</th>
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										(b)<br/>State<br/>abbreviation<br/><span style="font-weight:normal;">from Form<br/>940, line 1a,<br/>or Schedule<br/>A (Form 940)</span>
									</th>
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										(c)<br/>Total taxable FUTA<br/>wages<span style="font-weight:normal;"> allocated to<br/>the 
										listed client EIN<br/>from Form 940, line 7</span>
									</th>
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										(d)<br/>Total adjustments<br/>to FUTA tax<br/><span style="font-weight:normal;">allocated to the
										<br/>listed client EIN from<br/>Form 940, line 9 or<br/>line 10</span>
									</th>
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										(e)<br/>Credit reduction<br/>amount <span style="font-weight:normal;">allocated<br/>to the listed 
										client<br/>EIN from Form 940,<br/>line 11</span>
									</th>
									<th class="IRS940ScheduleR_CellHeader" scope="col">
										(f)<br/>Total FUTA tax<br/>after adjustments<br/><span style="font-weight:normal">allocated to 
										the<br/>listed client EIN from<br/>Form 940, line 12</span>
									</th>
									<th class="IRS940ScheduleR_CellHeader" style="border-right-width:0px;" scope="col">
										(g)<br/>Total FUTA tax<br/>deposits <span style="font-weight:normal;">from<br/>Form 940, line 
										13,<br/>plus any payment<br/>made with the<br/>return allocated to<br/>the listed client EIN
										</span>
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
										<td class="IRS940ScheduleR_Cell" style="text-align:right;padding-left:0px;padding-top:0px;padding-bottom:0px;">
											<xsl:choose>
												<xsl:when test="position() &gt; 9">
													<xsl:choose>
														<xsl:when test="position() &lt;= 15">
															<div class="styLNLeftNumBox" style="width:5mm;height:6mm;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;">
																<xsl:value-of select="position()"/>
															</div>
														</xsl:when>
														<xsl:otherwise>
															<div class="styLNLeftNumBox" style="width:5mm;height:6mm;padding-right:1mm;padding-left:0.5mm;padding-top:3mm;"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:when>
												<xsl:otherwise>
													<div class="styLNLeftNumBox" style="width:5mm;height:6mm;padding-right:1mm;padding-left:2mm;padding-top:3mm;">
														<xsl:value-of select="position()"/>
													</div>
												</xsl:otherwise>
											</xsl:choose>
											<div style="padding-top:1.8mm;text-align:center;">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</div>
										</td>
										<td class="IRS940ScheduleR_Cell" style="text-align:center;border-right-width:1px;width:auto;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FUTAStateCd"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_Cell" style="text-align:right;border-right-width:1px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalTaxableWagesAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_Cell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalAdjustmentToFUTATaxAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_Cell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/TotalCreditReductionAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_Cell" style="text-align:right;border-right-width:1px">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ClientDetailGrp/FUTATaxAfterAdjustmentAmt"/>
											</xsl:call-template>
										</td>
										<td class="IRS940ScheduleR_Cell" style="text-align:right;border-right-width:0px">
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
