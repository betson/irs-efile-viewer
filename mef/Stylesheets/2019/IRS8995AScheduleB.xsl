<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8995AScheduleBStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8995AScheduleB" />
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
				<meta name="Description" content="IRS Form 8993" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
						<xsl:call-template name="AddOnStyle" />
						<xsl:call-template name="IRS8995AScheduleBStyle" />
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8995AScheduleB">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							<span class="styFN" style="font-size:12pt;font-family:Arial;">SCHEDULE B</span> <br /> 
							<span class="styFN" style="font-size:11pt;font-family:Arial;">(Form 8995-A)</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br /><br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:2mm;">Aggregation of Business Operations</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to your Form 8995-A.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8995-A</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. OMB 1545-0123</div>
							<div class="styTY">20<span class="styTYColor">19</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">55C</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;height:8mm;">Name(s) shown on return
							<br />
							<xsl:call-template name="PopulateFilerName">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Your taxpayer identification number</strong>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;padding-top:0.5mm;padding-bottom:0.5mm;">
						If you have more than one aggregated group, complete and attach as many Schedules B as needed. 
						Number the first aggregation "1" and any additional aggregations in numerical order (2, 3, 4, etc.). See instructions.
					</div>
					<xsl:for-each select="$FormData/BusOperationAggregationGrp">
						<div class="styStdDiv" style="padding-left:2.5mm;font-weight:bold;border-bottom:1px solid black;height:4.5mm;padding-top:0.5mm;">
							Aggregation No.: <span style="border-bottom:1px solid black;width:10mm;text-align:center;"><xsl:value-of select="position()"/></span>
						</div>
						<!-- Line 1 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:179mm;height:auto;">
								Provide a description of the aggregated trade or business and explanation of the factors met that allow the aggregation in 
								accordance with Regulations section 1.199A-4. In addition, if you hold a direct or indirect interest in a relevant pass-through 
								entity (RPE) that aggregates multiple trades or businesses, you must attach a copy of the RPE's aggregations.
							</div>
						</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TradeOrBusinessAggregationDesc"/>
							</xsl:call-template>
						</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;">&nbsp;</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;">&nbsp;</div>
						<!-- Line 2 -->
						<div class="styStdDiv" style="margin-top:3mm;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:179mm;height:auto;">
								Has this trade or business aggregation changed from the prior year? This includes changes in the aggregation due to a trade 
								or business being formed, acquired, disposed of, or ceasing operations. If yes, explain.
							</div>
						</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;"><br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PriorYearChangeDesc"/>
							</xsl:call-template>
						</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;">&nbsp;</div>
						<xsl:variable name="shouldSeparate" select="($Print = $Separated) and (count(BusinessAggregationInfoGrp) &gt; 3)"/>
						<xsl:variable name="tableID">SchBTable<xsl:value-of select="position()"/></xsl:variable>
						<div class="styStdDiv" style="border-bottom:1px solid black;min-height:7mm;">&nbsp;
							<div style="float:right;width:5mm;height:4mm;text-align:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="BusinessAggregationInfoGrp"/>
									<xsl:with-param name="containerID" select="$tableID"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerHeight" select="3"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 table -->
						<div class="styTableContainerNBB">
							<xsl:call-template name="SetInitialState" />
							<xsl:attribute name="id"><xsl:value-of select="$tableID"/></xsl:attribute>
							<table style="display:table;border-collapse:collapse;">
								<thead class="styTableThead">
									<tr style="height:12mm;vertical-align:top;">
										<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:86mm;font-weight:normal;padding-top:1.5mm;">
											<span style="float:left;font-weight:bold;padding-left:2.5mm;">3</span>
											<span style="font-weight:bold;">(a) </span> Name of trade or business
										</th>
										<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(b) </span> Taxpayer <br /> identification <br /> number
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(c) </span> Qualified <br /> business <br /> income/(loss)
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(d) </span> W-2 wages
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;padding-top:1.5mm;">
											<span style="font-weight:bold;">(e) </span> UBIA
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="not($shouldSeparate)">
										<xsl:for-each select="BusinessAggregationInfoGrp">
											<tr style="vertical-align:top;">
												<td class="styTableCellTextInherit" style="">
													<xsl:choose>
														<xsl:when test="PersonNm">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="TradeOrBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="TradeOrBusinessName/BusinessNameLine2Txt"><br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="TradeOrBusinessName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellCtrInherit">
													<xsl:choose>
														<xsl:when test="MissingEINReasonCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="SSN">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="SSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="EIN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="QlfyBusinessIncomeOrLossAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="W2WagesAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="UBIAAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="$shouldSeparate or count(BusinessAggregationInfoGrp) &lt; 1">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="BusinessAggregationInfoGrp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$shouldSeparate or count(BusinessAggregationInfoGrp) &lt; 2">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="">&nbsp;</td>
											<td class="styTableCellCtrInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$shouldSeparate or count(BusinessAggregationInfoGrp) &lt; 3">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="">&nbsp;</td>
											<td class="styTableCellCtrInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:if test="not($shouldSeparate)">
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="BusinessAggregationInfoGrp"/>
								<xsl:with-param name="containerID" select="$tableID"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="3"/>
							</xsl:call-template>
						</xsl:if>
						<div class="styStdDiv" style="border-bottom:1px solid black;">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:97.85mm;height:10mm;">
								<strong>Totals. </strong> Total columns (c), (d), and (e). Enter the total amounts on <br /> 
								Schedule C (Form 8995-A) or on Form 8995-A, Part II, for the <br /> 
								corresponding aggregation, as appropriate. See instructions
								<span class="sty8995ASchBDotLn">.....</span>
							</div>
							<div class="styLNAmountBoxNBB" style="width:26.95mm;height:10mm;padding-right:2px;"><br /><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotQlfyBusinessIncomeOrLossAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="width:26.95mm;height:10mm;padding-right:2px;"><br /><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalW2WagesAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="width:27mm;height:10mm;padding-right:2px;"><br /><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TotalUBIAAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/BusOperationAggregationGrp) &lt; 1">
						<div class="styStdDiv" style="padding-left:2.5mm;font-weight:bold;border-bottom:1px solid black;height:4.5mm;padding-top:0.5mm;">
							Aggregation No.: <span style="border-bottom:1px solid black;width:10mm;text-align:center;"></span>
						</div>
						<!-- Line 1 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:179mm;height:auto;">
								Provide a description of the aggregated trade or business and explanation of the factors met that allow the aggregation in 
								accordance with Regulations section 1.199A-4. In addition, if you hold a direct or indirect interest in a relevant pass-through 
								entity (RPE) that aggregates multiple trades or businesses, you must attach a copy of the RPE's aggregations.
							</div>
						</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;">&nbsp;
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TradeOrBusinessAggregationDesc"/>
							</xsl:call-template>-->
						</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;">&nbsp;</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;">&nbsp;</div>
						<!-- Line 2 -->
						<div class="styStdDiv" style="margin-top:3mm;">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:179mm;height:auto;">
								Has this trade or business aggregation changed from the prior year? This includes changes in the aggregation due to a trade 
								or business being formed, acquired, disposed of, or ceasing operations. If yes, explain.
							</div>
						</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;">&nbsp;
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PriorYearChangeDesc"/>
							</xsl:call-template>-->
						</div>
						<div class="styStdDiv" style="border-bottom:1px dashed black;min-height:7mm;">&nbsp;</div>
						<div class="styStdDiv" style="border-bottom:1px solid black;min-height:7mm;">&nbsp;</div>
						<!-- Line 45 table -->
						<xsl:variable name="shouldSeparate" select="($Print = $Separated) and (count(BusinessAggregationInfoGrp) &gt; 4)"/>
						<div class="styTableContainerNBB" id="SchBTable">
							<xsl:call-template name="SetInitialState" />
							<table style="display:table;border-collapse:collapse;">
								<thead class="styTableThead">
									<tr style="height:12mm;vertical-align:top;">
										<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:86mm;font-weight:normal;padding-top:1.5mm;">
											<span style="float:left;font-weight:bold;padding-left:2.5mm;">3</span>
											<span style="font-weight:bold;">(a) </span> Name of trade or business
										</th>
										<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(b) </span> Taxpayer <br /> identification <br /> number
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(c) </span> Qualified <br /> business <br /> income/(loss)
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(d) </span> W-2 wages
										</th>
										<th class="styTableCellHeader" scope="col" style="width:27mm;font-weight:normal;border-right-width:0px;padding-top:1.5mm;">
											<span style="font-weight:bold;">(e) </span> UBIA
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:if test="not($shouldSeparate)">
										<xsl:for-each select="BusinessAggregationInfoGrp">
											<tr style="vertical-align:top;">
												<td class="styTableCellTextInherit" style="padding-left:1mm;font-weight:bold;border-bottom-width:0px;border-right-width:0px;">
													<xsl:if test="position() = 1">45</xsl:if>
												</td>
												<td class="styTableCellTextInherit" style="">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="SCorporationName/BusinessNameLine2Txt"><br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="SCorporationName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</td>
												<td class="styTableCellCtrInherit">
													<xsl:choose>
														<xsl:when test="MissingEINReasonCd">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="SCorporationEIN"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="styTableCellAmtInherit">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CYExcessTaxableIncomeAmt"/>
													</xsl:call-template>
												</td>
												<td class="styTableCellAmtInherit" style="border-right-width:0px;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="CYExcessBusinessIntIncomeAmt"/>
													</xsl:call-template>
												</td>
											</tr>
										</xsl:for-each>
									</xsl:if>
									<xsl:if test="$shouldSeparate or count(BusinessAggregationInfoGrp) &lt; 1">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateAdditionalDataTableMessage">
													<xsl:with-param name="TargetNode" select="BusinessAggregationInfoGrp"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$shouldSeparate or count(BusinessAggregationInfoGrp) &lt; 2">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="">&nbsp;</td>
											<td class="styTableCellCtrInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
									<xsl:if test="$shouldSeparate or count(BusinessAggregationInfoGrp) &lt; 3">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit" style="">&nbsp;</td>
											<td class="styTableCellCtrInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
										</tr>
									</xsl:if>
								</tbody>
							</table>
						</div>
						<xsl:if test="not($shouldSeparate)">
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="BusinessAggregationInfoGrp"/>
								<xsl:with-param name="containerID" select=" 'SchBTable' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="3"/>
							</xsl:call-template>
						</xsl:if>
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:97.85mm;height:10mm;">
								<strong>Totals. </strong> Total columns (c), (d), and (e). Enter the total amounts on <br /> 
								Schedule C (Form 8995-A) or on Form 8995-A, Part II, for the <br /> 
								corresponding aggregation, as appropriate. See instructions
								<span class="sty8995ASchBDotLn">.....</span>
							</div>
							<div class="styLNAmountBoxNBB" style="width:26.95mm;height:10mm;background-color:lightgrey;">&nbsp;</div>
							<div class="styLNAmountBoxNBB" style="width:26.95mm;height:10mm;padding-right:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotCYSCorpShrExcessTxblIncmAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBoxNBB" style="width:27mm;height:10mm;padding-right:2px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotCYSCorpExcessBusIntIncmAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:14mm;">Cat. No. 72685V</span>
						<span style="float:right;font-weight:bold;">Schedule B (Form 8995-A) 2019</span>
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
					<xsl:for-each select="$FormData/BusOperationAggregationGrp">
						<xsl:variable name="shouldSeparate" select="($Print = $Separated) and (count(BusinessAggregationInfoGrp) &gt; 3)"/>
						<xsl:if test="$shouldSeparate">
							<br /><br />
							<span class="styRepeatingDataTitle">Aggregation No. <xsl:value-of select="position()"/> - Business Aggregation Information</span>
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:187mm;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
										<th class="styDepTblCell" scope="col" style="min-width:32mm;width:86mm;font-weight:normal;padding-top:1.5mm;">
											<span style="float:left;font-weight:bold;padding-left:2.5mm;">3</span>
											<span style="font-weight:bold;">(a) </span> Name of trade or business
										</th>
										<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(b) </span> Taxpayer <br /> identification <br /> number
										</th>
										<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(c) </span> Qualified <br /> business <br /> income/(loss)
										</th>
										<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(d) </span> W-2 wages
										</th>
										<th class="styDepTblCell" scope="col" style="width:27mm;font-weight:normal;padding-top:1.5mm;">
											<span style="font-weight:bold;">(e) </span> UBIA
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="BusinessAggregationInfoGrp">
										<tr style="border-color:black;vertical-align:top;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCellTextInherit" style="">
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TradeOrBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="TradeOrBusinessName/BusinessNameLine2Txt"><br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="TradeOrBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="SSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="QlfyBusinessIncomeOrLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="W2WagesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UBIAAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
