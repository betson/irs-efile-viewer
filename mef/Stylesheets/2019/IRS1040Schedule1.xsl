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
							<div class="styFormNumber" style="font-size:7pt;">
								<span style="font-size:10pt;">SCHEDULE 1</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData" />
								</xsl:call-template><br />
								(Form 1040 or 1040-SR)
							</div>
							<br /><br />
							<div class="styAgency" style="padding-top:.5mm;">Department of the Treasury<br/>
								Internal Revenue Service
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:17mm;">
							<span class="styFMT" style="font-size:11pt;padding-top:2mm;">Additional Income and Adjustments to Income</span>
							<br /><br />
							<span style="font-weight:bold;">
								&#9658;Attach to Form 1040 or 1040-SR.
							</span><br />
							<span style="font-weight:bold;">
								&#9658;Go to
								<span style="font-style:italic">www.irs.gov/Form1040</span>
								for instructions and the latest information.
							</span>
						</div>
						<div class="styTYBox" style="width: 29mm; height: 17mm;">
							<div class="styOMB" style="font-size:6pt; height: 4mm; padding-right: 1.5mm; padding-left: 1.5mm;">
								OMB No. 1545-0074
							</div>
							<div class="styTY" style="height: 6mm; line-height: 100%; font-size: 21pt;">
								20<span class="styTYColor">19</span>
							</div>
							<div style="text-align: left; padding-top: .3mm; padding-left: 3mm;">
								Attachment<br/> Sequence No. <span class="styBoldText" style="font-size:8pt">01</span>
							</div>
						</div>
					</div>
					<!-- Filer information section -->
					<div class="styStdDiv" style="border-top:2px solid black;">
						<div class="styNameBox" style="width:135mm;">Name(s) shown on Form 1040 or 1040-SR
							<br />
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styEINBox" style="width:52mm;padding-left:0.5mm;font-weight:normal;">
							<strong>Your social security number</strong>
							<br />
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part 1 -->
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">Additional Income</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc">
							Taxable refunds, credits, or offsets of state and local income taxes
							<span class="sty1040Sch1DotLn">.............</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StateLocalIncomeTaxRefundAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2a</div>
						<div class="styLNDesc">
							Alimony received
							<span class="sty1040Sch1DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AlimonyReceivedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Date of original divorce or separation agreement (see instructions) &#9658;
							<span style="width:40mm;border-bottom:1px dashed black;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/DivorceOrSeparationAgreementDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;">&nbsp;</div>
						<div class="styLNAmountBoxNBB">&nbsp;</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc">
							Business income or (loss). Attach Schedule C 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/BusinessIncomeLossAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">...................</span>
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
						<div class="styLNDesc">
							Other gains or (losses). Attach Form 4797 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 4 - Form 4684 Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherGainLossAmt/@form4684Cd"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">...................</span>
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
						<div class="styLNDesc">
							Rental real estate, royalties, partnerships, S corporations, trusts, etc. Attach Schedule E
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/RentalRealEstateIncomeLossAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.....</span>
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
						<div class="styLNDesc">
							Farm income or (loss). Attach Schedule F 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/NetFarmProfitLossAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">....................</span>
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
						<div class="styLNDesc">
							Unemployment compensation 
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 7 - Repayment Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 7 - Repayment Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/UnemploymentCompAmt/@repaymentAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.......................</span>
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
						<div class="styLNDesc" style="height:auto;">
							Other income. List type and amount &#9658;
							<span style="width:86.5mm;border-bottom:1px dashed black;text-align:left;">&nbsp;
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
								</xsl:call-template>
								<xsl:call-template name="LinkToLeftoverCheckboxDataTableInline">
									<xsl:with-param name="Desc">Line 8 - Protective Section 108(i) ELC Record Indicator</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
								</xsl:call-template>
							</span>
							<br />
							<span style="width:136mm;border-bottom:1px dashed black;">&nbsp;</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;"><br />8</div>
						<div class="styLNAmountBox" style="height:8mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOtherIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="styLNDesc">
							Combine lines 1 through 8. Enter here and on Form 1040 or 1040-SR, line 7a
							<span class="sty1040Sch1DotLn">.........</span>
						</div>
						<div class="styLNRightNumBoxNBB">9</div>
						<div class="styLNAmountBoxNBB">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAdditionalIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part 2 -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Adjustments to Income</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="styLNDesc">
							Educator expenses
							<span class="sty1040Sch1DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">10</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/EducatorExpensesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="height:7mm;">
							Certain business expenses of reservists, performing artists, and fee-basis government officials. Attach <br /> Form 2106
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;"><br />11</div>
						<div class="styLNAmountBox" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/BusExpnsReservistsAndOthersAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc">
							Health savings account deduction. Attach Form 8889 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">................</span>
						</div>
						<div class="styLNRightNumBox">12</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HealthSavingsAccountDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc">
							Moving expenses for members of the Armed Forces. Attach Form 3903
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 13 - Moving Expense Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseCd"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox">13</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc">
							Deductible part of self-employment tax. Attach Schedule SE
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">..............</span>
						</div>
						<div class="styLNRightNumBox">14</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/DeductibleSelfEmploymentTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc">
							Self-employed SEP, SIMPLE, and qualified plans
							<span class="sty1040Sch1DotLn">...................</span>
						</div>
						<div class="styLNRightNumBox">15</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldSepSimpleQlfyPlansAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc">
							Self-employed health insurance deduction
							<span class="sty1040Sch1DotLn">.....................</span>
						</div>
						<div class="styLNRightNumBox">16</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SelfEmpldHealthInsDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc">
							Penalty on early withdrawal of savings
							<span class="sty1040Sch1DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PnltyOnErlyWthdrwOfSavingsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18a -->
					<xsl:variable name="alimonySep" select="count($FormData/AlimonyAmountGrp) &gt; 1"/>
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18a</div>
						<div class="styLNDesc">
							Alimony paid
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 18a - Alimony Paid Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/AlimonyPaidAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.............................</span>
						</div>
						<div class="styLNRightNumBox">18a</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAlimonyPaidAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 18b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="styLNDesc">
							Recipient's SSN
							<span style="float:right;">
								<span class="sty1040Sch1DotLn" style="float:left;">.....................&#9658;</span>
								<span style="width:24mm;border-bottom:1px solid black;text-align:center;float:left;margin-right:2.5mm;">
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
					<!-- Line 18c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">c</div>
						<div class="styLNDesc">
							Date of original divorce or separation agreement (see instructions) &#9658;
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
					<!-- Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc">
							IRA Deduction
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 19 - IRA deduction Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">............................</span>
						</div>
						<div class="styLNRightNumBox">19</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRADeductionAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc">
							Student loan interest deduction
							<span class="sty1040Sch1DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox">20</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/StudentLoanInterestDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc">
							Reserved for future use
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox">21</div>
						<div class="styLNAmountBox">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TuitionAndFeesDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 22 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="height:7mm;">
							Add lines 10 through 21. These are your <strong>adjustments to income. </strong> Enter here and on Form 1040 or <br /> 1040-SR, line 8a
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 22 - Other Adjustments Total Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
							</xsl:call-template>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
							</xsl:call-template>
							<span class="sty1040Sch1DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;"><br />22</div>
						<div class="styLNAmountBoxNBB" style="height:7mm;"><br />
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Form footer-->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<span style="font-weight:bold;font-family:Arial;">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
						<span style="margin-left:16mm;font-size:6.5pt;">Cat. No. 71479F</span>
						<span style="float:right;font-weight:bold;font-size:6.5pt;">Schedule 1 (Form 1040 or 1040-SR) 2019</span>
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
							<xsl:with-param name="Desc">Line 8 - Protective Section 108(i) ELC Record Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ProtectiveSec108iELCRecordInd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 13 - Moving Expense Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/MovingExpenseCd"/>
						</xsl:call-template>
						<xsl:if test="not($alimonySep)">
							<xsl:call-template name="PopulateLeftoverRowAmount">
								<xsl:with-param name="Desc">Line 18a - Alimony Paid Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AlimonyAmountGrp/AlimonyPaidAmt"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 19 - IRA deduction Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRADeductionCd"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Line 22 - Other Adjustments Total Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/OtherAdjustmentsTotalAmt"/>
						</xsl:call-template>
					</table>
					<xsl:if test="$alimonySep">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 18 - Alimony paid</span>
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
