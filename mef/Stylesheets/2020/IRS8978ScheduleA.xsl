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
	<xsl:include href="IRS8978ScheduleAStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS8978ScheduleA" />
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
				<meta name="Description" content="IRS Form 5471 Schedule I1" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8978ScheduleAStyle" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form8978ScheduleA">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:19mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:10pt;">SCHEDULE A
								<br/>
								(Form 8978)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template>
							</div>
							<div class="" style="padding-top:.5mm;font-size:7pt;">(December 2019)</div>
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury
								<br/>Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:129mm;height:19mm;">
							<span class="styFMT" style="font-size:11pt;">Partner’s Additional Reporting Year Tax</span>
							<br />
							<span style="font-weight:bold;font-size:9pt;">(Schedule of Adjustments)</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 8978.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form8978</span>
								for the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:19mm;border-left-width:2px;">  
							<div class="styOMB" style="padding-top:8mm;border-bottom-width:0px;">OMB No. 1545-0123</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styNameBox" style="width:135mm;">
							<strong>Name of partner(s)</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template><br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Partner tax ID number</strong><br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- TH line -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="height:11mm;border-bottom:1px solid black;">&nbsp;</div>
						<div class="sty8978SchATxtBox" style="width:41mm;height:11mm;text-align:center;border-left-width:0px;">
							<strong>Adjustments</strong><br />
							(see instructions)
						</div>
						<div class="sty8978SchATxtBox" style="height:11mm;text-align:center;font-weight:bold;">
							Tracking Number
						</div>
						<div class="sty8978SchAAmtBox" style="height:11mm;text-align:center;">
							<strong>(a)</strong><br />
							Tax Year Ended <br />
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[1]/TaxYearEndDt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox" style="height:11mm;text-align:center;">
							<strong>(b)</strong><br />
							Tax Year Ended <br />
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[2]/TaxYearEndDt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox" style="height:11mm;text-align:center;">
							<strong>(c)</strong><br />
							Tax Year Ended <br />
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[3]/TaxYearEndDt"/>
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox" style="height:11mm;text-align:center;">
							<strong>(d)</strong><br />
							Tax Year Ended <br />
							<xsl:call-template name="PopulateMonthDayYear">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[4]/TaxYearEndDt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="height:3.5mm;padding-bottom:none;">1</div>
						<div class="sty8978SchAHeaderBoxL" style="width:41mm;border-left-width:0px;">
							Income: 
						</div>
						<div class="sty8978SchAHeaderBoxL" style="text-align:center;">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
					</div>
					<xsl:for-each select="$FormData/PartnerAdditionalRptgYrTxGrp/AdjTaxableIncomeTxYrEndGrp">
						<div class="styStdDiv" style="">
							<div class="styLNLeftLtrBox" style="height:7mm;"><xsl:number value="position()" format="a"/></div>
							<div class="sty8978SchATxtBox" style="width:41mm;border-left-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="AdjustmentsDesc" />
								</xsl:call-template>
							</div>
							<div class="sty8978SchATxtBox" style="text-align:center;">
								<xsl:choose>
									<xsl:when test="EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
									</xsl:when>
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
									<xsl:when test="TrackingNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="TrackingNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AuditControlNum"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<xsl:variable name="L1ColNum" select="count(../preceding-sibling::PartnerAdditionalRptgYrTxGrp) + 1"/>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L1ColNum = 1">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L1ColNum = 2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L1ColNum = 3">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L1ColNum = 4">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</xsl:for-each>
					<xsl:variable name="L1count" select="count($FormData/PartnerAdditionalRptgYrTxGrp/AdjTaxableIncomeTxYrEndGrp)"/>
					<xsl:if test="$L1count &lt; 7">
						<xsl:call-template name="F8978BlankLines">
							<xsl:with-param name="LineNum" select="$L1count + 1" />
						</xsl:call-template>
					</xsl:if>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="sty8978SchATxtBox" style="width:79mm;border-left-width:0px;">
							<div class="styLNLeftNumBox">2</div> 
							Total adjustments to income (add lines 1a through 1g in each column (a) through (d))
							<span class="sty8978SchADotLn">.......</span>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[1]/TotalAdjustmentsToIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[2]/TotalAdjustmentsToIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[3]/TotalAdjustmentsToIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[4]/TotalAdjustmentsToIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="height:3.5mm;padding-bottom:none;">3</div>
						<div class="sty8978SchAHeaderBoxL" style="width:41mm;border-left-width:0px;">
							Deductions: 
						</div>
						<div class="sty8978SchAHeaderBoxL" style="text-align:center;">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
					</div>
					<xsl:for-each select="$FormData/PartnerAdditionalRptgYrTxGrp/AdjDeductionIncomeTxYrEndGrp">
						<div class="styStdDiv" style="">
							<div class="styLNLeftLtrBox" style="height:7mm;"><xsl:number value="position()" format="a"/></div>
							<div class="sty8978SchATxtBox" style="width:41mm;border-left-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="AdjustmentsDesc" />
								</xsl:call-template>
							</div>
							<div class="sty8978SchATxtBox" style="text-align:center;">
								<xsl:choose>
									<xsl:when test="EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
									</xsl:when>
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
									<xsl:when test="TrackingNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="TrackingNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AuditControlNum"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<xsl:variable name="L2ColNum" select="count(../preceding-sibling::PartnerAdditionalRptgYrTxGrp) + 1"/>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L2ColNum = 1">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L2ColNum = 2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L2ColNum = 3">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L2ColNum = 4">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</xsl:for-each>
					<xsl:variable name="L2count" select="count($FormData/PartnerAdditionalRptgYrTxGrp/AdjDeductionIncomeTxYrEndGrp)"/>
					<xsl:if test="$L2count &lt; 7">
						<xsl:call-template name="F8978BlankLines">
							<xsl:with-param name="LineNum" select="$L2count + 1" />
						</xsl:call-template>
					</xsl:if>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="sty8978SchATxtBox" style="width:79mm;border-left-width:0px;">
							<div class="styLNLeftNumBox">4</div> 
							Total adjustments to deductions (add lines 3a through 3g in each column (a) through (d))
							<span class="sty8978SchADotLn">......</span>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[1]/TotalDeductionNetChangeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[2]/TotalDeductionNetChangeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[3]/TotalDeductionNetChangeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[4]/TotalDeductionNetChangeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv" style="">
						<div class="styLNLeftNumBox" style="height:3.5mm;padding-bottom:none;">5</div>
						<div class="sty8978SchAHeaderBoxL" style="width:41mm;border-left-width:0px;">
							Credits: 
						</div>
						<div class="sty8978SchAHeaderBoxL" style="text-align:center;">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
						<div class="sty8978SchAHeaderBoxR">&nbsp;</div>
					</div>
					<xsl:for-each select="$FormData/PartnerAdditionalRptgYrTxGrp/AdjustmentCreditTaxYrEndGrp">
						<div class="styStdDiv" style="">
							<div class="styLNLeftLtrBox" style="height:7mm;"><xsl:number value="position()" format="a"/></div>
							<div class="sty8978SchATxtBox" style="width:41mm;border-left-width:0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="AdjustmentsDesc" />
								</xsl:call-template>
							</div>
							<div class="sty8978SchATxtBox" style="text-align:center;">
								<xsl:choose>
									<xsl:when test="EIN">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
									</xsl:when>
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
									<xsl:when test="TrackingNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="TrackingNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AuditControlNum"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
							<xsl:variable name="L3ColNum" select="count(../preceding-sibling::PartnerAdditionalRptgYrTxGrp) + 1"/>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L3ColNum = 1">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L3ColNum = 2">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L3ColNum = 3">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
							<div class="sty8978SchAAmtBox">
								<xsl:if test="$L3ColNum = 4">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustmentAmt" />
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</xsl:for-each>
					<xsl:variable name="L3count" select="count($FormData/PartnerAdditionalRptgYrTxGrp/AdjustmentCreditTaxYrEndGrp)"/>
					<xsl:if test="$L3count &lt; 7">
						<xsl:call-template name="F8978BlankLines">
							<xsl:with-param name="LineNum" select="$L3count + 1" />
						</xsl:call-template>
					</xsl:if>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="sty8978SchATxtBox" style="width:79mm;border-left-width:0px;">
							<div class="styLNLeftNumBox">6</div> 
							Total adjustments to credits (add lines 5a through 5g in each column (a) through (d))
							<span class="sty8978SchADotLn">.......</span>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[1]/TotalAdjustmentsToCreditAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[2]/TotalAdjustmentsToCreditAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[3]/TotalAdjustmentsToCreditAmt" />
							</xsl:call-template>
						</div>
						<div class="sty8978SchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PartnerAdditionalRptgYrTxGrp[4]/TotalAdjustmentsToCreditAmt" />
							</xsl:call-template>
						</div>
					</div>
					
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see the Instructions for Form 1065.</span>
						<span style="margin-left:17mm;font-size:6.5pt;">Cat. No. 70970F</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule A (Form 8978) (12-2019)</span>
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
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Separate Category - Sanctioned Country Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/SanctionedCountryCd"/>
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
				</form>
			</body>
		</html>
	</xsl:template>
	<xsl:template name="F8978BlankLines">
		<xsl:param name="LineNum" select="1"/>
		<xsl:param name="MaxLines" select="7"/>
		<div class="styStdDiv" style="">
			<div class="styLNLeftLtrBox"><xsl:number value="$LineNum" format="a"/></div>
			<div class="sty8978SchATxtBox" style="width:41mm;border-left-width:0px;">&nbsp;</div>
			<div class="sty8978SchATxtBox" style="text-align:center;">&nbsp;</div>
			<div class="sty8978SchAAmtBox">&nbsp;</div>
			<div class="sty8978SchAAmtBox">&nbsp;</div>
			<div class="sty8978SchAAmtBox">&nbsp;</div>
			<div class="sty8978SchAAmtBox">&nbsp;</div>
		</div>
		<xsl:if test="$LineNum &lt; $MaxLines">
			<xsl:call-template name="F8978BlankLines">
				<xsl:with-param name="LineNum" select="$LineNum + 1"/>
				<xsl:with-param name="MaxLines" select="$MaxLines"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
