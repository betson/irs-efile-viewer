<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 05/04/2021 -->
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
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
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
						<div class="styFNBox" style="width:31mm;height:20mm;">
            Form<span class="styFormNumber" style="padding-left:2mm;"> 4970</span>
							<div class="styAgency" style="padding-top:5mm;">Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="width:125mm;height:10mm;">
							<div class="styMainTitle" style="height:auto;padding-top:2mm;">
            Tax on Accumulation Distribution of Trusts
          </div>
							<div class="styFST" style="height:auto;font-size:7pt;padding-top:4mm;">
								<img src="{$ImagePath}/4970_Bullet.gif" width="9" height="9" alt="bullet image"/>
            Attach to beneficiary's tax return.
          </div><br/>
							<div class="styFST" style="height:auto;font-size:7pt;padding-top:1mm;">
								<img src="{$ImagePath}/4970_Bullet.gif" width="9" height="9" alt="bullet image"/>
            Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form4970" title="Link to IRS.gov"><i>www.irs.gov/Form4970</i></a> for the latest information. 
          </div>
						</div>
						<div class="styTYBox" style="width:31mm;height:20mm;">
							<div class="styOMB" style="width:31mm;height:4mm;">
            OMB No. 1545-0192
          </div>
							<div class="styTY" style="height:7mm;font-size:22pt;">20<span class="styTYColor">21</span></div>
							<div class="stySequence" style="height:9mm;border-bottom-width:0px;padding-top:2mm;padding-left:4mm;border-left-width:0px;">Attachment 			<br/>
            Sequence No. <span class="styBoldText">178</span>
							</div>
						</div>
					</div>
					<!-- End Form Number and Name section -->
					<!-- Begin Names and Identifying number section -->
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:136mm;height:auto;padding-bottom:1mm;font-size:7pt;">
							<div>
								<span style="font-weight:bold;width:5mm;">A</span>Name(s) as shown on return
							</div><br/>
							<span style="padding-left:5mm;padding-top:2mm;">
								<xsl:choose>
								<!--1041 Return Header data populated-->
									<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select= "$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt"/>	
										</xsl:call-template>			
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>			
									</xsl:when>
									<xsl:otherwise>
									<!--4970 schema data present and data populated-->
										<xsl:if test="normalize-space($FormData/PersonSubjectToTrustTaxNm) !=''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PersonSubjectToTrustTaxNm"/>
											</xsl:call-template>
										</xsl:if>
										<!--1040NR or 1040 Return Header data populated-->
										<xsl:if test="normalize-space($FormData/PersonSubjectToTrustTaxNm) =''">
											<xsl:call-template name="PopulateReturnHeaderFiler">
												<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
											</xsl:call-template>
										</xsl:if>	
									</xsl:otherwise>		
								</xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="width:50mm;height:auto,padding-bottom:1mm;padding-left:2mm;font-size:6.8pt;font-weight:bold;">
							<div>
								<span style="width:4mm;">B</span>Social security number
							</div>
							<span style="width:43mm;text-align:left;font-weight:normal;padding-top:2mm;padding-left:4mm">
								<xsl:choose>
								<!--1041 Return Header data populated-->
									<xsl:when test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt">
										<xsl:call-template name="PopulateReturnHeaderFilerTIN"/>
									</xsl:when>	
									<xsl:otherwise>
									<!--4970 schema data present and data populated-->
									<xsl:if test="normalize-space($FormData/PersonSubjectToTrustTaxSSN) !=''">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$FormData/PersonSubjectToTrustTaxSSN"/>
										</xsl:call-template>
									</xsl:if>
									<!--1040NR or 1040 Return Header data populated-->
									<xsl:if test="normalize-space($FormData/PersonSubjectToTrustTaxSSN) =''">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>	
									</xsl:otherwise>		
								</xsl:choose>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:136mm;height:24mm;font-size:7pt;">
							<div>
								<span style="font-weight:bold;width:5mm;">C</span>Name and address of trust
							</div><br/>
							<span style="padding-left:5mm;">
								<xsl:if test="$FormData/TrustName/BusinessNameLine1Txt">	
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrustName/BusinessNameLine1Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/TrustName/BusinessNameLine2Txt">
								<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/TrustName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</span>
							<br/>
							<span style="padding-left:5mm;">	
								<xsl:choose>
									<xsl:when test="$FormData/USAddress">
										<!--<br/>-->
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$FormData/USAddress"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$FormData/ForeignAddress">
										<!--<br/>-->
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$FormData/ForeignAddress"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise/>
								</xsl:choose>
							</span>
						</div>
						<div class="styEINBox" style="width:50mm;padding-left:2mm;font-size:6.8pt;font-weight:bold;">
							<div><span style="width:4mm;">D</span>Employer identification number</div><br/>
							<span style="width:43mm;text-align:left;padding-top:1mm;vertical-align:bottom;font-weight:normal;padding-left:4mm">
								<xsl:if test="$FormData/TrustEIN">	
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/TrustEIN"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;float:none;clear:none;">
						<div class="styNameBox" style="width:50mm;height:8mm;font-size:7pt;">
							<div>
								<span style="font-weight:bold;width:5mm;float:left;height:auto;">E</span>Type of trust (see instructions)
							</div>
							<span style="padding-left:5mm">
								<input type="checkbox" alt="Domestic" class="styCkbox" name="Checkbox" id="DomesticTrustInd">
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
								<input type="checkbox" alt="Foreign" class="styCkbox" name="Checkbox" id="ForeignTrustInd">
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
							</span>
						</div>
						<div class="styNameBox" style="width:43mm;height:8mm;padding-left:2mm;font-size:7pt;">
							<div>
								<span style="font-weight:bold;width:4mm;float:left;height:auto;">F</span>Beneficiary&#8217;s date of birth</div>
							<span style="width:31mm;text-align:left;padding-top: 1.5mm;padding-left:4.5mm">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/BeneficiaryBirthDt"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styNameBox" style="width:77mm;height:8mm;font-size:7pt;padding-left:2mm;">
							<div>
								<span style="font-weight:bold;width:4mm;float:left;height:8mm;">G</span>
							      Enter the number of trusts from which you received<br/>accumulation distributions in this tax year <span style="width:2mm"/>
							      <span style="letter-spacing:8px;">.... </span>
								<img src="{$ImagePath}/4970_Bullet.gif" width="9" height="9" alt="bullet image"/>
							</div>
						</div>
						<div style="height:8mm;position:relative;width:13mm;float:right;">
							<span style="bottom:6px;position:absolute;width:13mm;text-align:right;">
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
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="height:7mm;padding-left:1mm;width:5mm;">1 </div>
								<div class="styLNDesc" style="width:141mm;height:7mm;font-size:7.5pt">
									Amount of current distribution that is considered distributed in earlier tax years (from Schedule J
									(Form<br/> 1041), line 37, column (a))
								<span class="styDotLn" style="float:right;">.........................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">1</div>							
								<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CurrentDistributionAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:1mm;width:5mm;">2 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
									Distributions of income accumulated before you were born or reached age 21
								<span class="styDotLn" style="float:right;">........</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">2</div>							
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BeforeAgeDistributionAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:1mm;width:5mm;">3 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
									Subtract line 2 from line 1
								<span class="styDotLn" style="float:right;">.........................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">3</div>							
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/UndistributedNetIncomeAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:1mm;width:5mm;">4 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt;">
									Taxes imposed on the trust on amounts from line 3 (from Schedule J (Form 1041), line 37, column (b))
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">4</div>							
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TrustTaxesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:1mm;width:5mm;">5 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
									Total (add lines 3 and 4)
								<span class="styDotLn" style="float:right;">..........................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">5</div>							
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalDistributionAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:1mm;width:5mm;">6 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
									Tax-exempt interest included on line 5 (from Schedule J (Form 1041), line 37, column (c))
								<span class="styDotLn" style="float:right;">....</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">6</div>							
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExemptInterestAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:1mm;width:5mm;">7 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
									Taxable part of line 5 (subtract line 6 from line 5)
								<span class="styDotLn" style="float:right;">..................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">7</div>							
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalDistributionTaxableAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:1mm;width:5mm;">8 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
									Number of trust's earlier tax years in which amounts on line 7 are considered distributed
								<span class="styDotLn" style="float:right;">.....</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">8</div>							
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TrustEarlierTaxYearsCnt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="height:4.5mm;padding-left:1mm;width:5mm;">9 </div>
								<div class="styLNDesc" style="width:101mm;height:4.5mm;font-size:7.5pt">Average annual amount considered 
								  distributed (divide line 3 by line 8)
									<span class="styDotLn" style="float:right;">.</span>
								</div>
							</span> 
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AverageAnnualDistributedAmt"/>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4.5mm;width:40mm;"/>	
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">10 </div>
								<div class="styLNDesc" style="width:101mm;height:4.5mm;font-size:7.5pt">Multiply line 9 by 25% (0.25)
									<span class="styDotLn" style="float:right;">...............</span>
								</div>
							</span> 
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PercentageDistributionAmt"/>
									</xsl:call-template>
								</div>
								<div class="styShadingCell" style="height:4.5mm;width:40mm;"/>	
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">11 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
									Number of earlier tax years to be taken into account (see instructions)
								<span class="styDotLn" style="float:right;">...........</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">11</div>							
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EarlyTaxYearsAvgCnt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">12 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
									Average amount for recomputing tax (divide line 7 by line 11). Enter here and in each column on line 15
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">12</div>							
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AverageForRecomputingTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm; height: 10mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:10mm;padding-left:0mm;width:5mm;">13 </div>
								<div class="styLNDesc" style="width:42mm;height:10mm;font-size:7pt">Enter your taxable income before this distribution for the 
								  5 immediately preceding tax years.
								</div>
						</span> 
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:auto;float:none">(a) 2020</div><br/>
								<div class="styLNAmountBox" style="height:6mm;width:28mm;border-bottom:none;float:none;padding-top:2.5mm;
								  padding-bottom:0;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PYOneTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:auto;float:none">(b) 2019</div><br/>
								<div class="styLNAmountBox" style="height:6mm;width:28mm;border-bottom:none;float:none;padding-top:2.5mm;
								  padding-bottom:0;padding-right:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PYTwoTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:auto;float:none">(c) 2018</div><br/>
								<div class="styLNAmountBox" style="height:6mm;width:28mm;border-bottom:none;float:none;padding-top:2.5mm;
								  padding-bottom:0;padding-right:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PYThreeTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:auto;float:none">(d) 2017</div><br/>
								<div class="styLNAmountBox" style="height:6mm;width:28mm;border-bottom:none;float:none;padding-top:2.5mm;
								  padding-bottom:0;padding-right:1mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PYFourTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<div style="float:left;">
								<div class="styLNAmountBox" style="text-align:center;width:28mm;font-weight:bold;height:auto;float:none">(e) 2016</div><br/>
								<div class="styLNAmountBox" style="height:6mm;width:28mm;border-bottom:none;float:none;padding-top:2.5mm;
								  padding-bottom:0;padding-right:1mm">
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
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;"></div>
								<div class="styLNDesc" style="width:78mm;height:4.5mm;">
								</div>
						</span>
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;width:7mm;border-bottom-width:0mm;"></div>
								<div class="styLNAmountBox" style="height:4.5mm;width:32mm;font-weight:bold;text-align:left;padding-left:1mm;">(a)</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:32mm;font-weight:bold;text-align:left;padding-left:1mm;">(b)</div>
								<div class="styLNAmountBox" style="height:4.5mm;width:32mm;font-weight:bold;text-align:left;padding-left:1mm;">(c)</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;">14 </div>
								<div class="styLNDesc" style="width:78mm;height:8mm;font-size:7.5pt">Enter the amounts from line 13,
								  eliminating the highest and lowest taxable income years
									<span class="styDotLn" style="float:right;">........</span>
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">14</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/PYTaxableIncBfrAccumDistriAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">					
										<xsl:with-param name="Desc">Tax Year</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxYr"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/PYTaxableIncBfrAccumDistriAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">					
										<xsl:with-param name="Desc">Tax Year</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxYr"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/PYTaxableIncBfrAccumDistriAmt"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">					
										<xsl:with-param name="Desc">Tax Year</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxYr"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;padding-top:3mm;padding-right:1mm;">15</div>
								<div class="styLNDesc" style="width:78mm;height:8mm;padding-top:3mm;font-size:7.5pt;">Enter amount from line 12 in each column
									<span class="styDotLn" style="float:right;">.....</span>
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">15</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AverageForRecomputingTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AverageForRecomputingTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AverageForRecomputingTaxAmt"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;padding-top:3mm;">16</div>
								<div class="styLNDesc" style="width:78mm;height:8mm;padding-top:3mm;padding-right:1mm;font-size:7.5pt">Recomputed 
								  taxable income (add lines 14 and 15)
								<span class="styDotLn" style="float:right;">..</span>
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">16</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/RecomputedTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/RecomputedTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/RecomputedTaxableIncomeAmt"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;padding-top:3mm;">17 </div>
								<div class="styLNDesc" style="width:78mm;height:8mm;padding-top:3mm;padding-right:1mm;font-size:7.5pt">Income tax on 
								  amounts on line 16
								<span class="styDotLn" style="float:right;">.......</span>
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">17</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/IncomeTaxAmt"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;padding-top:3mm;">18 </div>
								<div class="styLNDesc" style="width:78mm;height:8mm;padding-top:3mm;padding-right:1mm;font-size:7.5pt">Income tax 
								  before credits on line 14 income
								<span class="styDotLn" style="float:right;">....</span>
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">18</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/IncomeTaxBeforeCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/IncomeTaxBeforeCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/IncomeTaxBeforeCreditsAmt"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;padding-top:3mm;">19 </div>
								<div class="styLNDesc" style="width:78mm;height:8mm;padding-top:3mm;padding-right:1mm;font-size:7.3pt">Additional tax 
								  before credits (subtract line 18 from line 17)
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">19</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/AdditionalTaxBeforeCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/AdditionalTaxBeforeCreditsAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/AdditionalTaxBeforeCreditsAmt"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;padding-top:3mm;">20 </div>
								<div class="styLNDesc" style="width:78mm;height:8mm;padding-top:3mm;padding-right:1mm;font-size:7.5pt">Tax credit 
								  adjustment
									<span class="styDotLn" style="float:right;">...........</span>
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">20</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxCreditAdjustmentAmt"/>
									</xsl:call-template>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxCreditAdjustmentAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxCreditAdjustmentAmt"/>
									</xsl:call-template>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxCreditAdjustmentAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxCreditAdjustmentAmt"/>
									</xsl:call-template>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxCreditAdjustmentAmt"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;padding-top:3mm;">21 </div>
								<div class="styLNDesc" style="width:78mm;height:8mm;padding-top:3mm;padding-right:1mm;font-size:7.5pt">Subtract line 20
								  from line 19
									<span class="styDotLn" style="float:right;">.........</span>
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">21</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxLessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxLessCreditAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxLessCreditAmt"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;padding-top:3mm;">22 </div>
								<div class="styLNDesc" style="width:78mm;height:8mm;padding-top:3mm;padding-right:1mm;font-size:7.5pt">Alternative minimum
								  tax adjustments
									<span class="styDotLn" style="float:right;">......</span>
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">22</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/AMTAdjustmentAmt"/>
									</xsl:call-template>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/AMTAdjustmentAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/AMTAdjustmentAmt"/>
									</xsl:call-template>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/AMTAdjustmentAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/AMTAdjustmentAmt"/>
									</xsl:call-template>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/AMTAdjustmentAmt"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
						<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:8mm;padding-left:0mm;width:5mm;padding-top:3mm;">23 </div>
								<div class="styLNDesc" style="width:78mm;height:8mm;padding-top:3mm;padding-right:1mm;font-size:7.5pt">Combine lines 21 
								  and 22
									<span class="styDotLn" style="float:right;">..........</span>
								</div>
						</span> 
						<span style="float:right;">
								<div class="styLNRightNumBox" style="height:8mm;width:7mm;padding-top:3mm;">23</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/AdjAccumulationDistriTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/AdjAccumulationDistriTaxAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="height:8mm;width:32mm;padding-top:3mm;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/AdjAccumulationDistriTaxAmt"/>
									</xsl:call-template>
								</div>
						</span>
					</div>
					<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">24 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">Add columns (a), (b), and (c), line 23
									<span class="styDotLn" style="float:right;">......................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ThreeYearAdjustedTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">25 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">Divide the line 24 amount by 3
									<span class="styDotLn" style="float:right;">........................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/AverageAdjustedTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">26 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">Multiply the amount on line 25 by the number 
								  of years on line 11
									<span class="styDotLn" style="float:right;">.............</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalAdjustedTaxAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">27 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">Enter the amount from line 4
									<span class="styDotLn" style="float:right;">........................</span>
								</div>
							</span>
							<span style="float:right;">
								<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
								<div class="styLNAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TrustTaxesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:0mm;width:5mm;">28 </div>
								<div class="styLNDesc" style="width:141mm;height:4.5mm;font-size:7.5pt">
								Partial tax attributable to the accumulation distribution (subtract line 27 from line 26) (If zero or less, enter -0-)
								<span class="styDotLn" style="float:right;">...............................</span>
								</div>
							</span>
							 <span style="float:right;">
								<div class="styLNRightNumBox" style="height:7.5mm;border-bottom-width:0mm;padding-top:4mm">28</div>
								<div class="styLNAmountBox" style="height:7.5mm;border-bottom-width:0mm;padding-top:4mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PartialTaxOnAccumDistriAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
					<!-- capturing the page bottom info -->
					<div class="styBB" style="width: 187mm"></div>
						<div>
						<b>For Paperwork Reduction Act Notice, see back of form.</b>  <span style="width:46mm"/>   Cat. No. 13180V
						<span style="width:15mm"/>
						Form <b style="font-size:9pt">4970</b> (2021)
						</div>
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
							<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[1]/TaxYr"/>
							<xsl:with-param name="Desc">Line 14a - Tax Year</xsl:with-param>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[2]/TaxYr"/>
							<xsl:with-param name="Desc">Line 14b - Tax Year</xsl:with-param>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="TargetNode" select="$FormData/AccumulationDistriTaxPYGrp[3]/TaxYr"/>
							<xsl:with-param name="Desc">Line 14c - Tax Year</xsl:with-param>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>