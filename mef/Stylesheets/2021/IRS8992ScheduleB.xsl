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
	<xsl:include href="IRS8992ScheduleBStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8992ScheduleB" />
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
				<meta name="Description" content="IRS Form 8992 Schedule B" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8992ScheduleBStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8992SchB">
					<xsl:call-template name="DocumentHeaderLandscape" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDivLS">
						<div class="styFNBox" style="width:35mm;height:18mm;">
							<span class="styFN" style="font-size:9pt;">SCHEDULE B<br />(Form 8992)</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							(December 2020)<br />
							<span class="styAgency" style="padding-top:1mm;">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:186mm;height:18mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:1mm;">
								Calculation of Global Intangible Low-Taxed Income (GILTI) for Members of a <br />
								U.S. Consolidated Group Who Are U.S. Shareholders of a CFC
							</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8992</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:33mm;height:18mm;">
							<div class="styOMB" style="font-size:6pt;border:none;padding-top:8mm;">OMB No. 1545-0123</div>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;padding-top:2px;padding-bottom:2px;font-size:8pt;">
						<strong>Important: </strong> See instructions before completing this Schedule B.
					</div>
					<!-- Filer information section -->
					<div class="styStdDivLS" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:200mm;">
							Name of U.S. parent corporation <br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:56mm;padding-left:1mm;font-weight:normal;">
							<strong>Employer identification number</strong> <br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:220mm;">
							CFC-Level Reporting of Amounts From Schedule I-1 (Form 5471) and U.S. Shareholder-Level Reporting of CFC Items
						</div>
						<div style="width:4mm;height:4mm;float:right;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/CFCAndUSShrLvlReportingAmtGrp"/>
								<xsl:with-param name="containerID" select=" 'Part1Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="15"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 1, cols (a)-(h) -->
					<xsl:variable name="shouldSeparateP1" select="($Print = $Separated) and (count($FormData/CFCAndUSShrLvlReportingAmtGrp) &gt; 15)"/>
					<div class="styStdDivLS" style="" id="Part1Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="min-width:46mm;width:52mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> 
										Name of CFC
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or <br /> Reference ID
									</th>
									<th class="styTableCellHeader" scope="col" style="width:52mm;min-width:46mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br />
										Name of U.S. Shareholder
									</th>
									<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br />
										EIN
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;min-width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br />
										Tested Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br />
										Tested Loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;min-width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br />
										Pro Rata Share <br /> of Tested Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(h) </span> <br />
										Pro Rata Share <br /> of Tested Loss
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/CFCAndUSShrLvlReportingAmtGrp">
										<tr style="vertical-align:bottom;height:8mm;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="CFCName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
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
													<xsl:when test="ForeignEntityIdentificationGrp">
														<xsl:call-template name="LinkToLeftoverDataTableInline">
															<xsl:with-param name="Desc">Schedule A, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
															<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="ShareholderMissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderMissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="ShareholderEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="TestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShareCFCTestedIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="ProRataShrCFCTestedLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/CFCAndUSShrLvlReportingAmtGrp) &lt; 1">
									<tr style="vertical-align:bottom;height:8mm;">
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/CFCAndUSShrLvlReportingAmtGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:24mm;"/>)</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">(<span style="width:24mm;"/>)</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/CFCAndUSShrLvlReportingAmtGrp) &lt; 15">
									<xsl:call-template name="FillTable8Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/CFCAndUSShrLvlReportingAmtGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/CFCAndUSShrLvlReportingAmtGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="15"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS" style="">
						<div class="styLNDesc" style="width:143.9mm;height:7mm;"><br />
							<strong>1. </strong> Totals (see instructions)
							<span class="sty8992SchBDotLn">..........................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:27.9mm;height:7mm;padding-right:1px;"><br />
							<xsl:choose>
								<xsl:when test="$FormData/TotalTestedLossAmt">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTestedLossAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									(<span style="width:24mm;"/>)
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrCFCTestedIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:choose>
								<xsl:when test="$FormData/TotProRataShrCFCTestedLossAmt">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrCFCTestedLossAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									(<span style="width:24mm;"/>)
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDivLS" style="border-top:1px solid black;padding-top:2px;padding-bottom:2px;font-size:8pt;">
						<strong>Important: </strong> See <span style="font-weight:bold;font-style:italic;">Computer-Generated Schedule B</span> in the Instructions for Form 8992.
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the Instructions for Form 8992.</span>
						<span style="margin-left:35mm;">Cat. No.74520J</span>
						<span style="float:right;font-weight:bold;">Schedule B (Form 8992) (12-2020)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule B (Form 8992) (12-2020)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part 1 continued -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:220mm;">
							CFC-Level Reporting of Amounts From Schedule I-1 (Form 5471) and U.S. Shareholder-Level Reporting of CFC Items
							<span style="font-weight:normal;font-style:italic;display:inline;">(continued)</span>
						</div>
						<div style="width:4mm;height:4mm;float:right;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/CFCAndUSShrLvlReportingAmtGrp"/>
								<xsl:with-param name="containerID" select=" 'Part1Table2' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="15"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Table 2, cols (i)-(p) -->
					<div class="styStdDivLS" style="">
						<div class="styLNDesc" style="width:31.8mm;height:8mm;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:8mm;padding-right:1px;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:8mm;padding-right:1px;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:8mm;padding-right:1px;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:28.1mm;height:8mm;padding-right:1px;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:8mm;padding-right:1px;">&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:8mm;padding-right:1px;">&nbsp;</div>
						<div class="styLNAmountBox" style="width:56mm;height:8mm;padding-right:1px;border-left-width:2px;text-align:center;">
							<span style="font-weight:bold;">GILTI Allocated to Tested Income CFCs</span><br />(see instructions)
						</div>
					</div>
					<div class="styStdDivLS" style="" id="Part1Table2">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="min-width:24mm;width:32mm;border-bottom-width:0px;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br />
										Pro Rata Share <br /> of QBAI
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(j) </span> <br />
										Pro Rata Share of <br /> Tested Loss <br /> QBAI Amount
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(k) </span> <br />
										Tested Interest <br /> Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(l) </span> <br />
										Pro Rata Share of <br /> Tested Interest <br /> Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(m) </span> <br />
										Tested Interest <br /> Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:2px;">
										<span style="font-weight:bold;">(n) </span> <br />
										Pro Rata Share of <br /> Tested Interest <br /> Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(o) </span> <br />
										GILTI Allocation Ratio <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(p) </span> <br />
										GILTI Allocated to Tested Income CFCs (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/CFCAndUSShrLvlReportingAmtGrp">
										<tr style="vertical-align:bottom;height:8mm;">
											<td class="styTableCellTextInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShareQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="ProRataShrTestedLossQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedInterestExpenseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShrTestedIntExpenseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TestedInterestIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:2px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ProRataShrTestedIntIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GILTIAllocationRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GILTIAllocTestedIncmCFCAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/CFCAndUSShrLvlReportingAmtGrp) &lt; 1">
									<tr style="vertical-align:bottom;height:8mm;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/CFCAndUSShrLvlReportingAmtGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:24mm;"/>)</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:2px;">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/CFCAndUSShrLvlReportingAmtGrp) &lt; 15">
									<xsl:call-template name="FillTable9Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/CFCAndUSShrLvlReportingAmtGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/CFCAndUSShrLvlReportingAmtGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table2' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="15"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS" style="">
						<div class="styLNDesc" style="width:31.8mm;height:7mm;"><br />
							<span style="font-family:Arial;"><strong>1. </strong> Totals (see instructions)</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalProRataShareQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:choose>
								<xsl:when test="$FormData/TotProRataShrTestedLossQBAIAmt">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedLossQBAIAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									(<span style="width:24mm;"/>)
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTestedInterestExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28.1mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTestedInterestIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotProRataShrTestedIntIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;border-left-width:2px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGILTIAllocationRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotGILTIAllocTestedIncmCFCAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;font-weight:bold;">Schedule B (Form 8992) (12-2020)</span>
					</div>
					<!-- Page 3 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule B (Form 8992) (12-2020)
						<div style="float:right;">Page <strong>3</strong></div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:220mm;">
							U.S. Shareholder-Level Calculations
						</div>
						<div style="width:4mm;height:4mm;float:right;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/USShrLvlCalculationsGrp"/>
								<xsl:with-param name="containerID" select=" 'Part2Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="15"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 2, cols (a)-(f) -->
					<xsl:variable name="shouldSeparateP2" select="($Print = $Separated) and (count($FormData/USShrLvlCalculationsGrp) &gt; 15)"/>
					<div class="styStdDivLS" style="" id="Part2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:116mm;min-width:80mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br />
										Name of U.S. Shareholder
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;min-width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br />
										Aggregate Tested Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br />
										GILTI Allocation Ratio
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;min-width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br />
										Aggregate Tested Loss
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(f) </span> <br />
										Allocable Share <br /> of Consolidated <br /> Tested Loss
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP2)">
									<xsl:for-each select="$FormData/USShrLvlCalculationsGrp">
										<tr style="vertical-align:bottom;height:8mm;">
											<td class="styTableCellTextInherit" style="">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt"><br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:choose>
													<xsl:when test="ShareholderMissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ShareholderMissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="ShareholderEIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AggregateTestedIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShrGILTIAllocationRt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="AggregateTestedLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateNegativeNumber">
													<xsl:with-param name="TargetNode" select="AllcblShrCnsldtTestedLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP2 or count($FormData/USShrLvlCalculationsGrp) &lt; 1">
									<tr style="vertical-align:bottom;height:8mm;">
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/USShrLvlCalculationsGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:24mm;"/>)</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">(<span style="width:24mm;"/>)</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateP2 or count($FormData/USShrLvlCalculationsGrp) &lt; 15">
									<xsl:call-template name="FillTable6Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/USShrLvlCalculationsGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP2"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP2)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/USShrLvlCalculationsGrp"/>
							<xsl:with-param name="containerID" select=" 'Part2Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="15"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS" style="">
						<div class="styLNDesc" style="width:143.9mm;height:7mm;"><br />
							<strong>2. </strong> Totals (see instructions)
							<span class="sty8992SchBDotLn">..........................</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateTestedIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:27.9mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotShrGILTIAllocationRt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:choose>
								<xsl:when test="$FormData/TotalAggregateTestedLossAmt">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$FormData/TotalAggregateTestedLossAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									(<span style="width:24mm;"/>)
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:choose>
								<xsl:when test="$FormData/TotAllcblShrCnsldtTestLossAmt">
									<xsl:call-template name="PopulateNegativeNumber">
										<xsl:with-param name="TargetNode" select="$FormData/TotAllcblShrCnsldtTestLossAmt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									(<span style="width:24mm;"/>)
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;font-weight:bold;">Schedule B (Form 8992) (12-2020)</span>
					</div>
					<!-- Page 4 -->
					<div class="styStdDivLS" style="border-bottom:2px solid black;">
						Schedule B (Form 8992) (12-2020)
						<div style="float:right;">Page <strong>4</strong></div>
					</div>
					<!-- Part 2 continued -->
					<div class="styStdDivLS" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:220mm;">
							U.S. Shareholder-Level Calculations
							<span style="font-weight:normal;font-style:italic;display:inline;">(continued)</span>
						</div>
						<div style="width:4mm;height:4mm;float:right;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/USShrLvlCalculationsGrp"/>
								<xsl:with-param name="containerID" select=" 'Part2Table2' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="15"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Table 2, cols (i)-(p) -->
					<div class="styStdDivLS" style="" id="Part2Table2">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="min-width:48mm;width:60mm;border-bottom-width:0px;">
										&nbsp;
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br />
										Consolidated QBAI
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br />
										Allocable Share of <br /> Consolidated QBAI
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br />
										Deemed Tangible <br /> Income Return (DTIR)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(j) </span> <br />
										Consolidated Tested <br /> Interest Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(k) </span> <br />
										Consolidated Tested <br /> Interest Income
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(l) </span> <br />
										Consolidated Specified <br /> Interest Expense
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;">
										<span style="font-weight:bold;">(m) </span> <br />
										Allocable Share of Consolidated Specified <br /> Interest Expense
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP2)">
									<xsl:for-each select="$FormData/USShrLvlCalculationsGrp">
										<tr style="vertical-align:bottom;height:8mm;">
											<td class="styTableCellTextInherit" style="border-bottom-width:0px;">&nbsp;</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ConsolidatedQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AllcblShrCnsldtQBAIAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeemedTangibleIncomeReturnAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CnsldtTestedIntExpenseAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CnsldtTestedIntIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="/.."/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AlShrCnsldtSpcfdIntExpnsAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP2 or count($FormData/USShrLvlCalculationsGrp) &lt; 1">
									<tr style="vertical-align:bottom;height:8mm;">
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/USShrLvlCalculationsGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparateP2 or count($FormData/USShrLvlCalculationsGrp) &lt; 15">
									<xsl:call-template name="FillTableCols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/USShrLvlCalculationsGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP2"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP2)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/USShrLvlCalculationsGrp"/>
							<xsl:with-param name="containerID" select=" 'Part2Table2' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="15"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDivLS" style="">
						<div class="styLNDesc" style="width:59.8mm;height:7mm;"><br />
							<span style="font-family:Arial;"><strong>2. </strong> Totals (see instructions)</span>
							<span class="sty8992SchBDotLn">......</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalConsolidatedQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAllcblShrCnsldtQBAIAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28.1mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDTIRAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCnsldtTestedIntExpenseAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotCnsldtTestedIntIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCnsldtSpcfdIntExpnsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:28mm;height:7mm;padding-right:1px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotAlShrCnsldtSpcfdIntExpnsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDivLS pageEnd" style="border-top:2px solid black;">
						<span style="float:right;font-weight:bold;">Schedule B (Form 8992) (12-2020)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- Part 1 separated table -->
					<xsl:if test="$shouldSeparateP1">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part I - CFC-Level Reporting of Amounts From Schedule I-1 (Form 5471) and U.S. Shareholder-Level Reporting of CFC Items</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="min-width:46mm;width:52mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br /> 
										Name of CFC
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN or <br /> Reference ID
									</th>
									<th class="styDepTblCell" scope="col" style="width:52mm;min-width:46mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br />
										Name of U.S. Shareholder
									</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br />
										EIN
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;min-width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br />
										Tested Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br />
										Tested Loss
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;min-width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br />
										Pro Rata Share <br /> of Tested Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br />
										Pro Rata Share <br /> of Tested Loss
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/CFCAndUSShrLvlReportingAmtGrp">
									<tr style="border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="CFCName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="CFCName/BusinessNameLine2Txt"/>
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
												<xsl:when test="ForeignEntityIdentificationGrp">
													<xsl:call-template name="LinkToLeftoverDataTableInline">
														<xsl:with-param name="Desc">Schedule A, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</xsl:with-param>
														<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="ShareholderMissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderMissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="ShareholderEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TestedIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="TestedLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShareCFCTestedIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="ProRataShrCFCTestedLossAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="min-width:24mm;width:32mm;border-bottom-width:0px;">
										&nbsp;
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br />
										Pro Rata Share <br /> of QBAI
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(j) </span> <br />
										Pro Rata Share of <br /> Tested Loss <br /> QBAI Amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(k) </span> <br />
										Tested Interest <br /> Expense
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(l) </span> <br />
										Pro Rata Share of <br /> Tested Interest <br /> Expense
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(m) </span> <br />
										Tested Interest <br /> Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;border-right-width:2px;">
										<span style="font-weight:bold;">(n) </span> <br />
										Pro Rata Share of <br /> Tested Interest <br /> Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(o) </span> <br />
										GILTI Allocation Ratio <br /> (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(p) </span> <br />
										GILTI Allocated to Tested Income CFCs (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/CFCAndUSShrLvlReportingAmtGrp">
									<tr style="border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;">&nbsp;</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShareQBAIAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="ProRataShrTestedLossQBAIAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TestedInterestExpenseAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShrTestedIntExpenseAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TestedInterestIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:2px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProRataShrTestedIntIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GILTIAllocationRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GILTIAllocTestedIncmCFCAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:for-each select="$FormData/CFCAndUSShrLvlReportingAmtGrp">
						<xsl:if test="ForeignEntityIdentificationGrp">
							<br /><br />
							<span class="styRepeatingDataTitle">Part I, row <xsl:value-of select="position()"/> - Foreign Entity Reference IDs</span><br />
							<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:100mm;">
								<tbody>
									<xsl:for-each select="ForeignEntityIdentificationGrp">
										<tr style="border-color:black;">
											<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
											<td class="styTableCell" style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:if>
					</xsl:for-each>
					<br/>
					<!-- Part 2 separated table -->
					<xsl:if test="$shouldSeparateP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II - U.S. Shareholder-Level Calculations</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:116mm;min-width:80mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> <br />
										Name of U.S. Shareholder
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(b) </span> <br />
										EIN
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;min-width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(c) </span> <br />
										Aggregate Tested Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(d) </span> <br />
										GILTI Allocation Ratio
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;min-width:27mm;font-weight:normal;">
										<span style="font-weight:bold;">(e) </span> <br />
										Aggregate Tested Loss
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(f) </span> <br />
										Allocable Share <br /> of Consolidated <br /> Tested Loss
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/USShrLvlCalculationsGrp">
									<tr style="border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="ShareholderBusinessName/BusinessNameLine2Txt"><br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderBusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:choose>
												<xsl:when test="ShareholderMissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderMissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="ShareholderEIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AggregateTestedIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShrGILTIAllocationRt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="AggregateTestedLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateNegativeNumber">
												<xsl:with-param name="TargetNode" select="AllcblShrCnsldtTestedLossAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:256mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="min-width:48mm;width:60mm;border-bottom-width:0px;">
										&nbsp;
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(g) </span> <br />
										Consolidated QBAI
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(h) </span> <br />
										Allocable Share of <br /> Consolidated QBAI
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(i) </span> <br />
										Deemed Tangible <br /> Income Return (DTIR)
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(j) </span> <br />
										Consolidated Tested <br /> Interest Expense
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(k) </span> <br />
										Consolidated Tested <br /> Interest Income
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(l) </span> <br />
										Consolidated Specified <br /> Interest Expense
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;">
										<span style="font-weight:bold;">(m) </span> <br />
										Allocable Share of Consolidated Specified <br /> Interest Expense
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/USShrLvlCalculationsGrp">
									<tr style="border-color:black;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit" style="border-bottom-width:0px;">&nbsp;</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ConsolidatedQBAIAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AllcblShrCnsldtQBAIAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeemedTangibleIncomeReturnAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CnsldtTestedIntExpenseAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CnsldtTestedIntIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="/.."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AlShrCnsldtSpcfdIntExpnsAmt"/>
											</xsl:call-template>
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
	<xsl:template name="FillTable6Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="15"/>
		<tr style="height:8mm;vertical-align:bottom;">
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:24mm;"/>)</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">(<span style="width:24mm;"/>)</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable6Cols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable6Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable8Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="15"/>
		<tr style="height:8mm;vertical-align:bottom;">
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:24mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">(<span style="width:24mm;"/>)</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable8Cols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable8Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTable9Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="15"/>
		<tr style="height:8mm;vertical-align:bottom;">
			<td class="styTableCellTextInherit" style="border-bottom-width:0px;">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">(<span style="width:24mm;"/>)</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:2px;">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable9Cols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable9Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="FillTableCols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="15"/>
		<tr style="height:8mm;vertical-align:bottom;">
			<td class="styTableCellTextInherit" style="border-bottom-width:0px;">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTableCols">
					<xsl:with-param name="LineNumber" select="3"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTableCols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
