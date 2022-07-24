<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 06/17/2020 -->
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  <!ENTITY mdash "&#8212;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl" />
	<xsl:include href="AddHeader.xsl" />
	<xsl:include href="CommonPathRef.xsl" />
	<xsl:include href="AddOnTable.xsl" />
	<xsl:include href="IRS990TScheduleAStyle.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS990TScheduleA" />
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
				<meta name="Description" content="IRS Form 990-T Schedule A" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<!--<xsl:if test="not($Print) or $Print=''">-->
						<xsl:call-template name="AddOnStyle" />
						<xsl:call-template name="IRS990TScheduleAStyle" />
					<!--</xsl:if>-->
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form990TScheduleA">
					<xsl:call-template name="DocumentHeader" />
					<!-- Page 1 -->
					<!-- Header -->
					<div class="styStdDiv">
						<div class="styFNBox" style="width:32mm;height:21.3mm;">
							<span class="styFN" style="font-size:11pt;">SCHEDULE A</span> <br />
							<span class="styFN" style="font-size:10pt;">(Form 990-T)</span>
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
						<div class="styFTBox" style="width:123mm;height:21.3mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:0.2mm;padding-bottom:0.5mm;">
								Unrelated Business Taxable Income <br />From an Unrelated Trade or Business
							</span><br /><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form990T</span>
								for instructions and the latest information.
							</span><br />
							<span style="font-weight:bold;font-family:Arial;">
								&#9658;Do not enter SSN numbers on this form as it may be made public if your organization is a 501(c)(3).
							</span>
						</div>
						<div class="styTYBox" style="width:32mm;height:21.3mm;">
							<div class="styOMB" style="height:auto;font-size:6pt;">OMB No. 1545-0047</div>
							<div class="styTY">20<span class="styTYColor">20</span></div>
							<div style="text-align:center;background-color:black;font-size:6pt;font-family:Arial;padding:0.5mm;padding-top:1mm;">
								<span class="styBoldText" style="color:white">Open to Public Inspection for 501(c)(3) Organizations Only</span>
							</div>
						</div>
					</div>
					<!-- Entity Information -->
					<div class="styStdDiv" style="font-size:7pt;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:120mm;height:10.5mm;padding:0.5mm;border-right:1px solid black;">
							<span style="font-weight:bold;width:4mm;">A</span>
							Name of the organization
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:67mm;height:10mm;padding:0.5mm;">
							<span style="font-weight:bold;width:4mm;">B</span> 
							<strong>Employer identification number</strong>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<div class="styStdDiv" style="font-size:7pt;border-top:1px solid black;">
						<div class="styGenericDiv" style="width:84mm;height:8mm;padding:0.5mm;border-right:1px solid black;">
							<br />
							<span style="font-weight:bold;width:4mm;">C</span>
							Unrelated business activity code (see instructions) &#9658; 
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/PrincipalBusinessActivityCd"/>
							</xsl:call-template>
						</div>
						<div class="styGenericDiv" style="width:103mm;height:8mm;padding:0.5mm;padding-right:0px;">
							<br />
							<span style="font-weight:bold;width:4mm;">D</span> 
							Sequence: 
							<span style="width:39.7mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SequenceReferenceNum"/>
								</xsl:call-template>
							</span>
							of 
							<span style="width:39.7mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SequenceTotalNum"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="padding:0.5mm;border-top:1px solid black;">
						<br />
						<span style="font-weight:bold;width:4mm;">E</span> 
						Describe the unrelated trade or business &#9658; 
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$FormData/TradeOrBusinessDesc"/>
						</xsl:call-template>
					</div>
					<!-- Column Headers -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styPartName" style="height:6mm;padding-top:1.5mm;">Part I</div>
						<div class="sty990TSchADesc" style="padding-top:1.5mm;padding-left:1.5mm;font-size:8pt;font-weight:bold;height:6mm;width:76mm;">Unrelated Trade or Business Income</div>
						<div class="sty990TSchARightNumBox" style="height:6mm;border-left-width:0px;border-bottom-width:0px;">&nbsp;</div>
						<div class="sty990TSchAAmtBox" style="height:6mm;padding-top:1.5mm;text-align:center;border-bottom-width:0px;">
							<strong>(A) Income</strong>
						</div>
						<div class="sty990TSchAAmtBox" style="height:6mm;padding-top:1.5mm;text-align:center;border-bottom-width:0px;">
							<strong>(B) Expenses</strong>
						</div>
						<div class="sty990TSchAAmtBox" style="height:6mm;padding-top:1.5mm;text-align:center;font-weight:bold;border-bottom-width:0px;">(C) Net</div>
					</div>
					<!-- Part 1, Line 1a -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="sty990TSchADesc" style="height:auto;">
							Gross receipts or sales &nbsp; 
							<span style="width:25mm;border-bottom:1px solid black;text-align:right;margin-left:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsOrSalesAmt"/>
								</xsl:call-template>
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsOrSalesAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty990TSchARightNumBoxNBB" style="height:4.7mm;">&nbsp;</div>
						<div class="sty990TSchAAmtBoxNBB" style="height:4.7mm;">&nbsp;</div>
						<div class="sty990TSchAAmtBoxNBB" style="height:4.7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBoxNBB" style="height:4.7mm;background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 1b 1c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty990TSchADesc">
							<span style="font-family:Arial;">Less returns and allowances</span> &nbsp; 
							<span style="width:25mm;border-bottom:1px solid black;text-align:right;margin-right:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ReturnsAndAllowancesAmt"/>
								</xsl:call-template>
							</span>
							<span style="width:3mm;font-weight:bold;">c</span>
							Balance &#9658;
						</div>
						<div class="sty990TSchARightNumBox">1c</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetGrossReceiptsOrSalesAmt"/>
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty990TSchADesc">
							Cost of goods sold (Part III, line 8)
							<span class="sty990TSchADotLn">.........</span>
						</div>
						<div class="sty990TSchARightNumBox">2</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSoldAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
					</div>
					<!-- Part 1, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty990TSchADesc">
							Gross profit. Subtract line 2 from line 1c
							<span class="sty990TSchADotLn">.......</span>
						</div>
						<div class="sty990TSchARightNumBox">3</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossProfitAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossProfitAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 4a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4a</div>
						<div class="sty990TSchADesc" style="height:7.5mm;">
							Capital gain net income (attach Sch D (Form 1041 or Form <br /> 1120)) (see instructions)
							<span class="sty990TSchADotLn">............</span>
						</div>
						<div class="sty990TSchARightNumBox" style="height:7.5mm;"><br />4a</div>
						<div class="sty990TSchAAmtBox" style="height:7.5mm;"><br />
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt" />
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="height:7.5mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 4b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty990TSchADesc" style="">
							Net gain (loss) (Form 4797) (attach Form 4797) <span style="font-family:Arial;">(see instructions)</span>
						</div>
						<div class="sty990TSchARightNumBox">4b</div>
						<div class="sty990TSchAAmtBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt" />
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 4c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="sty990TSchADesc" style="">
							Capital loss deduction for trusts
						</div>
						<div class="sty990TSchARightNumBox">4c</div>
						<div class="sty990TSchAAmtBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalLossLimitationAmt" />
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalLossLimitationAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalLossLimitationAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty990TSchADesc" style="height:7mm;">
							Income (loss) from a partnership or an S corporation (attach statement) 
							<span class="sty990TSchADotLn">................</span>
						</div>
						<div class="sty990TSchARightNumBox" style="height:7mm;"><br />5</div>
						<div class="sty990TSchAAmtBox" style="height:7mm;"><br />
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalPrtshpSCorpIncomeAmt" />
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPrtshpSCorpIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="height:7mm;background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalPrtshpSCorpIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty990TSchADesc">
							Rent income (Part IV) 
							<span class="sty990TSchADotLn">.............</span>
						</div>
						<div class="sty990TSchARightNumBox">6</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalRentIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalRentDeductionsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetRentIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty990TSchADesc">
							Unrelated debt-financed income (Part V) 
							<span class="sty990TSchADotLn">.......</span>
						</div>
						<div class="sty990TSchARightNumBox">7</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGrossDebtFinancedIncmAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAllocableDeductionsAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetUnrelatedDebtFincdIncmAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty990TSchADesc" style="height:7.5mm;">
							Interest, annuities, royalties, and rents from a controlled <br /> organization (Part VI)
							<span class="sty990TSchADotLn">.............</span>
						</div>
						<div class="sty990TSchARightNumBox" style="height:7.5mm;"><br />8</div>
						<div class="sty990TSchAAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCtrlOrgPymtGrossIncmAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCtrlOrgDeductionAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="height:7.5mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetCtrlOrgIntAnntsRyltsRntsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty990TSchADesc" style="height:7mm;">
							Investment income of section 501(c)(7), (9), or (17) <br /> organizations (Part VII)
							<span class="sty990TSchADotLn">............</span>
						</div>
						<div class="sty990TSchARightNumBox" style="height:7mm;"><br />9</div>
						<div class="sty990TSchAAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalInvestmentIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionSetAsidesAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetInvestmentIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="sty990TSchADesc">
							Exploited exempt activity income (Part VIII)
							<span class="sty990TSchADotLn">......</span>
						</div>
						<div class="sty990TSchARightNumBox">10</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExploitedExemptActivityIncmAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExploitedExpnssCnnctUBIAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetExploitedActivityIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty990TSchADesc">
							Advertising income (Part IX)
							<span class="sty990TSchADotLn">...........</span>
						</div>
						<div class="sty990TSchARightNumBox">11</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGrossAdvertisingIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDirectAdvertisingCostAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAdvertisingIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty990TSchADesc">
							Other income (see instructions; attach statement)
							<span class="sty990TSchADotLn">....</span>
						</div>
						<div class="sty990TSchARightNumBox">12</div>
						<div class="sty990TSchAAmtBox">
							<span style="float:left;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt" />
								</xsl:call-template>
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBox" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 1, Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="sty990TSchADesc">
							<strong>Total.</strong> Combine lines 3 through 12
							<span class="sty990TSchADotLn">.........</span>
						</div>
						<div class="sty990TSchARightNumBoxNBB">13</div>
						<div class="sty990TSchAAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotUnrltTrdBusIncmAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotUnrltTrdBusIncmExpnssAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchAAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotNetUnrltTrdBusIncmAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="height:8mm;">Part II</div>
						<div class="styPartDesc" style="height:8mm;padding-top:0.5mm;">
							Deductions Not Taken Elsewhere 
							<span style="font-weight:normal;display:inline;">
								(See instructions for limitations on deductions) Deductions must be directly 
								connected with the unrelated business income
							</span>
						</div>
					</div>
					<!-- Part 2, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty990TSchALongDesc">
							Compensation of officers, directors, and trustees (Part X)
							<span class="sty990TSchADotLn">.................</span>
						</div>
						<div class="sty990TSchARightNumBox">1</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUnrelatedBusinessCompAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty990TSchALongDesc">
							Salaries and wages
							<span class="sty990TSchADotLn">............................</span>
						</div>
						<div class="sty990TSchARightNumBox">2</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SalariesAndWagesAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty990TSchALongDesc">
							Repairs and maintenance
							<span class="sty990TSchADotLn">..........................</span>
						</div>
						<div class="sty990TSchARightNumBox">3</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RepairsAndMaintenanceAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="sty990TSchALongDesc">
							Bad debts
							<span class="sty990TSchADotLn">...............................</span>
						</div>
						<div class="sty990TSchARightNumBox">4</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BadDebtExpenseAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty990TSchALongDesc">
							Interest (attach statement) (see instructions)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/InterestDeductionAmt" />
							</xsl:call-template>
							<span class="sty990TSchADotLn">...................</span>
						</div>
						<div class="sty990TSchARightNumBox">5</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/InterestDeductionAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty990TSchALongDesc">
							Taxes and licenses
							<span class="sty990TSchADotLn">.............................</span>
						</div>
						<div class="sty990TSchARightNumBox">6</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxesAndLicensesAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty990TSchADesc" style="width:105mm;">
							Depreciation (attach Form 4562) (see instructions) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDepreciationAmt"/>
							</xsl:call-template>
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.........</span>
						</div>
						<div class="sty990TSchARightNumBox" style="">7</div>
						<div class="sty990TSchAAmtBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDepreciationAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchARightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="sty990TSchAAmtBoxNBB">&nbsp;</div>
					</div>
					<!-- Part 2, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty990TSchADesc" style="width:105mm;">
							Less depreciation claimed in Part III and elsewhere on return
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/DepreciationNetAmt"/>
							</xsl:call-template>
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.....</span>
						</div>
						<div class="sty990TSchARightNumBox" style="">8a</div>
						<div class="sty990TSchAAmtBox" style="">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DepreciationClmElsewhereAmt" />
							</xsl:call-template>
						</div>
						<div class="sty990TSchARightNumBox">8b</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DepreciationNetAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty990TSchALongDesc">
							Depletion
							<span class="sty990TSchADotLn">...............................</span>
						</div>
						<div class="sty990TSchARightNumBox">9</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DepletionAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="sty990TSchALongDesc">
							Contributions to deferred compensation plans
							<span class="sty990TSchADotLn">.....................</span>
						</div>
						<div class="sty990TSchARightNumBox">10</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeferredCompensationPlanAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty990TSchALongDesc">
							Employee benefit programs
							<span class="sty990TSchADotLn">..........................</span>
						</div>
						<div class="sty990TSchARightNumBox">11</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EmployeeBenefitProgramAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty990TSchALongDesc">
							Excess exempt expenses (Part VIII)
							<span class="sty990TSchADotLn">.......................</span>
						</div>
						<div class="sty990TSchARightNumBox">12</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExploitedExcessExemptExpnssAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="sty990TSchALongDesc">
							Excess readership costs (Part IX)
							<span class="sty990TSchADotLn">........................</span>
						</div>
						<div class="sty990TSchARightNumBox">13</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotExcessReadershipCostsDedAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="sty990TSchALongDesc">
							Other deductions (attach statement) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt" />
							</xsl:call-template>
							<span class="sty990TSchADotLn">......................</span>
						</div>
						<div class="sty990TSchARightNumBox">14</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="sty990TSchALongDesc">
							<strong>Total deductions. </strong> Add lines 1 through 14
							<span class="sty990TSchADotLn">.....................</span>
						</div>
						<div class="sty990TSchARightNumBox">15</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="sty990TSchALongDesc">
							Unrelated business income before net operating loss deduction. Subtract line 15 from Part I, line 13, column (C)
						</div>
						<div class="sty990TSchARightNumBox">16</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UBIBeforeNOLDedAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="sty990TSchALongDesc">
							Deduction for net operating loss (see instructions)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt" />
							</xsl:call-template>
							<span class="sty990TSchADotLn">..................</span>
						</div>
						<div class="sty990TSchARightNumBox">17</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2, Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="sty990TSchALongDesc">
							<strong>Unrelated business taxable income. </strong> Subtract line 17 from line 16
							<span class="sty990TSchADotLn">.............</span>
						</div>
						<div class="sty990TSchARightNumBoxNBB">18</div>
						<div class="sty990TSchAAmtBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnrelatedBusinessTaxblIncmAmt" />
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see instructions.</span>
						<span style="margin-left:20mm;">Cat. No. 74036O</span>
						<span style="float:right;font-weight:bold;">Schedule A (Form 990-T) 2020</span>
					</div>
					<div class="styStdDiv">
						Schedule A (Form 990-T) 2020
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></span>
					</div>
					<!-- Part 3 -->
					<div class="styStdDiv" style="border-top:2px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc" style="height:auto;">
							<span style="float:left;">
								Cost of Goods Sold 
							</span>
							<span style="float:left;font-weight:normal;margin-left:10mm;width:128mm;">
								Enter method of inventory valuation &#9658;
								<xsl:choose>
									<xsl:when test="$FormData/OthInventoryValuationMethodCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/OthInventoryValuationMethodCd" />
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/OthInventoryValuationMethodCd/@othInvntryValuationMethodDesc" />
											<xsl:with-param name="Desc">Part III Header - Other Inventory Valuation Method Description</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/InventoryValuationMethodCd" />
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Part 3, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty990TSchALongDesc">
							Inventory at beginning of year
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/BeginningOfYearInventoryAmt" />
							</xsl:call-template>
							<span class="sty990TSchADotLn">........................</span>
						</div>
						<div class="sty990TSchARightNumBox">1</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BeginningOfYearInventoryAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty990TSchALongDesc">
							Purchases
							<span class="sty990TSchADotLn">...............................</span>
						</div>
						<div class="sty990TSchARightNumBox">2</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PurchasesAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty990TSchALongDesc">
							Cost of labor
							<span class="sty990TSchADotLn">..............................</span>
						</div>
						<div class="sty990TSchARightNumBox">3</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CostOfLaborAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="sty990TSchALongDesc">
							Additional section 263A costs (attach statement) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalSection263ACostsAmt" />
							</xsl:call-template>
							<span class="sty990TSchADotLn">..................</span>
						</div>
						<div class="sty990TSchARightNumBox">4</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdditionalSection263ACostsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty990TSchALongDesc">
							Other costs (attach statement) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherCostsAmt" />
							</xsl:call-template>
							<span class="sty990TSchADotLn">........................</span>
						</div>
						<div class="sty990TSchARightNumBox">5</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherCostsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty990TSchALongDesc">
							<strong>Total. </strong> Add lines 1 through 5
							<span class="sty990TSchADotLn">..........................</span>
						</div>
						<div class="sty990TSchARightNumBox">6</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCostGoodsSoldAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty990TSchALongDesc">
							Inventory at end of year
							<span class="sty990TSchADotLn">...........................</span>
						</div>
						<div class="sty990TSchARightNumBox">7</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EndOfYearInventoryAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty990TSchALongDesc">
							<strong>Cost of goods sold. </strong> Subtract line 7 from line 6. Enter here and in Part I, line 2
							<span class="sty990TSchADotLn">..........</span>
						</div>
						<div class="sty990TSchARightNumBox">8</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CostOfGoodsSoldAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 3, Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty990TSchALongDesc" style="width:149mm;">
							Do the rules of section 263A (with respect to property produced or acquired for resale) apply to the organization?
						</div>
						<div class="styGenericDiv" style="width:30mm;">
							<input type="checkbox" style="stCkboxNM" alt="Section 263A Rules Apply Yes">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section263ARulesApplyInd" />
									<xsl:with-param name="BackupName">IRS990TSchASection263ARulesApplyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="font-weight:bold;font-size:8pt;padding-left:3px;margin-right:5mm;">Yes</span>
							<input type="checkbox" style="stCkboxNM" alt="Section 263A Rules Apply No">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/Section263ARulesApplyInd" />
									<xsl:with-param name="BackupName">IRS990TSchASection263ARulesApplyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="font-weight:bold;font-size:8pt;padding-left:3px;">No</span>
						</div>
					</div>
					<!-- Part 4 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Rent Income (From Real Property and Personal Property Leased with Real Property)</div>
					</div>
					<!-- Line 1 -->
					<xsl:variable name="part4Count" select="count($FormData/RentIncomePropertyGrp)"/>
					<xsl:variable name="shouldSepPart4" select="($Print = $Separated) and ($part4Count &gt; 4)"/>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty990TSchADesc" style="width:178mm;">
							Description of property (property street address, city, state, ZIP code). Check if a dual-use (see instructions)
						</div>
					</div>
					<xsl:if test="not($shouldSepPart4)">
						<xsl:for-each select="$FormData/RentIncomePropertyGrp">
							<xsl:variable name="pos" select="position()"/>
							<div class="styStdDiv" style="padding-left:8mm;">
								<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;"><xsl:number value="$pos" format="A"/></div>
								<span class="styGenericDiv" style="width:4mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="DualUseInd"/>
											<xsl:with-param name="BackupName">IRS990TRentIncomePropertyGrpDualUseInd<xsl:value-of select="$pos"/></xsl:with-param>
										</xsl:call-template>
										<xsl:attribute name="alt">Line <xsl:number format="A" value="$pos"/> Dual Use</xsl:attribute>
									</input>
								</span>
								<div class="styLNDesc" style="width:172mm;height:auto;min-height:4mm;border-bottom:1px solid black;">
									<xsl:choose>
										<xsl:when test="ForeignAddress">
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="ForeignAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="USAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart4 or ($part4Count &lt; 1)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">A</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Property A dual-use" id="IRS990TSchAP4LADU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">
								&nbsp;
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSepPart4 or ($part4Count &lt; 2)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">B</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Property B dual-use" id="IRS990TSchAP4LBDU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSepPart4 or ($part4Count &lt; 3)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">C</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Property C dual-use" id="IRS990TSchAP4LCDU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSepPart4 or ($part4Count &lt; 4)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">D</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Property D dual-use" id="IRS990TSchAP4LDDU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="not($shouldSepPart4)">
						<xsl:for-each select="$FormData/RentIncomePropertyGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<!-- Column Headers -->
								<div class="styStdDiv" style="">
									<div class="styLNLeftNumBox" style="">&nbsp;</div>
									<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos" format="A"/>	</div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos + 1" format="A"/></div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos + 2" format="A"/></div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos + 3" format="A"/></div>
								</div>
								<!-- Part 4, Line 2 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">2</div>
									<div class="sty990TSchAShortDesc">Rent received or accrued</div>
									<div class="sty990TSchAShortAmtBoxNBB">&nbsp;</div>
									<div class="sty990TSchAShortAmtBoxNBB">&nbsp;</div>
									<div class="sty990TSchAShortAmtBoxNBB">&nbsp;</div>
									<div class="sty990TSchAShortAmtBoxNBB">&nbsp;</div>
								</div>
								<!-- Part 4, Line 2a -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										From personal property (if the percentage of rent for personal property is more than 10% but not more than 50%)
										<span class="sty990TSchADotLn">......</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="RentPersonalPropertyAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/RentPersonalPropertyAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/RentPersonalPropertyAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/RentPersonalPropertyAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 4, Line 2b -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										From real and personal property (if the percentage of rent for personal property exceeds 50% or if the rent is based on profit or income)
										<span class="sty990TSchADotLn">..........</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:13mm;"><br /><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="RentRealPersonalPropertyAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:13mm;"><br /><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/RentRealPersonalPropertyAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:13mm;"><br /><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/RentRealPersonalPropertyAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:13mm;"><br /><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/RentRealPersonalPropertyAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 4, Line 2c -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Total rents received or accrued by property. Add lines 2a and 2b, columns A through D
										<span class="sty990TSchADotLn">.</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalRentsByPropertyAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/TotalRentsByPropertyAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/TotalRentsByPropertyAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/TotalRentsByPropertyAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart4 or ($part4Count &lt; 1)">
						<!-- Column Headers -->
						<div class="styStdDiv" style="">
							<div class="styLNLeftNumBox" style="">&nbsp;</div>
							<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;">A</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;">B</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;">C</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;">D</div>
						</div>
						<!-- Part 4, Line 2 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="sty990TSchAShortDesc">Rent received or accrued</div>
							<div class="sty990TSchAShortAmtBoxNBB">&nbsp;</div>
							<div class="sty990TSchAShortAmtBoxNBB">&nbsp;</div>
							<div class="sty990TSchAShortAmtBoxNBB">&nbsp;</div>
							<div class="sty990TSchAShortAmtBoxNBB">&nbsp;</div>
						</div>
						<!-- Part 4, Line 2a -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								From personal property (if the percentage of rent for personal property is more than 10% but not more than 50%)
								<span class="sty990TSchADotLn">......</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:10mm;"><br /><br />
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp"/>
									<xsl:with-param name="ShortMessage" select="true()"/>
								</xsl:call-template>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:10mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10mm;">&nbsp;</div>
						</div>
						<!-- Part 4, Line 2b -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								From real and personal property (if the percentage of rent for personal property exceeds 50% or if the rent is based on profit or income)
								<span class="sty990TSchADotLn">..........</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:13mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:13mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:13mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:13mm;">&nbsp;</div>
						</div>
						<!-- Part 4, Line 2c -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Total rents received or accrued by property. Add lines 2a and 2b, columns A through D
								<span class="sty990TSchADotLn">.</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 4, Line 3 -->
					<div class="styStdDiv" style="padding-top:2mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty990TSchALongDesc" style="width:149mm;">
							Total rents received or accrued. Add line 2c columns A through D. Enter here and on Part I, line 6, column (A)
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.&#9658;</span>
						</div>
						<div class="sty990TSchAAmtBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalRentIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:if test="not($shouldSepPart4)">
						<xsl:for-each select="$FormData/RentIncomePropertyGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="$pos mod 4 = 1">
								<xsl:if test="$part4Count &gt; 4">
									<!-- Column Headers -->
									<div class="styStdDiv" style="">
										<div class="styLNLeftNumBox" style="">&nbsp;</div>
										<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos" format="A"/>	</div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos + 1" format="A"/></div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos + 2" format="A"/></div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos + 3" format="A"/></div>
									</div>
								</xsl:if>
								<!-- Part 4, Line 4 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">4</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Deductions directly connected with the income in lines 2(a) and 2(b) (attach statement)
										<span class="sty990TSchADotLn">.</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7.2mm;border-top-width:1px;"><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="DeductionsConnectedRentIncmAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="DeductionsConnectedRentIncmAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7.2mm;border-top-width:1px;"><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/DeductionsConnectedRentIncmAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/DeductionsConnectedRentIncmAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7.2mm;border-top-width:1px;"><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/DeductionsConnectedRentIncmAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/DeductionsConnectedRentIncmAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7.2mm;border-top-width:1px;"><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/DeductionsConnectedRentIncmAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/DeductionsConnectedRentIncmAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart4 or ($part4Count &lt; 1)">
						<!-- Part 4, Line 4 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Deductions directly connected with the income in lines 2(a) and 2(b) (attach statement)
								<span class="sty990TSchADotLn">.</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:7.2mm;border-top-width:1px;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7.2mm;border-top-width:1px;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7.2mm;border-top-width:1px;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7.2mm;border-top-width:1px;">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 4, Line 5 -->
					<div class="styStdDiv" style="padding-top:2mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty990TSchALongDesc" style="width:149mm;">
							<strong>Total deductions.</strong> 
							Add line 4 columns A through D. Enter here and on Part I, line 6, column (B)
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.....&#9658;</span>
						</div>
						<div class="sty990TSchAAmtBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalRentDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 5 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc">Unrelated Debt-Financed Income <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Part 5, Line 1 -->
					<xsl:variable name="part5Count" select="count($FormData/UnrelatedDebtFinancedPropGrp)"/>
					<xsl:variable name="shouldSepPart5" select="($Print = $Separated) and ($part5Count &gt; 4)"/>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty990TSchADesc" style="width:178mm;">
							Description of debt-financed property (street address, city, state, ZIP code). Check if a dual-use (see instructions)
						</div>
					</div>
					<xsl:if test="not($shouldSepPart5)">
						<xsl:for-each select="$FormData/UnrelatedDebtFinancedPropGrp">
							<xsl:variable name="pos" select="position()"/>
							<div class="styStdDiv" style="padding-left:8mm;">
								<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;"><xsl:number value="$pos" format="A"/></div>
								<span class="styGenericDiv" style="width:4mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="DualUseInd"/>
											<xsl:with-param name="BackupName">IRS990TUnrelatedDebtFinancedPropGrpDualUseInd<xsl:value-of select="$pos"/></xsl:with-param>
										</xsl:call-template>
										<xsl:attribute name="alt">Line <xsl:number format="A" value="$pos"/> Dual Use</xsl:attribute>
									</input>
								</span>
								<div class="styLNDesc" style="width:172mm;height:auto;min-height:4mm;border-bottom:1px solid black;">
									<xsl:choose>
										<xsl:when test="ForeignAddress">
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="ForeignAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="USAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart5 or ($part5Count &lt; 1)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">A</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Property A dual-use" id="IRS990TSchAP5LADU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp"/>
								</xsl:call-template>
								&nbsp;
							</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSepPart5 or ($part5Count &lt; 2)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">B</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Property B dual-use" id="IRS990TSchAP5LBDU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSepPart5 or ($part5Count &lt; 3)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">C</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Property C dual-use" id="IRS990TSchAP5LCDU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSepPart5 or ($part5Count &lt; 4)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">D</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Property D dual-use" id="IRS990TSchAP5LDDU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="not($shouldSepPart5)">
						<xsl:for-each select="$FormData/UnrelatedDebtFinancedPropGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<!-- Column Headers -->
								<div class="styStdDiv" style="">
									<div class="styLNLeftNumBox" style="">&nbsp;</div>
									<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos" format="A"/>	</div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos + 1" format="A"/></div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos + 2" format="A"/></div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos + 3" format="A"/></div>
								</div>
								<!-- Part 5, Line 2 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">2</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Gross income from or allocable to debt-financed property
										<span class="sty990TSchADotLn">........</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/GrossIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/GrossIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/GrossIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 5, Line 3 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">3</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Deductions directly connected with or allocable to debt-financed property
									</div>
									<div class="sty990TSchAShortAmtBoxNBB" style="height:7mm;">&nbsp;</div>
									<div class="sty990TSchAShortAmtBoxNBB" style="height:7mm;">&nbsp;</div>
									<div class="sty990TSchAShortAmtBoxNBB" style="height:7mm;">&nbsp;</div>
									<div class="sty990TSchAShortAmtBoxNBB" style="height:7mm;">&nbsp;</div>
								</div>
								<!-- Part 5, Line 3a -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Straight line depreciation (attach statement)
									</div>
									<div class="sty990TSchAShortAmtBox">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="StraightLineDepreciationDedAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="StraightLineDepreciationDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/StraightLineDepreciationDedAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/StraightLineDepreciationDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/StraightLineDepreciationDedAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/StraightLineDepreciationDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/StraightLineDepreciationDedAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/StraightLineDepreciationDedAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 5, Line 3b -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Other deductions (attach statement)
										<span class="sty990TSchADotLn">...</span>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="OtherDebtFinancedDeductionAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherDebtFinancedDeductionAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/OtherDebtFinancedDeductionAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/OtherDebtFinancedDeductionAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/OtherDebtFinancedDeductionAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/OtherDebtFinancedDeductionAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/OtherDebtFinancedDeductionAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/OtherDebtFinancedDeductionAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 5, Line 3c -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Total deductions (add lines 3a and 3b, columns A through D)
										<span class="sty990TSchADotLn">..........</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="TotalDebtFinancedDeductionAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/TotalDebtFinancedDeductionAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/TotalDebtFinancedDeductionAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/TotalDebtFinancedDeductionAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 5, Line 4 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">4</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Amount of average acquisition debt on or allocable to debt-financed property (attach statement)
										<span class="sty990TSchADotLn">...........</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="AverageAcquisitionDebtAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AverageAcquisitionDebtAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAcquisitionDebtAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAcquisitionDebtAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAcquisitionDebtAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAcquisitionDebtAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAcquisitionDebtAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAcquisitionDebtAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 5, Line 5 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">5</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Average adjusted basis of or allocable to debt-financed property (attach statement)
										<span class="sty990TSchADotLn">...</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="AverageAdjustedBasisAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AverageAdjustedBasisAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAdjustedBasisAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAdjustedBasisAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAdjustedBasisAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAdjustedBasisAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:7mm;"><br />
										<span style="float:left;">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAdjustedBasisAmt"/>
											</xsl:call-template>
										</span>
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAdjustedBasisAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 5, Line 6 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">6</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Divide line 4 by line 5
										<span class="sty990TSchADotLn">.......</span>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="AverageAcquisitionAdjBasisPct"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAcquisitionAdjBasisPct"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAcquisitionAdjBasisPct"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulatePercent">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAcquisitionAdjBasisPct"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 5, Line 7 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">7</div>
									<div class="sty990TSchAShortDesc" style="height:auto;font-family:Arial;padding-top:2px;">
										Gross income reportable. Multiply line 2 by line 6
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossIncomeReportableAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/GrossIncomeReportableAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/GrossIncomeReportableAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/GrossIncomeReportableAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart5 or ($part5Count &lt; 1)">
						<!-- Column Headers -->
						<div class="styStdDiv" style="">
							<div class="styLNLeftNumBox" style="">&nbsp;</div>
							<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;">A</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;">B</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;">C</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;">D</div>
						</div>
						<!-- Part 5, Line 2 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Gross income from or allocable to debt-financed property
								<span class="sty990TSchADotLn">........</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp"/>
									<xsl:with-param name="ShortMessage" select="true()"/>
								</xsl:call-template>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
						</div>
						<!-- Part 5, Line 3 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Deductions directly connected with or allocable to debt-financed property
							</div>
							<div class="sty990TSchAShortAmtBoxNBB" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBoxNBB" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBoxNBB" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBoxNBB" style="height:7mm;">&nbsp;</div>
						</div>
						<!-- Part 5, Line 3a -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">a</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Straight line depreciation (attach statement)
							</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
						</div>
						<!-- Part 5, Line 3b -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Other deductions (attach statement)
								<span class="sty990TSchADotLn">...</span>
							</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
						</div>
						<!-- Part 5, Line 3c -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Total deductions (add lines 3a and 3b, columns A through D)
								<span class="sty990TSchADotLn">..........</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
						</div>
						<!-- Part 5, Line 4 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Amount of average acquisition debt on or allocable to debt-financed property (attach statement)
								<span class="sty990TSchADotLn">...........</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
						</div>
						<!-- Part 5, Line 5 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Average adjusted basis of or allocable to debt-financed property (attach statement)
								<span class="sty990TSchADotLn">...</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:7mm;">&nbsp;</div>
						</div>
						<!-- Part 5, Line 6 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Divide line 4 by line 5
								<span class="sty990TSchADotLn">.......</span>
							</div>
							<div class="sty990TSchAShortAmtBox">%</div>
							<div class="sty990TSchAShortAmtBox">%</div>
							<div class="sty990TSchAShortAmtBox">%</div>
							<div class="sty990TSchAShortAmtBox">%</div>
						</div>
						<!-- Part 5, Line 7 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="sty990TSchAShortDesc" style="height:auto;font-family:Arial;padding-top:2px;">
								Gross income reportable. Multiply line 2 by line 6
							</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 5, Line 8 -->
					<div class="styStdDiv" style="padding-top:2mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty990TSchALongDesc" style="width:149mm;">
							<strong>Total gross income </strong> (add line 7, columns A through D). Enter here and on Part I, line 7, column (A)
							<span class="sty990TSchADotLn" style="margin-right:-4px;">....&#9658;</span>
						</div>
						<div class="sty990TSchAAmtBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGrossDebtFinancedIncmAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:if test="not($shouldSepPart5)">
						<xsl:for-each select="$FormData/UnrelatedDebtFinancedPropGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="$pos mod 4 = 1">
								<xsl:if test="$part5Count &gt; 4">
									<!-- Column Headers -->
									<div class="styStdDiv" style="">
										<div class="styLNLeftNumBox" style="">&nbsp;</div>
										<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos" format="A"/>	</div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos + 1" format="A"/></div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos + 2" format="A"/></div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;"><xsl:number value="$pos + 3" format="A"/></div>
									</div>
								</xsl:if>
								<!-- Part 5, Line 9 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">9</div>
									<div class="sty990TSchAShortDesc">
										Allocable deductions. Multiply line 3c by line 6
									</div>
									<div class="sty990TSchAShortAmtBox" style="border-top-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AllocableDeductionAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="border-top-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AllocableDeductionAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="border-top-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AllocableDeductionAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="border-top-width:1px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AllocableDeductionAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart5 or ($part5Count &lt; 1)">
						<!-- Part 5, Line 9 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Allocable deductions. Multiply line 3c by line 6
							</div>
							<div class="sty990TSchAShortAmtBox" style="border-top-width:1px;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="border-top-width:1px;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="border-top-width:1px;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="border-top-width:1px;">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 5, Line 10 -->
					<div class="styStdDiv" style="padding-top:2mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBox">10</div>
						<div class="sty990TSchALongDesc" style="width:149mm;">
							<strong>Total allocable deductions.</strong> 
							Add line 9, columns A through D. Enter here and on Part I, line 7, column (B)
							<span class="sty990TSchADotLn" style="margin-right:-4px;">..&#9658;</span>
						</div>
						<div class="sty990TSchAAmtBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAllocableDeductionsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 5, Line 11 -->
					<div class="styStdDiv" style="padding-bottom:0.5mm;">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty990TSchALongDesc" style="width:149mm;">
							<strong>Total dividends-received deductions </strong> included in line 10
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.................&#9658;</span>
						</div>
						<div class="sty990TSchAAmtBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDividendsReceivedDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;font-weight:bold;">Schedule A (Form 990-T) 2020</span>
					</div>
					<div class="styStdDiv">
						Schedule A (Form 990-T) 2020
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span></span>
					</div>
					<!-- Part 6 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styPartName">Part VI</div>
						<div class="styPartDesc">Interest, Annuities, Royalties, and Rents from Controlled Organizations <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<!-- Part 6, Table 1 -->
					<xsl:variable name="part6Count" select="count($FormData/IntAnntsRyltsRentCtrlOrgGrp)"/>
					<xsl:variable name="shouldSepPart6" select="($Print = $Separated) and ($part6Count &gt; 4)"/>
					<div class="sty990TSchADepdContainer">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="min-width:48mm;width:58mm;font-weight:normal;" rowspan="2" scope="col">
										<strong>1. </strong> Name of controlled organization
									</th>
									<th class="styTableCellHeader" style="width:17mm;font-weight:normal;" rowspan="2" scope="col">
										<strong>2. </strong> Employer identification number
									</th>
									<th class="styTableCellHeader" style="width:112mm;font-weight:normal;border-right-width:0px;" rowspan="1" colspan="4" scope="colgroup">
										Exempt Controlled Organizations
									</th>
								</tr>
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" style="width:28mm;font-weight:normal;" scope="col">
										<strong>3. </strong> Net unrelated income (loss) <br /> (see instructions)
									</th>
									<th class="styTableCellHeader" style="width:28mm;font-weight:normal;" scope="col">
										<strong>4. </strong> Total of specified payments made
									</th>
									<th class="styTableCellHeader" style="width:28mm;font-weight:normal;" scope="col">
										<strong>5. </strong> Part of column 4 that is included <br /> in the controlling organization's <br /> gross income
									</th>
									<th class="styTableCellHeader" style="width:28mm;border-right-width:0px;font-weight:normal;" scope="col">
										<strong>6. </strong> Deductions directly connected with income in column 5
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepPart6)">
									<xsl:for-each select="$FormData/IntAnntsRyltsRentCtrlOrgGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<span style="width:6mm;font-weight:bold;float:left;">(<xsl:number value="position()"/>)</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="BusinessName/BusinessNameLine2Txt">
													<br />
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</td>
											<td class="styTableCellCtrInherit">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="EIN" />
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExmptCtrlOrgNetUnrltIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExmptCtrlOrgTotSpcfdPymtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExmptCtrlOrgPymtGrossIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExmptCtrlOrgDeductionAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSepPart6 or ($part6Count &lt; 1)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(1)</span>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/IntAnntsRyltsRentCtrlOrgGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart6 or ($part6Count &lt; 2)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(2)</span>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart6 or ($part6Count &lt; 3)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(3)</span>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart6 or ($part6Count &lt; 4)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(4)</span>
										</td>
										<td class="styTableCellCtrInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 6, Table 2 -->
					<div class="sty990TSchADepdContainer">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr>
									<th class="styTableCellHeader" style="width:187mm;font-weight:normal;border-right-width:0px;" rowspan="1" colspan="5" scope="colgroup">
										Nonexempt Controlled Organizations
									</th>
								</tr>
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" style="min-width:34mm;width:43mm;font-weight:normal;" scope="col">
										<strong>7. </strong> Taxable income
									</th>
									<th class="styTableCellHeader" style="width:36mm;font-weight:normal;" scope="col">
										<strong>8. </strong> Net unrelated <br /> income (loss) <br />  (see instructions)
									</th>
									<th class="styTableCellHeader" style="width:36mm;font-weight:normal;" scope="col">
										<strong>9. </strong> Total of specified payments made
									</th>
									<th class="styTableCellHeader" style="width:36mm;font-weight:normal;" scope="col">
										<strong>10. </strong> Part of column 9 <br /> that is included in the <br /> controlling organization's <br /> gross income
									</th>
									<th class="styTableCellHeader" style="width:36mm;border-right-width:0px;font-weight:normal;" scope="col">
										<strong>11. </strong> Deductions directly connected with <br /> income in column 10
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepPart6)">
									<xsl:for-each select="$FormData/IntAnntsRyltsRentCtrlOrgGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellAmtInherit">
												<span style="width:6mm;font-weight:bold;float:left;">(<xsl:number value="position()"/>)</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgTaxableIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgNetUnrltIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgTotSpcfdPymtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgPymtGrossIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgDeductionAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSepPart6 or ($part6Count &lt; 1)">
									<tr>
										<td class="styTableCellAmtInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(1)</span>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/IntAnntsRyltsRentCtrlOrgGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart6 or ($part6Count &lt; 2)">
									<tr>
										<td class="styTableCellAmtInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(2)</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart6 or ($part6Count &lt; 3)">
									<tr>
										<td class="styTableCellAmtInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(3)</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart6 or ($part6Count &lt; 4)">
									<tr>
										<td class="styTableCellAmtInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(4)</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 6, Totals -->
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:114.8mm;">&nbsp;</div>
						<div class="styLNDesc" style="height:auto;width:36mm;text-align:center;border-left:1px solid black;">
							Add columns 5 and 10. <br /> Enter here and on Part I, <br /> line 8, column (A)
						</div>
						<div class="styLNDesc" style="height:auto;width:36mm;text-align:center;border-left:1px solid black;">
							Add columns 6 and 11. <br /> Enter here and on Part I, <br /> line 8, column (B)
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:114.8mm;">
							<strong>Totals</strong>
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.........................&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:36mm;padding-right:0.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCtrlOrgPymtGrossIncmAmt" />
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:36mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalCtrlOrgDeductionAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 7 -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styPartName">Part VII</div>
						<div class="styPartDesc">Investment Income of a Section 501(c)(7), (9), or (17) Organization <span style="font-weight:normal;">(see instructions)</span></div>
					</div>
					<xsl:variable name="part7Count" select="count($FormData/InvestmentIncmSect501c7917Grp)"/>
					<xsl:variable name="shouldSepPart7" select="($Print = $Separated) and ($part7Count &gt; 4)"/>
					<!-- Part 7 Table -->
					<div class="sty990TSchADepdContainer">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" style="min-width:45mm;width:55mm;font-weight:normal;" scope="col">
										<strong>1. </strong> Description of income
									</th>
									<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
										<strong>2. </strong> Amount of income
									</th>
									<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
										<strong>3. </strong> Deductions directly connected <br /> (attach statement)
									</th>
									<th class="styTableCellHeader" style="width:33mm;font-weight:normal;" scope="col">
										<strong>4. </strong> Set-asides <br /> (attach statement)
									</th>
									<th class="styTableCellHeader" style="width:33mm;border-right-width:0px;font-weight:normal;" scope="col">
										<strong>5. Total deductions and set-asides</strong> <br /> (add columns 3 and 4)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepPart7)">
									<xsl:for-each select="$FormData/InvestmentIncmSect501c7917Grp">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<span style="width:6mm;font-weight:bold;float:left;">(<xsl:number value="position()"/>)</span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="IncomeTypeDesc"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InvestmentIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="InvestmentIncomeDeductionAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InvestmentIncomeDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="InvestmentIncomeSetAsidesAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="InvestmentIncomeSetAsidesAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeductionSetAsidesAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSepPart7 or ($part7Count &lt; 1)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(1)</span>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/InvestmentIncmSect501c7917Grp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart7 or ($part7Count &lt; 2)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(2)</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart7 or ($part7Count &lt; 3)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(3)</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart7 or ($part7Count &lt; 4)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(4)</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 7, Totals -->
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:54.9mm;height:auto;">
							<br /><br /><br />
							<strong>Totals</strong>
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.........&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:33mm;height:auto;padding-right:0.5mm;">
							<span style="width:100%;text-align:center;font-family:Arial;">
								Add amounts in column 2. <br /> Enter here and on Part I, <br /> line 9, column (A)
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalInvestmentIncomeAmt" />
							</xsl:call-template>
						</div>
						<div class="styLNAmountBoxNBB" style="width:33mm;height:auto;background-color:lightgrey;"><br /><br /><br />&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:33mm;height:auto;background-color:lightgrey;"><br /><br /><br />&nbsp;</div>
						<div class="styLNAmountBoxNBB" style="width:33mm;height:auto;">
							<span style="width:100%;text-align:center;font-family:Arial;">
								Add amounts in column 5. <br /> Enter here and on Part I, <br /> line 9, column (B)
							</span>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDeductionSetAsidesAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="width:16mm;">Part VIII</div>
						<div class="styPartDesc" style="width:170mm;">
							Exploited Exempt Activity Income, Other Than Advertising Income
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!-- Part 8, Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty990TSchALongDesc" style="height:auto;">
							Description of exploited activity: 
							<span style="border-bottom:1px solid black;width:97mm;margin-left:2px;">
								<xsl:choose>
									<xsl:when test="$FormData/ExploitedConsolidatedActyCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ExploitedConsolidatedActyCd"/>
										</xsl:call-template>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/ExploitedConsolidatedActyCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ExploitedActivityDesc"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="sty990TSchARightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;">
							<xsl:if test="string-length($FormData/ExploitedActivityDesc) &gt; 70">
								<xsl:attribute name="style">height:7.4mm;background-color:lightgrey;</xsl:attribute>
							</xsl:if>
							&nbsp;
						</div>
						<div class="sty990TSchAAmtBoxNBB" style="height:4.4mm;">
							<xsl:if test="string-length($FormData/ExploitedActivityDesc) &gt; 70">
								<xsl:attribute name="style">height:7.4mm;</xsl:attribute>
							</xsl:if>
							&nbsp;
						</div>
					</div>
					<!-- Part 8, Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty990TSchALongDesc">
							Gross unrelated business income from trade or business. Enter here and on Part I, line 10, column (A)
							<span class="sty990TSchADotLn">...</span>
						</div>
						<div class="sty990TSchARightNumBox">2</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExploitedExemptActivityIncmAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty990TSchALongDesc" style="height:auto;">
							Expenses directly connected with production of unrelated business income. Enter here and on Part I, line 10, column (B)
							<span class="sty990TSchADotLn">...............................</span>
						</div>
						<div class="sty990TSchARightNumBox" style="height:7.2mm;"><br />3</div>
						<div class="sty990TSchAAmtBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExploitedExpnssCnnctUBIAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="sty990TSchALongDesc" style="height:auto;">
							Net income (loss) from unrelated trade or business. Subtract line 3 from line 2. If a gain, complete <br /> lines 5 through 7
							<span class="sty990TSchADotLn">.............................</span>
						</div>
						<div class="sty990TSchARightNumBox" style="height:7.2mm;"><br />4</div>
						<div class="sty990TSchAAmtBox" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExploitedActivityNetIncomeAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="sty990TSchALongDesc">
							Gross income from activity that is not unrelated business income
							<span class="sty990TSchADotLn">..............</span>
						</div>
						<div class="sty990TSchARightNumBox">5</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeActyNotUBIAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty990TSchALongDesc">
							Expenses attributable to income entered on line 5
							<span class="sty990TSchADotLn">...................</span>
						</div>
						<div class="sty990TSchARightNumBox">6</div>
						<div class="sty990TSchAAmtBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/GrossIncomeActyNotUBIExpnsAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 8, Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty990TSchALongDesc" style="height:auto;">
							Excess exempt expenses. Subtract line 5 from line 6, but do not enter more than the amount on line 4. Enter here and on Part II, line 12
							<span class="sty990TSchADotLn">..........................</span>
						</div>
						<div class="sty990TSchARightNumBoxNBB" style="height:7.2mm;"><br />7</div>
						<div class="sty990TSchAAmtBoxNBB" style="height:7.2mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExploitedExcessExemptExpnssAmt" />
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;font-weight:bold;">Schedule A (Form 990-T) 2020</span>
					</div>
					<div class="styStdDiv">
						Schedule A (Form 990-T) 2020
						<span style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span></span>
					</div>
					<!-- Part 9 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part IX</div>
						<div class="styPartDesc">Advertising Income</div>
					</div>
					<!-- Line 1 -->
					<xsl:variable name="part9Count" select="count($FormData/AdvertisingIncmPeriodicalGrp)"/>
					<xsl:variable name="shouldSepPart9" select="($Print = $Separated) and ($part9Count &gt; 4)"/>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty990TSchADesc" style="width:178mm;">
							Name(s) of periodical(s). Check box if reporting two or more periodicals on a consolidated basis.
						</div>
					</div>
					<xsl:if test="not($shouldSepPart9)">
						<xsl:for-each select="$FormData/AdvertisingIncmPeriodicalGrp">
							<xsl:variable name="pos" select="position()"/>
							<div class="styStdDiv" style="padding-left:8mm;">
								<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;"><xsl:number value="$pos" format="A"/></div>
								<span class="styGenericDiv" style="width:4mm;">
									<input type="checkbox" class="styCkboxNM">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="ConsolidatedPeriodicalInd"/>
											<xsl:with-param name="BackupName">IRS990TAdvertisingIncmPeriodicalGrpConsolidatedPeriodicalInd<xsl:value-of select="$pos"/></xsl:with-param>
										</xsl:call-template>
										<xsl:attribute name="alt">Line <xsl:number format="A" value="$pos"/> Consolidated Periodical</xsl:attribute>
									</input>
								</span>
								<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AdvertisedPeriodicalNameTxt"/>
									</xsl:call-template>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="ConsolidatedPeriodicalInd"/>
									</xsl:call-template>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</div>
							</div>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart9 or ($part9Count &lt; 1)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">A</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Line A Consolidated Periodical" id="IRS990TSchAP9LADU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp"/>
								</xsl:call-template>
								&nbsp;
							</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSepPart9 or ($part9Count &lt; 2)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">B</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Line B Consolidated Periodical" id="IRS990TSchAP9LBDU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSepPart9 or ($part9Count &lt; 3)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">C</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Line C Consolidated Periodical" id="IRS990TSchAP9LCDU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<xsl:if test="$shouldSepPart9 or ($part9Count &lt; 4)">
						<div class="styStdDiv" style="padding-left:8mm;">
							<div class="styLNLeftNumBox" style="width:3mm;padding-left:0px;">D</div>
							<span class="styGenericDiv" style="width:4mm;">
								<input type="checkbox" class="styCkboxNM" alt="Line D Consolidated Periodical" id="IRS990TSchAP9LDDU"/>
							</span>
							<div class="styLNDesc" style="width:172mm;border-bottom:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<div class="styStdDiv" style="padding-top:0.5mm;padding-bottom:0.5mm;">
						Enter amounts for each periodical listed above in the corresponding column.
					</div>
					<xsl:if test="not($shouldSepPart9)">
						<xsl:for-each select="$FormData/AdvertisingIncmPeriodicalGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<!-- Column Headers -->
								<div class="styStdDiv" style="">
									<div class="styLNLeftNumBox" style="">&nbsp;</div>
									<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top:1px solid black;"><xsl:number value="$pos" format="A"/>	</div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top:1px solid black;"><xsl:number value="$pos + 1" format="A"/></div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top:1px solid black;"><xsl:number value="$pos + 2" format="A"/></div>
									<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top:1px solid black;"><xsl:number value="$pos + 3" format="A"/></div>
								</div>
								<!-- Part 9, Line 2 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">2</div>
									<div class="sty990TSchAShortDesc">
										Gross advertising income
										<span class="sty990TSchADotLn">......</span>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="GrossAdvertisingIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/GrossAdvertisingIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/GrossAdvertisingIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/GrossAdvertisingIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart9 or ($part9Count &lt; 1)">
						<!-- Column Headers -->
						<div class="styStdDiv" style="">
							<div class="styLNLeftNumBox" style="">&nbsp;</div>
							<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top:1px solid black;">A</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top:1px solid black;">B</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top:1px solid black;">C</div>
							<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top:1px solid black;">D</div>
						</div>
						<!-- Part 9, Line 2 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="sty990TSchAShortDesc">
								Gross advertising income
								<span class="sty990TSchADotLn">......</span>
							</div>
							<div class="sty990TSchAShortAmtBox">
								<xsl:call-template name="PopulateAdditionalDataTableMessage">
									<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp"/>
									<xsl:with-param name="ShortMessage" select="true()"/>
								</xsl:call-template>
							</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 9, Line 2a -->
					<div class="styStdDiv" style="padding-top:2mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="sty990TSchALongDesc" style="width:149mm;">
							Add columns A through D. Enter here and on Part I, line 11, column (A)
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.............&#9658;</span>
						</div>
						<div class="sty990TSchAAmtBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalGrossAdvertisingIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:if test="not($shouldSepPart9)">
						<xsl:for-each select="$FormData/AdvertisingIncmPeriodicalGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<xsl:if test="($part9Count &gt; 4) and not($shouldSepPart9)">
									<!-- Column Headers -->
									<div class="styStdDiv" style="">
										<div class="styLNLeftNumBox" style="">&nbsp;</div>
										<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos" format="A"/>	</div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos + 1" format="A"/></div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos + 2" format="A"/></div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos + 3" format="A"/></div>
									</div>
								</xsl:if>
								<!-- Part 9, Line 3 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">3</div>
									<div class="sty990TSchAShortDesc">
										Direct Advertising costs by periodical
										<span class="sty990TSchADotLn">..</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:4.2mm;border-top:1px solid black;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="DirectAdvertisingCostAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:4.2mm;border-top:1px solid black;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/DirectAdvertisingCostAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:4.2mm;border-top:1px solid black;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/DirectAdvertisingCostAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:4.2mm;border-top:1px solid black;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/DirectAdvertisingCostAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart9 or ($part9Count &lt; 1)">
						<!-- Part 9, Line 3 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="sty990TSchAShortDesc">
								Direct Advertising costs by periodical
								<span class="sty990TSchADotLn">..</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:4.2mm;border-top:1px solid black;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:4.2mm;border-top:1px solid black;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:4.2mm;border-top:1px solid black;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:4.2mm;border-top:1px solid black;">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 9, Line 3a -->
					<div class="styStdDiv" style="padding-top:2mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="sty990TSchALongDesc" style="width:149mm;">
							Add columns A through D. Enter here and on Part I, line 11, column (B)
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.............&#9658;</span>
						</div>
						<div class="sty990TSchAAmtBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalDirectAdvertisingCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<xsl:if test="not($shouldSepPart9)">
						<xsl:for-each select="$FormData/AdvertisingIncmPeriodicalGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="position() mod 4 = 1">
								<xsl:if test="($part9Count &gt; 4) and not($shouldSepPart9)">
									<!-- Column Headers -->
									<div class="styStdDiv" style="">
										<div class="styLNLeftNumBox" style="">&nbsp;</div>
										<div class="sty990TSchAShortDesc" style="">&nbsp;</div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos" format="A"/>	</div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos + 1" format="A"/></div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos + 2" format="A"/></div>
										<div class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;border-top-width:1px;border-bottom-width:0px;"><xsl:number value="$pos + 3" format="A"/></div>
									</div>
								</xsl:if>
								<!-- Part 9, Line 4 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBox">4</div>
									<div class="sty990TSchAShortDesc" style="height:auto;padding-right:2px;">
										Advertising gain (loss). Subtract line 3 from line 2. For any column in line 4 showing a gain, 
										complete lines 5 through 8. For any column in line 4 showing a loss or zero, do not complete 
										lines 5 through 7, and enter zero on line 8
										<span class="sty990TSchADotLn" style="margin-right:-2px;">............</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:19.5mm;border-top:1px solid black;"><br /><br /><br /><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="AdvertisingGainLossAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:19.5mm;border-top:1px solid black;"><br /><br /><br /><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/AdvertisingGainLossAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:19.5mm;border-top:1px solid black;"><br /><br /><br /><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/AdvertisingGainLossAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:19.5mm;border-top:1px solid black;"><br /><br /><br /><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/AdvertisingGainLossAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 9, Line 5 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">5</div>
									<div class="sty990TSchAShortDesc">
										Readership costs
										<span class="sty990TSchADotLn">........</span>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ReadershipCostsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/ReadershipCostsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/ReadershipCostsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/ReadershipCostsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 4, Line 6 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">6</div>
									<div class="sty990TSchAShortDesc">
										Circulation income
										<span class="sty990TSchADotLn">........</span>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="CirculationIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/CirculationIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/CirculationIncomeAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/CirculationIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 9, Line 7 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">7</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Excess readership costs. If line 6 is less than line 5, subtract line 6 from line 5. 
										If line 5 is less than line 6, enter zero
										<span class="sty990TSchADotLn">.....</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ExcessReadershipCostsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/ExcessReadershipCostsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/ExcessReadershipCostsAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/ExcessReadershipCostsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Part 9, Line 8 -->
								<div class="styStdDiv">
									<div class="styLNLeftNumBoxSD">8</div>
									<div class="sty990TSchAShortDesc" style="height:auto;">
										Excess readership costs allowed as a deduction. For each column showing a gain on line 4, 
										enter the lesser of line 4 or line 7
										<span class="sty990TSchADotLn">.</span>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ExcessReadershipCostsDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/ExcessReadershipCostsDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/ExcessReadershipCostsDedAmt"/>
										</xsl:call-template>
									</div>
									<div class="sty990TSchAShortAmtBox" style="height:10.5mm;"><br /><br />
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/ExcessReadershipCostsDedAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</xsl:if>
						</xsl:for-each>
					</xsl:if>
					<xsl:if test="$shouldSepPart9 or ($part9Count &lt; 1)">
						<!-- Part 9, Line 4 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="sty990TSchAShortDesc" style="height:auto;padding-right:2px;">
								Advertising gain (loss). Subtract line 3 from line 2. For any column in line 4 showing a gain, 
									complete lines 5 through 8. For any column in line 4 showing a loss or zero, do not complete 
									lines 5 through 7, and enter zero on line 8
								<span class="sty990TSchADotLn" style="margin-right:-2px;">............</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:19.5mm;border-top:1px solid black;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:19.5mm;border-top:1px solid black;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:19.5mm;border-top:1px solid black;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:19.5mm;border-top:1px solid black;">&nbsp;</div>
						</div>
						<!-- Part 9, Line 5 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="sty990TSchAShortDesc">
								Readership costs
								<span class="sty990TSchADotLn">........</span>
							</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
						</div>
						<!-- Part 4, Line 6 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="sty990TSchAShortDesc">
								Circulation income
								<span class="sty990TSchADotLn">........</span>
							</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox">&nbsp;</div>
						</div>
						<!-- Part 9, Line 7 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Excess readership costs. If line 6 is less than line 5, subtract line 6 from line 5. 
								If line 5 is less than line 6, enter zero
								<span class="sty990TSchADotLn">.....</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
						</div>
						<!-- Part 9, Line 8 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="sty990TSchAShortDesc" style="height:auto;">
								Excess readership costs allowed as a deduction. For each column showing a gain on line 4, 
								enter the lesser of line 4 or line 7
								<span class="sty990TSchADotLn">.</span>
							</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
							<div class="sty990TSchAShortAmtBox" style="height:10.5mm;">&nbsp;</div>
						</div>
					</xsl:if>
					<!-- Part 9, Line 8a -->
					<div class="styStdDiv" style="padding-top:2mm;padding-bottom:2mm;">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">a</div>
						<div class="sty990TSchALongDesc" style="width:149mm;">
							Add line 8, columns A through D. Enter the greater of the columns total or zero here and on Part II, line 13
							<span class="sty990TSchADotLn" style="margin-right:-4px;">..&#9658;</span>
						</div>
						<div class="sty990TSchAAmtBox" style="border-left-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotExcessReadershipCostsDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 10 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part X</div>
						<div class="styPartDesc">
							Compensation of Officers, Directors, and Trustees 
							<span style="font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!-- Part 10, Table -->
					<xsl:variable name="part10Count" select="count($FormData/OfficerDirTrstCompGrp)"/>
					<xsl:variable name="shouldSepPart10" select="($Print = $Separated) and ($part10Count &gt; 4)"/>
					<div class="sty990TSchADepdContainer">
						<xsl:call-template name="SetInitialState"/>
						<table style="display:table;border-collapse:collapse;">
							<thead class="styTableThead">
								<tr style="vertical-align:top;">
									<th class="styTableCellHeader" style="min-width:66mm;width:72mm;font-weight:normal;" scope="col">
										<strong>1. </strong> Name
									</th>
									<th class="styTableCellHeader" style="width:57mm;font-weight:normal;" scope="col">
										<strong>2. </strong> Title
									</th>
									<th class="styTableCellHeader" style="width:26mm;font-weight:normal;" scope="col">
										<strong>3. </strong> Percentage <br /> of time devoted <br /> to business
									</th>
									<th class="styTableCellHeader" style="width:32mm;border-right-width:0px;font-weight:normal;" scope="col">
										<strong>4. </strong> Compensation <br /> attributable to <br /> unrelated business
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:if test="not($shouldSepPart10)">
									<xsl:for-each select="$FormData/OfficerDirTrstCompGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellTextInherit">
												<span style="width:6mm;font-weight:bold;float:left;">(<xsl:number value="position()"/>)</span>
												<xsl:choose>
													<xsl:when test="PersonNm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="PersonNm"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
														</xsl:call-template>
														<xsl:if test="BusinessName/BusinessNameLine2Txt">
															<br />
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:if>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="TitleTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="TimeDevotedToBusinessPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="UnrelatedBusinessCompAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:if test="$shouldSepPart10 or ($part10Count &lt; 1)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(1)</span>
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$FormData/IntAnntsRyltsRentCtrlOrgGrp"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart10 or ($part10Count &lt; 2)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(2)</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart10 or ($part10Count &lt; 3)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(3)</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
								<xsl:if test="$shouldSepPart10 or ($part10Count &lt; 4)">
									<tr>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(4)</span>
										</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit">&nbsp;</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">&nbsp;</td>
									</tr>
								</xsl:if>
							</tbody>
						</table>
					</div>
					<!-- Part 10, Totals -->
					<div class="styStdDiv">
						<div class="styLNDesc" style="width:154.8mm;">
							<strong>Total. </strong> Enter here and on Part II, line 1
							<span class="sty990TSchADotLn" style="margin-right:-4px;">.........................&#9658;</span>
						</div>
						<div class="styLNAmountBoxNBB" style="width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalUnrelatedBusinessCompAmt" />
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 11 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part XI</div>
						<div class="styPartDesc">
							Supplemental Information 
							<span style="font-weight:normal;"> (see instructions)</span>
						</div>
					</div>
					<!-- Supplemental Information -->
					<xsl:choose>
						<xsl:when test="$FormData/ItmzdSupplementalInfoGrp">
							<table class="styTable" style="width:187mm;border-collapse:collapse;font-size:7pt;">
								<thead class="styTableThead">
									<tr>
										<th class="styTableCellHeader" style="width:30mm;">
											Part Number
										</th>
										<th class="styTableCellHeader" style="width:30mm;">
											Line Number
										</th>
										<th class="styTableCellHeader" style="min-width:70mm;width:97mm;">
											Explanation
										</th>
										<th class="styTableCellHeader" style="width:30mm;border-right-width:0px;">
											Amount
										</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="$FormData/ItmzdSupplementalInfoGrp">
										<tr style="vertical-align:top;">
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PartNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellCtrInherit" style="word-break:break-all;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="LineNum"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellTextInherit">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="border-right-width:0px;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ExplanationAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<div class="styStdDiv" style="padding-bottom:2px;">
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span><br />
								<span style="width:100%;border-bottom:1px dashed black;">&nbsp;</span>
							</div>
						</xsl:otherwise>
					</xsl:choose>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;font-weight:bold;">Schedule A (Form 990-T) 2020</span>
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
							<xsl:with-param name="Desc">Top Right Margin - Primary Filer Death Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PrimaryDeathDt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/OthInventoryValuationMethodCd/@othInvntryValuationMethodDesc" />
							<xsl:with-param name="Desc">Part III Header - Other Inventory Valuation Method Description</xsl:with-param>
						</xsl:call-template>
					</table>
					<!-- Begin Separated Repeating data table for Part 4 -->
					<xsl:if test="$shouldSepPart4">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part IV - Rent Income (From Real Property and Personal Property Leased with Real Property)</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" style="width:8mm;font-weight:normal;" scope="col">
										&nbsp;
									</th>
									<th class="styDepTblCell" style="width:8mm;font-weight:normal;" scope="col">
										&nbsp;
									</th>
									<th class="styDepTblCell" style="width:171mm;min-width:160mm;font-weight:normal;" scope="col">
										Description of property (property street address, city, state, ZIP code). Check if a dual-use (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/RentIncomePropertyGrp">
									<xsl:variable name="pos" select="position()"/>
									<tr style="border-color:black;height:auto;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="$pos mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="DualUseInd"/>
													<xsl:with-param name="BackupName">IRS990TRentIncomePropertyGrpDualUseInd<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Line <xsl:number format="A" value="$pos"/> Dual Use</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="ForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:for-each select="$FormData/RentIncomePropertyGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="($pos mod 4) = 1">
								<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
									<thead class="styTableThead">
										<tr class="styDepTblHdr" style="vertical-align:top;">
											<th class="styLNLeftNumBox" style="float:none;border-bottom:1px solid black;">&nbsp;</th>
											<th class="sty990TSchAShortDesc" style="float:none;border-bottom:1px solid black;">&nbsp;</th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos" format="A"/>	</th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos + 1" format="A"/></th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos + 2" format="A"/></th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos + 3" format="A"/></th>
										</tr>
									</thead>
									<tbody>
										<!-- Part 4, Line 2 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">2</td>
											<td class="styTableCellTextInherit">Rent received or accrued</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
										<!-- Part 4, Line 2a -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit" style="padding-left:4.2mm;">a</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												From personal property (if the percentage of rent for personal property is more than 10% but not more than 50%)
												<span class="sty990TSchADotLn">......</span>
											</td>
											<td class="styTableCellAmtInherit" style="height:10mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RentPersonalPropertyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/RentPersonalPropertyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/RentPersonalPropertyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/RentPersonalPropertyAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 4, Line 2b -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit" style="padding-left:4.2mm;">b</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												From real and personal property (if the percentage of rent for personal property exceeds 50% or if the rent is based on profit or income)
												<span class="sty990TSchADotLn">..........</span>
											</td>
											<td class="styTableCellAmtInherit" style="height:13mm;"><br /><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="RentRealPersonalPropertyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:13mm;"><br /><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/RentRealPersonalPropertyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:13mm;"><br /><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/RentRealPersonalPropertyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:13mm;"><br /><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/RentRealPersonalPropertyAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 4, Line 2c -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit" style="padding-left:4.2mm;">c</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Total rents received or accrued by property. Add lines 2a and 2b, columns A through D
												<span class="sty990TSchADotLn">.</span>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalRentsByPropertyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/TotalRentsByPropertyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/TotalRentsByPropertyAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/TotalRentsByPropertyAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 4, Line 4 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">4</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Deductions directly connected with the income in lines 2(a) and 2(b) (attach statement)
												<span class="sty990TSchADotLn">.</span>
											</td>
											<td class="styTableCellAmtInherit" style="height:7.2mm;border-top-width:1px;"><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="DeductionsConnectedRentIncmAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DeductionsConnectedRentIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7.2mm;border-top-width:1px;"><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/DeductionsConnectedRentIncmAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 1]/DeductionsConnectedRentIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7.2mm;border-top-width:1px;"><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/DeductionsConnectedRentIncmAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 2]/DeductionsConnectedRentIncmAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7.2mm;border-top-width:1px;"><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/DeductionsConnectedRentIncmAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RentIncomePropertyGrp[$pos + 3]/DeductionsConnectedRentIncmAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>						
						</xsl:for-each>
						
					</xsl:if>
					<!-- Begin Separated Repeating data table for Part 5 -->
					<xsl:if test="$shouldSepPart5">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part V - Unrelated Debt-Financed Income </span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" style="width:8mm;font-weight:normal;" scope="col">
										&nbsp;
									</th>
									<th class="styDepTblCell" style="width:8mm;font-weight:normal;" scope="col">
										&nbsp;
									</th>
									<th class="styDepTblCell" style="width:171mm;min-width:160mm;font-weight:normal;" scope="col">
										Description of property (property street address, city, state, ZIP code). Check if a dual-use (see instructions)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/UnrelatedDebtFinancedPropGrp">
									<xsl:variable name="pos" select="position()"/>
									<tr style="border-color:black;height:auto;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="$pos mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="DualUseInd"/>
													<xsl:with-param name="BackupName">IRS990TUnrelatedDebtFinancedPropGrpDualUseInd<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Line <xsl:number format="A" value="$pos"/> Dual Use</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:choose>
												<xsl:when test="ForeignAddress">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:for-each select="$FormData/UnrelatedDebtFinancedPropGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="($pos mod 4) = 1">
								<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
									<thead class="styTableThead">
										<tr class="styDepTblHdr" style="vertical-align:top;">
											<th class="styLNLeftNumBox" style="float:none;border-bottom:1px solid black;">&nbsp;</th>
											<th class="sty990TSchAShortDesc" style="float:none;border-bottom:1px solid black;">&nbsp;</th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos" format="A"/>	</th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos + 1" format="A"/></th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos + 2" format="A"/></th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos + 3" format="A"/></th>
										</tr>
									</thead>
									<tbody>
										<!-- Part 5, Line 2 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">2</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Gross income from or allocable to debt-financed property
												<span class="sty990TSchADotLn">........</span>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/GrossIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/GrossIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/GrossIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 5, Line 3 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">3</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Deductions directly connected with or allocable to debt-financed property
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="height:7mm;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="height:7mm;">&nbsp;</td>
											<td class="styTableCellAmtInherit" style="height:7mm;">&nbsp;</td>
										</tr>
										<!-- Part 5, Line 3a -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit" style="padding-left:4.2mm;">a</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Straight line depreciation (attach statement)
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="StraightLineDepreciationDedAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="StraightLineDepreciationDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/StraightLineDepreciationDedAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/StraightLineDepreciationDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/StraightLineDepreciationDedAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/StraightLineDepreciationDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/StraightLineDepreciationDedAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/StraightLineDepreciationDedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 5, Line 3b -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit" style="padding-left:4.2mm;">b</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Other deductions(attach statement)
												<span class="sty990TSchADotLn">..</span>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="OtherDebtFinancedDeductionAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="OtherDebtFinancedDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/OtherDebtFinancedDeductionAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/OtherDebtFinancedDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/OtherDebtFinancedDeductionAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/OtherDebtFinancedDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/OtherDebtFinancedDeductionAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/OtherDebtFinancedDeductionAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 5, Line 3c -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit" style="padding-left:4.2mm;">c</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Total deductions (add lines 3a and 3b, columns A through D)
												<span class="sty990TSchADotLn">.......</span>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotalDebtFinancedDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/TotalDebtFinancedDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/TotalDebtFinancedDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/TotalDebtFinancedDeductionAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 5, Line 4 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">4</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Amount of average acquisition debt on or allocable to debt-financed property (attach statement)
												<span class="sty990TSchADotLn">..........</span>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="AverageAcquisitionDebtAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AverageAcquisitionDebtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAcquisitionDebtAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAcquisitionDebtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAcquisitionDebtAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAcquisitionDebtAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAcquisitionDebtAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAcquisitionDebtAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 5, Line 5 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">5</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Average adjusted basis of or allocable to debt-financed property (attach statement)
												
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="AverageAdjustedBasisAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AverageAdjustedBasisAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAdjustedBasisAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAdjustedBasisAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAdjustedBasisAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAdjustedBasisAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:7mm;"><br />
												<span style="float:left;">
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAdjustedBasisAmt"/>
													</xsl:call-template>
												</span>
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAdjustedBasisAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 5, Line 6 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">6</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Divide line 4 by line 5
												<span class="sty990TSchADotLn">.......</span>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="AverageAcquisitionAdjBasisPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AverageAcquisitionAdjBasisPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AverageAcquisitionAdjBasisPct"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AverageAcquisitionAdjBasisPct"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 5, Line 7 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">7</td>
											<td class="styTableCellTextInherit" style="height:auto;font-family:Arial;padding-top:2px;">
												Gross income reportable. Multiply line 2 by line 6
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossIncomeReportableAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/GrossIncomeReportableAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/GrossIncomeReportableAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/GrossIncomeReportableAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 5, Line 9 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">9</td>
											<td class="styTableCellTextInherit">
												Allocable deductions. Multiply line 3c by line 6
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AllocableDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 1]/AllocableDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 2]/AllocableDeductionAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/UnrelatedDebtFinancedPropGrp[$pos + 3]/AllocableDeductionAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>						
						</xsl:for-each>
					</xsl:if>
					<!-- Begin Separated Repeating data tables for Part 6 -->
					<xsl:if test="$shouldSepPart6">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part VI - Interest, Annuities, Royalties, and Rents from Controlled Organizations</span>
						<!-- Table 1 -->
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="min-width:48mm;width:58mm;font-weight:normal;" rowspan="2" scope="col">
										<strong>1. </strong> Name of controlled organization
									</th>
									<th class="styDepTblCell" style="width:17mm;font-weight:normal;" rowspan="2" scope="col">
										<strong>2. </strong> Employer identification number
									</th>
									<th class="styDepTblCell" style="width:112mm;font-weight:normal;" rowspan="1" colspan="4" scope="colgroup">
										Exempt Controlled Organizations
									</th>
								</tr>
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" style="width:28mm;font-weight:normal;" scope="col">
										<strong>3. </strong> Net unrelated income (loss) <br /> (see instructions)
									</th>
									<th class="styDepTblCell" style="width:28mm;font-weight:normal;" scope="col">
										<strong>4. </strong> Total of specified payments made
									</th>
									<th class="styDepTblCell" style="width:28mm;font-weight:normal;" scope="col">
										<strong>5. </strong> Part of column 4 that is included <br /> in the controlling organization's <br /> gross income
									</th>
									<th class="styDepTblCell" style="width:28mm;font-weight:normal;" scope="col">
										<strong>6. </strong> Deductions directly connected with income in column 5
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IntAnntsRyltsRentCtrlOrgGrp">
									<tr style="border-color:black;height:auto;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(<xsl:number value="position()"/>)</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="BusinessName/BusinessNameLine2Txt">
												<br />
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											</xsl:if>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN" />
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExmptCtrlOrgNetUnrltIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExmptCtrlOrgTotSpcfdPymtAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExmptCtrlOrgPymtGrossIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExmptCtrlOrgDeductionAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<!-- Table 2 -->
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="width:187mm;font-weight:normal;" rowspan="1" colspan="5" scope="colgroup">
										Nonexempt Controlled Organizations
									</th>
								</tr>
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" style="min-width:34mm;width:43mm;font-weight:normal;" scope="col">
										<strong>7. </strong> Taxable income
									</th>
									<th class="styDepTblCell" style="width:36mm;font-weight:normal;" scope="col">
										<strong>8. </strong> Net unrelated <br /> income (loss) <br />  (see instructions)
									</th>
									<th class="styDepTblCell" style="width:36mm;font-weight:normal;" scope="col">
										<strong>9. </strong> Total of specified payments made
									</th>
									<th class="styDepTblCell" style="width:36mm;font-weight:normal;" scope="col">
										<strong>10. </strong> Part of column 9 <br /> that is included in the <br /> controlling organization's <br /> gross income
									</th>
									<th class="styDepTblCell" style="width:36mm;font-weight:normal;" scope="col">
										<strong>11. </strong> Deductions directly connected with <br /> income in column 10
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IntAnntsRyltsRentCtrlOrgGrp">
									<tr style="border-color:black;height:auto;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(<xsl:number value="position()"/>)</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgTaxableIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgNetUnrltIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgTotSpcfdPymtAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgPymtGrossIncmAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="NnxmptCtrlOrgDeductionAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Begin Separated Repeating data table for Part 7 -->
					<xsl:if test="$shouldSepPart7">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part VII - Investment Income of a Section 501(c)(7), (9), or (17) Organization</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" style="min-width:45mm;width:55mm;font-weight:normal;" scope="col">
										<strong>1. </strong> Description of income
									</th>
									<th class="styDepTblCell" style="width:33mm;font-weight:normal;" scope="col">
										<strong>2. </strong> Amount of income
									</th>
									<th class="styDepTblCell" style="width:33mm;font-weight:normal;" scope="col">
										<strong>3. </strong> Deductions directly connected (attach statement)
									</th>
									<th class="styDepTblCell" style="width:33mm;font-weight:normal;" scope="col">
										<strong>4. </strong> Set-asides <br /> (attach statement)
									</th>
									<th class="styDepTblCell" style="width:33mm;font-weight:normal;" scope="col">
										<strong>5. Total deductions and set-asides</strong> <br /> (add columns 3 and 4)
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/InvestmentIncmSect501c7917Grp">
									<tr style="border-color:black;height:auto;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(<xsl:number value="position()"/>)</span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="IncomeTypeDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InvestmentIncomeAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<span style="float:left;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="InvestmentIncomeDeductionAmt"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InvestmentIncomeDeductionAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<span style="float:left;">
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="InvestmentIncomeSetAsidesAmt"/>
												</xsl:call-template>
											</span>
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="InvestmentIncomeSetAsidesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DeductionSetAsidesAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- Begin Separated Repeating data table for Part 9 -->
					<xsl:if test="$shouldSepPart9">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part IX - Advertising Income</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr" style="vertical-align:top;">
									<th class="styDepTblCell" style="width:8mm;font-weight:normal;" scope="col">
										&nbsp;
									</th>
									<th class="styDepTblCell" style="width:8mm;font-weight:normal;" scope="col">
										&nbsp;
									</th>
									<th class="styDepTblCell" style="width:171mm;min-width:160mm;font-weight:normal;" scope="col">
										Name(s) of periodical(s). Check box if reporting two or more periodicals on a consolidated basis. 
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/AdvertisingIncmPeriodicalGrp">
									<xsl:variable name="pos" select="position()"/>
									<tr style="border-color:black;height:auto;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="$pos mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellCtrInherit" style="font-weight:bold;">
											<xsl:number value="$pos" format="A"/>
										</td>
										<td class="styTableCellCtrInherit">
											<input type="checkbox" class="styCkboxNM">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="ConsolidatedPeriodicalInd"/>
													<xsl:with-param name="BackupName">IRS990TAdvertisingIncmPeriodicalGrpConsolidatedPeriodicalInd<xsl:value-of select="$pos"/></xsl:with-param>
												</xsl:call-template>
												<xsl:attribute name="alt">Line <xsl:number format="A" value="$pos"/> Consolidated Periodical</xsl:attribute>
											</input>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AdvertisedPeriodicalNameTxt"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="ConsolidatedPeriodicalInd"/>
											</xsl:call-template>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:for-each select="$FormData/AdvertisingIncmPeriodicalGrp">
							<xsl:variable name="pos" select="position()"/>
							<xsl:if test="($pos mod 4) = 1">
								<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
									<thead class="styTableThead">
										<tr class="styDepTblHdr" style="vertical-align:top;">
											<th class="styLNLeftNumBox" style="float:none;border-bottom:1px solid black;">&nbsp;</th>
											<th class="sty990TSchAShortDesc" style="float:none;border-bottom:1px solid black;">&nbsp;</th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos" format="A"/>	</th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos + 1" format="A"/></th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos + 2" format="A"/></th>
											<th class="sty990TSchAShortAmtBox" style="text-align:center;font-weight:bold;float:none;"><xsl:number value="$pos + 3" format="A"/></th>
										</tr>
									</thead>
									<tbody>
										<!-- Part 4, Line 2 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">2</td>
											<td class="styTableCellTextInherit">Rent received or accrued</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
											<td class="styTableCellAmtInherit">&nbsp;</td>
										</tr>
										<!-- Part 9, Line 2 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">2</td>
											<td class="styTableCellTextInherit">
												Gross advertising income
												<span class="sty990TSchADotLn">......</span>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="GrossAdvertisingIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/GrossAdvertisingIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/GrossAdvertisingIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/GrossAdvertisingIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 9, Line 3 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">3</td>
											<td class="styTableCellTextInherit">
												Direct Advertising costs by periodical
												<span class="sty990TSchADotLn">..</span>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="DirectAdvertisingCostAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/DirectAdvertisingCostAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/DirectAdvertisingCostAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/DirectAdvertisingCostAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 9, Line 4 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">4</td>
											<td class="styTableCellTextInherit" style="height:auto;padding-right:2px;">
												Advertising gain (loss). Subtract line 3 from line 2. For any column in line 4 showing a gain, 
												complete lines 5 through 8. For any column in line 4 showing a loss or zero, do not complete 
												lines 5 through 7, and enter zero on line 8
												<span class="sty990TSchADotLn" style="margin-right:-2px;">............</span>
											</td>
											<td class="styTableCellAmtInherit" style="height:19.5mm;"><br /><br /><br /><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AdvertisingGainLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:19.5mm;"><br /><br /><br /><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/AdvertisingGainLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:19.5mm;"><br /><br /><br /><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/AdvertisingGainLossAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:19.5mm;"><br /><br /><br /><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/AdvertisingGainLossAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 9, Line 5 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">5</td>
											<td class="styTableCellTextInherit">
												Readership costs
												<span class="sty990TSchADotLn">........</span>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ReadershipCostsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/ReadershipCostsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/ReadershipCostsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/ReadershipCostsAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 4, Line 6 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">6</td>
											<td class="styTableCellTextInherit">
												Circulation income
												<span class="sty990TSchADotLn">........</span>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="CirculationIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/CirculationIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/CirculationIncomeAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/CirculationIncomeAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 9, Line 7 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">7</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Excess readership costs. If line 6 is less than line 5, subtract line 6 from line 5. 
												If line 5 is less than line 6, enter zero
												<span class="sty990TSchADotLn">.....</span>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessReadershipCostsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/ExcessReadershipCostsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/ExcessReadershipCostsAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/ExcessReadershipCostsAmt"/>
												</xsl:call-template>
											</td>
										</tr>
										<!-- Part 9, Line 8 -->
										<tr class="styDepTblRow1">
											<td class="styTableCellTextInherit">8</td>
											<td class="styTableCellTextInherit" style="height:auto;">
												Excess readership costs allowed as a deduction. For each column showing a gain on line 4, 
												enter the lesser of line 4 or line 7
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="ExcessReadershipCostsDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 1]/ExcessReadershipCostsDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 2]/ExcessReadershipCostsDedAmt"/>
												</xsl:call-template>
											</td>
											<td class="styTableCellAmtInherit" style="height:10.5mm;"><br /><br />
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/AdvertisingIncmPeriodicalGrp[$pos + 3]/ExcessReadershipCostsDedAmt"/>
												</xsl:call-template>
											</td>
										</tr>
									</tbody>
								</table>
							</xsl:if>						
						</xsl:for-each>
					</xsl:if>
					<!-- Begin Separated Repeating data table for Part 10 -->
					<xsl:if test="$shouldSepPart10">
						<br />
						<br />
						<span class="styRepeatingDataTitle">Part X - Compensation of Officers, Directors, and Trustees</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" style="min-width:66mm;width:72mm;font-weight:normal;" scope="col">
										<strong>1. </strong> Name
									</th>
									<th class="styDepTblCell" style="width:57mm;font-weight:normal;" scope="col">
										<strong>2. </strong> Title
									</th>
									<th class="styDepTblCell" style="width:26mm;font-weight:normal;" scope="col">
										<strong>3. </strong> Percentage <br /> of time devoted <br /> to business
									</th>
									<th class="styDepTblCell" style="width:32mm;font-weight:normal;" scope="col">
										<strong>4. </strong> Compensation <br /> attributable to <br /> unrelated business
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/OfficerDirTrstCompGrp">
									<tr style="border-color:black;height:auto;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellTextInherit">
											<span style="width:6mm;font-weight:bold;float:left;">(<xsl:number value="position()"/>)</span>
											<xsl:choose>
												<xsl:when test="PersonNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt">
														<br />
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellTextInherit">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="TitleTxt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="TimeDevotedToBusinessPct"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellAmtInherit" style="border-right-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="UnrelatedBusinessCompAmt"/>
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
