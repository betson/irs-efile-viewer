<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 04/14/2021 -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8995AScheduleDStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8995AScheduleD" />
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
						<xsl:call-template name="IRS8995AScheduleDStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8995AScheduleD">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							<span class="styFN" style="font-size:12pt;font-family:Arial;">SCHEDULE D</span> <br /> 
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
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:2mm;">
								Special Rules for Patrons of <br />
								Agricultural or Horticultural Cooperatives
							</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 8995-A.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<a href="http://www.irs.gov/Form8995A" title="Link to IRS.gov"><i>www.irs.gov/Form8995A</i></a>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-2294</div>
							<div class="styTY">20<span class="styTYColor">20</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">55E</span>
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
					<div class="styStdDiv" style="border-top:1px solid black;padding-top:0.5mm;padding-bottom:0.5mm;font-style:italic;">
						Complete Schedule D only if you're a patron of an agricultural or horticultural cooperative. 
						If you have more than three trades, businesses, or aggregations, attach as many Schedules D as needed. See instructions.
					</div>
					<xsl:for-each select="$FormData/PatronAgricHortCoopGrp">
						<xsl:if test="position() mod 3 = 1">
							<xsl:variable name="pos" select="position()"/>
							<!-- Column Headers -->
							<div class="styStdDiv" style="border-top:1px solid black;">
								<div class="styLNLeftNumBox">&nbsp;</div>
								<div class="sty8995ASDDesc">&nbsp;</div>
								<div class="styLNRightNumBox" style="height:7mm;border-left-width:0px;">&nbsp;</div>
								<div class="sty8995ASDAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;"><xsl:number value="$pos" format="A"/></div>
								<div class="sty8995ASDAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 1" format="A"/></div>
								<div class="sty8995ASDAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;"><xsl:number value="$pos + 2" format="A"/></div>
							</div>
							<!-- Line 1a -->
							<div class="styStdDiv">
								<div class="styLNLeftNumBox">1a</div>
								<div class="sty8995ASDDesc">
									Trade, business, or aggregation name
									<span class="sty8995ASchDDotLn">........</span>
								</div>
								<div class="" style="float:left;clear:none;width:98mm;">
									<table role="presentation" style="border-collapse:collapse;">
										<tbody>
											<tr style="vertical-align:top;">
												<td class="styLNRightNumBox" style="float:none;">1a</td>
												<td class="sty8995ASDAmtBox" style="float:none;text-align:left;">
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
												<td class="sty8995ASDAmtBox" style="float:none;text-align:left;">
													<xsl:choose>
														<xsl:when test="$FormData/PatronAgricHortCoopGrp[$pos + 1]/PersonNm">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/TradeOrBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="$FormData/PatronAgricHortCoopGrp[$pos + 1]/TradeOrBusinessName/BusinessNameLine2Txt"><br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/TradeOrBusinessName/BusinessNameLine2Txt"/>
																</xsl:call-template>
															</xsl:if>
														</xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="sty8995ASDAmtBox" style="float:none;text-align:left;">
													<xsl:choose>
														<xsl:when test="$FormData/PatronAgricHortCoopGrp[$pos + 2]/PersonNm">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/PersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/TradeOrBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<xsl:if test="$FormData/PatronAgricHortCoopGrp[$pos + 2]/TradeOrBusinessName/BusinessNameLine2Txt"><br />
																<xsl:call-template name="PopulateText">
																	<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/TradeOrBusinessName/BusinessNameLine2Txt"/>
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
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBoxSD" style="padding-left:2.7mm;">b</div>
								<div class="sty8995ASDDesc">
									Taxpayer identification number
									<span class="sty8995ASchDDotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">1b</div>
								<div class="sty8995ASDAmtBox" style="text-align:center;">
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
								<div class="sty8995ASDAmtBox" style="text-align:center;">
									<xsl:choose>
										<xsl:when test="$FormData/PatronAgricHortCoopGrp[$pos + 1]/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$FormData/PatronAgricHortCoopGrp[$pos + 1]/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/SSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<div class="sty8995ASDAmtBox" style="text-align:center;">
									<xsl:choose>
										<xsl:when test="$FormData/PatronAgricHortCoopGrp[$pos + 2]/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$FormData/PatronAgricHortCoopGrp[$pos + 2]/SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/SSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/EIN"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<!-- Line 2 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">2</div>
								<div class="sty8995ASDDesc" style="height:7mm;">
									Qualified business income allocable to qualified payments received from cooperative. See instructions
									<span class="sty8995ASchDDotLn">......</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;"><br />2</div>
								<div class="sty8995ASDAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QBIAllcblQlfyCoopPymtAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/QBIAllcblQlfyCoopPymtAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/QBIAllcblQlfyCoopPymtAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 3 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">3</div>
								<div class="sty8995ASDDesc">
									Mulitply line 2 by 9% (0.09)
									<span class="sty8995ASchDDotLn">...........</span>
								</div>
								<div class="styLNRightNumBox">3</div>
								<div class="sty8995ASDAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QBIAllcblQlfyCoopPymtPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/QBIAllcblQlfyCoopPymtPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/QBIAllcblQlfyCoopPymtPctAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 4 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">4</div>
								<div class="sty8995ASDDesc" style="height:7mm;">
									W-2 wages from trade or business allocable to the qualified payments
									<span class="sty8995ASchDDotLn">................</span>
								</div>
								<div class="styLNRightNumBox" style="height:7mm;"><br />4</div>
								<div class="sty8995ASDAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="W2WageAllcblQlfyCoopPymtAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/W2WageAllcblQlfyCoopPymtAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox" style="height:7mm;"><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/W2WageAllcblQlfyCoopPymtAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 5 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">5</div>
								<div class="sty8995ASDDesc">
									Mulitply line 4 by 50% (0.50)
									<span class="sty8995ASchDDotLn">..........</span>
								</div>
								<div class="styLNRightNumBox">5</div>
								<div class="sty8995ASDAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="W2WageAllcblQlfyCoopPymtPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/W2WageAllcblQlfyCoopPymtPctAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/W2WageAllcblQlfyCoopPymtPctAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- Line 6 -->
							<div class="styStdIBDiv">
								<div class="styLNLeftNumBox">6</div>
								<div class="sty8995ASDDesc" style="height:10mm;">
									Patron reduction. Enter the smaller of line 3 or line 5. Enter this amount on Form 8995-A, line 14, 
									for the corresponding trade, business, or aggregation
									<span class="sty8995ASchDDotLn">............</span>
								</div>
								<div class="styLNRightNumBoxNBB" style="height:10mm;"><br /><br />6</div>
								<div class="sty8995ASDAmtBox" style="height:10mm;border-bottom-width:0px;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="PatronReductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox" style="height:10mm;border-bottom-width:0px;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 1]/PatronReductionAmt"/>
									</xsl:call-template>
								</div>
								<div class="sty8995ASDAmtBox" style="height:10mm;border-bottom-width:0px;"><br /><br />
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PatronAgricHortCoopGrp[$pos + 2]/PatronReductionAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</xsl:if>
					</xsl:for-each>
					<xsl:if test="count($FormData/PatronAgricHortCoopGrp) &lt; 1">
						<!-- Column Headers -->
						<div class="styStdDiv" style="border-top:1px solid black;">
							<div class="styLNLeftNumBox">&nbsp;</div>
							<div class="sty8995ASDDesc">&nbsp;</div>
							<div class="styLNRightNumBox" style="height:7mm;border-left-width:0px;">&nbsp;</div>
							<div class="sty8995ASDAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">A</div>
							<div class="sty8995ASDAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">B</div>
							<div class="sty8995ASDAmtBox" style="height:7mm;padding-top:2mm;text-align:center;font-weight:bold;">C</div>
						</div>
						<!-- Line 1a -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">1a</div>
							<div class="sty8995ASDDesc">
								Trade, business, or aggregation name
								<span class="sty8995ASchDDotLn">........</span>
							</div>
							<div class="styLNRightNumBox">1a</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
						</div>
						<!-- Line 1b -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="padding-left:2.7mm;">b</div>
							<div class="sty8995ASDDesc">
								Taxpayer identification number
								<span class="sty8995ASchDDotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">1b</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
						</div>
						<!-- Line 2 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">2</div>
							<div class="sty8995ASDDesc" style="height:7mm;">
								Qualified business income allocable to qualified payments received from cooperative. See instructions
								<span class="sty8995ASchDDotLn">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />2</div>
							<div class="sty8995ASDAmtBox" style="height:7mm;">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox" style="height:7mm;">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox" style="height:7mm;">
								&nbsp;
							</div>
						</div>
						<!-- Line 3 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">3</div>
							<div class="sty8995ASDDesc">
								Mulitply line 2 by 9% (0.09)
								<span class="sty8995ASchDDotLn">...........</span>
							</div>
							<div class="styLNRightNumBox">3</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
						</div>
						<!-- Line 4 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">4</div>
							<div class="sty8995ASDDesc" style="height:7mm;">
								W-2 wages from trade or business allocable to the qualified payments
								<span class="sty8995ASchDDotLn">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;"><br />4</div>
							<div class="sty8995ASDAmtBox" style="height:7mm;">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox" style="height:7mm;">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox" style="height:7mm;">
								&nbsp;
							</div>
						</div>
						<!-- Line 5 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">5</div>
							<div class="sty8995ASDDesc">
								Mulitply line 4 by 50% (0.50)
								<span class="sty8995ASchDDotLn">..........</span>
							</div>
							<div class="styLNRightNumBox">5</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox">
								&nbsp;
							</div>
						</div>
						<!-- Line 6 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">6</div>
							<div class="sty8995ASDDesc" style="height:10mm;">
								Patron reduction. Enter the smaller of line 3 or line 5. Enter this amount on Form 8995-A, line 14, 
								for the corresponding trade, business, or aggregation
								<span class="sty8995ASchDDotLn">............</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:10mm;"><br /><br />6</div>
							<div class="sty8995ASDAmtBox" style="height:10mm;border-bottom-width:0px;">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox" style="height:10mm;border-bottom-width:0px;">
								&nbsp;
							</div>
							<div class="sty8995ASDAmtBox" style="height:10mm;border-bottom-width:0px;">
								&nbsp;
							</div>
						</div>
					</xsl:if>
					<div class="styStdDiv" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:14mm;">Cat. No. 72683Z</span>
						<span style="float:right;font-weight:bold;">Schedule D (Form 8995-A) 2020</span>
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
