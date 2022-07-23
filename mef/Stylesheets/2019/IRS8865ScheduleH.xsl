<?xml version="1.0" encoding="UTF-8"?>
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
	<xsl:include href="IRS8865ScheduleHStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8865ScheduleH" />
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
				<meta name="Description" content="IRS Form 8865 Schedule H" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8865ScheduleHStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8865ScheduleH">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:19mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:10pt;">SCHEDULE H
								<br/>
								(Form 8865)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template>
							</div>
							<div class="" style="padding-top:.5mm;font-size:7pt;">(November 2018)</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:129mm;height:19mm;">
							<span class="styFMT" style="font-size:11pt;">Acceleration Events and Exceptions Reporting Relating <br />
							to Gain Deferral Method Under Section 721(c)</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 8865. See the Instructions for Form 8865.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8865</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:19mm;border-left-width:2px;">  
							<div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;">OMB No. 1545-1668</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;">Name of person filing Form 8865
							<br />
							<xsl:choose>
								<xsl:when test="$FormData/FilerName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FilerName/BusinessNameLine1Txt" />
									</xsl:call-template>
									<xsl:if test="$FormData/FilerName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/FilerName/BusinessNameLine2Txt" />
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FilerPersonNm"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Filer's identifying number</strong>
							<br />
							<xsl:choose>
								<!-- SSN -->
								<xsl:when test="$FormData/FilerSSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$FormData/FilerSSN" />
									</xsl:call-template>
								</xsl:when>
								<!-- EIN -->
								<xsl:when test="$FormData/FilerEIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/FilerEIN" />
									</xsl:call-template>
								</xsl:when>
								<!-- Missing EIN Reason Code -->
								<xsl:when test="$FormData/MissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd" />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<!-- If data is not present on the form, then populate using data from Return Header instead -->
									<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:93mm;height:7.75mm;">
							Name of partnership
							<br />			
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipName/BusinessNameLine1Txt" />
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipName/BusinessNameLine2Txt" />
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:22mm;height:7.75mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SuccessorPartnershipInd"/>
									<xsl:with-param name="BackupName">F8865SchHSuccessorPartnershipInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="float:right;font-size:7pt;padding-right:2mm;padding-top:1mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SuccessorPartnershipInd"/>
										<xsl:with-param name="BackupName">F8865SchHSuccessorPartnershipInd</xsl:with-param>
									</xsl:call-template>Successor <br /> partnership</label>
							</span>
						</div>
						<div class="styEINBox" style="height:7.75mm;width:20mm;padding-left:0.5mm;font-weight:normal;border-right:1px solid black;">
							EIN (if any)
							<br />
							<xsl:choose>
								<xsl:when test="$FormData/FrgnPrtshpMissingEINReasonCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FrgnPrtshpMissingEINReasonCd" />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipEIN" />
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styNameBox" style="height:7.75mm;width:52mm;padding-left:0.5mm;font-weight:normal;border-right:0px solid black;">
							Reference ID number (see instructions)
							<br />
							 <xsl:choose>
								 <xsl:when test="string-length($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 30 or 
								 (count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
										  -See Add'l Data-
								</xsl:when>
								<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum" />
										</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:93mm;height:7.75mm;">
							Name of U.S. transferor (see instructions)
							<br />
							<xsl:choose>
								<xsl:when test="$FormData/TransferorBusinessName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TransferorBusinessName/BusinessNameLine1Txt" />
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TransferorBusinessName/BusinessNameLine2Txt" />
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TransferorPersonNm" />
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styNameBox" style="width:25mm;height:7.75mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SuccessorUSTransferorInd"/>
									<xsl:with-param name="BackupName">F8865SchHSuccessorUSTransferorInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="float:right;font-size:7pt;padding-right:0.7mm;padding-top:1mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SuccessorUSTransferorInd"/>
										<xsl:with-param name="BackupName">F8865SchHSuccessorUSTransferorInd</xsl:with-param>
									</xsl:call-template>Successor <br /> U.S. transferor</label>
							</span>
						</div>
						<div class="styEINBox" style="height:7.75mm;width:69mm;padding-left:0.5mm;font-weight:normal;">
							Filing year: (see instructions) <br />
							<input type="checkbox" class="styCkbox" style="margin-left:2px;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TYGainDeferralContributionInd"/>
									<xsl:with-param name="BackupName">F8865SchHTYGainDeferralContributionInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/TYGainDeferralContributionInd"/>
									<xsl:with-param name="BackupName">F8865SchHTYGainDeferralContributionInd</xsl:with-param>
								</xsl:call-template>Tax year of gain deferral contribution</label>
							<input type="checkbox" class="styCkbox" style="margin-left:2mm;">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/AnnualReportingInd"/>
									<xsl:with-param name="BackupName">F8865SchHAnnualReportingInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AnnualReportingInd"/>
									<xsl:with-param name="BackupName">F8865SchHAnnualReportingInd</xsl:with-param>
								</xsl:call-template>Annual reporting</label>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:167mm;">Acceleration Event <span style="font-weight:normal;">(see instructions)</span></div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/AccelerationEventGrp"/>
								<xsl:with-param name="containerID" select=" 'SchHTable1' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="3"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP1" select="($Print = $Separated) and (count($FormData/AccelerationEventGrp) &gt; 3)"/>
					<div class="styTableContainer" id="SchHTable1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:17mm;font-weight:normal;">
										<strong>(a)</strong><br /> Schedule G, <br /> Part I, <br /> line number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:78mm;font-weight:normal;">
										<strong>(b)</strong><br /> Description of event
									</th>
									<th class="styTableCellHeader" scope="col" style="width:19mm;font-weight:normal;">
										<strong>(c)</strong><br /> Date of event
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(d)</strong><br /> Gain Recognized
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<strong>(e)</strong><br /> Partnership's <br /> adjustment to <br /> section 721(c) <br /> property tax basis
									</th>
									<th class="styTableCellHeader" scope="col" style="width:17mm;font-weight:normal;border-right-width:0px;">
										<strong>(f)</strong><br /> Partial <br /> acceleration <br /> event
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP1)">
									<xsl:for-each select="$FormData/AccelerationEventGrp">
										<tr>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EventDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="EventDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainRcgnzByAccelerationAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PartialAccelerationEventInd"/>
														<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>PartialAccelerationEventInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Partial Acceleration Event</xsl:attribute>
												</input>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/AccelerationEventGrp) &lt; 1) or $shouldSepP1">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/AccelerationEventGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>PartialAccelerationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 1 Partial Acceleration Event</xsl:attribute>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/AccelerationEventGrp) &lt; 2) or $shouldSepP1">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>PartialAccelerationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 2 Partial Acceleration Event</xsl:attribute>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/AccelerationEventGrp) &lt; 3) or $shouldSepP1">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="/.."/>
													<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>PartialAccelerationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 3 Partial Acceleration Event</xsl:attribute>
											</input>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/AccelerationEventGrp"/>
							<xsl:with-param name="containerID" select=" 'SchHTable1' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="3"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:167mm;">Termination Event <span style="font-weight:normal;">(see instructions)</span></div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TerminationEventGrp"/>
								<xsl:with-param name="containerID" select=" 'SchHTable2' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="3"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP2" select="($Print = $Separated) and (count($FormData/TerminationEventGrp) &gt; 3)"/>
					<div class="styTableContainer" id="SchHTable2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:17mm;font-weight:normal;">
										<strong>(a)</strong><br /> Schedule G, <br /> Part I, <br /> line number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:151mm;font-weight:normal;">
										<strong>(b)</strong><br /> Description of event
									</th>
									<th class="styTableCellHeader" scope="col" style="width:19mm;font-weight:normal;border-right-width:0px;">
										<strong>(c)</strong><br /> Date of event
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP2)">
									<xsl:for-each select="$FormData/TerminationEventGrp">
										<tr>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EventDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="EventDt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/TerminationEventGrp) &lt; 1) or $shouldSepP2">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TerminationEventGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/TerminationEventGrp) &lt; 2) or $shouldSepP2">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/TerminationEventGrp) &lt; 3) or $shouldSepP2">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP2)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TerminationEventGrp"/>
							<xsl:with-param name="containerID" select=" 'SchHTable2' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="3"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:167mm;">Successor Event <span style="font-weight:normal;">(see instructions)</span></div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/SuccessorEventGrp"/>
								<xsl:with-param name="containerID" select=" 'SchHTable3' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="3"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP3" select="($Print = $Separated) and (count($FormData/SuccessorEventGrp) &gt; 3)"/>
					<div class="styTableContainer" id="SchHTable3">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:17mm;font-weight:normal;">
										<strong>(a)</strong><br /> Schedule G, <br /> Part I, <br /> line number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:68mm;font-weight:normal;">
										<strong>(b)</strong><br /> Description of event
									</th>
									<th class="styTableCellHeader" scope="col" style="width:19mm;font-weight:normal;">
										<strong>(c)</strong><br /> Date of event
									</th>
									<th class="styTableCellHeader" scope="col" style="width:83mm;font-weight:normal;border-right-width:0px;">
										<strong>(d)</strong><br /> Name, address, and U.S. taxpayer identification number (U.S. TIN) (if any) of successor partnership, lower-tier partnership, upper-tier partnership, or U.S. corporation (as applicable)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP3)">
									<xsl:for-each select="$FormData/SuccessorEventGrp">
										<tr>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EventDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="EventDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="BusinessName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="EIN">
													<br />
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="MissingEINReasonCd">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="USAddress">
													<br />
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ForeignAddress">
													<br />
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/SuccessorEventGrp) &lt; 1) or $shouldSepP3">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/SuccessorEventGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/SuccessorEventGrp) &lt; 2) or $shouldSepP3">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/SuccessorEventGrp) &lt; 3) or $shouldSepP3">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP3)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/SuccessorEventGrp"/>
							<xsl:with-param name="containerID" select=" 'SchHTable3' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="3"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="width:167mm;">Taxable Disposition of a Portion of an Interest in Partnership Event <span style="font-weight:normal;">(see instructions)</span></div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TxblDisposPrtnIntPrtshpEvtGrp"/>
								<xsl:with-param name="containerID" select=" 'SchHTable4' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="3"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP4" select="($Print = $Separated) and (count($FormData/TxblDisposPrtnIntPrtshpEvtGrp) &gt; 3)"/>
					<div class="styTableContainer" id="SchHTable4">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:68mm;font-weight:normal;">
										<strong>(a)</strong><br /> Description of event
									</th>
									<th class="styTableCellHeader" style="width:19mm;font-weight:normal;">
										<strong>(b)</strong><br /> Date of event
									</th>
									<th class="styTableCellHeader" style="width:28mm;font-weight:normal;">
										<strong>(c)</strong><br /> Percentage <br /> of partnership <br /> interest disposed
									</th>
									<th class="styTableCellHeader" style="width:28mm;font-weight:normal;">
										<strong>(d)</strong><br /> Percentage <br /> of partnership <br /> interest retained
									</th>
									<th class="styTableCellHeader" style="width:44mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong><br /> Aggregate remaining <br /> built-in gain attributed to <br /> partnership interest retained
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP4)">
									<xsl:for-each select="$FormData/TxblDisposPrtnIntPrtshpEvtGrp">
										<tr>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EventDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="EventDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="PartnershipInterestDisposedPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="PartnershipInterestRetainedPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotRmngGainPrtshpIntRtnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/TxblDisposPrtnIntPrtshpEvtGrp) &lt; 1) or $shouldSepP4">
									<tr>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/TxblDisposPrtnIntPrtshpEvtGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;"></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/TxblDisposPrtnIntPrtshpEvtGrp) &lt; 2) or $shouldSepP4">
									<tr>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;"></td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/TxblDisposPrtnIntPrtshpEvtGrp) &lt; 3) or $shouldSepP4">
									<tr>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;"></td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP4)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TxblDisposPrtnIntPrtshpEvtGrp"/>
							<xsl:with-param name="containerID" select=" 'SchHTable4' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="3"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 5 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc" style="width:167mm;">Section 367 Transfer Event <span style="font-weight:normal;">(see instructions)</span></div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/Sect367TransferEventGrp"/>
								<xsl:with-param name="containerID" select=" 'SchHTable5' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="3"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP5" select="($Print = $Separated) and (count($FormData/Sect367TransferEventGrp) &gt; 3)"/>
					<div class="styTableContainer" id="SchHTable5">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:17mm;font-weight:normal;">
										<strong>(a)</strong><br /> Schedule G, <br /> Part I, <br /> line number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:50mm;font-weight:normal;">
										<strong>(b)</strong><br /> Description of event
									</th>
									<th class="styTableCellHeader" scope="col" style="width:19mm;font-weight:normal;">
										<strong>(c)</strong><br /> Date of event
									</th>
									<th class="styTableCellHeader" scope="col" style="width:26mm;font-weight:normal;">
										<strong>(d)</strong><br /> Gain recognized
									</th>
									<th class="styTableCellHeader" scope="col" style="width:75mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong><br /> Name, address, and U.S. TIN (if any) <br /> of foreign transferee <br /> corporation (as applicable)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP5)">
									<xsl:for-each select="$FormData/Sect367TransferEventGrp">
										<tr>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="EventDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="EventDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainRcgnzBySect367TrnsfrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="BusinessName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="EIN">
													<br />
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="MissingEINReasonCd">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="USAddress">
													<br />
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ForeignAddress">
													<br />
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:if>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/Sect367TransferEventGrp) &lt; 1) or $shouldSepP5">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/Sect367TransferEventGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Sect367TransferEventGrp) &lt; 2) or $shouldSepP5">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Sect367TransferEventGrp) &lt; 3) or $shouldSepP5">
									<tr>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP5)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/Sect367TransferEventGrp"/>
							<xsl:with-param name="containerID" select=" 'SchHTable5' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="3"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 6 -->
					<div class="styStdDiv">
						<div class="styPartName">Part VI</div>
						<div class="styPartDesc" style="border-bottom:1px solid black;">Supplemental Information <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<xsl:for-each select="$FormData/SupplementalInformationTxt">
						<div class="styStdDiv" style="min-height:6mm;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/SupplementalInformationTxt) &lt; 1">
						<div class="styStdDiv" style="min-height:6mm;border-bottom:1px dashed black;">&nbsp;</div>
					</xsl:if>
					<xsl:if test="count($FormData/SupplementalInformationTxt) &lt; 2">
						<div class="styStdDiv" style="min-height:6mm;border-bottom:1px dashed black;">&nbsp;</div>
					</xsl:if>
					<xsl:if test="count($FormData/SupplementalInformationTxt) &lt; 3">
						<div class="styStdDiv" style="min-height:6mm;">&nbsp;</div>
					</xsl:if>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the Instructions for Form 8865.</span>
						<span style="margin-left:20mm;font-size:6.5pt;">Cat. No. 26331C</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule H (Form 8865) (11-2018)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Reference ID Number -->
					<xsl:if test="string-length($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 30 or
					 (count($FormData/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum) &gt; 1)">
						 <span class="styRepeatingDataTitle">
							 <br />
						</span>
						<table class="styDepTbl" style="font-size:7pt">
							<thead class="styTableHead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="text-align:left">
										Reference ID number (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ForeignEntityIdentificationGrp">
									<tr>
										<!-- Alternate background colors -->
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
											<br />
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 1 separated table -->
					<xsl:if test="$shouldSepP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part I - Acceleration Event</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:17mm;">
										<strong>(a)</strong><br /> Schedule G, <br /> Part I, <br /> line number
									</th>
									<th class="styDepTblCell" scope="col" style="width:78mm;">
										<strong>(b)</strong><br /> Description of event
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;">
										<strong>(c)</strong><br /> Date of event
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">
										<strong>(d)</strong><br /> Gain Recognized
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">
										<strong>(e)</strong><br /> Partnership's <br /> adjustment to <br /> section 721(c) <br /> property tax basis
									</th>
									<th class="styDepTblCell" scope="col" style="width:17mm;">
										<strong>(f)</strong><br /> Partial <br /> acceleration <br /> event
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/AccelerationEventGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EventDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="EventDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainRcgnzByAccelerationAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="PartialAccelerationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>PartialAccelerationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Partial Acceleration Event</xsl:attribute>
											</input>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 2 separated table -->
					<xsl:if test="$shouldSepP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II - Termination Event</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:17mm;">
										<strong>(a)</strong><br /> Schedule G, <br /> Part I, <br /> line number
									</th>
									<th class="styDepTblCell" scope="col" style="width:151mm;">
										<strong>(b)</strong><br /> Description of event
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;">
										<strong>(c)</strong><br /> Date of event
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TerminationEventGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EventDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="EventDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 3 separated table -->
					<xsl:if test="$shouldSepP3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III - Successor Event</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:17mm;">
										<strong>(a)</strong><br /> Schedule G, <br /> Part I, <br /> line number
									</th>
									<th class="styDepTblCell" scope="col" style="width:68mm;">
										<strong>(b)</strong><br /> Description of event
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;">
										<strong>(c)</strong><br /> Date of event
									</th>
									<th class="styDepTblCell" scope="col" style="width:83mm;">
										<strong>(d)</strong><br /> Name, address, and U.S. taxpayer identification number (U.S. TIN) (if any) of successor partnership, lower-tier partnership, upper-tier partnership, or U.S. corporation (as applicable)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/SuccessorEventGrp">
									<tr style="border-color:black;height:6mm;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EventDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="EventDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="BusinessName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="EIN">
												<br />
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="MissingEINReasonCd">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="USAddress">
												<br />
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="USAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ForeignAddress">
												<br />
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="ForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 4 separated table -->
					<xsl:if test="$shouldSepP4">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part IV - Taxable Disposition of a Portion of an Interest in Partnership Event</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:68mm;">
										<strong>(a)</strong><br /> Description of event
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;">
										<strong>(b)</strong><br /> Date of event
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">
										<strong>(c)</strong><br /> Percentage <br /> of partnership <br /> interest disposed
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">
										<strong>(d)</strong><br /> Percentage <br /> of partnership <br /> interest retained
									</th>
									<th class="styDepTblCell" scope="col" style="width:44mm;">
										<strong>(e)</strong><br /> Aggregate remaining <br /> built-in gain attributed to <br /> partnership interest retained
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TxblDisposPrtnIntPrtshpEvtGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EventDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="EventDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PartnershipInterestDisposedPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="PartnershipInterestRetainedPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotRmngGainPrtshpIntRtnAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 5 separated table -->
					<xsl:if test="$shouldSepP5">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part V - Section 367 Transfer Event</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:17mm;">
										<strong>(a)</strong><br /> Schedule G, <br /> Part I, <br /> line number
									</th>
									<th class="styDepTblCell" scope="col" style="width:50mm;">
										<strong>(b)</strong><br /> Description of event
									</th>
									<th class="styDepTblCell" scope="col" style="width:19mm;">
										<strong>(c)</strong><br /> Date of event
									</th>
									<th class="styDepTblCell" scope="col" style="width:26mm;">
										<strong>(d)</strong><br /> Gain Recognized
									</th>
									<th class="styDepTblCell" scope="col" style="width:75mm;">
										<strong>(e)</strong><br /> Name, address, and U.S. TIN (if any) <br /> of foreign transferee <br /> corporation (as applicable)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Sect367TransferEventGrp">
									<tr style="border-color:black;height:6mm;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="EventDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="EventDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainRcgnzBySect367TrnsfrAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="BusinessName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="EIN">
												<br />
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="MissingEINReasonCd">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="USAddress">
												<br />
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="USAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ForeignAddress">
												<br />
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="ForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
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
