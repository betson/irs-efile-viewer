<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8843Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8843"/>
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
				<meta name="Description" content="IRS Form 8843"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8843Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form id="Form8840">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styStdDiv" style="border-bottom:2px solid black;display:inline-block;">
						<div class="styFNBox" style="width:28mm;height:23mm;">
							Form <span class="styFN" style="display:inline;">8843</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<br/>
							<br/>
							<br/>
							<span class="styAgency" style="display:inline;">Department of the Treasury <br/>Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:131mm;height:23mm;">
							<span class="styFST" style="font-size:10pt;">Statement for Exempt Individuals and Individuals <br/> With a Medical Condition</span>
							<br/>
							<span class="styFBT" style="margin-top:0px;margin-bottom:2mm;">
								For use by alien individuals only. <br/>
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/> Go to  <em>www.irs.gov/Form8843</em> for the latest information.
							</span>
							<br/>
							<span>
								For the year January 1 &#8212; December 31, 2021, or other tax year<br/>beginning 
								<span style="min-width:22mm;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodBeginDt"/>
									</xsl:call-template>
								</span>
								and ending 
								<span style="min-width:22mm;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodEndDt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
						<div class="styTYBox" style="width:28mm;height:23mm;">
							<div class="styOMB">OMB No. 1545-0074</div>
							<div class="styTaxYear" style="width:100%;">20<span class="styTYColor" style="display:inline;">21</span>
							</div>
							<div style="width:100%;">
								<span class="stySequence" style="padding-left:1.5mm;">Attachment<br/>Sequence No.</span>
								<span style="font-weight:bold;font-size:8pt;padding-left:2px;">102</span>
							</div>
						</div>
					</div>
					<!-- Begin Form -->
					<div class="styStdDiv">
						<div class="styNameBox" style="width:100mm;height:6mm;border-right-width:0px;">
							Your first name and initial<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
							</xsl:call-template>
						</div>
						<div class="styNameBox" style="width:27mm;height:6mm;padding-left:0.5mm;">
							Last name<br/> &#8194;
						</div>
						<div class="styEINBox" style="width:60mm;height:6mm;font-weight:normal;padding-left:0.5mm;">
							Your U.S. taxpayer identification number, if any<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
							</xsl:call-template>
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div class="styGenericDiv" style="width:30mm;height:21mm;font-weight:bold;font-size:8pt;border-right:1px solid black;">
							Fill in your <br/>
							addresses only if <br/>
							you are filing this <br/>
							form by itself and <br/>
							not with your tax<br/>
							return
						</div>
						<div class="styGenericDiv" style="width:78.5mm;height:21mm;border-right:1px solid black;padding-left:1mm;padding-top:1mm;">
							Address in country of residence <br/>
							<!-- No reference listed in RLO, and form isn't currently supported stand-alone -->
						</div>
						<div class="styGenericDiv" style="width:78.5mm;height:21mm;padding-left:1mm;padding-top:1mm;">
							Address in the United States <br/>
							<!-- No reference listed in RLO, and form isn't currently supported stand-alone -->
						</div>
					</div>
					<div class="styStdDiv" style="border-top:1px solid black;border-bottom:1px solid black;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">General Information</div>
					</div>
					<!-- Line 1a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">1a</div>
						<div class="sty8843DescA" style="width:179mm;">
							<span style="width:114.5mm;float:left;">
								Type of U.S. visa (for example, F, J, M, Q, etc.) and date you entered the United States <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
							</span>
							<span style="width:64mm;border-bottom:1px dashed black;float:left;">
								<xsl:choose>
									<xsl:when test="$FormData/Form1040NRInformationCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/Form1040NRInformationCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="count($FormData/ExmptIndivOrMedicalGenInfoGrp/USImmigrationStatusGrp) &lt; 2">
										<!-- NonImmigrantVisaTypeCd  or  ImmigrantVisaTypeCd  or  USImmigrationStatusDesc 
										    Note that RLO says this is a required choice with requried elements. Optional would have to change to when check -->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/USImmigrationStatusGrp/child::*[1]"/>
										</xsl:call-template>
										<span style="width:12px;"/>
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/USImmigrationStatusGrp/EnteredUSDt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/USImmigrationStatusGrp"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Line 1b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty8843DescA" style="width:179mm;">
							<span style="width:157mm;float:left;">
								Current nonimmigrant status. If your status has changed, also enter date of change and previous status. See instructions <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
							</span>
							<span style="width:22mm;border-bottom:1px dashed black;float:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/NonimmigrantStatusGrp/VisaChangeDesc"/>
								</xsl:call-template>
								<span style="width:12px;"/>
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/NonimmigrantStatusGrp/VisaChangeDt"/>
								</xsl:call-template>
							</span>
							<br/>
							<span style="width:100%;height:3mm;border-bottom:1px dashed black;"/>
						</div>
					</div>
					<!-- Line 2 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">2</div>
						<div class="sty8843DescA" style="width:179mm;">
							<span style="width:86mm;">Of what country or countries were you a citizen during the tax year?</span>
							<span style="border-bottom:1px dashed black;width:92mm;">
								<xsl:for-each select="$FormData/ExmptIndivOrMedicalGenInfoGrp/CitizenCountryCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
									<span style="width:12px;"/>
								</xsl:for-each>
							</span>
						</div>
					</div>
					<!-- Line 3a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">3a</div>
						<div class="sty8843DescA" style="width:179mm">
							<span style="width:63mm;">What country or countries issued you a passport?</span>
							<span style="border-bottom:1px dashed black;width:115mm;">
								<xsl:choose>
									<xsl:when test="count($FormData/ExmptIndivOrMedicalGenInfoGrp/PassportIssuedGrp) &lt; 2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/PassportIssuedGrp/CountryCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/PassportIssuedGrp"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Line 3b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty8843DescA" style="width:179mm;">
							<span style="width:45mm;">Enter your passport number(s) <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> </span>
							<span style="width:132.5mm;border-bottom:1px dashed black;">
								<xsl:choose>
									<xsl:when test="count($FormData/ExmptIndivOrMedicalGenInfoGrp/PassportIssuedGrp) &lt; 2">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/PassportIssuedGrp/PassportNum"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										See additional data table
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!-- Line 4a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="height:6mm;">4a</div>
						<div class="sty8843DescA" style="width:179mm;">
							Enter the actual number of days you were present in the United States during:<br/>
							2021
							<span style="border-bottom:1px solid black;width:30mm;margin-right:4mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/PhysicallyPresUSPYDayCnt"/>
								</xsl:call-template>
							</span>
							2020
							<span style="border-bottom:1px solid black;width:30mm;margin-right:4mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/PhysicallyPresUSPYLess1DayCnt"/>
								</xsl:call-template>
							</span>
							2019
							<span style="border-bottom:1px solid black;width:30mm;margin-right:4mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/PhysicallyPresUSPYLess2DayCnt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 4b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD" style="padding-left:4.2mm;">b</div>
						<div class="sty8843DescA" style="width:179mm;">
							<span style="width:138.5mm;float:left;">
								Enter the number of days in 2021 you claim you can exclude for purposes of the substantial presence test <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/>  
							</span>
							<span style="width:40mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/ExmptIndivOrMedicalGenInfoGrp/SubstPresenceTestExclDaysCnt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Part II -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">Teachers and Trainees</div>
					</div>
					<xsl:for-each select="$FormData/TeacherOrTraineeExemptIndivGrp">
						<!-- Line 5 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="sty8843DescA" style="width:179mm;">
								<span style="width:158.5mm;float:left;">
									For teachers, enter the name, address, and telephone number of the academic institution where you taught in 2021 <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
								</span>
								<span style="width:20mm;height:3mm;border-bottom:1px dashed black;"/>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/InstitutionName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="AcademicInstitutionDetail/InstitutionName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/InstitutionName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail//AddressLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:if test="AcademicInstitutionDetail//AddressLine2Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail//AddressLine2Txt"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/USAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="AcademicInstitutionDetail/ForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="AcademicInstitutionDetail/ForeignAddress">
										<span style="width:4mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="AcademicInstitutionDetail/ForeignPhoneNum">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/ForeignPhoneNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="AcademicInstitutionDetail/PhoneNum">
											<br/>
											<xsl:call-template name="PopulatePhoneNumber">
												<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/PhoneNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- Line 6 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="sty8843DescA" style="width:179mm;">
								For trainees, enter the name, address, and telephone number of the director of the academic or other specialized program <br/>
								<span style="width:48.5mm;float:left;">
									you participated in during 2021 <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
								</span>
								<span style="width:130mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/PersonNm"/>
									</xsl:call-template>
								</span>
								<span style="width:180mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/PersonNm"/>
									</xsl:call-template>
								</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail//AddressLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:if test="AcademicOrSpclProgDirDetail//AddressLine2Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail//AddressLine2Txt"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/USAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="AcademicOrSpclProgDirDetail/ForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="AcademicOrSpclProgDirDetail/ForeignAddress">
										<span style="width:4mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="AcademicOrSpclProgDirDetail/ForeignPhoneNum">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/ForeignPhoneNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="AcademicOrSpclProgDirDetail/PhoneNum">
											<br/>
											<xsl:call-template name="PopulatePhoneNumber">
												<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/PhoneNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- Line 7 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="height:6mm;">7</div>
							<div class="sty8843DescA" style="width:179mm;">
								Enter the type of U.S. visa (J or Q) you held during <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
								<span style="width:5.1mm;"/>
								2015
								<span style="border-bottom:1px solid black;width:14mm;margin-right:3.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess6TeacherVisaGrp/TeacherOrTraineeVisaTypeCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess6TeacherVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 6 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								2016
								<span style="border-bottom:1px solid black;width:13mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess5TeacherVisaGrp/TeacherOrTraineeVisaTypeCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess5TeacherVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 5 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								2017
								<span style="border-bottom:1px solid black;width:12mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess4TeacherVisaGrp/TeacherOrTraineeVisaTypeCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess4TeacherVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 4 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								2018
								<span style="border-bottom:1px solid black;width:12mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess3TeacherVisaGrp/TeacherOrTraineeVisaTypeCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess3TeacherVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 3 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								2019
								<span style="border-bottom:1px solid black;width:12mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess2TeacherVisaGrp/TeacherOrTraineeVisaTypeCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess2TeacherVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 2 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								2020
								<span style="border-bottom:1px solid black;width:14.5mm;margin-right:3mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess1TeacherVisaGrp/TeacherOrTraineeVisaTypeCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess1TeacherVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 1 year prior</xsl:with-param>
									</xsl:call-template>
								</span>
								If the type of visa you held during any of these years changed, attach a statement showing the new visa type and the date it was acquired.
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/TeacherOrTraineeExemptIndivGrp) = 0">
						<!-- Line 5 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">5</div>
							<div class="sty8843DescA" style="width:179mm;">
								<span style="width:158.5mm;float:left;">
									For teachers, enter the name, address, and telephone number of the academic institution where you taught in 2021 <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
								</span>
								<span style="width:20mm;height:3mm;border-bottom:1px dashed black;"/>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
							</div>
						</div>
						<!-- Line 6 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">6</div>
							<div class="sty8843DescA" style="width:179mm;">
								For trainees, enter the name, address, and telephone number of the director of the academic or other specialized program <br/>
								<span style="width:48.5mm;float:left;">
									you participated in during 2021 <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/>  
								</span>
								<span style="width:130mm;border-bottom:1px dashed black;">&#8194;</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
							</div>
						</div>
						<!-- Line 7 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD" style="height:6mm;">7</div>
							<div class="sty8843DescA" style="width:179mm;">
								Enter the type of U.S. visa (J or Q) you held during <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
								<span style="width:6.3mm;"/>
								2015
								<span style="border-bottom:1px solid black;width:25mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								2016
								<span style="border-bottom:1px solid black;width:25mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								<br/>
								2017
								<span style="border-bottom:1px solid black;width:10mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								2018
								<span style="border-bottom:1px solid black;width:10mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								2019
								<span style="border-bottom:1px solid black;width:10mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								2020
								<span style="border-bottom:1px solid black;width:10mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								<br/>
								If the type of visa you held during any of these years changed, attach a statement showing the new visa type and the date it was acquired.
							</div>
						</div>
					</xsl:if>
					<!-- Line 8 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="sty8843DescA" style="width:179mm;">
							Were you present in the United States as a teacher, trainee, or student for any part of 2 of the 6 prior <br/>
							calendar years (2015 through 2020)? <span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">.........................</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdnt2of6PrCYInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="" alt="Teacher Trainee Stdnt 2 of 6 Pr CY Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdnt2of6PrCYInd"/>
										<xsl:with-param name="BackupName">IRS8843TeacherTraineeStdnt2of6PrCYInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdnt2of6PrCYInd"/>
										<xsl:with-param name="BackupName">IRS8843TeacherTraineeStdnt2of6PrCYInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" class="styCkboxNM" style="" alt="Teacher Trainee Stdnt 2 of 6 Pr CY Ind No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdnt2of6PrCYInd"/>
										<xsl:with-param name="BackupName">IRS8843TeacherTraineeStdnt2of6PrCYInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdnt2of6PrCYInd"/>
										<xsl:with-param name="BackupName">IRS8843TeacherTraineeStdnt2of6PrCYInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
							<br/>
							If you checked the "Yes" box on line 8, you cannot exclude days of presence as a teacher or trainee unless you meet the <span style="font-style:italic;display:inline;">Exception</span> explained in the instructions. 
						</div>
					</div>
					<!-- Part III -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:1px solid black;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">Students</div>
					</div>
					<xsl:for-each select="$FormData/StudentExemptIndivGrp">
						<!-- Line 9 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="sty8843DescA" style="width:179mm;">
								<span style="width:133mm;float:left;">
									Enter the name, address, and telephone number of the academic institution you attended during 2021 <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
								</span>
								<span style="width:46mm;height:3mm;border-bottom:1px dashed black;"/>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/InstitutionName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="AcademicInstitutionDetail/InstitutionName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/InstitutionName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail//AddressLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:if test="AcademicInstitutionDetail//AddressLine2Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail//AddressLine2Txt"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/USAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="AcademicInstitutionDetail/ForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="AcademicInstitutionDetail/ForeignAddress">
										<span style="width:4mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="AcademicInstitutionDetail/ForeignPhoneNum">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/ForeignPhoneNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="AcademicInstitutionDetail/PhoneNum">
											<br/>
											<xsl:call-template name="PopulatePhoneNumber">
												<xsl:with-param name="TargetNode" select="AcademicInstitutionDetail/PhoneNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- Line 10 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">10</div>
							<div class="sty8843DescA" style="width:179mm;">
								Enter the name, address, and telephone number of the director of the academic or other specialized program you participated<br/>
								<span style="width:23mm;float:left;">
									 in during 2021 <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
								</span>
								<span style="width:156mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/PersonNm"/>
									</xsl:call-template>
								</span>
								<span style="width:180mm;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/PersonNm"/>
									</xsl:call-template>
								</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail//AddressLine1Txt"/>
									</xsl:call-template>
									<br/>
									<xsl:if test="AcademicOrSpclProgDirDetail//AddressLine2Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail//AddressLine2Txt"/>
										</xsl:call-template>
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateCityStateInfo">
										<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/USAddress"/>
										<xsl:with-param name="ForeignAddressTargetNode" select="AcademicOrSpclProgDirDetail/ForeignAddress"/>
									</xsl:call-template>
									<xsl:if test="AcademicOrSpclProgDirDetail/ForeignAddress">
										<span style="width:4mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:choose>
										<xsl:when test="AcademicOrSpclProgDirDetail/ForeignPhoneNum">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/ForeignPhoneNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="AcademicOrSpclProgDirDetail/PhoneNum">
											<br/>
											<xsl:call-template name="PopulatePhoneNumber">
												<xsl:with-param name="TargetNode" select="AcademicOrSpclProgDirDetail/PhoneNum"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</span>
							</div>
						</div>
						<!-- Line 11 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox" style="height:6mm;">11</div>
							<div class="sty8843DescA" style="width:179mm;">
								Enter the type of U.S. visa (F, J, M, or Q) you held during <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/>  
								<span style="width:2.9mm;"/>
								2015
								<span style="border-bottom:1px solid black;width:14mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess6StudentVisaGrp/StudentTypeVisaCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess6StudentVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 6 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								2016
								<span style="border-bottom:1px solid black;width:14mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess5StudentVisaGrp/StudentTypeVisaCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess5StudentVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 5 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								2017
								<span style="border-bottom:1px solid black;width:14mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess4StudentVisaGrp/StudentTypeVisaCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess4StudentVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 4 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								2018
								<span style="border-bottom:1px solid black;width:14mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess3StudentVisaGrp/StudentTypeVisaCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess3StudentVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 3 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								2019
								<span style="border-bottom:1px solid black;width:14mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess2StudentVisaGrp/StudentTypeVisaCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess2StudentVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 2 years prior</xsl:with-param>
									</xsl:call-template>
								</span>
								2020
								<span style="border-bottom:1px solid black;width:14mm;margin-right:4.5mm;text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="CurrTYLess1StudentVisaGrp/StudentTypeVisaCd"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="TargetNode" select="CurrTYLess1StudentVisaGrp/VisaTypeChangeGrp"/>
										<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 1 year prior</xsl:with-param>
									</xsl:call-template>
								</span>
								If the type of visa you held during any of these years changed, attach a statement showing the new visa type and the date it was acquired.
							</div>
						</div>
					</xsl:for-each>
					<xsl:if test="count($FormData/StudentExemptIndivGrp) = 0">
						<!-- Line 9 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBoxSD">9</div>
							<div class="sty8843DescA" style="width:179mm;">
								<span style="width:133mm;float:left;">
									Enter the name, address, and telephone number of the academic institution you attended during 2021 <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
								</span>
								<span style="width:46mm;height:3mm;border-bottom:1px dashed black;"/>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
							</div>
						</div>
						<!-- Line 10 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox">10</div>
							<div class="sty8843DescA" style="width:179mm;">
								Enter the name, address, and telephone number of the director of the academic or other specialized program you participated<br/>
								<span style="width:23mm;float:left;">
									 in during 2021 <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/>
								</span>
								<span style="width:156mm;border-bottom:1px dashed black;">&#8194;</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
							</div>
						</div>
						<!-- Line 11 -->
						<div class="styStdDiv">
							<div class="styLNLeftNumBox" style="height:6mm;">11</div>
							<div class="sty8843DescA" style="width:179mm;">
								Enter the type of U.S. visa (F, J, M, or Q) you held during <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
								<span style="width:6.3mm;"/>
								2015
								<span style="border-bottom:1px solid black;width:25mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								2016
								<span style="border-bottom:1px solid black;width:25mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								<br/>
								2017
								<span style="border-bottom:1px solid black;width:25mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								2018
								<span style="border-bottom:1px solid black;width:25mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								2019
								<span style="border-bottom:1px solid black;width:25mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								2020
								<span style="border-bottom:1px solid black;width:25mm;margin-right:4.5mm;text-align:center;">&#8194;</span>
								<br/>
								If the type of visa you held during any of these years changed, attach a statement showing the new visa type and the date it was acquired.
							</div>
						</div>
					</xsl:if>
					<!-- Line 12 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">12</div>
						<div class="sty8843DescA" style="width:179mm;">
							Were you present in the United States as a teacher, trainee, or student for any part of more than 5 calendar <br/>
							years? 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdntGrtr5CYInd"/>
							</xsl:call-template>
							<span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">.................................</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdntGrtr5CYInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="" alt="Teacher Trainee Stdnt Grtr 5 CY Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdntGrtr5CYInd"/>
										<xsl:with-param name="BackupName">IRS8843TeacherTraineeStdntGrtr5CYInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdntGrtr5CYInd"/>
										<xsl:with-param name="BackupName">IRS8843TeacherTraineeStdntGrtr5CYInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" class="styCkboxNM" style="" alt="Teacher Trainee Stdnt Grtr 5 CY Ind No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdntGrtr5CYInd"/>
										<xsl:with-param name="BackupName">IRS8843TeacherTraineeStdntGrtr5CYInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/TeacherTraineeStdntGrtr5CYInd"/>
										<xsl:with-param name="BackupName">IRS8843TeacherTraineeStdntGrtr5CYInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
							<br/>
							If you checked the "Yes" box on line 12, you must provide sufficient facts on an attached statement to establish that you do not intend to reside permanently in the United States. 
						</div>
					</div>
					<!-- Line 13 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">13</div>
						<div class="sty8843DescA" style="width:179mm;">
							During 2021, did you apply for, or take other affirmative steps to apply for, lawful permanent resident status <br/>
							in the United States or have an application pending to change your status to that of a lawful permanent <br/>
							resident of the United States? <span style="letter-spacing:3.3mm;font-weight:bold;padding-left:8px;">...........................</span>
							<span style="float:right;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
								</xsl:call-template>
								<input type="checkbox" class="styCkboxNM" style="" alt="App Lawful Permanent Resident Ind Yes">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS8843AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS8843AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<input type="checkbox" class="styCkboxNM" style="" alt="App Lawful Permanent Resident Ind No">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS8843AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label style="font-weight:bold;margin-right:8px;">
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResidentInd"/>
										<xsl:with-param name="BackupName">IRS8843AppLawfulPermanentResidentInd</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</span>
						</div>
					</div>
					<!-- Line 14 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">14</div>
						<div class="sty8843DescA" style="width:179mm;">
							<span style="width:70.5mm;float:left;">
								If you checked the "Yes" box on line 13, explain <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
							</span>
							<span style="width:108mm;border-bottom:1px dashed black;float:left;">
								<xsl:choose>
									<xsl:when test="count($FormData/AppLawfulPermanentResExplnTxt) &gt; 1">
										See additional data
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AppLawfulPermanentResExplnTxt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
							<br/>
							<span style="width:100%;height:3mm;border-bottom:1px dashed black;"/>
							<br/>
							<br/>
						</div>
					</div>
					<!-- End page -->
					<div class="styStdDiv pageEnd" style="border-top:2px solid black;">
						<div style="float:left;font-weight:bold;padding-top:1px;">For Paperwork Reduction Act Notice, see instructions.</div>
						<div style="float:right;">
							Cat. No. 17227H
							<span style="width:36mm;"/>
							Form <span style="font-weight:bold;font-size:8pt;">8843</span> (2021)
						</div>
					</div>
					<!-- Page 2 -->
					<div class="styStdDiv">
						Form 8843 (2021)
						<div style="float:right;">Page <strong>2</strong>
						</div>
					</div>
					<!-- Part IV -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">Professional Athletes</div>
					</div>
					<!-- Line 15 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">15</div>
						<div class="sty8843DescA" style="width:179mm;">
							Enter the name of the charitable sports event(s) in the United States in which you competed during 2021 and the dates of <br/>
							<span style="width:20.5mm;float:left;">
								competition <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/>
							</span>
							<span style="width:158mm;height:3mm;border-bottom:1px dashed black;"/>
							<br/>
							<xsl:if test="$FormData/USChrtblSportEvtCompetitionGrp">
								<xsl:for-each select="$FormData/USChrtblSportEvtCompetitionGrp">
									<span style="width:100%;border-bottom:1px dashed black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="EventNameTxt"/>
										</xsl:call-template>
										<span style="float:right;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="CharitableEventDt"/>
											</xsl:call-template>
										</span>
									</span>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="(count($FormData/USChrtblSportEvtCompetitionGrp)) &lt; 1">
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
							</xsl:if>
						</div>
					</div>
					<!-- Line 16 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">16</div>
						<div class="sty8843DescA" style="width:179mm;">
							Enter the name(s) and employer identification number(s) of the charitable organization(s) that benefited from the sports <br/>
							<span style="width:18.5mm;float:left;">
								event(s) <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/>
							</span>
							<span style="width:160mm;border-bottom:1px dashed black;"/>
							<xsl:if test="$FormData/SportEvtBnftCharitableOrgGrp">
								<xsl:for-each select="$FormData/SportEvtBnftCharitableOrgGrp">
									<span style="width:100%;border-bottom:1px dashed black;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="OrganizationBusinessName/BusinessNameLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
										<span style="float:right">
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</span>
									</span>
								</xsl:for-each>
							</xsl:if>
							<xsl:if test="(count($FormData/SportEvtBnftCharitableOrgGrp)) &lt; 1">
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
								<br/>
								<span style="width:100%;border-bottom:1px dashed black;">&#8194;</span>
							</xsl:if>
							<br/>
							<br/>
							<strong>Note. </strong> You must attach a statement to verify that all of the net proceeds of the sports event(s) were contributed to the charitable <br/>organization(s) listed on line 16.
						</div>
					</div>
					<!-- Part V -->
					<div class="styStdDiv" style="border-bottom:1px solid black;border-top:2px solid black;">
						<div class="styPartName">Part V</div>
						<div class="styPartDesc">Individuals With a Medical Condition or Medical Problem</div>
					</div>
					<!-- Line 17a -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">17a</div>
						<div class="sty8843DescA" style="width:179mm;">
							<span style="width:155mm;float:left;">
								Describe the medical condition or medical problem that prevented you from leaving the United States. See Instructions. <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
							</span>
							<xsl:choose>
							<xsl:when test="count($FormData/MedicalConditionGrp) &lt; 2">
									<span style="width:100%;border-bottom:1px dashed black;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MedicalConditionGrp/MedicalConditionCd"/>
								</xsl:call-template>
								<span style="padding-right:2mm"></span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MedicalConditionGrp/MedicalConditionDesc"/>
								</xsl:call-template>
							</span>	
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="TargetNode" select="$FormData/MedicalConditionGrp"/>
										</xsl:call-template>
									</xsl:otherwise>
							</xsl:choose>
							<span style="width:100%;height:3mm;border-bottom:1px dashed black;"/>
							<span style="width:100%;height:3mm;border-bottom:1px dashed black;"/>
						</div>
					</div>
					<!-- Line 17b -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">b</div>
						<div class="sty8843DescA" style="width:179mm;">
							Enter the date you intended to leave the United States prior to the onset of the medical condition or medical problem described <br/>
							<span style="width:21.5mm;float:left;">
								on line 17a <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
							</span>
							<span style="width:40mm;border-bottom:1px dashed black;float:left;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/MedicalConditionGrp/IntendedUSDepartureDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 17c -->
					<div class="styStdDiv" style="margin-top:3mm;margin-bottom:3mm;">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm;">c</div>
						<div class="sty8843DescA" style="width:179mm;">
							<span style="width:66.5mm;float:left;">
								Enter the date you actually left the United States <img src="{$ImagePath}/56_Bullet.gif" alt="Right pointing arrowhead image"/> 
							</span>
							<span style="width:40mm;border-bottom:1px dashed black;float:left;text-align:center;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$FormData/MedicalConditionGrp/DepartedUSDt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 18 -->
					<div class="styStdDiv">
						<div class="styLNLeftNumBox">18</div>
						<div class="sty8843DescA" style="width:179mm;">
							<strong>Physician's Statement:</strong>
							<br/>
							<br/>
							I certify that <span style="width:162mm;height:3mm;border-bottom:1px solid black;"/>
							<br/>
							<span style="padding-left:80mm;">Name of taxpayer</span>
							<br/>
							<br/>
							<br/>
							was unable to leave the United States on the date shown on line 17b because of the medical condition or medical problem <br/>
							described on line 17a and there was no indication that his or her condition or problem was preexisting.<br/>
							<br/>
							<span style="width:100%;height:4mm;border-bottom:1px solid black;"/>
							<span style="width:100%;text-align:center;">Name of physician or other medical official</span>
							<br/>
							<br/>
							<span style="width:100%;height:4mm;border-bottom:1px solid black;"/>
							<span style="width:100%;text-align:center;">Physician's or other medical official's address and telephone number</span>
							<br/>
							<br/>
							<span style="width:133mm;height:4mm;border-bottom:1px solid black;"/>
							<span style="width:44.5mm;height:4mm;border-bottom:1px solid black;margin-left:1mm;"/>
							<br/>
							<span style="width:133mm;text-align:center;">Physician's or other medical official's signature</span>
							<span style="width:44.5mm;text-align:center;margin-left:1mm;">Date</span>
						</div>
					</div>
					<!-- Signature section -->
					<div class="styStdDiv" style="border-top:1px solid black;">
						<div style="width:18mm;height:25mm;border-right:1px solid black;font-weight:bold;float:left;">
							Sign here only if you are filing this form by itself and not with your tax return
						</div>
						<div style="width:169mm;height:25mm;padding-left:1mm;">
							Under penalties of perjury, I declare that I have examined this form and the accompanying attachments, 
							and, to the best of my knowledge and belief, they are true, correct, and complete.<br/>
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
						Form <span style="font-weight:bold;font-size:8pt;">8843</span> (2021)
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
							<xsl:with-param name="DescWidth" select="140"/>
						</xsl:call-template>
						<xsl:for-each select="$FormData/TeacherOrTraineeExemptIndivGrp">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess6TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 6 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess6TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 6 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess5TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 5 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess5TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 5 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess4TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 4 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess4TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 4 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess3TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 3 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess3TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 3 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess2TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 2 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess2TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 2 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess1TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 1 year prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess1TeacherVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Teacher/Trainee <xsl:value-of select="position()"/> - Line 7 - Visa Type Change 1 year prior - Date</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
						<xsl:for-each select="$FormData/StudentExemptIndivGrp">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess6StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 6 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess6StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 6 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess5StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 5 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess5StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 5 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess4StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 4 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess4StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 4 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess3StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 3 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess3StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 3 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess2StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 2 years prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess2StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 2 years prior - Date</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess1StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDesc"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 1 year prior - Desc</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="TargetNode" select="CurrTYLess1StudentVisaGrp/VisaTypeChangeGrp/VisaChangeDt"/>
								<xsl:with-param name="Desc">Student <xsl:value-of select="position()"/> - Line 11 - Visa Type Change 1 year prior - Date</xsl:with-param>
							</xsl:call-template>
						</xsl:for-each>
					</table>
					<xsl:if test="count($FormData/ExmptIndivOrMedicalGenInfoGrp/USImmigrationStatusGrp) &gt;= 2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 1a - U.S. Immigration Status</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:111.5mm;">Immigration Status / Visa Type</th>
									<th class="styDepTblCell" scope="col" style="width:51.5mm;">Entered U.S. date</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ExmptIndivOrMedicalGenInfoGrp/USImmigrationStatusGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:51.5mm;text-align:left;">
											<div style="width:6.5mm;font-weight:bold;text-align:center;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:choose>
												<xsl:when test="USImmigrationStatusDesc">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USImmigrationStatusDesc"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ImmigrantVisaTypeCd">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ImmigrantVisaTypeCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="NonImmigrantVisaTypeCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td class="styTableCellText" style="width:51.5mm;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="EnteredUSDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<xsl:if test="count($FormData/ExmptIndivOrMedicalGenInfoGrp/PassportIssuedGrp) &gt;= 2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Lines 3a &amp; 3b - Passports Issued</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Issuing Country Code</th>
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Passport Number</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/ExmptIndivOrMedicalGenInfoGrp/PassportIssuedGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;text-align:center;">
											<div style="width:6.5mm;font-weight:bold;text-align:center;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
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
					<xsl:if test="count($FormData/AppLawfulPermanentResExplnTxt) &gt;= 2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Line 14 - Applied for lawful permanent resident status explanation</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:91.5mm;">Explanation</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/AppLawfulPermanentResExplnTxt">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:91.5mm;text-align:left;">
											<div style="width:6.5mm;font-weight:bold;text-align:center;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<xsl:if test="count($FormData/MedicalConditionGrp) &gt;= 2">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Part V Individuals With a Medical Condition or Medical Problem</span>
						<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:111.5mm;">17a - Medical Condition Code</th>
									<th class="styDepTblCell" scope="col" style="width:51.5mm;">17a - Medical Condition Description</th>
									<th class="styDepTblCell" scope="col" style="width:111.5mm;">17b - Intended US Departure Date</th>
									<th class="styDepTblCell" scope="col" style="width:51.5mm;">17c - Departed US Date</th>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="$FormData/MedicalConditionGrp">
									<tr style="border-color:black;height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCellText" style="width:51.5mm;text-align:left;">
											<div style="width:6.5mm;font-weight:bold;text-align:center;padding-right:2mm;" class="styGenericDiv">
												<xsl:value-of select="position()"/>
											</div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MedicalConditionCd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:51.5mm;text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MedicalConditionDesc"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:51.5mm;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="IntendedUSDepartureDt"/>
											</xsl:call-template>
										</td>
										<td class="styTableCellText" style="width:51.5mm;text-align:center;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="DepartedUSDt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
