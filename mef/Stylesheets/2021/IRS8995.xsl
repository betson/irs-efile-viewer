<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#160;"> <!ENTITY mdash "&#8212;"> ]>
    <!-- Last Modified by Iskilu Lawal on 06/17/2021 drop 1 UWR # 365457 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS8995Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8995" />
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
						<xsl:call-template name="IRS8995Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8995">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							Form <span class="styFN" style="font-size:18pt;">8995</span> 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData" />
							</xsl:call-template>
							<br />
							<br />
							<br />
							<span class="styAgency">
								Department of the Treasury
								<br />
								Internal Revenue Service
							</span>
						</div>
						<div class="styFTBox" style="width:127mm;height:22.5mm;">
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:2mm;">Qualified Business Income Deduction <br />
							Simplified Computation</span>
							<br />
							<span style="font-weight:bold;">
								&#9658;Attach to your tax return.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8995</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:30mm;height:22.5mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-2294</div>
							<div class="styTY">20<span class="styTYColor">21</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">55</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							Name(s) shown on return<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Your taxpayer identification number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							
						</div>
					</div>
				<!-- ********************************************************************************************************************* -->
					<div class="styArialText" style="height:20mm;font-size:9pt;width:187mm;border-top:0px solid black;border-bottom:1px solid black;">
						<b>Note</b>. <i>You can claim the qualified business income deduction <b>only</b> if you have qualified business income from a qualified trade or
						business, real estate investment trust dividends, publicly traded partnership income, or a domestic production activities deduction
						passed through from an agricultural or horticultural cooperative. See instructions.<br/>
						Use this form if your taxable income, before your qualified business income deduction, is at or below $164,900 ($164,925 if married<br/>
						 filing separately; $329,800 if married filing jointly), and you aren’t a patron of an agricultural or horticultural cooperative.</i>
					</div>
			<!-- ********************************************************************************************************************* -->
					<!-- Table 1, cols (a)-(e) -->
					<xsl:variable name="shouldSeparate" select="($Print = $Separated) and (count($FormData/QualifiedBusinessIncomeDedGrp) &gt; 5)"/>
					<div class="styStdDiv" style="" id="Line1Table">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" scope="col" style="width:8mm;font-weight:bold;"> 1 </th>
									<th class="styTableCellHeader" scope="col" style="min-width:mm;width:110mm;font-weight:normal;">
										<span style="font-weight:bold;">(a) </span> Trade, business, or aggregation name
									</th>
									<th class="styTableCellHeader" scope="col" style="width:30mm;font-weight:normal;vertical-align:top;">
										<span style="font-weight:bold;">(b) </span> Taxpayer <br />
										identification number
									</th>
									<th class="styTableCellHeader" scope="col" style="width:38mm;font-weight:normal;vertical-align:top;border-right-width:0px;">
										<span style="font-weight:bold;">(c) </span> Qualified business <br />
										income or (loss)
										<div style="float:right;width:4mm;height:3.5mm;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedGrp"/>
									<xsl:with-param name="containerID" select=" 'Line1Table' "/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="containerHeight" select="5"/>
								</xsl:call-template>
							</div>
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparate)">
									<xsl:for-each select="$FormData/QualifiedBusinessIncomeDedGrp">
										<tr style="height:7.5mm;vertical-align:top;">
											<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
												<xsl:number value="position()" format="i"/>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:choose>
													<xsl:when test="TradeOrBusinessName">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TradeOrBusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="TradeOrBusinessName/BusinessNameLine2Txt">
															<br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="TradeOrBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellCtrInherit " style="vertical-align:bottom;">
												<xsl:choose>
													<xsl:when test="SSN">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="MissingEINReasonCd">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;vertical-align:bottom;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="QlfyBusinessIncomeOrLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/QualifiedBusinessIncomeDedGrp) &lt; 1">
									<tr style="height:7.5mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="1" format="i"/>
										</td>
										<td class="styTableCellTextInherit">&nbsp;
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/QualifiedBusinessIncomeDedGrp) &lt; 2">
									<tr style="height:7.5mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="2" format="i"/>
										</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/QualifiedBusinessIncomeDedGrp) &lt; 3">
									<tr style="height:7.5mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="3" format="i"/>
										</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/QualifiedBusinessIncomeDedGrp) &lt; 4">
									<tr style="height:7.5mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="4" format="i"/>
										</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/QualifiedBusinessIncomeDedGrp) &lt; 5">
									<tr style="height:7.5mm;vertical-align:top;">
										<td class="styTableCellCtrInherit" style="font-weight:bold;vertical-align:bottom;">
											<xsl:number value="5" format="i"/>
										</td>
										<td class="styTableCellTextInherit">&nbsp;</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparate)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedGrp"/>
							<xsl:with-param name="containerID" select=" 'Line1Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="5"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD"/>
						<div class="styLNDesc" style="width:98mm;"/>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="styLNDesc" style="width:98mm;height:7mm;">
							Total qualified business income or (loss). Combine lines 1i through 1v, <br />
							column (c) 
							<span class="sty8995DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />2</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQlfyBusinessIncomeOrLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"></div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width:98mm;">
							Qualified business net (loss) carryforward from the prior year
							<span class="sty8995DotLn">....</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
						
						<span>(</span>
                               <xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYQlfyBusinessNetLossCfwdAmt"/>
							</xsl:call-template> 
						<span>)</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width:98mm;">
							<span style="font-family:Arial;">Total qualified business income. Combine lines 2 and 3. If zero or less, enter -0-</span>
							<span class="sty8995DotLn">.</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQualifiedBusinessIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc">
							Qualified business income component. Multiply line 4 by 20% (0.20) 
							<span class="sty8995DotLn">............</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QBIComponentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width:98mm;height:7mm;">
							Qualified REIT dividends and publicly traded partnership (PTP) income or <br />
							(loss) (see instructions)
							<span class="sty8995DotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />6</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyREITDivPTPIncomeLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"></div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width:98mm;height:7mm;">
							Qualified REIT dividends and qualified PTP (loss) carryforward from the prior <br />
							year
							<span class="sty8995DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />7</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
						<span>(</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYQlfyREITDivPTPLossCfwdAmt"/>
							</xsl:call-template>
							<span>)</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"></div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:98mm;height:7mm;">
							Total qualified REIT dividends and PTP income. Combine lines 6 and 7. If zero <br />
							or less, enter -0-
							<span class="sty8995DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />8</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQlfyREITDivPTPIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"></div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							REIT and PTP component. Multiply line 8 by 20% (0.20) 
							<span class="sty8995DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/REITPTPComponentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Qualified business income deduction before the income limitation. Add lines 5 and 9
							<span class="sty8995DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QBIDedBfrIncomeLimitationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width:98mm;">
							Taxable income before qualified business income deduction
							<span class="sty8995DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeBeforeQBIDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width:98mm;">
							Net capital gain (see instructions)
							<span class="sty8995DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCapitalGainAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width:98mm;">
							Subtract line 12 from line 11. If zero or less, enter -0-
							<span class="sty8995DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc">
							Income limitation. Multiply line 13 by 20% (0.20) 
							<span class="sty8995DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeLimitationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="height:7mm;">
							Qualified business income deduction. Enter the lesser of line 10 or line 14. Also enter this amount on <br />
							the applicable line of your return 
							<span class="sty8995DotLn" style="padding-right:0px;margin-right:-4px;">......................&#9658;</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />15</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QualifiedBusinessIncomeDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc">
							Total qualified business (loss) carryforward. Combine lines 2 and 3. If greater than zero, enter -0-
							<span class="sty8995DotLn">...</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox">
						<span>(</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQlfyBusLossCarryforwardAmt"/>
							</xsl:call-template>
							<span>)</span>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="height:7mm;">
							Total qualified REIT dividends and PTP (loss) carryforward. Combine lines 6 and 7. If greater than <br />
							zero, enter -0-
							<span class="sty8995DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />17</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
						<span>(</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotQlfyREITDivPTPLossCfwdAmt"/>
							</xsl:call-template>
							<span>)</span>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 37806C</span>
						<span style="float:right;">Form <strong>8995</strong> (2021)</span>
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
					<!-- Line 1 separated table -->
					<xsl:if test="$shouldSeparate">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1 - Qualified Business Income Deduction Groups</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:8mm;">1</th>
									<th class="styDepTblCell" scope="col" style="width:107mm;">
										<span style="font-weight:bold;">(a) </span> Trade or business name
									</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;">
										<span style="font-weight:bold;">(b) </span> Taxpayer <br /> identification number
									</th>
									<th class="styDepTblCell" scope="col" style="width:39mm;">
										<span style="font-weight:bold;">(c) </span> Qualified business <br /> income or (loss)</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/QualifiedBusinessIncomeDedGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:8mm;text-align:center;">
											<xsl:number value="position()" format="i"/>
										</td>
										<td class="styTableCellText" style="width:98mm;">
											<xsl:choose>
												<xsl:when test="TradeOrBusinessName">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="TradeOrBusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="TradeOrBusinessName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="TradeOrBusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellText" style="width:39mm;text-align:center;">
											<xsl:choose>
												<xsl:when test="SSN">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="MissingEINReasonCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCell" style="width:39mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="QlfyBusinessIncomeOrLossAmt"/>
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
</xsl:stylesheet>
