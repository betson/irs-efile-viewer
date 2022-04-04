<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8840Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8840"/>
	<xsl:variable name="countryNameDoc" select="document('CountriesList.xml')/countries"/>
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
				<meta name="Description" content="IRS Form 8840"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8840Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8840">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styStdDiv" style="border-bottom:2px solid black;display:inline-block;">
						<div class="styFNBox" style="width:31mm;height:20mm;border-right-width:2px;">
							Form <span class="styFN" style="display:inline;">8840</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<br/>
							<span class="styAgency" style="display:inline;">Department of the Treasury <br/>Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:128mm;height:20mm;">
							<span class="styFST" style="font-size:12pt;">Closer Connection Exception Statement for Aliens</span>
							<br/>
							<span class="styFBT">
								<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/> Attach to Form 1040-NR. <br/>
								<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/> Go to <a href="http://www.irs.gov/Form8840">www.irs.gov/Form8840</a> for the latest information.
							</span>
							<br/>
							<span>
								For the year January 1 &#8212; December 31, 2021, or other tax year<br/>beginning 
								<span style="min-width:22mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>
								and ending 
								<span style="min-width:22mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:20mm;border-left-width:2px;">
							<div class="styOMB">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="width:100%;">20<span class="styTYColor" style="display:inline;">21</span>
							</div>
							<div style="width:100%;">
								<span class="stySequence" style="padding-left:1.5mm;">Attachment<br/>Sequence No.</span>
								<span style="font-weight:bold;font-size:8pt;padding-left:2px;">101</span>
							</div>
						</div>
					</div>
					<!-- Begin Form -->
					<div class="styBB" style="border-bottom-width: 0px;">
						<div class="styNameBox" style="width:100mm;height:9mm;font-size:7pt;">
							Your first name and initial<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:27mm;height:9mm;padding-left:0.5mm;font-size:7pt;">
							Last name<br/> &#8194;
						</div>
						<div class="styEINBox" style="width:60mm;height:9mm;font-weight:normal;padding-left:0.5mm;font-size:7pt;">
							Your U.S. taxpayer identification number, if any<br/>
							<span class="styEINFld" style="width:35mm; text-align:left;font-weight:normal;text-align:center;">
								<span style="width:10mm;height:2.7mm"/>
								<xsl:choose>
									<!-- TIN from 1040, 1040NR return headers-->
									<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$RtnHdrData/Filer/SpouseSSN">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:when>
								</xsl:choose>
							</span>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:30mm;height:21mm;font-weight:bold;font-size:8pt;border-right:1px solid black;">
							Fill in your <br/>
							addresses only if <br/>
							you are filing this <br/>
							form by itself and <br/>
							not with your U.S. <br/>
							tax return
						</div>
						<div class="styGenericDiv" style="width:78.5mm;height:21mm;border-right:1px solid black;padding-left:1mm;padding-top:0.5mm;">
							Address in country of residence <br/>
							<!-- No reference listed in RLO, and form isn't currently supported stand-alone -->
						</div>
						<div class="styGenericDiv" style="width:78.5mm;height:21mm;padding-left:1mm;padding-top:0.5mm;">
							Address in the United States <br/>
							<!-- No reference listed in RLO, and form isn't currently supported stand-alone -->
						</div>
					</div>
					<div class="styStdDiv" style="border-top:2px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">General Information</div>
					</div>
					<!-- Line 1 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:110.5mm;float:left;">
								Type of U.S. visa (for example, F, J, M, etc.) and date you entered the United States <img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
							</span>
							<span style="width:68mm;border-bottom:1px dashed black;float:left;">
								<xsl:choose>
									<xsl:when test="count($FormData/USImmigrationStatusGrp) &lt; 2">
										<!-- NonImmigrantVisaTypeCd  or  ImmigrantVisaTypeCd  or  USImmigrationStatusDesc 
										    Note that RLO says this is a required choice with requried elements. Optional would have to change to when check -->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatusGrp/child::*[1]"/>
										</xsl:call-template>
										&#160;<span style="width:8px;"/>
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatusGrp/EnteredUSDt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/USImmigrationStatusGrp"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:90.5mm;">Of what country or countries were you a citizen during the tax year?</span>
							<span style="border-bottom:1px dashed black;width:88mm;">
								<xsl:for-each select="$FormData/CitizenCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
					</div>
					<!-- Line 3 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="sty8840DescA" style="width:179mm">
							<span style="width:70.5mm;">What country or countries issued you a passport?</span>
							<span style="border-bottom:1px dashed black;width:108mm;">
								<xsl:choose>
									<xsl:when test="count($FormData/PassportIssuedGrp) &lt; 2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PassportIssuedGrp/CountryCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/PassportIssuedGrp"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Line 4 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:50.5mm;">Enter your passport number(s) <img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
							</span>
							<span style="width:128mm;border-bottom:1px dashed black;">
								<xsl:choose>
									<xsl:when test="count($FormData/PassportIssuedGrp) &lt; 2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PassportIssuedGrp/PassportNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										See additional data table
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Line 5 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:6mm;">5</div>
						<div class="sty8840DescA" style="width:179mm;">
							Enter the number of days you were present in the United States during:<br/>
							2021
							<span style="border-bottom:1px solid black;width:30mm;margin-right:4mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PhysicallyPresUSPYDayCnt"/>
								</xsl:call-template>
							</span>
							2020
							<span style="border-bottom:1px solid black;width:30mm;margin-right:4mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PhysicallyPresUSPYLess1DayCnt"/>
								</xsl:call-template>
							</span>
							2019
							<span style="border-bottom:1px solid black;width:30mm;margin-right:4mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PhysicallyPresUSPYLess2DayCnt"/>
								</xsl:call-template>
							</span>.
						</div>
					</div>
					<!-- Line 6 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="sty8840DescA" style="width:179mm;">
							During 2021, did you apply for, or take other affirmative steps to apply for, lawful permanent resident status in <br/>
							the United States or have an application pending to change your status to that of a lawful permanent resident <br/>
							of the United States? See instructions. <span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">.........................</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesAppLawfulPermanentResident" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS8840AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS8840AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoAppLawfulPermanentResident" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS8840AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS8840AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
						</div>
					</div>
					<!-- Part II -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Closer Connection to One Foreign Country <span style="font-weight:normal;display:inline;">(see instructions)</span>
						</div>
					</div>
					<!-- Line 7 -->
					<div class="styStdDiv" style="margin-top:3mm;">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:56mm;">Where was your tax home during 2021?</span>
							<span style="width:123mm;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateCountry8840">
									<xsl:with-param name="TargetNode" select="$FormData/TaxHomeCountryCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty8840DescA" style="width:179mm;">
							Enter the name of the foreign country to which you had a closer connection than to the United States during 2021. <br/>
							<img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
							<span style="width:174mm;border-bottom:1px dashed black;float:right;">
								<xsl:call-template name="PopulateCountry8840">
									<xsl:with-param name="TargetNode" select="$FormData/CloserConnectionCountryCd"/>
								</xsl:call-template>
							</span>
							<br/>
							<strong>Next,</strong> complete Part IV.
						</div>
					</div>
					<!-- Part III -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Closer Connection to Two Foreign Countries <span style="font-weight:normal;display:inline;">(see instructions)</span>
						</div>
					</div>
					<!-- Line 9 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">9</div>
						<div class="sty8840DescA" style="width:179mm;">
							Where was your tax home on January 1, 2021?
							<span style="width:112mm;border-bottom:1px dashed black;float:right;">
								<xsl:call-template name="PopulateCountry8840">
									<xsl:with-param name="TargetNode" select="$FormData/FirstDayPYTaxHomeCountryCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 10 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">10</div>
						<div class="sty8840DescA" style="width:179mm;">
							After changing your tax home from its location on January 1, 2021, where was your tax home for the remainder of 2021?<br/>
							<span style="width:100%;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateCountry8840">
									<xsl:with-param name="TargetNode" select="$FormData/LocRemainderPYTaxHomeCountryCd"/>
								</xsl:call-template>
							</span>
							<span style="width:100%;border-bottom:1px dashed black;">
							</span>
							<span style="width:100%;border-bottom:1px dashed black;">
							</span>
						</div>
					</div>
					<!-- Line 11 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">11</div>
						<div class="sty8840DescA" style="width:179mm;">
							Did you have a closer connection to each foreign country listed on lines 9 and 10 than to the United States <br/>
							for the period which you maintained a tax home in that foreign country? <span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">...............</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/CloserConnectionFrgnCntryInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesCloserConnectionFrgnCntry" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CloserConnectionFrgnCntryInd"/>
										<xsl:with-param name="BackupName">IRS8840CloserConnectionFrgnCntryInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/CloserConnectionFrgnCntryInd"/>
										<xsl:with-param name="BackupName">IRS8840CloserConnectionFrgnCntryInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoCloserConnectionFrgnCntry" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/CloserConnectionFrgnCntryInd"/>
										<xsl:with-param name="BackupName">IRS8840CloserConnectionFrgnCntryInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/CloserConnectionFrgnCntryInd"/>
										<xsl:with-param name="BackupName">IRS8840CloserConnectionFrgnCntryInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
							<br/>
							If "No," attach an explanation. 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/CloserConnectionFrgnCntryInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty8840DescA" style="width:179mm;">
							Were you subject to tax as a resident under the internal laws of <strong>(a)</strong> either of the countries listed on lines 9 and <br/>
							10 during all of the 2021 or <strong>(b)</strong> both of the countries listed on lines 9 and 10 for the period during which you <br/>
							maintained a tax home in each country? <span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">........................</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/TaxResidentInternalLawCntryInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesTaxResidentInternalLawCntry" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxResidentInternalLawCntryInd"/>
										<xsl:with-param name="BackupName">IRS8840TaxResidentInternalLawCntryInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/TaxResidentInternalLawCntryInd"/>
										<xsl:with-param name="BackupName">IRS8840TaxResidentInternalLawCntryInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoTaxResidentInternalLawCntry" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxResidentInternalLawCntryInd"/>
										<xsl:with-param name="BackupName">IRS8840TaxResidentInternalLawCntryInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/TaxResidentInternalLawCntryInd"/>
										<xsl:with-param name="BackupName">IRS8840TaxResidentInternalLawCntryInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="sty8840DescA" style="width:179mm;">
							Have you filed or will you file tax returns for 2021 in the countries listed on lines 9 and 10? <span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">.........</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/TaxReturnFldTaxHomeCountryInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesTaxReturnFldTaxHomeCountry" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxReturnFldTaxHomeCountryInd"/>
										<xsl:with-param name="BackupName">IRS8840TaxReturnFldTaxHomeCountryInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/TaxReturnFldTaxHomeCountryInd"/>
										<xsl:with-param name="BackupName">IRS8840TaxReturnFldTaxHomeCountryInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoTaxReturnFldTaxHomeCountry" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TaxReturnFldTaxHomeCountryInd"/>
										<xsl:with-param name="BackupName">IRS8840TaxReturnFldTaxHomeCountryInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/TaxReturnFldTaxHomeCountryInd"/>
										<xsl:with-param name="BackupName">IRS8840TaxReturnFldTaxHomeCountryInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
							<br/>
							If "Yes" to either line 12 or line 13, attach verification. 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TaxReturnFldTaxHomeCountryInd"/>
							</xsl:call-template>
							<br/>
							If "No" to either line 12 or line 13, please explain <img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
							<span style="width:113mm;border-bottom:1px dashed black;">&#8194;</span>
							<div class="sty8840DescA" style="width:179mm;border-bottom:1px dashed black;float:right;">
								<span style="width:1px;"/>
							</div>
							<strong>Next, </strong> complete Part IV.
						</div>
					</div>
					<!-- End page and form -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<div style="float:left;font-weight:bold;padding-top:1px;">For Paperwork Reduction Act Notice, see instructions.</div>
						<div style="float:right;">
							Cat. No. 15829P
							<span style="width:36mm;"/>
							Form <span style="font-weight:bold;font-size:8pt;">8840</span> (2021)
						</div>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv">
						Form 8840 (2021)
						<div style="float:right;">Page <strong>2</strong>
						</div>
					</div>
					<!-- Part IV -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Significant Contacts With Foreign Country or Countries in 2021</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv" style="margin-top:3mm;">
						<div class="styLNLeftNumBox">14</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:120.5mm;float:left;">
								Where was your regular or principal permanent home located during 2021? See instructions.
							</span>
							<span style="width:58mm;border-bottom:1px dashed black;float:left;">
								<xsl:call-template name="PopulateCountry8840">
									<xsl:with-param name="TargetNode" select="$FormData/PermanentHomeCountryCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="sty8840DescA" style="width:179mm;">
							If you had more than one permanent home available to you at all times during 2021, list the location of each and <br/>
							<span style="width:16mm;float:left;">explain <img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
							</span>
							<span style="width:162.5mm;border-bottom:1px dashed black;float:left;">
								<xsl:choose>
									<xsl:when test="count($FormData/MultiplePermanentHomeGrp) &lt; 2">
										<xsl:call-template name="PopulateCountry8840">
											<xsl:with-param name="TargetNode" select="$FormData/MultiplePermanentHomeGrp/PermanentHomeCountryCd"/>
										</xsl:call-template>
										<span style="width:15px;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/MultiplePermanentHomeGrp/ShortExplanationTxt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										See additional data table
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:44mm;float:left;">
								Where was your family located?
							</span>
							<span style="width:134.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/FamilyLocationCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
					</div>
					<!-- Line 17 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:53mm;float:left;">
								Where was your automobile(s) located?
							</span>
							<span style="width:125.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/AutomobileLocationCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:57mm;float:left;">
								Where was your automobile(s) registered?
							</span>
							<span style="width:121.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/AutomobileRegdCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
						<div class="sty8840DescA" style="width:179mm;border-bottom:1px dashed black;float:right;">
							<span style="width:1px;"/>
						</div>
					</div>
					<!-- Line 19 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">19</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:81mm;float:left;">
								Where were your personal belongings, furniture, etc., located?
							</span>
							<span style="width:97.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/PersonalBelongingsLocCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
						<div class="sty8840DescA" style="width:179mm;border-bottom:1px dashed black;float:right;">
							<span style="width:1px;"/>
						</div>
					</div>
					<!-- Line 20 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="sty8840DescA" style="width:179mm;">
							Where was the bank(s) with which you conducted your routine personal banking activites located?
						</div>
					</div>
					<xsl:variable name="PBALCct" select="count($FormData/PrsnlBankingActyLocCountryCd)"/>
					<xsl:for-each select="$FormData/PrsnlBankingActyLocCountryCd[(position() mod 2) = 1]">
						<xsl:variable name="pos" select="position()"/>
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">
								<xsl:number format="a" value="$pos"/>
							</div>
							<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">
								<xsl:call-template name="PopulateCountry8840">
									<xsl:with-param name="TargetNode" select="$FormData/PrsnlBankingActyLocCountryCd[$pos]"/>
								</xsl:call-template>
							</div>
							<xsl:choose>
								<xsl:when test="($PBALCct=1) or ($PBALCct=2)">
									<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">c</div>
									<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">&#8194;</div>
								</xsl:when>
								<xsl:when test="(($PBALCct mod 2) = 0) and ($PBALCct!=2)">
									<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">
										<xsl:number format="a" value="($PBALCct div 2) + $pos"/>
									</div>
									<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">
										<xsl:call-template name="PopulateCountry8840">
											<xsl:with-param name="TargetNode" select="$FormData/PrsnlBankingActyLocCountryCd[($PBALCct div 2) + $pos]"/>
										</xsl:call-template>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">
										<xsl:number format="a" value="($PBALCct div 2) + $pos"/>
									</div>
									<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">
										<xsl:call-template name="PopulateCountry8840">
											<xsl:with-param name="TargetNode" select="$FormData/PrsnlBankingActyLocCountryCd[floor(($PBALCct div 2)) + $pos + 1]"/>
										</xsl:call-template>
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</xsl:for-each>
					<xsl:if test="$PBALCct=2">
						<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">
							<xsl:number format="a" value="$PBALCct"/>
						</div>
						<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">
							<xsl:call-template name="PopulateCountry8840">
								<xsl:with-param name="TargetNode" select="$FormData/PrsnlBankingActyLocCountryCd[$PBALCct]"/>
							</xsl:call-template>
						</div>
						<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">d</div>
						<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">&#8194;</div>
					</xsl:if>
					<xsl:if test="$PBALCct &lt; 1">
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">a</div>
							<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">&#8194;</div>
							<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">c</div>
							<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">&#8194;</div>
						</div>
					</xsl:if>
					<xsl:if test="($PBALCct &lt; 3) and ($PBALCct!=2)">
						<div class="styStdDiv">
							<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">b</div>
							<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">&#8194;</div>
							<div class="styLNLeftLtrBox" style="padding-left:4.5mm;">d</div>
							<div style="width:85mm;border-bottom:1px solid black;text-align:center;float:left;">&#8194;</div>
						</div>
					</xsl:if>
					<!-- Line 21 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="sty8840DescA" style="width:179mm;">
							Did you conduct business activities in a location other than your tax home? <span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">..............</span>
							<span style="height:3mm;"> </span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/BusActyLocOthThanTaxHomeInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesBusActyLocOthThanTaxHome" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusActyLocOthThanTaxHomeInd"/>
										<xsl:with-param name="BackupName">IRS8840/BusActyLocOthThanTaxHomeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/BusActyLocOthThanTaxHomeInd"/>
										<xsl:with-param name="BackupName">IRS8840/BusActyLocOthThanTaxHomeInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoBusActyLocOthThanTaxHome" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/BusActyLocOthThanTaxHomeInd"/>
										<xsl:with-param name="BackupName">IRS8840/BusActyLocOthThanTaxHomeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/BusActyLocOthThanTaxHomeInd"/>
										<xsl:with-param name="BackupName">IRS8840/BusActyLocOthThanTaxHomeInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
							<br/>
							If "Yes," where? 
							<span style="width:156mm;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateCountry8840">
									<xsl:with-param name="TargetNode" select="$FormData/BusActyLocOthThanTxHmCountryCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 22a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">22a</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:53mm;float:left;">
								Where was your driver's license issued?
							</span>
							<span style="width:125.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/DriversLicenseIssdCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
					</div>
					<!-- Line 22b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.5mm;">b</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:80mm;float:left;">
								If you hold a second driver's license, where was it issued?
							</span>
							<span style="width:98.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/SndDriversLicenseIssdCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
						<div class="sty8840DescA" style="width:179mm;border-bottom:1px dashed black;float:right;">
							<span style="width:1px;"/>
						</div>
					</div>
					<!-- Line 23 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">23</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:48mm;float:left;">
								Where were you registered to vote?
							</span>
							<span style="width:130.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/RegisteredToVoteCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
					</div>
					<!-- Line 24 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">24</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:120mm;float:left;">
								When completing offical documents, forms, etc., what country do you list as your residence?
							</span>
							<span style="width:58.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/ForeignTaxResidenceCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
					</div>
					<!-- Line 25 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">25</div>
						<div class="sty8840DescA" style="width:179mm;">
							Have you ever completed:
						</div>
					</div>
					<!-- Line 25a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.5mm;">a</div>
						<div class="sty8840DescA" style="width:179mm;">
							Form W-8BEN or any other W-8 form (relating to foreign status)? <span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">.................</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/FormW8BENOrOtherW8CompletedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesFormW8BENOrOtherW8Completed" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FormW8BENOrOtherW8CompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/FormW8BENOrOtherW8CompletedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/FormW8BENOrOtherW8CompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/FormW8BENOrOtherW8CompletedInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoFormW8BENOrOtherW8Completed" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FormW8BENOrOtherW8CompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/FormW8BENOrOtherW8CompletedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/FormW8BENOrOtherW8CompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/FormW8BENOrOtherW8CompletedInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
						</div>
					</div>
					<!-- Line 25b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.5mm;">b</div>
						<div class="sty8840DescA" style="width:179mm;">
							Form W-9, Request for Taxpayer Identification Number and Certification? 
							<span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">...............</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/FormW9CompletedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesFormW9Completed" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FormW9CompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/FormW9CompletedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/FormW9CompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/FormW9CompletedInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoFormW9Completed" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FormW9CompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/FormW9CompletedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/FormW9CompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/FormW9CompletedInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
						</div>
					</div>
					<!-- Line 25c -->
					<!-- Line 25c -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.5mm;">c</div>
						<div class="sty8840DescA" style="width:179mm;">
							Any other U.S. official forms? If "Yes," indicate the form(s) <img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
							<span style="border-bottom:1px dashed black;width:75mm;margin-left:1mm;">
								<span style="width:1px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/OthUSOfficialFormCompletedInd"/>
								</xsl:call-template>
							</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/OthUSOfficialFormCompletedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesOthUSOfficialFormCompleted" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OthUSOfficialFormCompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/OthUSOfficialFormCompletedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/OthUSOfficialFormCompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/OthUSOfficialFormCompletedInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoOthUSOfficialFormCompleted" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/OthUSOfficialFormCompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/OthUSOfficialFormCompletedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/OthUSOfficialFormCompletedInd"/>
										<xsl:with-param name="BackupName">IRS8840/OthUSOfficialFormCompletedInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
						</div>
					</div>
					<!-- Line 26 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">26</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:113.5mm;float:left;">
								In what country or countries did you keep your personal, financial, and legal documents?
							</span>
							<span style="width:65mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/DocumentLocationCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
							<br/>
							<span style="width:99.7%;border-bottom:1px dashed black;">&#8194;</span>
						</div>
					</div>
					<!-- Line 27 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">27</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:104mm;float:left;">
								From what country or countries did you derive the majority of your 2021 income?
							</span>
							<span style="width:74.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/MajorityIncomeDerivedCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
							<br/>
							<span style="width:99.7%;border-bottom:1px dashed black;">&#8194;</span>
						</div>
					</div>
					<!-- Line 28 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">28</div>
						<div class="sty8840DescA" style="width:179mm;">
							Did you have any income from U.S. sources? 
							<span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">.......................</span>
							<span style="height:3mm;"> </span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeFromUSSourceInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesIncomeFromUSSource" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeFromUSSourceInd"/>
										<xsl:with-param name="BackupName">IRS8840/IncomeFromUSSourceInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeFromUSSourceInd"/>
										<xsl:with-param name="BackupName">IRS8840/IncomeFromUSSourceInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoIncomeFromUSSource" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeFromUSSourceInd"/>
										<xsl:with-param name="BackupName">IRS8840/IncomeFromUSSourceInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeFromUSSourceInd"/>
										<xsl:with-param name="BackupName">IRS8840/IncomeFromUSSourceInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
							<br/>
							If "Yes," what type? 
							<span style="width:153mm;border-bottom:1px dashed black;">
								<span style="width:1px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeFromUSSourceInd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 29 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">29</div>
						<div class="sty8840DescA" style="width:179mm;">
							<span style="width:101mm;float:left;">
								In what country or countries were your investments located? See instructions.
							</span>
							<span style="width:77.5mm;border-bottom:1px dashed black;float:left;">
								<span style="width:1px;"/>
								<xsl:for-each select="$FormData/InvestmentLocationCountryCd">
									<xsl:call-template name="PopulateCountry8840">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
							<br/>
							<span style="width:99.7%;border-bottom:1px dashed black;">&#8194;</span>
						</div>
					</div>
					<!-- Line 30 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">30</div>
						<div class="sty8840DescA" style="width:179mm;">
							Did you qualify for any type of "national" health plan sponsored by a foreign government?
							<span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">..........</span>
							<span style="height:3mm;"> </span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyFrgnNationalHealthPlanInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="YesQlfyFrgnNationalHealthPlan" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyFrgnNationalHealthPlanInd"/>
										<xsl:with-param name="BackupName">IRS8840/QlfyFrgnNationalHealthPlanInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyFrgnNationalHealthPlanInd"/>
										<xsl:with-param name="BackupName">IRS8840/QlfyFrgnNationalHealthPlanInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" alt="NoQlfyFrgnNationalHealthPlan" class="styCkboxNM" style="">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyFrgnNationalHealthPlanInd"/>
										<xsl:with-param name="BackupName">IRS8840/QlfyFrgnNationalHealthPlanInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/QlfyFrgnNationalHealthPlanInd"/>
										<xsl:with-param name="BackupName">IRS8840/QlfyFrgnNationalHealthPlanInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
							<br/>
							If "Yes," in what country? 
							<span style="width:146mm;border-bottom:1px dashed black;min-height:3mm;">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/QlfyFrgnNationalHealthPlanInd"/>
								</xsl:call-template>
							</span>
							<br/>
							If "No," please explain <img src="{$ImagePath}/1040SchB_Bullet.gif" alt="Bullet Image"/>
							<span style="width:147mm;border-bottom:1px dashed black;min-height:3mm;"> </span>
							<br/>
							If you have any other information to substantiate your closer connection to a country other than the United States or you wish 
							to explain in more detail any of your responses to lines 14 through 30, attach a statement to this form.
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="width:18mm;height:25mm;border-right:1px solid black;font-weight:bold;float:left;">
							Sign here only if you are filing this form by itself and not with your U.S. tax return
						</div>
						<div style="width:169mm;height:25mm;padding-left:1mm;">
							Under penalties of perjury, I declare that I have examined this form and the accompanying attachments, 
							and to the best of my knowledge and belief, they are true, correct, and complete.<br/>
							<br/>
							<br/>
							<br/>
							<span style="float:left;height:7mm;width:8mm;padding-left:2mm;text-align:right;">
								<img alt="Arrow image" src="{$ImagePath}/8840_Bullet_Lg.gif"/>
							</span>
							<span style="float:left;height:7mm;width:107.5mm;">
								<span style="width:100%;height:3.5mm;border-bottom:1px solid black;"/>
								<span style="width:100%;height:3.5mm;text-align:center;">Your signature</span>
							</span>
							<span style="float:left;height:7mm;width:8mm;padding-left:2mm;text-align:right;">
								<img alt="Arrow image" src="{$ImagePath}/8840_Bullet_Lg.gif"/>
							</span>
							<span style="float:left;height:7mm;width:44mm;">
								<span style="width:100%;height:3.5mm;border-bottom:1px solid black;"/>
								<span style="width:100%;height:3.5mm;text-align:center;">Date</span>
							</span>
						</div>
					</div>
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;text-align:right;">
						Form <span style="font-weight:bold;font-size:8pt;">8840</span> (2021)
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
					<xsl:if test="count($FormData/USImmigrationStatusGrp) &gt;= 2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1 - US Immigration Status</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Type of U.S. Visa</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Date entered U.S.</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/USImmigrationStatusGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;text-align:left;">
											<div style="width:6.5mm;font-weight:bold;text-align:center;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:choose>
												<xsl:when test="NonImmigrantVisaTypeCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NonImmigrantVisaTypeCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ImmigrantVisaTypeCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ImmigrantVisaTypeCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USImmigrationStatusDesc"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellText" style="width:91.5mm;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="EnteredUSDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="count($FormData/PassportIssuedGrp) &gt;= 2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Lines 3 &amp; 4 - Passports Issued</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Issuing Country Code</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Passport Number</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/PassportIssuedGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;text-align:center;">
											<div style="width:6.5mm;font-weight:bold;text-align:center;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateCountry8840">
												<xsl:with-param name="TargetNode" select="CountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:91.5mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="PassportNum"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="count($FormData/MultiplePermanentHomeGrp) &gt;= 2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 15 - Multiple Permanent Homes</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:31.5mm;">Permanent Home Country Code</th>
									<th class="styDepTblCell" scope="col" style="width:151.5mm;">Explanation</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/MultiplePermanentHomeGrp">
									<tr style="border-color:black;height:6mm;vertical-align:top;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:31.5mm;text-align:center;">
											<div style="width:6.5mm;font-weight:bold;text-align:center;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateCountry8840">
												<xsl:with-param name="TargetNode" select="PermanentHomeCountryCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:151.5mm;text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShortExplanationTxt"/>
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
	<xsl:template name="PopulateCountry8840">
		<xsl:param name="TargetNode" select="/.."/>
		<xsl:variable name="fullName" select="$countryNameDoc/country[@id=$TargetNode]"/>
		<xsl:choose>
			<xsl:when test="$fullName">
				<abbr>
					<xsl:attribute name="title"><xsl:value-of select="$fullName"/></xsl:attribute>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$TargetNode"/>
					</xsl:call-template>
				</abbr>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$TargetNode"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
