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
		<html lang="EN-US">
			<head>
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
			<body class="styBodyClass">
				<form name="Form8801">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:38mm;height:20mm;padding:bottom:0mm;">
              Form<span style="width:1mm;"/>
							<span class="styFormNumber">8801</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<div class="styAgency" style="padding-top:3mm;height:0mm;padding:bottom:0mm;">
                Department of the Treasury<br/>
                Internal Revenue Service(99)
              </div>
						</div>
						<div class="styFTBox" style="width:110mm;height:20mm;">
							<div class="styMainTitle" style="height:5mm;padding:bottom:0mm;">
                Credit for Prior Year Minimum Tax&#8212;<br/>Individuals, Estates, and Trusts
              </div>
							<div class="styFBT" stype="font-size:7pt;height:5mm;padding-top:1mm;">
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/>  See separate instructions.<br/>
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040, 1040NR, or 1041.
              </div>
						</div>
						<div class="styTYBox" style="width:38mm; height:20mm">
							<div style="padding-top:0mm;border-bottom:1 solid black;font:6pt;">
                OMB No. 1545-1073
              </div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">2011</span>
							</div>
							<div class="stySequence">
                Attachment<br/>Sequence No. <b style="font-size:8pt">74</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm; height:8mm">
              Name(s) shown on return<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name"/>
							</xsl:call-template>
							<br/>
							<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
						</div>
						<b>Identifying number</b>
						<br/>
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
						</xsl:call-template>
					</div>
					<!-- Part l -->
					<!-- Part I - Header -->
					<div style="width:187mm;height:0mm;border-bottom:1px solid black;float:left;padding-top:0mm;font-family:arial;">
						<span class="styPartName" style="height:1mm;width:15mm;font-size:13;">Part I</span>
						<span style="width:167mm;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;height:0mm;vertical-align:top;"/>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4mm;">1
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Combine lines 1, 6, and 10 of your 2010 Form 6251. Estates and trusts, see instructions</span>
							<span class="styIRS8801DotLn">...</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4mm">2
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter adjustments and preferences treated as exclusion items (see instructions)</span>
							<span class="styIRS8801DotLn">.......</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4mm">3
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 4mm">4</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;">
                  Combine lines 1, 2, and 3. If zero or less, enter -0- here and on line 15 and go to Part II. If more than $219,900 and you were married filing separately for 2010, see instructions
                  <span style="letter-spacing:3.2mm;font-weight:bold;">........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">4</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 4mm">5</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;">
                  Enter: $72,450 if married filing jointly or qualifying widow(er) for 2010; $47,450 if single or head of household for 2010; or $36,225 if married filing separately for 2010. Estates and trusts, enter $22,500
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...............................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">5</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 4mm">6</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;">
                  Enter: $150,000 if married filing jointly or qualifying widow(er) for 2010; $112,500 if single or head of household for 2010; or $75,000 if married filing separately for 2010. Estates and trusts, enter $75,000
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...............................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">6</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4mm">7
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4mm">8
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Multiply line 7 by 25% (.25)</span>
							<span class="styIRS8801DotLn">.........................</span>
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
							<div class="styLNDesc" style="font-size:7pt;width:135mm;">
                  Subtract line 8 from line 5. If zero or less, enter -0-. If under age 24 at the end of 2010, see instructions
                  <span style="letter-spacing:3.2mm;font-weight:bold;">..............................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">9</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">10</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;">
                  Subtract line 9 from line 4. If zero or less, enter -0- here and on line 15 and go to Part II. Form 1040NR filers, see instructions
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.......................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">10</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxLessLossAndDedAmt"/>
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
					<!-- Line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:3mm;padding-left: 2.25mm">11</div>
						<div style="float:left;position:relative;">
							<div style="position:absolute;top:0;right:3mm;">
								<img alt="right bracket" src="{$ImagePath}/8801_lg_lft_bracket.gif" style="float:right;"/>
							</div>
							<div class="styLNDesc" style="font-size:7pt;width:135mm;height:3mm;padding-right:15mm;">
								<li style="margin-bottom:3mm;">If <b>for 2010</b> you filed Form 2555 or 2555-EZ, see instructions for the amount to enter.</li>
								<li>If <b>for 2010</b> you reported capital gain distributions directly on Form 1040, line 13; you reported qualified dividends on Form 1040, line 9b (Form 1041, line 2b(2)); 
                  <b>or</b> you had a gain on both lines 15 and 16 of Schedule D (Form 1040) (lines 14a and 15, column (2), of Schedule D (Form 1041)), complete Part III of Form 8801 and enter the amount from line 47 here. Form 1040NR filers, see instructions.</li>
								<li style="margin-top:3mm;">
									<b>All others:</b> If line 10 is $175,000 or less ($87,500 or less if married filing separately for 2010), multiply line 10 by 26% (.26). Otherwise, multiply line 10 by 28% (.28) and subtract $3,500 ($1,750 if married filing separately for 2010) from the result. Form 1040NR filers, see instructions.</li>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:20mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNRightNumBox" style="clear:left;height:5mm;">11</div>
							<div class="styLNRightNumBox" style="clear:left;height:20mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:20mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;border-bottom-width:1px;clear:left;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxTimesTaxRateAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="clear:left;width:36mm;height:20mm;padding-bottom:0mm;border-bottom-width:0px;"/>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">12
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">13
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">14
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter the amount from your 2010 Form 6251, line 34, or 2010 Form 1041, Schedule I, line 55</span>
							<span class="styIRS8801DotLn">..</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">15
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">
								<b>Net minimum tax on exclusion items.</b> Subtract line 14 from line 13. If zero or less, enter -0-</span>
							<span class="styIRS8801DotLn">....</span>
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
							<span style="width:13mm;"/>                        
                  Cat. No. 10002S
              </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
                Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2011)
              </div>
					</div>
					<!-- Page 2 Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8801 (2011)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Part Il - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;">
						<span class="styPartName" style="height:4mm;width:18mm;font-size:13;font-family:arial;">Part II</span>
						<span style="width:167mm;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;height:4mm;"/>
                Current Year Nonrefundable and Refundable Credits and Carryforward to 2012
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">16
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter the amount from your 2010 Form 6251, line 35, or 2010 Form 1041, Schedule I, line 56</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">17
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter the amount from line 15</span>
							<span class="styIRS8801DotLn">........................</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">18
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">19
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">
								<b>2010 credit carryforward.</b> Enter the amount from your 2010 Form 8801, line 28</span>
							<span class="styIRS8801DotLn">........</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">20
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter your 2010 unallowed qualified electric vehicle credit (see instructions)</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">21
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">22
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter your 2011 regular income tax liability minus allowable credits (see instructions)</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">23
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter the amount from your 2011 Form 6251, line 32, or 2011 Form 1041, Schedule I, line 54</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">24
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Subtract line 23 from line 22. If zero or less, enter -0-</span>
							<span class="styIRS8801DotLn">...</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">25</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;">
								<b>Current year nonrefundable credit.</b> Enter the <b>smaller</b> of line 21 or line 24. Also enter this amount on your 2011 Form 1040, line 53 (check box <b>b</b>); Form 1040NR, line 50 (check box <b>b</b>); or Form 1041, Schedule G, line 2c
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...........................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:7mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">25</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CYNonrefundableAMTCrAmt"/>
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
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">26</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;">
								<li>
									<b>Estates and trusts:</b> Skip lines 26 and 27 and go to line 28.</li>
								<li>
									<b>Individuals:</b> Did you have a minimum tax credit carryforward to 2009 (on your 2008 Form 8801, line 31)?</li>
								<p>
									<input type="checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PYAMTCFwdCYPnltyIntPYISOInd"/>
											<xsl:with-param name="BackupName">IRS8801PYAMTCFwdCYPnltyIntPYISOInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/PYAMTCFwdCYPnltyIntPYISOInd"/>
											<xsl:with-param name="BackupName">IRS8801PYAMTCFwdCYPnltyIntPYISOInd</xsl:with-param>
										</xsl:call-template>
										<b>No.</b> Leave lines 26 and 27 blank and go to line 28.
                    </label>
								</p>
								<p>
									<input type="checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/PYAMTCFwdCYPnltyIntPYISOInd"/>
											<xsl:with-param name="BackupName">IRS8801PYAMTCFwdCYPnltyIntPYISOInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/PYAMTCFwdCYPnltyIntPYISOInd"/>
											<xsl:with-param name="BackupName">IRS8801PYAMTCFwdCYPnltyIntPYISOInd</xsl:with-param>
										</xsl:call-template>
										<b>Yes.</b> Complete Part IV of Form 8801 to figure the amount to enter
                      <span style="letter-spacing:3.2mm;font-weight:bold;">..........</span>
									</label>
								</p>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:27mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">26</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:27mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmllrNetUnusedOrCYUnusedCrAmt"/>
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
					<!-- Line 27 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">27</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;">
                  Is line 26 more than line 25?
                  <p>
									<input type="checkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CurrentYearRefundableAMTCrInd"/>
											<xsl:with-param name="BackupName">IRS8801CurrentYearRefundableAMTCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/CurrentYearRefundableAMTCrInd"/>
											<xsl:with-param name="BackupName">IRS8801CurrentYearRefundableAMTCrInd</xsl:with-param>
										</xsl:call-template>
										<b>No.</b> Leave line 27 blank and go to line 28.
                    </label>
								</p>
								<p style="padding-right:1mm;">
									<input type="checkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/CurrentYearRefundableAMTCrInd"/>
											<xsl:with-param name="BackupName">IRS8801CurrentYearRefundableAMTCrInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/CurrentYearRefundableAMTCrInd"/>
											<xsl:with-param name="BackupName">IRS8801CurrentYearRefundableAMTCrInd</xsl:with-param>
										</xsl:call-template>
										<b>Yes.</b> Subtract line 25 from line 26. This is your 
                      <b>current year refundable credit. </b>
                      Enter the result here and on your 2011 Form 1040, line 70 (check box c), or Form 1040NR, line 67 (check box <b>c</b>)
                    </label>
								</p>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:24mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">27</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:24mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentYearRefundableAMTCrAmt"/>
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
					<!-- Line 28 -->
					<div class="styTBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">28</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;">
								<b>Credit carryforward to 2012.</b> 
                  Subtract the larger of line 25 or line 26 from line 21. Keep a record of this amount because you may use it in future years
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;border-bottom:none;">28</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;border-bottom:none">
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
                Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2011)
              </div>
					</div>
					<!-- Page 3 Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8801 (2011)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- Part IIl - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;">
						<span class="styPartName" style="height:4mm;width:18mm;font-size:13;font-family:arial;">Part III</span>
						<span style="width:167mm;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;height:4mm;"/>
                Tax Computation Using Maximum Capital Gains Rates
              </span>
					</div>
					<!-- END Part lIl Header-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:10mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-right:1mm;">
							<b>Caution.</b> If you did not complete the 2010 Qualified Dividends and Capital Gain Tax Worksheet, the 2010 Schedule D Tax Worksheet, or Part V of the 2010 Schedule D (Form 1041), see the instructions before completing this part.
              </div>
						<div class="styLNRightNumBox" style="height:10mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:10mm;padding-bottom:0mm;border-bottom:none;"/>
					</div>
					<!-- Line 29 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">29</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;">
                  Enter the amount from Form 8801, line 10. If you filed Form 2555 or 2555-EZ for 2010, enter the amount from line 3 of the worksheet in the instructions
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">29</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxLessDeductionsAmt"/>
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
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:10mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<b>Caution.</b> If <b>for 2010</b> you filed Form 1040NR, 1041, 2555, or 2555-EZ, see the instructions before completing lines 30, 31, and 32.
              </div>
						<div class="styLNRightNumBox" style="height:10mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:10mm;padding-bottom:0mm;border-bottom:none;"/>
					</div>
					<!-- Line 30 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:14mm;font-size:7pt;padding-left: 2.25mm">30</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Enter the amount from line 6 of your 2010 Qualified Dividends and Capital Gain Tax Worksheet, the amount from line 13 of your 2010 Schedule D Tax Worksheet, or the amount from line 22 of the 2010 Schedule D (Form 1041), whichever applies*
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.......</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:9mm;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNRightNumBox" style="height:5mm;clear:left;">30</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:9mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PYMinTaxApplicableCapGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:14mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:14mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;font-size:7pt;padding-left: 2.25mm"/>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;font-weight:bold;">
                  If you figured your 2010 tax using the 2010 Qualified Dividends and Capital Gain Tax Worksheet, skip line 31 and enter the amount from line 30 on line 32. Otherwise, go to line 31.
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
					<!-- Line 31 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;font-size:7pt;padding-left: 2.25mm">31</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Enter the amount from line 19 of your 2010 Schedule D (Form 1040), or line 14b, column (2), of the 2010 Schedule D (Form 1041)
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.....................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:5mm;clear:left;">31</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:6mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PYUnrecapturedS1250GainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:11mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 32 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:9mm;font-size:7pt;padding-left: 2.25mm">32</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Add lines 30 and 31, and enter the <b>smaller</b> of that result or the amount from line 10 of your 2010 Schedule D Tax Worksheet
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:4.5mm;clear:left;">32</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmallerPYSchDGainOrWrkshtAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:9mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 33 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">33
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter the <b>smaller</b> of line 29 or line 32</span>
							<span class="styIRS8801DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">33</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerNetAMTOrGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 34 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">34
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Subtract line 33 from line 29</span>
							<span class="styIRS8801DotLn">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">34</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AMTLessSmallerOfTaxOrGainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 35 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">35</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;">
                  If line 34 is $175,000 or less ($87,500 or less if married filing separately for 2010), multiply line 34 by 26% (.26). Otherwise, multiply line 34 by 28% (.28) and subtract $3,500 ($1,750 if married filing separately for 2010) from the result. Form 1040NR filers, see instructions
                  <span style="letter-spacing:3.2mm;font-weight:bold;">......</span>
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet" style="margin:0mm 1mm;"/>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">35</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:6.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetAdjAMTTxblIncTimesPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 36 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:20.5mm;font-size:7pt;padding-left: 2.25mm">36</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Enter:
                  <li>$68,000 if married filing jointly or qualifying widow(er) for 2010,</li>
								<li>$34,000 if single or married filing separately for 2010,</li>
								<li>$45,550 if head of household for 2010, or</li>
								<li>$2,300 for an estate or trust.</li>
								<br/>Form 1040NR filers, see instructions
                  <span style="letter-spacing:3.2mm;font-weight:bold;">..........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:16mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:4.5mm;clear:left;">36</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:16mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MaxCapGainsApplicableLimitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:20.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:20.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 37 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:20.5mm;font-size:7pt;padding-left: 2.25mm">37</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Enter the amount from line 7 of your 2010 Qualified Dividends and Capital Gain Tax Worksheet, the amount from line 14 of your 2010 Schedule D Tax Worksheet, or the amount from line 23 of the 2010 Schedule D (Form 1041), whichever applies. If you did not complete either worksheet or Part V of the 2010 Schedule D (Form 1041), enter -0-. Form 1040NR filers, see instructions
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.......</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:16mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:4.5mm;clear:left;">37</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:16mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AMTPriorYearApplicableGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:20.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:20.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 38 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">38</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Subtract line 37 from line 36. If zero or less, enter -0-
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.....</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;clear:left;">38</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MaxCapGainMinusApplcblLimitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 39 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">39</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Enter the <b>smaller</b> of line 29 or line 30
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;clear:left;">39</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmllrNetMinTaxOrApplcblGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 40 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">40</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Enter the <b>smaller</b> of line 38 or line 39
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;clear:left;">40</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SmallerCalculatedNetOrGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 41 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">41</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Subtract line 40 from line 39 
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.............</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;clear:left;">41</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GainMinusSmallerNetAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 42 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">42
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Multiply line 41 by 15% (.15)</span>
							<span class="styIRS8801DotLn">.......................</span>
							<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet" style="margin:0mm 1mm;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">42</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetAltMinTaxableIncTimesPctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4.5mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4.5mm;padding-bottom:0mm;font-weight:bold;">
                If line 31 is zero or blank, skip lines 43 and 44 and go to line 45. Otherwise, go to line 43.
              </div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 43 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">43</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;">
                  Subtract line 39 from line 33
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.............</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;clear:left;">43</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4.5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetPYOrNetOrTotalGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:4.5mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 44 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">44
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Multiply line 43 by 25% (.25)</span>
							<span class="styIRS8801DotLn">.......................</span>
							<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet" style="margin:0mm 1mm;"/>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">44</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetGainTimesAllowablePctAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 45 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">45
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Add lines 35, 42, and 44</span>
							<span class="styIRS8801DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">45</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetGainPercentageSumAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 46 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">46</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;">
                  If line 29 is $175,000 or less ($87,500 or less if married filing separately for 2010), multiply line 29 by 26% (.26). Otherwise, multiply line 29 by 28% (.28) and subtract $3,500 ($1,750 if married filing separately for 2010) from the result. Form 1040NR filers, see instructions
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.......</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">46</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:6.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetGainTimesFilingStatusPctAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 47 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">47</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;">
								  Enter the <b>smaller</b> of line 45 or line 46 here and on line 11. If you filed Form 2555 or 2555-EZ for 2010, do not enter this amount on line 11. Instead, enter it on line 4 of the Foreign Earned Income Tax Worksheet in the instructions
								  <span style="letter-spacing:3.2mm;font-weight:bold;">.......................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">47</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:6.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MaximumCapitalGainsRateAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<div class="styTBB" style="width:187mm;margin-top:2mm;font-size:6pt;padding-bottom:1mm;">
						<sup>*</sup> The 2010 Qualified Dividends and Capital Gain Tax Worksheet is in the 2010 Instructions for Form 1040. The 2010 Schedule D Tax Worksheet is in the 2010 Instructions for Schedule D (Form 1040)  (or the 2010 Instructions for Schedule D (Form 1041)).
            </div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
                Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2011)
              </div>
					</div>
					<!-- Page 4 Header -->
					<div class="styTBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8801 (2011)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- Part IV - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;">
						<span class="styPartName" style="height:4mm;width:18mm;font-size:13;font-family:arial;">Part IV</span>
						<span style="width:167mm;" class="styPartDesc">
							<span style="width:3mm;font-size:10pt;height:4mm;"/>
                Tentative Refundable Credit
              </span>
					</div>
					<!-- END Part lV Header-->
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:135mm;height:4mm;"/>
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 48 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">48
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter the amount from line 21</span>
							<span class="styIRS8801DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">48</div>
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
						<div class="styLNRightNumBox" style="height:4mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;border-bottom:none;"/>
					</div>
					<!-- Line 49 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:9mm;font-size:7pt;padding-left: 2.25mm">49</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Enter the total of lines 18 and 20 from your 2009 Form 8801. If zero or less, enter -0-
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...............</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNRightNumBox" style="height:5mm;clear:left;">49</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AMTCarryforwardAndCreditPY1Amt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:9mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 50 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:9mm;font-size:7pt;padding-left: 2.25mm">50</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Enter the total of lines 18 and 20 from your 2010 Form 8801. If zero or less, enter -0-
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...............</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:5mm;clear:left;">50</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AMTCarryforwardAndCreditsPYAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:9mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 51 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:9mm;font-size:7pt;padding-left: 2.25mm">51</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:91mm;padding-right:1mm;">
                  Enter the total of lines 18 and 20 from your 2011 Form 8801. If zero or less, enter -0-
                  <span style="letter-spacing:3.2mm;font-weight:bold;">...............</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:0;background-color:lightgrey"/>
							<div class="styLNRightNumBox" style="height:5mm;clear:left;">51</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:5mm;width:36mm;padding-bottom:0mm;border-bottom:1px solid black;clear:left;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AMTCarryforwardAndCreditsCYAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:9mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
						<div style="height:9mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/>
					</div>
					<!-- Line 52 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">52
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Add lines 49 through 51</span>
							<span class="styIRS8801DotLn">..........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">52</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AMTCarryforwardAndCrSumOfPYAmt"/>
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
					<!-- Line 53 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">53</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;">
								<b>Long-term unused minimum tax credit.</b> Subtract line 52 from line 48 (If zero or less, enter -0- here and on line 26. <b>Do not</b> complete the rest of Part IV)
                  <span style="letter-spacing:3.2mm;font-weight:bold;">.................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">53</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LongTermUnusedAMTCreditAmt"/>
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
					<!-- Line 54 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">54
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Multiply line 53 by 50% (.50)</span>
							<span class="styIRS8801DotLn">........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">54</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/HalfLongTermUnusedMinTaxCrAmt"/>
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
					<!-- Line 55 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">55
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter the amount from your 2010 Form 8801, line 57</span>
							<span class="styIRS8801DotLn">................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">55</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYMinTaxApplicableLimitAmt"/>
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
					<!-- Line 56 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">56
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter the <b>larger</b> of line 54 or line 55</span>
							<span class="styIRS8801DotLn">......................</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;bottom-border-width:1px;">56</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;bottom-border-width:1px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/LgrHalfCYOrPYUnusedMinTaxCrAmt"/>
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
					<!-- Line 57 -->
					<div class="styTBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">57
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;">
							<span style="float:left">Enter the <b>smaller</b> of line 53 or line 56. Enter the result here and on line 26</span>
							<span class="styIRS8801DotLn">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;">57</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmllrNetUnusedOrCYUnusedCrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;border-bottom:0px solid black;">
						<div style="float:right;">
							<span style="width:40px;"/>  
                Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2011)
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
