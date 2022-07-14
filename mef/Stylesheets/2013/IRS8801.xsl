<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8801Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8801"/>
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
				<meta name="Description" content="IRS Form 8801"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8801Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form8801">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:1.5px;">
						<div class="styFNBox" style="width:28mm;height:20mm;padding-bottom:0mm;border-right-width:1.5px;">
							 Form<span style="width:1mm;"/>
							<span class="styFormNumber">8801</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<div class="styAgency" style="padding-top:5.5mm;padding-bottom:0mm;">
								Department of the Treasury<br/>
								Internal Revenue Service(99)
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:20mm;">
							<div class="styMainTitle" style="height:5mm;padding-bottom:0mm;">
								Credit for Prior Year Minimum Tax&#8212;<br/>
								Individuals, Estates, and Trusts<br/>
						    </div>
							<div class="styFBT" style="font-size:7pt;height:5mm;padding-top:6mm;">
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/>  Information about Form 8801 and its separate instructions is at 
								 <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8801" title="Link to IRS.gov"><i>www.irs.gov/form8801.</i></a><br/>
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040, 1040NR, or 1041.
							</div>
						</div>
						<div class="styTYBox" style="width:31mm;height:20mm;border-left-width:1.5px;">
							<div class="styOMB" style="width:31mm;height:4mm;padding-top:0mm;border-bottom:1 solid black;font:7pt;">
								OMB No. 1545-1073
						    </div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">13</span></span>
							</div>
							<div class="stySequence" style="padding-top:.5mm;"> Attachment<br/>Sequence No. <b style="font-size:9pt">74</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm; height:9mm">
							  Name(s) shown on return<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>
						</div>
						<div style="width:45mm;padding-left:1mm;">						
							<b>Identifying number</b><br/>
							<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
						</div>
					</div>
					<!-- Part l -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;padding-top:0mm;font-family:arial;">
						<span class="styPartName" style="height:4mm;width:12mm;font-size:9pt;">Part I</span>
						<span style="width:167mm;height:4mm;padding-top:.25mm;padding-left:4mm;" class="styPartDesc">
							  Net Minimum Tax on Exclusion Items
						</span>
					</div>
					<!-- End Part I Header -->
					<!-- Part I body -->
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:4mm;">1
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Combine lines 1 and 10 of your 2012 Form 6251. Estates and trusts, see instructions</span>
							<span class="styIRS8801DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">1</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxTaxableIncomeLossAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:4mm">2
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter adjustments and preferences treated as exclusion items (see instructions)</span>
							<span class="styIRS8801DotLn">........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">2</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxExclusionItemsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:4mm">3
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Minimum tax credit net operating loss deduction (see instructions)</span>
							<span class="styIRS8801DotLn">............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">3</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$FormData/MinTaxCreditNetOprLossDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:4mm">4</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
							  Combine lines 1, 2, and 3. If zero or less, enter -0- here and on line 15 and go to Part II. If more than $232,500 and you were married filing separately for 2012, see instructions
							<span style="letter-spacing:3.2mm;font-weight:bold;">.........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">4</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SumMinTaxCreditLossAndDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:4mm">5</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
								Enter: $78,750 if married filing jointly or qualifying widow(er) for 2012; $50,600 if single or head of household for 2012; or $39,375 if married filing separately for 2012. Estates and trusts, enter $22,500
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">5</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MinTaxCreditExemptionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:4mm">6</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
							  Enter: $150,000 if married filing jointly or qualifying widow(er) for 2012; $112,500 if single or head <br/>of household for 2012; or $75,000 if married filing separately for 2012. 
							  Estates and trusts, enter <br/> $75,000
						    <span style="letter-spacing:3.2mm;font-weight:bold;">.............................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">6</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:6.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MinTaxCreditPhaseOutAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:4mm">7
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Subtract line 6 from line 4. If zero or less, enter -0- here and on line 8 and go to line 9</span>
							<span class="styIRS8801DotLn">......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">7</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxCrMinusPhaseOutAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:4mm">8
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Multiply line 7 by 25% (.25)</span>
							<span class="styIRS8801DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">8</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxCrTimesDecimalAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 4mm">9</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
							  Subtract line 8 from line 5. If zero or less, enter -0-. If under age 24 at the end of 2012, see instructions
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">9</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxMinusExemptionAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">10</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
							  Subtract line 9 from line 4. If zero or less, enter -0- here and on line 15 and go to Part II. Form 1040NR filers, see instructions
							<span style="letter-spacing:3.2mm;font-weight:bold;">.........................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">10</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxLessLossAndDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:3mm;"/>
						<div class="styLNDesc" style="width:135mm;height:3mm;"/>
						<div class="styLNRightNumBox" style="height:3mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:3mm;border-bottom:none;"/>
					</div>
					<!-- Line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-left:2.25mm">11</div>
						<div style="float:left;position:relative;">
							<div style="position:absolute;top:0;right:3mm;">
								<img alt="right bracket" src="{$ImagePath}/CurlyBrace1.77x28.49mm.png" style="float:right;clear:none;margin-top:2.5mm;margin-right:2.5mm;"/>
							</div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-right:15mm;padding-left:5.5mm;">
								<li style="margin-bottom:2.5mm;">If <b>for 2012</b> you filed Form 2555 or 2555-EZ, see instructions for the amount to enter.</li>
								<li>If <b>for 2012</b> you reported capital gain distributions directly on Form 1040, line 13; you reported qualified dividends on Form 1040, line 9b (Form 1041, line 2b(2)); 
								  <b>or</b> you had a gain on both lines 15 and 16 of Schedule D (Form 1040) (lines 14a and 15, column (2), of Schedule D (Form 1041)), complete Part III of Form 8801 and enter the amount from line 45 here. Form 1040NR filers, see instructions.</li>
								<li style="margin-top:2.5mm;">
									<b>All others:</b> If line 10 is $175,000 or less ($87,500 or less if married filing separately for 2012), multiply line 10 by 26% (.26). Otherwise, multiply line 10 by 28% (.28) and subtract $3,500 ($1,750 if married filing separately for 2012) from the result. Form 1040NR filers, see instructions.</li>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:17mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">11</div>
							<div class="styLNRightNumBox" style="clear:left;height:17mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:17mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;border-bottom-width:1px;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxTimesTaxRateAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="clear:left;width:36mm;height:17mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">12
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Minimum tax foreign tax credit on exclusion items (see instructions)</span>
							<span class="styIRS8801DotLn">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">12</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/MinTaxForeignTaxCrExclItemsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">13
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Tentative minimum tax on exclusion items. Subtract line 12 from line 11</span>
							<span class="styIRS8801DotLn">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">13</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TentativeMinTaxOnExclItemsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 14 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">14
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the amount from your 2012 Form 6251, line 34, or 2012 Form 1041, Schedule I, line 55</span>
							<span class="styIRS8801DotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">14</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYMinTaxApplicableRtnTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 15 -->
					<div class="styTBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">15
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">
								<b>Net minimum tax on exclusion items.</b> Subtract line 14 from line 13. If zero or less, enter -0-</span>
							<span class="styIRS8801DotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;">15</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxOnExclusionItemsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
							<span style="width:27mm;"/>                        
							  Cat. No. 10002S
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
								Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2013)
						</div>
					</div>
				    <p style="page-break-before: always"/>					
					<!-- Page 2 Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8801 (2013)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Part Il - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;padding-top:0mm;font-family:arial;">
						<span class="styPartName" style="height:4mm;width:12mm;font-size:9;">Part II</span>
						<span style="width:167mm;padding-top:.25mm;padding-left:4mm;" class="styPartDesc">
								Minimum Tax Credit and Carryforward to 2014
						</span>
					</div>
					<!-- END Part ll Header-->
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 16 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">16
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the amount from your 2012 Form 6251, line 35, or 2012 Form 1041, Schedule I, line 56</span>
							<span class="styIRS8801DotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">16</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYAlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 17 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">17
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the amount from line 15</span>
							<span class="styIRS8801DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">17</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxOnExclusionItemsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 18 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">18
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Subtract line 17 from line 16. If less than zero, enter as a negative amount</span>
							<span class="styIRS8801DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">18</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAlternativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 19 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">19
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">
								<b>2012 credit carryforward.</b> Enter the amount from your 2012 Form 8801, line 28</span>
							<span class="styIRS8801DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">19</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AMTPriorYearCarryforwardAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 20 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">20
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter your 2012 unallowed qualified electric vehicle credit (see instructions)</span>
							<span class="styIRS8801DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">20</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehPYUnallowedCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 21 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">21
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Combine lines 18 through 20. If zero or less, stop here and see the instructions</span>
							<span class="styIRS8801DotLn">.......</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">21</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AMTCarryforwardPlusNegativeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 22 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">22
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter your 2013 regular income tax liability minus allowable credits (see instructions)</span>
							<span class="styIRS8801DotLn">.....</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">22</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYRegTaxLiabiMinusAllwblCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 23 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">23
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the amount from your 2013 Form 6251, line 33, or 2013 Form 1041, Schedule I, line 54</span>
							<span class="styIRS8801DotLn">...</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">23</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/CYTentativeMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 24 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">24
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Subtract line 23 from line 22. If zero or less, enter -0-</span>
   						    <span style="letter-spacing:3.2mm;font-weight:bold;">...............</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">24</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TentMinTaxMinusRegTaxLiabAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 25 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">25</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
								<b>Minimum tax credit.</b> Enter the <b>smaller</b> of line 21 or line 24. Also enter this amount on your 2013 <br/>
								      Form 1040, line 53 (check box <b>b</b>); Form 1040NR, line 50 (check box <b>b</b>); or Form 1041, Schedule G, <br/> line 2c
								 <span style="letter-spacing:3.2mm;font-weight:bold;">..............................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">25</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:6mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MinAMTCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 26 -->
					<div class="styTBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">26</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;padding-left:2mm;">
								<b>Credit carryforward to 2014.</b> 
									  Subtract line 25 from line 21. Keep a record of this amount because you may use it in future years
								<span style="letter-spacing:3.2mm;font-weight:bold;">........................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;border-bottom:none;">26</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;border-bottom:none">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AMTCrCarryforwardToNextYearAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2013)
						 </div>
					</div>
				    <p style="page-break-before: always"/>					
					<!-- Page 3 Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8801 (2013)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- Part IIl - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;">
						<span class="styPartName" style="height:4mm;width:12mm;font-size:9pt;font-family:arial;">Part III</span>
						<span style="width:167mm;padding-left:5mm;" class="styPartDesc">
								Tax Computation Using Maximum Capital Gains Rates
						</span>
					</div>
					<!-- END Part lIl Header-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:10mm;padding-bottom:0mm;padding-left:2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding: 4mm 1mm 0mm 2mm;">
							<b>Caution.</b> If you did not complete the 2012 Qualified Dividends and Capital Gain Tax Worksheet, the 2012 Schedule D Tax Worksheet, or Part V of the 2012 Schedule D (Form 1041), see the instructions before completing this part.
						 </div>
						<div class="styLNRightNumBox" style="height:13.5mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:13.5mm;padding-bottom:0mm;border-bottom:none;"/>
					</div>
					<!-- Line 27 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">27</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;padding-left:2mm;">
							  Enter the amount from Form 8801, line 10. If you filed Form 2555 or 2555-EZ for 2012, enter the amount from line 3 of the Foreign Earned Income Tax Worksheet in the instructions
							<span style="letter-spacing:3.2mm;font-weight:bold;">......</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">27</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxLessDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<b>Caution.</b> If <b>for 2012</b> you filed Form 1040NR, 1041, 2555, or 2555-EZ, see the instructions before completing lines 28, 29, and 30.
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:8mm;padding-bottom:0mm;border-bottom:none;"/>
					<!-- Line 28 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:14mm;font-size:7pt;padding-left:2.25mm">28</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
								Enter the amount from line 6 of your 2012 Qualified Dividends and Capital Gain Tax Worksheet, the amount from line 13 of your 2012 Schedule D Tax Worksheet, or the amount from line 22 of the 2012 Schedule D (Form 1041), whichever applies*
							  <span style="letter-spacing:3.2mm;font-weight:bold;">.......</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:10mm;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">28</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:10mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PYMinTaxApplicableCapGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:14mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;font-size:7pt;padding-left:2.25mm"/>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;font-weight:bold;padding-left:2mm;">
								If you figured your 2012 tax using the 2012 Qualified Dividends and Capital Gain Tax Worksheet, skip line 29 and enter the amount from line 28 on line 30. Otherwise, go to line 29.
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:11mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:11mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:11mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 29 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;font-size:7pt;padding-left:2.25mm">29</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
							  Enter the amount from line 19 of your 2012 Schedule D (Form 1040), or line 14b, column (2), of the 2012 Schedule D (Form 1041)
							<span style="letter-spacing:3.2mm;font-weight:bold;">..</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">29</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PYUnrecapturedS1250GainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:8mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 30 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:9mm;font-size:7pt;padding-left: 2.25mm">30</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
							  Add lines 28 and 29, and enter the <b>smaller</b> of that result or the amount from line 10 of your 2012 Schedule D Tax Worksheet
							<span style="letter-spacing:3.2mm;font-weight:bold;">..</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">30</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmallerPYSchDGainOrWrkshtAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:9mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 31 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">31
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the <b>smaller</b> of line 27 or line 30</span>
							<span class="styIRS8801DotLn">....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">31</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerNetAMTOrGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 32 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">32
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Subtract line 31 from line 27</span>
							<span class="styIRS8801DotLn">.......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">32</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AMTLessSmallerOfTaxOrGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 33 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">33</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;padding-left:2mm;">
								  If line 32 is $175,000 or less ($87,500 or less if married filing separately for 2012), multiply line 32 by 26% (.26). Otherwise, multiply line 32 by 28% (.28) and subtract $3,500 ($1,750 if married filing separately for 2012) from the result. Form 1040NR filers, see instructions
							  <span style="letter-spacing:3.2mm;font-weight:bold;">.........</span>
							  <img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet" style="margin:0mm -.5mm;"/>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">33</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:6.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetAdjAMTTxblIncTimesPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 34 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:20mm;font-size:7pt;padding-left:2.25mm">34</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
								  Enter:
									  <li style="margin-left:3.5mm;">$70,700 if married filing jointly or qualifying widow(er) for 2012,</li>
									  <li style="margin-left:3.5mm;">$35,350 if single or married filing separately for 2012,</li>
									  <li style="margin-left:3.5mm;">$47,350 if head of household for 2012, or</li>
									  <li style="margin-left:3.5mm;">$2,400 for an estate or trust.</li>
									  <span style="margin-left:.25mm;">Form 1040NR filers, see instructions</span>
							<span style="letter-spacing:3.2mm;font-weight:bold;">..........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:16.5mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">34</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:16.5mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MaxCapGainsApplicableLimitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:20.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:20.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 35 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:20mm;font-size:7pt;padding-left:2.25mm">35</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
							  Enter the amount from line 7 of your 2012 Qualified Dividends and Capital Gain Tax Worksheet, the amount from line 14 of your 2012 Schedule D Tax Worksheet, or the amount from line 23 of the 2012 Schedule D (Form 1041), whichever applies. If you did not complete either worksheet or Part V of the 2012 Schedule D (Form 1041), enter -0-. Form 1040NR filers, see instructions
							<span style="letter-spacing:3.2mm;font-weight:bold;">.........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:16mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">35</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:16mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AMTPriorYearApplicableGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:20mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:20mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 36 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">36</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
							  Subtract line 35 from line 34. If zero or less, enter -0-
							 <span style="letter-spacing:3.2mm;font-weight:bold;">.....</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">36</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MaxCapGainMinusApplcblLimitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 37 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">37</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
							  Enter the <b>smaller</b> of line 27 or line 28
							<span style="letter-spacing:3.2mm;font-weight:bold;">.........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">37</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmllrNetMinTaxOrApplcblGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 38 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">38</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
							  Enter the <b>smaller</b> of line 36 or line 37
						    <span style="letter-spacing:3.2mm;font-weight:bold;">.........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">38</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmallerCalculatedNetOrGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 39 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">39</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
							  Subtract line 38 from line 37 
						    <span style="letter-spacing:3.2mm;font-weight:bold;">............</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">39</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GainMinusSmallerNetAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 40 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">40
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Multiply line 39 by 15% (.15)</span>
							<span class="styIRS8801DotLn">.......................</span>
							<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet" style="margin:0mm -2mm;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">40</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAltMinTaxableIncTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding:2mm 0mm 0mm 2mm;font-weight:bold;">
							If line 29 is zero or blank, skip lines 41 and 42 and go to line 43. Otherwise, go to line 41.
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 41 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">41</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-left:2mm;">
							  Subtract line 37 from line 31
							<span style="letter-spacing:3.2mm;font-weight:bold;">............</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;clear:left;">41</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-right:.5mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetPYOrNetOrTotalGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 42 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">42</div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Multiply line 41 by 25% (.25)</span>
							<span class="styIRS8801DotLn">.......................</span>
							<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet" style="margin:0mm -2mm;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">42</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetGainTimesAllowablePctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 43 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm">43
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Add lines 33, 40, and 42</span>
							<span class="styIRS8801DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">43</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetGainPercentageSumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 44 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">44</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;padding-left:2mm;">
							  If line 27 is $175,000 or less ($87,500 or less if married filing separately for 2012), multiply line 27 by 26% (.26). Otherwise, multiply line 27 by 28% (.28) and subtract $3,500 ($1,750 if married filing separately for 2012) from the result. Form 1040NR filers, see instructions
							<span style="letter-spacing:3.2mm;font-weight:bold;">.......</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">44</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:6.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetGainTimesFilingStatusPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 45 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left:2.25mm">45</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;padding-left:2mm;">
								  Enter the <b>smaller</b> of line 43 or line 44 here and on line 11. If you filed Form 2555 or 2555-EZ for 2012, do not enter this amount on line 11. Instead, enter it on line 4 of the Foreign Earned Income Tax Worksheet in the instructions
								  <span style="letter-spacing:3.2mm;font-weight:bold;">.......................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">45</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:6mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MaximumCapitalGainsRateAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styTBB" style="width:187mm;margin-top:1mm;font-size:6pt;padding-bottom:1mm;">
						<sup>*</sup> The 2012 Qualified Dividends and Capital Gain Tax Worksheet is in the 2012 Instructions for Form 1040. The 2012 Schedule D Tax Worksheet is in the 2012 Instructions for Schedule D (Form 1040)  (or the 2012 Instructions for Schedule D (Form 1041)).
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
								Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2013)
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
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
