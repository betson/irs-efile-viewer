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
	<xsl:include href="IRS8995AStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8995A" />
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
				<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle" />
						<xsl:call-template name="IRS8995AStyle" />
				</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8995A">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							Form <span class="styFN" style="font-size:18pt;font-family:Arial;">8995-A</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:2mm;">Qualified Business Income Deduction</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Attach to tax return.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8995A</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-2294</div>
							<div class="styTY">20<span class="styTYColor">20</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">55A</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;">Name(s) shown on return
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
					<div class="styStdDiv" style="border-top:1px solid black;padding-top:0.5mm;padding-bottom:0.5mm;font-style:italic;font-family:Arial;border-bottom:1px solid black;">
					<b>Note:</b> You can claim the qualified business income deduction <b>only</b> if you have qualified business income from a qualified trade or business, real estate investment trust dividends, publicly traded partnership income, or a domestic production activities deduction passed through from an agricultural or horticultural cooperative. See instructions. Use this form if your taxable income, before your qualified business income deduction, is above $163,300 ($326,600 if married filing jointly), or you’re a patron of an agricultural or horticultural cooperative.
						</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Trade, Business, or Aggregation Information</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;padding-top:0.5mm;padding-bottom:0.5mm;font-style:italic;font-family:Arial;border-bottom:1px solid black;">
						Complete the schedules for Form 8995-A, (A, B, C, and/or D), as applicable, before starting Part I. Attach additional schedules when needed. See instructions.
						<div style="float:right;width:5mm;height:4mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp"/>
								<xsl:with-param name="containerID" select=" 'Part1Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="3"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1 table -->
					<xsl:variable name="shouldSeparate" select="($Print = $Separated) and (count($FormData/QBIDeductionInformationGrp) &gt; 3)"/>
					<div class="styTableContainerNBB" id="Part1Table">
						<xsl:call-template name="SetInitialState" />
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="height:12mm;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="width:8mm;padding-left:2.5mm;text-align:left;">1</th>
									<th class="styTableCellHeader" scope="col" style="min-width:32mm;width:90mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(a) </span> Trade, business, or aggregation name
									</th>
									<th class="styTableCellHeader" scope="col" style="width:22mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(b) </span> Check if specified service
									</th>
									<th class="styTableCellHeader" scope="col" style="width:22mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(c) </span> Check if aggregation
									</th>
									<th class="styTableCellHeader" scope="col" style="width:23mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(d) </span> Taxpayer <br /> identification <br /> number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:22mm;font-weight:normal;border-right-width:0px;padding-top:1.5mm;">
										<span style="font-weight:bold;">(e) </span> Check if patron
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparate)">
									<xsl:for-each select="$FormData/QBIDeductionInformationGrp">
										<tr style="vertical-align:top;min-height:7mm;">
											<td class="styTableCellTextInherit" style="font-weight:bold;text-align:right;vertical-align:bottom;padding-right:3mm;"><xsl:number value="position()" format="A"/></td>
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
											<td class="styTableCellCtrInherit" style="vertical-align:bottom;">
												<input type="checkbox" class="styCkboxNM">
													<xsl:attribute name="alt">Line <xsl:number value="position()" format="A"/> Specified Service Indicator</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="SpecifiedServiceInd"/>
														<xsl:with-param name="BackupName">F8995ASpecifiedServiceInd<xsl:value-of select="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
											<td class="styTableCellCtrInherit" style="vertical-align:bottom;">
												<input type="checkbox" class="styCkboxNM">
													<xsl:attribute name="alt">Line <xsl:number value="position()" format="A"/> Aggregated Indicator</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="AggregatedInd"/>
														<xsl:with-param name="BackupName">F8995AAggregatedInd<xsl:value-of select="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
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
											<td class="styTableCellCtrInherit" style="vertical-align:bottom;border-right-width:0px;">
												<input type="checkbox" class="styCkboxNM">
													<xsl:attribute name="alt">Line <xsl:number value="position()" format="A"/> Patron Indicator</xsl:attribute>
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="PatronInd"/>
														<xsl:with-param name="BackupName">F8995APatronInd<xsl:value-of select="position()"/></xsl:with-param>
													</xsl:call-template>
												</input>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/QBIDeductionInformationGrp) &lt; 1">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="font-weight:bold;text-align:right;vertical-align:bottom;padding-right:3mm;">A</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/QBIDeductionInformationGrp) &lt; 2">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="font-weight:bold;text-align:right;vertical-align:bottom;padding-right:3mm;">B</td>
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/QBIDeductionInformationGrp) &lt; 3">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="font-weight:bold;text-align:right;vertical-align:bottom;padding-right:3mm;">C</td>
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
							<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="3"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Determine Your Adjusted Qualified Business Income</div>
					</div>
					<xsl:for-each select="$FormData/QBIDeductionInformationGrp">
						<xsl:if test="position() mod 3 = 1">
							<xsl:variable name="pos" select="position()"/>
							<!-- Column Headers -->
							<div class="styStdDiv" style="border-top:1px solid black;">
								<div class="styLNLeftNumBox">&nbsp;</div>
								<div class="sty8995ADesc">&nbsp;</div>
								<div class="styLNRightNumBox" style="height:6mm;border-left-width:0px;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:6mm;padding-top:1.5mm;text-align:center;font-weight:bold;"><xsl:number value="$pos" format="A"/></div>
								<div class="sty8995AAmtBox" style="height:6mm;padding-top:1.5mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 1" format="A"/></div>
								<div class="sty8995AAmtBox" style="height:6mm;padding-top:1.5mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 2" format="A"/></div>
							</div>
							<!-- Line 2 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBoxSD">2</div>
								<div class="sty8995ADesc" style="height:7mm;">
									Qualified business income from the trade, business, or aggregation. See instructions
									<span class="sty8995ADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;"><br />2</div>
								<div class="sty8995AAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QualifiedBusinessIncomeAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/QualifiedBusinessIncomeAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/QualifiedBusinessIncomeAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 3 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBoxSD">3</div>
								<div class="sty8995ADesc" style="height:10mm;">
									Multiply line 2 by 20% (0.20). If your taxable income is $163,300 or less ($326,600 if married 
									filing jointly), skip lines 4 through 12 and enter the amount from line 3 on line 13
									<span class="sty8995ADotLn">..</span>
								</div>
								<div class="styLNRightNumBox" style="height:10mm;"><br /><br />3</div>
								<div class="sty8995AAmtBox" style="height:10mm;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QlfyBusinessIncome20PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="height:10mm;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/QlfyBusinessIncome20PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="height:10mm;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/QlfyBusinessIncome20PctAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 4 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBoxSD">4</div>
								<div class="sty8995ADesc" style="min-height:7.2mm;height:auto;">
									Allocable share of W-2 wages from the trade, business, or aggregation
									<span class="sty8995ADotLn">...............</span>
								</div>
								<div class="styLNRightNumBox" style="min-height:7.2mm;height:auto;"><br />4</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AllocableShareW2WagesAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/AllocableShareW2WagesAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/AllocableShareW2WagesAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 5 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBoxSD">5</div>
								<div class="sty8995ADesc">
									Multiply line 4 by 50% (0.50)
									<span class="sty8995ADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">5</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AllocableShareW2Wages50PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/AllocableShareW2Wages50PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/AllocableShareW2Wages50PctAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 6 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBoxSD">6</div>
								<div class="sty8995ADesc">
									Multiply line 4 by 25% (0.25)
									<span class="sty8995ADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">6</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AllocableShareW2Wages25PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/AllocableShareW2Wages25PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/AllocableShareW2Wages25PctAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 7 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBoxSD">7</div>
								<div class="sty8995ADesc" style="min-height:7.2mm;height:auto;">
									Allocable share of the unadjusted basis immediately after acquisition (UBIA) of all qualified property
									<span class="sty8995ADotLn">......</span>
								</div>
								<div class="styLNRightNumBox" style="min-height:7.2mm;height:auto;"><br />7</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AllocableShareUBIAQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/AllocableShareUBIAQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/AllocableShareUBIAQlfyPropAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 8 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBoxSD">8</div>
								<div class="sty8995ADesc">
									Multiply line 7 by 2.5% (0.025)
									<span class="sty8995ADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">8</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AllcblShrUBIAQlfyProp025PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/AllcblShrUBIAQlfyProp025PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/AllcblShrUBIAQlfyProp025PctAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 9 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBoxSD">9</div>
								<div class="sty8995ADesc">
									Add lines 6 and 8
									<span class="sty8995ADotLn">..............</span>
								</div>
								<div class="styLNRightNumBox">9</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalAllcblW2WgsQlfyPropPctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/TotalAllcblW2WgsQlfyPropPctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/TotalAllcblW2WgsQlfyPropPctAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 10 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">10</div>
								<div class="sty8995ADesc">
									Enter the greater of line 5 or line 9
									<span class="sty8995ADotLn">.........</span>
								</div>
								<div class="styLNRightNumBox">10</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GrtrAllcblShrW2WageQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/GrtrAllcblShrW2WageQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/GrtrAllcblShrW2WageQlfyPropAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 11 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">11</div>
								<div class="sty8995ADesc" style="min-height:7.2mm;height:auto;">
									W-2 wage and UBIA of qualified property limitation. Enter the smaller of line 3 or line 10
									<span class="sty8995ADotLn">...........</span>
								</div>
								<div class="styLNRightNumBox" style="min-height:7.2mm;height:auto;"><br />11</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="W2WageQlfyPropLimitationAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/W2WageQlfyPropLimitationAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/W2WageQlfyPropLimitationAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 12 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">12</div>
								<div class="sty8995ADesc" style="min-height:7.2mm;height:auto;">
									Phased-in reduction. Enter amount from line 26, if any. <br />See instructions
									<span class="sty8995ADotLn">..............</span>
								</div>
								<div class="styLNRightNumBox" style="min-height:7.2mm;height:auto;"><br />12</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QBIAfterPhaseInReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/QBIAfterPhaseInReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/QBIAfterPhaseInReductionAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 13 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox" style="min-height:7.2mm;height:auto;">13</div>
								<div class="sty8995ADesc" style="min-height:7.2mm;height:auto;">
									Qualified business income deduction before patron reduction. Enter the greater of line 11 or line 12
									<span class="sty8995ADotLn">........</span>
								</div>
								<div class="styLNRightNumBox" style="min-height:7.2mm;height:auto;"><br />13</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QBIDedBeforePatronReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/QBIDedBeforePatronReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/QBIDedBeforePatronReductionAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 14 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">14</div>
								<div class="sty8995ADesc" style="min-height:7.2mm;height:auto;">
									Patron reduction. Enter the amount from Schedule D (Form 8995-A), line 6, if any
									<span class="sty8995ADotLn">............</span>
								</div>
								<div class="styLNRightNumBox" style="min-height:7.2mm;height:auto;"><br />14</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PatronReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/PatronReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/PatronReductionAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 15 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">15</div>
								<div class="sty8995ADesc" style="font-family:Arial;">
									Qualified business income component. Subtract line 14 from line 13
									<span class="sty8995ADotLn" style="font-family:Verdana;">.</span>
								</div>
								<div class="styLNRightNumBox">15</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QBIComponentAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/QBIComponentAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/QBIComponentAmt" />
									</xsl:call-template>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="count($FormData/QBIDeductionInformationGrp) &lt; 1">
						<!-- Column Headers -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="sty8995ADesc">&nbsp;</div>
							<div class="styLNRightNumBox" style="height:7mm;border-left-width:0px;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">A</div>
							<div class="sty8995AAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">B</div>
							<div class="sty8995AAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">C</div>
						</div>
						<!-- Line 2 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="sty8995ADesc" style="height:7mm;">
								Qualified business income from the trade, business, or aggregation. See instructions
									<span class="sty8995ADotLn">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />2</div>
							<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
						</div>
						<!-- Line 3 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD">3</div>
								<div class="sty8995ADesc" style="height:13mm;">
									Multiply line 2 by 20% (0.20). If your taxable income is $163,300 or less ($326,600 if married 
									filing jointly), skip lines 4 through 12 and enter the amount from line 3 on line 13
									<span class="sty8995ADotLn">.......</span>
								</div>
								<div class="styLNRightNumBox" style="height:13mm;"><br /><br /><br />3</div>
								<div class="sty8995AAmtBox" style="height:13mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:13mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:13mm;">&nbsp;</div>
							</div>
							<!-- Line 4 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD">4</div>
								<div class="sty8995ADesc" style="height:7mm;">
									Allocable share of W-2 wages from the trade, business, or aggregation
									<span class="sty8995ADotLn">...............</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;"><br />4</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Line 5 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD">5</div>
								<div class="sty8995ADesc">
									Multiply line 4 by 50% (0.50)
									<span class="sty8995ADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">5</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
							</div>
							<!-- Line 6 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD">6</div>
								<div class="sty8995ADesc">
									Multiply line 4 by 25% (0.25)
									<span class="sty8995ADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">6</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
							</div>
							<!-- Line 7 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD">7</div>
								<div class="sty8995ADesc" style="height:7mm;">
									Allocable share of the unadjusted basis immediately after acquisition (UBIA) of all qualified property
									<span class="sty8995ADotLn">......</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;"><br />7</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Line 8 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD">8</div>
								<div class="sty8995ADesc">
									Multiply line 7 by 2.5% (0.025)
									<span class="sty8995ADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">8</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
							</div>
							<!-- Line 9 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBoxSD">9</div>
								<div class="sty8995ADesc">
									Add lines 6 and 8
									<span class="sty8995ADotLn">..............</span>
								</div>
								<div class="styLNRightNumBox">9</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
							</div>
							<!-- Line 10 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">10</div>
								<div class="sty8995ADesc">
									Enter the greater of line 5 or line 9
									<span class="sty8995ADotLn">.........</span>
								</div>
								<div class="styLNRightNumBox">10</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
							</div>
							<!-- Line 11 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">11</div>
								<div class="sty8995ADesc" style="height:7mm;">
									W-2 wage and qualified property limitation. Enter the smaller of line 3 or line 10
									<span class="sty8995ADotLn">..............</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;"><br />11</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Line 12 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">12</div>
								<div class="sty8995ADesc" style="height:7mm;">
									Phased-in reduction. Enter amount from line 26, if any. <br />See instructions
									<span class="sty8995ADotLn">..............</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;"><br />12</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Line 13 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">13</div>
								<div class="sty8995ADesc" style="height:7mm;">
									Qualified business income deduction before patron reduction. Enter the greater of line 11 or line 12
									<span class="sty8995ADotLn">........</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;"><br />13</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Line 14 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">14</div>
								<div class="sty8995ADesc" style="height:7mm;">
									Patron reduction. Enter the amount from Schedule D (Form 8995-A), line 6, if any
									<span class="sty8995ADotLn">............</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;"><br />14</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:7mm;">&nbsp;</div>
							</div>
							<!-- Line 15 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">15</div>
								<div class="sty8995ADesc" style="font-family:Arial;">
									Qualified business income component. Subtract line 14 from line 13
									<span class="sty8995ADotLn" style="font-family:Verdana;">.</span>
								</div>
								<div class="styLNRightNumBox">15</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
								<div class="sty8995AAmtBox">&nbsp;</div>
							</div>
					</xsl:if>
					<!-- Line 16 -->
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="sty8995ADesc" style="min-height:7.2mm;height:auto;">
							Total qualified business income component. Add all amounts reported on line 15
							<span class="sty8995ADotLn" style="margin-right:-6px;">............&#9658;</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="min-height:7.2mm;height:auto;"><br />16</div>
						<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;border-bottom-width:0px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQBIComponentAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty8995AAmtBox" style="min-height:7.2mm;height:auto;background-color:lightgrey;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:14mm;">Cat. No. 71661B</span>
						<span style="float:right;">Form <span style="font-weight:bold;font-size:larger;">8995-A</span> (2020)</span>
					</div>
					<div class="styStdDiv">
						Form 8995-A (2020)
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Phased-in Reduction</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;padding-top:0.5mm;padding-bottom:0.5mm;font-style:italic;font-family:Arial;">
						Complete Part III only if your taxable income is more than $163,300 but not $213,300 ($326,600 and $426,600 if married filing jointly) and line 10 is less than line 3. Otherwise, skip Part III.
					</div>
					<xsl:for-each select="$FormData/QBIDeductionInformationGrp">
						<xsl:if test="position() mod 3 = 1">
							<xsl:variable name="pos" select="position()"/>
							<!-- Column Headers -->
							<div class="styStdDiv" style="border-top:1px solid black;">
								<div class="styLNLeftNumBox">&nbsp;</div>
								<div class="sty8995ADesc">&nbsp;</div>
								<div class="styLNRightNumBox" style="height:6mm;border-left-width:0px;">&nbsp;</div>
								<div class="sty8995AAmtBox" style="height:6mm;padding-top:1.5mm;text-align:center;font-weight:bold;"><xsl:number value="$pos" format="A"/></div>
								<div class="sty8995AAmtBox" style="height:6mm;padding-top:1.5mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 1" format="A"/></div>
								<div class="sty8995AAmtBox" style="height:6mm;padding-top:1.5mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 2" format="A"/></div>
							</div>
							<!-- Line 17 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">17</div>
								<div class="sty8995ADesc">
									Enter amounts from line 3
									<span class="sty8995ADotLn">...........</span>
								</div>
								<div class="styLNRightNumBox">17</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QlfyBusinessIncome20PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/QlfyBusinessIncome20PctAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/QlfyBusinessIncome20PctAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 18 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">18</div>
								<div class="sty8995ADesc">
									Enter the amounts from line 10
									<span class="sty8995ADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">18</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="GrtrAllcblShrW2WageQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/GrtrAllcblShrW2WageQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/GrtrAllcblShrW2WageQlfyPropAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 19 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">19</div>
								<div class="sty8995ADesc">
									Subtract line 18 from line 17
									<span class="sty8995ADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">19</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QBI20PctLessGrtrAllcblShareAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/QBI20PctLessGrtrAllcblShareAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/QBI20PctLessGrtrAllcblShareAmt" />
									</xsl:call-template>
								</div>
							</div>
							<xsl:if test="$pos = 1">
								<!-- Line 20 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox">20</div>
									<div class="sty8995ADesc" style="height:7mm;width:43mm;">
										Taxable income before qualified business income deduction
										<span class="sty8995ADotLn">..</span>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;"><br />20</div>
									<div class="sty8995AAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeBeforeQBIDedAmt" />
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 21 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox">21</div>
									<div class="sty8995ADesc" style="height:7mm;width:43mm;">
										Threshold. Enter $163,300 ($326,600 if married filing jointly)
										
									</div>
									<div class="styLNRightNumBox" style="height:7mm;"><br />21</div>
									<div class="sty8995AAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FilingStatusThresholdCd" />
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 22 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox">22</div>
									<div class="sty8995ADesc" style="width:43mm;">
										Subract line 21 from line 20
										<span class="sty8995ADotLn">.</span>
									</div>
									<div class="styLNRightNumBox">22</div>
									<div class="sty8995AAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TXIBfrQBIDedLessThresholdAmt" />
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 23 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox">23</div>
									<div class="sty8995ADesc" style="height:7mm;width:43mm;">
										Phase-in range. Enter $50,000 ($100,000 if married filing jointly)
									</div>
									<div class="styLNRightNumBox" style="height:7mm;"><br />23</div>
									<div class="sty8995AAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/FilingStatusPhaseInRangeCd" />
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 24 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox">24</div>
									<div class="sty8995ADesc" style="width:43mm;height:7mm;">
										Phase-in percentage. Divide line 22 by line 23
										<span class="sty8995ADotLn">......</span>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;"><br />24</div>
									<div class="sty8995AAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$FormData/PhaseInPct" />
										</xsl:call-template>
										<xsl:if test="not($FormData/PhaseInPct)">%</xsl:if>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
								</div>
							</xsl:if>
							<!-- Line 25 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">25</div>
								<div class="sty8995ADesc">
									Total phase-in reduction. Multiply line 19 by line 24
									<span class="sty8995ADotLn">...</span>
								</div>
								<div class="styLNRightNumBox">25</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalPhaseInReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/TotalPhaseInReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/TotalPhaseInReductionAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 26 -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">26</div>
								<div class="sty8995ADesc" style="height:10mm;">
									Qualified business income after phase-in reduction. Subtract <br /> line 25 from line 17. 
									Enter this amount here and on line 12, for the corresponding trade or business
									<span class="sty8995ADotLn">........</span>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:10mm;"><br /><br />26</div>
								<div class="sty8995AAmtBox" style="height:10mm;border-bottom-width:0px;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QBIAfterPhaseInReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="height:10mm;border-bottom-width:0px;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 1]/QBIAfterPhaseInReductionAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995AAmtBox" style="height:10mm;border-bottom-width:0px;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/QBIDeductionInformationGrp[$pos + 2]/QBIAfterPhaseInReductionAmt" />
									</xsl:call-template>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="count($FormData/QBIDeductionInformationGrp) &lt; 1">
						<!-- Column Headers -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="sty8995ADesc">&nbsp;</div>
							<div class="styLNRightNumBox" style="height:7mm;border-left-width:0px;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">A</div>
							<div class="sty8995AAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">B</div>
							<div class="sty8995AAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">C</div>
						</div>
						<!-- Line 17 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">17</div>
							<div class="sty8995ADesc">
								Enter amounts from line 3
								<span class="sty8995ADotLn">...........</span>
							</div>
							<div class="styLNRightNumBox">17</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
						</div>
						<!-- Line 18 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">18</div>
							<div class="sty8995ADesc">
								Enter the amounts from line 10
								<span class="sty8995ADotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">18</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
						</div>
						<!-- Line 19 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">19</div>
							<div class="sty8995ADesc">
								Subtract line 18 from line 17
								<span class="sty8995ADotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">19</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
						</div>
						<!-- Line 20 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">20</div>
							<div class="sty8995ADesc" style="height:7mm;width:43mm;">
								Taxable income before qualified business income deduction
								<span class="sty8995ADotLn">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />20</div>
							<div class="sty8995AAmtBox" style="height:7mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeBeforeQBIDedAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<!-- Line 21 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">21</div>
							<div class="sty8995ADesc" style="height:13mm;width:43mm;">
								Threshold. Enter $163,300 ($326,600 if married filing jointly)
								<span class="sty8995ADotLn">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;"><br /><br /><br />21</div>
							<div class="sty8995AAmtBox" style="height:13mm;"><br /><br /><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FilingStatusThresholdCd" />
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<!-- Line 22 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">22</div>
							<div class="sty8995ADesc" style="width:43mm;">
								Subract line 21 from line 20
								<span class="sty8995ADotLn">.</span>
							</div>
							<div class="styLNRightNumBox">22</div>
							<div class="sty8995AAmtBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TXIBfrQBIDedLessThresholdAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="background-color:lightgrey;">&nbsp;</div>
						</div>
						<!-- Line 23 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">23</div>
							<div class="sty8995ADesc" style="height:7mm;width:43mm;">
								Phase-in range. Enter $50,000 ($100,000 if married filing jointly)
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />23</div>
							<div class="sty8995AAmtBox" style="height:7mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FilingStatusPhaseInRangeCd" />
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<!-- Line 24 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">24</div>
							<div class="sty8995ADesc" style="width:43mm;height:7mm;">
								Phase-in percentage. Divide line 22 by line 23
								<span class="sty8995ADotLn">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />24</div>
							<div class="sty8995AAmtBox" style="height:7mm;"><br />
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$FormData/PhaseInPct" />
								</xsl:call-template>
								<xsl:if test="not($FormData/PhaseInPct)">%</xsl:if>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						</div>
						<!-- Line 25 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">25</div>
							<div class="sty8995ADesc">
								Total phase-in reduction. Multiply line 19 by line 24
								<span class="sty8995ADotLn">...</span>
							</div>
							<div class="styLNRightNumBox">25</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
							<div class="sty8995AAmtBox">&nbsp;</div>
						</div>
						<!-- Line 26 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">26</div>
							<div class="sty8995ADesc" style="height:10mm;">
								Qualified business income after phase-in reduction. Subtract <br /> line 25 from line 17. 
								Enter this amount here and on line 12, for the corresponding trade or business
								<span class="sty8995ADotLn">........</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:10mm;"><br /><br />26</div>
							<div class="sty8995AAmtBox" style="height:10mm;border-bottom-width:0px;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:10mm;border-bottom-width:0px;">&nbsp;</div>
							<div class="sty8995AAmtBox" style="height:10mm;border-bottom-width:0px;">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Determine Your Qualified Business Income Deduction</div>
					</div>
					<!-- Line 27 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">27</div>
						<div class="sty8995ADesc" style="height:7.2mm;width:103mm;">
							Total qualified business income component from all qualified trades, businesses, or aggregations. 
							Enter the amount from line 16
							<span class="sty8995ADotLn">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />27</div>
						<div class="sty8995AAmtBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalQBIComponentAmt" />
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8995AAmtBox" style="height:7.2mm;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 28 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="sty8995ADesc" style="height:7.2mm;width:103mm;">
							Qualified REIT dividends and publicly traded partnership (PTP) income or (loss). See instructions
							<span class="sty8995ADotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />28</div>
						<div class="sty8995AAmtBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyREITDivPTPIncomeLossAmt" />
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8995AAmtBox" style="height:7.2mm;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 29 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">29</div>
						<div class="sty8995ADesc" style="width:103mm;">
							Qualified REIT dividends and PTP (loss) carryforward from prior years
							<span class="sty8995ADotLn">...</span>
						</div>
						<div class="styLNRightNumBox">29</div>
						<div class="sty8995AAmtBox">
						  <xsl:choose>
						   <xsl:when test="$FormData/PYQlfyREITDivPTPLossCfwdAmt">
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYQlfyREITDivPTPLossCfwdAmt" />
							</xsl:call-template>)
							</xsl:when>
							<xsl:otherwise>
								(<span style="width:26mm"/>)
							</xsl:otherwise>
						  </xsl:choose> 
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8995AAmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 30 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">30</div>
						<div class="sty8995ADesc" style="height:7.2mm;width:103mm;">
							Total qualified REIT dividends and PTP income. Combine lines 28 and 29. If less than zero, enter -0-
							<span class="sty8995ADotLn">...................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />30</div>
						<div class="sty8995AAmtBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQlfyREITDivPTPIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8995AAmtBox" style="height:7.2mm;border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 31 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">31</div>
						<div class="sty8995ADesc" style="width:103mm;">
							REIT and PTP component. Multiply line 30 by 20% (0.20)
							<span class="sty8995ADotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">31</div>
						<div class="sty8995AAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/REITPTPComponentAmt" />
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8995AAmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 32 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">32</div>
						<div class="sty8995ADesc" style="width:141mm;">
							Qualified business income deduction before the income limitation. Add lines 27 and 31
							<span class="sty8995ADotLn" style="margin-right:-11px;padding-right:0px;">.......&#9658;</span>
						</div>
						<div class="styLNRightNumBox">32</div>
						<div class="sty8995AAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QBIDedBfrIncomeLimitationAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 33 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">33</div>
						<div class="sty8995ADesc" style="width:103mm;">
							Taxable income before qualified business income deduction
							<span class="sty8995ADotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">33</div>
						<div class="sty8995AAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeBeforeQBIDedAmt" />
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8995AAmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 34 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">34</div>
						<div class="sty8995ADesc" style="width:103mm;">
							Net capital gain. See instructions
							<span class="sty8995ADotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">34</div>
						<div class="sty8995AAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCapitalGainAmt" />
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0px;background-color:lightgrey;">&nbsp;</div>
						<div class="sty8995AAmtBox" style="border-bottom-width:0px;">&nbsp;</div>
					</div>
					<!-- Line 35 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">35</div>
						<div class="sty8995ADesc" style="width:141mm;">
							Subtract line 34 from line 33. If zero or less, enter -0-
							<span class="sty8995ADotLn" style="padding-right:0px;margin-right:-5px;">..................</span>
						</div>
						<div class="styLNRightNumBox">35</div>
						<div class="sty8995AAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedTaxableIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 36 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">36</div>
						<div class="sty8995ADesc" style="width:141mm;">
							Income limitation. Multiply line 35 by 20% (0.20)
							<span class="sty8995ADotLn" style="padding-right:0px;margin-right:-5px;">....................</span>
						</div>
						<div class="styLNRightNumBox">36</div>
						<div class="sty8995AAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeLimitationAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 37 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">37</div>
						<div class="sty8995ADesc" style="width:141mm;height:7.2mm;">
							Qualified business income deduction before the domestic production activities deduction (DPAD) under <br />section 199A(g). 
							Enter the smaller of line 32 or line 36
							<span class="sty8995ADotLn" style="margin-right:-11px;padding-right:0px;">.................&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />37</div>
						<div class="sty8995AAmtBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QBIDedBeforeDPADSect199AgAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 38 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">38</div>
						<div class="sty8995ADesc" style="width:141mm;height:7.2mm;">
							DPAD under section 199A(g) allocated from an agricultural or horticultural cooperative. Don’t enter more than line 33 minus line 37
							<span class="sty8995ADotLn" style="padding-right:0px;margin-right:-5px;">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;"><br />38</div>
						<div class="sty8995AAmtBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DPADSect199AgAllocAgricHortAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 39 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">39</div>
						<div class="sty8995ADesc" style="width:141mm;">
							Total qualified business income deduction. Add lines 37 and 38
							<span class="sty8995ADotLn" style="margin-right:-11px;padding-right:0px;">..............&#9658;</span>
						</div>
						<div class="styLNRightNumBox">39</div>
						<div class="sty8995AAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40 --> 
					<div class="styStdIBDiv">
						<div class="styLNLeftNumBox">40</div>
						<div class="sty8995ADesc" style="width:141mm;height:7.2mm;">
							Total qualified REIT dividends and PTP (loss) carryforward. Combine lines 28 and 29. If zero or greater, <br /> enter -0-
							<span class="sty8995ADotLn" style="padding-right:0px;margin-right:-5px;">................................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.2mm;border-bottom-width:0px;"><br />40</div>
						<div class="sty8995AAmtBox" style="height:7.2mm;border-bottom-width:0px;"><br />
						 <xsl:choose>
						   <xsl:when test="$FormData/TotQlfyREITDivPTPLossCfwdAmt">
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQlfyREITDivPTPLossCfwdAmt" />
							</xsl:call-template>)
						   </xsl:when>	
						   <xsl:otherwise>
						     	(<span style="width:26mm"/>)
						   </xsl:otherwise>
						 </xsl:choose> 
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;">Form <span style="font-weight:bold;font-size:larger;">8995-A</span> (2020)</span>
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
					<xsl:if test="$shouldSeparate">
						<br /><br />
						<span class="styRepeatingDataTitle">Part I - Trade, Business, or Aggregation Information</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:187mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;padding-left:2.5mm;text-align:left;">1</th>
									<th class="styDepTblCell" scope="col" style="min-width:32mm;width:90mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(a) </span> Trade, business, or aggregation name
									</th>
									<th class="styDepTblCell" scope="col" style="width:22mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(b) </span> Check if specified service
									</th>
									<th class="styDepTblCell" scope="col" style="width:22mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(c) </span> Check if aggregation
									</th>
									<th class="styDepTblCell" scope="col" style="width:23mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(d) </span> Taxpayer <br /> identification <br /> number
									</th>
									<th class="styDepTblCell" scope="col" style="width:22mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(e) </span> Check if patron
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/QBIDeductionInformationGrp">
									<tr style="border-color:black;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="font-weight:bold;text-align:right;vertical-align:bottom;padding-right:3mm;"><xsl:number value="position()" format="A"/></td>
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
										<td class="styTableCellCtrInherit" style="vertical-align:bottom;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:attribute name="alt">Line <xsl:number value="position()" format="A"/> Specified Service Indicator</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="SpecifiedServiceInd"/>
													<xsl:with-param name="BackupName">F8995ASpecifiedServiceInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
										<td class="styTableCellCtrInherit" style="vertical-align:bottom;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:attribute name="alt">Line <xsl:number value="position()" format="A"/> Aggregated Indicator</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="AggregatedInd"/>
													<xsl:with-param name="BackupName">F8995AAggregatedInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
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
										<td class="styTableCellCtrInherit" style="vertical-align:bottom;">
											<input type="checkbox" class="styCkboxNM">
												<xsl:attribute name="alt">Line <xsl:number value="position()" format="A"/> Patron Indicator</xsl:attribute>
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="PatronInd"/>
													<xsl:with-param name="BackupName">F8995APatronInd<xsl:value-of select="position()"/></xsl:with-param>
												</xsl:call-template>
											</input>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
