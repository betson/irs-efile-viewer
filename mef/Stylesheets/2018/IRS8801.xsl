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
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:28mm;height:20mm;padding:bottom:0mm;">
							Form<span style="width:1mm;"/>
							<span class="styFormNumber">8801</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<div class="styAgency" style="padding-top:5.5mm;padding-bottom:0mm;">
								Department of the Treasury<br/>
								Internal Revenue Service (99)
							</div>
						</div>
						<div class="styFTBox" style="width:128mm;height:20mm;">
							<div class="styMainTitle" style="height:5mm;padding-bottom:0mm;">
								Credit for Prior Year Minimum Tax&#8212;<br/>
								Individuals, Estates, and Trusts<br/>
						    </div>
							<div class="styFBT" style="font-size:7pt;height:5mm;padding-top:6mm;">
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/>  Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8801" title="Link to IRS.gov"><i>www.irs.gov/Form8801</i></a> for instructions and the latest information.<br/>
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet"/> Attach to Form 1040, 1040NR, or 1041.
							</div>
						</div>
						<div class="styTYBox" style="width:31mm;height:20mm;">
							<div class="styOMB" style="width:31mm;height:4mm;padding-top:0mm;border-bottom:1 solid black;font:7pt;">
								OMB No. 1545-1073
						    </div>
							<div>
								<span class="styTaxYear" style="font-size:21pt;">20<span class="styTYColor">18</span></span>
							</div>
							<div class="stySequence" style="padding-top:.5mm;"> Attachment<br/>Sequence No. <b style="font-size:9pt">74</b>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:140mm;height:9mm;">
							Name(s) shown on return
							         <span style="width:10mm;height:3mm;"/>
							<xsl:choose>
                                                        <!-- Name from 1040/1040NR Return Header -->           
                                               <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
                                                      <br/>
                                                       <xsl:call-template name="PopulateText">
                                                       <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt"/>
                                                       </xsl:call-template>
                                                </xsl:when>
                                                        <!-- Name from 1041 Return Header -->                                                
                                                <xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
                                                                                      <xsl:call-template name="PopulateText">
                                                                                                <xsl:with-param name="TargetNode" 
                                                                                                select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>
                                                                                      </xsl:call-template>
                                                                                      <br/>
                                                                                      <xsl:call-template name="PopulateText">
                                                                                                <xsl:with-param name="TargetNode" 
                                                                                                select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt"/>
                                                                                      </xsl:call-template>
                                                                             </xsl:when>
							</xsl:choose>
							                                                         
							
<!--							  <xsl:choose>
								<xsl:when test="$RtnHdrData/ReturnTypeCd='1041'">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt" />
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt" />
									</xsl:call-template>
								</xsl:when>
							    <xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">NameLine2Txt</xsl:with-param>
									</xsl:call-template>	
								</xsl:otherwise>
								</xsl:choose>							-->
						</div>
						<div style="width:45mm;padding-left:1mm;">
							<b>Identifying number</b><br/>
							  <xsl:choose>
							  <!-- TIN from 1120, 990, 1065, ETEC, 1041 return headers-->
							         <xsl:when test="$RtnHdrData/Filer/EIN">
                                        <xsl:call-template name="PopulateReturnHeaderFiler">
                                        <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                                         </xsl:call-template>
                                     </xsl:when>
                                                                             
                                     <xsl:when test="$RtnHdrData/Filer/PrimarySSN">
                                        <xsl:call-template name="PopulateReturnHeaderFiler">
                                        <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                                         </xsl:call-template>
                                     </xsl:when>
                                     
								
								</xsl:choose>
								
						
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
					<!-- End Part I -->
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Combine lines 1, 6, and 10 of your 2017 Form 6251. Estates and trusts, see instructions</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm">....</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter adjustments and preferences treated as exclusion items (see instructions)</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm">.......</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Minimum tax credit net operating loss deduction (see instructions)</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm">...........</span>
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
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
								  Combine lines 1, 2, and 3. If zero or less, enter -0- here and on line 15 and go to Part II. If more than $249,450 and you were married filing separately for 2017, see instructions
							  <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:2mm;">........</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">4</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:none;"/>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 4mm">5</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
							  Enter: $84,500 if married filing jointly or qualifying widow(er) for 2017; $54,300 if single or head of household for 2017; or $42,250 if married filing separately for 2017. Estates and trusts, enter $24,100
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">5</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;clear:left;">
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
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
								  Enter: $160,900 if married filing jointly or qualifying widow(er) for 2017; $120,700 if single or head <br/>of household for 2017; 
								  or $80,450 if married filing separately for 2017. Estates and trusts, enter <br/>$80,450
								  <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:2mm;">.............................</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 4mm">7
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Subtract line 6 from line 4. If zero or less, enter -0- here and on line 8 and go to line 9</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">.....</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Multiply line 7 by 25% (0.25)</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">.......................</span>
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
							  Subtract line 8 from line 5. If zero or less, enter -0-. If under age 24 at the end of 2017, see instructions
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">9</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;clear:left;">
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
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
							  Subtract line 9 from line 4. If zero or less, enter -0- here and on line 15 and go to Part II. Form 1040NR filers, see instructions
							 <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:2mm;">.........................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4mm;">10</div>
						</div>
						<div style="float:left;">
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;clear:left;">
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
						<div style="float:left;">
							<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">11</div>
						</div>
						<div style="font-size:7pt;width:127.85mm;height:3mm;padding-top:.75mm;padding-left:2mm;float:left;">
						&#8226;<span style="margin:0mm 0mm 0mm 2mm;"/>If <b>for 2017</b> you filed Form 2555 or 2555-EZ, see instructions for the amount to enter.<br/>
						&#8226;<span style="margin:4.5mm 0mm 0mm 2mm;"/>If <b>for 2017</b> you reported capital gain distributions directly on Form 1040, line 13; you<br/>
									<span style="margin:0mm 0mm 0mm 3mm;"/>reported qualified dividends on Form 1040, line 9b (Form 1041, line 2b(2)); 
<b>or</b> you had a <br/>
									<span style="margin:0mm 0mm 0mm 3mm;"/>gain on both lines 15 and 16 of Schedule D (Form 1040) (lines 18a and 19, column (2), of<br/>
									<span style="margin:0mm 0mm 0mm 3mm;"/>Schedule D (Form 1041)), complete Part III of Form 8801 and enter the amount from line<br/>
									<span style="margin:0mm 0mm 0mm 3mm;"/>55 here. Form 1040NR filers, see instructions.<br/> 
						&#8226;<span style="margin:4.5mm 0mm 0mm 2mm;"/><b>All others:</b> If line 10 is $187,800 or less ($93,900 or less if married filing separately for<br/>
									<span style="margin:0mm 0mm 0mm 3mm;"/>2017), multiply line 10 by 26% (0.26). Otherwise, multiply line 10 by 28% (0.28) and<br/>
									<span style="margin:0mm 0mm 0mm 3mm;"/>subtract $3,756 ($1,878 if married filing separately for 2017) from the result. Form<br/> 									 <span style="margin:0mm 0mm 0mm 3mm;"/>1040NR filers, see instructions.
						</div>
							<div style="float:left;clear:none;margin-top:2.5mm;margin-right:5mm;">
								<img alt="right bracket" src="{$ImagePath}/CurlyBrace1.77x28.49mm.png"/>
							</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:19mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;">11</div>
							<div class="styLNRightNumBox" style="clear:left;height:15mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
						</div>
						<div style="float:right;">
							<div class="styLNAmountBox" style="width:36mm;height:19mm;padding-bottom:0mm;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="width:36mm;padding-bottom:0mm;border-bottom-width:1px;clear:left;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxTimesTaxRateAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="clear:left;width:36mm;height:15mm;padding-bottom:0mm;border-bottom-width:0px;"/>
						</div>
					</div>
					<!-- Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-top:3.5mm;padding-bottom:0mm;padding-left: 2.25mm">12
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-top:3.5mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Minimum tax foreign tax credit on exclusion items (see instructions)</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;" >...........</span>
						</div>
						<div class="styLNRightNumBox" style="height:7mm;padding-top:3.5mm;padding-bottom:0mm;bottom-border-width:1px;">12</div>
						<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-top:3.5mm;padding-bottom:0mm;bottom-border-width:1px;">
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Tentative minimum tax on exclusion items. Subtract line 12 from line 11</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">.........</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the amount from your 2017 Form 6251, line 34, or 2017 Form 1041, Schedule I, line 55</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">..</span>
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
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">15
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">
								<b>Net minimum tax on exclusion items.</b> Subtract line 14 from line 13. If zero or less, enter -0-</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">..</span>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;">15</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxOnExclusionItemsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:.25mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
							<span style="width:29mm;"/>                        
								  Cat. No. 10002S
						 </div>
						<div style="float:right;">
							<span style="width:40px;"/>  
								Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2018)
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- Page 2 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8801 (2018)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Part Il - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;padding-top:0mm;font-family:arial;">
						<span class="styPartName" style="height:4mm;width:12mm;font-size:9pt;">Part II</span>
						<span style="width:167mm;padding-top:.25mm;padding-left:4mm;" class="styPartDesc">
								Minimum Tax Credit and Carryforward to 2019
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the amount from your 2017 Form 6251, line 35, or 2017 Form 1041, Schedule I, line 56</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">..</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the amount from line 15</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">......................</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Subtract line 17 from line 16. If less than zero, enter as a negative amount</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">.........</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">
								<b>2017 credit carryforward.</b> Enter the amount from your 2017 Form 8801, line 26</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">......</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter your 2017 unallowed qualified electric vehicle credit (see instructions)</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">........</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Combine lines 18 through 20. If zero or less, stop here and see the instructions</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">.......</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter your 2018 regular income tax liability minus allowable credits (see instructions)</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">.....</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">23</div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the amount from your 2018 Form 6251, line 9, or 2018 Form 1041, Schedule I, line 54</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">..</span>
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
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Subtract line 23 from line 22. If zero or less, enter -0-</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">...............</span>
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
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
								<b>Minimum tax credit.</b> Enter the <b>smaller</b> of line 21 or line 24. Also enter this amount on your 2018 Form<br/>
								1040, line 54 (check box <b>b</b>); Form 1040NR, line 51 (check box <b>b</b>); or Form 1041, Schedule G,<br/>
								line 2c
							  <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:2mm;">.............................</span>
							</div>
						</div>
						<div style="float:left;">
						<div class="styLNRightNumBox" style="height:7mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>			
						<div class="styLNAmountBox" style="height:7mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
						<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-bottom:0mm;">25</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/MinAMTCrAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Spacer Row -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:2mm;"/>
						<div class="styLNDesc" style="width:135mm;height:2mm;"/>
						<div class="styLNRightNumBox" style="height:3mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:3mm;border-bottom:none;"/>
					</div>
					<!-- Line 26 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">26</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;padding-left:2mm;">
								<b>Credit carryforward to 2019.</b> Subtract line 25 from line 21. Keep a record of this amount because you<br/>
								  may use it in future years
							 <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:2mm;">.......................</span>
							</div>
						</div>
						<div style="float:left;">
						<div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>			
						<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
						<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-bottom:0mm;border-bottom:0px;">26</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AMTCrCarryforwardToNextYearAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:.25mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
								Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2018)
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- Page 3 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8801 (2018)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- Part IIl - Header -->
					<div style="width:187mm;height:11mm;border-bottom:1px solid black;float:left;">
						<span class="styPartName" style="height:4mm;width:12mm;font-size:9pt;font-family:arial;">Part III</span>
						<span style="width:172mm;font-weight:normal;padding-left:5mm;" class="styPartDesc">
							<b>Tax Computation Using Maximum Capital Gains Rates</b><br/>
							 Complete Part III only if you are required to do so by line 11 or by the Foreign Earned Income Tax Worksheet in the instructions.
					  </span>                
					</div>
					<!-- END Part lIl Header-->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:10mm;padding-top:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-top:4mm;padding-bottom:0mm;padding-right:1mm;padding-left:2mm;">
							<b>Caution:</b> If you didn't complete the 2017 Qualified Dividends and Capital Gain Tax Worksheet, the 2017 Schedule D Tax Worksheet, or Part V of the 2017 Schedule D (Form 1041), see the instructions before completing this part.*
              </div>
						<div class="styLNRightNumBox" style="height:14mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:14mm;padding-bottom:0mm;border-bottom:none;"/>
					</div>
					<!-- Line 27 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">27</div>
						<div style="float:left;">
						<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;padding-left:2mm;">
							  Enter the amount from Form 8801, line 10. If you filed Form 2555 or 2555-EZ for 2017, enter the<br/>
							  amount from line 3 of the Foreign Earned Income Tax Worksheet in the instructions
						  <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:2mm;">......</span>
							</div>
						</div>
						<div style="float:left;">
						<div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>			
						<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
						<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-bottom:0mm;">27</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/NetMinTaxLessDeductionsAmt"/>
							</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<b>Caution:</b> If <b>for 2017</b> you filed Form 1040NR, 1041, 2555, or 2555-EZ, see the instructions before completing lines 28, 29, and 30.
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:8mm;padding-bottom:0mm;border-bottom:none;"/>
					</div>
					<!-- Line 28 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-left: 2.25mm">28</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-right:1mm;padding-left:2mm;">
								   Enter the amount from line 6 of your 2017 Qualified Dividends and Capital Gain Tax Worksheet, the<br/>
								   amount from line 13 of your 2017 Schedule D Tax Worksheet, or the amount from line 26 of the<br/>
								   2017 Schedule D (Form 1041), whichever applies*
							  <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:2mm;">................</span>
							</div>
						</div>
						<div style="float:left;">
						<div class="styLNRightNumBox" style="height:7mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>			
						<div class="styLNAmountBox" style="height:7mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
						<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-bottom:0mm;">28</div>
						<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYMinTaxApplicableCapGainAmt"/>
							</xsl:call-template>
							</div>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							   <b>If you figured your 2017 tax using the 2017 Qualified Dividends and Capital Gain Tax<br/>
								      Worksheet, skip line 29 and enter the amount from line 28 on line 30. Otherwise, go to line 29.</b>
					 </div>
						<div class="styLNRightNumBox" style="height:8mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"/>
						<div class="styLNAmountBox" style="width:36mm;height:8mm;padding-bottom:0mm;border-bottom:none;"/>
					</div>
					<!-- Line 29 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;font-size:7pt;padding-left: 2.25mm">29</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
								  Enter the amount from line 19 of your 2017 Schedule D (Form 1040), or line 18b, column (2), of<br/>
								  the 2017 Schedule D (Form 1041)
							  <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:2mm;">.....................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>		
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
							<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-top:.5mm;padding-bottom:0mm;">29</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/PYUnrecapturedS1250GainAmt"/>
							</xsl:call-template>
						</div>
					</div>
					</div>
					<!-- Line 30 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:6mm;font-size:7pt;padding-left: 2.25mm">30</div>
						<div style="float:left;">
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
								  Add lines 28 and 29, and enter the <b>smaller</b> of that result or the amount from line 10 of your 2017<br/>
								  Schedule D Tax Worksheet
							 <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:2mm;">.......................</span>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:4mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>		
							<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
							<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-top:.5mm;padding-bottom:0mm;">30</div>
							<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/SmallerPYSchDGainOrWrkshtAmt"/>
							</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Line 31 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">31
                            </div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Enter the <b>smaller</b> of line 27 or line 30</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">....................</span>
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
						<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm">32</div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
							<span style="float:left">Subtract line 31 from line 27</span>
							<span class="styIRS8801DotLn" style="padding-left:2mm;">.......................</span>
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
							<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
									If line 32 is $187,800 or less ($93,900 or less if married filing separately for 2017), multiply line<br/>
									32 by 26% (0.26). Otherwise, multiply line 32 by 28% (0.28) and subtract $3,756 ($1,878 if married<br/>
									filing separately for 2017) from the result. Form 1040NR filers, see instructions
								 <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:1.5mm;">......</span>
								<img src="{$ImagePath}/2210_Bullet.gif" alt="MediumBullet" style="margin:0mm 2mm;"/>
							</div>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="height:6.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:none;"/>
							<div class="styLNRightNumBox" style="clear:left;height:4.5mm;padding-top:.5mm;">33</div>
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
					<!-- Line 34 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:20.5mm;font-size:7pt;padding-left: 2.25mm">34</div>
						<div style="float:left;">
						<div class="styLNDesc" style="font-size:7pt;width:102mm;padding-left:2mm;">				
							  Enter:<br/>
								<span style="margin-left:11.5mm;"/>&#8226;<span style="width:2mm"/>$75,900 if married filing jointly or qualifying widow(er) for 2017,<br/>
								<span style="margin-left:11.5mm;"/>&#8226;<span style="width:2mm"/>$37,950 if single or married filing separately for 2017,<br/>
								<span style="margin-left:11.5mm;"/>&#8226;<span style="width:2mm"/>$50,800 if head of household for 2017, or<br/>
								<span style="margin-left:11.5mm;"/>&#8226;<span style="width:2mm"/>$2,550 for an estate or trust.<br/>
								<span style="margin-left:11.5mm;">Form 1040NR filers, see instructions.
							</span>
							</div>
						</div>
						<div style="float:left;margin-top:2mm;margin-left:4.5mm;">						
						   <img alt="right bracket" src="{$ImagePath}/6765_Bracket_Md.gif"/>
						   <span style="float:right;text-align:right;letter-spacing:3mm;font-weight:bold;margin-top:8mm;margin-left:1mm;margin-right:2mm;">......</span>	
						</div>						
							<div style="float:right;">
								<div class="styLNRightNumBox" style="height:10mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
								<div class="styLNAmountBox" style="height:10mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
								<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-top:.5mm;padding-bottom:0mm;">34</div>
								<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MaxCapGainsApplicableLimitAmt"/>
									</xsl:call-template>
								</div>				
							    <div class="styLNRightNumBox" style="clear:left;height:6.5mm;background-color:lightgrey;border-bottom-width:0px;"/>
							    <div class="styLNAmountBoxNBB" style="width:36mm;height:6.5mm;"/>
								</div>
						</div>											
					<!-- Line 35 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:13mm;font-size:7pt;padding-left: 2.25mm">35</div>
						<div style="float:left;">
						<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-left:2mm;">
							  Enter the amount from line 7 of your 2017 Qualified Dividends and Capital Gain Tax Worksheet,<br/>
							  the amount from line 14 of your 2017 Schedule D Tax Worksheet, or the amount from line 27 of the<br/>
							  2017 Schedule D (Form 1041), whichever applies. If you didn't complete either worksheet or Part V <br/>
							  of the 2017 Schedule D (Form 1041), enter the amount from your 2017 Form 1040, line 43, or 2017<br/>
							  Form 1041, line 22, whichever applies; if zero or less, enter -0-. Form 1040NR filers, see instructions 
							  <span style="letter-spacing:3.2mm;font-weight:bold;padding-left:1mm;">.</span>
							</div>
						</div>
						<div style="float:left;">
						<div class="styLNRightNumBox" style="height:12.5mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom-width:0px;"/>				
						<div class="styLNAmountBox" style="height:12.5mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
						<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-top:.5mm;padding-bottom:0mm;">35</div>
						<div class="styLNAmountBox" style="height:4mm;width:36mm;padding-top:.5mm;padding-bottom:0mm;border-bottom:1px solid black;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AMTPriorYearApplicableGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
			<!-- Line 36 -->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">36</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Subtract line 35 from line 34. If zero or less, enter -0-
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...............</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">36</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MaxCapGainMinusApplcblLimitAmt"/>
					</xsl:call-template>
				</div>
			</div>      					
			<!-- Line 37 -->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">37</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Enter the <b>smaller</b> of line 27 or line 28
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">....................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">37</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/SmllrNetMinTaxOrApplcblGainAmt"/>
					</xsl:call-template>
				</div>
			</div>          					
			<!-- Line 38 -->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">38</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Enter the <b>smaller</b> of line 36 or line 37
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">....................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">38</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/SmallerCalculatedNetOrGainAmt"/>
					</xsl:call-template>
				</div>
			</div>              					
			<!-- Line 39 -->
 			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">39</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Subtract line 38 from line 37
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.......................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">39</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/GainMinusSmallerNetAmt"/>
					</xsl:call-template>
				</div>
			</div>              
					<!-- Line 40 -->
					<div style="width:187mm;">
						  <div class="styLNLeftNumBox" style="height:17mm;font-size:7pt;padding-left: 2.25mm">40</div>
						  <div style="float:left;">
									<div class="styLNDesc" style="font-size:7pt;width:102mm;padding-left:2mm;">				
								  Enter:<br/>
								<span style="margin-left:11.5mm;"/>&#8226;<span style="width:2mm"/>$418,400 if single for 2017,<br/>
								<span style="margin-left:11.5mm;"/>&#8226;<span style="width:2mm"/>$235,350 if married filing separately for 2017,<br/>
								<span style="margin-left:11.5mm;"/>&#8226;<span style="width:2mm"/>$470,700 if married filing jointly or qualifying widow(er) for 2017,<br/>
								<span style="margin-left:11.5mm;"/>&#8226;<span style="width:2mm"/>$444,550 if head of household for 2017, or<br/>
								<span style="margin-left:11.5mm;"/>&#8226;<span style="width:2mm"/>$12,500 for an estate or trust.<br/>							
								<span style="margin-left:11.5mm;">Form 1040NR filers, see instructions.
							</span>
							</div>
						</div>
						<div style="float:left;margin-top:2mm;margin-left:4.25mm;">						
						   <img alt="right bracket" src="{$ImagePath}/6251_rt_bracket_lg.gif"/>
						   <span style="float:right;text-align:right;letter-spacing:3mm;font-weight:bold;margin-top:8mm;margin-left:1mm;margin-right:2mm;">......</span>	
						</div>					  
                            <div style="float:right;">
								<div class="styLNRightNumBox" style="height:10mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
								<div class="styLNAmountBox" style="height:10mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
								<div class="styLNRightNumBox" style="height:4mm;clear:left;padding-top:.5mm;padding-bottom:0mm;">40</div>
								<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FilingThresholdAmt"/>
									</xsl:call-template>
								</div>				
							    <div class="styLNRightNumBox" style="clear:left;height:11mm;background-color:lightgrey;border-bottom-width:0px;"/>
							    <div class="styLNAmountBoxNBB" style="width:36mm;height:11mm;"/>
								</div>
						</div>					
			<!-- Line 41 -->
        	<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">41</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Enter the amount from line 36
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;">.......................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4.25mm;padding-top:.75mm;padding-bottom:0mm;border-bottom:1px solid black;">41</div>
				<div class="styLNAmountBox" style="width:36mm;height:4.25mm;padding-top:.75mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/MaxCapGainMinusApplcblLimitAmt"/>
					</xsl:call-template>
    			   </div>							
			</div>        
			<!-- Line 42 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="font-size:7pt;padding-top:.5mm;padding-bottom:0mm;padding-left:2.25mm;">42</div>
						<div class="styLNDesc" style="font-size:7pt;width:135mm;padding-top:.5mm;padding-bottom:.5mm;padding-left:2mm;">
							   Form 1040 filers, enter the amount from line 7 of your 2017 Qualified Dividends and Capital Gain<br/>
							   Tax Worksheet or the amount from line 19 of your 2017 Schedule D Tax Worksheet, whichever <br/>
							   applies. If you didn't complete either worksheet, see instructions. Form 1041 filers, enter the<br/>
							   amount from line 27 of your 2017 Schedule D (Form 1041) or line 18 of your 2017 Schedule D Tax<br/>
							   Worksheet, whichever applies. If you didn't complete either the worksheet or Part V of the 2017<br/>
							   Schedule D (Form 1041), enter the amount from your 2017 Form 1041, line 22; if zero or less, <br/>
							   enter -0-. Form 1040NR filers, see instructions
						<!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:1.5mm;padding-right:0mm;">..................</span>
						</div>
						<div style="float:left;">
							<div class="styLNRightNumBox" style="clear:left;height:19mm;width:8mm;background-color:lightgrey;padding-bottom:0mm;border-bottom-width:0px;"/>				
							<div class="styLNRightNumBox" style="clear:left;height:4mm;padding-bottom:0mm;">42</div>
						</div>	
						<div style="float:left;">
							<div class="styLNAmountBox" style="clear:left;height:19mm;width:36mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
							<div class="styLNAmountBox" style="clear:left;width:36mm;height:4mm;padding-bottom:0mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ApplcblCapGainsOrSchDWrkshtAmt"/>
								</xsl:call-template>
							</div>
					    </div>						
					</div>      
					<div class="styBB" style="width:187mm;margin-top:.5mm;font-size:6pt;padding-bottom:1mm;">
						 * The 2017 Qualified Dividends and Capital Gain Tax Worksheet is in the 2017 Instructions for Form 1040. The 2017 Schedule D Tax Worksheet is in the 2017 Instructions for Schedule D (Form 1040) (or the 2017 Instructions for Schedule D (Form 1041)).
					</div>					
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:.25mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
								Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2018)
						</div>
					</div>
					<p style="page-break-before: always"/>
					<!-- Page 4 Header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 8801 (2018)</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- Part IIl - Header -->
					<div style="width:187mm;height:4mm;border-bottom:1px solid black;float:left;padding-top:0mm;font-family:arial;">
						<span class="styPartName" style="height:4mm;width:12mm;font-size:9pt;">Part III</span>
						<span style="width:167mm;padding-top:.25mm;padding-left:4mm;" class="styPartDesc">
							Tax Computation Using Maximum Capital Gains Rates 
							<i><span style="font-weight:normal;">(continued)</span></i>
					  </span>
					</div>
					<!-- END Part lIl Header-->					
			<!-- Line 43-->
 			<div style="width:187mm;">
				   <div class="styLNDesc" style="width:143mm;height:4mm;padding-bottom:0mm;">
	   			   </div>
				   <div class="styLNRightNumBox" style="height:4mm;padding:0mm;border-bottom:0;background-color:lightgrey"/>
				   <div style="height:4mm;float:left;padding:0mm;border-bottom:0;border-left:1px solid black;"/> 	
    			   </div>		
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">43</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Add lines 41 and 42
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..........................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">43</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/SumThresholdApplcblWrkshtAmt"/>
					</xsl:call-template>
				</div>
			<!-- Line 44-->
 			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">44</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Subtract line 43 from line 40. If zero or less, enter -0-
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...............</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">44</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/FlngThrshldLessThesholdSumAmt"/>
					</xsl:call-template>
				</div>
			</div>              
			<!-- Line 45 -->
 			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">45</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Enter the <b>smaller</b> of line 39 or line 44
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">....................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">45</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/SmllrAdjNetGainOrTxblIncAmt"/>
					</xsl:call-template>
				</div>
			</div>              
            <!-- Line 46-->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">46</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Multiply line 45 by 15% (0.15)
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;padding-right:.75mm;">......................</span>
					<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/> 
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">46</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/NetAltMinTaxableIncTimesPctAmt"/>
					</xsl:call-template>
				</div>
			</div>       					
            <!-- Line 47 -->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4.5mm;padding-bottom:0mm;padding-left:2.25mm;">47</div>
				<div class="styLNDesc" style="width:135mm;height:4.5mm;padding-bottom:0mm;padding-left:2mm;">
						Add lines 38 and 45
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..........................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4.5mm;padding-bottom:0mm;border-bottom:1px solid black;">47</div>
				<div class="styLNAmountBox" style="width:36mm;height:4.5mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/SumOfSmllrAmt"/>
					</xsl:call-template>
				</div>
			</div>     
           <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="font-weight:bold;width:135mm;height:6.5mm;padding-bottom:0mm;padding-left:2mm;">
						If lines 47 and 27 are the same, skip lines 48 through 52 and go to line 53. Otherwise, go to line 48.
                </div>				
 				<div class="styLNRightNumBox" style="height:6.5mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey"></div>
				<div class="styLNAmountBox" style="width:36mm;height:6.5mm;padding-bottom:0mm;border-bottom:none;">
                </div>
            </div> 			                                   
            <!-- Line 48 -->
 			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">48</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Subtract line 47 from line 37
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.......................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">48</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/ExcessOfSumAmt"/>
					</xsl:call-template>
				</div>
			</div>                                                
            <!-- Line 49 -->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">49</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Multiply line 48 by 20% (0.20)
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;padding-right:.75mm;">......................</span>
					<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/> 
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">49</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/ExcessOfSumTimesPctAmt"/>
					</xsl:call-template>
				</div>
			</div>     
           <div style="width:187mm;">
                <div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left: 2.25mm"/>
                <div class="styLNDesc" style="font-weight:bold;font-size:7pt;width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
					 If line 29 is zero or blank, skip lines 50 through 52 and go to line 53. Otherwise, go to line 50.
                </div>				
 				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:none;background-color:lightgrey;"></div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:none;">
                </div>
            </div> 			            					
            <!-- Line 50 -->
 			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">50</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Add lines 32, 47, and 48
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">........................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">50</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalNetAmt"/>
					</xsl:call-template>
				</div>
			</div>                					
            <!-- Line 51 -->
 			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">51</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Subtract line 50 from line 27
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.......................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">51</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/NetSmallerSchDOrAdjNetGainAmt"/>
					</xsl:call-template>
				</div>
			</div>              
           <!-- Line 52 -->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">52</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Multiply line 51 by 25% (0.25)
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;padding-right:.5mm;">......................</span>
					<img src="{$ImagePath}/1040A_Bullet.gif" alt="bullet"/>	
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">52</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/NetSchDOrAdjNetGainTimesPctAmt"/>
					</xsl:call-template>
				</div>
			</div>                                 					
            <!-- Line 53 -->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">53</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Add lines 33, 46, 49, and 52
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.......................</span>
	    		</div>
				<div class="styLNRightNumBox" style="height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">53</div>
				<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-bottom:0mm;border-bottom:1px solid black;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/SumOfAltMinTaxPercentagesAmt"/>
					</xsl:call-template>
				</div>
			</div>                                      
            <!-- Line 54 -->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">54</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						If line 27 is $187,800 or less ($93,900 or less if married filing separately for 2017), multiply line 27<br/>
						by 26% (0.26). Otherwise, multiply line 27 by 28% (0.28) and subtract $3,756 ($1,878 if married filing<br/>
						separately for 2017) from the result. Form 1040NR filers, see instructions
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.........</span>
	    		</div>
				<div style="float:left;">	    		
					<div class="styLNRightNumBox" style="width:8mm;height:7mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>
					<div class="styLNRightNumBox" style="width:8mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;clear:left;">54</div>
	    		</div>
				<div style="float:left;">	    						
					<div class="styLNAmountBox" style="width:36mm;height:7mm;padding-bottom:0mm;border-bottom-width:0px;"/>	
					<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;clear:left;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/NetAltMinTxblIncTimesFSPctAmt"/>
						</xsl:call-template>
					</div>						
				</div>
			</div>                        
            <!-- Line 55 -->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="font-size:7pt;height:4mm;padding-bottom:0mm;padding-left:2.25mm;">55</div>
				<div class="styLNDesc" style="width:135mm;height:4mm;padding-bottom:0mm;padding-left:2mm;">
						Enter the <b>smaller</b> of line 53 or line 54 here and on line 11. If you filed Form 2555 or 2555-EZ for<br/>
						2017, don't enter this amount on line 11. Instead, enter it on line 4 of the Foreign Earned Income Tax 
						Worksheet in the instructions for line 11
			<!--Dotted Line-->
				<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...................</span>
	    		</div>
				<div style="float:left;">	  
					<div class="styLNRightNumBox" style="width:8mm;height:6.5mm;background-color:lightgrey;padding-bottom:0mm;border-bottom:0;"/>				
					<div class="styLNRightNumBox" style="width:8mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;border-bottom:0;clear:left;">55</div>
	    		</div>				
				<div style="float:left;">	  
					<div class="styLNAmountBox" style="width:36mm;height:6.5mm;padding-bottom:0mm;border-bottom:0;"/>					
					<div class="styLNAmountBox" style="width:36mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;border-bottom:0;clear:left;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TaxOnAlternativeMinimumGainAmt"/>
						</xsl:call-template>
					</div>				
	    		</div>					
			</div>            
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:right;">
							<span style="width:40px;"/>  
                Form <span class="styBoldText" style="font-size:8pt;">8801</span> (2018)
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
