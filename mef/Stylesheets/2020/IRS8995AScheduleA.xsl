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
	<xsl:include href="IRS8995AScheduleAStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8995AScheduleA" />
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
						<xsl:call-template name="IRS8995AScheduleAStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8995AScheduleA">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="sty8995ASALineDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							<span class="styFN" style="font-size:12pt;font-family:Arial;">SCHEDULE A</span> <br /> 
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
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:2mm;">Specified Service Trades or Businesses</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 8995-A.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8995-A</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0123</div>
							<div class="styTY">20<span class="styTYColor">20</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">55B</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="sty8995ASALineDiv" style="border-top:2px solid black;">
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
					<div class="sty8995ASALineDiv" style="border-top:1px solid black;padding-top:0.5mm;padding-bottom:0.5mm;font-style:italic;">
						Complete Schedule A only if your trade or business is a specified service trade or business (see instructions) and your taxable 
						income is more than $163,300 but not $213,300 ($326,600 and $426,600 if married filing jointly). If your taxable income isn’t more than $163,300
						($326,600 if married filing jointly) and you’re not a patron of an agricultural or horticultural cooperative, don’t file this form; instead, file Form 8995, 
						Qualified Business Income Deduction Simplified Computation. Otherwise, complete Schedule D (Form 8995-A) before beginning Schedule A.
						If your taxable income is more than $213,300 ($426,600 if married filing jointly), your specified service trade or business doesn’t qualify for the deduction.
						If you have more than three trades or businesses, attach 	as many Schedules A as needed. See instructions.
					</div>
					<div class="sty8995ASALineDiv" style="border-top:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Other Than Publicly Traded Partnerships</div>
					</div>
					<xsl:for-each select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp">
						<xsl:if test="position() mod 3 = 1">
							<xsl:variable name="pos" select="position()"/>
							<!-- Column Headers -->
							<div class="sty8995ASALineDiv" style="border-top:1px solid black;">
								<div class="styLNLeftNumBox">&nbsp;</div>
								<div class="sty8995ASADesc">&nbsp;</div>
								<div class="styLNRightNumBox" style="height:7mm;border-left-width:0px;">&nbsp;</div>
								<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;"><xsl:number value="$pos" format="A"/></div>
								<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 1" format="A"/></div>
								<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 2" format="A"/></div>
							</div>
							<!-- Line 1a -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBoxSD">1a</div>
								<div class="sty8995ASADesc">
									Trade or business name
									<span class="sty8995ASchADotLn">............</span>
								</div>
								<div class="" style="float:left;clear:none;width:98mm;">
									<table role="presentation" style="border-collapse:collapse;">
										<tbody>
											<tr style="vertical-align:top;">
												<td class="styLNRightNumBox" style="float:none;">1a</td>
												<td class="sty8995ASAAmtBox" style="float:none;text-align:left;">
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
												<td class="sty8995ASAAmtBox" style="float:none;text-align:left;">
													<xsl:choose>
														<xsl:when test="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/PersonNm">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/TradeOrBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/TradeOrBusinessName/BusinessNameLine2Txt"><br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/TradeOrBusinessName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="sty8995ASAAmtBox" style="float:none;text-align:left;">
													<xsl:choose>
														<xsl:when test="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/PersonNm">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/TradeOrBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/TradeOrBusinessName/BusinessNameLine2Txt"><br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/TradeOrBusinessName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- Line 1b -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
								<div class="sty8995ASADesc">
									Taxpayer identification number
									<span class="sty8995ASchADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">1b</div>
								<div class="sty8995ASAAmtBox" style="text-align:center;">
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
								</div>
								<div class="sty8995ASAAmtBox" style="text-align:center;">
									<xsl:choose>
										<xsl:when test="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/SSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="sty8995ASAAmtBox" style="text-align:center;">
									<xsl:choose>
										<xsl:when test="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/SSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!-- Line 2 -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBoxSD">2</div>
								<div class="sty8995ASADesc">
									Qualified business income or (loss) from the trade or business
								</div>
								<div class="styLNRightNumBox">2</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QualifedBusinessIncomeAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/QualifedBusinessIncomeAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/QualifedBusinessIncomeAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 3 -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBoxSD">3</div>
								<div class="sty8995ASADesc">
									Allocable share of W-2 wages from the trade or business
									<span class="sty8995ASchADotLn">..</span>
								</div>
								<div class="styLNRightNumBox">3</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AllocableShareW2WagesAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/AllocableShareW2WagesAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/AllocableShareW2WagesAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 4 -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBoxSD">4</div>
								<div class="sty8995ASADesc">
									Allocable share of the UBIA of all qualified property
									<span class="sty8995ASchADotLn">....</span>
								</div>
								<div class="styLNRightNumBox">4</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AllocableShareUBIAQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/AllocableShareUBIAQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/AllocableShareUBIAQlfyPropAmt" />
									</xsl:call-template>
								</div>
							</div>
							<xsl:if test="$pos = 1">
								<!-- Line 5 -->
								<div class="sty8995ASALineDiv">
									<div class="styLNLeftNumBoxSD">5</div>
									<div class="sty8995ASADesc" style="height:7mm;width:43mm;">
										Taxable income before qualified business income deduction
										<span class="sty8995ASchADotLn">..</span>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;"><br />5</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/TaxableIncomeBeforeQBIDedAmt" />
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 6 -->
								<div class="sty8995ASALineDiv">
									<div class="styLNLeftNumBoxSD">6</div>
									<div class="sty8995ASADesc" style="height:7mm;width:43mm;">
										Threshold. Enter $163,300 ($326,600 if married filing jointly)
									</div>
									<div class="styLNRightNumBox" style="height:7mm;"><br />6</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/FilingStatusThresholdCd" />
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 7 -->
								<div class="sty8995ASALineDiv">
									<div class="styLNLeftNumBoxSD">7</div>
									<div class="sty8995ASADesc" style="width:43mm;">
										Subract line 6 from line 5
										<span class="sty8995ASchADotLn">..</span>
									</div>
									<div class="styLNRightNumBox">7</div>
									<div class="sty8995ASAAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/TXIBfrQBIDedLessThresholdAmt" />
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 8 -->
								<div class="sty8995ASALineDiv">
									<div class="styLNLeftNumBoxSD">8</div>
									<div class="sty8995ASADesc" style="height:7mm;width:43mm;">
										Phase-in range. Enter $50,000 ($100,000 if married filing jointly)
									</div>
									<div class="styLNRightNumBox" style="height:7mm;"><br />8</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/FilingStatusPhaseInRangeCd" />
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 9 -->
								<div class="sty8995ASALineDiv">
									<div class="styLNLeftNumBoxSD">9</div>
									<div class="sty8995ASADesc" style="width:43mm;">
										Divide line 7 by line 8
										<span class="sty8995ASchADotLn">...</span>
									</div>
									<div class="styLNRightNumBox">9</div>
									<div class="sty8995ASAAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/PhaseInPct" />
										</xsl:call-template>
									</div>
									<div class="styLNRightNumBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
								</div>
								<!-- Line 10 -->
								<div class="sty8995ASALineDiv">
									<div class="styLNLeftNumBox">10</div>
									<div class="sty8995ASADesc" style="height:7mm;width:43mm;">
										Applicable percentage. Subtract line 9 from 100%
										<span class="sty8995ASchADotLn">....</span>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;"><br />10</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/ApplicablePct" />
										</xsl:call-template>
										<xsl:if test="not($FormData/NonPTPSSTBGrp/ApplicablePct)">%</xsl:if>
									</div>
									<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
									<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
								</div>
							</xsl:if>
							<!-- Line 11 -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBox">11</div>
								<div class="sty8995ASADesc" style="height:13mm;">
									Applicable percentage of qualified business income or (loss). Multiply line 2 by line 10. 
									Enter this amount on Schedule C (Form 8995-A) or on Form 8995-A, line 2, for the 
									corresponding trade or business, as appropriate. See instructions
									<span class="sty8995ASchADotLn">....</span>
								</div>
								<div class="styLNRightNumBox" style="height:13mm;"><br /><br /><br />11</div>
								<div class="sty8995ASAAmtBox" style="height:13mm;"><br /><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ApplicablePctQBIAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox" style="height:13mm;"><br /><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/ApplicablePctQBIAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox" style="height:13mm;"><br /><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/ApplicablePctQBIAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 12 -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBox">12</div>
								<div class="sty8995ASADesc" style="height:10mm;">
									Applicable percentage of W-2 wages. Multiply line 3 by line 10. 
									Enter this amount on Form 8995-A, line 4, for the corresponding 
									trade or business, as appropriate. See instructions
									<span class="sty8995ASchADotLn">....</span>
								</div>
								<div class="styLNRightNumBox" style="height:10mm;"><br /><br />12</div>
								<div class="sty8995ASAAmtBox" style="height:10mm;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ApplicablePctW2WagesAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox" style="height:10mm;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/ApplicablePctW2WagesAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox" style="height:10mm;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/ApplicablePctW2WagesAmt" />
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 13 -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBox">13</div>
								<div class="sty8995ASADesc" style="height:13mm;">
									Applicable percentage of the UBIA of qualified property. <br /> Multiply line 4 by line 10. 
									Enter this amount on Form 8995-A, line 7, for the corresponding 
									trade or business, as appropriate. See instructions
									<span class="sty8995ASchADotLn">..............</span>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:13mm;"><br /><br /><br />13</div>
								<div class="sty8995ASAAmtBox" style="height:13mm;border-bottom-width:0px;"><br /><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="ApplicablePctUBIAQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox" style="height:13mm;border-bottom-width:0px;"><br /><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 1]/ApplicablePctUBIAQlfyPropAmt" />
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox" style="height:13mm;border-bottom-width:0px;"><br /><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp[$pos + 2]/ApplicablePctUBIAQlfyPropAmt" />
									</xsl:call-template>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="count($FormData/NonPTPSSTBGrp/NonPTPSSTBDtlGrp) &lt; 1">
						<!-- Column Headers -->
						<div class="sty8995ASALineDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="sty8995ASADesc">&nbsp;</div>
							<div class="styLNRightNumBox" style="height:7mm;border-left-width:0px;">&nbsp;</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">A</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">B</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">C</div>
						</div>
						<!-- Line 1a -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD">1a</div>
							<div class="sty8995ASADesc">
								Trade or business name
								<span class="sty8995ASchADotLn">............</span>
							</div>
							<div class="styLNRightNumBox">1a</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
						</div>
						<!-- Line 1b -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
							<div class="sty8995ASADesc">
								Taxpayer identification number
								<span class="sty8995ASchADotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">1b</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
						</div>
						<!-- Line 2 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="sty8995ASADesc">
								Qualified business income or (loss) from the trade or business
							</div>
							<div class="styLNRightNumBox">2</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
						</div>
						<!-- Line 3 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="sty8995ASADesc">
								Allocable share of W-2 wages from the trade or business
								<span class="sty8995ASchADotLn">..</span>
							</div>
							<div class="styLNRightNumBox">3</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
						</div>
						<!-- Line 4 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="sty8995ASADesc">
								Allocable share of the UBIA of all qualified property
								<span class="sty8995ASchADotLn">....</span>
							</div>
							<div class="styLNRightNumBox">4</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox">
								&nbsp;
							</div>
						</div>
						<!-- Line 5 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="sty8995ASADesc" style="height:7mm;width:43mm;">
								Taxable income before qualified business income deduction
								<span class="sty8995ASchADotLn">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />5</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/TaxableIncomeBeforeQBIDedAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">
								&nbsp;
							</div>
						</div>
						<!-- Line 6 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="sty8995ASADesc" style="height:13mm;width:43mm;">
								Threshold. Enter $160,700 ($160,725 if married filing separately; $321,400 if married filing jointly
								<span class="sty8995ASchADotLn">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;"><br /><br /><br />6</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;"><br /><br /><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/FilingStatusThresholdCd" />
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;background-color:lightgrey;">
								&nbsp;
							</div>
						</div>
						<!-- Line 7 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="sty8995ASADesc" style="width:43mm;">
								Subract line 6 from line 5
								<span class="sty8995ASchADotLn">..</span>
							</div>
							<div class="styLNRightNumBox">7</div>
							<div class="sty8995ASAAmtBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/TXIBfrQBIDedLessThresholdAmt" />
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">
								&nbsp;
							</div>
						</div>
						<!-- Line 8 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="sty8995ASADesc" style="height:7mm;width:43mm;">
								Phase-in range. Enter $50,000 ($100,000 if married filing jointly)
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />8</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;"><br />
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/FilingStatusPhaseInRangeCd" />
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">
								&nbsp;
							</div>
						</div>
						<!-- Line 9 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="sty8995ASADesc" style="width:43mm;">
								Divide line 7 by line 8
								<span class="sty8995ASchADotLn">...</span>
							</div>
							<div class="styLNRightNumBox">9</div>
							<div class="sty8995ASAAmtBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/PhaseInPct" />
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="background-color:lightgrey;">
								&nbsp;
							</div>
						</div>
						<!-- Line 10 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBox">10</div>
							<div class="sty8995ASADesc" style="height:7mm;width:43mm;">
								Applicable percentage. Subtract line 9 from 100%
								<span class="sty8995ASchADotLn">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />10</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;"><br />
								<xsl:call-template name="PopulatePercent">
									<xsl:with-param name="TargetNode" select="$FormData/NonPTPSSTBGrp/ApplicablePct" />
								</xsl:call-template>
								<xsl:if test="not($FormData/NonPTPSSTBGrp/ApplicablePct)">%</xsl:if>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;background-color:lightgrey;">
								&nbsp;
							</div>
						</div>
						<!-- Line 11 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBox">11</div>
							<div class="sty8995ASADesc" style="height:13mm;">
								Applicable percentage of qualified business income or (loss). Multiply line 2 by line 10. 
								Enter this amount on Schedule C (Form 8995-A) or on Form 8995-A, line 2, for the 
								corresponding trade or business, as appropriate. See instructions
								<span class="sty8995ASchADotLn">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:13mm;"><br /><br /><br />11</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;">
								&nbsp;
							</div>
						</div>
						<!-- Line 12 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBox">12</div>
							<div class="sty8995ASADesc" style="height:10mm;">
								Applicable percentage of W-2 wages. Multiply line 3 by line 10. 
								Enter this amount on Form 8995-A, line 4, for the corresponding 
								trade or business, as appropriate. See instructions
								<span class="sty8995ASchADotLn">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;"><br /><br />12</div>
							<div class="sty8995ASAAmtBox" style="height:10mm;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:10mm;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:10mm;">
								&nbsp;
							</div>
						</div>
						<!-- Line 13 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBox">13</div>
							<div class="sty8995ASADesc" style="height:13mm;">
								Applicable percentage of the UBIA of qualified property. <br /> Multiply line 4 by line 10. 
								Enter this amount on Form 8995-A, line 7, for the corresponding 
								trade or business, as appropriate. See instructions
								<span class="sty8995ASchADotLn">..............</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:13mm;"><br /><br /><br />13</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;border-bottom-width:0px;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;border-bottom-width:0px;">
								&nbsp;
							</div>
							<div class="sty8995ASAAmtBox" style="height:13mm;border-bottom-width:0px;">
								&nbsp;
							</div>
						</div>
					</xsl:if>
					<!-- Part 2 -->
					<div class="sty8995ASALineDiv" style="border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Publicly Traded Partnership</div>
					</div>
					<xsl:for-each select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp">
						<xsl:if test="position() mod 3 = 1">
							<xsl:variable name="pos" select="position()" />
							<!-- Column Headers -->
							<div class="sty8995ASALineDiv" style="border-top:1px solid black;">
								<div class="styLNLeftNumBox">&nbsp;</div>
								<div class="sty8995ASADesc">&nbsp;</div>
								<div class="styLNRightNumBox" style="height:7mm;border-left-width:0px;">&nbsp;</div>
								<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;"><xsl:number value="$pos" format="A"/></div>
								<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 1" format="A"/></div>
								<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 2" format="A"/></div>
							</div>
							<!-- Line 14 -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBox">14</div>
								<div class="sty8995ASADesc">
									Trade or business name
									<span class="sty8995ASchADotLn">............</span>
								</div>
								<div class="" style="float:left;clear:none;width:98mm;">
									<table role="presentation" style="border-collapse:collapse;">
										<tbody>
											<tr style="vertical-align:top;">
												<td class="styLNRightNumBox" style="float:none;">14</td>
												<td class="sty8995ASAAmtBox" style="float:none;text-align:left;">
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
												<td class="sty8995ASAAmtBox" style="float:none;text-align:left;">
													<xsl:choose>
														<xsl:when test="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/PersonNm">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/TradeOrBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/TradeOrBusinessName/BusinessNameLine2Txt"><br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/TradeOrBusinessName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="sty8995ASAAmtBox" style="float:none;text-align:left;">
													<xsl:choose>
														<xsl:when test="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/PersonNm">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/TradeOrBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/TradeOrBusinessName/BusinessNameLine2Txt"><br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/TradeOrBusinessName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- Line 1b -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBox">15</div>
								<div class="sty8995ASADesc">
									Taxpayer identification number
									<span class="sty8995ASchADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">15</div>
								<div class="sty8995ASAAmtBox" style="text-align:center;">
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
								</div>
								<div class="sty8995ASAAmtBox" style="text-align:center;">
									<xsl:choose>
										<xsl:when test="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/SSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="sty8995ASAAmtBox" style="text-align:center;">
									<xsl:choose>
										<xsl:when test="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/SSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!-- Line 16 -->
							<div class="sty8995ASALineDiv">
								<div class="styLNLeftNumBox">16</div>
								<div class="sty8995ASADesc">
									Qualified PTP income or (loss)
									<span class="sty8995ASchADotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">16</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QualifiedIncomeOrLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 1]/QualifiedIncomeOrLossAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASAAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PTPSSTBDtlGrp[$pos + 2]/QualifiedIncomeOrLossAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="count($FormData/PTPSSTBGrp/PTPSSTBDtlGrp) &lt; 1">
						<!-- Column Headers -->
						<div class="sty8995ASALineDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="sty8995ASADesc">&nbsp;</div>
							<div class="styLNRightNumBox" style="height:7mm;border-left-width:0px;">&nbsp;</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">A</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">B</div>
							<div class="sty8995ASAAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">C</div>
						</div>
						<!-- Line 14 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBox">14</div>
							<div class="sty8995ASADesc">
								Trade or business name
								<span class="sty8995ASchADotLn">............</span>
							</div>
							<div class="styLNRightNumBox">14</div>
							<div class="sty8995ASAAmtBox">&nbsp;</div>
							<div class="sty8995ASAAmtBox">&nbsp;</div>
							<div class="sty8995ASAAmtBox">&nbsp;</div>
						</div>
						<!-- Line 15 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBox">15</div>
							<div class="sty8995ASADesc">
								Taxpayer identification number
								<span class="sty8995ASchADotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">15</div>
							<div class="sty8995ASAAmtBox">&nbsp;</div>
							<div class="sty8995ASAAmtBox">&nbsp;</div>
							<div class="sty8995ASAAmtBox">&nbsp;</div>
						</div>
						<!-- Line 16 -->
						<div class="sty8995ASALineDiv">
							<div class="styLNLeftNumBox">16</div>
							<div class="sty8995ASADesc">
								Qualified PTP income or (loss)
								<span class="sty8995ASchADotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">16</div>
							<div class="sty8995ASAAmtBox">&nbsp;</div>
							<div class="sty8995ASAAmtBox">&nbsp;</div>
							<div class="sty8995ASAAmtBox">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Line 17 -->
					<div class="sty8995ASALineDiv" style="">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width:141mm;">
							Total PTP SSTB income or (loss). Combine all amounts on line 16
							<span class="sty8995ASchADotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="sty8995ASAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/TotalQualifiedIncomeOrLossAmt" /> 
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="sty8995ASALineDiv" style="">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width:141mm;">
							Taxable income before qualified business income deduction
							<span class="sty8995ASchADotLn">................</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="sty8995ASAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/TaxableIncomeBeforeQBIDedAmt" /> 
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="sty8995ASALineDiv" style="">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:141mm;">
							Threshold. Enter $163,300 ($326,600 if married filing jointly)
							<span class="sty8995ASchADotLn">...............</span>
						</div>
						<div class="styLNRightNumBox">19</div>
						<div class="sty8995ASAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/FilingStatusThresholdCd" /> 
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="sty8995ASALineDiv" style="">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width:141mm;">
							Subtract line 19 from line 18
							<span class="sty8995ASchADotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="sty8995ASAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/TXIBfrQBIDedLessThresholdAmt" /> 
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="sty8995ASALineDiv" style="">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width:141mm;">
							Phase-in range. Enter $50,000 ($100,000 if married filing jointly)
							<span class="sty8995ASchADotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">21</div>
						<div class="sty8995ASAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/FilingStatusPhaseInRangeCd" /> 
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="sty8995ASALineDiv" style="">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width:141mm;">
							Divide line 20 by line 21 
							<span class="sty8995ASchADotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">22</div>
						<div class="sty8995ASAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/PhaseInPct" /> 
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="sty8995ASALineDiv" style="">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width:141mm;">
							Applicable percentage. Subtract line 22 from line 100%
							<span class="sty8995ASchADotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="sty8995ASAAmtBox">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/ApplicablePct" /> 
							</xsl:call-template>
							<xsl:if test="not($FormData/PTPSSTBGrp/ApplicablePct)">%</xsl:if>
						</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="width:141mm;height:7mm;">
							Applicable percentage of qualified PTP income or (loss). Multiply line 17 by line 23. Include this amount on <br /> Form 8995-A, line 28
							<span class="sty8995ASchADotLn">............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />24</div>
						<div class="sty8995ASAAmtBox" style="height:7mm;border-bottom-width:0px;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PTPSSTBGrp/ApplicablePctQlfyIncomeLossAmt" /> 
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:14mm;">Cat. No. 72681D</span>
						<span style="float:right;font-weight:bold;">Schedule A (Form 8995-A) 2020</span>
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
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
