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
	<xsl:include href="IRS8995AScheduleCStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8995AScheduleC" />
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
						<xsl:call-template name="IRS8995AScheduleCStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8995AScheduleC">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:30mm;height:22.5mm;">
							<span class="styFN" style="font-size:12pt;font-family:Arial;">SCHEDULE C</span> <br /> 
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
							<span class="styFMT" style="font-size:12pt;padding-top:1mm;padding-bottom:2mm;">Loss Netting and Carryforward</span>
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
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-2294</div>
							<div class="styTY">20<span class="styTYColor">21</span>
							</div>
							<div style="margin-left:3mm;text-align:left;font-size:7pt;">
								Attachment<br/>Sequence No. 
								<span class="styBoldText" style="font-size:9pt;">55D</span>
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
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;padding-top:0.5mm;padding-bottom:0.5mm;font-style:italic;">
						If you have more than three trades, businesses, or aggregations, complete and attach as many Schedules C as needed. See instructions.
						<div style="float:right;width:5mm;height:4mm;text-align:right;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$FormData/LossNettingCarryforwardGrp"/>
								<xsl:with-param name="containerID" select=" 'Line1Table' "/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerHeight" select="3"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 1 table -->
					<xsl:variable name="shouldSeparate" select="($Print = $Separated) and (count($FormData/LossNettingCarryforwardGrp) &gt; 3)"/>
					<div class="styTableContainerNBB" id="Line1Table">
						<xsl:call-template name="SetInitialState" />
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="height:12mm;vertical-align:top;">
									<th class="styTableCellHeader" scope="col" style="min-width:50mm;width:103mm;font-weight:normal;padding-top:1.5mm;">
										<span style="float:left;font-weight:bold;padding-left:2.5mm;">1</span>
										Trade, business, or aggregation name
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(a) </span> Qualified <br /> business <br /> income/(loss)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(b) </span> Reduction for loss netting (see instructions)
									</th>
									<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right-width:0px;padding-top:1.5mm;">
										<span style="font-weight:bold;">(c) </span> Adjusted qualified business income (Combine (a) and (b). If zero or less, enter -0-.)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSeparate)">
									<xsl:for-each select="$FormData/LossNettingCarryforwardGrp">
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
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="QlfyBusinessIncomeOrLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												(<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="LossNettingReductionAmt"/>
												</xsl:call-template>)
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdjQualifiedBusinessIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/LossNettingCarryforwardGrp) &lt; 1">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/LossNettingCarryforwardGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:22mm"/>)</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/LossNettingCarryforwardGrp) &lt; 2">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:22mm"/>)</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSeparate or count($FormData/LossNettingCarryforwardGrp) &lt; 3">
									<tr style="vertical-align:top;">
										<td class="styTableCellTextInherit" style="">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">(<span style="width:22mm"/>)</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<xsl:if test="not($shouldSeparate)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$FormData/LossNettingCarryforwardGrp"/>
							<xsl:with-param name="containerID" select=" 'Line1Table' "/>
							<xsl:with-param name="headerHeight" select="1"/>
							<xsl:with-param name="containerHeight" select="3"/>
						</xsl:call-template>
					</xsl:if>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">2</div>
						<div class="styLNDesc">
							Qualified business net (loss) carryforward from prior years. See instructions 
							<span class="sty8995ASchCDotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">2</div>
						<div class="styLNAmountBox">
						 <xsl:choose>
						   <xsl:when test="$FormData/PYQlfyBusinessNetLossCfwdAmt">
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYQlfyBusinessNetLossCfwdAmt" />
							</xsl:call-template>)
						   </xsl:when>	
						   <xsl:otherwise>
						     	(<span style="width:28mm"/>)
						   </xsl:otherwise>
						 </xsl:choose> 
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">3</div>
						<div class="styLNDesc" style="height:7mm;">
							Total of the trades, businesses, or aggregations losses. Combine the negative amounts on lines 1,
column (a), and 2 for all trades, businesses, or aggregations
							<span class="sty8995ASchCDotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />3</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
						<xsl:choose>
						   <xsl:when test="$FormData/TotalTradeOrBusinessLossAmt">
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTradeOrBusinessLossAmt" />
							</xsl:call-template>)
						   </xsl:when>	
						   <xsl:otherwise>
						     	(<span style="width:28mm"/>)
						   </xsl:otherwise>
						</xsl:choose>   
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">4</div>
						<div class="styLNDesc" style="height:7mm;">
							Total of the trades, businesses, or aggregations income. Add the positive amounts on line 1, column
(a), for all trades, businesses, or aggregations
							<span class="sty8995ASchCDotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />4</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTradeOrBusinessIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">5</div>
						<div class="styLNDesc" style="height:10mm;">
							Losses netted with income of other trades, businesses, or aggregations. Enter in the parentheses on line 5, <br />
							the smaller of the absolute value of line 3 or line 4. Allocate this amount to each of the trades, businesses, or <br />
							aggregations on line 1, column (b). See instructions
							<span class="sty8995ASchCDotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;"><br /><br />5</div>
						<div class="styLNAmountBox" style="height:10mm;"><br /><br />
						<xsl:choose>
						   <xsl:when test="$FormData/LossNettedIncomeOthTradeBusAmt">
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LossNettedIncomeOthTradeBusAmt" />
							</xsl:call-template>)
						   </xsl:when>	
						   <xsl:otherwise>
						     	(<span style="width:28mm"/>)
						   </xsl:otherwise>
						</xsl:choose>   
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">&nbsp;</div>
						<div class="styLNDesc">&nbsp;</div>
						<div class="styLNRightNumBoxNBB">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">6</div>
						<div class="styLNDesc">
							Qualified business net (loss) carryforward. Subtract line 5 from line 3. If zero or more, enter -0-
							<span class="sty8995ASchCDotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB">6</div>
						<div class="styLNAmountBoxNBB">
						<xsl:choose>
						   <xsl:when test="$FormData/QlfyBusLossCarryforwardAmt">
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyBusLossCarryforwardAmt" />
							</xsl:call-template>)
						   </xsl:when>	
						   <xsl:otherwise>
						     	(<span style="width:28mm"/>)
						   </xsl:otherwise>
						</xsl:choose>   
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Privacy Act and Paperwork Reduction Act Notice, see separate instructions.</span>
						<span style="margin-left:14mm;">Cat. No. 71661B</span>
						<span style="float:right;font-weight:bold;">Schedule C (Form 8995-A) 2021</span>
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
						<span class="styRepeatingDataTitle">Line 1 - Loss Netting and Carryfoward Group Information</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:187mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="min-width:50mm;width:103mm;font-weight:normal;padding-top:1.5mm;">
										<span style="float:left;font-weight:bold;padding-left:2.5mm;">1</span>
										Trade, business, or aggregation name
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(a) </span> Qualified <br /> business <br /> income/(loss)
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(b) </span> Reduction for loss netting (see instructions)
									</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;font-weight:normal;padding-top:1.5mm;">
										<span style="font-weight:bold;">(c) </span> Adjusted qualified business income (Combine (a) and (b). If zero or less, enter -0-.)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/LossNettingCarryforwardGrp">
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
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="QlfyBusinessIncomeOrLossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											(<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LossNettingReductionAmt"/>
											</xsl:call-template>)
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AdjQualifiedBusinessIncomeAmt"/>
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
