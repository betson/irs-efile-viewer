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
	<xsl:include href="IRS8997Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8997" />
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
				<meta name="Description" content="IRS Form 8995" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8997Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8997">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							Form <span class="styFN" style="font-size:18pt;">8997</span> 
							<br />
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br /><br />
							<span class="styAgency">
								Department of the Treasury <br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:10pt;padding-top:1mm;padding-bottom:1mm;">Initial and Annual Statement of <br />
							Qualified Opportunity Fund (QOF) Investments</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8997</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0123</div>
							<div class="styTY">20<span class="styTYColor">20</span></div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">997</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:125mm;">
							Name<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:62mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Tax identification number</strong> (see instructions)<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc" style="width:167mm;height:auto;font-weight:normal;">
							<strong>Total QOF Investment Holdings due to Deferrals Prior to Beginning of Tax Year</strong> <br />
							If different from last year's ending QOF investment holdings, attach explanation.
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TotQOFInvstHoldBOYGrp"/>
								<xsl:with-param name="containerID" select=" 'Part1Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="5"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateP1" select="($Print = $Separated) and (count($FormData/TotQOFInvstHoldBOYGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="Part1Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:25mm;font-weight:normal;">
										<strong>(a)</strong><br />
										Qualified Opportunity <br /> Fund (QOF) <br /> EIN
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:23mm;font-weight:normal;">
										<strong>(b)</strong><br />
										Date QOF <br /> investment acquired <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="min-width:59mm;width:71mm;font-weight:normal;">
										<strong>(c)</strong><br />
										Description of QOF investment <br /> (for example, 100 shares or 25% interest)
									</th>
									<th class="styTableCellHeader" scope="col"	rowspan="2" style="width:10mm;font-weight:normal;">
										<strong>(d)</strong><br />
										Special gain code
									</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:58mm;font-weight:normal;border-right-width:0px;">
										Deferred gain held in QOF
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Amount of short-term <br /> deferred gain <br /> remaining in QOF
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(f) </span> <br /> 
										Amount of long-term <br /> deferred gain <br /> remaining in QOF
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP1)">
									<xsl:for-each select="$FormData/TotQOFInvstHoldBOYGrp">
										<tr style="height:7.5mm;vertical-align:top;">
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="InvestmentAcquiredDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="QOFInvestmentDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SpecialGainCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShortTermDefrdGainRmngQOFAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LongTermDefrdGainRmngQOFAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP1 or count($FormData/TotQOFInvstHoldBOYGrp) &lt; 5">
									<xsl:call-template name="FillTable5Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TotQOFInvstHoldBOYGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP1"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP1)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TotQOFInvstHoldBOYGrp"/>
							<xsl:with-param name="containerID" select=" 'Part1Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="5"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Table 1 Totals -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;border-bottom:1px solid black;"><br />1</div>
						<div class="styLNDesc" style="height:7.5mm;width:120.8mm;vertical-align:bottom;padding-left:0.5mm;border-bottom:1px solid black;"><br />
							Enter the totals, if any, from continuation sheet
							<span class="sty8997DotLn" style="padding-right:0px;margin-right:-4px;">.............&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />&nbsp;</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;border-bottom:1px solid black;"><br />2</div>
						<div class="styLNDesc" style="height:7.5mm;width:120.8mm;vertical-align:bottom;padding-left:0.5mm;border-bottom:1px solid black;"><br />
							Enter the totals from columns (e) and (f) 
							<span class="sty8997DotLn" style="padding-right:0px;margin-right:-4px;">...............&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotBOYSTDefrdGainRmngQOFAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotBOYLTDefrdGainRmngQOFAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="width:167mm;height:auto;">
							Current Tax Year Capital Gains Deferred by Investing in QOF
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/CapGainDefrdInvstQOFCurrTYGrp"/>
								<xsl:with-param name="containerID" select=" 'Part2Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="5"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 2, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateP2" select="($Print = $Separated) and (count($FormData/CapGainDefrdInvstQOFCurrTYGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="Part2Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:25mm;font-weight:normal;">
										<strong>(a)</strong><br />
										Qualified Opportunity <br /> Fund (QOF) <br /> EIN
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:23mm;font-weight:normal;">
										<strong>(b)</strong><br />
										Date QOF <br /> investment acquired <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="min-width:59mm;width:71mm;font-weight:normal;">
										<strong>(c)</strong><br />
										Description of interest acquired <br /> (for example, 100 shares or 25% interest)
									</th>
									<th class="styTableCellHeader" scope="col"	rowspan="2" style="width:10mm;font-weight:normal;">
										<strong>(d)</strong><br />
										Special gain code
									</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:58mm;font-weight:normal;border-right-width:0px;">
										Deferred gain invested in QOF
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Amount of short-term <br /> deferred gain <br /> remaining in QOF
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(f) </span> <br /> 
										Amount of long-term <br /> deferred gain <br /> remaining in QOF
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP2)">
									<xsl:for-each select="$FormData/CapGainDefrdInvstQOFCurrTYGrp">
										<tr style="height:7.5mm;vertical-align:top;">
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="InvestmentAcquiredDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InterestAcquiredDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SpecialGainCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShortTermDefrdGainRmngAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LongTermDefrdGainRmngAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP2 or count($FormData/TotQOFInvstHoldEOYGrp) &lt; 5">
									<xsl:call-template name="FillTable5Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/CapGainDefrdInvstQOFCurrTYGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP2"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP2)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/CapGainDefrdInvstQOFCurrTYGrp"/>
							<xsl:with-param name="containerID" select=" 'Part2Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="5"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Table 2 Totals -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;border-bottom:1px solid black;"><br />1</div>
						<div class="styLNDesc" style="height:7.5mm;width:120.8mm;vertical-align:bottom;padding-left:0.5mm;border-bottom:1px solid black;"><br />
							Enter the totals, if any, from continuation sheet
							<span class="sty8997DotLn" style="padding-right:0px;margin-right:-4px;">.............&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />&nbsp;</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;border-bottom:1px solid black;"><br />2</div>
						<div class="styLNDesc" style="height:7.5mm;width:120.8mm;vertical-align:bottom;padding-left:0.5mm;border-bottom:1px solid black;"><br />
							Enter the totals from columns (e) and (f). See instructions for reporting on Form 8949
							<span class="sty8997DotLn" style="padding-right:0px;margin-right:-4px;">.&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotShortTermDefrdGainRmngAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotLongTermDefrdGainRmngAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="font-size:8pt;font-weight:bold;padding:2px 0px;border-bottom:1px solid black;border-top:1px solid black;">
						Applicability of Special Rules Regarding the Waiver of Certain Treaty Benefits
					</div>
					<div class="styStdDiv" style="padding:2px 0px 2px 6px">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnEligTxpyrTYAfterMarchInd"/>
						</xsl:call-template>
						Are you a foreign eligible taxpayer whose tax year began after March 13, 2020? See instructions for more information.
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/FrgnEligTxpyrTYAfterMarchInd"/>
						</xsl:call-template><br />
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Foreign eligible taxpayer yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnEligTxpyrTYAfterMarchInd"/>
								<xsl:with-param name="BackupName">IRS8997FrgnEligTxpyrTYAfterMarchInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>Yes. </strong> You may not elect to defer tax on an eligible gain by investing in a 
						QOF unless you check "Yes" in response to the next question. <br />
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Foreign eligible taxpayer no">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FrgnEligTxpyrTYAfterMarchInd"/>
								<xsl:with-param name="BackupName">IRS8997FrgnEligTxpyrTYAfterMarchInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>No. </strong> Skip the next question and go to Part III. <br />
						If you are foreign eligible taxpayer, see instructions to determine if you are required to attach a 
						written statement for the portion of your first tax year ending after December 21, 2017 and all tax 
						years that began after December 21, 2017 and on or before March 13, 2020. 
					</div>
					<div class="styStdDiv" style="font-size:8pt;font-weight:bold;padding:2px 0px;border-bottom:1px solid black;border-top:1px solid black;">
						Waiver of Treaty Benefits on Future Inclusions by a Foreign Eligible Taxpayer (for Tax Years Beginning After March 13, 2020, Only)
					</div>
					<div class="styStdDiv" style="padding:2px 0px 2px 6px">
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$FormData/WvrTrtyBnftFutureInclusionInd"/>
						</xsl:call-template>
						Do you hereby irrevocably waive any benefits available under an applicable U.S. income tax 
						convention that would exempt gains that you are deferring by investing in a QOF from being 
						subject to federal income tax at the time of inclusion? See instructions for more information.
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$FormData/WvrTrtyBnftFutureInclusionInd"/>
						</xsl:call-template><br />
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Waive treaty benefits on future inclusions yes">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/WvrTrtyBnftFutureInclusionInd"/>
								<xsl:with-param name="BackupName">IRS8997WvrTrtyBnftFutureInclusionInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>Yes. </strong> Report the deferral of the eligible gain in Part II and on Form 8949. <br />
						<input class="styCkbox" type="checkbox" style="margin-left:2px;" alt="Waive treaty benefits on future inclusions no">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/WvrTrtyBnftFutureInclusionInd"/>
								<xsl:with-param name="BackupName">IRS8997WvrTrtyBnftFutureInclusionInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<strong>No. </strong> You may not elect to defer tax on an eligible gain by investing in a QOF. 
						<strong>Do not report the deferral of any otherwise eligible gain in Part II or on Form 8949.</strong>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 37821R</span>
						<span style="float:right;">Form <strong>8997</strong> (2020)</span>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv" style="border-bottom:2px solid black;">
						Form 8997 (2020)
						<div style="float:right;">Page <strong>2</strong></div>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="width:167mm;height:auto;">
							QOF Investments for Which Gain is Included During Current Tax Year
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/QOFInvstDisposDurCurrTYGrp"/>
								<xsl:with-param name="containerID" select=" 'Part3Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="5"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 3, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateP3" select="($Print = $Separated) and (count($FormData/QOFInvstDisposDurCurrTYGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="Part3Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:25mm;font-weight:normal;">
										<strong>(a)</strong><br />
										Qualified Opportunity <br /> Fund (QOF) <br /> EIN
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:23mm;font-weight:normal;">
										<strong>(b)</strong><br />
										Date QOF <br /> sold or disposed <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="min-width:59mm;width:71mm;font-weight:normal;">
										<strong>(c)</strong><br />
										Description of inclusion event <br /> (for example, sale of 100 shares, gift of 25% interest, or distribution of $1,000, etc.)
									</th>
									<th class="styTableCellHeader" scope="col"	rowspan="2" style="width:10mm;font-weight:normal;">
										<strong>(d)</strong><br />
										Special gain code
									</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:58mm;font-weight:normal;border-right-width:0px;">
										Deferred gain included <br /> due to disposition of QOF interest
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Amount of previously <br /> deferred short-term <br /> gain now included in <br /> taxable income 
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(f) </span> <br /> 
										Amount of previously <br /> deferred long-term <br /> gain now included in <br /> taxable income 
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP3)">
									<xsl:for-each select="$FormData/QOFInvstDisposDurCurrTYGrp">
										<tr style="height:7.5mm;vertical-align:top;">
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="InvestmentDisposedDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InterestDisposedDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SpecialGainCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PrevDefrdShortTermGainAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="PrevDefrdLongTermGainAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP3 or count($FormData/QOFInvstDisposDurCurrTYGrp) &lt; 5">
									<xsl:call-template name="FillTable5Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/QOFInvstDisposDurCurrTYGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP3"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP3)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/QOFInvstDisposDurCurrTYGrp"/>
							<xsl:with-param name="containerID" select=" 'Part3Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="5"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Table 3 Totals -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;border-bottom:1px solid black;"><br />1</div>
						<div class="styLNDesc" style="height:7.5mm;width:120.8mm;vertical-align:bottom;padding-left:0.5mm;border-bottom:1px solid black;"><br />
							Enter the totals, if any, from continuation sheet
							<span class="sty8997DotLn" style="padding-right:0px;margin-right:-4px;">.............&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />&nbsp;</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;border-bottom:1px solid black;"><br />2</div>
						<div class="styLNDesc" style="height:7.5mm;width:120.8mm;vertical-align:bottom;padding-left:0.5mm;border-bottom:1px solid black;"><br />
							Enter the totals from columns (e) and (f). See instructions for reporting on Form 8949
							<span class="sty8997DotLn" style="padding-right:0px;margin-right:-4px;">.&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPrevDefrdShortTermGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotPrevDefrdLongTermGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox">
							<input type="checkbox" class="styCkbox" alt="Form 1099-B Not Received Indicator">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Form1099BNotReceivedInd"/>
									<xsl:with-param name="BackupName">IRS8997Form1099BNotReceived</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<div class="styLNDesc" style="height:8mm;width:175mm;">
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/Form1099BNotReceivedInd"/>
									<xsl:with-param name="BackupName">IRS8997Form1099BNotReceived</xsl:with-param>
								</xsl:call-template>Check this box if you disposed of any investment(s) and didn't receive a Form 1099-B reporting the disposition from the 
							QOF or other third party. See the Instructions for Form 8949 for reporting requirements of any gain or loss.</label>
						</div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc" style="width:167mm;height:auto;">
							Total QOF Investment Holdings at Year End Due to Deferrals <span style="font-weight:normal;">(see instructions)</span>
						</div>
						<div style="float:right;width:4mm;height:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/TotQOFInvstHoldEOYGrp"/>
								<xsl:with-param name="containerID" select=" 'Part5Table' "/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerHeight" select="5"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Table 5, cols (a)-(e) -->
					<xsl:variable name="shouldSeparateP5" select="($Print = $Separated) and (count($FormData/TotQOFInvstHoldEOYGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="Part5Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:25mm;font-weight:normal;">
										<strong>(a)</strong><br />
										Qualified Opportunity <br /> Fund (QOF) <br /> EIN
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="width:23mm;font-weight:normal;">
										<strong>(b)</strong><br />
										Date QOF <br /> investment acquired <br /> (MM/DD/YYYY)
									</th>
									<th class="styTableCellHeader" scope="col" rowspan="2" style="min-width:59mm;width:71mm;font-weight:normal;">
										<strong>(c)</strong><br />
										Description of interest acquired <br /> (for example, 100 shares or 25% interest)
									</th>
									<th class="styTableCellHeader" scope="col"	rowspan="2" style="width:10mm;font-weight:normal;">
										<strong>(d)</strong><br />
										Special gain code
									</th>
									<th class="styTableCellHeader" scope="col" colspan="2" style="width:58mm;font-weight:normal;border-right-width:0px;">
										Deferred gain invested in QOF investment
									</th>
								</tr>
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Amount of short-term <br /> deferred gain <br /> invested in QOF
									</th>
									<th class="styTableCellHeader" scope="col" style="width:29mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(f) </span> <br /> 
										Amount of long-term <br /> deferred gain <br /> invested in QOF
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparateP5)">
									<xsl:for-each select="$FormData/TotQOFInvstHoldEOYGrp">
										<tr style="height:7.5mm;vertical-align:top;">
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="InvestmentAcquiredDt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="InterestAcquiredDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SpecialGainCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ShortTermDefrdGainInvstAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LongTermDefrdGainInvstAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparateP5 or count($FormData/TotQOFInvstHoldEOYGrp) &lt; 5">
									<xsl:call-template name="FillTable5Cols">
										<xsl:with-param name="LineNumber" select="1 + count($FormData/TotQOFInvstHoldEOYGrp)"/>
										<xsl:with-param name="SepMessage" select="$shouldSeparateP5"/>
									</xsl:call-template>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparateP5)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/TotQOFInvstHoldEOYGrp"/>
							<xsl:with-param name="containerID" select=" 'Part5Table' "/>
							<xsl:with-param name="headerHeight" select="2"/>
							<xsl:with-param name="containerHeight" select="5"/>
						</xsl:call-template>
					</xsl:if>
					<!-- Table 5 Totals -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;border-bottom:1px solid black;"><br />1</div>
						<div class="styLNDesc" style="height:7.5mm;width:120.8mm;vertical-align:bottom;padding-left:0.5mm;border-bottom:1px solid black;"><br />
							Enter the totals, if any, from continuation sheet
							<span class="sty8997DotLn" style="padding-right:0px;margin-right:-4px;">.............&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />&nbsp;</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />&nbsp;</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:7.5mm;border-bottom:1px solid black;"><br />2</div>
						<div class="styLNDesc" style="height:7.5mm;width:120.8mm;vertical-align:bottom;padding-left:0.5mm;border-bottom:1px solid black;"><br />
							Enter the totals from columns (e) and (f) 
							<span class="sty8997DotLn" style="padding-right:0px;margin-right:-4px;">...............&#9658;</span>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;padding-right:0.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotEOYSTDefrdGainInvstAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:7.5mm;width:29.1mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotEOYLTDefrdGainInvstAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="float:right;">Form <strong>8997</strong> (2020)</span>
					</div>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
						   Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
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
						<span class="styRepeatingDataTitle">Part I - Total QOF Investment Holdings due to Deferrals Prior to Beginning of Tax Year</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:24mm;">
										<strong>(a)</strong><br />
										Qualified Opportunity <br /> Fund (QOF) <br /> EIN
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:24mm;">
										<strong>(b)</strong><br />
										Date QOF <br /> investment acquired <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:80mm;">
										<strong>(c)</strong><br />
										Description of QOF investment <br /> (for example, 100 shares or 25% interest)
									</th>
									<th class="styDepTblCell" scope="col"	rowspan="2" style="width:10mm;">
										<strong>(d)</strong><br />
										Special gain code
									</th>
									<th class="styDepTblCell" scope="col" colspan="2" style="width:58mm;">
										Deferred gain held in QOF
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:29mm;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Amount of short-term <br /> deferred gain <br /> remaining in QOF</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;">
										<span style="font-weight:bold;">(f) </span> <br /> 
										Amount of long-term <br /> deferred gain <br /> remaining in QOF
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TotQOFInvstHoldBOYGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="InvestmentAcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="QOFInvestmentDesc"/>
											</xsl:call-template>
										</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="SpecialGainCd"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShortTermDefrdGainRmngQOFAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LongTermDefrdGainRmngQOFAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 2 separated table -->
					<xsl:if test="$shouldSeparateP2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part II - Current Tax Year Capital Gains Deferred by Investing in QOF</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:24mm;">
										<strong>(a)</strong><br />
										Qualified Opportunity <br /> Fund (QOF) <br /> EIN
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:24mm;">
										<strong>(b)</strong><br />
										Date QOF <br /> investment acquired <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:80mm;">
										<strong>(c)</strong><br />
										Description of interest acquired <br /> (for example, 100 shares or 25% interest)
									</th>
									<th class="styDepTblCell" scope="col"	rowspan="2" style="width:10mm;">
										<strong>(d)</strong><br />
										Special gain code
									</th>
									<th class="styDepTblCell" scope="col" colspan="2" style="width:58mm;">
										Deferred gain invested in QOF
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:29mm;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Amount of short-term <br /> deferred gain <br /> invested in QOF</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;">
										<span style="font-weight:bold;">(f) </span> <br /> 
										Amount of long-term <br /> deferred gain <br /> invested in QOF
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/CapGainDefrdInvstQOFCurrTYGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="InvestmentAcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InterestAcquiredDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SpecialGainCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShortTermDefrdGainInvstAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LongTermDefrdGainInvstAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 3 separated table -->
					<xsl:if test="$shouldSeparateP3">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part III - QOF Investments for Which Gain is Included During Current Tax Year</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:24mm;">
										<strong>(a)</strong><br />
										Qualified Opportunity <br /> Fund (QOF) <br /> EIN
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:24mm;">
										<strong>(b)</strong><br />
										Date QOF <br /> sold or disposed <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:80mm;">
										<strong>(c)</strong><br />
										Description of inclusion event <br /> (for example, sale of 100 shares, gift of 25% interest, or distribution of $1,000, etc.)
									</th>
									<th class="styDepTblCell" scope="col"	rowspan="2" style="width:10mm;">
										<strong>(d)</strong><br />
										Special gain code
									</th>
									<th class="styDepTblCell" scope="col" colspan="2" style="width:58mm;">
										Deferred gain included <br /> due to disposition of QOF interest
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:29mm;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Amount of previously deferred short-term gain now included in taxable income
									</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;">
										<span style="font-weight:bold;">(f) </span> <br /> 
										Amount of previously deferred long-term gain now included in taxable income
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/QOFInvstDisposDurCurrTYGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="InvestmentDisposedDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InterestDisposedDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SpecialGainCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PrevDefrdShortTermGainAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="PrevDefrdLongTermGainAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Part 5 separated table -->
					<xsl:if test="$shouldSeparateP5">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part IV - Total QOF Investment Holdings at Year End Due to Deferrals</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:24mm;">
										<strong>(a)</strong><br />
										Qualified Opportunity <br /> Fund (QOF) <br /> EIN
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:24mm;">
										<strong>(b)</strong><br />
										Date QOF <br /> investment acquired <br /> (MM/DD/YYYY)
									</th>
									<th class="styDepTblCell" scope="col" rowspan="2" style="width:80mm;">
										<strong>(c)</strong><br />
										Description of interest acquired <br /> (for example, 100 shares or 25% interest)
									</th>
									<th class="styDepTblCell" scope="col"	rowspan="2" style="width:10mm;">
										<strong>(d)</strong><br />
										Special gain code
									</th>
									<th class="styDepTblCell" scope="col" colspan="2" style="width:58mm;">
										Deferred gain invested in QOF investment
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:29mm;">
										<span style="font-weight:bold;">(e) </span> <br /> 
										Amount of short-term <br /> deferred gain <br /> invested in QOF</th>
									<th class="styDepTblCell" scope="col" style="width:29mm;">
										<span style="font-weight:bold;">(f) </span> <br /> 
										Amount of long-term <br /> deferred gain <br /> invested in QOF
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/TotQOFInvstHoldEOYGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="InvestmentAcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="InterestAcquiredDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SpecialGainCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ShortTermDefrdGainInvstAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LongTermDefrdGainInvstAmt"/>
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
	<xsl:template name="FillTable5Cols">
		<xsl:param name="LineNumber"/>
		<xsl:param name="SepMessage" select="false()"/>
		<xsl:param name="MaxLine" select="5"/>
		<tr style="height:7mm;vertical-align:bottom;">
			<td class="styTableCellCtrInherit">
				<xsl:choose>
					<xsl:when test="$SepMessage">
						See Additional <br /> Data Table
					</xsl:when>
					<xsl:otherwise>&nbsp;</xsl:otherwise>
				</xsl:choose>
			</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellTextInherit">&nbsp;</td>
			<td class="styTableCellCtrInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit">&nbsp;</td>
			<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
		</tr>
		<xsl:choose>
			<xsl:when test="$SepMessage">
				<xsl:call-template name="FillTable5Cols">
					<xsl:with-param name="LineNumber" select="2"/>
					<xsl:with-param name="SepMessage" select="false()"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$LineNumber &lt; $MaxLine">
				<xsl:call-template name="FillTable5Cols">
				<xsl:with-param name="LineNumber" select="$LineNumber + 1"/>
					<xsl:with-param name="MaxLine" select="$MaxLine"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
