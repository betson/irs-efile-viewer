<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSpy v2011 sp1 (http://www.altova.com) by Daniel Ashton (IRS) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4972Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form4972Data" select="$RtnDoc/IRS4972"/>
	<!-- tallest box on the form was beside 5 lines of text and was 21mm tall -->
	<xsl:variable name="lineHeight" select="21 div 5"/>
	<!-- estimate of 1px line height or width in mm is 0.22 -->
	<xsl:variable name="borderWidth" select="0.17"/>
	<xsl:variable name="pageWidth" select="187"/>
	<xsl:variable name="standardLine" select="'StdLn'"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form4972Data)"/>
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
				<meta name="Description" content="IRS Form 4972"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4972Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;"  >
				<form name="Form4972">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:{$pageWidth}mm;">
						<div class="styFNBox" style="width:31mm;height:23mm;padding:bottom:0mm;">
              Form<span style="width:1mm;"/>
							<span class="styFormNumber">4972</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form4972Data"/>
							</xsl:call-template>
							<div class="styAgency" style="padding-top:7mm;height:0mm;padding:bottom:0mm;">
                Department of the Treasury<br/>
						    Internal Revenue Service (99)
             </div>
						</div>
						<div class="styFTBox" style="width:125mm;height:23mm;">
							<div class="styMainTitle" style="height:5mm;padding:bottom:0mm;">Tax on Lump-Sum Distributions<br/>
								<span class="styTitleDesc" style="width:125mm;font-size:10pt;">(From Qualified Plans of Participants Born Before January 2, 1936)</span>
							</div>
							<div class="styFBT" style="font-size:7.5pt;height:5mm;padding-top:3mm;">
								<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/> Information about Form 4972 and its instructions is available<br/>
				  at <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form4972" title="Link to IRS.gov"><i>www.irs.gov/form4972.</i></a>
								<br/>
								<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/> Attach to Form 1040, 1040NR, or Form 1041.</div>
						</div>
						<div class="styTYBox" style="width:28mm;height:23mm;border-left-width:1px;">
							<div class="styOMB" style="width:28mm;height:4mm;font-size:7pt;">OMB No. 1545-0193</div>
							<div class="styTY">20<span class="styTYColor">16</span>
							</div>
							<div style="margin-left:5mm;text-align:left;font-size:7pt;">
						Attachment<br/>Sequence No. 
						<span class="styBoldText" style="font-size:9pt;">28</span>
							</div>
						</div>
					</div>
					<!-- Name(s) shown on return -->
					<div class="styBB" style="width:{$pageWidth}mm;">
						<div class="styFNBox" style="width:150mm; height:8mm;text-align:left;font-size:6.5pt;">
							<b>Name of recipient of distribution</b>
							<br/>
							<div style="font-size:6.5pt;padding-left:1mm;padding-top:2mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form4972Data/PersonNm"/>
								</xsl:call-template>
							</div>	
							<br/>
						</div>
						<b>
							<div style="font-size:6.5pt;padding-left:1mm;">Identifying number</div>
						</b>
						<br/>
						<div style="font-size:6.5pt;padding-left:1mm;padding-top:2mm;">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="$Form4972Data/SSN"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Part I -->
					<!-- Part I - Header -->
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<span class="styPartName" style="width:14mm;">Part I</span>
						<span class="styPartDesc" valign="top">Complete this part to see if you can use Form 4972 <span style="font:normal;">  </span>
						</span>
					</div>
					<!-- Part I - Body -->
					<div class="styBB" style="width:187mm;">
						<!-- Line 1 -->
						<div style="width:187mm;float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;">1</div>
							<div class="styLNDesc" style="width:153mm;">
								<span style="float:left;">Was this a distribution of a plan participant's entire balance (excluding deductible voluntary employee
									contributions and certain forfeited amounts) from all of an employer's qualified plans of one kind (pension, 
									profit-sharing, or stock bonus)?  If "No," <b> do not </b> use this form
									<span class="styDotLn" style="float:right;">............................</span>
								</span>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="width:7.1mm;height:4mm;"></div>
								<div class="styLNRightNumBox" style="width:7.1mm;height:4mm;">Yes</div>
								<div class="styIRS4972LNYesNoBox" style="width:7.1mm;height:4mm;">No</div>
							</span>  
							
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:6.3mm;width:7.1mm;padding-top:2.7mm;padding-right:0.5mm;">1</div>
								<div class="styLNAmountBox" style="height:6.3mm;width:7.1mm;padding-top:2.7mm;padding-right:1.2mm;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/DistributionOfQualifiedPlanInd"/>
									</xsl:call-template>
								</div>
								<div class="styIRS4972LNYesNoBox" style="height:6.3mm;width:7.1mm;padding-top:2.7mm;border-bottom-width:1px;">
								<xsl:call-template name="PopulateNoBoxText">
									<xsl:with-param name="TargetNode" select="$Form4972Data/DistributionOfQualifiedPlanInd"/>
								</xsl:call-template>
								</div>
							</span>
						</div>
			
						<!-- Line 2 -->
						<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;">2</div>
							<div class="styLNDesc" style="width:153mm;">
								<span style="float:left;">Did you roll over any part of the distribution? If "Yes," <b>do not</b> use this form</span>
								<span class="styDotLn" style="float:right;">..............</span>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="width:7.1mm;height:4.5mm;padding-right:0.5mm;">2</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:7.1mm;padding-right:1.2mm;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/RolloverInd"/>
									</xsl:call-template>
								</div>	
								<div class="styIRS4972LNYesNoBox" style="height:4.5mm;width:7.1mm;border-bottom-width:1px;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/RolloverInd"/>
									</xsl:call-template>
								</div>
							</span>
						</div>

						<!-- Line 3 -->
						<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;">3</div>
							<div class="styLNDesc" style="width:153mm;">
								<span style="float:left;">Was this distribution paid to you as a beneficiary of a plan participant who was born before January 2, 1936?</span>
								<span class="styDotLn" style="float:right;">...</span>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="width:7.1mm;height:4.5mm;padding-right:0.5mm;">3</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:7.1mm;padding-right:1.2mm;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/EmployeeBeneficiaryDistriInd"/>
									</xsl:call-template>
								</div>	
								<div class="styIRS4972LNYesNoBox" style="height:4.5mm;width:7.1mm;border-bottom-width:1px;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/EmployeeBeneficiaryDistriInd"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						
						<!-- Line 4 -->
						<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;">4</div>
							<div class="styLNDesc" style="width:153mm;">
								<span style="float:left;">Were you <b>(a)</b> a plan participant who received this distribution, <b>(b)</b> born before January 2, 1936, <b>and (c)</b> a participant in the plan for at least 5 years before the year of the distribution?
									<span class="styDotLn" style="float:right;">.................</span>								
								</span>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="width:7.1mm;height:7.5mm;padding-right:0.5mm;padding-top:3.5mm;">4</div>
								<div class="styLNAmountBox" style="height:7.5mm;width:7.1mm;padding-right:1.2mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/QualifyingAge5YearMemberInd"/>
									</xsl:call-template>
								</div>	
								<div class="styIRS4972LNYesNoBox" style="height:7.5mm;width:7.1mm;border-bottom-width:1px;padding-top:3.5mm;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/QualifyingAge5YearMemberInd"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!-- Line after 4 -->
						<div style="width:187mm;float:left;clear:none;">
							<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left: 3.2mm;"/>
							<div class="styLNDesc" style="width:153mm;">
								<span style="float:left;">If you answered "No" to both questions 3 <b>and</b> 4, <b>do not</b> use this form.</span>
							</div>
							<span style="float:right;background-color:LightGrey;">
								<div class="styLNRightNumBox" style="width:7.1mm;padding-right:0.5mm;"></div>
								<div class="styLNAmountBox" style="width:7.1mm;padding-right:0.5mm;"></div>	
								<div class="styLNAmountBox" style="height:4mm;width:7.1mm;border-bottom-width:1px;"/>
							</span>
						</div>  
						
						<!-- Line 5a-->
						<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;">5a</div>
							<div class="styLNDesc" style="width:153mm;">
								<span style="float:left;">Did you use Form 4972 after 1986 for a previous distribution from your own plan? If "Yes," <b>do not</b> use this form for a 2016 distribution from your own plan
									<span class="styDotLn" style="float:right;">..........................</span>								
								</span>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="width:7.1mm;height:7.5mm;padding-right:0.5mm;padding-top:3.5mm;">5a</div>
								<div class="styLNAmountBox" style="height:7.5mm;width:7.1mm;padding-right:1.2mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/PriorYearDistributionInd"/>
									</xsl:call-template>
								</div>	
								<div class="styIRS4972LNYesNoBox" style="height:7.5mm;width:7.1mm;border-bottom-width:1px;padding-top:3.5mm;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/PriorYearDistributionInd"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						
						<!-- Line (5)b-->
						<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
							<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:5mm;">b</div>
							<div class="styLNDesc" style="width:153mm;">
								<span style="float:left;">If you are receiving this distribution as a beneficiary of a plan participant who died, did you use Form 4972 for a previous distribution received as a beneficiary of that participant after 1986? If "Yes," <b>do not</b> use this form for this distribution
									<span class="styDotLn" style="float:right;">.</span>								
								</span>
							</div>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="width:7.1mm;height:7.5mm;padding-right:0.5mm;border-bottom-width:0mm;padding-top:3.5mm;">5b</div>
								<div class="styLNAmountBox" style="height:7.5mm;width:7.1mm;padding-right:1.2mm;border-bottom-width:0mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateYesBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/BeneficiaryDistributionInd"/>
									</xsl:call-template>
								</div>	
								<div class="styIRS4972LNYesNoBox" style="height:7.5mm;width:7.1mm;border-bottom-width:0mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateNoBoxText">
										<xsl:with-param name="TargetNode" select="$Form4972Data/BeneficiaryDistributionInd"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
					</div>
					<!-- Part II - Header -->
					<div class="styBB" style="width:187mm;float:none;clear:both;">
						<span class="styPartName" style="width:14mm;">Part II</span>
						<span class="styPartDesc" style="">Complete this part to choose the 20% capital gain election. <span style="font-weight:normal;"> (see instructions)</span>
						</span>
					</div>
					<!-- Part II - Body -->
					<!-- Line 6-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;">6</div>
						<div class="styLNDesc" style="width:136mm;">
							<span style="float:left;">Capital gain part from Form 1099-R, box 3
								<xsl:if test="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUAAmt !=' '">
									<span style="width:1.5px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Capital Gaining Election NUA Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUAAmt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUACd !=' '">
									<span style="width:1.5px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Capital Gaining Election NUA Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUACd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="not($Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUAAmt) and not($Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUACd)">
									<span class="styDotLn" style="float:right;">....................</span>
								</xsl:if>
								
								<xsl:if test="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUAAmt !=' ' and $Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUACd !=' '">
									<span class="styDotLn" style="float:right;">..................</span>
								</xsl:if>

								<xsl:if test="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUAAmt !=' ' and not($Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUACd)">
									<span style="width:12.7px;"/><span class="styDotLn" style="float:right;">..................</span>
								</xsl:if>								
								
								<xsl:if test="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUACd !=' ' and not($Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUAAmt)">
									<span style="width:12.7px;"/><span class="styDotLn" style="float:right;">..................</span>
								</xsl:if>	
								
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
						
					<!-- Line 7-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;">7</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Multiply line 6 by 20% (.20)
							</span>
							<span class="styDotLn" style="float:right;padding-right:2mm;">........................<img style="align:right;" src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/></span>
							
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainTimesElectionPctAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;"></div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">If you also choose to use Part III, go to line 8. Otherwise, include the amount from line 7 in the total on <br/>
								Form 1040, line 44; Form 1040NR, line 42; or Form 1041, Schedule G, line 1b.
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="float:right;height:7.4mm;border-bottom:0px;border-left-width:0px;border-bottom-width:1px;background-color:LightGrey"/>
							<div class="styLNAmountBox" style="float:right;height:7.4mm;border-bottom:0px;border-left-width:1px;border-bottom-width:1px;background-color:LightGrey"/>
						</span>
					</div>
					
					<!-- Part III - Header -->
					<div class="styBB" style="width:187mm;border-top-width:1px;float:none;clear:both;">
						<span class="styPartName" style="width:14mm;">Part III</span>
						<span class="styPartDesc" style="">Complete this part to choose the 10-year tax option <span style="font-weight:normal;">(see instructions)</span>
						</span>
					</div>
					<!-- Part III - Body -->
					<!-- Line 8-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;">8</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">If you completed Part II, enter the amount from Form 1099-R, box 2a minus box 3. If you did not complete Part II, enter the
								amount from box 2a. Multiple recipients (and recipients who elect to include NUA in taxable income) see instructions
								<span style="width:3px;"/>
								<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Net Unrealized Appreciation Amount</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt/@netUnrealizedAppreciationAmt"/>
									</xsl:call-template>
									<span style="width:3px;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Net Unrealized Appreciation Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt/@netUnrealizedAppreciationCd"/>
									</xsl:call-template>
								<span style="width:3px;"/>
								<span class="styDotLn" style="float:right;">........................</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.8mm;">8</div>							
							<div class="styLNAmountBox" style="height:10.5mm;padding-top:6.8mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 9-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBoxSD" style="width:10mm;padding-left:3.2mm;">9</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Death benefit exclusion for a beneficiary of a plan participant who died before August 21, 1996
								<span style="width:1.5mm;"/>
								<span class="styDotLn" style="float:right;">....</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriDeathBnftExclAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 10-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">10</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Total taxable amount. Subtract line 9 from line 8
								<span class="styDotLn" style="float:right;">...................</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">10</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTotalTaxableAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 11-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">11</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Current actuarial value of annuity from Form 1099-R, box 8. If none, enter -0-
								<span style="width:2mm;"/><span class="styDotLn" style="float:right;">.........</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">11</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/AnnuityActuarialValueAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 12-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">12</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Adjusted total taxable amount. Add lines 10 and 11. If this amount is $70,000 or more, <b>skip</b> lines <br/>
											13 through 16, enter this amount on line 17, and go to line 18
								<span style="width:2.2mm;"/><span class="styDotLn" style="float:right;">..............</span>
							</span>
							
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">12</div>							
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAdjTotTaxableAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 13-->
					<div style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1.8mm;width:10mm;">13 </div>
							<div class="styLNDesc" style="width:97mm;height:4.5mm;">Multiply line 12 by 50% (.50), but <b>do not</b> enter more than $10,000
								<span class="styDotLn" style="float:right;">...</span>
							</div>
						</span> 
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistri50PctTotalTxblAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:32mm;border-bottom-width:0px;"/>
						</span>
					</div>
						
					<!-- Line 14-->
					<div style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="height:7.5mm;padding-left:1.8mm;width:10mm;">14 </div>
							<div class="styLNDesc" style="width:auto;height:7.5mm;">Subtract $20,000 from line 12. If line 12 is<br/>$20,000 or less, enter -0-
								<span style="width:.5mm;"/><span class="styDotLn" style="float:right;">.....</span>
							</div>
						</span> 
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">14</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumNetAdjTotalTaxableAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:7.5mm;width:32mm;border-bottom-width:0px;"/>
							<div class="styLNRightNumBox" style="height:7.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:7.5mm;width:32mm;border-bottom-width:0px;"/>
						</span>
					</div>
					
					<!-- Line 15-->
					<div style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1.8mm;width:10mm;">15 </div>
							<div class="styLNDesc" style="width:97mm;height:4.5mm;">Multiply line 14 by 20% (.20)
								<span class="styDotLn" style="float:right;">..............</span>
							</div>
						</span> 
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriProratedTxblAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:32mm;border-bottom-width:0px;"/>
						</span>
					</div>
					
					<!-- Line 16-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">16</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Minimum distribution allowance. Subtract line 15 from line 13
								<span class="styDotLn" style="float:right;">...............</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">16</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumMinDistriAllowanceAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 17-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">17</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Subtract line 16 from line 12
								<span style="width:.4mm;"/><span class="styDotLn" style="float:right;">.........................</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">17</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAllowableTxblAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!-- Line 18-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">18</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Federal estate tax attributable to lump-sum distribution
								<span style="width:2.5mm;"/><span class="styDotLn" style="float:right;">................</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpDistribFederalEstateTaxAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 19-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">19</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Subtract line 18 from line 17. If line 11 is zero, <b>skip</b> lines 20 through 22 and go to line 23
								<span class="styDotLn" style="float:right;">......</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriNetTaxableAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!-- Line 20-->
					<div style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="height:7.5mm;padding-left:1.8mm;width:10mm;">20 </div>
							<div class="styLNDesc" style="width:97mm;height:7.5mm;">Divide line 11 by line 12 and enter the result as a decimal (rounded to at least three places)
								<span class="styDotLn" style="float:right;">..................</span>
							</div>
						</span> 
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">20</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriActuarialAdjPct"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:7.5mm;width:32mm;border-bottom-width:0px;"/>
						</span>
					</div>
					
					<!-- Line 21-->
					<div style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1.8mm;width:10mm;">21 </div>
							<div class="styLNDesc" style="width:97mm;height:4.5mm;">Multiply line 16 by the decimal on line 20
								<span class="styDotLn" style="float:right;">...........</span>
							</div>
						</span> 
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriMinAllwPercentAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:32mm;border-bottom-width:0px;"/>
						</span>
					</div>
					
					<!-- Line 22-->
					<div style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1.8mm;width:10mm;">22 </div>
							<div class="styLNDesc" style="width:97mm;height:4.5mm;">Subtract line 21 from line 11
								<span class="styDotLn" style="float:right;">..............</span>
							</div>
						</span> 
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAdjActuarialAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:32mm;border-bottom-width:0px;"/>
						</span>
					</div>
					
					<!-- Line 23-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">23</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Multiply line 19 by 10% (.10)
								<!--<span style="width:.4mm;"/><span class="styDotLn" style="float:right;">........................</span>-->
							</span>
							<span class="styDotLn" style="float:right;">........................</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">23</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriPctAdjTxblAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 24-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">24</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Tax on amount on line 23. Use the Tax Rate Schedule in the instructions
								<!--<span style="width:2mm;"/><span class="styDotLn" style="float:right;">..........</span>-->
							</span>
							<span class="styDotLn" style="float:right;">...........</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">24</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTaxOnPercentAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 25-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">25</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Multiply line 24 by ten (10). If line 11 is zero, <b>skip</b> lines 26 through 28, enter this amount on line 29, and go to line 30
								<span class="styDotLn" style="float:right;">..............................</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">25</div>							
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTentAvgTaxAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					
					<!-- Line 26-->
					<div style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1.8mm;width:10mm;">26 </div>
							<div class="styLNDesc" style="width:97mm;height:4.5mm;">Multiply line 22 by 10% (.10)
								<span class="styDotLn" style="float:right;">...............</span>
							</div>
						</span> 
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriTxblAdjActrlAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:32mm;border-bottom-width:0px;"/>
						</span>
					</div>
					
					<!-- Line 27-->
					<div style="width:187mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1.8mm;width:10mm;">27 </div>
							<div class="styLNDesc" style="width:97mm;height:4.5mm;">Tax on amount on line 26. Use the Tax Rate Schedule in the instructions
								<span class="styDotLn" style="float:right;">.</span>
							</div>
						</span> 
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/AdjustedActuarialAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;width:8mm;background-color:lightgray;border-bottom-width:0px;"/>
							<div class="styLNAmountBox" style="height:4.5mm;width:32mm;border-bottom-width:0px;"/>
						</span>
					</div>
					<!-- Line 28-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">28</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Multiply line 27 by ten (10)
								<span style="width:2mm;"/><span class="styDotLn" style="float:right;">.........................</span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">28</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriAdjAverageTaxAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
				
					<!-- Line 29-->
					<div style="width:187mm;float:left;clear:none;padding-top:0mm;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">29</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;">Subtract line 28 from line 25. Multiple recipients see instructions
								<xsl:if test="$Form4972Data/LumpSumDistriMultRecipientsCd !=' '">								
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Lump Summary Distribution Multiplier Recipients Code</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriMultRecipientsCd"/>
									</xsl:call-template>	
									<span class="styDotLn" style="float:right;">............<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/></span>
								</xsl:if>
								<xsl:if test="not($Form4972Data/LumpSumDistriMultRecipientsCd)">
									<span class="styDotLn" style="float:right;">.............<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/></span>
								</xsl:if>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:4.5mm;">29</div>							
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumRsdlAnnuityAvgTaxAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!-- Line 30-->
					<div style="width:187mm;float:left;clear:none;border-bottom-style:solid; border-bottom-width: 1px;">
						<div class="styLNLeftNumBox" style="width:10mm;padding-left:1.8mm;">30</div>
						<div class="styLNDesc" style="width:137mm;">
							<span style="float:left;"><b>Tax on lump-sum distribution.</b> Add lines 7 and 29. Also include this amount in the total on Form<br/>1040, line 44; Form 1040NR, line 42; or Form 1041, Schedule G, line 1b.
								<span style="width:.5mm;"/><span class="styDotLn" style="float:right;">..........<img src="{$ImagePath}/4972_Bullet_Md.gif" alt="MediumBullet"/></span>
							</span>
						</div>
						<span style="float:right;">
							<div class="styLNRightNumBox" style="height:7.5mm;border-bottom-width: 0px;padding-top:3.5mm;">30</div>							
							<div class="styLNAmountBox" style="height:7.5mm;border-bottom-width: 0px;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistributionTaxAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--</div>        -->
					<!-- Page Footer-->
					<div class="pageEnd" style="width:{$pageWidth}mm;padding-top:0mm;">
						<div style="float:left;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
						</div>
						<div style="float:right;width:80mm;text-align:right">
							Cat. No. 13187U
							<span style="width:29.5mm;"/>
							Form 
							<span class="styBoldText" style="font-size:8pt;">4972</span> (2016)
                           </div>
					</div>
					<!-- BEGIN Left Over Table -->
					<!-- Additonal Data Title Bar and Button -->
					<br/>
					<br/>
					<br/>
					<br/>
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
        Additional Data        
      </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form4972Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part II, Line 6 - Capital Gaining Election NUA Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUAAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part II, Line 6 - Capital Gaining Election NUA Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4972Data/CapitalGainElectionAmt/@capitalGainElectionNUACd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part III, Line 8 - Net Unrealized Appreciation Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt/@netUnrealizedAppreciationAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III, Line 8 - Net Unrealized Appreciation Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriOrdinaryIncmAmt/@netUnrealizedAppreciationCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part III, Line 29 - Lump Summary Distribution Multiplier Recipients Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4972Data/LumpSumDistriMultRecipientsCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part III, Line 17- Waived Short Method Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4972Data/PenaltyAmt/@waivedShortMethodAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Part IV, Line 27 - Waived Literal Regular Method</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4972Data/TotalPenaltyAmt/@waivedLiteralRegularMethodCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Part IV, Line 27 - Waived Regular Method Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form4972Data/TotalPenaltyAmt/@waivedRegularMethodAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
