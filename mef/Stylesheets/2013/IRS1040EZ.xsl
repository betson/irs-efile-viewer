<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1040EZStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form1040EZData" select="$RtnDoc/IRS1040EZ"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form1040EZData)"/>
					</xsl:call-template>
				</title>
				<!--  No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1040EZ"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1040EZStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS1040EZ">
					<xsl:call-template name="DocumentHeader"/>
					<xsl:call-template name="CreateFormHeader"/>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Top Section -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;">
						<!-- Line i -->
						<div class="styIRS1040EZHeaderCell" style="width:67mm;height:10mm;">
							Your first name and initial<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Name</xsl:with-param>
							</xsl:call-template>
							<span style="width:4px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Primary Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040EZHeaderCell" style="width:74.8mm;height:10mm">
							Last name <br/>
						</div>
						<div class="styIRS1040EZHeaderCell" style="width:45mm;border-right-width:0px;height:10mm">
							<span class="styBoldText">Your social security number</span><br/>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line ii -->
						<div class="styIRS1040EZHeaderCell" style="width:67mm;">
							If a joint return, spouse's first name and initial<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">SpouseName</xsl:with-param>
							</xsl:call-template>
							<span style="width:4px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Spouse Name Control</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1040EZHeaderCell" style="width:74.8mm;">
							Last name <br/>
						</div>
						<div class="styIRS1040EZHeaderCell" style="width:45mm;border-right-width:0px;">
							<span class="styBoldText" style="font-family:Arial Bold;font-size:7.5pt;">Spouse's social security number</span><br/>
							<span style="width:100%;text-align:center;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<!-- Line iii -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styIRS1040EZHeaderCell" style="width:120mm;height:10mm;">
								Home address (number and street). If you have a P.O. box, see instructions.<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
								</xsl:call-template>
							</div>
							<div class="styIRS1040EZHeaderCell" style="width:21.8mm;height:10mm;">
								Apt. no.<br/><span style="width:0px;"/>
							</div>
							<div class="styIRS1040EZHeaderCell" style="width:45mm;height:10mm;padding-top:6px;border-right-width:0px;">
								<div class="styGenericDiv" style="width:5mm;padding-top:1.5mm;"><img alt="Up-pointing triangle" src="{$ImagePath}/1040EZ_Triangle.gif" height="14" width="14"/></div>
								<div class="styGenericDiv" style="text-align:center;width:35mm;">Make sure the SSN(s)<br/>above are correct.</div>
							</div>
						</div>
						<!-- Line iv -->
						<div class="styIRS1040EZHeaderCell" style="width:141.8mm;height:10mm;">
							<span style="font-family:Arial;">City, town or post office, state, and ZIP code. If you have a foreign address, also complete spaces below (see instructions).</span><br/>
							<xsl:choose>
								<xsl:when test="$RtnHdrData/Filer/ForeignAddress">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">City</xsl:with-param>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styIRS1040EZHeaderCell" style="width:45mm;height:20mm;float:right;font-family:Arial Narrow;border-right-width:0px;">
							<span style="font-family:Arial;font-weight:bold;padding-left:4px;">Presidential Election Campaign</span><br/>
							<span style="font-size:4pt;"><br/></span>
							Check here if you, or your spouse if filing<br/>
							jointly, want $3 to go to this fund. Checking <br/>
							a box below will not change your tax or <br/>
							<span style="float:left;">refund.</span>
							<span style="float:right;">
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040EZData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040EZPECFPrimaryInd"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040EZData/PECFPrimaryInd"/>
										<xsl:with-param name="BackupName" select="IRS1040EZPECFPrimaryInd"/>
									</xsl:call-template>
									<b>You</b>
								</label>
								<span style="width:4px;"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form1040EZData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040EZPECFSpousend"/>
									</xsl:call-template>
								</input>
								<span style="width:4px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form1040EZData/PECFSpouseInd"/>
										<xsl:with-param name="BackupName" select="IRS1040EZPECFSpouseInd"/>
									</xsl:call-template>
									<b>Spouse</b>
								</label>
								<span style="width:4px;"/>
							</span>
						</div>
						<!-- Line v -->
						<div class="styIRS1040EZHeaderCell" style="width:64mm;height:10mm;">
							Foreign country name<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">Country</xsl:with-param>
								<xsl:with-param name="MainForm">true</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040EZHeaderCell" style="width:47mm;height:10mm;">
							Foreign province/state/county<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styIRS1040EZHeaderCell" style="width:30.8mm;height:10mm;">
							<span style="font-family:arial;">Foreign postal code</span><br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Income -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;height:auto;">
						<div class="styIRS1040EZLineItem" style="height:52mm;">
							<!-- Header -->
							<div class="styIRS1040EZCleanDiv" style="width:18%;height:100%;">
								<span class="styBoldText" style="font-size:10pt;">Income</span>
								<br/>
								<br/>
								<b>Attach<br/>Form(s) W-2<br/>here.</b>
								<br/>
								<br/>
								Enclose, but do<br/>not attach, any<br/>payment.
								<br/>
							</div>
							<!-- Body -->
							<div class="styIRS1040EZCleanDiv" style="width:81.8%;height:100%;">
								<!-- (1) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItemBB" style="height:7mm;">
									<div class="styIRS1040EZLNLeftNumBox">1</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										Wages, salaries, and tips. This should be shown in box 1 of your Form(s) W-2.<br/>
										Attach your Form(s) W-2.
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;height:6mm;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">2mm</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">1</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/WagesSalariesAndTipsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (2) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItem" style="width:100%;height:2mm;font-size:2pt;"/>
								<div class="styIRS1040EZLineItemBB" style="height:4mm;">
									<div class="styIRS1040EZLNLeftNumBox">2</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										Taxable interest. If the total is over $1,500, you cannot use Form 1040EZ.
										<xsl:if test="$Form1040EZData/TaxExemptInterestAmt">
											<span style="width:4px;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Tax Exemption Interest Amount</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1040EZData/TaxExemptInterestAmt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form1040EZData/TaxExemptInterestCd">
											<span style="width:4px;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Tax Exemption Interest Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1040EZData/TaxExemptInterestCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">2</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/TaxableInterestAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (3) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItem" style="width:100%;height:2mm;font-size:2pt;"/>
								<div class="styIRS1040EZLineItemBB"  style="height:4mm;">
									<div class="styIRS1040EZLNLeftNumBox">3</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										Unemployment compensation and Alaska Permanent Fund dividends (see instructions).
										<xsl:if test="$Form1040EZData/UnemploymentCompAmt/@repaymentAmt">
											<span style="width:4px;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Repayment Amount</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1040EZData/UnemploymentCompAmt/@repaymentAmt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form1040EZData/UnemploymentCompAmt/@repaymentCd">
											<span style="width:4px;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Repayment Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1040EZData/UnemploymentCompAmt/@repaymentCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">3</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/UnemploymentCompAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (4) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItem" style="width:100%;height:2mm;font-size:2pt;"/>
								<div class="styIRS1040EZLineItemBB"  style="height:4mm;">
									<div class="styIRS1040EZLNLeftNumBox">4</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										Add lines 1, 2, and 3. This is your <b>adjusted gross income.</b>
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">4</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/AdjustedGrossIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (5) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItemBB"  style="height:auto;">
									<div class="styIRS1040EZLNLeftNumBox" style="height:auto;">5</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										If someone can claim you (or your spouse if a joint return) as a dependent, check<br/>
										the applicable box(es) below and enter the amount from the worksheet on back.<br/>
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/PrimaryClaimAsDependentInd"/>
												<xsl:with-param name="BackupName">Form1040EZDataPrimaryClaimAsDependentInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/PrimaryClaimAsDependentInd"/>
												<xsl:with-param name="BackupName">Form1040EZDataPrimaryClaimAsDependentInd</xsl:with-param>
											</xsl:call-template>
											<b>You</b>
										</label>
										<span style="width:13mm;"/>
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/SpouseClaimAsDependentInd"/>
												<xsl:with-param name="BackupName">Form1040EZDataSpouseClaimAsDependentInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/SpouseClaimAsDependentInd"/>
												<xsl:with-param name="BackupName">Form1040EZDataSpouseClaimAsDependentInd</xsl:with-param>
											</xsl:call-template>
											<b>Spouse</b>
										</label>
										<br/>
										If no one can claim you (or your spouse if a joint return), enter $10,000 if <b>single;</b>
										<br/>
										$20,000 if <b>married filing jointly.</b> See back for explanation.
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">12.5mm</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">5</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/CombStdDedAndPrsnlExemptAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (6) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItem" style="width:100%;height:auto;">
									<div class="styIRS1040EZLNLeftNumBox">6</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										Subtract line 5 from line 4. If line 5 is larger than line 4, enter -0-.<br/>
										This is your <b>taxable income.</b>
										<span style="width:69mm;"/>
										<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">2mm</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">6</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/TaxableIncomeAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Payments,Credits,and Tax -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;">
						<div class="styIRS1040EZLineItem" style="height:23mm;">
							<!-- Header -->
							<div class="styIRS1040EZCleanDiv" style="width:18%;height:100%;">
								<span class="styBoldText" style="font-size:10pt;">Payments,<br/>Credits,<br/>and Tax</span>
							</div>
							<!-- Body -->
							<div class="styIRS1040EZCleanDiv" style="width:81.8%;height:100%;">
								<!-- (7) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItemBB" style="height:4mm;">
									<div class="styIRS1040EZLNLeftNumBox">7</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										Federal income tax withheld from Form(s) W-2 and 1099.
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">7</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/WithholdingTaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (8) ////////////////////////////////////////////////////-->
								<!-- (8a) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItemBB" style="height:4mm;">
									<div class="styIRS1040EZLNLeftNumBox" style="padding-right:0px;">8a</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										<b>Earned income credit (EIC)</b> (see instructions).
										<xsl:if test="$Form1040EZData/EICEligibilityLiteralCd">
											<span style="width:4px;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Earned Income Credit Eligibility Code</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$Form1040EZData/EICEligibilityLiteralCd"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">8a</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/EarnedIncomeCreditAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (8b) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItemBB" style="height:4mm;">
									<div class="styIRS1040EZLNLeftNumBox" style="padding-right:0px;">b</div>
									<div class="styIRS1040EZLNDesc" style="width:74mm;">
										Nontaxable combat pay election.
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:left;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">8b</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/NontxCombatPayElectionAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (9) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItemBB" style="height:4mm;">
									<div class="styIRS1040EZLNLeftNumBox">9</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										Add lines 7 and 8a. These are your <b>total payments and credits.</b>
										<span style="width:3mm;"/>
										
										<xsl:call-template name="LinkToLeftoverDataTableInline">					
											<xsl:with-param name="Desc">Request For Extension Code</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/RequestForExtensionAmt/@requestForExtensionCd"/>
										</xsl:call-template>

										<xsl:call-template name="LinkToLeftoverDataTableInline">					
											<xsl:with-param name="Desc">Request For Extension Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/RequestForExtensionAmt"/>
										</xsl:call-template>
										<span style="width:17.5mm;"/>
										<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">9</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/TotalPaymentsAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (10) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItem" style="width:100%;">
									<div class="styIRS1040EZLNLeftNumBox">10</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										<b>Tax.</b> Use the amount on <b>line 6 above</b> to find your tax in the tax table in the<br/>
										instructions. Then, enter the tax from the table on this line.
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">2mm</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">10</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/TaxAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Refund -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styIRS1040EZLineItem" style="height:24mm;">
							<!-- Header -->
							<div class="styIRS1040EZCleanDiv" style="width:18%;height:100%;">
								<span class="styBoldText" style="font-size:10pt;">Refund</span>
								<br/>
								<span style="font-size:3pt;"><br/></span>
								Have it directly<br/>
								deposited! See<br/>
								instructions and <br/>
								fill in 11b, 11c,<br/>
								and 11d or<br/>
								Form 8888.
							</div>
							<!-- Body -->
							<div class="styIRS1040EZCleanDiv" style="width:81.8%;height:100%;">
								<!-- (11a) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItemBB" style="height:9mm;">
									<div class="styIRS1040EZLNLeftNumBox" style="padding-right:0px;">11a</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/Form8888Ind"/>
												<xsl:with-param name="BackupName">Form1040EZDataForm8888Ind</xsl:with-param>
											</xsl:call-template>
										If line 9 is larger than line 10, subtract line 10 from line 9. This is your <b>refund.</b>
										If Form 8888 is attached, check here</label>
										<xsl:if test="$Form1040EZData/Form8888Ind">
											<xsl:if test="$Form1040EZData/Form8888Ind/@referenceDocumentId">
												<span style="width:4px;"/>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$Form1040EZData/Form8888Ind"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:if>
										<span style="width:3mm;"/>
										<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/>
										<span style="width:4px;"/>
										<input class="styCkbox" type="checkbox" style="width:4mm;height:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/Form8888Ind"/>
												<xsl:with-param name="BackupName">Form1040EZDataForm8888Ind</xsl:with-param>
											</xsl:call-template>
										</input>
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;padding-top:3mm;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">2mm</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">11a</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/RefundAmt"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- (11b-11c) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItem" style="width:100%;height:9mm;">
									<span style="width:100%;height:3mm;"/>
									<div class="styIRS1040EZLNLeftNumBox" style="padding-right:0px;padding-top:2mm;">
										<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/>
										<span style="width:7px"/>b
									</div>
									<div class="styIRS1040EZLNDesc" style="width:25mm;padding-top:2mm;">
										Routing number
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:50mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040EZData/RoutingTransitNumber"/>
										</xsl:call-template>
									</div>
									<div class="styIRS1040EZLNDesc" style="width:55mm;float:left;padding-top:0mm;">
										<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/>
										<span class="styBoldText">c Type:</span>
										<span style="width:4px;"/>
										<input class="styCkbox" type="checkbox" style="height:4mm;width:4mm;">
											<xsl:call-template name="PopulateEnumeratedCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/BankAccountTypeCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
												<xsl:with-param name="BackupName">Form1040EZDataBankAccountTypeCd[1]</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/BankAccountTypeCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'1'"/>
												<xsl:with-param name="BackupName">Form1040EZDataBankAccountTypeCd[1]</xsl:with-param>
											</xsl:call-template>
											Checking
										</label>
										<span style="width:3mm;"/>
										<input class="styCkbox" type="checkbox" style="height:4mm;width:4mm;">
											<xsl:call-template name="PopulateEnumeratedCheckbox">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/BankAccountTypeCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
												<xsl:with-param name="BackupName">Form1040EZDataBankAccountTypeCd[2]</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/BankAccountTypeCd"/>
												<xsl:with-param name="DisplayedCheckboxValue" select="'2'"/>
												<xsl:with-param name="BackupName">Form1040EZDataBankAccountTypeCd[2]</xsl:with-param>
											</xsl:call-template>
											Savings
										</label>
									</div>
								</div>
								<!-- (11d) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItem" style="width:100%;height:auto;">
									<div class="styIRS1040EZLNLeftNumBox" style="padding-right:0px;">
										<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/>
										<span style="width:7px"/>d
									</div>
									<div class="styIRS1040EZLNDesc" style="width:25mm;">
										Account number
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:90mm;height:4mm;border-width:1px 1px 1px 1px;text-align:center;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form1040EZData/DepositorAccountNumber"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="styTBB" style="width:155mm;height:4px;font-size:1pt;"/>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Amount You Owe -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styTBB" style="width:187mm;">
						<div class="styIRS1040EZLineItem" style="height:8mm;">
							<!-- Header -->
							<div class="styIRS1040EZCleanDiv" style="width:18%;height:100%;">
								<span class="styBoldText" style="font-size:9pt;">Amount<br/>You Owe</span>
							</div>
							<!-- Body -->
							<div class="styIRS1040EZCleanDiv" style="width:81.8%;height:100%;">
								<!-- (12) ////////////////////////////////////////////////////-->
								<div class="styIRS1040EZLineItem" style="width:100%;">
									<div class="styIRS1040EZLNLeftNumBox">12</div>
									<div class="styIRS1040EZLNDesc" style="width:112mm;">
										If line 10 is larger than line 9, subtract line 9 from line 10. This is<br/>
										the <b>amount you owe</b>. For details on how to pay, see instructions.<span style="width:33mm;"/>
										<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
									<div class="styIRS1040EZCleanDiv" style="width:34mm;float:right;">
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Height">2mm</xsl:with-param>
											<xsl:with-param name="AmountBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
											<xsl:with-param name="NumberBoxStyle">padding:0px 0px 0px 0px;</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="CreateBox">
											<xsl:with-param name="Number">12</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$Form1040EZData/AmountOwedAmt"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Third Party Designee -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1040EZLineItem" style="height:12mm;">
							<!-- Header -->
							<div class="styIRS1040EZCleanDiv" style="width:18%;height:100%;">
								<span class="styBoldText" style="font-size:10pt;">Third Party<br/>Designee</span>
							</div>
							<!-- Body -->
							<div class="styIRS1040EZCleanDiv" style="width:81.8%;height:100%;">
								<div class="styIRS1040EZLineItem" style="width:100%;">
									<div class="styIRS1040EZLNDesc" style="width:100%;padding:0px 0px 0px 0px;">
										Do you want to allow another person to discuss this return with the IRS (see instructions)?
										<span style="width:6mm;"/>
										<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
										<span style="width:1mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/ThirdPartyDesigneeInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:if test="$Form1040EZData/ThirdPartyDesigneeInd">
													<xsl:call-template name="PopulateYesCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1040EZData/ThirdPartyDesigneeInd"/>
														<xsl:with-param name="BackupName">IRS1040EZThirdPartyDesigneeInd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</input>
										</span>
										<span style="width:2mm;"/>
										<label>
											<xsl:if test="$Form1040EZData/ThirdPartyDesigneeInd">
												<xsl:call-template name="PopulateLabelYes">
													<xsl:with-param name="TargetNode" select="$Form1040EZData/ThirdPartyDesigneeInd"/>
													<xsl:with-param name="BackupName">IRS1040EZThirdPartyDesigneeInd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<b>Yes.</b> Complete below.
										</label>
										<!-- ++++++++++++++ No Checkbox +++++++++++++ -->
										<span style="width:1mm;"/>
										<span>
											<xsl:call-template name="PopulateSpan">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/ThirdPartyDesigneeInd"/>
											</xsl:call-template>
											<input type="checkbox" class="styCkbox">
												<xsl:if test="$Form1040EZData/ThirdPartyDesigneeInd">
													<xsl:call-template name="PopulateNoCheckbox">
														<xsl:with-param name="TargetNode" select="$Form1040EZData/ThirdPartyDesigneeInd"/>
														<xsl:with-param name="BackupName">IRS1040EZThirdPartyDesigneeInd</xsl:with-param>
													</xsl:call-template>
												</xsl:if>
											</input>
										</span>
										<span style="width:2mm;"/>
										<label>
											<xsl:if test="$Form1040EZData/ThirdPartyDesigneeInd">
												<xsl:call-template name="PopulateLabelNo">
													<xsl:with-param name="TargetNode" select="$Form1040EZData/ThirdPartyDesigneeInd"/>
													<xsl:with-param name="BackupName">IRS1040EZThirdPartyDesigneeInd</xsl:with-param>
												</xsl:call-template>
											</xsl:if>
											<span class="styBoldText">No</span>
										</label>
									</div>
								</div>
								<div class="styIRS1040EZLineItem" style="width:100%;">
									<!-- Designee’s name-->
									<div class="styIRS1040EZLNDesc" style="width:13mm;padding:0px 0px 0px 0px;height:100%;padding-top:2mm;">Designee’s<br/>name</div>
									<div class="styIRS1040EZLNDesc" style="width:3mm;padding:12px 0px 0px 0px;height:100%;">
										<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/>
									</div>
									<div class="styIRS1040EZLNDesc" style="width:54mm;padding:5px 0px 0px 7px;height:100%;">
										<xsl:if test="$Form1040EZData/ThirdPartyDesigneeName">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/ThirdPartyDesigneeName"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$Form1040EZData/Preparer">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/Preparer"/>
											</xsl:call-template>
										</xsl:if>
									</div>
									<!-- Phone no.-->
									<div class="styIRS1040EZLNDesc" style="width:7.5mm;padding:0px 0px 0px 0px;height:100%;padding-top:2mm;">Phone<br/>no.</div>
									<div class="styIRS1040EZLNDesc" style="width:3mm;padding:12px 0px 0px 0px;height:100%;"><img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/></div>
									<div class="styIRS1040EZLNDesc" style="width:25mm;padding:5px 0px 0px 0px;height:100%;text-align:center;">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$Form1040EZData/ThirdPartyDesigneePhone"/>
										</xsl:call-template>
									</div>
									<!-- Personal identification number (PIN) -->
									<div class="styIRS1040EZLNDesc" style="width:25mm;padding:0px 0px 0px 0px;height:100%;padding-top:2mm;">Personal identification<br/>number (PIN)</div>
									<div class="styIRS1040EZLNDesc" style="width:3mm;padding:12px 0px 0px 0px;height:100%;"><img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Small Bullet"/></div>
										<div class="styIRS1040EZCleanDiv" style="border-width:1px 1px 1px 1px;border-color:black;text-align:center;width:15mm;height:auto;margin-top:3mm;">
											<xsl:call-template name="PopulatePin">
												<xsl:with-param name="TargetNode" select="$Form1040EZData/ThirdPartyDesigneePIN"/>
											</xsl:call-template>
										</div>
								</div>
							</div>
						</div>
					</div>
					<br></br>
					<br></br>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Sign Here -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styGenericDiv" style="height:6mm;width:187mm;">
						<div class="styIRS1040EZLineItem" style="height:6mm;">
							<!-- Header -->
							<div class="styGenericDiv" style="width:18%;height:100%;">
								<span class="styBoldText" style="font-size:10pt;">Sign<br/>Here</span>
							</div>
							<div class="styGenericDiv" style="width:82%;height:100%">
								<div class="styIRS1040EZLNDesc" style="width:100%;height:auto;padding:0px 0px 0px 0px;">
									Under penalties of perjury, I declare that I have examined this return and, to the best of my knowledge and belief, it is true, correct, and 
									accurately lists all amounts and sources of income I received during the tax year. Declaration of preparer (other than the taxpayer) is based 
									on all information of which the preparer has any knowledge.
								</div>
							</div>
						</div>
					</div>
							<!-- Body -->
						<div class="styGenericDiv" style="width:187mm;height:22.5mm;border-bottom: 1px solid black;margin-top:2mm;">
							 <div class="styGenericDiv" style="width:24mm;height:22.5mm;">
										Joint return? See<br/>
										 instructions.
										<br/><br/>
										Keep a copy for<br/>
										your records.
							 </div>
							 <div class="styGenericDiv" style="width:10mm;height:22.5mm;padding-top:4mm">
								 <img src="{$ImagePath}/1040EZ_Bullet_Lg.gif" alt="Large Bullet"/>
							 </div>
							 
								<!-- Container -->
									<!-- Line 1 -->
									<div class="styGenericDiv" style="width:153mm;height:10mm;border-bottom:1px solid black;">
										<!-- Your Signature -->
										<div class="styIRS1040EZLNDesc" style="width:50mm;height:10mm;border-right-width:1px;border-color:black;padding-left:0px;">
											Your signature<br/>
											<span style="width:100%;padding-top:6px;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignaturePIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignature</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Date -->
										<div class="styIRS1040EZLNDesc" style="width:16mm;height:10mm;border-right-width:1px;border-color:black;padding-left:0px;">
											<span style="width:100%;padding-left:4px;">Date</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/PrimarySignatureDt"/>
													<xsl:with-param name="BackupName">RtnHdrDataPrimarySignatureDate</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Your occupation -->
										<div class="styIRS1040EZLNDesc" style="width:45mm;height:10mm;border-right-width:1px;border-color:black;padding-left:0px;">
											<span style="width:100%;padding-left:4px;">Your occupation</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1040EZData/PrimaryOccupation"/>
												</xsl:call-template>
											</span>
										</div>
										<!-- Daytime phone number -->
										<div class="styIRS1040EZLNDesc" style="width:42mm;height:10mm;padding-left:0px;">
											<span style="width:100%;padding-left:4px;">Daytime phone number</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:choose>
													<xsl:when test="$Form1040EZData/DaytimePhoneNumber">
														<xsl:call-template name="PopulatePhoneNumber">
															<xsl:with-param name="TargetNode" select="$Form1040EZData/DaytimePhoneNumber"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form1040EZData/OptionalForeignTelephoneNumber"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</div>
									</div>
									<!-- Line 2 -->
									<div class="styGenericDiv" style="width:153mm;height:12.5mm;">
										<!-- Your Signature -->
										<div class="styIRS1040EZLNDesc" style="width:50mm;height:12.5mm;border-right-width:1px;border-color:black;padding-left:0px;">
											Spouse’s signature. If a joint return, <b>both</b> must sign.<br/>
											<span style="width:100%;padding-top:6px;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignaturePIN"/>
													<xsl:with-param name="BackupName">RtnHdrDataSpouseSignature</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Date -->
										<div class="styIRS1040EZLNDesc" style="width:16mm;height:12.5mm;border-right-width:1px;border-color:black;padding-left:0px;">
											<span style="width:100%;padding-left:4px;">Date</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/SpouseSignatureDt"/>
													<xsl:with-param name="BackupName">RtnHdrDataSpouseSignatureDate</xsl:with-param>
												</xsl:call-template>
											</span>
										</div>
										<!-- Spouse’s occupation -->
										<div class="styIRS1040EZLNDesc" style="width:45mm;height:12.5mm;border-right-width:1px;border-color:black;padding-left:0px;">
											<span style="width:100%;padding-left:4px;">Spouse’s occupation</span>
											<span style="width:100%;padding-top:6px;text-align:center;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form1040EZData/SpouseOccupation"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styIRS1040EZLNDesc" style="width:42mm;height:12.5mm;padding-left:0px;">
											<span style="width:100%;padding-left:4px;font-family:Arial Narrow;">If the IRS sent you an Identity Protection</span>
											<span style="width:40%;padding-left:4px;font-family:Arial Narrow;">PIN, enter it <br/>here (see inst.)</span>
											<span style="width:59%;padding-top:0px;text-align:center;font-family:Verdana;font-size:7pt;border:1px solid black;">
												<xsl:call-template name="PopulatePin">
													<xsl:with-param name="TargetNode" select="$RtnHdrData/IdentityProtectionPIN"/>
												</xsl:call-template>
											</span>
										</div>
									</div>
							</div>
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<!-- Paid Preparer Use Only -->
					<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
					<div class="styGenericDiv" style="width:187mm;font-size:6.5pt;font-family:arial;border-bottom: 2px solid black;">
						<div class="styGenericDiv" style="height:18mm;width:24mm;padding-top:4mm;">
							<span class="styMainTitle" style="font-size:11pt;">
								Paid
								Preparer
								Use Only
							</span>
						</div>
						<div class="styGenericDiv" style="height:100%;width:161mm;border-width:0px 0px 0px 0px; border-color:black;border-style:solid;">
							<div class="styGenericDiv" style="width:161mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:9mm;width:46.8mm;padding-top:.5mm;border-right:1px solid black;padding-left:3px;">
								Print/Type preparer's name<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonName</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:9mm;width:46.5mm;padding-top:.5mm;border-right:1px solid black;padding-left:1mm;">
									Preparer's signature
								</div>
								<div class="styLNDesc" style="height:9mm;width:15.2mm;border-right:1px solid black;padding-top:.5mm;padding-left:1mm;">Date <br/>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationDateSigned</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:9mm;width:18mm;border-right:1px solid black;padding-top:0mm;padding-bottom:0mm;padding-left:1mm;margin-top:0mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
										</xsl:call-template>
										Check 
										<input class="styCkbox" type="checkbox" style="height:3.5mm;width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployed</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/>if<br/>self-employed
									</label>
								</div>
								<div class="styLNDesc" style="height:9mm;width:16mm;padding-top:.5mm;padding-left:1mm;">PTIN
								 <br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="styGenericDiv" style="width:161mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:8mm;width:108.5mm;border-right:1px solid black;">
									<span class="styGenericDiv" style="padding-left:3px;">Firm's name 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerBusinessName2</xsl:with-param>
										</xsl:call-template>
									</div>
								</div>
								<div class="styLNDesc" style="height:8mm;width:32mm;padding-left:1mm;">Firm's EIN
								<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerFirmIDNumber</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerFirmIDNumber</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReason">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationMissingEINReason</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div class="styGenericDiv" style="width:161mm;">
								<div class="styLNDesc" style="width:108.5mm;border-right:1px solid black;height:12mm;">
									<div class="styGenericDiv" style="padding-right:.5mm;padding-left:3px;">Firm's address 
									<img src="{$ImagePath}/1040EZ_Bullet_Sm.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine1</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationAddressLine2</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">State</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationUSAddressZip</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">City</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignAddressCity</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignProvinceOrState</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPostalCode</xsl:with-param>
											</xsl:call-template>,
											<span style="width:2px;"/>
											<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
												<xsl:with-param name="TargetNode">Country</xsl:with-param>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignCountry</xsl:with-param>
											</xsl:call-template>
										</xsl:if>
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> Phone no. 
 								<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">Phone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPhone</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
										<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationForeignPhone</xsl:with-param>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Page Break and Footer-->
					<div class="pageEnd" style="width:187mm;padding-top:1mm;">
						<div style="float:left;">
							<span class="styBoldText">
								For Disclosure, Privacy Act, and Paperwork Reduction Act Notice, see instructions.
							</span>
						</div>
						<div style="float:right;">
							<span style="width:50px;"/>  
								Form 
							<span class="styBoldText" style="font-size:8pt;">1040EZ</span> (2013)
						</div>
						<div style="float:right;text-align:center;width:26mm;font-size:7pt;">
							Cat. No. 11329W
						</div>
					</div>
					<!-- END Page Break and Footer-->
					<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<xsl:variable name="TableWidth">120</xsl:variable>
					<!-- Additional Data Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form1040EZData"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/PrimaryDateOfDeath"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/SpouseDateOfDeath"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/SpecialProcessingLiteralCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code 2</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/SpecialProcessingLiteralCd2"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Combat Zone Date</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/SpecialProcessingLiteralCd2/@combatZoneDate"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Special Processing Code Text</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/SpecialProcessingCodeTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:if test="$Form1040EZData/ProtectiveSec108iELCRecordInd">
							<xsl:call-template name="PopulateLeftOverCheckbox1040EZ">
								<xsl:with-param name="Desc">Top Left Margin - Protective Security ELC Record Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040EZData/ProtectiveSec108iELCRecordInd"/>
								<xsl:with-param name="BackupName">Form1040EZDataProtectiveSec108iELCRecordInd</xsl:with-param>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Primary Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - In Care Of Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Header - Spouse Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 2 - Tax Exemption Interest Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/TaxExemptInterestAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 2 - Tax Exemption Interest Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/TaxExemptInterestCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 3 - Repayment Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/UnemploymentCompAmt/@repaymentAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 3 - Repayment Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/UnemploymentCompAmt/@repaymentCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 8a - Earned Income Credit Eligibility Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/EICEligibilityLiteralCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 9 - Request For Extension Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/RequestForExtensionAmt/@requestForExtensionCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line 9 - Request For Extension Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/RequestForExtensionAmt"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:if test="$Form1040EZData/PowerOfAttorneySignedBy">
							<xsl:call-template name="PopulateLeftOverCheckbox1040EZ">
								<xsl:with-param name="Desc">Top Left Margin - Signed by Power Of Attorney Checkbox</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040EZData/PowerOfAttorneySignedBy"/>
								<xsl:with-param name="BackupName">Form1040EZDataPowerOfAttorneySignedBy</xsl:with-param>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/PowerOfAttorneyName"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:if test="$Form1040EZData/SurvivingSpouseInd">
							<xsl:call-template name="PopulateLeftOverCheckbox1040EZ">
								<xsl:with-param name="Desc">Top Left Margin - Surviving Spouse Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040EZData/SurvivingSpouseInd"/>
								<xsl:with-param name="BackupName">Form1040EZDataSurvivingSpouseInd</xsl:with-param>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="$Form1040EZData/PersonalRepresentativeInd">
							<xsl:call-template name="PopulateLeftOverCheckbox1040EZ">
								<xsl:with-param name="Desc">Top Left Margin - Personal Representative Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$Form1040EZData/PersonalRepresentativeInd"/>
								<xsl:with-param name="BackupName">Form1040EZDataPersonalRepresentativeInd</xsl:with-param>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/NonPaidPreparerCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Top Left Margin - Refund Anticipation Loan Code</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$Form1040EZData/RefundAnticipationLoanCd"/>
							<xsl:with-param name="DescWidth" select="$TableWidth"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Create Form Header -->
	<!-- ////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="CreateFormHeader">
		<div class="styTBB" style="width:187mm;border-bottom-width:4px;">
			<!-- Container -->
			<!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
			<div class="styIRS1040EZLineItem" style="height:auto;">
				<!-- Left Panel -->
				<div class="styIRS1040EZCleanDiv" style="width:32mm;height:100%;">
					<span style="width:100%; height:4mm;padding-top:2px;">
						<xsl:call-template name="PopulateFormLinks"/>
					</span>
					<span class="styBoldText">Form<br/></span>
					<div class="styFormNumber" style="width:100%;float:left;clear:none;font-size:18pt;">1040EZ</div>
				</div>
				<!-- Middle Panel -->
				<div class="styFTBox" style="width:auto;height:100%;">
					<div class="styIRS1040EZCleanDiv" style="width:90mm;height:100%;padding-left:2mm;padding-top:3px;">
						<span class="styAgency" style="font-size:7.5pt;font-family:Arial;width:100%;text-align:left;">
							Department of the Treasury
							<img src="{$ImagePath}/1040EZ_Short_Line.gif" alt="Line image"/>
							Internal Revenue Service
						</span>
						<span class="styMainTitle" style="font-size:12pt;width:100%;text-align:left;">
							Income Tax Return for Single and<br/>
							Joint Filers With No Dependents
							<span style="width:3px;"/>
							<span class="styNormalText" style="font-size:7.5pt;">(99)</span>
						</span>
					</div>
					<div class="styTY" style="float:left;clear:none;height:100%;font-size:25pt;padding-top:5mm;padding-right:1mm;">
						20<span class="stytycolor">13</span>
					</div>
				</div>
				<!-- Right Panel -->
				<div class="styIRS1040EZCleanDiv" style="float:right;height:100%;width:auto;padding-left:10mm;">
					<div class="styOMB" style="height:100%;font-size:7pt;padding-top:10mm;border-bottom-width:0px;">
						OMB No. 1545-0074
					</div>
				</div>
			</div>
			<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
		</div>
	</xsl:template>
	<!-- Populate Form Links -->
	<!-- ////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="PopulateFormLinks">
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Primary Date of Death</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/PrimaryDateOfDeath"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Spouse Date of Death</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/SpouseDateOfDeath"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/SpecialProcessingLiteralCd"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Special Processing Literal Code 2</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/SpecialProcessingLiteralCd2"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Combat Zone Date</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/SpecialProcessingLiteralCd2/@combatZoneDate"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Special Processing Code Text</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/SpecialProcessingCodeTxt"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Protective Security ELC Record Indicator</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/ProtectiveSec108iELCRecordInd"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Signed By</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/PowerOfAttorneySignedBy"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Power Of Attorney Name</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/PowerOfAttorneyName"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Surviving Spouse Indicator</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/SurvivingSpouseInd"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Personal Representative Indicator</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/PersonalRepresentativeInd"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Non Paid Preparer Code</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/NonPaidPreparerCd"/>
		</xsl:call-template>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Top Left Margin - Refund Anticipation Loan Code</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040EZData/RefundAnticipationLoanCd"/>
		</xsl:call-template>
		<xsl:call-template name="SetFormLinkInline">
			<xsl:with-param name="TargetNode" select="$Form1040EZData"/>
		</xsl:call-template>
	</xsl:template>
	<!-- Create Box -->
	<!-- ////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="CreateBox">
		<xsl:param name="TargetNode"/>
		<xsl:param name="PopulateAsText"/>
		<xsl:param name="AmountBoxStyle"/>
		<xsl:param name="NumberBoxStyle"/>
		<xsl:param name="Number"/>
		<xsl:param name="Width">26mm</xsl:param>
		<xsl:param name="Height">5mm</xsl:param>
		<div style="float:right;">
		<div class="styLNRightNumBox">
			<xsl:attribute name="style">
				float:left;
				padding:3px 0px 0px 0px;
				border-width:0px 0px 0px 0px;
				height:<xsl:value-of select="$Height"/>;
				<xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$Number">
				<xsl:value-of select="$Number"/>
			</xsl:if>
		</div>
		<div class="styLNAmountBox">
			<xsl:attribute name="style">
				width:<xsl:value-of select="$Width"/>;
				height:<xsl:value-of select="$Height"/>;
				border-width:0px 0px 0px 0px;float:left;text-align:right;padding-right:2px;font-size:6pt;padding-top:3px;font-size:6pt;
				<xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
			<xsl:if test="$TargetNode">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
				</xsl:call-template>
				<xsl:if test="$TargetNode/@referenceDocumentId">
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
		</div>
		</div>
	</xsl:template>
	<!-- Populate Left Over Checkbox 1040EZ-->
	<!-- ////////////////////////////////////////////////////////////////////////////////// -->
	<xsl:template name="PopulateLeftOverCheckbox1040EZ">
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="BackupName"/>
		<xsl:param name="DescWidth">100</xsl:param>
		<xsl:param name="AmountWidth" select="187 - $DescWidth"/>
		<xsl:if test="$TargetNode">
			<tr>
				<td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;height:4mm" scope="row">
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
							<xsl:with-param name="BackupName">
								<xsl:value-of select="$BackupName"/>
							</xsl:with-param>
						</xsl:call-template>
						<xsl:value-of select="$Desc"/>:
					</label>
				</td>
				<td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
					<input class="styCkbox" type="checkbox" style="height:4mm;width:4mm;">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$TargetNode"/>
							<xsl:with-param name="BackupName">
								<xsl:value-of select="$BackupName"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
