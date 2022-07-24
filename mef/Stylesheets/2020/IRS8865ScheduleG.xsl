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
	<xsl:include href="IRS8865ScheduleGStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8865ScheduleG" />
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
				<meta name="Description" content="IRS Form 8865 Schedule G" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8865ScheduleGStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8865ScheduleG">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Header -->		
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:30mm;height:19mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:10pt;">SCHEDULE G
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
						<div class="styFTBox" style="width:196mm;height:19mm;">
							<span class="styFMT" style="font-size:11pt;">Statement of Application of the Gain Deferral Method <br />
							Under Section 721(c)</span>
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
						<div class="styTYBox" style="width:30mm;height:19mm;border-left-width:2px;">  
							<div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;">OMB No. 1545-1668</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:204mm;">
							Name of person filing Form 8865<br />
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
							<strong>Filer's identification number</strong>
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
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:154mm;height:7.75mm;">
							Name of partnership<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipName/BusinessNameLine1Txt" />
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipName/BusinessNameLine2Txt" />
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:25mm;height:7.75mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/SuccessorPartnershipInd"/>
									<xsl:with-param name="BackupName">F8865SchHSuccessorPartnershipInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="float:right;font-size:7pt;padding-right:5mm;padding-top:1mm;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SuccessorPartnershipInd"/>
										<xsl:with-param name="BackupName">F8865SchHSuccessorPartnershipInd</xsl:with-param>
									</xsl:call-template>Successor <br /> partnership</label>
							</span>
						</div>
						<div class="styEINBox" style="height:7.75mm;width:25mm;padding-left:0.5mm;font-weight:normal;border-right:1px solid black;">
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
					<div class="styStdDivLS" style="border-top:1px solid black;">
						<div class="styNameBox" style="width:154mm;height:7.75mm;">
							Name of U.S. transferor (see instructions)<br />
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
						<div class="styEINBox" style="height:7.75mm;width:77mm;padding-left:0.5mm;font-weight:normal;">
							Filing year: (see instructions) <br />
							<input type="checkbox" class="styCkbox">
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
							<input type="checkbox" class="styCkbox" style="margin-left:6mm;">
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
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:167mm;">Section 721(c) Property <span style="font-weight:normal;">(see instructions)</span></div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
								<xsl:with-param name="containerID" select=" 'SchGTable1' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP1" select="($Print = $Separated) and (count($FormData/Section721CPropertyGrp) &gt; 4)"/>
					<div class="styTableContainerLandscapeNBB" id="SchGTable1">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:19mm;font-weight:normal;">
										<strong>1.</strong><br /> Tax year of <br /> contribution
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:34mm;font-weight:normal;">
										<strong>2.</strong><br /> Description of property
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:17mm;font-weight:normal;">
										<strong>3.</strong><br /> Recovery <br /> Period
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:15mm;font-weight:normal;">
										<strong>4.</strong><br /> Section <br /> 197(f)(9) <br /> property
									</th>
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:15mm;font-weight:normal;">
										<strong>5.</strong><br /> Effectively <br /> connected <br /> income <br /> property
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="3" style="width:81mm;font-weight:normal;">
										<strong>6.</strong> On the date of contribution
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="5" style="width:75mm;font-weight:normal;border-right-width:0px;">
										<strong>7.</strong> Events
									</th>
								</tr>
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(a)</strong><br /> Fair market <br /> value
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong><br /> Basis
									</th>
									<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong><br /> Built-in gain
									</th>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(a)</strong><br /> Acceleration (including partial acceleration event)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(b)</strong><br /> Termination
									</th>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(c)</strong><br /> Successor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(d)</strong><br /> Tax disposition of a portion of partnership interest
									</th>
									<th class="styTableCellHeader" scope="col" style="width:15mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong><br /> Section 367 transfer
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP1)">
									<xsl:for-each select="$FormData/Section721CPropertyGrp">
										<tr style="vertical-align:middle;min-height:7mm;">
											<td class="styTableCellTextInherit" style="vertical-align:bottom;">
												<span style="width:7mm;text-align:right;font-weight:bold;float:left;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="LineNum"/>
													</xsl:call-template>
												</span>
												<span style="width:10mm;text-align:right;float:right;">
													<xsl:call-template name="PopulateYear">
														<xsl:with-param name="TargetNode" select="ContributionYr"/>
													</xsl:call-template>
												</span>
											</td>
											<td class="styTableCellTextInherit" style="vertical-align:bottom;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PropertyDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="vertical-align:bottom;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="RecoveryPeriodDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Section197f9PropertyInd"/>
														<xsl:with-param name="BackupName">8865SchG<xsl:value-of select="position()"/>Section197f9PropertyInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Section 197 f 9 property</xsl:attribute>
												</input>
											</td>
											<td class="styTableCellCtrInherit">
												<input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="ECIPropertyInd"/>
														<xsl:with-param name="BackupName">8865SchG<xsl:value-of select="position()"/>ECIPropertyInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> ECI property</xsl:attribute>
												</input>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BuiltInGainAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="AccelerationEventInd"/>
														<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>AccelerationEventInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Acceleration Event</xsl:attribute>
												</input>
											</td>
											<td class="styTableCellCtrInherit">
												<input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="TerminationEventInd"/>
														<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>TerminationEventInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Termination Event</xsl:attribute>
												</input>
											</td>
											<td class="styTableCellCtrInherit">
												<input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="SuccessorEventInd"/>
														<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>SuccessorEventInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Successor Event</xsl:attribute>
												</input>
											</td>
											<td class="styTableCellCtrInherit">
												<input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="TxDisposPrtnPrtshpIntEvtInd"/>
														<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>TxDisposPrtnPrtshpIntEvtInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Tax disposition of portion of partnership interest event</xsl:attribute>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="Sect367TransferEvtInd"/>
														<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>Sect367TransferEvtInd</xsl:with-param>
													</xsl:call-template>
													<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Section 367 transfer event</xsl:attribute>
												</input>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 1) or $shouldSepP1">
									<tr style="vertical-align:middle;min-height:7mm;">
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">
											<span style="width:7mm;text-align:right;font-weight:bold;float:left;">1</span>
											<span style="width:10mm;text-align:right;float:right;">&nbsp;</span>
										</td>
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Section197f9PropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG1Section197f9PropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 1 Section 197 f 9 property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ECIPropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG1ECIPropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 1 ECI property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AccelerationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH1AccelerationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 1 Acceleration Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TerminationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH1TerminationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 1 Termination Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="SuccessorEventInd"/>
													<xsl:with-param name="BackupName">8865SchH1SuccessorEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 1 Successor Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TxDisposPrtnPrtshpIntEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH1TxDisposPrtnPrtshpIntEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 1 Tax disposition of portion of partnership interest event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Sect367TransferEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH1Sect367TransferEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 1 Section 367 transfer event</xsl:attribute>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 2) or $shouldSepP1">
									<tr style="vertical-align:middle;min-height:7mm;">
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">
											<span style="width:7mm;text-align:right;font-weight:bold;float:left;"><br />2</span>
											<span style="width:10mm;text-align:right;float:right;">&nbsp;</span>
										</td>
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Section197f9PropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG2Section197f9PropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 2 Section 197 f 9 property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ECIPropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG2ECIPropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 2 ECI property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AccelerationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH2AccelerationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 2 Acceleration Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TerminationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH2TerminationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 2 Termination Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="SuccessorEventInd"/>
													<xsl:with-param name="BackupName">8865SchH2SuccessorEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 2 Successor Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TxDisposPrtnPrtshpIntEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH2TxDisposPrtnPrtshpIntEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 2 Tax disposition of portion of partnership interest event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Sect367TransferEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH2Sect367TransferEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 2 Section 367 transfer event</xsl:attribute>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 3) or $shouldSepP1">
									<tr style="vertical-align:middle;min-height:7mm;">
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">
											<span style="width:7mm;text-align:right;font-weight:bold;float:left;"><br />3</span>
											<span style="width:10mm;text-align:right;float:right;">&nbsp;</span>
										</td>
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Section197f9PropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG3Section197f9PropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 3 Section 197 f 9 property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ECIPropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG3ECIPropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 3 ECI property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AccelerationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH3AccelerationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 3 Acceleration Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TerminationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH3TerminationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 3 Termination Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="SuccessorEventInd"/>
													<xsl:with-param name="BackupName">8865SchH3SuccessorEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 3 Successor Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TxDisposPrtnPrtshpIntEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH3TxDisposPrtnPrtshpIntEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 3 Tax disposition of portion of partnership interest event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Sect367TransferEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH3Sect367TransferEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 3 Section 367 transfer event</xsl:attribute>
											</input>
										</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 4) or $shouldSepP1">
									<tr style="vertical-align:middle;min-height:7mm;">
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">
											<span style="width:7mm;text-align:right;font-weight:bold;float:left;">4</span>
											<span style="width:10mm;text-align:right;float:right;">&nbsp;</span>
										</td>
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Section197f9PropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG4Section197f9PropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 4 Section 197 f 9 property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ECIPropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG4ECIPropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 4 ECI property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">&nbsp;</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AccelerationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH4AccelerationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 4 Acceleration Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TerminationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH4TerminationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 4 Termination Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="SuccessorEventInd"/>
													<xsl:with-param name="BackupName">8865SchH4SuccessorEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 4 Successor Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TxDisposPrtnPrtshpIntEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH4TxDisposPrtnPrtshpIntEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 4 Tax disposition of portion of partnership interest event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="border-right-width:0px;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Sect367TransferEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH4Sect367TransferEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row 4 Section 367 transfer event</xsl:attribute>
											</input>
										</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
							<xsl:with-param name="containerID" select=" 'SchGTable1' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS" style="padding-top:3.5mm;">
						<div class="styLNDesc" style="width:230mm;padding-left:4mm;padding-top:1.5mm;height:auto;">
							Do the tiered partnership rules of Temporary Regulations section 1.721(c)-3T(d) apply to this partnership? See instructions 
							<span class="sty8865SchGDotLn">.................</span>
						</div>
						<div class="styLNDesc" style="width:25mm;font-weight:bold;height:auto;">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/TieredPrtshpRlsApplyInd"/>
							</xsl:call-template>
							<input type="checkbox" style="styCkboxNM">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TieredPrtshpRlsApplyInd"/>
									<xsl:with-param name="BackupName">F8865SchGTieredPrtshpRlsApplyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/TieredPrtshpRlsApplyInd"/>
									<xsl:with-param name="BackupName">F8865SchGTieredPrtshpRlsApplyInd</xsl:with-param>
								</xsl:call-template>Yes</label>
							<span style="width:4mm;height:2mm;"/>
							<input type="checkbox" style="styCkboxNM">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/TieredPrtshpRlsApplyInd"/>
									<xsl:with-param name="BackupName">F8865SchGTieredPrtshpRlsApplyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$FormData/TieredPrtshpRlsApplyInd"/>
									<xsl:with-param name="BackupName">F8865SchGTieredPrtshpRlsApplyInd</xsl:with-param>
								</xsl:call-template>No</label>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:230mm;">Remaining Built-in Gain, Remedial Income, and Gain Recognition <span style="font-weight:normal;">(see instructions)</span></div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
								<xsl:with-param name="containerID" select=" 'SchGTable2' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP2" select="($Print = $Separated) and (count($FormData/Section721CPropertyGrp) &gt; 4)"/>
					<div class="styTableContainerLandscapeNBB" id="SchGTable2">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:16mm;font-weight:normal;">
										<br /> Part I, <br /> line <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(a)</strong><br /> Remaining built-in gain at <br /> beginning of tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(b)</strong><br /> Remaining built-in gain at <br /> end of tax year
									</th>
									<th class="styTableCellHeader" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(c)</strong><br /> Remedial income allocated <br /> to U.S. transferor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(d)</strong><br /> Gain recognized <br /> due to acceleration event
									</th>
									<th class="styTableCellHeader" scope="col" style="width:48mm;font-weight:normal;border-right-width:0px;">
										<strong>(e)</strong><br /> Gain recognized <br /> due to section 367 transfer
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP2)">
									<xsl:for-each select="$FormData/Section721CPropertyGrp">
										<tr>
											<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RemainingBuiltInGainBOYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RemainingBuiltInGainEOYAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RmdlIncmAllocUSTrnsfrAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainRcgnzByAccelerationAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainRcgnzBySect367TrnsfrAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 1) or $shouldSepP2">
									<tr>
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">1</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 2) or $shouldSepP2">
									<tr>
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">2</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 3) or $shouldSepP2">
									<tr>
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">3</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 4) or $shouldSepP2">
									<tr>
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">4</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP2)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
							<xsl:with-param name="containerID" select=" 'SchGTable2' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS">
						<div class="styTableCellTextInherit" style="float:left;width:16.1mm;padding-left:4mm;font-weight:bold;padding-top:0.5mm;padding-bottom:0.5mm;">Total*</div>
						<div class="styTableCellAmtInherit" style="float:left;width:47.9mm;padding-top:0.5mm;padding-bottom:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotRemainingBuiltInGainBOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styTableCellAmtInherit" style="float:left;width:48.1mm;padding-top:0.5mm;padding-bottom:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotRemainingBuiltInGainEOYAmt"/>
							</xsl:call-template>
						</div>
						<div class="styTableCellAmtInherit" style="float:left;width:48mm;padding-top:0.5mm;padding-bottom:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotRmdlIncmAllocUSTrnsfrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styTableCellAmtInherit" style="float:left;width:48.1mm;padding-top:0.5mm;padding-bottom:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotGainRcgnzByAccelerationAmt"/>
							</xsl:call-template>
						</div>
						<div class="styTableCellAmtInherit" style="float:left;width:47.8mm;border-right-width:0px;padding-top:0.5mm;padding-bottom:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotGainRcgnzBySect367TrnsfrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS" style="padding-top:3.5mm;">
						<div class="styLNDesc" style="width:230mm;padding-left:4mm;height:auto;">
							* Total must include any amounts included on an attached statement. See instructions.
						</div>
					</div>
					<!-- Page 1 footer -->
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the Instructions for Form 8865.</span>
						<span style="margin-left:50mm;font-size:6.5pt;">Cat. No. 71017D</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule G (Form 8865) (11-2018)</span>
					</div>
					<div class="styStdDivLS">
						Schedule G (Form 8865) (11-2018)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<!-- Part 3 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:230mm;">
							Allocation Percentages of Partnership Items With Respect to Section 721(c) Property
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
								<xsl:with-param name="containerID" select=" 'SchGTable3' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP3" select="($Print = $Separated) and (count($FormData/Section721CPropertyGrp) &gt; 3)"/>
					<div class="styTableContainerLandscapeNBB" id="SchGTable3">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:16mm;font-weight:normal;">
										<br /> Part I, <br /> line number
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="3" style="width:60mm;font-weight:normal;">
										<strong>1.</strong> Income
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="3" style="width:60mm;font-weight:normal;">
										<strong>2.</strong> Gain
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="3" style="width:60mm;font-weight:normal;">
										<strong>3.</strong> Deduction
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="3" style="width:60mm;font-weight:normal;border-right-width:0px;">
										<strong>4.</strong> Loss
									</th>
								</tr>
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> U.S. <br /> transferor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Related domestic partners
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong><br /> Related foreign partners
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> U.S. <br /> transferor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Related domestic partners
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong><br /> Related foreign partners
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> U.S. <br /> transferor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Related domestic partners
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong><br /> Related foreign partners
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> U.S. <br /> transferor
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Related domestic partners
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(c)</strong><br /> Related foreign partners
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP3)">
									<xsl:for-each select="$FormData/Section721CPropertyGrp">
										<tr style="">
											<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="USTransferorIncomePct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="RelatedDomesticPartnerIncmPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="RelatedForeignPartnerIncomePct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="USTransferorGainPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="RelatedDomesticPartnerGainPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="RelatedForeignPartnerGainPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="USTransferorDedPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="RelatedDomesticPartnerDedPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="RelatedForeignPartnerDedPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="USTransferorLossPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="RelatedDomesticPartnerLossPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="RelatedForeignPartnerLossPct"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 1) or $shouldSepP3">
									<tr style="">
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">1</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
												<xsl:with-param name="ShortMessage" select="true()"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 2) or $shouldSepP3">
									<tr style="">
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">2</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 3) or $shouldSepP3">
									<tr style="">
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">3</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 4) or $shouldSepP3">
									<tr style="">
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">4</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP3)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
							<xsl:with-param name="containerID" select=" 'SchGTable3' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 4 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="width:230mm;">
							Allocation of Items to U.S. Transferor With Respect to Section 721(c) Property
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
						<div style="float:right;width:5mm;height:4mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
								<xsl:with-param name="containerID" select=" 'SchGTable4' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="4"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:variable name="shouldSepP4" select="($Print = $Separated) and (count($FormData/Section721CPropertyGrp) &gt; 4)"/>
					<div class="styTableContainerLandscapeNBB" id="SchGTable4">
						<xsl:call-template name="SetInitialState"/>
						<table class="styTable" style="border-collapse:collapse;font-size:7pt;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" rowspan="2" scope="col" style="width:16mm;font-weight:normal;">
										<br /> Part I, <br /> line number
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:60mm;font-weight:normal;">
										<strong>1.</strong> Income
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:60mm;font-weight:normal;">
										<strong>2.</strong> Gain
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:60mm;font-weight:normal;">
										<strong>3.</strong> Deduction
									</th>
									<th class="styTableCellHeader" scope="colgroup" colspan="2" style="width:60mm;font-weight:normal;border-right-width:0px;">
										<strong>4.</strong> Loss
									</th>
								</tr>
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> Book
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> Book
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> Book
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Tax
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> Book
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;border-right-width:0px;">
										<strong>(b)</strong><br /> Tax
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepP4)">
									<xsl:for-each select="$FormData/Section721CPropertyGrp">
										<tr style="">
											<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IncomePerBooksAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="IncomePerTaxReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainPerBooksAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GainPerTaxReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeductionPerBooksAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeductionPerTaxReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LossPerBooksAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LossPerTaxReturnAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 1) or $shouldSepP4">
									<tr style="">
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">1</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
												<xsl:with-param name="ShortMessage" select="true()"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 2) or $shouldSepP4">
									<tr style="">
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">2</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 3) or $shouldSepP4">
									<tr style="">
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">3</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="(count($FormData/Section721CPropertyGrp) &lt; 4) or $shouldSepP4">
									<tr style="">
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">4</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSepP4)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/Section721CPropertyGrp"/>
							<xsl:with-param name="containerID" select=" 'SchGTable4' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="4"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 5 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc" style="width:226mm;">
							Additional Information 
							<span style="font-weight:normal;">(see instructions). If "Yes" to any question 1 through 6b below, complete Schedule H.</span>
						</div>
						<div class="styLNRightNumBoxNBB">Yes</div>
						<div class="styLNRightNumBoxNBB">No</div>
					</div>
					<!-- P5 Line 1 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="height:7mm;width:224mm;">
							During the tax year, did an acceleration event or partial acceleration event (as described in Temporary Regulations section 1.721(c)&ndash;4T or Temporary Regulations <br />
							section 1.721(c)&ndash;5T(d)) occur with respect to one or more section 721(c) properties?
							<span class="sty8865SchGDotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />1</div>
						<div class="styLNRightNumBox" style="font-weight:normal;height:7mm;"><br />
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Sect721cAccelerationEventInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;height:7mm;"><br />
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Sect721cAccelerationEventInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P5 Line 2 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:224mm;">
							During the tax year, did a termination event (as described in Temporary Regulations section 1.721(c)&ndash;5T(b)) occur with respect to one or more section 721(c) properties?
							<span class="sty8865SchGDotLn">..</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section721cTerminationEventInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section721cTerminationEventInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P5 Line 3 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:224mm;">
							During the tax year, did a successor event (as described in Temporary Regulations section 1.721(c)&ndash;5T(c)) occur with respect to one or more section 721(c) properties?
							<span class="sty8865SchGDotLn">...</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section721cSuccessorEventInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section721cSuccessorEventInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P5 Line 4 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:224mm;">
							During the tax year, was there a tax disposition of a portion of an interest in the partnership (as described in Temporary Regulations section 1.721(c)&ndash;5T(f))?
							<span class="sty8865SchGDotLn">......</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/S721cDisposPrtnPrtshpIntEvtInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/S721cDisposPrtnPrtshpIntEvtInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P5 Line 5 -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="height:7mm;width:224mm;">
							During the tax year, was there a direct or indirect transfer of section 721(c) property to a foreign corporation subject to section 367 (as described in <br />Temporary Regulations section 1.721(c)&ndash;5T(e))?
							<span class="sty8865SchGDotLn">........................................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:0px;"><span style="width:100%;height:3.2mm;background-color:lightgrey;"/><br />5</div>
						<div class="styLNRightNumBox" style="font-weight:normal;height:7mm;padding-top:0px;"><span style="width:100%;height:3.2mm;background-color:lightgrey;"/><br />
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Sect721cSect367TransferEvtInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;height:7mm;padding-top:0px;"><span style="width:100%;height:3.2mm;background-color:lightgrey;"/><br />
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Sect721cSect367TransferEvtInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P5 Line 6a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">6a</div>
						<div class="styLNDesc" style="height:7mm;width:224mm;">
							Was any additional section 721(c) property contributed to the section 721(c) partnership during the tax year? If "Yes," complete Schedule O, include each <br />
							contributed property in Part I above and information with respect to the property in Parts II-IV above, and complete line 6b
							<span class="sty8865SchGDotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:0px;"><span style="width:100%;height:3.2mm;background-color:lightgrey;"/><br />6a</div>
						<div class="styLNRightNumBox" style="font-weight:normal;height:7mm;padding-top:0px;"><span style="width:100%;height:3.2mm;background-color:lightgrey;"/><br />
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/AddnlSect721cPropContriInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;height:7mm;padding-top:0px;"><span style="width:100%;height:3.2mm;background-color:lightgrey;"/><br />
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/AddnlSect721cPropContriInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P5 Line 6b -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="width:224mm;">
							Is the gain deferral method applied with respect to one or more of such additional section 721(c) property contributed? 
							<span class="sty8865SchGDotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">6b</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/GainDeferralMethodAppliedInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/GainDeferralMethodAppliedInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P5 Line 7a -->
					<div class="styStdDivLS">
						<div class="styLNLeftNumBoxSD">7a</div>
						<div class="styLNDesc" style="height:7mm;width:224mm;">
							Was a copy of the waiver of treaty benefits (as described in Temporary Regulations section 1.721(c)&ndash;6T(b)(2)(iii)) filed with respect to each section 721(c) <br />
							property contribution to the section 721(c) partnership? If "Yes," complete line 7b
							<span class="sty8865SchGDotLn">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:0px;"><span style="width:100%;height:3.2mm;background-color:lightgrey;"/><br />7a</div>
						<div class="styLNRightNumBox" style="font-weight:normal;height:7mm;padding-top:0px;"><span style="width:100%;height:3.2mm;background-color:lightgrey;"/><br />
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CopyWaiverTreatyBenefitsFldInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="font-weight:normal;height:7mm;padding-top:0px;"><span style="width:100%;height:3.2mm;background-color:lightgrey;"/><br />
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/CopyWaiverTreatyBenefitsFldInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- P5 Line 7b -->
					<div class="styStdDivLS">
						<div class="styLNLeftLtrBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="height:19mm;width:224mm;">
							With respect to each section 721(c) property for which a waiver of treaty benefits was filed, after exercising reasonable diligence, has the U.S. transferor determined that to <br />
							the best of its knowledge and belief, all income from section 721(c) property allocated to the partners during the tax year remained subject to taxation as income effectively <br />
							connected with the conduct of a trade or business within the United States (under either section 871 or 882) for all direct or indirect partners that are related foreign persons <br />
							with respect to the U.S. transferor (regardless of whether any such partner was a partner at the time of the gain deferral contribution), and that neither the section 721(c) <br />
							partnership nor any such partner has made any claim under an income tax convention to an exemption from U.S. income tax or a reduced rate of U.S. income taxation on <br />
							income derived from the use of section 721(c) property? See Temporary Regulations section 1.721&ndash;6T(b)(3)(vi)
							<span class="sty8865SchGDotLn">....................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:19mm;padding-top:0px;"><span style="width:100%;height:15.2mm;background-color:lightgrey;"/><br />7b</div>
						<div class="styLNRightNumBoxNBB" style="font-weight:normal;height:19mm;padding-top:0px;"><span style="width:100%;height:15.2mm;background-color:lightgrey;"/><br />
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section721cECIPropertyInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="font-weight:normal;height:19mm;padding-top:0px;"><span style="width:100%;height:15.2mm;background-color:lightgrey;"/><br />
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/Section721cECIPropertyInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 6 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part VI</div>
						<div class="styPartDesc">Supplemental Information <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<xsl:for-each select="$FormData/SupplementalInfoTxt">
						<div class="styStdDivLS" style="min-height:6mm;border-bottom:1px dashed black;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="."/>
							</xsl:call-template>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/SupplementalInfoTxt) &lt; 1">
						<div class="styStdDivLS" style="min-height:6mm;border-bottom:1px dashed black;">&nbsp;</div>
					</xsl:if>
					<xsl:if test="count($FormData/SupplementalInfoTxt) &lt; 2">
						<div class="styStdDivLS" style="min-height:6mm;border-bottom:1px dashed black;">&nbsp;</div>
					</xsl:if>
					<xsl:if test="count($FormData/SupplementalInfoTxt) &lt; 3">
						<div class="styStdDivLS" style="min-height:6mm;">&nbsp;</div>
					</xsl:if>
					<!-- Form footer-->
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule G (Form 8865) (11-2018)</span>
					</div>
					<!-- Additional Data title bar and button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
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
						<span class="styRepeatingDataTitle">Part I - Section 721(c) Property</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:19mm;font-weight:normal;">
										<strong>1.</strong><br /> Tax year of <br /> contribution
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:34mm;font-weight:normal;">
										<strong>2.</strong><br /> Description of property
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:17mm;font-weight:normal;">
										<strong>3.</strong><br /> Recovery <br /> Period
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:15mm;font-weight:normal;">
										<strong>4.</strong><br /> Section <br /> 197(f)(9) <br /> property
									</th>
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:15mm;font-weight:normal;">
										<strong>5.</strong><br /> Effectively <br /> connected <br /> income <br /> property
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="3" style="width:81mm;font-weight:normal;">
										<strong>6.</strong> On the date of contribution
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="5" style="width:75mm;font-weight:normal;">
										<strong>7.</strong> Events
									</th>
								</tr>
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(a)</strong><br /> Fair market <br /> value
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(b)</strong><br /> Basis
									</th>
									<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;">
										<strong>(c)</strong><br /> Built-in gain
									</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(a)</strong><br /> Acceleration (including partial acceleration event)
									</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(b)</strong><br /> Termination
									</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(c)</strong><br /> Successor
									</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(d)</strong><br /> Tax disposition of a portion of partnership interest
									</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-weight:normal;">
										<strong>(e)</strong><br /> Section 367 transfer
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Section721CPropertyGrp">
									<tr style="border-color:black;height:7mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">
											<span style="width:7mm;text-align:right;font-weight:bold;float:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</span>
											<span style="width:10mm;text-align:right;float:right;">
												<xsl:call-template name="PopulateYear">
													<xsl:with-param name="TargetNode" select="ContributionYr"/>
												</xsl:call-template>
											</span>
										</td>
										<td class="styTableCellTextInherit" style="vertical-align:bottom;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit" style="vertical-align:bottom;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="RecoveryPeriodDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Section197f9PropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG<xsl:value-of select="position()"/>Section197f9PropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Section 197 f 9 property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ECIPropertyInd"/>
													<xsl:with-param name="BackupName">8865SchG<xsl:value-of select="position()"/>ECIPropertyInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> ECI property</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjustedBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="vertical-align:bottom;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="BuiltInGainAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AccelerationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>AccelerationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Acceleration Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TerminationEventInd"/>
													<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>TerminationEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Termination Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="SuccessorEventInd"/>
													<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>SuccessorEventInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Successor Event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="TxDisposPrtnPrtshpIntEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>TxDisposPrtnPrtshpIntEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Tax disposition of portion of partnership interest event</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="Sect367TransferEvtInd"/>
													<xsl:with-param name="BackupName">8865SchH<xsl:value-of select="position()"/>Sect367TransferEvtInd</xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Row <xsl:value-of select="position()"/> Section 367 transfer event</xsl:attribute>
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
						<span class="styRepeatingDataTitle">Part II - Remaining Built-in Gain, Remedial Income, and Gain Recognition</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:16mm;font-weight:normal;">
										<br /> Part I, <br /> line <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(a)</strong><br /> Remaining built-in gain at <br /> beginning of tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(b)</strong><br /> Remaining built-in gain at <br /> end of tax year
									</th>
									<th class="styDepTblCell" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(c)</strong><br /> Remedial income allocated <br /> to U.S. transferor
									</th>
									<th class="styDepTblCell" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(d)</strong><br /> Gain recognized <br /> due to acceleration event
									</th>
									<th class="styDepTblCell" scope="col" style="width:48mm;font-weight:normal;">
										<strong>(e)</strong><br /> Gain recognized <br /> due to section 367 transfer
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Section721CPropertyGrp">
									<tr style="border-color:black;height:4mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RemainingBuiltInGainBOYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RemainingBuiltInGainEOYAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="RmdlIncmAllocUSTrnsfrAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainRcgnzByAccelerationAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainRcgnzBySect367TrnsfrAmt"/>
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
						<span class="styRepeatingDataTitle">Part III - Allocation Percentages of Partnership Items With Respect to Section 721(c) Property</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:16mm;font-weight:normal;">
										<br /> Part I, <br /> line number
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="3" style="width:60mm;font-weight:normal;">
										<strong>1.</strong> Income
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="3" style="width:60mm;font-weight:normal;">
										<strong>2.</strong> Gain
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="3" style="width:60mm;font-weight:normal;">
										<strong>3.</strong> Deduction
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="3" style="width:60mm;font-weight:normal;">
										<strong>4.</strong> Loss
									</th>
								</tr>
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> U.S. <br /> transferor
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Related domestic partners
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong><br /> Related foreign partners
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> U.S. <br /> transferor
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Related domestic partners
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong><br /> Related foreign partners
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> U.S. <br /> transferor
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Related domestic partners
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong><br /> Related foreign partners
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> U.S. <br /> transferor
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Related domestic partners
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(c)</strong><br /> Related foreign partners
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Section721CPropertyGrp">
									<tr style="border-color:black;height:4mm;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="USTransferorIncomePct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="RelatedDomesticPartnerIncmPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="RelatedForeignPartnerIncomePct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="USTransferorGainPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="RelatedDomesticPartnerGainPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="RelatedForeignPartnerGainPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="USTransferorDedPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="RelatedDomesticPartnerDedPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="RelatedForeignPartnerDedPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="USTransferorLossPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="RelatedDomesticPartnerLossPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="RelatedForeignPartnerLossPct"/>
											</xsl:call-template>
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
						<span class="styRepeatingDataTitle">Part IV - Allocation of Items to U.S. Transferor With Respect to Section 721(c) Property</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" rowspan="2" scope="col" style="width:16mm;font-weight:normal;">
										<br /> Part I, <br /> line number
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:60mm;font-weight:normal;">
										<strong>1.</strong> Income
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:60mm;font-weight:normal;">
										<strong>2.</strong> Gain
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:60mm;font-weight:normal;">
										<strong>3.</strong> Deduction
									</th>
									<th class="styDepTblCell" scope="colgroup" colspan="2" style="width:60mm;font-weight:normal;">
										<strong>4.</strong> Loss
									</th>
								</tr>
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> Book
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> Book
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> Book
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Tax
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(a)</strong><br /> Book
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<strong>(b)</strong><br /> Tax
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/Section721CPropertyGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="padding-left:4mm;font-weight:bold;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="LineNum"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IncomePerBooksAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="IncomePerTaxReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainPerBooksAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainPerTaxReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeductionPerBooksAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeductionPerTaxReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LossPerBooksAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LossPerTaxReturnAmt"/>
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
</xsl:stylesheet>
