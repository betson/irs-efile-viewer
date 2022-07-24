<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 04/26/2021 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040NRScheduleNECStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1040NRScheduleNEC"/>
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
				<meta name="Description" content="IRS Form 1040NRScheduleNEC"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040NRScheduleNECStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form1040NRScheduleNEC">
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!-- Page 1 -->
					<div class="styStdDiv"
					   style="display:inline;width:256mm;">
						<!-- Header -->
						<div class="styStdDivLS">
							<div class="styTBB" style="height:20mm;
								border-bottom-width:1.5px">
								<div class="styFNBox" style="width:51mm;height:20mm;
									border-right-width:1.5px">
									<div style="height:8mm;">
										<!-- Ampersand code (&#38;)-->
										<span class="styFormNumber" style="font-size:9pt">
											SCHEDULE NEC
										</span>
										<br/>
										<span class="styFormNumber" style="font-size:9pt">
											(Form 1040-NR)
										</span>
									</div> 
									<br/><br/>
									<div style="height:6mm;padding-top:.1mm;">
										<span class="styAgency">Department of the Treasury
										</span>
										<span class="styAgency" style="width:51mm;">Internal Revenue Service (99)
											<span style="padding-left:0.2mm;"></span>
										</span>
									</div>
								</div>         
								<div class="styFTBox" style="width:149.5mm;height:20mm;">
									<div class="styMainTitle">
										Tax on Income Not Effectively Connected With a U.S. Trade or Business
									</div>
									<div class="styFBT" style="width:149.5mm;font-size:7pt;
										margin-top:.5mm;font-weight:normal">         
										<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/>
										<b>Go to <a style="text-decoration:none;color:black;" 
											href="www.irs.gov/Form1040NR " title="Link to IRS.gov">
											<i>www.irs.gov/Form1040NR </i>
										</a> for instructions and the latest information.</b><br/>
										<span style="padding-top:.5mm;">
											<img src="{$ImagePath}/1040SchA_Bullet.gif" alt="SmallBullet Image"/> <b>Attach to Form 1040-NR.</b>
										</span>    
									</div>
								</div>           
								<div class="styTYBox" style="width:55mm;height:19.5mm;
									border-left-width:1.5px">
									<br/>
									<div class="styOMB" style="height:2mm;padding-top:0mm;
										padding-left:3mm;line-height: 0px;">
										OMB No. 1545-0074
									</div>
									<div class="styTY" style="height:6mm;font-size:18pt;
										padding-top:0mm;padding-bottom:0mm;
										line-height:100%;	padding-left:0mm">
										20<span class="styTYColor">21</span>
									</div>
									<div class="styOMB" style="padding-top:1mm;
										text-align:left;padding-left:5mm;
										border-bottom-width:0px;line-height:10px">
										Attachment <br/>
										Sequence No. <span class="styBoldText">7B</span>
									</div>
								</div> 
							</div>
						</div>
						<div style="width:256mm;height:7mm;" class="styBB">
							<div style="width:186.75mm;height:7mm;font-weight:normal;
								font-size:7pt;" class="styNameBox">
								Name on Form 1040-NR<br/>
								<div style="padding-top:.8mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
										<xsl:with-param name="BackupName">$RtnHdrDataFilerName</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
							<div style="width:35mm;height:7mm;padding-left:.3mm;
								font-size:6.2pt;font-weight:bold;" class="styEINBox">Your
								Identifying Number<br/>
								<span style="width:9.5mm;"/>
								<span style="font-weight:normal;font-size:6.4pt;padding-top:1mm">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:256mm;height:4mm;" class="styBB">
							<div style="width:256mm;height:4mm;font-weight:normal;
								font-size:7pt;" class="styNameBox">
								Enter <strong>amount of income</strong> under the appropriate rate of tax. See instructions.</div>
						</div>
						<!--Page 1 -->
						<div class="styStdDivLS">
							<div style="width:96.2mm;height:6mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;font-weight:bold;text-align:center;float:left;">
								<br/>Nature of income
							</div>
							<div style="width:32mm;height:6mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;text-align:center;float:left;padding-top:4px;">
							<strong>(a)</strong> 10%
						</div>
						<div style="width:32.1mm;height:6mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;text-align:center;float:left;padding-top:4px;">
							<strong>(b)</strong> 15%
						</div>
						<div style="width:32mm;height:6mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;text-align:center;float:left;padding-top:4px;">
							<strong>(c)</strong> 30%
						</div>
						<div style="width:63.6mm;height:3mm;border-bottom:1px solid black;text-align:center;float:left;">
							<strong>(d)</strong> Other (specify)
						</div>
						<div style="width:32mm;height:3mm;border-style:solid;border-color:black;border-width:0px 1px 1px 0px;text-align:right;float:left;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/TaxRt"/>
							</xsl:call-template>
							<xsl:if test="not($FormData/IncomeTaxRtOthUndTrtyRuleGrp/TaxRt)">%</xsl:if>
						</div>
						<div style="width:31.6mm;height:3mm;border-bottom:1px solid black;text-align:right;float:left;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOth2UndTrtyRuleGrp/TaxRt"/>
							</xsl:call-template>
							<xsl:if test="not($FormData/IncomeTaxRtOth2UndTrtyRuleGrp/TaxRt)">%</xsl:if>
						</div>
					</div>
					<!-- Sch NEC Line 1 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">1</div>
							<div class="styLNDesc" style="width:80mm;">
							Dividends and dividend equivalents:
						</div>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Sch NEC Line 1a -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">a</div>
							<div class="styLNDesc" style="width:80mm;">
							Dividends paid by U.S. corporations
							<span class="sty1040NRScheduleNECDotLn">........</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">1a</xsl:with-param>
								<xsl:with-param name="NECName">DividendsPaidDomCorpAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 1b -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</div>
							<div class="styLNDesc" style="width:80mm;">
							Dividends paid by foreign corporations
							<span class="sty1040NRScheduleNECDotLn">.......</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">1b</xsl:with-param>
								<xsl:with-param name="NECName">DividendsPaidFrgnCorpAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 1c -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">c</div>
							<div class="styLNDesc" style="width:80mm;">
							Dividend equivalent payments received with respect to section
						</div>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;"/>
							<div class="styLNDesc" style="width:80mm;">
							 871(m) transactions 
							<span class="sty1040NRScheduleNECDotLn">.............</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">1c</xsl:with-param>
								<xsl:with-param name="NECName">DividendEquivalentPaymentAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 2 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">2</div>
							<div class="styLNDesc" style="width:80mm;">
							Interest:
						</div>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<!-- Sch NEC Line 2a -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">a</div>
							<div class="styLNDesc" style="width:80mm;">
							Mortgage
							<span class="sty1040NRScheduleNECDotLn">................</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">2a</xsl:with-param>
								<xsl:with-param name="NECName">MortgageInterestAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 2b -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</div>
							<div class="styLNDesc" style="width:80mm;">
							Paid by foreign corporations
							<span class="sty1040NRScheduleNECDotLn">...........</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">2b</xsl:with-param>
								<xsl:with-param name="NECName">InterestPaidFrgnCorpAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 2c -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">c</div>
							<div class="styLNDesc" style="width:80mm;">
							Other
							<span class="sty1040NRScheduleNECDotLn">.................</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">2c</xsl:with-param>
								<xsl:with-param name="NECName">OtherInterestAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 3 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">3</div>
							<div class="styLNDesc" style="width:80mm;">
							Industrial royalties (patents, trademarks, etc.)
							<span class="sty1040NRScheduleNECDotLn">.....</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">3</xsl:with-param>
								<xsl:with-param name="NECName">IndustrialRoyaltiesAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 4 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">4</div>
							<div class="styLNDesc" style="width:80mm;">
							Motion picture or T.V. copyright royalties
							<span class="sty1040NRScheduleNECDotLn">......</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">4</xsl:with-param>
								<xsl:with-param name="NECName">CopyrightRoyaltiesAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 5 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="styLNDesc" style="width:80mm;">
							Other royalties (copyrights, recording, publishing, etc.)
							<span class="sty1040NRScheduleNECDotLn">..</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">5</xsl:with-param>
								<xsl:with-param name="NECName">OtherRoyaltiesAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 6 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="styLNDesc" style="width:80mm;">
							Real property income and natural resources royalties
							<span class="sty1040NRScheduleNECDotLn">...</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">6</xsl:with-param>
								<xsl:with-param name="NECName">RealPropNatRscRoyaltiesAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 7 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">7</div>
							<div class="styLNDesc" style="width:80mm;">
							Pensions and annuities
							<span class="sty1040NRScheduleNECDotLn">............</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">7</xsl:with-param>
								<xsl:with-param name="NECName">PensionsAnnuitiesAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 8 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">8</div>
							<div class="styLNDesc" style="width:80mm;">
							Social security benefits
							<span class="sty1040NRScheduleNECDotLn">............</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">8</xsl:with-param>
								<xsl:with-param name="NECName">SocSecBnftAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 9 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="styLNDesc" style="width:80mm;">
							Capital gain from line 18 below
							<span class="sty1040NRScheduleNECDotLn">..........</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">9</xsl:with-param>
								<xsl:with-param name="NECName">NetCapitalGainOrLossAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 10 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBox" style="">10</div>
							<div class="styLNDesc" style="height:7mm;width:80mm;">
							Gambling&#8213;Residents of Canada only. Enter net income in column (c). <strong>If zero or less, enter -0-.</strong>
							</div>
							<div class="styLNRightNumBox" style="height:7mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="height:7mm;border-bottom:none;background-color:lightgrey;"/>
						</div>
						<!-- Sch NEC Line 10a -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">a</div>
							<div class="styLNDesc" style="width:80mm;">
								<span style="width:20mm;">Winnings</span>
								<span class="styLNAmountBox" style="height:3mm;border-left:none;padding:0px;float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/GmblWinCanadaResidentsAmt"/>
									</xsl:call-template>
								</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;"/>
							<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"/>
						</div>
						<!-- Sch NEC Line 10b / 10c -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</div>
							<div class="styLNDesc" style="width:80mm;">
								<span style="width:20mm;">Losses</span>
								<span class="styLNAmountBox" style="height:3mm;border-left:none;padding:0px;float:none;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/GmblLossCanadaResidentsAmt"/>
									</xsl:call-template>
								</span>
								<span class="sty1040NRScheduleNECDotLn">......</span>
							</div>
							<div class="styLNRightNumBox" style="">10c</div>
							<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt30UndTrtyRuleGrp/NetGmblCanadaResidentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/NetGmblCanadaResidentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="border-bottom:none;background-color:lightgrey;"/>
						</div>
						<!-- Sch NEC Line 11 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBox" style="">11</div>
							<div class="styLNDesc" style="width:80mm;">
							Gambling winnings&#8213;Residents of countries other than Canada.
						</div>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
							<div class="styLNAmountBoxNBB" style="background-color:lightgrey;"/>
						</div>
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;"/>
							<div class="styLNDesc" style="width:80mm;">
								<strong>Note: </strong> Losses not allowed
							<span class="sty1040NRScheduleNECDotLn">...........</span>
							</div>
							<div class="styLNRightNumBox" style="">11</div>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt10UndTrtyRuleGrp/GmblWinNotCanadaResidentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;"/>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt30UndTrtyRuleGrp/GmblWinNotCanadaResidentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/GmblWinNotCanadaResidentsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="background-color:lightgrey;"/>
						</div>
						<!-- Sch NEC Line 12 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBox" style="">12</div>
							<div class="styLNDesc" style="width:80mm;">
							Other (specify) <img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right Arrow"/>
							<span style="width:56mm;border-bottom:1px dashed black;">&#8194;
								<xsl:if test="$FormData//OtherIncomeTyp">
									See additional data table
								</xsl:if>
								</span>
							</div>
							<div class="styLNRightNumBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
							<div class="styLNAmountBoxNBB"/>
						</div>
						<div class="styStdDivLS">
							<div class="styLNLeftNumBoxSD" style="padding-left:4.5mm;"/>
							<div class="styLNDesc" style="width:80mm;border-bottom:1px dashed black;">
							&#8194;
						</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">12</xsl:with-param>
								<xsl:with-param name="NECName">OtherIncomeAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 13-->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBox">13</div>
							<div class="styLNDesc" style="width:80mm;">
							Add lines 1a through 12 in columns (a) through (d)
							<span class="sty1040NRScheduleNECDotLn">...</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">13</xsl:with-param>
								<xsl:with-param name="NECName">TotalIncomeAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 14 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDesc" style="width:80mm;">
								<strong>Multiply line 13 by rate of tax at top of each column</strong>
								<span class="sty1040NRScheduleNECDotLn">.</span>
							</div>
							<xsl:call-template name="SchNECtable1">
								<xsl:with-param name="NECLine">14</xsl:with-param>
								<xsl:with-param name="NECName">TotalIncomeTimesTaxRtAmt</xsl:with-param>
							</xsl:call-template>
						</div>
						<!-- Sch NEC Line 15 -->
						<div class="styStdDivLS">
							<div class="styLNLeftNumBox">15</div>
							<div class="styLNDescLandscape" style="height:7mm;width:208mm;">
							  	<strong>Tax on income not effectively connected with a U.S. trade or
									business. </strong> Add columns (a) through (d) of line 14. Enter the total
									here and on	Form 1040-NR, <br/>line 23a
								<span class="sty1040NRScheduleNECDotLn" 
									>...............................................
								<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right Arrow"/></span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;">
								<br/>15</div>
							<div class="styLNAmountBoxNBB" style="height:7mm;">
								<br/>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeNotUSBusinessTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Schedule NEC table 2 -->
						<div class="styStdDivLS" style="border-top:2px solid black;border-bottom:1px solid black;text-align:center">
							<span style="font-weight:bold;font-size:larger;padding-top:0.5mm;padding-bottom:0.5mm;">
							Capital Gains and Losses From Sales or Exchanges of Property
						</span>
							<span style="float:right;">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="TargetNode" select="$FormData/CapGainLossSlsOrExchPropGrp"/>
									<xsl:with-param name="containerID" select=" 'propertyGainLossContainer' "/>
								</xsl:call-template>
							</span>
						</div>
						<!-- Sch NEC Lines 16-18 -->
						<div class="styStdDivLS">
							<div class="sty1040NRScheduleNECIndentSection" style="width:35mm;font-size:7pt;font-family:Arial Narrow;text-align:justify;padding-right:1mm;">
							Enter only the capital gains and losses from property sales or exchanges that are from sources within the United States and not effectively connected with a U.S. business.  Do not include a gain or loss on disposing of a U.S. real property interest; report these gains and losses on Schedule D (Form 1040).<br/>
							Report property sales or exchanges that are effectively connected with a U.S. business on Schedule D (Form 1040), Form 4797, or both.
						</div>
							<div style="width:221mm;border-left:1px solid black;float:left;">
								<xsl:variable name="countNEC16" select="count($FormData/CapGainLossSlsOrExchPropGrp)"/>
								<div class="sty1040NRScheduleNECTableContainer16" id="propertyGainLossContainer">
									<xsl:call-template name="SetInitialState"/>
									<table class="styTable" style="display:table;border-collapse:collapse;font-size:7pt;">
										<thead class="styTableThead">
											<tr>
												<th class="styTableCellHeader" scope="col" style="width:69mm;font-weight:normal;">
													<span style="float:left;font-weight:bold;">16</span>
													<strong>(a)</strong> Kind of property and description <br/>
												(if necessary, attach statement of <br/>descriptive details not shown below)
											</th>
												<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
													<strong>(b)</strong> Date <br/> acquired <br/> (mo., day, yr.)
											</th>
												<th class="styTableCellHeader" scope="col" style="width:20mm;font-weight:normal;">
													<strong>(c)</strong> Date <br/> sold <br/> (mo., day, yr.)
											</th>
												<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
													<strong>(d)</strong> Sales price
											</th>
												<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;">
													<strong>(e)</strong> Cost or other <br/> basis
											</th>
												<th class="styTableCellHeader" scope="col" style="width:28.1mm;font-weight:normal;">
													<strong>(f) LOSS</strong>
													<br/> If (e) is more <br/> than (d), subtract (d) <br/> from (e) 
											</th>
												<th class="styTableCellHeader" scope="col" style="width:28mm;font-weight:normal;border-right:none;">
													<strong>(g) GAIN</strong>
													<br/> If (d) is more <br/> than (e), subtract (e) <br/> from (d) 
											</th>
											</tr>
										</thead>
										<tbody>
											<xsl:if test="not((($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12)))">
												<xsl:for-each select="$FormData/CapGainLossSlsOrExchPropGrp">
													<tr>
														<td class="sty1040NRScheduleNECTableCellText">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="PropertyDesc"/>
															</xsl:call-template>
														</td>
														<td class="sty1040NRScheduleNECTableCellCenter">
															<xsl:call-template name="PopulateMonthDayYear">
																<xsl:with-param name="TargetNode" select="AcquiredDt"/>
															</xsl:call-template>
														</td>
														<td class="sty1040NRScheduleNECTableCellCenter">
															<xsl:call-template name="PopulateMonthDayYear">
																<xsl:with-param name="TargetNode" select="SoldDt"/>
															</xsl:call-template>
														</td>
														<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="SalesPriceAmt"/>
															</xsl:call-template>
														</td>
														<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
															</xsl:call-template>
														</td>
														<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="LossAmt"/>
															</xsl:call-template>
														</td>
														<td class="sty1040NRScheduleNECTableCellAmt">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="GainAmt"/>
															</xsl:call-template>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="($countNEC16 &lt; 1) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
												<tr>
													<td class="sty1040NRScheduleNECTableCellText">&#8194;
													<xsl:if test="($Print and not($Print='')) and ($countNEC16 &gt; 0)">
														See Additional Data Table
													</xsl:if>
													</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt">&#8194;</td>
												</tr>
											</xsl:if>
											<xsl:if test="($countNEC16 &lt; 2) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
												<tr>
													<td class="sty1040NRScheduleNECTableCellText">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt">&#8194;</td>
												</tr>
											</xsl:if>
											<xsl:if test="($countNEC16 &lt; 3) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
												<tr>
													<td class="sty1040NRScheduleNECTableCellText">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt">&#8194;</td>
												</tr>
											</xsl:if>
											<xsl:if test="($countNEC16 &lt; 4) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
												<tr>
													<td class="sty1040NRScheduleNECTableCellText">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt">&#8194;</td>
												</tr>
											</xsl:if>
											<xsl:if test="($countNEC16 &lt; 5) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
												<tr>
													<td class="sty1040NRScheduleNECTableCellText">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt">&#8194;</td>
												</tr>
											</xsl:if>
											<xsl:if test="($countNEC16 &lt; 6) or (($Print = $Separated) and ($countNEC16 &gt; 6)) or (($Print = 'inline') and ($countNEC16 &gt; 12))">
												<tr>
													<td class="sty1040NRScheduleNECTableCellText">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellCenter">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt" style="border-right-width:1px;">&#8194;</td>
													<td class="sty1040NRScheduleNECTableCellAmt">&#8194;</td>
												</tr>
											</xsl:if>
										</tbody>
									</table>
								</div>
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="containerHeight" select="6"/>
									<xsl:with-param name="headerHeight" select="1"/>
									<xsl:with-param name="TargetNode" select="$FormData/CapGainLossSlsOrExchPropGrp"/>
									<xsl:with-param name="containerID" select=" 'propertyGainLossContainer' "/>
								</xsl:call-template>
								<!-- Line 17 -->
								<div class="styStdDivLS" style="width:220.7mm;">
									<div class="styLNLeftNumBox">17</div>
									<div class="styLNDesc" style="width:148.6mm;">
									Add columns (f) and (g) of line 16
									<span class="sty1040NRScheduleNECDotLn">..........................</span>
									</div>
									<div class="styLNRightNumBox">17</div>
									<div class="styLNAmountBox" style="width:28mm;">
										<xsl:call-template name="PopulateNegativeNumber">
											<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalLossAmt"/>
										</xsl:call-template>
									</div>
									<div class="styLNAmountBox" style="width:28mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/TotalCapitalGainAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 18 -->
								<div class="styStdDivLS" style="width:220.7mm;">
									<div class="styLNLeftNumBox">18</div>
									<div class="styLNDesc" style="width:176.6mm;">
										<strong>Capital gain. </strong> Combine columns (f) and (g) of line 17. Enter the net gain here and on line 9 above (if a loss, enter -0-) 
									<span class="sty1040NRScheduleNECDotLn">.....<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right Arrow"/></span>
									</div>
									<div class="styLNRightNumBoxNBB">18</div>
									<div class="styLNAmountBoxNBB" style="width:28mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/NetCapitalGainOrLossAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
						<div class="styStdDivLS pageEnd" style="border-top:1px solid black;">
							<div style="width:124mm;font-weight:bold;font-size:6.5pt;" class="styGenericDiv">
								For Paperwork Reduction Act Notice, see the 
								<span style="font-family:Arial">I</span>nstructions for Form 1040-NR.
							</div>
							<div style="width:66mm;text-align:center;font-size:6pt;
								padding-left:0mm;" class="styGenericDiv">Cat. No. 72752B
							</div>
							<div style="font-size:6pt;float:right" 
								class="styGenericDiv">
								<span class="styBoldText">Schedule NEC (Form 1040-NR)
								 2021
								</span>
							</div>
						</div>
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
					<xsl:if test="$FormData//OtherIncomeTyp">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule NEC, Line 12 - Other Income Type</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:140mm;">Other Income Description</th>
									<th class="styDepTblCell" scope="col" rowspan="1" style="width:20mm;">Tax Rate</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/IncomeTaxRt10UndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											10%
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="priorA" select="count($FormData/IncomeTaxRt10UndTrtyRuleGrp/OtherIncomeTyp)"/>
								<xsl:for-each select="$FormData/IncomeTaxRt15UndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $priorA) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											15%
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="priorB" select="$priorA + count($FormData/IncomeTaxRt15UndTrtyRuleGrp/OtherIncomeTyp)"/>
								<xsl:for-each select="$FormData/IncomeTaxRt30UndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $priorB) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											30%
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="priorC" select="$priorB + count($FormData/IncomeTaxRt30UndTrtyRuleGrp/OtherIncomeTyp)"/>
								<xsl:for-each select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $priorC) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="../TaxRt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:variable name="priorD" select="$priorC + count($FormData/IncomeTaxRtOthUndTrtyRuleGrp/OtherIncomeTyp)"/>
								<xsl:for-each select="$FormData/IncomeTaxRtOth2UndTrtyRuleGrp/OtherIncomeTyp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="(position() + $priorD) mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:140mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="../TaxRt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="(($Print = $Separated) and (count($FormData/CapGainLossSlsOrExchPropGrp) &gt; 6)) or (($Print = 'inline') and (count($FormData/CapGainLossSlsOrExchPropGrp) &gt; 12))">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Schedule NEC, Line 16 - Capital Gains and Losses From Sales or Exchanges of Property</span>
						<table class="styDepTblLandscape" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:35mm;">(a) Kind of property and description</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">(b) Date acquired</th>
									<th class="styDepTblCell" scope="col" style="width:20mm;">(c) Date sold</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">(d) Sales price</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">(e) Cost or other basis</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">(f) LOSS</th>
									<th class="styDepTblCell" scope="col" style="width:28mm;">(g) GAIN</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/CapGainLossSlsOrExchPropGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:35mm;text-align:left;">
											<div style="width:6.5mm;font-weight:bold;text-align:right;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PropertyDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="AcquiredDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:20mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SoldDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:28mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SalesPriceAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:28mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:28mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="LossAmt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="width:28mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="GainAmt"/>
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
	<xsl:template name="SchNECtable1">
		<xsl:param name="NECTarget" select="/.."/>
		<xsl:param name="NECName">None</xsl:param>
		<xsl:param name="NECLine"/>
		<div class="styLNRightNumBox">
			<xsl:value-of select="$NECLine"/>
		</div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt10UndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt15UndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRt30UndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOthUndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
		<div class="styLNAmountBox">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxRtOth2UndTrtyRuleGrp/*[local-name() = $NECName]"/>
			</xsl:call-template>
		</div>
	</xsl:template>
</xsl:stylesheet>
