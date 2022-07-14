<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS4970Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="FormData" select="$RtnDoc/IRS4970"/>
	<xsl:template match="/">
		<html>
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
				<meta name="Description" content="IRS Form 4970"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS4970Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form4970">
					<!--xsl:value-of select='$PageWatermark'/-->
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<!-- Begin Form Number and Name -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:22mm;">
            Form<span class="styFormNumber"> 4970</span>
							<div class="styAgency" style="padding-top:5mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:12mm;">
							<div class="styMainTitle" style="height:8mm;padding-top:2mm;">
            Tax on Accumulation Distribution of Trusts
          </div>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:4mm;">
								<img src="{$ImagePath}/4970_Bullet.gif" width="9" height="9" alt="bullet image"/>
            Attach to beneficiary's tax return.
          </div>
							<div class="styFST" style="height:5mm;font-size:7pt;padding-top:1mm;">
								<img src="{$ImagePath}/4970_Bullet.gif" width="9" height="9" alt="bullet image"/>
            See instructions on back.
          </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:19mm;">
							<div class="styOMB" style="height:1mm;">
            OMB No. 1545-0192
          </div>
							<div class="styTY" style="height:7mm;font-size:22pt;">2011</div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-left:4mm;border-left-width:0px;">Attachment 			<br/>
            Sequence No. <span class="styBoldText">73</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;">
							<div>
								<span style="font-weight:bold;width:8mm;">A</span>Name(s) as shown on return</div>
							<span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/PersonSubjectToTrustTaxName"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							<div>
								<span style="width:4mm;">B</span>Social security number</div>
							<span style="width:43mm;text-align:center;font-weight:normal;">
								<xsl:call-template name="PopulateSSN">
									<xsl:with-param name="TargetNode" select="$FormData/PersonSubjectToTrustTaxSSN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;">
							<div>
								<span style="font-weight:bold;width:8mm;">C</span>Name and address of trust</div>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/TrustNm/BusinessNameLine1"/>
							</xsl:call-template>
							<xsl:if test="$FormData/TrustNm/BusinessNameLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TrustNm/BusinessNameLine2"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="$FormData/USAddress">
									<br/>
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/USAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$FormData/ForeignAddress">
									<br/>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="$FormData/ForeignAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise/>
							</xsl:choose>
						</div>
						<div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
							<div>
								<span style="width:4mm;">D</span>Employer identification number</div>
							<span style="width:40mm;text-align:center;font-weight:normal;">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/TrustEIN"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:53mm;height:8mm;font-size:7pt;">
							<div>
								<span style="font-weight:bold;width:8mm;float:left;height:8mm;">E</span>Type of trust (see instructions)</div>
							<input type="checkbox" alt="alt" class="styCkbox" name="Checkbox" id="DomesticTrustInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DomesticTrustInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/DomesticTrustInd"/>
								</xsl:call-template>
							Domestic
	                        </label>
							<input type="checkbox" alt="alt" class="styCkbox" name="Checkbox" id="ForeignTrustInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustInd"/>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustInd"/>
								</xsl:call-template>
							Foreign
	                        </label>
						</div>
						<div class="styNameBox" style="width:43mm;height:8mm;padding-left:2mm;font-size:7pt;">
							<div>
								<span style="font-weight:bold;width:4mm;float:left;height:8mm;">F</span>Beneficiary’s date of birth</div>
							<span style="width:31mm;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryBirthDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameBox" style="width:80mm;height:8mm;font-size:7pt;padding-left:2mm;">
							<div>
								<span style="font-weight:bold;width:4mm;float:left;height:8mm;">G</span>
							Enter the number of trusts from which you received<br/>accumulation distributions in this tax year <span style="letter-spacing:8px;">.... </span>
								<img src="{$ImagePath}/4970_Bullet.gif" width="9" height="9" alt="bullet image"/>
							</div>
						</div>
						<div style="height:8mm;position:relative;width:10mm;float:right;">
							<span style="bottom:2px;position:absolute;width:10mm;text-align:right;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TrustCnt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- End Names and Identifying number section -->
					<!-- Part I header -->
					<div class="styBB" style="width: 187mm">
						<div class="styPartName" style="font-family:sans-serif">Part I</div>
						<div class="styPartDesc">Average Income and Determination of Computation Years</div>
					</div>
					<!-- Begin the amount boxes -->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:8mm">1 </div>
							<div class="styLNDesc" style="width:141mm;height:8mm;">
							Amount of current distribution that is considered distributed in earlier tax years (from Schedule J<br/>
							(Form 1041), line 37, column (a))<span style="letter-spacing:3mm;">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;position:relative">
								<span style="position:absolute;bottom:0">1</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4.5mm;padding-bottom:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CurrentDistributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">2 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Distributions of income accumulated before you were born or reached age 21<span style="letter-spacing:3mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">2</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BeforeAgeDistributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">3 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Subtract line 2 from line 1 <span style="letter-spacing:3mm;">............................</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">3</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/UndistributedNetIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">4 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Taxes imposed on the trust on amounts from line 3 (from Schedule J (Form 1041), line 37, column (b))<span style="letter-spacing:3mm;">..</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">4</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TrustTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">5 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Total (add lines 3 and 4)<span style="letter-spacing:3mm;"> ............................</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">5</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDistributionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">6 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Tax-exempt interest included on line 5 (from Schedule J (Form 1041), line 37, column (c))<span style="letter-spacing:3mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">6</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExemptInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">7 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Taxable part of line 5 (subtract line 6 from line 5)<span style="letter-spacing:3mm;">.....................</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">7</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalDistributionTaxableAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">8 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Number of trust's earlier tax years in which amounts on line 7 are considered distributed<span style="letter-spacing:3mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">8</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TrustEarlierTaxYearsCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">9 </div>
							<div class="styLNDesc" style="width:101mm;height:4.5mm;">Average annual amount considered distributed (divide line 3 by line 8)<span style="letter-spacing:3mm;">...</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">9</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AverageAnnualDistributedAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:4.5mm;width:40mm;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">10 </div>
							<div class="styLNDesc" style="width:101mm;height:4.5mm;">Multiply line 9 by 25% (.25)<span style="letter-spacing:3mm;">.................</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">10</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PercentageDistributionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styShadingCell" style="height:4.5mm;width:40mm;"/>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">11 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Number of earlier tax years to be taken into account (see instructions) <span style="letter-spacing:3mm;">...........</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">11</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EarlyTaxYearsAvgCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">12 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Average amount for recomputing tax (divide line 7 by line 11). Enter here and in each column on line 15</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">12</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AverageForRecomputingTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Row 13 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:14mm;padding-left:0mm;width:5mm;">13 </div>
							<div class="styLNDesc" style="width:41mm;height:14mm;">Enter your taxable income before this distribution for the 5 immediately preceding tax years.</div>
							<!-- 2010 -->
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:5mm;float:none">(a) 2010</div>
								<div class="styLNAmountBox" style="height:9mm;width:28mm;border-bottom:none;float:none;padding-top:5.5mm;padding-bottom:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PYOneTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 2009 -->
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:5mm;float:none">(b) 2009</div>
								<div class="styLNAmountBox" style="height:9mm;width:28mm;border-bottom:none;float:none;padding-top:5.5mm;padding-bottom:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PYTwoTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 2008 -->
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:5mm;float:none">(c) 2008</div>
								<div class="styLNAmountBox" style="height:9mm;width:28mm;border-bottom:none;float:none;padding-top:5.5mm;padding-bottom:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PYThreeTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 2007 -->
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:5mm;float:none">(d) 2007</div>
								<div class="styLNAmountBox" style="height:9mm;width:28mm;border-bottom:none;float:none;padding-top:5.5mm;padding-bottom:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PYFourTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!-- 2006 -->
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:5mm;float:none">(e) 2006</div>
								<div class="styLNAmountBox" style="height:9mm;width:28mm;border-bottom:none;float:none;padding-top:5.5mm;padding-bottom:0">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PYFiveTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- End the amount boxes -->
					<!-- Part II header -->
					<div class="styBB" style="width: 187mm">
						<div class="styPartName" style="font-family:sans-serif">Part II</div>
						<div class="styPartDesc">Tax Attributable to the Accumulation Distribution</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNDesc" style="width:89mm;height:4.5mm"/>
						<div class="styLNRightNumBox" style="height:4.5mm;border-bottom:none;"/>
						<div class="styLNAmountBox" style="height:4.5mm;width:30mm;font-weight:bold;text-align:left;padding-left:1mm;">(a)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30mm;font-weight:bold;text-align:left;padding-left:1mm;">(b)</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:30mm;font-weight:bold;text-align:left;padding-left:1mm;">(c)</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;">14 </div>
						<div class="styLNDesc" style="width:84mm;height:8mm;">Enter the amounts from line 13, eliminating the highest and lowest taxable income years<span style="letter-spacing:3mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0">14</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:1.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/PYTaxableIncBfrAccumDistriAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">					
								<xsl:with-param name="Desc">Tax Year</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxYear"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:1.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/PYTaxableIncBfrAccumDistriAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">					
								<xsl:with-param name="Desc">Tax Year</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxYear"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:1.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/PYTaxableIncBfrAccumDistriAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">					
								<xsl:with-param name="Desc">Tax Year</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxYear"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;position:relative;"><span style="position:absolute;bottom:0;">15 </span> </div>
						<div class="styLNDesc" style="width:84mm;height:8mm;padding-top:3mm;position:relative;"><span style="position:absolute;bottom:0;">Enter amount from line 12 in each column<span style="letter-spacing:3mm;">......</span></span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0">15</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AverageForRecomputingTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AverageForRecomputingTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AverageForRecomputingTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;position:relative;"><span style="position:absolute;bottom:0;">16 </span></div>
						<div class="styLNDesc" style="width:84mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">Recomputed taxable income (add lines 14 and 15)<span style="letter-spacing:3mm;">.....</span></span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0">16</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/RecomputedTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/RecomputedTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/RecomputedTaxableIncomeAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;position:relative;"><span style="position:absolute;bottom:0;">17 </span></div>
						<div class="styLNDesc" style="width:84mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">Income tax on amounts on line 16<span style="letter-spacing:3mm;">.........</span></span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0">17</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/IncomeTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/IncomeTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/IncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;position:relative;"><span style="position:absolute;bottom:0;">18 </span></div>
						<div class="styLNDesc" style="width:84mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">Income tax before credits on line 14 income<span style="letter-spacing:3mm;">.......</span></span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0">18</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/IncomeTaxBeforeCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/IncomeTaxBeforeCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/IncomeTaxBeforeCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;position:relative;"><span style="position:absolute;bottom:0;">19 </span></div>
						<div class="styLNDesc" style="width:84mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">Additional tax before credits (subtract line 18 from line 17)<span style="letter-spacing:3mm;">..</span></span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0">19</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/AdditionalTaxBeforeCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/AdditionalTaxBeforeCreditsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/AdditionalTaxBeforeCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;position:relative;"><span style="position:absolute;bottom:0;">20 </span></div>
						<div class="styLNDesc" style="width:84mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">Tax credit adjustment<span style="letter-spacing:3mm;">..............</span></span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0">20</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:1.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxCreditAdjustmentAmt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxCreditAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:1.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxCreditAdjustmentAmt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxCreditAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:1.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxCreditAdjustmentAmt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxCreditAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;position:relative;"><span style="position:absolute;bottom:0;">21 </span></div>
						<div class="styLNDesc" style="width:84mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">Subtract line 20 from line 19<span style="letter-spacing:3mm;">............</span></span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0">21</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxLessCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxLessCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxLessCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;position:relative;"><span style="position:absolute;bottom:0;">22 </span></div>
						<div class="styLNDesc" style="width:84mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;">Alternative minimum tax adjustments<span style="letter-spacing:3mm;">.........</span></span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0">22</span>
						</div>
							<div class="styLNAmountBox" style="height:8mm;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/AMTAdjustmentAmt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/AMTAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/AMTAdjustmentAmt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/AMTAdjustmentAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/AMTAdjustmentAmt"/>
							</xsl:call-template><br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/AMTAdjustmentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:8mm;padding-left:1mm;width:5mm;position:relative;"><span style="position:absolute;bottom:0;padding-bottom:1mm;">23 </span></div>
						<div class="styLNDesc" style="width:84mm;height:8mm;position:relative;"><span style="position:absolute;bottom:0;padding-bottom:1mm;">Combine lines 21 and 22<span style="letter-spacing:3mm;">............</span></span>
						</div>
						<div class="styLNRightNumBox" style="position:relative;height:8mm;">
							<span style="position:absolute;bottom:0;">23</span>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/AdjAccumulationDistTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/AdjAccumulationDistTaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="height:8mm;width:30mm;padding-top:4.0mm;padding-bottom:0">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/AdjAccumulationDistTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">24 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Add columns (a), (b), and (c), line 23 <span style="letter-spacing:3mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">24</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ThreeYearAdjustedTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">25 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Divide the line 24 amount by 3<span style="letter-spacing:3mm;">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">25</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/AverageAdjustedTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">26 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Multiply the amount on line 25 by the number of years on line 11<span style="letter-spacing:3mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">26</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustedTaxAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:1mm;width:5mm;">27 </div>
							<div class="styLNDesc" style="width:141mm;height:4.5mm;">Enter the amount from line 4 <span style="letter-spacing:3mm;">...........................</span>
							</div>
							<div class="styLNRightNumBox" style="position:relative;height:4.5mm;">
								<span style="position:absolute;bottom:0">27</span>
							</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TrustTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:1mm;width:5mm;height:8mm">28</div>
							<div class="styLNDesc" style="width:141mm;height:8mm;">
							Partial tax attributable to the accumulation distribution (subtract line 27 from line 26) (If zero or<br/>
							less, enter -0-)<span style="letter-spacing:3mm;">................................</span>
							</div>
							<div class="styLNRightNumBox" style="border-bottom:none;border-top-width:0px;height:8mm;position:relative">
								<span style="position:absolute;bottom:0">28</span>
							</div>
							<div class="styLNAmountBox" style="height:8mm;border-bottom:none;border-top-width:0px;padding-top:4.0mm;padding-bottom:0">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PartialTaxOnAccumDistAmt"/>
								</xsl:call-template>
							</div>
						</div>
					<!-- capturing the page bottom info -->
					<div style="width:187mm; font-size:7pt;  border-top:1 solid black; padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, see back of form.</b>
						</div>
						<div style="float:right">
						Cat. No. 13180V
						<span style="width:15mm"/>
						Form <b style="font-size:9pt">4970</b> (2011)
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
						 <xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxYear"/>
							<xsl:with-param name="Desc">Line 14a - Tax Year</xsl:with-param>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxYear"/>
							<xsl:with-param name="Desc">Line 14b - Tax Year</xsl:with-param>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxYear"/>
							<xsl:with-param name="Desc">Line 14c - Tax Year</xsl:with-param>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
