<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 11/04/2021 -->
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
	<xsl:include href="IRS1040Schedule1Style.xsl" />
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS1040Schedule1" />
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
				<meta name="Description" content="IRS Form 1040 Schedule 1" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript" />
				<xsl:call-template name="InitJS" />
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040Schedule1Style" />
						<xsl:call-template name="AddOnStyle" />
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm" />
			</head>
			<body class="styBodyClass">
				<form id="Form1040Schedule1">
					<xsl:call-template name="DocumentHeader" />
					<!-- Header -->		
					<div class="styStdDiv">
						<div class="styFNBox" style="width:29mm;height:17mm;border-right-width:2px;">
							<div class="styFormNumber" style="font-size:8pt;">
								<span style="font-size:10pt;">SCHEDULE 1</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template><br />
								(Form 1040)
							</div>
							<br /><br />
							<div class="styAgency" style="padding-top:.5mm;font-size:7.5pt">Department of the Treasury<br/>
								Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:17mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:2mm;">Additional Income and Adjustments to Income</span>
							<br /><br />
							<span style="font-weight:bold;font-size:7.5pt">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>Attach to Form 1040, 1040-SR, or 1040-NR
							</span><br />
							<span style="font-weight:bold;font-size:7.5pt">
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>Go to
								<span style="font-style:italic">www.irs.gov/Form1040</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width: 29mm; height: 17mm;">
							<div class="styOMB" style="font-size:7pt; height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
								20<span class="styTYColor">21</span>
							</div>
							<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;font-size:7pt">
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">01</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;font-size:8pt">
						<div class="styNameBox" style="width:135mm;font-size:8pt">Name(s) shown on Form 1040 1040-SR, or 1040-NR
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;font-size:8pt">
							<strong>Your social security number</strong>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName" style="padding-top:.25mm;">Part I</div>
						<div class="styPartDesc" style="padding-top:.25mm;">Additional Income</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="font-size:8pt">
							Taxable refunds, credits, or offsets of state and local income taxes
							<span class="sty1040Sch1DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StateLocalIncomeTaxRefundAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2a -->
					<xsl:variable name="alimonyRec" select="count($FormData/AlimonyReceivedGrp) &gt; 1"/>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Alimony received
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 2a - Alimony Received Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AlimonyReceivedGrp/AlimonyReceivedAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAlimonyReceivedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="font-size:7.5pt">
							Date of original divorce or separation agreement (see instructions)
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							<span style="width:40mm;border-bottom:1px dashed black;text-align:center;">
								<xsl:if test="not($alimonyRec)">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/AlimonyReceivedGrp/DivorceOrSeparationAgreementDt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$alimonyRec">See Additional Data Table</xsl:if>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Business income or (loss). Attach Schedule C 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Other gains or (losses). Attach Form 4797 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 4 - Form 4684 Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt/@form4684Cd"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Rental real estate, royalties, partnerships, S corporations, trusts, etc. Attach Schedule E
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">..</span>
						</div>
						<div class="styLNRightNumBox">5</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Farm income or (loss). Attach Schedule F 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Unemployment compensation 
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 7 - Repayment Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 7 - Repayment Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">7</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Other income: 
						</div>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 8a -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">a</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Net operating loss
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">................</span>		
						</div>
						<div class="styLNRightNumBox">8a</div>
						<div class="styLNAmountBox">(
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
							</xsl:call-template>)						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 8b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">b</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Gambling income
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/GamblingReportableWinningAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">8b</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/GamblingReportableWinningAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>		
					<!-- Line 8c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">c</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Cancellation of debt
							<span class="sty1040Sch1DotLn">................</span>		
						</div>
						<div class="styLNRightNumBox">8c</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DebtCancellationAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>		
					<!-- Line 8d -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD" style="height:4.4mm;">d</div>
						<div class="styLNDesc" style="height:4.4mm;width:98mm;font-size:8pt">
							Foreign earned income exclusion from Form 2555
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">8d</div>
						<div class="styLNAmountBox" style="height:4.4mm;">(
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalIncomeExclusionAmt"/>
							</xsl:call-template>)						
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;">
						</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"></div>
					</div>		
					<!-- Line 8e -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">e</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Taxable Health Savings Account distribution
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalTaxableHSADistributionAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.......</span>		
						</div>
						<div class="styLNRightNumBox">8e</div>
						<div class="styLNAmountBox" >
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/TotalTaxableHSADistributionAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>																																								
					<!-- Line 8f -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">f</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Alaska Permanent Fund dividends
							<span class="sty1040Sch1DotLn">............</span>		
						</div>
						<div class="styLNRightNumBox">8f</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AlaskaPermanentFundDivAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 8g -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">g</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Jury duty pay
							<span class="sty1040Sch1DotLn">..................</span>		
						</div>
						<div class="styLNRightNumBox">8g</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/JuryDutyPayAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 8h -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">h</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Prizes and awards
							<span class="sty1040Sch1DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8h</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PrizesAwardsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"></div>
						<div class="styLNAmountBoxNBB" style="height:4mm"></div>
					</div>
					<!-- Line 8i -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">i</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Activity not engaged in for profit income
							<span class="sty1040Sch1DotLn">.........</span>		
						</div>
						<div class="styLNRightNumBox">8i</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ActivityNotForProfitIncmAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 8j -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">j</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Stock options
							<span class="sty1040Sch1DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8j</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StockOptionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"></div>
						<div class="styLNAmountBoxNBB" style="height:4mm"></div>
					</div>
					<!-- Line 8k -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD" style="padding-top:.8mm">k</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Income from the rental of personal property if you engaged in the <br/>rental for profit but were not in the business of renting such property
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">8k</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RentalIncomePersonalPropAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm"></div>
					</div>
					<!-- Line 8l -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">l</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Olympic and Paralympic medals and USOC prize money (see instructions)
							<span class="sty1040Sch1DotLn">..................</span>		
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">8l</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OlympicParalympicMedalUSOCAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm;"></div>
					</div>
					<!-- Line 8m -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">m</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Section 951(a) inclusion (see instructions)
							<span class="sty1040Sch1DotLn">.........</span>		
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8m</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section951aInclusionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
						<div class="styLNAmountBoxNBB" style="height:4mm;"></div>
					</div>
					<!-- Line 8n -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">n</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Section 951A(a) inclusion (see instructions)
							<span class="sty1040Sch1DotLn">........</span>		
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8n</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section951AaInclusionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
						<div class="styLNAmountBoxNBB" style="height:4mm;"></div>
					</div>
					<!-- Line 8o -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">o</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Section 461(l) excess business loss adjustment
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessBusinessLossAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">......</span>		
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8o</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessBusinessLossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
						<div class="styLNAmountBoxNBB" style="height:4mm;"></div>
					</div>
					<!-- Line 8p -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">p</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Taxable distributions from an ABLE account (see instructions)
							<span class="sty1040Sch1DotLn">..</span>		
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">8p</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxableABLEDistributionsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm;"></div>
						<div class="styLNAmountBoxNBB" style="height:4mm;"></div>
					</div>
					<!-- Line 8z -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">z</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Other income. List type and amount
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:.5mm"/>
							<span style="width:40mm;border-bottom:1px solid black;">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeTotalAmt"/>
							</xsl:call-template>	
							</span>
							<br/>
							<span style="width:95mm;border-bottom:1px solid black;"></span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">8z</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherIncomeTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:3.5mm">9</div>
						<div class="styLNDesc" style="font-size:8pt">
							Total other income. Add lines 8a through 8z
							<span class="sty1040Sch1DotLn">.................</span>
						</div>
						<div class="styLNRightNumBox">9</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">10</div>
						<div class="styLNDesc">
							Combine lines 1 through 7 and 9. Enter here and on Form 1040, 1040-SR, or 1040-NR, line 8
							<span class="sty1040Sch1DotLn">....</span>
						</div>
						<div class="styLNRightNumBoxNBB">10</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page 1 Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:1px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 71479F</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 1 (Form 1040) 2021
						</span>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;font-size:7pt;font-family:Verdana;">Schedule 1 (Form 1040) 2021
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt">2</span></div>
					</div>
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc" style="padding-top:.25mm;">Adjustments to Income</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="font-size:8pt">
							Educator expenses
							<span class="sty1040Sch1DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="height:7mm;font-size:7.1pt">
							Certain business expenses of reservists, performing artists, and fee-basis government officials. <br />Attach Form 2106
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />12</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Health savings account deduction. Attach Form 8889 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Moving expenses for members of the Armed Forces. Attach Form 3903
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 14 - Moving Expense Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseCd"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Deductible part of self-employment tax. Attach Schedule SE
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="font-size:8pt">
							Self-employed SEP, SIMPLE, and qualified plans
							<span class="sty1040Sch1DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldSepSimpleQlfyPlansAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="font-size:8pt">
							Self-employed health insurance deduction
							<span class="sty1040Sch1DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldHealthInsDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="font-size:8pt">
							Penalty on early withdrawal of savings
							<span class="sty1040Sch1DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PnltyOnErlyWthdrwOfSavingsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19a -->
					<xsl:variable name="alimonySep" select="count($FormData/AlimonyAmountGrp) &gt; 1"/>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19a</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Alimony paid
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 19a - Alimony Paid Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/AlimonyPaidAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">19a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAlimonyPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 19b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc" style="font-size:7.5pt">
							Recipient's SSN
							<span style="float:right;">
								<span class="sty1040Sch1DotLn" style="float:left;">...................
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
								</span>
								<span style="width:24mm;border-bottom:1px solid black;text-align:center;float:left;
									margin-right:2.5mm;">
									<xsl:if test="not($alimonySep)">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/RecipientSSN"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$alimonySep">See Add'l Data</xsl:if>
								</span>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 19c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc" style="font-size:7.5pt">
							Date of original divorce or separation agreement (see instructions)
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right arrow"/>
							<span style="width:40mm;border-bottom:1px dashed black;text-align:center;">
								<xsl:if test="not($alimonySep)">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/DivorceOrSeparationAgreementDt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$alimonySep">See Additional Data Table</xsl:if>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							IRA Deduction
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 20 - IRA deduction Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">...........................</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRADeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="font-size:8pt">
							Student loan interest deduction
							<span class="sty1040Sch1DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">21</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StudentLoanInterestDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="font-size:8pt">
							Reserved for future use
							<!--<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
							</xsl:call-template>-->
							<span class="sty1040Sch1DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">22</div>
						<div class="styLNAmountBox" style="background-color:lightgrey">
							<!--<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
							</xsl:call-template>-->
						</div>
					</div>
					<!-- Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="font-size:7.8pt">
							Archer MSA deduction
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/ArcherMSADeductionAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ArcherMSADeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:1mm">24</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Other adjustments: 
						</div>
						<div class="styLNRightNumBoxNBB"></div>
						<div class="styLNAmountBoxNBB"></div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 24a -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">a</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Jury duty pay (see instructions)
							<span class="sty1040Sch1DotLn">............</span>		
						</div>
						<div class="styLNRightNumBox">24a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/JuryDutyPayDeductionAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 24b -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">b</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Deductible expenses related to income reported on line 8k from the <br/>rental of personal property engaged in for profit
							<span class="sty1040Sch1DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">24b</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/RntlIncmPrsnlPropExpnssDedAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>		
					<!-- Line 24c -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">c</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Nontaxable amount of the value of Olympic and Paralympic medals and USOC prize money reported on line 8l
							<span class="sty1040Sch1DotLn">.........</span>		
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">24c</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OlympcPrlympcMedalUSOCDedAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm;"></div>
					</div>		
					<!-- Line 24d -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD" style="height:4.4mm;">d</div>
						<div class="styLNDesc" style="height:4.4mm;width:98mm;font-size:8pt">
							Reforestation amortization and expenses
							<span class="sty1040Sch1DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.4mm;">24d</div>
						<div class="styLNAmountBox" style="height:4.4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/RforAmortzExpnssDedAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.4mm;background-color:lightgrey;">
						</div>
						<div class="styLNAmountBoxNBB" style="height:4.4mm;"></div>
					</div>		
					<!-- Line 24e -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">e</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Repayment of supplemental unemployment benefits under the Trade Act of 1974
							<span class="sty1040Sch1DotLn">...................</span>		
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">24e</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode"
								select="$FormData/RepaymentSuppUnemplBnftDedAmt"/>
							</xsl:call-template>						
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm;"></div>
					</div>																																								
					<!-- Line 24f -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">f</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Contributions to section 501(c)(18)(D) pension plans
							<span class="sty1040Sch1DotLn">.....</span>		
						</div>
						<div class="styLNRightNumBox">24f</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Sect501c18DContriDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 24g -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">g</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Contributions by certain chaplains to section 403(b) plans
							<span class="sty1040Sch1DotLn">....</span>		
						</div>
						<div class="styLNRightNumBox">24g</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section403bContriDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;"></div>
						<div class="styLNAmountBoxNBB"></div>
					</div>
					<!-- Line 24h -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">h</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Attorney fees and court costs for actions involving certain unlawful <br/>discrimination claims (see instructions)
							<span class="sty1040Sch1DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">24h</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AttyFeesCrtCostsDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>
					<!-- Line 24i -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">i</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Attorney fees and court costs you paid in connection with an award <br/>from the IRS for information you provided that helped the IRS detect <br/>tax law violations
							<span class="sty1040Sch1DotLn">.................</span>		
						</div>
						<div class="styLNRightNumBox" style="height:12mm;padding-top:8mm">24i</div>
						<div class="styLNAmountBox" style="height:12mm;padding-top:8mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AttyFeesCrtCostsPdDedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:12mm"></div>
						<div class="styLNAmountBoxNBB" style="height:12mm"></div>
					</div>
					<!-- Line 24j -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">j</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Housing deduction from Form 2555
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/HousingDeductionAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">24j</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HousingDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4mm"></div>
						<div class="styLNAmountBoxNBB" style="height:4mm"></div>
					</div>
					<!-- Line 24k -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD" style="padding-top:.8mm">k</div>
						<div class="styLNDesc" style="width:98mm;font-size:7.8pt">
							Excess deductions of section 67(e) expenses from Schedule K-1 <br/>(Form 1041)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/Section67eExcessDeductionAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">..................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">24k</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/Section67eExcessDeductionAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm;"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm;padding-top:4mm"></div>
					</div>
					<!-- Line 24z -->
					<div class="styStdDiv">
						<div class="styLNLeftLtrBoxDD">z</div>
						<div class="styLNDesc" style="width:98mm;font-size:8pt">
							Other adjustments. List type and amount
							<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
							<span style="width:.5mm"/>
							<span style="width:32mm;border-bottom:1px solid black;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
								</xsl:call-template>	
							</span>
							<br/>
							<span style="width:95mm;border-bottom:1px solid black;"></span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">24z</div>
						<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:8mm"></div>
						<div class="styLNAmountBoxNBB" style="height:8mm"></div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="styLNDesc" style="height:4mm;font-size:7.8pt">
							Total other adjustments. Add lines 24a through 24z
							<span class="sty1040Sch1DotLn">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">25</div>
						<div class="styLNAmountBox" style="height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOtherAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="styLNDesc" style="height:7mm;font-size:7.1pt">
							Add lines 11 through 23 and 25. These are your <strong>adjustments to income. </strong> Enter here and on Form <br/>1040 or 1040-SR, line 10, or Form 1040-NR, line 10a
							<span class="sty1040Sch1DotLn">.................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />26</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 1 (Form 1040) 2021</span>
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
						<xsl:if test="not($alimonyRec)">
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Line 2a - Alimony Received Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AlimonyReceivedGrp/AlimonyReceivedAmt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 4 - Form 4684 Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt/@form4684Cd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 7 - Repayment Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 7 - Repayment Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 14 - Moving Expense Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseCd"/>
						</xsl:call-template>
						<xsl:if test="not($alimonySep)">
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Line 19a - Alimony Paid Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/AlimonyPaidAmt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 20 - IRA deduction Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
						</xsl:call-template>
					</table>
					<xsl:if test="$alimonyRec">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 2 - Alimony Received</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										<strong>(a)</strong><br /> Alimony Received Amount
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										<strong>(b)</strong><br /> Date of original divorce or separation agreement
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/AlimonyReceivedGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AlimonyReceivedAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DivorceOrSeparationAgreementDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="$alimonySep">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 19 - Alimony paid</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;width:120mm;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										<strong>(a)</strong><br /> Alimony amount paid
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										<strong>(b)</strong><br /> Recipient's SSN
									</th>
									<th class="styDepTblCell" scope="col" style="width:32mm;">
										<strong>(c)</strong><br /> Date of original divorce or separation agreement
									</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/AlimonyAmountGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellAmtInherit">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AlimonyPaidAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="RecipientSSN"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellCtrInherit">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DivorceOrSeparationAgreementDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br />
				</form>
			</body>
		</html>
	</xsl:template>	
</xsl:stylesheet>
