<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS6251Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS6251"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 6251"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS6251Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form6251">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:1.5px;">
						<div class="styFNBox" style="width:28mm;height:20mm;padding:bottom:0mm;border-right-width:1.5px;">
                         Form<span style="width:1mm;"/>
							<span class="styFormNumber">6251</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<div class="styAgency" style="padding-top:2mm;padding:bottom:0mm;">
								Department of the Treasury<br/>
								Internal Revenue Service (99)
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:20mm;">
							<div class="styMainTitle" style="height:5mm;padding-bottom:0mm;">
								Alternative Minimum Tax&#8212;Individuals
						    </div>
							<div class="styFBT" style="font-size:7pt;height:5mm;padding-top:7mm;">
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Information about Form 6251 and its separate instructions is at 	
							 <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form6251" title="Link to IRS.gov">
									<i>www.irs.gov/form6251.</i>
								</a>
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040 or Form 1040NR.
						  </div>
						</div>
						<div class="styTYBox" style="width:31mm;height:20mm;border-left-width:1.5px;">
							<div class="styOMB" style="width:30mm;height:4mm;border-bottom:1 solid black;font:7pt;">OMB No. 1545-0074</div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">14</span>
								</span>
							</div>
							<div class="stySequence" style="padding-top:1mm;">Attachment<br/>Sequence No. <b style="font-size:8pt">32</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm;height:9mm;padding-left:0mm;padding-top:.25mm;">
							Name(s) shown on Form 1040 or Form 1040NR
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:if test="$RtnHdrData/Filer/EstateOrTrustName">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EstateOrTrustName</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="line-height:100%;padding: .25mm 0mm 0mm 1.5mm;">
							<b>Your social security number</b>
							<br/>
							<span style="padding: .5mm 0mm 0mm .25mm;">
								<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
							</span>
						</div>
					</div>
					<!-- Part l -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;padding-top:0mm;">
						<div class="styPartName" style="height:4mm;font-size:8.5pt;">Part I</div>
						<div class="styPartDesc" style="width:167mm;font-size:8.5pt;font-weight:normal;padding-left:2mm;vertical-align:center;">
							<b>Alternative Minimum Taxable Income</b> (See instructions for how to complete each line.)
						</div>
					</div>
					<!-- End Part I Header -->
					<!-- Part I body -->
					<div style="width:187mm;border-bottom:1px solid black;float:left;">
						<!-- Line 1 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">1
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								 If filing Schedule A (Form 1040), enter the amount from Form 1040, line 41, and go to line 2.
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								 Otherwise, enter the amount from Form 1040, line 38, and go to line 7. (If less than zero, enter as a
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
                negative amount.)
                </span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">1</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AGIOrAGILessDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">2
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
                 Medical and dental. If you or your spouse was 65 or older, enter the <b>smaller</b> of Schedule A (Form
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">
                1040), line 4, <b>or</b> 2.5% (.025) of Form 1040, line 38. If zero or less, enter -0-
                </span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:1px;">2</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmllrOfSchAMedDedOrCalAGIAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 3 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">3
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Taxes from Schedule A (Form 1040), line 9</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">3</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ScheduleATaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">4
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
              Enter the home mortgage interest adjustment, if any, from line 6 of the worksheet in the instructions
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">for this line</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">4</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CertainHomeMortgageInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">5
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Miscellaneous deductions from Schedule A (Form 1040), line 27</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">5</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SchANetMiscellaneousDedsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">6
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">If Form 1040, line 38, is $152,525 or less, enter -0-. Otherwise, see instructions</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">6</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$FormData/ItemizedDedWorksheetAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4.25mm;padding-bottom:0mm;padding-left: 4.1mm">7
              </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4.25mm;padding-bottom:0mm;">
								<span style="float:left">Tax refund from Form 1040, line 10 or line 21</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.................</span>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRefundReceivedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.25mm;padding-top:.75mm;padding-bottom:0mm;bottom-border-width:1px;">7</div>
							<div class="styLNAmountBox" style="width:36mm;height:4.25mm;padding-top:.75mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$FormData/TotalRefundReceivedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 8 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">8
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Investment interest expense (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">8</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/InvestmentInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4.1mm">9
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Depletion (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">9</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DepletionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">10
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Net operating loss deduction from Form 1040, line 21. Enter as a positive amount</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">10</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetOperatingLossDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">11
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Alternative tax net operating loss deduction</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">11</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$FormData/AltTaxNetOperatingLossDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 12 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">12
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Interest from specified private activity bonds exempt from the regular tax</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">12</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExemptPrivateActivityBondsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">13
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Qualified small business stock (7% of gain excluded under section 1202)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">13</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/Section1202ExclusionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">14
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Exercise of incentive stock options (excess of AMT income over regular tax income)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">14</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncentiveStockOptionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">15
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Estates and trusts (amount from Schedule K-1 (Form 1041), box 12, code A)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">15</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EstatesAndTrustsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 16 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">16
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Electing large partnerships (amount from Schedule K-1 (Form 1065-B), box 6)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">16</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LargePartnershipAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">17
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Disposition of property (difference between AMT and regular tax gain or loss)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">17</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PropertyDispositionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 18 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">18
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Depreciation on assets placed in service after 1986 (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">18</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/DepreciationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 19 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">19
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Passive activities (difference between AMT and regular tax income or loss)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">19</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PassiveActivityAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">20
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Loss limitations (difference between AMT and regular tax income or loss)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">20</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LossLimitationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">21
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Circulation costs (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">21</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CirculationCostAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 22 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">22
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Long-term contracts (difference between AMT and regular tax income)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">22</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LongTermContractAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 23 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">23
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Mining costs (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">23</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MiningCostsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 24 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">24
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Research and experimental costs (difference between regular tax and AMT)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">24</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ResearchExperimentalCostAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 25 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">25
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Income from certain installment sales before January 1, 1987</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">25</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateNegativeNumber">
									<xsl:with-param name="TargetNode" select="$FormData/InstallmentSaleIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 26 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">26
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Intangible drilling costs preference</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">26</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IntangibleDrillingCostAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 27 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">27
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">Other adjustments, including income-based related adjustments</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">27</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/RelatedAdjustmentAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 28 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">28
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<b>Alternative minimum taxable income.</b> Combine lines 1 through 27. (If married filing separately, and
                            </div>
							<div class="styLNRightNumBox" style="height:4mm; padding-bottom:0mm; border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">
                            </div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
								<span style="float:left">line 28 is more than $242,450, see instructions.)</span>
								<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
									<xsl:with-param name="Desc">Line 28 - Residual Interest In REMIC Code</xsl:with-param>
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt/@residualInterestInREMICCd"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none">28</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Part ll -->
					<!-- Part Il - Header -->
					<div style="width:187mm;height:4.55mm;padding-top:0mm;border-top:1.2px solid black;border-bottom:1px solid black;float:left;">
						<div class="styPartName" style="height:4.25mm;font-size:8.5pt;">Part II</div>
						<div class="styPartDesc" style="width:167mm;font-size:8.5pt;font-weight:normal;padding-left:2mm;vertical-align:center;">
							<b>Alternative Minimum Tax (AMT)</b>
						</div>
					</div>
					<!-- END Part ll Header-->
					<!-- Line 29 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-bottom:0mm;padding-left: 2.25mm;font-size:7pt;">29</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;font-size:7pt;">
							Exemption. (If you were under age 24 at the end of 2014, see instructions.)
					    </div>
						<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;padding-bottom:0mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
					</div>
					<div style="width:187mm;">
						<div style="float:left;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:21mm;padding-left: 2.25mm"/>
						</div>
						<div style="float:left;font-size:7pt;width:127mm;height:21mm;padding-top:.5mm;">
 							<span style="font-weight:bold;">
								<span class="styLNDesc" style="font-size:7pt;width:56mm;height:4mm;">
									IF your filing status is...
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:37mm;height:4mm;">
									AND line 28 is not over...
							    </span>
								<span class="styLNDesc" style="font-size:7pt;width:34mm;height:4mm;">
									THEN enter on line 29...
								</span>
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:56mm;height:4mm;">
									Single or head of household<span style="letter-spacing:3mm;font-weight:bold;padding-left:3mm;">....</span>
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:37mm;height:4mm;">
									$117,300<span style="letter-spacing:3mm;font-weight:bold;padding-left:3mm;">.....</span>
							    </span>
								<span class="styLNDesc" style="font-size:7pt;width:34mm;height:4mm;padding-left:1.5mm;">
									 $52,800 
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:56mm;height:4mm;">
									Married filing jointly or qualifying widow(er)
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:37mm;height:4mm;padding-left:1.5mm;">
									156,500<span style="letter-spacing:3mm;font-weight:bold;padding-left:3mm;">.....</span>
							    </span>
								<span class="styLNDesc" style="font-size:7pt;width:34mm;height:4mm;padding-left:3mm;">
									82,100
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:56mm;height:4mm;">
									Married filing separately<span style="letter-spacing:3mm;font-weight:bold;padding-left:3mm;">.....</span>
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:37mm;height:4mm;padding-left:3mm;">
									78,250<span style="letter-spacing:3mm;font-weight:bold;padding-left:3mm;">.....</span>
							    </span>
								<span class="styLNDesc" style="font-size:7pt;width:34mm;height:4mm;padding-left:3mm;">
									41,050
								</span>
								<span class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;">
									If line 28 is <b>over</b> the amount shown above for your filing status, see instructions.
								</span>
						</div>
						<div style="float:left;width:3mm;height:13mm;padding-top:5mm;padding-right:1mm;">
							<img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_sm.gif"/>
						</div>
						<div style="float:left;width:5mm;padding-top:10mm;padding-right:2mm;">
							<span style="letter-spacing:3mm;font-weight:bold;">..</span>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;height:14mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:36mm;height:14mm;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;padding-top:.5mm;padding-bottom:0mm;">29</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxExemptAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:right;">						
							<div class="styLNRightNumBox" style="height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;height:3mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
					</div>
					<!-- Line 30 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0;padding-left: 2.25mm">30</div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							 Subtract line 29 from line 28. If more than zero, go to line 31. If zero or less, enter -0- here and on
                        </div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm; border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom-width:0px;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left"> lines 31, 33 and 35, and go to line 34</span>
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">....................</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Line 30 - RPI Special Processing Code</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt/@rPISpecialProcessingCd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;">30</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 31 -->
					<div style="width:187mm;">
						<div style="float:left;">
							<div class="styLNLeftNumBox" style="font-size:7pt;height:22mm;padding-left: 2.25mm">31</div>
						</div>
						<div style="float:left;font-size:7pt;width:125mm;height:26mm;padding-top:.5mm;">
 							<li style="margin-left:3.5mm;">If you are filing Form 2555 or 2555-EZ, see instructions for the amount to enter.</li>
							<li style="margin-left:3.5mm;">If you reported capital gain distributions directly on Form 1040, line 13; you reported qualified dividends on Form 1040, line 9b; <b>or</b> you had a gain on both      
							 lines 15 and 16 of Schedule D (Form 1040) (as refigured for the AMT, if necessary), complete Part III on the back and enter the amount from line 64 here.<br/></li>
							<li style="margin-left:3.5mm;"><b>All others:</b> If line 30 is $182,500 or less ($91,250 or less if married filing separately), multiply line 30 by 26% (.26). Otherwise, multiply line 30 by 28% (.28) 
							  and subtract $3,650 ($1,825 if married filing separately) from the result.</li>
						</div>
						<div style="float:left;width:5mm;height:26mm;padding-top:4mm;">
							<img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_lg.gif"/>
						</div>
						<div style="float:left;width:5mm;height:26mm;padding-top:11mm;">
							<span style="letter-spacing:3mm;font-weight:bold;">..</span>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="border-bottom-width:0px;height:10mm;background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="width:36mm;height:10mm;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;padding-top:.5mm;padding-bottom:0mm;">31</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxOnAltMinTaxableIncAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:right;">							
							<div class="styLNRightNumBox" style="clear:left;height:12mm;background-color:lightgrey;border-bottom-width:0px"/>
							<div class="styLNAmountBoxNBB" style="width:36mm;height:12mm;"/>
						</div>						
					</div>
					<!-- Line 32 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">32</div>
						<div class="styLNDesc" style="font-size:7pt;width:134.9mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Alternative minimum tax foreign tax credit (see instructions)</span>
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>
						</div>
						<div style="float:right;">						
						<div class="styLNRightNumBox" style="clear:left;height:4mm;padding-bottom:0mm;bottom-border-width:0px;">32</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AMTForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>						
					</div>
					<!-- Line 33 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">33
					</div>
						<div class="styLNDesc" style="font-size:7pt;width:134.9mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Tentative minimum tax. Subtract line 32 from line 31</span>
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
						</div>
						<div style="float:right;">							
						<div class="styLNRightNumBox" style="clear:left;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">33</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TentativeAlternativeMinTaxAmt"/>
							</xsl:call-template>
						</div>
						</div>						
					</div>
					<!-- Line 34 -->
					<div style="width:187mm;height:10mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:11mm;padding-left:2.25mm;width:8mm;">34</div>
						<div class="styLNDesc" style="font-size:7pt;width:134.9mm;height:11mm;float:left;">
							 Add Form 1040 line 44 (minus any tax from Form 4972) and line 46. Subtract from the result any<br/> 
							 foreign tax credit from Form 1040, line 48. If you used Schedule J to figure your tax on Form 1040,<br/>
							 line 44, refigure that tax without using Schedule J before entering it on this line (see instructions)
						  <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:1mm;">..</span>
						</div>
						<div style="float:right;">							
						<div class="styLNRightNumBox" style="clear:left;height:7mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
						<div class="styLNAmountBox" style="height:7mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						<div class="styLNRightNumBox" style="clear:left;width:8mm;height:4mm;padding-top:1mm;padding-bottom:0mm;">34</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-top:1mm;padding-bottom:0mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjustedRegularTaxAmt"/>
							</xsl:call-template>
						</div>
						</div>
					</div>
					<!-- Line 35 -->
					<div style="width:187mm;height:5mm;border-bottom:1.5px solid black;">
						<div class="styLNLeftNumBox" style="height:4.5mm;font-size:7pt;padding-bottom:0mm;padding-left: 2.25mm">35</div>
						<div class="styLNDesc" style="height:4.5mm;font-size:7pt;width:134.9mm;padding-bottom:0mm;">
							<span style="float:left">
								<b>AMT.</b> Subtract line 34 from line 33. If zero or less, enter -0-. Enter here and on Form 1040, line 45</span>
						</div>
						<div style="float:right;">							
						<div class="styLNRightNumBox" style="clear:left;height:5mm;padding-top:1.25mm;padding-bottom:0mm;border-bottom:none;">35</div>
						<div class="styLNAmountBox" style="width:36mm;height:5mm;padding-top:1.25mm;padding-bottom:0mm;border-bottom:none;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>	
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
							<span style="width:13mm;"/>                        
							  Cat. No. 13600G
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
								  Form <span class="styBoldText" style="font-size:8pt;">6251</span> (2014)
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!--Begin Page 2 -->
					<!-- Page Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 6251 (2014)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Part IlI - Header -->
					<div style="width:187mm;height:8.5mm;border-bottom:1px solid black;border-top:1px solid black;float:left;">
						<div class="styPartName" style="height:4mm;font-size:8.5pt;">Part III</div>
						<div class="styPartDesc" style="width:167mm;font-size:8.5pt;font-weight:normal;padding-left:2mm;vertical-align:center;">
							<b>Tax Computation Using Maximum Capital Gains Rates</b>
							<br/>
							<span style="font-size:7.5pt;font-family:arial;">
							 Complete Part III only if you are required to do so by line 31 or by the Foreign Earned Income Tax Worksheet in the instructions.
					  </span>
						</div>
					</div>
					<!-- END Part llI Header-->
					<!-- Line 36 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">36</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the amount from Form 6251, line 30. If you are filing Form 2555 or 2555-EZ, enter the amount<br/>
						from line 3 of the worksheet in the instructions for line 31
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:4mm;padding-bottom:0mm;border-bottom:1px solid black;">36</div>
						<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-top:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ReportedAltMinTaxableIncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 37 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1.25mm;padding-bottom:0mm;padding-left:2.25mm;">37</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-top:1mm;padding-bottom:0mm;">
					  Enter the amount from line 6 of the Qualified Dividends and Capital Gain Tax Worksheet in the<br/>
					  instructions for Form 1040, line 44, or the amount from line 13 of the Schedule D Tax Worksheet in<br/>
     				  the instructions for Schedule D (Form 1040), whichever applies (as refigured for the AMT,<br/>
     				  if necessary) (see instructions). If you are filing Form 2555 or 2555-EZ, see instructions for the<br/>
     				  amount to enter 
					<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:17mm;padding-top:14mm;padding-bottom:0mm;border-bottom:1px solid black;">37</div>
						<div class="styLNAmountBox" style="width:36mm;height:17mm;padding-top:14mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CapitalGainsWorksheetAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 38 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:.5mm;padding-bottom:0mm;padding-left:2.25mm;">38</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;">
					  Enter the amount from Schedule D (Form 1040), line 19 (as refigured for the AMT, if necessary)<br/>
					  (see instructions). If you are filing Form 2555 or 2555-EZ, see instructions for the amount to enter
					</div>
						<div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;padding-bottom:0mm;border-bottom:1px solid black;">38</div>
						<div class="styLNAmountBox" style="width:36mm;height:7.5mm;padding-top:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/UnrecapturedSection1250GainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 39 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:1.25mm;padding-bottom:0mm;padding-left:2.25mm;">39</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-top:1mm;padding-bottom:0mm;">
					  If you did not complete a Schedule D Tax Worksheet for the regular tax or the AMT, enter the amount<br/>
					  from line 37. Otherwise, add lines 37 and 38, and enter the <b>smaller</b> of that result or the amount from<br/> 
     				  line 10 of the Schedule D Tax Worksheet (as refigured for the AMT, if necessary). If you are filing<br/>
     				  Form 2555 or 2555-EZ, see instructions for the amount to enter 
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:13.5mm;padding-top:10.5mm;padding-bottom:0mm;border-bottom:1px solid black;">39</div>
						<div class="styLNAmountBox" style="width:36mm;height:13.5mm;padding-top:10.5mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumPlusUnrecapturedSect1250Amt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 40 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">40</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the <b>smaller</b> of line 36 or line 39
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">40</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerOfAltMinTxblIncOrSumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 41 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">41</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Subtract line 40 from line 36
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">41</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AdjAltMinTaxableIncLessGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 42 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">42</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						 If line 41 is $182,500 or less ($91,250 or less if married filing separately), multiply line 41 by 26%<br/>
						(.26). Otherwise, multiply line 41 by 28% (.28) and subtract $3,650 ($1,825 if married filing<br/>
						separately) from the result 
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:1mm;">.......................</span>
							<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:7mm;padding-bottom:0mm;border-bottom:1px solid black;">42</div>
						<div class="styLNAmountBox" style="width:36mm;height:10mm;padding-top:7mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAdjAltMinTxblIncTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 43 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:17mm;font-size:7pt;padding-left: 2.25mm;padding-top:1mm;">43</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-top:1mm;">
								<span style="float:right;text-align:right;letter-spacing:3.3mm;font-weight:bold;margin-top:8mm;margin-left:1mm;margin-right:2mm;padding-left:1mm;">.......</span>
								<img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_sm.gif" style="float:right;clear:none;margin-top:2mm;"/>
								  Enter:<br/>
								<li style="margin-left:3.5mm;">$73,800 if married filing jointly or qualifying widow(er),</li>
 								<li style="margin-left:3.5mm;">$36,900 if single or married filing separately, or</li>
								<li style="margin-left:3.5mm;">$49,400 if head of household.</li>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:8mm;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-top:1mm;padding-bottom:0mm;">43</div>
							<div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;clear:left;"/>							
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:8mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-top:1mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FilingStatusLimitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:left;">						
							<div class="styLNAmountBox" style="height:5mm;padding:0mm;border-bottom:0;clear:left;"/>	
						</div>							
					</div>
					<!-- Line 44 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-top:0mm;padding-bottom:0mm;padding-left:2.25mm;">44</div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-top:0mm;padding-bottom:0mm;">
					  Enter the amount from line 7 of the Qualified Dividends and Capital Gain Tax Worksheet in the<br/> 
					  instructions for Form 1040, line 44, or the amount from line 14 of the Schedule D Tax Worksheet<br/>  
					  in the instructions for Schedule D (Form 1040), whichever applies (as figured for the regular tax).<br/> 
					  If you did not complete either worksheet for the regular tax, enter the amount from Form 1040, <br/> 
					  line 43; if zero or less, enter -0-. If you are filing Form 2555 or 2555-EZ, see instructions for the <br/>
					  amount to enter
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:0mm;">............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:19mm;padding-top:16mm;padding-bottom:0mm;border-bottom:1px solid black;">44</div>
						<div class="styLNAmountBox" style="width:36mm;height:19mm;padding-top:16mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeAboveThresholdWorkshtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 45 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">45</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Subtract line 44 from line 43. If zero or less, enter -0-
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">45</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FSAmtLessIncAboveThresholdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 46 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">46</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the <b>smaller</b> of line 36 or line 37
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">46</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrOfAdjustedAltMinOrSchDAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 47 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">47</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the <b>smaller</b> of line 45 or line 46. This amount is taxed at 0%
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">47</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrAbvThrshldOrAltMinGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 48 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">48</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Subtract line 47 from line 46
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">48</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrNetAdjAltMinOrNetGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 49 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:17mm;font-size:7pt;padding-left: 2.25mm">49</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;">
								<span style="float:right;text-align:right;letter-spacing:3.3mm;font-weight:bold;margin-top:8mm;margin-left:1mm;margin-right:2mm;padding-left:1mm;">.......</span>
								<img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_sm.gif" style="float:right;clear:none;margin-top:2mm;"/>
									 Enter:<br/>
								<li style="margin-left:3.5mm;">$406,750 if single</li>
								<li style="margin-left:3.5mm;">$228,800 if married filing separately</li>
								<li style="margin-left:3.5mm;">$457,600 if married filing jointly or qualifying widow(er)</li>
								<li style="margin-left:3.5mm;">$432,200 if head of household</li>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:7mm;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNRightNumBox" style="height:5mm;clear:left;padding-top:1.5mm;padding-bottom:0mm;">49</div>
							<div class="styLNRightNumBox" style="height:5mm;padding:0mm;border-bottom:0;clear:left;"/>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:7mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:36mm;padding-top:1.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FilingThresholdAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="float:left;">	
							<div class="styLNAmountBox" style="height:5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;clear:left;"/>
						</div>
					</div>
					<!-- Line 50 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">50</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Enter the amount from line 45
							<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4.25mm;padding-top:.75mm;padding-bottom:0mm;border-bottom:1px solid black;">50</div>
						<div class="styLNAmountBox" style="width:36mm;height:4.25mm;padding-top:.75mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FSAmtLessIncAboveThresholdAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 51 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:2mm;padding-bottom:0mm;padding-left:2.25mm;">51</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-top:2mm;padding-bottom:0mm;">
						Enter the amount from line 7 of the Qualified Dividends and Capital Gain Tax Worksheet in the<br/> 
						instructions for Form 1040, line 44, or the amount from line 19 of the Schedule D Tax Worksheet,<br/>
						whichever applies (as figured for the regular tax). If you did not complete either worksheet for the<br/>
						regular tax, enter the amount from Form 1040, line 43; if zero or less, enter -0-. If you are <br/>
						filing Form 2555 or Form 2555-EZ, see instructions for the amount to enter
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:18mm;padding-top:14.5mm;padding-bottom:0mm;border-bottom:1px solid black;">51</div>
						<div class="styLNAmountBox" style="width:36mm;height:18mm;padding-top:14.5mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ApplcblCapGainsOrSchDWrkshtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 52 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">52</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Add line 50 and line 51
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">52</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumThresholdApplcblWrkshtAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 53 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">53</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Subtract line 52 from line 49. If zero or less, enter -0-
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">53</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/FlngThrshldLessThesholdSumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 54 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">54</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Enter the smaller of line 48 or line 53
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">54</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrAdjNetGainOrTxblIncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 55-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">55</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Multiply line 54 by 15% (.15)
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:1mm;">......................</span>
							<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">55</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAltMinTaxableIncTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 56 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">56</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Add lines 47 and 54
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">56</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumOfSmllrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-weight:bold;font-size:6.75pt;width:135mm;height:4mm;padding-bottom:0mm;">
						If lines 56 and 36 are the same, skip lines 57 through 61 and go to line 62. Otherwise, go to line 57.
					</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
					</div>
					</div>
					<!-- Line 57 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">57</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Subtract line 56 from line 46
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">57</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessOfSumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 58 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">58</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
							Multiply line 57 by 20% (.20)
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:1mm;">......................</span>
							<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">58</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/ExcessOfSumTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-weight:bold;font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
					 If line 38 is zero or blank, skip lines 59 through 61 and go to line 62. Otherwise, go to line 59.
                </div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
                </div>
					</div>
					<!-- Line 59 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">59</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Add lines 41, 56, and 57
			<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">59</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalNetAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 60 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">60</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Subtract line 59 from line 36
			<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">60</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSmallerSchDOrAdjNetGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 61 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">61</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Multiply line 60 by 25% (.25)
			<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;padding-right:1mm;">......................</span>
							<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">61</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetSchDOrAdjNetGainTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 62 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">62</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Add lines 42, 55, 58, and 61
			<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">62</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SumOfAltMinTaxPercentagesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 63 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">63</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						If line 36 is $182,500 or less ($91,250 or less if married filing separately), multiply line 36 by 26% <br/>
						(.26). Otherwise, multiply line 36 by 28% (.28) and subtract $3,650 ($1,825 if married filing<br/>
						separately) from the result
			<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:6.5mm;padding-bottom:0mm;border-bottom:1px solid black;">63</div>
						<div class="styLNAmountBox" style="width:36mm;height:10mm;padding-top:6.5mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAltMinTxblIncTimesFSPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 64 -->
					<div style="width:187mm;border-bottom:1.5px black solid">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">64</div>
						<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;">
						Enter the <b>smaller</b> of line 62 or line 63 here and on line 31. If you are filing Form 2555 or 2555-EZ, <br/>
						do not enter this amount on line 31. Instead, enter it on line 4 of the worksheet in the instructions for<br/>
						line 31
			<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">..............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:10mm;padding-top:7mm;padding-bottom:0mm;border-bottom:none;">64</div>
						<div class="styLNAmountBox" style="width:36mm;height:10mm;padding-top:7mm;padding-bottom:0mm;border-bottom:none;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TaxOnAlternativeMinimumGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div style="width:187mm;text-align:right;margin-top:.5mm;">
          Form <span class="styBoldText" style="font-size:8pt;">6251</span> (2014)
          </div>
					<!-- END Page Break and Footer-->
					<div class="pageEnd"/>
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
              Additional Data        
            </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part I, Line 28 - Residual Interest In REMIC Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/AlternativeMinTaxableIncomeAmt/@residualInterestInREMICCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 30 - RPI Special Processing Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/AdjAlternativeMinTaxableIncAmt/@rPISpecialProcessingCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
