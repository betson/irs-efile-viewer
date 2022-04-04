<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5471Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!--  Defines the stage of the data, e.g. original or latest  -->
	<xsl:param name="IRS5471Data" select="$RtnDoc/IRS5471"/>
	<xsl:param name="IRS5471AData" select="$RtnDoc/IRS5471/IRS5471ScheduleA"/>
	<xsl:param name="IRS5471BData" select="$RtnDoc/IRS5471/IRS5471ScheduleB"/>
	<xsl:param name="IRS5471CData" select="$RtnDoc/IRS5471/IRS5471ScheduleC"/>
	<xsl:param name="IRS5471EData" select="$RtnDoc/IRS5471/IRS5471ScheduleE"/>
	<xsl:param name="IRS5471FData" select="$RtnDoc/IRS5471/IRS5471ScheduleF"/>
	<xsl:param name="IRS5471GData" select="$RtnDoc/IRS5471/IRS5471ScheduleG"/>
	<xsl:param name="IRS5471HData" select="$RtnDoc/IRS5471/IRS5471ScheduleH"/>
	<xsl:param name="IRS5471IData" select="$RtnDoc/IRS5471/IRS5471ScheduleI"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html> 
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS5471Data)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="TY 2006 IRS Form 5471"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- uncomment this before checking in code  -->
					<xsl:if test="not($Print) or $Print=''">
					<!-- Form 5471 CSS Styles are located in the template called below -->
					<xsl:call-template name="IRS5471Style"/>
					<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="IRS5471">
					<!--   BEGIN WARNING LINE  -->
					<!--   BEGIN Preheader  LINE 10/05/2021  -->
					<xsl:call-template name="PopulatePreheader">
						<xsl:with-param name="TargetNode" select="$RtnDoc/IRS5471"/>
					</xsl:call-template>	
					<!--   END Preheader  LINE 10/05/2021  -->
					<xsl:call-template name="DocumentHeader"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:187mm;">										
						<div class="styFNBox" style="width:28.25mm; height: 23mm; border-bottom-width:1pt; border-right-width:1pt;">
							<div>
								Form 
								<span class="styFormNumber">5471</span>
								<br/>
								<span style="width:3mm;">
									<!--	<xsl:call-template name="IRS5471LinkToLeftoverDataTable">-->
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Change In Taxable Year No. 898c</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/ChangeInTaxableYearNo898cInd"/>
										<xsl:with-param name="Style"/>
									</xsl:call-template>
								</span>
								<span style="width:3mm;">
									<!--<xsl:call-template name="IRS5471LinkToLeftoverDataTable">-->
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Election Change In Year 898c</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/ElectionChangeInYear898cInd"/>
										<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:3mm;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<!--<xsl:call-template name="IRS5471LinkToLeftoverDataTable">-->
										<xsl:with-param name="Desc">Section 898c Election</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/Section898cElectionInd"/>
										<xsl:with-param name="Style">padding-left:6mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:3mm;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<!--<xsl:call-template name="IRS5471LinkToLeftoverDataTable">-->
										<xsl:with-param name="Desc">Section 338g Election</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/Section338gElectionInd"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:3mm;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Dormant Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/@dormantForeignCorporationCd"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:3mm;">
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Change Annual Accounting Period</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$IRS5471Data/@changeAnnualAccountingPeriodCd"/>
										<xsl:with-param name="Style">padding-left:9mm;</xsl:with-param>
									</xsl:call-template>
								</span>
								<span style="width:3mm; padding-left:3mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471Data"/>
										<xsl:with-param name="Style">width:10mm;text-align:right;padding-left:16mm</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<span style="height:13mm;"/>
							<div class="styAgency">(Rev. December 2021)</div>
							<div class="styAgency" style="font-size:6pt; text-align:bottom; padding-top:.5mm;">
									Department of the Treasury<br/>Internal Revenue Service</div>
						</div>
						<div class="styFNBox" style="width:127.5mm; height: 23mm; border-bottom-width:1pt; border-right-width:1pt; border-left-width:1pt;">
							<div class="styMainTitle" style="font-size:12pt; padding-left:3mm;">
										Information Return of U.S. Persons With Respect To Certain 
										<span style="width:35mm"/> Foreign Corporations
									</div>
							<div class="styFST" style="padding-top:1mm; padding-left:16mm;">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
								<span style="width: 1mm"/>Go to
										<a style="text-decoration:none; color:black;" href="http://www.irs.gov/form5471" title="Link to IRS.gov">
									<i>www.irs.gov/Form5471</i>
								</a>	
										for instructions and the latest information.
										<br/>
							</div>
							<div style="text-align:left; padding-top:1mm; padding-left:2mm; text-align:bottom;">
										Information furnished for the foreign corporation's annual accounting period (tax year required 
										<span style="width:6mm;"/> by  section 898)&#160;<span style="font-size:6pt;">(see instructions)
										</span>&#160;beginning     
                                        <span style="width:15mm;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxYearBeginDt"/>
									</xsl:call-template>
								</span>, and ending
										<span style="width:16mm;">
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxYearEndDt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div class="styTYBox" style="height:23mm; width:31mm; border-bottom-width:1pt; border-left-width:1pt;">
							<div class="styOMB" style="height:12mm;">
								<div style="text-align:left; font-size:7pt; padding-left:1mm; height:4mm; padding-top:4mm;">OMB No. 1545-0123</div>
							</div>
							<div class="styBoldText" style="height:2mm; padding-left: 3mm; padding-top:2mm;"/>
							<div style="height:6mm; text-align:left; padding-left:3mm;">
								<div style="width:13mm;">Attachment</div>
								<div style="width:23mm;">Sequence No.<b>121</b>
								</div>
							</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
					<!--   BEGIN NAME   -->

					<div style="width:187mm;">
											<xsl:call-template name="PopulatePreheader">
							<xsl:with-param name="TargetNode" select="$RtnDoc/IRS5471/CorrectedInd"/>
					</xsl:call-template>
						<div class="styNameBox" style="font-size:7pt; width:109mm">Name of person filing this return
									<span style="width:2mm"/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn"/>
							</xsl:call-template>
							<br/>
							<div style="font-family:verdana, arial, sans-serif; font-size:7pt; font-weight:normal; height:6mm;">
								<xsl:choose>
									<!-- Name from Form level -->
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/BusinessName/BusinessNameLine1Txt != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/BusinessName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/PersonFilingThisReturn/BusinessName/BusinessNameLine2Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateFilerName">
											<xsl:with-param name="TargetNode" select="$IRS5471Data"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<span class="styEINBox" style="font-size:7pt; padding-left:1mm;
						">A<span style="width:4px;"/>
						Identifying number</span>
						<span class="styNormalText" style="padding-top: 3mm; text-align: left; width: 70mm;padding-left:4.5mm;">
							<span style="font-weight:normal;">
								<xsl:call-template name="PopulateFilerTIN">
									<xsl:with-param name="TargetNode" select="$IRS5471Data"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--  END NAME   -->
					<!--   BEGIN ADDRESS AND CATEGORY   -->
					<div style="width:187mm;">
						<div class="styAddrFld" style="border-bottom-width: 0px; border-left-width:0px; border-style:solid; font-size:6pt; height:9mm; width:109mm; font-weight:normal;">
						Number, street, and room or suite no. (or P.O. box number if mail is not delivered to street address)
						     <span style="font-family:verdana, arial, sans-serif; font-size: 7pt; font-weight: normal;">
								<!-- Added new code to have choice between USAddress and ForeignAddress -->
								<!-- Added per RIS 13 and EXO-0273OTH  12/27/06 -->
								<xsl:choose>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine1Txt != ''">
										<div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</div>
										<br/>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine2Txt != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine1Txt != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine2Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styComType" style="width:78mm; height:9.3mm; float:right; clear:both; padding-left:1mm; border-top-width:1px; border-bottom-width: 0px;">
							<b style="font-size: 7pt;">B</b>
							<span style="width: 5px;"/>
							Category of filer (See instructions. Check applicable box(es)):
							<br/>
							<span style="margin-left:4mm; font-size:7pt;">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler1aInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler1aLabel</xsl:with-param>
									</xsl:call-template>1a</label>
								<input type="checkbox" alt="Category Of Filer 1a Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler1aInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler1aInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler1bInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler1bLabel</xsl:with-param>
									</xsl:call-template>1b</label>
								<input type="checkbox" alt="Category Of Filer 1b Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler1bInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler1bInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler1cInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler1cLabel</xsl:with-param>
									</xsl:call-template>1c</label>
								<input type="checkbox" alt="Category Of Filer 1c Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler1cInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler1cInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler2Ind"/>
										<xsl:with-param name="BackupName">CategoryOfFiler2Label</xsl:with-param>
									</xsl:call-template>2</label>
								<input type="checkbox" alt="Category Of Filer 2 Indicator" class="styCkbox" name="CategoryOfFiler2Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler2Ind"/>
										<xsl:with-param name="BackupName">CategoryOfFiler2Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1px;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3Ind"/>
									<xsl:with-param name="Style">width:32mm; text-align:left; padding-left:8mm</xsl:with-param>
								</xsl:call-template>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3Ind"/>
										<xsl:with-param name="BackupName">CategoryOfFiler3Label</xsl:with-param>
									</xsl:call-template>3</label>
								<input type="checkbox" alt="Category Of Filer 3 Indicator" class="styCkbox" name="CategoryOfFiler3Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler3Ind"/>
										<xsl:with-param name="BackupName">CategoryOfFiler3Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler4Ind"/>
										<xsl:with-param name="BackupName">CategoryOfFiler4Label</xsl:with-param>
									</xsl:call-template>4</label>
								<input type="checkbox" alt="Category Of Filer 4 Indicator" class="styCkbox" name="CategoryOfFiler4Ind">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler4Ind"/>
										<xsl:with-param name="BackupName">CategoryOfFiler4Ind</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5aInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler5aLabel</xsl:with-param>
									</xsl:call-template>5a</label>
								<input type="checkbox" alt="Category Of Filer 5a Indicator" class="styCkbox" name="CategoryOfFiler5aInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5aInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler5aInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5bInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler5bLabel</xsl:with-param>
									</xsl:call-template>5b</label>
								<input type="checkbox" alt="Category Of Filer 5b Indicator" class="styCkbox" name="CategoryOfFiler5bInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5bInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler5bInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<span style="width:1px;"/>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5cInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler5cLabel</xsl:with-param>
									</xsl:call-template>5c</label>
								<input type="checkbox" alt="Category Of Filer 5c Indicator" class="styCkbox" name="CategoryOfFiler5cInd">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CategoryOfFiler5cInd"/>
										<xsl:with-param name="BackupName">CategoryOfFiler5cInd</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<!--   END ADDRESSS AND CATEGORY   -->
					<!--   BEGIN CITY, STATE, ZIP AND VOTING PERCENTAGE   -->
					<!--  *******************************************************************************  -->
					<div style="width:187mm;">
						<div class="styComType" style="font-size: 7pt;width:109mm; height:15mm; border-top-width:1px; border-bottom-width:0px;border-right-width:1px">City or town, state, and ZIP code
                         <br/>
							<span style="font-family:verdana, arial, sans-serif; font-size:7pt; font-weight:normal;">
								<!-- <span style="font-family: verdana, arial, sans-serif;font-size: 8pt; font-weight: bold;"> -->
								<!-- NEW CODE ADDED TO REFLECT USADDRESS AND FOREIGNADDRESS  -->
								<!-- Added per RIS 13 and EXO-0273OTH  12/27/06 -->
								<xsl:choose>
									<xsl:when test="$IRS5471Data/PersonFilingThisReturn/USAddress">
										<xsl:attribute name="style">margin-left:0mm; padding-top:1mm; </xsl:attribute>
										<div>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/CityNm"/>
											</xsl:call-template>,
										</div>
										<span style="width:4px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/StateAbbreviationCd"/>
										</xsl:call-template>
										<span style="width:4px"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/USAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/CityNm"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonFilingThisReturn/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="styComType" style="font-size: 7pt; width:78mm; height:15mm; padding-left:1mm; border-top-width:1px; border-bottom-width:0px; text-align:left;">
							<b style="font-size:7pt; padding-right: 3px;">C</b>
                            Enter the total percentage of the foreign corporation's <div style="padding-left:13px;">voting stock you owned at the end of its annual accounting period
                            <span class="styFixedUnderline" style="width:15mm; float:none;">
									<xsl:call-template name="PopulatePercent">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/VotingStockOwnedPct"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!--   END CITY, STATE, ZIP AND VOTING PERCENTAGE   -->
					<!--   BEGIN FILER'S TAX YEAR   -->
					<div class="styBB" style="width:187mm; border-top-width:1px; height:4mm;">
						<span style="text-align:left;">Filer's tax year beginning
						    <span style="width:20mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FilerTaxYearBeginDt"/>
								</xsl:call-template>
							</span>, and ending
                                 <span style="width:20mm; ">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FilerTaxYearEndDt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END FILER'S TAX YEAR   -->
					<!--   END TAXPAYER INFO   -->
					<!--   BEGIN BLOCK D   -->
					<!--   BEGIN LINE D   -->
					<div class="styBB" style="width:187mm; height:5mm;">
						<div style="float:left;">
							<b style="font-size:7pt;">D</b>
							<span style="font-size:7pt;">
								&#160;  Check box if this is a final Form 5471 for the foreign corporation <span style="width:6mm;"/>
								<span class="styDotLn" style="float:right; padding-right:1mm;">......................</span>
							</span>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FinalForm5471Ind"/>
									<xsl:with-param name="BackupName">FinalForm5471Label</xsl:with-param>
								</xsl:call-template>
							</label>
							<span style="width:8px"/>
							<input type="checkbox" alt="Final Form 5471 Indicator" class="styCkbox" name="FinalForm5471Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/FinalForm5471Ind"/>
									<xsl:with-param name="BackupName">FinalForm5471Ind</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!--   BEGIN LINE E   -->
					<div class="styBB" style="width:187mm; height:5mm;">
						<div style="float:left;">
							<b style="font-size:7pt;">E</b>
							<span style="font-size:7pt;">
								&#160;  Check if any excepted specified foreign financial assets are reported on this form (see instructions)
								<span class="styDotLn" style="float:right; padding-right:1mm;">.............</span>
							</span>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignFinancialAssetInd"/>
									<xsl:with-param name="BackupName">ForeignFinancialAssetLabel</xsl:with-param>
								</xsl:call-template>
							</label>
							<span style="width:8px"/>
							<input type="checkbox" alt="Foreign Financial Asset Indicator" class="styCkbox" name="ForeignFinancialAssetInd">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignFinancialAssetInd"/>
									<xsl:with-param name="BackupName">ForeignFinancialAssetInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!--   BEGIN LINE F   -->
					<div class="styBB" style="width:187mm; height:5mm;">
						<div style="float:left;">
							<b style="font-size:7pt;">F</b>
							<span style="font-size:7pt;">
								&#160;  Check the box if this Form 5471 has been completed using “Alternative Information” under Rev. Proc. 2019-40
								<span class="styDotLn" style="padding-left:1mm; float:right; padding-right:1mm;">.........</span>
							</span>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/AltInformationRevProc201940Ind"/>
									<xsl:with-param name="BackupName">AlternativeInformationRevProc2019-40Label</xsl:with-param>
								</xsl:call-template>
							</label>
							<span style="width:8px"/>
							<input type="checkbox" alt="Alternative Information Rev Proc 2019-40 Indicator" class="styCkbox" name="AltInformationRevProc201940Ind">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/AltInformationRevProc201940Ind"/>
									<xsl:with-param name="BackupName">AlternativeInformationRevProc2019-40Ind</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
					</div>
					<!--   BEGIN LINE G   -->
					<div class="styBB" style="width:187mm; height:5mm;padding-top:1mm;">
						<div style="float:left;">
							<b style="font-size:7pt;">G</b>
							<span style="font-size:7pt;">
								&#160;  If the box on line F is checked, enter the corresponding code for “Alternative Information” (see instructions)
								<span class="styDotLn" style="padding-left:1mm; float:right; padding-right:1mm;">....</span>
							</span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$IRS5471Data/AltnformationRevProc201940Cd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--   BEGIN LINE H   -->
					<div class="styBB" style="width:187mm; height:5mm;">
						<div style="float:left;">
							<b style="font-size: 7pt;">H</b>
							<!--<span class="styNBSP"/>-->
							<span style="font-size: 7pt;">&#160;  Person(s) on whose behalf this information return is filed:</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
							</xsl:call-template>
							<span style="width:1px"/>
						</div>
						<div style="width:7mm;text-align:right;float:right;clear:none;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="headerHeight" select="2"/>
								<xsl:with-param name="containerID" select=" 'ATctn' "/>
								<xsl:with-param name="imageID" select=" 'ATimg' "/>
								<xsl:with-param name="buttonID" select=" 'ATbtn' "/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE H   -->
					<!--   BEGIN BLOCK H TABLE   -->
					<div class="styTableContainer" style="width:187mm;" id="ATctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 68mm" rowspan="2">
                                          (1)<span class="styNormalText">&#160;Name</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 63mm" rowspan="2">
                                          (2)<span class="styNormalText">&#160;Address</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; font-size: 7pt; text-align: center; width: 30mm" rowspan="2">
										 (3)<span class="styNormalText">&#160;Identifying number</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="width: 42mm; border-color: black; font-size: 7pt;border-right-width: 0px" colspan="3">
										(4)<span class="styNormalText">&#160;Check applicable box(es)</span>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color: black; width: 17mm; font-weight: normal">Shareholder</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; width: 11mm; font-weight: normal">Officer</th>
									<th scope="col" class="styTableCellHeader" style="border-color: black; border-right-width:0px; width: 14mm; font-weight: normal">Director</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:if test="($Print != $Separated) or (count($IRS5471Data/PersonInformationIsFiledFor) &lt;=4)">
									<xsl:for-each select="$IRS5471Data/PersonInformationIsFiledFor">
										<tr>
											<td class="styTableCell" style="width: 68mm; text-align: left; border-color: black; font-size: 7pt;">
												<xsl:if test="PersonNm!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="BusinessName/BusinessNameLine1Txt!=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:if>
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; width: 63mm; text-align: left; font-size: 7pt;">
												<xsl:if test="USAddress !=''">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="ForeignAddress !=''">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:if>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; width: 30mm;  text-align: center; font-size: 7pt;">
												<xsl:choose>
													<xsl:when test="SSN != ''">
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="SSN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="EIN != ''">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; text-align: center; font-size: 7pt; width: 17mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderInd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; text-align: center; font-size: 7pt; width: 11mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="OfficerInd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color: black; text-align: center; font-size: 7pt; border-right-width: 0px; 
											width: 14mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="DirectorInd"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:for-each>
								</xsl:if>
								<xsl:call-template name="AddRowsD">
									<xsl:with-param name="NumOfRows" select="4"/>
									<xsl:with-param name="PersonCount" select="count($IRS5471Data/PersonInformationIsFiledFor)"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'ATctn' "/>
						<xsl:with-param name="imageID" select=" 'ATimg' "/>
						<xsl:with-param name="buttonID" select=" 'ATbtn' "/>
					</xsl:call-template>
					<!--   END Block H TABLE   -->
					<!--   BEGIN IMPORTANT HEADER   -->
					<div class="styGenericDiv" style="width: 187mm; font-size: 8pt">
						<span class="styBoldText" style="vertical-align: top;">Important:</span>
						<span class="styItalicText" style="width: 160mm; padding-left: 1mm;"> Fill in all applicable lines and schedules.  All information <b>must</b> be in English.  All amounts <b>must</b> be stated in U.S. dollars unless otherwise indicated.</span>
					</div>
					<span class="styBB" style="width: 187mm; padding-left: 21mm;font-size:7pt">
					</span>
					<!--   END IMPORTANT HEADER   -->
					<!--   BEGIN BLOCK 1   -->
					<xsl:if test="(($Print != $Separated) and (count($IRS5471Data/ForeignEntityIdentificationGrp) &gt; 6))">
						<p style="page-break-before:always"/>
					</xsl:if>
					<!--   BEGIN 1A, 1B, 1C   -->
					<xsl:choose>
						<xsl:when test="($Print = $Separated)">
							<!--   BEGIN 1A, 1B, 1C   -->
							<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">
								<tr>
									<td class="styTableCell" rowspan="3" valign="top" style="width: 120mm; text-align:left;border-color:black; border-bottom:0;border-right:1;">
										<b>1a</b>
											Name and address of foreign corporation<br/>
										<br/>
										<span style="padding-left:5mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:choose>
												<xsl:when test="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2Txt != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<br/>
											<xsl:choose>
												<xsl:when test="$IRS5471Data/ForeignCorporation/USAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/USAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/ForeignAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
									<td class="styTableCell" valign="top" style="width: 59.5mm;height: 9.5mm;border-color:black;border-right-width: 0px;font-size:7pt">
										<span style="width:64mm;text-align:left;padding-left:1mm;font:size:7pt;">
											<b>b(1)</b>	Employer identification number, if any
                                        </span>
										<br/>
										<br/>
										<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
											<xsl:choose>
												<xsl:when test="$IRS5471Data/EmployerEIN != '' ">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/EmployerEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/MissingEmployerEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" valign="top" style="width: 59.5mm;height: 9.5mm;border-color:black;border-right-width: 0px;font-size:7pt">
										<span style="width:64mm;text-align:left;padding-left:1mm;padding-bottom:5mm;">
											<b>b(2)</b>
											<span style="padding-left:1mm;font-size:7pt">Reference ID number (see instructions)
                                         </span>
										</span>
										<br/>
										<br/>
										<xsl:choose>
											<xsl:when test="count($IRS5471Data/ForeignEntityIdentificationGrp) = 1">
												<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
													<br/>
												</span>
											</xsl:when>
											<xsl:otherwise>
												<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignEntityIdentificationGrp"/>
														<xsl:with-param name="ShortMessage" select=" 'false' "/>
													</xsl:call-template>
													<br/>
												</span>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="styTableCell" valign="top" style="width: 59.5mm;height: 9.5mm;border-color:black;border-right-width: 0px;
									 border-bottom-width: 0px">
										<span style="width:64mm;text-align:left;padding-left:1mm;;font-size:7pt">
											<b>c</b>
											<span class="styNBSP"/>Country under whose laws incorporated
                                        </span>
										<br/>
										<br/>
										<span style="text-align:left; width: 59.5mm; padding-left:7mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/CountryUnderWhoseLawsIncCd"/>
											</xsl:call-template>
										</span>
									</td>
								</tr>
							</table>
						</xsl:when>
						<xsl:when test="($Print != $Separated)">
							<div style="width:187mm;font-size:7pt;">
								<span class="styTableCell" style="float:left;vertical-align:top;width: 110.1mm;height:25mm;text-align:left;border-right-width:0px;border-bottom-width:0px;">
									<b>1a</b>
									<span class="styNBSP"/>Name and address of foreign corporation<br/>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine1Txt"/>
									</xsl:call-template>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2Txt != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<br/>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/ForeignCorporation/USAddress">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/USAddress"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignCorporation/ForeignAddress"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
								<span class="styTableCell" style="text-align:left;width: 74mm;height:16mm;border-left-width:1px;border-right:0;border-bottom:0;">
									<span style="width:2mm;"/>
									<b>b(1)&#160;</b>
									<span style="padding-right:3mm;">Employer identification number, if any
                                    </span>
									<br/>
									<span style="padding-top:2mm;">
										<span style="width:9mm;"/>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/EmployerEIN != '' ">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/EmployerEIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/MissingEmployerEINReasonCd"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</span>
									<span class="styTableCell" style="border:none;border-top:1px solid black;padding-left:2mm;width:76mm;border-bottom-width:2px;border-left-width:1px">
										<span style="float:left;">
											<b>b(2)</b>	Reference ID number (see instructions)
			                            	</span>
										<span style="float:right;">
											<xsl:call-template name="SetDynamicTableToggleButton">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignEntityIdentificationGrp"/>
												<xsl:with-param name="containerHeight" select="1"/>
												<xsl:with-param name="headerHeight" select="0"/>
												<xsl:with-param name="containerID" select=" 'FEIdctn' "/>
											</xsl:call-template>
										</span>
									</span>
								</span>
								<div class="styIRS5471TableContainer" id="FEIdctn" style="height:9mm;border-top-width:1px;width:76mm;padding-left:0mm;">
									<xsl:call-template name="SetInitialState"/>
									<table class="styTable" cellspacing="0" style="font-size: 7pt;">
										<tbody>
											<xsl:choose>
												<xsl:when test="count($IRS5471Data/ForeignEntityIdentificationGrp) = 0">
													<tr>
														<td class="styTableCell" style="vertical-align:bottom;height:9mm;border-color:black;border-right:0;border-left:1px solid black;">
															<span style="text-align:left;width: 73mm;">
																<br/>
															</span>
														</td>
													</tr>
												</xsl:when>
												<xsl:otherwise>
													<xsl:for-each select="$IRS5471Data/ForeignEntityIdentificationGrp">
														<tr>
															<td class="styTableCell" style="vertical-align:bottom;height:9mm;border-color:black;border-right:0;border-left:1px solid black;width: 73mm;">
																<span style="font-size:6pt;text-align:left;">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
																	</xsl:call-template>
																	<br/>
																</span>
															</td>
														</tr>
													</xsl:for-each>
												</xsl:otherwise>
											</xsl:choose>
										</tbody>
									</table>
								</div>
							</div>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/ForeignEntityIdentificationGrp"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="headerHeight" select="0"/>
								<xsl:with-param name="containerID" select=" 'FEIdctn' "/>
							</xsl:call-template>
							<!--06-21-2015  In print Preview Mode we have the best available right border alignments  -->
							<span class="styTableCell" style="width:110.2mm;border:none;">
						</span>
							<span class="styTableCell" style="text-align:left;padding-left:2mm;height:9.5mm;border:none;border-left:1px solid black;width:70mm;">
								<b>c</b>
								<span style="width:0mm;padding-left:2mm"/>Country under whose laws incorporated
								<br/>
								<br/>
								<span style="text-align:left; width: 64mm; padding-left:4mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/CountryUnderWhoseLawsIncCd"/>
									</xsl:call-template>
								</span>
							</span>
						</xsl:when>
					</xsl:choose>
					<!--   END BLOCK 1A, 1B, 1C   -->
					<!--   BEGIN BLOCK 1D, 1E, 1F, 1G, 1H   -->
					<table class="styTable" cellspacing="0" style="width:187mm;border-top:0px solid black;font-size: 7pt">
						<tr>
							<td class="styTableCell" valign="top" style="width: 33mm; height: 10mm; border-color: black;
							         border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px;">
								<span style="width:33mm;text-align:left;padding-left:1mm">
									<b>d</b>
									<span style="width: 1mm"/>Date of incorporation
                               </span>
								<br/>
								<br/>
								<span style="text-align: left; width: 32mm;padding-left:3.5mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/IncorporationDt"/>
									</xsl:call-template>
								</span>
							</td>
							<td class="styTableCell" valign="top" style="width: 42mm; height: 10mm;
							 border-color: black; border-top-width: 1px;border-bottom-width:0px">
								<span style="width:42mm;text-align:left;padding-left:1mm;">
									<b>e</b>
									<span style="width: 1mm"/>Principal place of business
		                     </span>
								<br/>
								<br/>
								<span style="text-align: left; width: 42mm;padding-left:4mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalPlaceOfBusCountryCd"/>
									</xsl:call-template>
								</span>
							</td>
							<td class="styTableCell" valign="top" style="width: 39mm; height: 10mm; 
							border-color: black; border-bottom-width: 0px;border-top-width:1px">
								<span style="width:39mm;text-align:left;padding-left:1mm;">
									<b>f</b>
									<span style="width: 1mm"/>Principal business 
	                         </span>
								<span style="text-align: left; width: 39mm;padding-left:3mm">activity code number<br/>
								</span>
								<span style="text-align: left; width: 39mm; padding-left:3mm;">
									<xsl:choose>
										<xsl:when test="$IRS5471Data/PrincipalBusinessActivityCd != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalBusinessActivityCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/InactivePrincipalBusActyCd"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
							<td class="styTableCell" valign="top" style="width: 41mm; height: 10mm; 
							border-color: black; border-bottom-width: 0px;border-top-width:1px">
								<span style="width:41mm;text-align:left;padding-left:1mm;">
									<b>g</b>
									<span style="width: 1mm"/>Principal business activity
	                         </span>
								<br/>
								<div style="width:39mm;text-align:left;; text-align:left;padding-top:3mm;padding-bottom:0mm">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/PrincipalBusinessActivityDesc"/>
									</xsl:call-template>
								</div>
							</td>
							<td class="styTableCell" valign="top" style="width: 29mm; height: 10mm;
							 border-color: black;border-bottom-width: 0px; border-right-width: 0px;border-top-width:1px">
								<span style="width:29mm;text-align:left;">
									<b>h</b>
									<span style="width:0.5mm;font-size:6pt"/>
									Functional currency <br/><span style="width:3mm;"/>code
								</span>
								<br/>
								<span style="text-align: left; width: 30mm; padding-left:4mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/FunctionalCurrencyCd"/>
									</xsl:call-template>
								</span>
							</td>
						</tr>
					</table>
					<!--   END BLOCK 1D, 1E, 1F, 1G, 1H   -->
					<!--   END BLOCK 1   -->
					<!--   BEGIN BLOCK 2   -->
					<!--   BEGIN LINE 2   -->
					<div class="styBB" style="text-align: left; border-top-width: 1px;width: 187mm; clear:none;">
						<b>2</b>
						<span style="width:1.5mm;"/>
						Provide the following information for the foreign corporation's accounting period stated above.</div>
					<!--   END LINE 2   -->
					<!-- BEGIN BLOCK 2A, 2B   -->
					<table class="styTable" cellspacing="0" style="width:187mm;font-size:7pt;">
						<tr>
							<td scope="col" class="styTableCell " rowspan="3" style="border-color:black;height: 2mm;font-weight:normal;border-bottom-width: 1px;width:107mm" valign="top">
								<span style="width:107mm;text-align:left;">
									<b>a</b>
									<span style="width: 1mm"/>
									 Name, address, and identifying number of branch office or agent<br/>
									<span style="width: 3mm"/> (if any) in the United States<br/>
								</span>
								<span style="width:107mm;text-align:left;padding-left:4mm;">
									<xsl:choose>
										<xsl:when test="$IRS5471Data/BranchOfficeInTheUS/PersonNm != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/PersonNm"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine1Txt != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine2Txt != ''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/BusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
									<br/>
									<xsl:if test="$IRS5471Data/BranchOfficeInTheUS/USAddress != ''">
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/USAddress"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$IRS5471Data/BranchOfficeInTheUS/ForeignAddress != ''">
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/BranchOfficeInTheUS/ForeignAddress"/>
										</xsl:call-template>
									</xsl:if>
									<br/>
									<xsl:choose>
										<xsl:when test="$IRS5471Data/USAgentSSN != ''">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/USAgentSSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="$IRS5471Data/USAgentEIN != ''">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/USAgentEIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/USAgentMissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>
							</td>
							<td scope="col" class="styTableCellHeader " style="border-color: black;height: 2mm;width: 70mm;border-right-width: 0px;text-align:left;
							 padding-left:2mm" colspan="2">
								<span style="width:70mm;text-align:left;">
									<b>b</b>&#160;
									<span style="font-weight:normal">If a U.S. income tax return was filed, enter:</span>
								</span>
							</td>
						</tr>
						<tr>
							<td scope="col" class="styTableCellHeader " style="font-weight: normal; border-color: black;width:39mm;">
								<div class="styBB" style="width:39mm;height:11mm;border-right-width:0px;padding-top:3mm;">
									<i>(i)</i>
									<span style="width:1mm"/>Taxable income or (loss)
								</div>
								<div style="width:39mm;border-top-width:1px;padding-top:15.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/TaxableIncomeOrNetLossAmt"/>
									</xsl:call-template>
								</div>
							</td>
							<td scope="col" class="styTableCellHeader " style="font-weight: normal; border-color: black;border-right-width:0px;width:39mm;">
								<div class="styBB" style="width:39mm;height:11mm;border-right-width:0px;padding-top:2mm;">
									<i>(ii)</i>
									<span style="width: 1mm"/>U.S. income tax paid (after all credits)
								</div>
								<div style="width:39mm;border-top-width:1px;padding-top:15.5mm;text-align:right;padding-right:1mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471Data/USIncomeTaxPaidAfterCrAmt"/>
									</xsl:call-template>
								</div>
							</td>
						</tr>
						<tr>
					</tr>
					</table>
					<span style="float:right;">
						<span class="styTableCellPad"/>
						<span style="float:right;vertical-align:bottom;padding-right:1mm">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'PWRCctn' "/>
							</xsl:call-template>
						</span>
					</span>
					<!--   END BLOCK 2A, 2B   -->
					<!-- Adding parent div to the elements a and b of line 2.  If not when the height of the line e is less than the c and d, then this table will appear next to the line e -->
					<div class="styGenericDiv" style="width:186mm;border-top:1px solid black;">
						<div class="styBB" style="width:102mm;border-bottom:0;border-right-width:0px;clear:none;">
							<!-- Box 2c -->
							<div class="styGenericDiv" style="font-size:7pt; ">
								<b>c</b> &#160;Name and address of foreign corporation's statutory or resident agent in <br/>
								<span style="width:2mm"/>   country of incorporation<br/>
								<br/>
								<span style="padding-left:3mm">
									<div style="font-family:verdana;">
										<xsl:choose>
											<xsl:when test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/PersonNm != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/PersonNm"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/
										 BusinessNameLine1Txt != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/
												BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
										<xsl:choose>
											<xsl:when test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/BusinessName/
										BusinessNameLine2Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/
												BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</div>
									<br/>
									<xsl:if test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/USAddress != ''">
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/USAddress"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/ForeignAddress != ''">
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="$IRS5471Data/FrgnCorpStatutoryOrResidentAgt/ForeignAddress"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
						</div>
						<!-- Box 2d -->
						<xsl:if test="($Print != $Separated) or (count($IRS5471Data/PersonWithRecordsCustody) = 1)">
							<span id="PWRCctn" style="height:auto;width:84mm;float:right;" class="styIRS5471TableContainer">
								<xsl:call-template name="IRS5471_SetInitialState"/>
								<table class="styTable" cellspacing="0" name="PWRCTable" id="PWRCTable">
									<thead>
										<tr style="border-left-width:0px solid black;">
											<th class="styTableCellHeader" style="width:4mm;border-left-width:0px;
											 border-bottom-width:0px ;text-align:left;vertical-align:top;border-right-width:0px;
											padding-left:1mm;font-size:7pt;padding-top:0mm;" scope="col">
											</th>
											<th class="styTableCellHeader" style="width:76mm;border:none;font-weight:normal;text-align:left;
											vertical-align:top;font-size:7pt;border-left:1px solid black;" scope="col">
												<b>d</b>
												<!--<span style="padding-left:1mm">-->
											 Name and address (including corporate
											department,  if <br/>
												<span style="padding-left:2mm">applicable) of person (or persons)
											with custody of the books and records of the
											foreign corporation, and the location of such
											books and records, if different <br/>
												</span>
												<br/>
											</th>
										</tr>
									</thead>
									<tfoot/>
									<tbody>
										<!-- Display all rows of Line 2b if the print option is not "separated" -->
										<!-- If the print option is "separated", but there is only one row, display the row -->
										<xsl:for-each select="$IRS5471Data/PersonWithRecordsCustody">
											<tr>
												<td class="styTableCell" style="width:4mm;vertical-align:top;text-align:left;
												border:none;border-bottom-width:1px solid black;">
													<xsl:if test="position()=last()">
														<xsl:attribute name="style">
														width:4mm;vertical-align:top;text-align:left;border:none;border-right:1px solid black;</xsl:attribute>
													</xsl:if>
													<span style="width:4px;"/>
												</td>
												<td class="styTableCell" style="width:76mm;text-align:left;vertical-align:top;
												border:none;font-size:7pt;border-bottom:1px solid black;border-left:1px solid black;">
													<xsl:if test="position()=last()">
														<xsl:attribute name="style">width:84mm;text-align:left;vertical-align:top;
												font-size:7pt;border-left-width:0px;border-bottom-width:0px;border-right-width:0px
												</xsl:attribute>
													</xsl:if>
													<span style="font-family:verdana;">
														<xsl:choose>
															<xsl:when test="BusinessName/BusinessNameLine1Txt !=''">
																<span style="padding-left:2mm">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																	<xsl:if test="BusinessName/BusinessNameLine2Txt !=''">
																		<br/>
																		<xsl:call-template name="PopulateText">
																			<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
																		</xsl:call-template>
																	</xsl:if>
																</span>
															</xsl:when>
															<xsl:otherwise>
																<span style="padding-left:2mm">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="PersonNm"/>
																	</xsl:call-template>
																</span>
															</xsl:otherwise>
														</xsl:choose>
													</span>
													<br/>
													<br/>
													<xsl:choose>
														<xsl:when test="USAddress">
															<span style="padding-left:2mm">
																<xsl:call-template name="PopulateUSAddressTemplate">
																	<xsl:with-param name="TargetNode" select="USAddress"/>
																</xsl:call-template>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span style="padding-left:2mm">
																<xsl:call-template name="PopulateForeignAddressTemplate">
																	<xsl:with-param name="TargetNode" select="ForeignAddress"/>
																</xsl:call-template>
															</span>
														</xsl:otherwise>
													</xsl:choose>
													<br/>
													<br/>
													<xsl:choose>
														<xsl:when test="LocationAddressInUS">
															<span style="padding-left:2mm">
																<xsl:call-template name="PopulateUSAddressTemplate">
																	<xsl:with-param name="TargetNode" select="LocationAddressInUS"/>
																</xsl:call-template>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<span style="padding-left:2mm">
																<xsl:call-template name="PopulateForeignAddressTemplate">
																	<xsl:with-param name="TargetNode" select="LocationAddressInForeign"/>
																</xsl:call-template>
															</span>
														</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
							</span>
							<xsl:call-template name="SetInitialDynamicTableHeight">
								<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody"/>
								<xsl:with-param name="containerHeight" select="1"/>
								<xsl:with-param name="headerHeight" select="1"/>
								<xsl:with-param name="containerID" select=" 'PWRCctn' "/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="(($Print = $Separated) and (count($IRS5471Data/PersonWithRecordsCustody) &gt; 1))">
							<span style="border-left:1px solid black;height:35mm">
								<span class="styTableCell" style="width:8mm;border:none;text-align:left;vertical-align:top;padding-left:1mm;font-size:7pt;padding-top:0mm;" scope="col">
									<b>d</b>
								</span>
								<span class="styTableCell" style="width:70mm;border-color:black;border:none;font-weight:normal;
								text-align:left;vertical-align:top;font-size:7pt;" scope="col">
									Name and address (including corporate
									department, if applicable) of person (or persons) 
									with custody of the books and records of the
									foreign corporation, and the location of such
									books and records, if different 
									<br/>
									<xsl:if test="count($IRS5471Data/PersonWithRecordsCustody) &gt; 1">
										<br/>
										<span style="font-family:verdana;">
											<xsl:call-template name="PopulateAdditionalDataTableMessage">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonWithRecordsCustody"/>
											</xsl:call-template>
										</span>
									</xsl:if>
								</span>
							</span>
						</xsl:if>
					</div>
					<!--   END BLOCK 2C, 2D   -->
					<xsl:if test="($Print != $Separated)">
						<br style="clear:both;"/>
					</xsl:if>
					<!--   BEGIN SCHEDULE A HEADER   -->
					<div class="styBB" style="width:186mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm;height:4.5mm">Schedule A</div>
						<div class="styPartDesc" style="width: 158mm;">Stock of the Foreign Corporation</div>
						<div style="height:2mm;float:right;clear:none;width:3mm;">
							<xsl:call-template name="SetDynamicTableToggleButton">
								<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/>
								<xsl:with-param name="containerHeight" select="4"/>
								<xsl:with-param name="containerID" select=" 'SCctn' "/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END SCHEDULE A HEADER   -->
					<!--  BEGIN A, B, i and ii   -->
					<div class="styIRS5471TableContainer" style="width:187mm;height:auto;" id="SCctn">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" id="SCTable" style="font-size: 7pt">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 90mm; text-align: center" rowspan="2">
                    (a)<span class="styNormalText">&#160;Description of each class of stock</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 96mm;
									 text-align: center; border-right-width: 0px;" colspan="2">
                    (b)<span class="styNormalText">&#160;Number of shares issued and outstanding</span>
									</th>
								</tr>
								<tr>
									<th scope="col" class="styTableCellHeader" style="border-color:black; width: 48mm;
									 text-align: center;">
										<span class="styNormalText">
											<span class="styItalicText">(i)</span> Beginning of annual accounting period</span>
									</th>
									<th scope="col" class="styTableCellHeader" style="border-color:black; 
									width: 48mm; border-right-width:0px;">
										<span class="styNormalText">
											<span class="styItalicText">(ii)</span> End of annual accounting period</span>
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471AData/StockOfTheForeignCorporation">
									<xsl:if test="($Print != $Separated)
									 or (count($IRS5471AData/StockOfTheForeignCorporation) &lt;=4)">
										<tr>
											<td class="styTableCell" style="border-color:black; width: 90mm; text-align: left">
												<xsl:choose>
													<xsl:when test="StockClassDesc">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="StockClassDesc"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="StockClassTypeCd "/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width: 48mm;text-align:right">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
											<td class="styTableCell" style="border-color:black; width: 48mm; text-align: right; border-right-width: 0px">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
												</xsl:call-template>
												<span class="styTableCellPad"/>
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsScheduleAI">
									<xsl:with-param name="NumOfRows" select="4"/>
									<xsl:with-param name="StockCount" select="count($IRS5471AData/StockOfTheForeignCorporation)"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<xsl:call-template name="SetInitialDynamicTableHeight">
						<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/>
						<xsl:with-param name="containerHeight" select="4"/>
						<xsl:with-param name="headerHeight" select="2"/>
						<xsl:with-param name="containerID" select=" 'SCctn' "/>
					</xsl:call-template>
					<!--   END A, B, i and ii   -->
					<xsl:if test="($Print = $Separated)">
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
						<br/>
					</xsl:if>
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color: black; border-style: solid; border-right-width: 0px;
					 border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px;">
						<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions.</span>
						<div style="float:right">
							Cat. No. 49958V 
							<span style="width:90px"/>
							Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2021)
						</div>
					</div>
					<!--<div class="pageEnd"/>-->
					<!--END FOOTER-->
					<p style="page-break-before:always"/>
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2021)</div>
						<div style="float:right">
                       Page <span class="styBoldText" style="font-size: 8pt">2</span>
						</div>
					</div>
					<br/>
					<!--END HEADER-->
					<!--   BEGIN SCHEDULE B   -->
					<!--   BEGIN SCHEDULE B HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm;height:4mm">Schedule B</div>
						<div class="styPartDesc" style="width: 160mm;">
							Shareholders of Foreign Corporation 
							<span style="font-size:8pt; width:80mm; font-weight:normal;"/>
						</div>
						<span style="width:5mm;text-align:right;float:right; clear: none">
							<xsl:if test="($Print != $Separated) and (count($IRS5471BData/USShareholdersOfForeignCorp) &gt; 5)">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="containerID" select=" 'FSctn' "/>
								</xsl:call-template>
							</xsl:if>
						</span>
						<!--   END SCHEDULE B HEADER   -->
						<!-- take this out later -->
					</div>
					<!--*****PART I, of Schedule B ******-->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width: 13mm;height:4mm">Part I</div>
						<div class="styPartDesc" style="width: 160mm;">
							U.S. Shareholders of Foreign Corporation 
							<span style="font-size:8pt; width:80mm; font-weight:normal;">(see instructions)</span>
						</div>
					</div>
					<!--  BEGIN PART I TABLE of SCHEDULE B   -->
					<div class="styTableContainer" id="FSctn" style="width:187mm; height:auto; clear:both;">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" name="FSTable" id="FSTable">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCell" style="border-color: black; width: 47mm; text-align: center;font-weight:normal">
										<b>(a)</b>
									&#160; Name, address, and identifying number of shareholder
								</th>
									<th scope="col" class="styTableCell" style="border-color: black; width: 46mm; text-align:center;font-weight:normal">
										<b>(b)</b> Description of each class of stock held by shareholder. <b>Note:</b>
										<i> This description should match the corresponding description entered in Schedule A, column (a).</i>
									</th>
									<th scope="col" class="styTableCell" style="border-color: black; width: 29mm; text-align:center;font-weight:normal">
										<b>(c)</b> Number of shares held at beginning of annual accounting period
								</th>
									<th scope="col" class="styTableCell" style="border-color:black; width:29mm; text-align:center; border-right-width:1px;font-weight:normal">
										<b>(d)</b> Number of shares held at end of annual accounting period
								</th>
									<th scope="col" class="styTableCell" style="border-color: black; width: 32mm; text-align: center; border-right-width: 0px;font-weight:normal">
										<b>(e)</b> Pro rata share of subpart F income (enter as a percentage)
								</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471BData/USShareholdersOfForeignCorp">
									<xsl:variable name="FSRowCount" select="count(ForeignCorporationStocks)"/>
									<xsl:if test="($Print != $Separated) 
									or ((count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks)
									 &gt; 4]) &lt;=0))          and (count($IRS5471BData/USShareholdersOfForeignCorp) &lt;=5)">
										<xsl:for-each select="ForeignCorporationStocks">
											<xsl:choose>
												<xsl:when test="position()=1">
													<tr>
														<td class="styTableCell" style="border-color: black; text-align:left; width: 55mm;">
															<xsl:choose>
																<xsl:when test="$FSRowCount&gt;4">
																	<xsl:attribute name="rowspan"><xsl:value-of select="$FSRowCount"/></xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="rowspan">4</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../PersonNm != ''">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../PersonNm"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../BusinessName/BusinessNameLine1Txt != ''">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../BusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../BusinessName/BusinessNameLine2Txt != ''">
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../BusinessName/BusinessNameLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../USAddress != ''">
																	<br/>
																	<xsl:call-template name="PopulateUSAddressTemplate">
																		<xsl:with-param name="TargetNode" select="../USAddress"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../ForeignAddress != ''">
																	<br/>
																	<xsl:call-template name="PopulateForeignAddressTemplate">
																		<xsl:with-param name="TargetNode" select="../ForeignAddress"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<br/>
															<xsl:choose>
																<xsl:when test="../ShareholderEIN != ''">
																	<xsl:call-template name="PopulateEIN">
																		<xsl:with-param name="TargetNode" select="../ShareholderEIN"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:when test="../ShareholderSSN != ''">
																	<xsl:call-template name="PopulateSSN">
																		<xsl:with-param name="TargetNode" select="../ShareholderSSN"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../ShareholderMissingEINReasonCd"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left; border-color: black; width: 50mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="StockClassDesc"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left;border-color: black;text-size:4mm; width: 27mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left;border-color: black; text-size:5mm;width: 27mm;
													 border-right-width: 1px">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="border-color: black; width: 35mm; text-align: right; border-right-width: 0px;font-size:6pt;">
															<xsl:choose>
																<xsl:when test="$FSRowCount&gt;4">
																	<xsl:attribute name="rowspan"><xsl:value-of select="$FSRowCount"/></xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="rowspan">4</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<span style="width:34mm;">
																<xsl:call-template name="PopulatePercent">
																	<xsl:with-param name="TargetNode" select="../ProRataShareSubpartFIncomeRt"/>
																</xsl:call-template>
															</span>
														</td>
														<td class="styIRS5471TableLastCol" id="FSspcr"/>
													</tr>
													<xsl:if test="position()=last()">
														<xsl:call-template name="AddSubRows">
															<xsl:with-param name="RowNumber" select="position()"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td class="styTableCell" style="border-color: black; width: 50mm;text-align:left;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="StockClassDesc"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left;text-size:5mm;border-color: black; width: 29mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left;text-size:5mm;border-color: black; width: 29mm;
													border-right-width: 1px;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
													</tr>
													<xsl:if test="position()=last()">
														<xsl:call-template name="AddSubRows">
															<xsl:with-param name="RowNumber" select="position()"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsScheduleB">
									<xsl:with-param name="NumOfRows" select="5"/>
									<xsl:with-param name="ShareholdersCount" select="count($IRS5471BData/USShareholdersOfForeignCorp)"/>
									<xsl:with-param name="StockSetsCount" select="count($IRS5471BData/							 USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 4])"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<xsl:if test="($Print != $Separated) and (count($IRS5471BData/USShareholdersOfForeignCorp) &gt; 5)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'FSctn' "/>
						</xsl:call-template>
					</xsl:if>
					<!--*****END PART I of SCHEDULE B****** -->
					<!--*****PART II, of Schedule B ******-->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width: 13mm;height:4mm">Part II</div>
						<div class="styPartDesc" style="width: 160mm;">
							Direct Shareholders of Foreign Corporation
							<span style="font-size:8pt; width:80mm; font-weight:normal;">(see instructions)</span>
						</div>
						<span style="width:5mm; text-align:right; float:right; clear: none">
							<xsl:if test="($Print != $Separated) and (count($IRS5471BData/DirectShareholdersForeignCorp) &gt; 5)">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$IRS5471BData/DirectShareholdersForeignCorp"/>
									<xsl:with-param name="containerHeight" select="5"/>
									<xsl:with-param name="containerID" select=" 'DSctn' "/>
								</xsl:call-template>
							</xsl:if>
						</span>
					</div>
					<!--  BEGIN PART II TABLE of SCHEDULE B   -->
					<div class="styTableContainer" id="DSctn" style="width:187mm; height:auto; clear:both;">
						<!--print logic-->
						<xsl:call-template name="SetInitialState"/>
						<!--end-->
						<table class="styTable" cellspacing="0" name="DSTable" id="DSTable">
							<thead class="styTableThead">
								<tr>
									<th scope="col" class="styTableCell" style="border-color:black; width:60mm; text-align:center; font-weight:normal;">
										<b>(a)</b>
									&#160; Name, address, and identifying number of shareholder. 
									Also include country of incorporation or formation, if applicable.
								</th>
									<th scope="col" class="styTableCell" style="border-color:black; width:59mm; text-align:center; font-weight:normal;">
										<b>(b)</b> Description of each class of stock held by shareholder. <b>Note:</b>
										<i> This description should match the corresponding description entered in Schedule A, column (a).</i>
									</th>
									<th scope="col" class="styTableCell" style="border-color:black; width:32mm; text-align:center; font-weight:normal;">
										<b>(c)</b> Number of shares held at beginning of annual accounting period
								</th>
									<th scope="col" class="styTableCell" style="border-color:black; width:32mm; text-align:center; border-right-width:0px; font-weight:normal;">
										<b>(d)</b> Number of shares held at end of annual accounting period
								</th>
									<!--<th scope="col" class="styTableCell" style="border-color: black; width: 32mm; text-align: center; border-right-width: 0px;font-weight:normal">
								   <b>(e)</b> Pro rata share of subpart F income (enter as a percentage)
								</th>-->
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471BData/DirectShareholdersForeignCorp">
									<xsl:variable name="FSRowCount" select="count(ForeignCorporationStocks)"/>
									<xsl:if test="($Print != $Separated) or ((count($IRS5471BData/DirectShareholdersForeignCorp[count(ForeignCorporationStocks)
									 &gt; 4]) &lt;=0)) and (count($IRS5471BData/DirectShareholdersForeignCorp) &lt;=5)">
										<xsl:for-each select="ForeignCorporationStocks">
											<xsl:choose>
												<xsl:when test="position()=1">
													<tr>
														<td class="styTableCell" style="border-color:black; text-align:left; width:70mm;max-height: auto;overflow: hidden;">
															<xsl:choose>
																<xsl:when test="$FSRowCount&gt;4">
																	<xsl:attribute name="rowspan"><xsl:value-of select="$FSRowCount"/></xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="rowspan">4</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>

<div class="avoid" style="padding-top:4mm;padding-bottom:4mm;">
															<xsl:choose>
																<xsl:when test="../PersonNm != ''">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../PersonNm"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../BusinessName/BusinessNameLine1Txt != ''">
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../BusinessName/BusinessNameLine1Txt"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../BusinessName/BusinessNameLine2Txt != ''">
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../BusinessName/BusinessNameLine2Txt"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../USAddress != ''">
																	<br/>
																	<xsl:call-template name="PopulateUSAddressTemplate">
																		<xsl:with-param name="TargetNode" select="../USAddress"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../ForeignAddress != ''">
																	<br/>
																	<xsl:call-template name="PopulateForeignAddressTemplate">
																		<xsl:with-param name="TargetNode" select="../ForeignAddress"/>
																	</xsl:call-template>
																</xsl:when>
															</xsl:choose>
															<br/>
															<xsl:choose>
																<xsl:when test="../ShareholderEIN != ''">
																	<xsl:call-template name="PopulateEIN">
																		<xsl:with-param name="TargetNode" select="../ShareholderEIN"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:when test="../ShareholderSSN != ''">
																	<xsl:call-template name="PopulateSSN">
																		<xsl:with-param name="TargetNode" select="../ShareholderSSN"/>
																	</xsl:call-template>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../ShareholderMissingEINReasonCd"/>
																	</xsl:call-template>
																</xsl:otherwise>
															</xsl:choose>
															<xsl:choose>
																<xsl:when test="../IncorporationCountryCd != ''">
																	<br/>
																	<xsl:call-template name="PopulateText">
																		<xsl:with-param name="TargetNode" select="../IncorporationCountryCd"/>
																	</xsl:call-template>
																	<br/>
																</xsl:when>
															</xsl:choose>
															<span class="styTableCellPad"/>
</div>
														</td>
														<td class="styTableCell" style="text-align:left; border-color:black; width:60mm;padding-top:0.5mm;padding-bottom:0.5mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="StockClassDesc"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left; border-color:black; text-size:4mm; width:32mm;padding-top:0.5mm;padding-bottom:0.5mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left; border-color:black; text-size:5mm; width:32mm; border-right-width:0px;padding-top:0.5mm;padding-bottom:0.5mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<!--<td class="styTableCell" style="border-color:black; width:35mm; text-align:right; border-right-width:0px; font-size:6pt;">
														<xsl:choose>
															<xsl:when test="$FSRowCount&gt;4">
																<xsl:attribute name="rowspan">
																	<xsl:value-of select="$FSRowCount"/>
																</xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="rowspan">4</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<span style="width:34mm;">
															<xsl:call-template name="PopulatePercent">
																<xsl:with-param name="TargetNode" select="../ProRataShareSubpartFIncomeRt"/>
															</xsl:call-template>
														</span>
													</td>-->
														<td class="styIRS5471TableLastCol" id="FSspcr"/>
													</tr>
													<xsl:if test="position()=last()">
														<xsl:call-template name="AddSubRowsB2">
															<xsl:with-param name="RowNumber" select="position()"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<tr>
														<td class="styTableCell" style="border-color:black; width:50mm; text-align:left;padding-top:0.5mm;padding-bottom:0.5mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="StockClassDesc"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left; text-size:5mm; border-color:black; width:29mm;padding-top:0.5mm;padding-bottom:0.5mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
														<td class="styTableCell" style="text-align:left; text-size:5mm; border-color:black; width:29mm; border-right-width:0px;padding-top:0.5mm;padding-bottom:0.5mm;">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
															</xsl:call-template>
															<span class="styTableCellPad"/>
														</td>
<!--														<td class="styIRS5471TableLastCol" id="FSspcr" style=""/>-->
													</tr>
													<xsl:if test="position()=last()">
														<xsl:call-template name="AddSubRows3Col">
															<xsl:with-param name="RowNumber" select="position()"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:for-each>
									</xsl:if>
								</xsl:for-each>
								<xsl:call-template name="AddRowsScheduleB2">
									<xsl:with-param name="NumOfRows" select="5"/>
									<xsl:with-param name="ShareholdersCount" select="count($IRS5471BData/DirectShareholdersForeignCorp)"/>
									<xsl:with-param name="StockSetsCount" select="count($IRS5471BData/DirectShareholdersForeignCorp[count(ForeignCorporationStocks) &gt; 4])"/>
								</xsl:call-template>
							</tbody>
						</table>
					</div>
					<xsl:if test="($Print != $Separated) and (count($IRS5471BData/DirectShareholdersForeignCorp) &gt; 5)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$IRS5471BData/DirectShareholdersForeignCorp"/>
							<xsl:with-param name="containerHeight" select="5"/>
							<xsl:with-param name="containerID" select=" 'DSctn' "/>
						</xsl:call-template>
					</xsl:if>
					<!--  END PART II of SCHEDULE B   -->
					<!--BEGIN FOOTER-->
					<div style="width:187mm; border-color:black; border-style:solid; border-right-width:0px; border-left-width:0px; border-top-width:1px; border-bottom-width:0px">
						<div style="float:right;">
                        Form <span class="styBoldText" style="font-size:8pt">5471</span> (Rev. 12-2021)
                      </div>
					</div>
					<!--<div class="pageEnd"/>-->
					<p style="page-break-before:always"/>
					<!--END FOOTER-->
					<!--BEGIN PAGE HEADER-->
					<div class="styGenericDiv" style="width:187mm;">
						<div style="float:left; clear:none">Form 5471 (Rev. 12-2021)</div>
						<div style="float:right;"> Page <span class="styBoldText" style="font-size:8pt;">3</span>
						</div>
					</div>
					<!--END PAGEHEADER-->
					<br/>
					<!--  BEGIN SCHEDULE C   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width:22mm;">Schedule C</div>
						<div class="styPartDesc" style="width:165mm;">Income Statement
								 <span style="font-size:8pt; width:80mm; font-weight:normal;">
								 (see instructions)</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styLNDesc" style="height:auto; width:187mm; font-size:8pt; font-style:italic;">
							<span style="font-weight:normal">
								<b>Important: </b>
							</span>
							    Report all information in functional currency in accordance with U.S. GAAP.  Also, 
							    report each amount in  U.S.  <br/>
								dollars translated from functional currency (using GAAP translation rules).  However, 
								if the  functional currency is the U.S.<br/>
								 dollar, complete only the U.S. Dollars column.  See instructions for special rules
								  for DASTM corporations. 
							</div>
					</div>
					<!--   BEGIN LINE 1 of Schedule C   -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS5471Img" style="height:60mm; padding-left:4mm; width:12mm; padding-top:22mm;">
							<img src="{$ImagePath}/5471_Income.gif" alt="Income"/>
						</div>
						<!--   BEGIN LINE 1A of Schedule C  -->
						<div style="height:52mm; width:175mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.25mm;"/>
							<div class="styLNDesc" style="width:89mm; height:4mm;">	
						</div>
							<div class="styLNRightNumBox" style="border-top-width:0px; border-left-width:0px; border-bottom-width:0px; height:4mm; "/>
							<div class="styLNAmountBox" style="width:35mm; height:4mm; text-align:center;">
								<b>Functional Currency</b>
							</div>
							<div class="styLNAmountBox" style="width:35mm; height:4mm; text-align:center;">
								<b>U.S. Dollars</b>
							</div>
							<!--   END LINE 1 of Schedule C  -->
							<!--   BEGIN LINE 1A of Schedule C  -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left:2.25mm;">1a</div>
								<div class="styLNDesc" style="width:89mm;">Gross receipts or sales
									<span class="styDotLn" style="float:right; padding-right:1mm;">..............</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm; border-top-width:1px;">1a</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossReceiptsOrSalesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 1A of Schedule C  -->
							<!--   BEGIN LINE 1B of Schedule C -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left:4mm">b</div>
								<span>
									</span>
								<div class="styLNDesc" style="width:89mm;">Returns and allowances
									<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
								</div>
								<div class="styLNRightNumBox" style="height:4mm">1b</div>
								<div class="styLNAmountBox" style="width:35mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignReturnsAndAllowancesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USReturnsAndAllowancesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 1B of Schedule C  -->
							<!--   BEGIN LINE 1C of Schedule C   -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 4mm">c</div>
								<div class="styLNDesc" style="width:89mm;">Subtract line 1b from line 1a
									<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
								</div>
								<div class="styLNRightNumBox">1c</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignNetGrossReceiptsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USNetGrossReceiptsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 1C of Schedule C   -->
							<!--   END LINE 1   -->
							<!--   BEGIN LINE 2 of Schedule C  -->
							<div>
								<div class="styLNLeftNumBoxSD">2</div>
								<div class="styLNDesc" style="width:89mm;">Cost of goods sold
									<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
								</div>
								<div class="styLNRightNumBox">2</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCostOfGoodsSoldAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCostOfGoodsSoldAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 2 of Schedule C   -->
							<!--   BEGIN LINE 3 of Schedule C  -->
							<div>
								<div class="styLNLeftNumBoxSD">3</div>
								<div class="styLNDesc" style="width:89mm;">Gross profit (subtract line 2 from line 1c)
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
								</div>
								<div class="styLNRightNumBox">3</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossProfitAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossProfitAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--   END LINE 3 of Schedule C  -->
							<!--   BEGIN LINE 4 of Schedule C  -->
							<div>
								<div class="styLNLeftNumBoxSD">4</div>
								<div class="styLNDesc" style="width:89mm;">Dividends
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</div>
								<div class="styLNRightNumBox">4</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDividendsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USDividendsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 4 of Schedule C   -->
							<!--   BEGIN LINE 5 of Schedule C  -->
							<div>
								<div class="styLNLeftNumBoxSD">5</div>
								<div class="styLNDesc" style="width:89mm;">Interest
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
								</div>
								<div class="styLNRightNumBox">5</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignInterestIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USInterestIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 5 of Schedule C  -->
							<!--   BEGIN LINE 6a of Schedule C  -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 2.25mm">6a</div>
								<div class="styLNDesc" style="width:89mm;">Gross rents
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</div>
								<div class="styLNRightNumBox">6a</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignGrossRentsAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrossRentsAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 6a of Schedule C  -->
							<!--   BEGIN LINE 6b of Schedule C  -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
								<div class="styLNDesc" style="width:89mm;">Gross royalties and license fees
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
								<div class="styLNRightNumBox">6b</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnGrRoyaltiesAndLcnsFeesAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USGrRoyaltiesAndLcnsFeesAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 6b of Schedule C  -->
							<!--   BEGIN LINE 7 of Schedule C   -->
							<div>
								<div class="styLNLeftNumBoxSD">7</div>
								<div class="styLNDesc" style="width:89mm;">Net gain or (loss) on sale of capital assets
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</div>
								<div class="styLNRightNumBox">7</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnNetGainOrLossSaleCapAstAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USNetGainOrLossSaleCapAstAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 7 of Schedule C   -->
							<!--   BEGIN LINE 8a of Schedule C  -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left:2.25mm;">8a</div>
								<div class="styLNDesc" style="width:89mm;">Foreign currency transaction gain or loss &#8211; unrealized
									<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
								</div>
								<div class="styLNRightNumBox">8a</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnCurTransGainLossUnrlzdAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCurTransGainLossUnrlzdAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 8a of Schedule C  -->
							<!--   BEGIN LINE 8b of Schedule C  -->
							<div>
								<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
								<div class="styLNDesc" style="width:89mm;">Foreign currency transaction gain or loss &#8211; realized
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
								</div>
								<div class="styLNRightNumBox">8b</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnCurTransGainLossrlzdAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USCurTransGainLossRlzdAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 8b of Schedule C  -->
							<!--   BEGIN LINE 9 of Schedule C   -->
							<div>
								<div class="styLNLeftNumBoxSD">9</div>
								<div class="styLNDesc" style="width:89mm;">Other income (attach statement)
									<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
								</div>
								<div class="styLNRightNumBox">9</div>
								<div class="styLNAmountBox" style="width:35mm;">
									<span style="float:left">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherIncomeAmt"/>
										</xsl:call-template>
									</span>
									<span style="float:right">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherIncomeAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNAmountBox" style="width:35mm;height: 4mm">
									<span style="float:left; clear:none">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherIncomeAmt"/>
										</xsl:call-template>
									</span>
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
							<!--  END LINE 9 of Schedule C   -->
							<!--  BEGIN LINE 10 of Schedule C    -->
							<div>
								<div class="styLNLeftNumBox">10</div>
								<div class="styLNDesc" style="width:89mm;">Total income (add lines 3 through 9)
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
								</div>
								<div class="styLNRightNumBox" style="border-bottom-width: 0px;">10</div>
								<div class="styLNAmountBox" style="width:35mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTotalIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:35mm;border-bottom-width: 0px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalIncomeAmt"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--  END LINE 10 of Schedule C   -->
					<!--   BEGIN LINE 11 of Schedule C  -->
					<div style="width:187mm">
						<div class="styIRS5471Img" style="height:40mm;width:12mm;padding-top:12mm; padding-left:4mm;border-bottom-width: 1px">
							<img src="{$ImagePath}/5471_Deductions.gif" alt="Deductions"/>
						</div>
						<div>
							<!-- this is the place II -->
							<div class="styLNLeftNumBox">11</div>
							<div class="styLNDesc" style="width:89mm;">Compensation not deducted elsewhere
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox">11</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCompensationNotDedAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USCompensationNotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 11 of Schedule C  -->
						<!--   BEGIN LINE 12a of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox">12a</div>
							<div class="styLNDesc" style="width:89mm;">Rents
									<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
							<div class="styLNRightNumBox">12a</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignRentsAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USRentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 12a of Schedule C   -->
						<!--   BEGIN LINE 12b of Schedule C   -->
						<div>
							<div class="styLNLeftNumBoxSD" style="padding-left:5mm;">b</div>
							<div class="styLNDesc" style="width:89mm;">Royalties and license fees
									<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
							<div class="styLNRightNumBox">12b</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnRoyaltiesAndLcnsFeesAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USRoyaltiesAndLcnsFeesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 12b of Schedule C    -->
						<!--   BEGIN LINE 13 of Schedule C    -->
						<div>
							<div class="styLNLeftNumBox">13</div>
							<div class="styLNDesc" style="width:89mm;">Interest
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
							</div>
							<div class="styLNRightNumBox">13</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignInterestDeductionAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USInterestDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 13 of Schedule C    -->
						<!--   BEGIN LINE 14 of Schedule C    -->
						<div>
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDesc" style="width:89mm;">Depreciation not deducted elsewhere
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox">14</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDepreciationNotDedAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USDepreciationNotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 14 of Schedule C    -->
						<!--   BEGIN LINE 15 of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox">15</div>
							<div class="styLNDesc" style="width:89mm;">Depletion
									<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
							</div>
							<div class="styLNRightNumBox">15</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignDepletionAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USDepletionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 15 of Schedule C   -->
						<!--   BEGIN LINE 16 of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox">16</div>
							<div class="styLNDesc" style="width:89mm;">Taxes (exclude income tax expense (benefit))
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox">16</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTaxesAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USTaxesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 16 of Schedule C   -->
						<!--   BEGIN LINE 17 of Schedule C    -->
						<div>
							<div class="styLNLeftNumBox" style="height:8mm">17</div>
							<div class="styLNDesc" style="width:89mm;height:8mm">
                                    Other deductions (attach statement &#8211; exclude income tax expense (benefit))
 									<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">17</div>
							<div class="styLNAmountBox" style="width: 35mm;height: 8mm;padding-top:4mm">
								<div style="float: left; clear:none">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignOtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width: 35mm;height: 8mm;padding-top:4mm">
								<div style="float:left; clear:none">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductionsAmt"/>
									</xsl:call-template>
								</div>
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 17 of Schedule C    -->
						<br/>
						<!--   BEGIN LINE 18 of Schedule C    -->
						<div>
							<div class="styLNLeftNumBoxSD" style="border-color:black; border-style:solid; padding-left:1mm; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px;">18</div>
							<div class="styLNDesc" style="border-color:black; border-style:solid; border-left-width:0px; border-right-width:0px; border-top-width:0px; width:89mm; border-bottom-width: 1px;">
									Total deductions (add lines 11 through 17)
									<span class="styDotLn" style="float:right; padding-right:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox">18</div>
							<div class="styLNAmountBox" style="width:35mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignTotalDeductionsAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  END LINE 18 of Schedule C    -->
					<!--   BEGIN NETINCOME of Schedule C  -->
					<div style="width:187mm">
						<div class="styIRS5471Img" style="height:27mm; width:12mm; padding-top:3mm; padding-left:4mm;border-bottom-width:1px; ">
							<img src="{$ImagePath}/5471_NetIncome.gif" alt="Net Income"/>
						</div>
						<!--   BEGIN LINE 19 of Schedule C -->
						<div>
							<div class="styLNLeftNumBox">19</div>
							<div class="styLNDesc" style="width:89mm;">
									Net income or (loss) before unusual or infrequently occurring items,
								</div>
							<div class="styLNRightNumBox" style="background-color: lightgrey;
								 border-bottom-width: 0px">
								<span style="width: 1px"/>
							</div>
							<div class="styLNAmountBox" style="width:35mm;background-color:lightgrey; border-bottom-width: 0px">
								<span style="width: 1px"/>
							</div>
							<div class="styLNAmountBox" style="border-bottom-width: 0px; background-color: lightgrey; width:35mm">
								<span style="width: 1px"/>
							</div>
						</div>
						<div>
							<div class="styLNLeftNumBox"/>
							<div class="styLNDesc" style="width:89mm;">and income tax expense (benefit) (subtract line 18 from line 10)
									<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>
							</div>
							<div class="styLNRightNumBox">19</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnTotalIncomeMinusTotDedAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USTotalIncomeMinusTotDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 19 of Schedule C   -->
						<!--   BEGIN LINE 20 of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox">20</div>
							<div class="styLNDesc" style="width:89mm;">
								Unusual or infrequently occurring items
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm;">20</div>
							<div class="styLNAmountBox" style="width:35mm;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnUnusualInfrqntOccurItemAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm;height:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USUnusualInfrqntOccurItemAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<br/>
						<!--  END LINE 20 of Schedule C  -->
						<!--   BEGIN LINE 21a of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox" style="height:4mm"> 21a</div>
							<div class="styLNDesc" style="width:89mm;height:4mm">
								    Income tax expense (benefit) &#8211; current
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm">21a</div>
							<div class="styLNAmountBox" style="width:35mm; height:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnCurrentIncomeTaxExpenseAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm; height:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USCurrentIncomeTaxExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 21a of Schedule C  -->
						<!--   BEGIN LINE 21b of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox" style="height:4mm; padding-left:4.5mm;">b</div>
							<div class="styLNDesc" style="width:89mm;height:4mm">
								    Income tax expense (benefit) &#8211; deferred
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4mm">21b</div>
							<div class="styLNAmountBox" style="width:35mm; height:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnDefrdIncomeTaxExpenseAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm; height:4mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USDefrdIncomeTaxExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 21b of Schedule C  -->
						<!--   BEGIN LINE 22 of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox" style="height:7mm;border-color:black; border-style:solid; padding-left:1mm; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px;">22</div>
							<div class="styLNDesc" style="width:89mm; height:7mm; border-color:black; border-style:solid; border-left-width:0px; border-right-width:0px; border-top-width:0px; width:89mm; border-bottom-width: 1px;">
									Current year net income or (loss) per books (combine lines 19 through 21b)
									<span class="styDotLn" style="float:right; padding-right:1mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:7mm; border-bottom-width:1px; padding-top:3.5mm;">22</div>
							<div class="styLNAmountBox" style="height:7mm; padding-top:3.5mm; width:35mm; border-bottom-width:1px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCYNetIncomePerBooksAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="height:7mm; padding-top:3.5mm; border-bottom-width: 1px; width:35mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USCYNetIncomePerBooksAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  END LINE 22 of Schedule C -->
					<!--   BEGIN Other Comprehensive INCOME of Schedule C  -->
					<div style="width:187mm">
						<div class="styIRS5471Img" style="height:27mm; width:12mm; border-bottom-width:0px; ">
							<img src="{$ImagePath}/5471_OtherComprenhensiveIncome.gif" alt="Other Comprehensive Income"/>
						</div>
						<!--   BEGIN LINE 23a of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm;">23a</div>
							<div class="styLNDesc" style="width:89mm;height:6mm;padding-top:2mm; ">
								Foreign currency translation adjustments
								<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">23a</div>
							<div class="styLNAmountBox" style="width:35mm;height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/ForeignCurrencyTrnslAdjAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm;height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USCurrencyTrnslAdjAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 23a of Schedule C  -->
						<!--   BEGIN LINE 23b of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm; padding-left:4.5mm;">b</div>
							<div class="styLNDesc" style="width:89mm;height:6mm;padding-top:2mm;">
								    Other
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">23b</div>
							<div class="styLNAmountBox" style="width:35mm; height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnOthComprehensiveIncomeAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm; height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USOthComprehensiveIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 23b of Schedule C  -->
						<!--   BEGIN LINE 23c of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox" style="height:6mm;padding-top:2mm; padding-left:4.5mm;">c</div>
							<div class="styLNDesc" style="width:89mm;height:6mm;padding-top:2mm;">
								    Income tax expense (benefit) related to other comprehensive income
									<!--<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>-->
							</div>
							<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">23c</div>
							<div class="styLNAmountBox" style="width:35mm; height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnIncmTxExpnsOtherIncomeAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm; height:6mm;padding-top:2mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USIncmTxExpnsOtherIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--  END LINE 23c of Schedule C  -->
						<!--   BEGIN LINE 24 of Schedule C   -->
						<div>
							<div class="styLNLeftNumBox" style="height:9mm;padding-top:2mm;">24</div>
							<div class="styLNDesc" style="width:89mm;height:9mm; ">
								Other comprehensive income (loss), net of tax (line 23a plus line 23b less line 23c)
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
							</div>
							<div class="styLNRightNumBox" style="height:9mm;padding-top:3mm;border-bottom-width:0px;">24</div>
							<div class="styLNAmountBox" style="height:9mm; padding-top:4mm; width:35mm; border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/FrgnOtherCmprhnsvIncmLossAmt"/>
									<xsl:with-param name="MaxSize" select="17"/>
								</xsl:call-template>
							</div>
							<div class="styLNAmountBox" style="width:35mm;height:9mm;padding-top:4mm;border-bottom-width: 0px; ">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471CData/USOtherCmprhnsvIncmLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--  END LINE 24 of Schedule C -->
					<!--BEGIN FOOTER of Page 3-->
					<div style="width:187mm; border-color: black; border-style: solid; 
					border-right-width: 0px; border-left-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float:right">
                        Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2021)
                      </div>
					</div>
					<!--<div class="pageEnd"/>-->
					<p style="page-break-before:always"/>
					<!--END FOOTER-->
					<!--BEGIN HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2021)</div>
						<div style="float:right"> Page <span class="styBoldText" style="font-size: 8pt">4</span>
						</div>
					</div>
					<!--END HEADER-->
					<br/>
					<!--   BEGIN SCHEDULE F HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm;">Schedule F</div>
						<div class="styPartDesc" style="width: 165mm;">Balance Sheet
								 </div>
					</div>
					<div class="styGenericDiv" style="width: 187mmm; font-size: 8pt">
						<span class="styBoldText">Important:</span>
						<span class="styItalicText" style="padding-left:1mm">Report all amounts in U.S. dollars 
						prepared and translated in accordance with U.S. GAAP.  See instructions</span>
					</div>
					<div class="styBB" style="width: 187mm; font-size: 8pt">
						<span class="styItalicText" style="width: 149mm"> for an exception for DASTM corporations.</span>
					</div>
					<!--   END SCHEDULE F HEADER   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNDesc" style="width:108mm; font-size:8pt; height:11mm; text-align:center; border-color:black; border-style:solid; border-bottom-width:1px; 						        border-top-width:0; border-left-width:0; border-right-width:0;">
							<b>
								<br/>Assets</b>
						</div>
						<div class="styLNRightNumBox" style="height: 11mm;"/>
						<div class="styLNAmountBox" style="height: 11mm; text-align: center; width: 34mm">
							<b>(a)</b>
							<br/>Beginning of annual<br/>accounting period</div>
						<div class="styLNAmountBox" style="height: 11mm; text-align: center; 
						width: 37mm">
							<b>(b)</b>
							<br/>End of annual<br/>accounting period</div>
					</div>
					<!--   BEGIN LINE 1 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">1</div>
						<div class="styLNDesc" style="width:100mm">Cash
							<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
						</div>
						<div class="styLNRightNumBox">1</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdCashAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdCashAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 1   -->
					<!--   BEGIN LINE 2 SCHEDULE F  -->
					<!--   BEGIN LINE 2A   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.25mm">2a</div>
						<div class="styLNDesc" style="width: 100mm">Trade notes and accounts receivable
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox">2a</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTradeNotesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTradeNotesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 2A   -->
					<!--   BEGIN LINE 2B SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
						<div class="styLNDesc" style="width: 100mm">Less allowance for bad debts
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox">2b</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdBadDebtAllwncAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdBadDebtAllwncAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 2B   -->
					<!--   END LINE 2   -->
					<!--   BEGIN LINE 3 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">3</div>
						<div class="styLNDesc" style="width: 100mm">Derivatives
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox">3</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdDerivativesAstAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdDerivativesAstAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4 SCHEDULE F   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">4</div>
						<div class="styLNDesc" style="width: 100mm">Inventories
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox">4</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdInventoriesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdInventoriesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 4   -->
					<!--   BEGIN LINE 5 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">5</div>
						<div class="styLNDesc" style="width: 100mm">Other current assets (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">5</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrAssetsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrAssetsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrAssetsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrAssetsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 5   -->
					<!--   BEGIN LINE 6 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">6</div>
						<div class="styLNDesc" style="width: 100mm">Loans to shareholders and other related persons
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox">6</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLoansToShrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLoansToShrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 6   -->
					<!--   BEGIN LINE 7 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">7</div>
						<div class="styLNDesc" style="width: 100mm">Investment in subsidiaries (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">7</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdInvstSubsidiaryAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdInvstSubsidiaryAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float:left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdInvstSubsidiaryAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdInvstSubsidiaryAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 7   -->
					<!--   BEGIN LINE 8 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBoxSD">8</div>
						<div class="styLNDesc" style="width: 100mm">Other investments (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">8</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthInvestmentsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthInvestmentsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthInvestmentsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthInvestmentsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 8   -->
					<!--   BEGIN LINE 9   -->
					<!--   BEGIN LINE 9A SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.25mm">9a</div>
						<div class="styLNDesc" style="width: 100mm">Buildings and other depreciable assets
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">9a</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdBldgAndOtherAstAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdBldgAndOtherAstAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 9A   -->
					<!--   BEGIN LINE 9B SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
						<div class="styLNDesc" style="width: 100mm">Less accumulated depreciation
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">9b</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetAccumDeprecAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetAccumDeprecAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 9B   -->
					<!--  END LINE 9   -->
					<!--   BEGIN LINE 10   -->
					<!--   BEGIN LINE 10A SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2.25mm">10a</div>
						<div class="styLNDesc" style="width: 100mm">Depletable assets
							<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
						</div>
						<div class="styLNRightNumBox">10a</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdDepletableAstAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdDepletableAstAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 10A   -->
					<!--   BEGIN LINE 10B SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
						<div class="styLNDesc" style="width: 100mm">Less accumulated depletion
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox">10b</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetAccumDpltnAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetAccumDpltnAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 10B   -->
					<!--  END LINE 10   -->
					<!--   BEGIN LINE 11 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">11</div>
						<div class="styLNDesc" style="width: 100mm">Land (net of any amortization)
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox">11</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLandAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLandAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 11   -->
					<!--   BEGIN LINE 12 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">12</div>
						<div class="styLNDesc" style="width: 100mm">Intangible assets:</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm; height: 4.5mm"/>
					</div>
					<!--  END LINE 12   -->
					<!--   BEGIN LINE 12A SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">a</div>
						<div class="styLNDesc" style="width: 100mm">Goodwill
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox">12a</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdGoodwillAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdGoodwillAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 12A   -->
					<!--   BEGIN LINE 12B SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">b</div>
						<div class="styLNDesc" style="width: 100mm">Organization costs
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox">12b</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOrgCostAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOrgCostAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 12B   -->
					<!--   BEGIN LINE 12C SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">c</div>
						<div class="styLNDesc" style="width: 100mm">Patents, trademarks, and other intangible assets
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox">12c</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPatentsOthAstAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPatentsOthAstAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 12C   -->
					<!--   BEGIN LINE 12D SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 4mm">d</div>
						<div class="styLNDesc" style="width: 100mm">Less accumulated amortization for lines 12a, 12b, and 12c
							<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
						</div>
						<div class="styLNRightNumBox">12d</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetAccumAmortzAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetAccumAmortzAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 12d   -->
					<!--   BEGIN LINE 13 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">13</div>
						<div class="styLNDesc" style="width: 100mm">Other assets (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">13</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherAssetsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherAssetsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherAssetsAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherAssetsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 13   -->
					<!--   BEGIN LINE 14A SCHEDULE F  -->
					<!--<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox"></div>
						<div class="styLNDesc" style="width: 100mm"></div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm; height: 4.5mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm; height: 4.5mm"/>
					</div>-->
					<!--   END LINE 14A   -->
					<!--   BEGIN LINE 14B SCHEDULE F  -->
					<div class="styBB" style="width: 187mm">
						<div class="styLNLeftNumBox">14</div>
						<div class="styLNDesc" style="width: 100mm">Total assets
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px">14</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px;width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTotalAssetsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px;width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTotalAssetsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 14B   -->
					<!--   END LINE 1-14   -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNDesc" style="width:108mm;font-size:8pt;height:6mm;text-align:center;
						        border-color:black;border-style:solid;border-bottom-width:1px;
						        border-top-width:0;border-left-width:0;border-right-width:0;">
							<b>Liabilities and Shareholders' Equity</b>
						</div>
						<div class="styLNRightNumBox" style="height: 6mm; background-color: lightgrey;border-bottom-width:1px"/>
						<div class="styLNAmountBox" style="width: 34mm; height: 6mm; background-color: lightgrey;
						;border-left:width:0px; border-bottom-width: 1px;border-left-width:0;border-right-width:0;"/>
						<div class="styLNAmountBox" style="width: 37mm; height: 6mm; border-bottom-width: 1px; 
						background-color: lightgrey;border-left-width:0;border-right-width:0;"/>
					</div>
					<!--   BEGIN LINE 15 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">15</div>
						<div class="styLNDesc" style="width: 100mm">Accounts payable
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox" style="border-top-width:0px">15</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdAccountsPayableAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdAccountsPayableAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 15   -->
					<!--   BEGIN LINE 16 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm;">
						<div class="styLNLeftNumBox">16</div>
						<div class="styLNDesc" style="width: 100mm">Other current liabilities (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">16</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrLiabAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOtherCurrLiabAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrLiabAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOtherCurrLiabAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 16   -->
					<!--   BEGIN LINE 17 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">17</div>
						<div class="styLNDesc" style="width: 100mm">Derivatives
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox">17</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdDerivativesLiabAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdDerivativesLiabAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 17   -->
					<!--   BEGIN LINE 18 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">18</div>
						<div class="styLNDesc" style="width: 100mm">Loans from shareholders and other related persons
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox">18</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdLoansFromShrAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdLoansFromShrAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 18   -->
					<!--   BEGIN LINE 19 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width: 100mm">Other liabilities (attach statement)
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">19 </div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthLiabilitiesAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdOthLiabilitiesAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthLiabilitiesAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdOthLiabilitiesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 19   -->
					<!--   BEGIN LINE 20 SCHEDULE F  -->
					<div class="styGenericDiv">
						<div class="styLNLeftNumBox">20</div>
						<div class="styLNDesc" style="width: 100mm">Capital stock:</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm"/>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm"/>
					</div>
					<!--  END LINE 20   -->
					<!--   BEGIN LINE 20A SCHEDULE F  -->
					<div class="styGenericDiv">
						<div class="styLNLeftLtrBoxDD">a</div>
						<div class="styLNDesc" style="width: 100mm">Preferred stock
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
						<div class="styLNRightNumBox">20a</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPreferredStockAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPreferredStockAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 20A   -->
					<!--   BEGIN LINE 20B SCHEDULE F  -->
					<div class="styGenericDiv">
						<div class="styLNLeftLtrBoxDD">b</div>
						<div class="styLNDesc" style="width: 100mm">Common stock
							<span class="styDotLn" style="float:right;padding-right:1mm;">...................</span>
						</div>
						<div class="styLNRightNumBox">20b</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdCommonStockAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdCommonStockAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 20B   -->
					<!--   BEGIN LINE 21 SCHEDULE F  -->
					<div class="styGenericDiv">
						<div class="styLNLeftNumBox">21</div>
						<div class="styLNDesc" style="width: 100mm">Paid-in or capital surplus (attach reconciliation)
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styLNRightNumBox" style="height: 4.7mm">21</div>
						<div class="styLNAmountBox" style="width: 34mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPaidInOrSurplusAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdPaidInOrSurplusAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm;height: 4.7mm">
							<div style="float: left; clear:none">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPaidInOrSurplusAmt"/>
								</xsl:call-template>
							</div>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdPaidInOrSurplusAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 21   -->
					<!--   BEGIN LINE 22 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">22</div>
						<div class="styLNDesc" style="width: 100mm">Retained earnings
							<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
						</div>
						<div class="styLNRightNumBox">22</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdRtnEarningsAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdRtnEarningsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 22   -->
					<!--   BEGIN LINE 23 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">23</div>
						<div class="styLNDesc" style="width: 100mm">Less cost of treasury stock
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
						</div>
						<div class="styLNRightNumBox">23</div>
						<div class="styLNAmountBox" style="width: 34mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdNetCostOfTrStkAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="width: 37mm">
							<xsl:call-template name="PopulateNegativeNumber">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdNetCostOfTrStkAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  END LINE 23   -->
					<!--   BEGIN LINE 24 SCHEDULE F  -->
					<div class="styGenericDiv" style="width: 187mm">
						<div class="styLNLeftNumBox">24</div>
						<div class="styLNDesc" style="width: 100mm">Total liabilities and shareholders' equity
						<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width: 0px">24</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/BegngAcctPrdTotLiabShrEqtyAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNAmountBox" style="border-bottom-width: 0px; width: 37mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$IRS5471FData/EndAcctPrdTotLiabShrEqtyAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--   END LINE 24   -->
					<!--   END LINE 15-24   -->
					<!--   END SCHEDULE F   -->
					<!--BEGIN FOOTER Page 4-->
					<div style="width:187mm; border-color: black; border-style: solid;
					 border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; 
					 border-bottom-width: 0px">
						<div style="float:right">
                        Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2021)
                        </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<p style="page-break-before:always"/>
					<!--BEGIN Page 5 HEADER-->
					<div class="styGenericDiv" style="width:187mm">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2021)</div>
						<div style="float:right">
                         Page <span class="styBoldText" style="font-size: 8pt">5</span>
						</div>
					</div>
					<!--END Page 5 HEADER-->
					<!--   Customer Dina Cueliar concur on 10/01/2018
							1. 5471 Schedule C , US Dollars column right border will not be display to be consistence with the rest of the form design.
							2.	5471 Schedule C, last vertical image PDF shows this 
							3.	5471 Schedule G, Line 5a and 14a.  The sentence begin with “If yes,” is display in the next line to be consistence with Line 1-3 above the design of the form.
							4.	5471, Schedule I Line 1b and 1c, left side  the “1” is omit to be consistence with the rest of the form design.
				-->
					<!--   BEGIN SCHEDULE G   -->
					<!-- Text was updated to be able to taturally wrap according to SS design and codeing documents -->
					<!--   BEGIN SCHEDULE G HEADER   -->
					<div class="styBB" style="width:187mm; border-top: 1px solid black;">
						<div class="styPartName" style="width: 22mm; float: left;">Schedule G</div>
						<div class="styPartDesc" style="width: 165mm;">
							<span style="width:16px; float: left;"/>Other Information</div>
					</div>
					<!--   END SCHEDULE G HEADER   -->
					<div class="styGenericDiv" style="font-size:8pt">
						<span class="styLNDesc" style="font-size:8pt; width:170mm;"/>
						<span>
							<label id="ScheduleGYesLabel">
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">Owns10PercenttOrMoreForeignPartnershipYesLabel</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
							<span style="width: 1mm"/>
							<label>
								<xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">Owns10PercenttOrMoreForeignPartnershipNoLabel</xsl:with-param>
								</xsl:call-template>
								<b>&#160;No</b>
							</label>
						</span>
					</div>
					<!--   BEGIN LINE 1 of Schedule G -->
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNLeftNumBoxSD">1</span>
						<span class="styLNDesc" style="width:175mm;">
							During the tax year, did the foreign corporation own at least a 10% interest, directly or indirectly, in any foreign partnership? 
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
							<span style="float:left">
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">......................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Owns 10 Percent Or More Foreign Partnership Indicator Yes" class="styCkbox" style="width:3mm; height:3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">Owns10PctOrMoreForeignPartnershipIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px;"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Owns 10 Percent Or More Foreign Partnership Indicator No" class="styCkbox" style="width:3mm; height:3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/Owns10PctOrMoreFrgnPrtshpInd"/>
									<xsl:with-param name="BackupName">Owns10PctOrMoreForeignPartnershipIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="margin-left:8mm;">
							If "Yes," see the instructions for required statement.
						</span>
					</div>
					<!--   BEGIN LINE 2 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">2</span>
						<span class="styLNDesc" style="width:162mm;">
							<span style="float:left">During the tax year, did the foreign corporation own an interest in any trust? </span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Corporation Owns Interest In Any Trust Indicator Yes" class="styCkbox" style="width:3mm; height:3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
									<xsl:with-param name="BackupName">ForeignCorporationOwnsInterestInTrustIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width:10px;"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Corporation Owns Interest In Any Trust Indicator No" class="styCkbox" style="width:3mm; height:3mm">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsInterestInTrustInd"/>
									<xsl:with-param name="BackupName">ForeignCorporationOwnsInterestInTrustIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 2 of Schedule G  -->
					<!--   BEGIN LINE 3 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">3</span>
						<span class="styLNDesc" style="width:175mm;">
							<span style="float:left">
									During the tax year, did the foreign corporation own any foreign entities that were disregarded as separate from their
									owner under 
							</span>
						</span>
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styLNDesc" style="width:162mm; margin-left: 8mm;">
								Regulations sections 301.7701-2 and 301.7701-3 or did the foreign corporation own any foreign branches (see instructions)?
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
									<xsl:with-param name="BackupName">ForeignCorporationOwnsForeignEntity</xsl:with-param>
								</xsl:call-template>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Foreign Owns Any Foreign Entities Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
										<xsl:with-param name="BackupName">ForeignCorporationOwnsForeignEntityIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width:10px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Foreign Owns Any Foreign Entities Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpOwnsForeignEntityInd"/>
										<xsl:with-param name="BackupName">ForeignCorporationOwnsForeignEntityIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="margin-left:8mm;">
							If "Yes," you are generally required to attach Form 8858 for each entity (see instructions).
						</span>
					</div>
					<!--   END LINE 3 of Schedule G  -->
					<!--   BEGIN LINE 4a of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">4a</span>
						<span class="styLNDesc" style="width:175mm">
							<span style="float:left">
							During the tax year, did the filer pay or accrue any base erosion payment under section 59A(d) to the foreign corporation or did 
							<br/>the filer have a base erosion tax benefit under section 59A(c)(2) with respect to a base erosion payment made or accrued to the
							<br/>foreign corporation (see instructions)?  
							 <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/BaseErosionPaymentBenefitInd"/>
									<xsl:with-param name="BackupName">BaseErosionPaymentBenefitInd</xsl:with-param>
								</xsl:call-template>
							</span>
						</span>
						<div class="styGenericDiv" style="width: 187mm">
							<span class="styLNDesc" style="width: 162mm; margin-left: 8mm; height:6mm;">
								<span class="styDotLn" style="float:right;padding-right:1mm;padding-top:2mm;">............................</span>
							</span>
							<span style="padding-top:2mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/BaseErosionPaymentBenefitInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Base Erosion Payment Benefit Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/BaseErosionPaymentBenefitInd"/>
										<xsl:with-param name="BackupName">BaseErosionPaymentBenefitIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width: 10px"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/BaseErosionPaymentBenefitInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Base Erosion Payment Benefit Indicator No" class="styCkbox" style="width: 3mm; height: 3mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/BaseErosionPaymentBenefitInd"/>
										<xsl:with-param name="BackupName">BaseErosionPaymentBenefitIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="margin-left:8mm;">
							If “Yes,” complete lines 4b and 4c.
						</span>
					</div>
					<!--   END LINE 4a of Schedule G  -->
					<!--   BEGIN LINE 4b of Schedule G   -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</span>
						<span class="styLNDesc" style="width:162mm;">
							<span style="float:left">Enter the total amount of the base erosion payments </span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<span style="width:1mm"/>$
								<span class="sty1120FItemUnderlineSM" style="width:22mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/BaseErosionPaymentAmt"/>
								</xsl:call-template>
							</span>
							<!--<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>-->
						</span>
					</div>
					<!--   END LINE 4b of Schedule G  -->
					<!--   BEGIN LINE 4c of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">c</span>
						<span class="styLNDesc" style="width:162mm;">
							<span style="float:left">Enter the total amount of the base erosion tax benefit </span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<span style="width:1mm"/>$
								<span class="sty1120FItemUnderlineSM" style="width:22mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/BaseErosionTaxBenefitAmt"/>
								</xsl:call-template>
							</span>
							<!--<span class="styDotLn" style="float:right;padding-right:1mm;">..............</span>-->
						</span>
					</div>
					<!--   END LINE 4c of Schedule G  -->
					<!--   BEGIN LINE 5a of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">5a</span>
						<span class="styLNDesc" style="width:175mm;">
							<span style="float:left">
								During the tax year, did the foreign corporation pay or accrue any interest or royalty for which the deduction is not allowed under 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/NondedIntRoyaltyUndSect267AInd"/>
									<xsl:with-param name="BackupName">IRS5471NondedIntRoyaltyUndSect267A</xsl:with-param>
								</xsl:call-template>
							</span>
						</span>
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styLNDesc" style="width:162mm; margin-left: 8mm;">
								<span style="float:left;">section 267A? </span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">...................................</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/NondedIntRoyaltyUndSect267AInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Non deduction interest royalty under section 267A Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/NondedIntRoyaltyUndSect267AInd"/>
										<xsl:with-param name="BackupName">NonDeductionInterestRoyaltyUnderSection267AIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width:10px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/NondedIntRoyaltyUndSect267AInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Non deduction interest royalty under section 267A Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/NondedIntRoyaltyUndSect267AInd"/>
										<xsl:with-param name="BackupName">NonDeductionInterestRoyaltyUnderSection267AIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="margin-left:8mm;">
							If yes, complete line 5b.
						</span>
					</div>
					<!--   END LINE 5a of Schedule G  -->
					<!--   BEGIN LINE 5b of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</span>
						<span class="styLNDesc" style="width:162mm;">
							<span style="float:left">Enter the total amount of the disallowed deduction (see instructions) </span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<span style="width:1mm"/>$
							<span class="sty1120FItemUnderlineSM" style="width:22mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/NondedIntRoyaltyUndSect267AAmt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END LINE 5b of Schedule G  -->
					<!--   BEGIN LINE 6a of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">6a</span>
						<span class="styLNDesc" style="width:175mm;">
							<span style="float:left">
								Is the filer of this Form 5471 claiming a foreign-derived intangible income deduction (under section 250) with respect to any 
									<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FDIIBenefitsClaimInd"/>
									<xsl:with-param name="BackupName">IRS5471FDIIBenefitsClaim</xsl:with-param>
								</xsl:call-template>
							</span>
						</span>
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styLNDesc" style="width:162mm; margin-left: 8mm;">
								<span style="float:left;">amounts listed on Schedule M?</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">..............................</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FDIIBenefitsClaimInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Foreign derived intangible income benefits claim Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/FDIIBenefitsClaimInd"/>
										<xsl:with-param name="BackupName">FDIIBenefitsClaimIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width:10px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FDIIBenefitsClaimInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Foreign derived intangible income benefits claim Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/FDIIBenefitsClaimInd"/>
										<xsl:with-param name="BackupName">FDIIBenefitsClaimIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="margin-left:8mm;">
							If "Yes." complete lines 6b, 6c, and 6d.
						</span>
					</div>
					<!--   END LINE 6a of Schedule G  -->
					<!--   BEGIN LINE 6b of Schedule G   -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</span>
						<span class="styLNDesc" style="width:162mm; height:11mm;">
							<span style="float:left">Enter the amount of gross income derived from sales, leases, exchanges, or other dispositions (but not licenses) from 						transactions with the foreign corporation that the filer included in its computation of foreign-derived deduction eligible income 
							<br/>
								<span style="float:left">(FDDEI) (see instructions)</span>
								<span class="styDotLn" style="padding-left:1mm;">........................</span>
								<span style="padding-left:1mm">
									<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
								</span>
								<span style="width:1mm"/>$
							<span class="sty1120FItemUnderlineSM" style="width:22mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/NotLicensePropertyGrossIncmAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
					</div>
					<!--   END LINE 6b of Schedule G  -->
					<!--   BEGIN LINE 6c of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">c</span>
						<span class="styLNDesc" style="width:162mm; height:8mm;">
							<span style="float:left">
								Enter the amount of gross income derived from a license of property to the foreign corporation that the filer included in its 
								<br/>
								<span style="float:left">computation of FDDEI (see instructions)</span>
								<span class="styDotLn" style="padding-left:1mm;">...................</span>
								<span style="padding-left:3mm">
									<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
								</span>
								<span style="width:1mm"/>$
							<span class="sty1120FItemUnderlineSM" style="width:22mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/LicensePropertyGrossIncomeAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
					</div>
					<!--   END LINE 6c of Schedule G  -->
					<!--   BEGIN LINE 6d of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">d</span>
						<span class="styLNDesc" style="width:162mm; height:8mm;">
							<span style="float:left">
								Enter the amount of gross income derived from services provided to the foreign corporation that the filer included in its 
								<br/>
								<span style="float:left">computation of FDDEI (see instructions)</span>
								<span class="styDotLn" style="padding-left:1mm;">...................</span>
								<span style="padding-left:3mm">
									<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
								</span>
								<span style="width:1mm"/>$
							<span class="sty1120FItemUnderlineSM" style="width:22mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignServiceGrossIncomeAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
					</div>
					<!--   END LINE 6d of Schedule G  -->
					<!--   BEGIN LINE 7 of Schedule G   -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">7</span>
						<span class="styLNDesc" style="width:162mm;">
							<span style="float:left">
								During the tax year, was the foreign corporation a participant in any cost sharing arrangement?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Corporation Was Participant Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
									<xsl:with-param name="BackupName">ForeignCorporationWasParticipantIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Corporation Was Participant No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpPartcpCostShrInd"/>
									<xsl:with-param name="BackupName">ForeignCorporationWasParticipantIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 7 of Schedule G   -->
					
					<!--   BEGIN LINE 7 extendedof Schedule G   -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<span class="styLNLeftNumBoxSD"></span>
						<span class="styLNDesc" style="width:162mm;height:8mm;">
							<span style="float:left">
								If the answer to question 7 is "Yes," complete a separate Schedule G-1 for each cost sharing arrangement in which the foreign corporation was a participant during the tax year.
							</span>							
						</span>
					</div>
					<!--   END LINE 7 extended of Schedule G   -->
					
					<!--   BEGIN LINE 8 of Schedule G   -->
					<!--<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">8</span>
						<span class="styLNDesc" style="width:162mm;">
							<span style="float:left">
								During the course of the tax year, did the foreign corporation become a participant in any cost sharing arrangement?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Corporationoration Became Participant Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
									<xsl:with-param name="BackupName">ForeignCorporationBecameParticipantIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width:10px;"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Corporationoration Became Participant No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnCorpBecamePartcpCostShrInd"/>
									<xsl:with-param name="BackupName">ForeignCorporationBecameParticipantIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					--><!--   END LINE 8 of Schedule G  --><!--
					--><!--   BEGIN LINE 9 of Schedule G  --><!--
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">9</span>
						<span class="styLNDesc" style="width:175mm;">
							<span style="float:left">
								If the answer to question 7 is "Yes," was the foreign corporation a participant in a cost sharing arrangement that was in effect 								
							</span>
						</span>
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styLNDesc" style="width:162mm; margin-left: 8mm;">
								<span style="float:left;">before January 5, 2009?</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">................................</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/PartcpCostShrPriorSpcfdDateInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Participant cost sharing prior specified date Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/PartcpCostShrPriorSpcfdDateInd"/>
										<xsl:with-param name="BackupName">ParticipantCostSharingPriorSpecifiedDateIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width:10px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/PartcpCostShrPriorSpcfdDateInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Participant cost sharing prior specified date Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/PartcpCostShrPriorSpcfdDateInd"/>
										<xsl:with-param name="BackupName">ParticipantCostSharingPriorSpecifiedDateIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					--><!--   END LINE 9 of Schedule G  --><!--
					--><!--   BEGIN LINE 10 of Schedule G  --><!--
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBox">10</span>
						<span class="styLNDesc" style="width:175mm;">
							<span style="float:left">
								If the answer to question 7 is "Yes," did a U.S. taxpayer make any platform contributions as defined under Regulation section 
							</span>
						</span>
						<div class="styGenericDiv" style="width:187mm;">
							<span class="styLNDesc" style="width:162mm; margin-left: 8mm;">
								<span style="float:left;">1.482-7(c) to that cost sharing arrangement during the taxable year?</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">..................</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/PlatformContributionInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Platform contribution Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/PlatformContributionInd"/>
										<xsl:with-param name="BackupName">PlatformContributionIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width:10px;"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/PlatformContributionInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Platform contribution Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/PlatformContributionInd"/>
										<xsl:with-param name="BackupName">PlatformContributionIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					--><!--   END LINE 10 of Schedule G   --><!--
					--><!--   BEGIN LINE 11 of Schedule G   --><!--
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBox">11</span>
						<span class="styLNDesc" style="width:162mm;">
							<span style="float:left">If the answer to question 10 is "Yes," enter the present value of the platform contributions in U.S. dollars </span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/PlatformContributionAmt"/>
								<xsl:with-param name="BackupName">IRS5471PlatformContributionStatement</xsl:with-param>
							</xsl:call-template>
							<span style="width:1mm"/>$
							<span class="sty1120FItemUnderlineSM" style="width:18mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/PlatformContributionAmt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					--><!--   END LINE 11 of Schedule G  --><!--
					--><!--   BEGIN LINE 12 of Schedule G   --><!--
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBox">12</span>
						<span class="styLNDesc" style="width:162mm;height:7mm;">
							<span style="float:left">If the answer to question 10 is yes, check the box for the method under Regulation section 1.482-7(g) used to determine the 
							<br/>price of the platform contribution transaction(s): 
							</span>
						</span>
						<div class="styLNDesc" style="width:187mm; padding-left:7mm; height:6mm;">
							--><!--********************************--><!--
							<input type="checkbox" alt="Comparable Uncontrolled Transaction" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ComparableUncontrolledTransInd"/>
									<xsl:with-param name="BackupName">ComparableUncontrolledTransacationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ComparableUncontrolledTransInd"/>
									<xsl:with-param name="BackupName">ComparableUncontrolledTransacationLabel</xsl:with-param>
								</xsl:call-template>
								<span>Comparable uncontrolled transaction </span>
							</label>
							--><!--********************************--><!--
							<span style="width:7mm;"/>
							<input type="checkbox" alt="Income Method" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/IncomeMethodInd"/>
									<xsl:with-param name="BackupName">IncomeMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/IncomeMethodInd"/>
									<xsl:with-param name="BackupName">IncomeMethodLabel</xsl:with-param>
								</xsl:call-template>
								<span>Income method </span>
							</label>
							--><!--********************************--><!--
							<span style="width:24.7mm;"/>
							<input type="checkbox" alt="Acquisition Price Method" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/AquisitionPriceMethodInd"/>
									<xsl:with-param name="BackupName">AquisitionPriceMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/AquisitionPriceMethodInd"/>
									<xsl:with-param name="BackupName">AquisitionPriceMethodLabel</xsl:with-param>
								</xsl:call-template>
								<span>Acquisition price method </span>
							</label>
						</div>
						--><!--********************************--><!--
						<div class="styLNDesc" style="width:187mm; padding-left:7mm; height:6mm;">
							<input type="checkbox" alt="Market Capitalization Method" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/MarketCapitalizationMethodInd"/>
									<xsl:with-param name="BackupName">MarketCapitalizationMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/MarketCapitalizationMethodInd"/>
									<xsl:with-param name="BackupName">MarketCapitalizationMethodLabel</xsl:with-param>
								</xsl:call-template>
								<span>Market capitalization method </span>
							</label>
							--><!--********************************--><!--
							<span style="width:16.9mm;"/>
							<input type="checkbox" alt="Residual Profit Split Method" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ResidualProfitSplitMethodInd"/>
									<xsl:with-param name="BackupName">ResidualProfitSplitMethodInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ResidualProfitSplitMethodInd"/>
									<xsl:with-param name="BackupName">ResidualProfitSplitMethodLabel</xsl:with-param>
								</xsl:call-template>
								<span>Residual profit split method </span>
							</label>
							--><!--********************************--><!--
							<span style="width:10mm;"/>
							<input type="checkbox" alt="Unspecified Methods" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/UnspecifiedMethodsInd"/>
									<xsl:with-param name="BackupName">UnspecifiedMethodsInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/UnspecifiedMethodsInd"/>
									<xsl:with-param name="BackupName">UnspecifiedMethodsLabel</xsl:with-param>
								</xsl:call-template>
								<span>Unspecified methods </span>
							</label>
						</div>
						--><!--********************************--><!--
					</div>-->
					<!--   END LINE 12 of Schedule G  -->
					<!--   BEGIN LINE 8 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">8</span>						
						<span class="styLNDesc" style="width:175mm">
							<span style="float:left">
								From April 25, 2014, to December 31, 2017, did the foreign corporation purchase stock or securities of a shareholder of the foreign 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/PurchaseStockOrSecuritiesInd"/>
									<xsl:with-param name="BackupName">PurchaseStockOrSecurities</xsl:with-param>
								</xsl:call-template>
							</span>
						</span>
						<div class="styGenericDiv" style="width: 187mm">
							<span class="styLNDesc" style="width: 162mm; margin-left: 8mm; height:4mm;">
								<span style="float:left;">corporation for use in a triangular reorganization (within the meaning of Regulations section 1.358-6(b)(2))?</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/PurchaseStockOrSecuritiesInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Purchase stock or securities Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/PurchaseStockOrSecuritiesInd"/>
										<xsl:with-param name="BackupName">PurchaseStockOrSecuritiesIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width: 10px"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/PurchaseStockOrSecuritiesInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Purchase stock or securities Indicator No" class="styCkbox" style="width: 3mm; height: 3mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/PurchaseStockOrSecuritiesInd"/>
										<xsl:with-param name="BackupName">PurchaseStockOrSecuritiesIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<!--   END LINE 8 of Schedule G  -->
					<!--   BEGIN LINE 9a of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBoxSD">9a</span>
						<span class="styLNDesc" style="width:175mm; height:4mm;">
							<span style="float:left">
							Did the foreign corporation receive any intangible property in a prior year or the current tax year for which the U.S. transferor is 
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/IntangiblePropertyReceivedInd"/>
									<xsl:with-param name="BackupName">IRS5471IntangiblePropertyReceived</xsl:with-param>
								</xsl:call-template>
							</span>
						</span>
						<div class="styGenericDiv" style="width:187mm">
							<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
								<span style="float:left;">required to report a section 367(d) annual income inclusion for the tax year?</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/IntangiblePropertyReceivedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Intangible property received Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/IntangiblePropertyReceivedInd"/>
										<xsl:with-param name="BackupName">IntangiblePropertyReceivedIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width: 10px"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/IntangiblePropertyReceivedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Intangible property received Indicator No" class="styCkbox" style="width: 3mm; height: 3mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/IntangiblePropertyReceivedInd"/>
										<xsl:with-param name="BackupName">IntangiblePropertyReceivedIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="margin-left:8mm;">
							If “Yes”, go to line 9b.
						</span>
					</div>
					<!--   END LINE 9a of Schedule G  -->
					<!--   BEGIN LINE 9b of Schedule G   -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<span class="styLNLeftNumBoxSD" style="padding-left:4.5mm;">b</span>						
						<span class="styLNDesc" style="width:162mm;height:8mm;">
							<span style="float:left">Enter in functional currency the amount of the earnings and profits reduction pursuant to section 367(d)(2)(B) for the tax year. 
							<span class="styDotLn" style="float:left;padding-right:1mm;">................................</span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<span style="width:1mm"/>
							<span class="sty1120FItemUnderlineSM" style="width:18mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/EarningsProfitReductionAmt"/>
								</xsl:call-template>
							</span>
						</span>
						</span>
					</div>
					<!--   END LINE 9b of Schedule G  -->
					<!--   BEGIN LINE 10 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBox">10</span>
						<span class="styLNDesc" style="width:175mm">
							<span style="float:left">
								During the tax year, was the foreign corporation an expatriated foreign subsidiary under Regulations section 
							</span>
						</span>
						<div class="styGenericDiv" style="width: 187mm">
							<span class="styLNDesc" style="width: 162mm; margin-left: 8mm; ">
								<span style="float:left;">
								1.7874-12(a)(9) 
								<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/ExpatriatedFrgnSubsidiaryInd"/>
										<xsl:with-param name="BackupName">IRS5471ExpatriatedFrgnSubsidiary</xsl:with-param>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................................</span>
							</span>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ExpatriatedFrgnSubsidiaryInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Expatriated foreign subsidiary Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/ExpatriatedFrgnSubsidiaryInd"/>
										<xsl:with-param name="BackupName">ExpatriatedForeignSubsidiaryIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span class="styNBSP" style="width: 10px"/>
							<span>
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ExpatriatedFrgnSubsidiaryInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Expatriated foreign subsidiary Indicator No" class="styCkbox" style="width: 3mm; height: 3mm">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$IRS5471GData/ExpatriatedFrgnSubsidiaryInd"/>
										<xsl:with-param name="BackupName">ExpatriatedForeignSubsidiaryIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="margin-left:8mm;">
							If yes, see instructions and attach statement.
						</span>
					</div>
					<!--   END LINE 10 of Schedule G  -->
					<!--   BEGIN LINE 11 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNLeftNumBox">11</span>
						<span class="styLNDesc" style="width:177mm">
							During the tax year, did the foreign corporation participate in any reportable transaction as defined in Regulations section 							
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 162mm; margin-left:8mm">
							<span style="float:left">
								1.6011-4?
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">....................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Reportable Transaction Participation Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
									<xsl:with-param name="BackupName">ReportableTransactionParticipationIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Reportable Transaction Participation Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
									<xsl:with-param name="BackupName">ReportableTransactionParticipationIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="margin-left:8mm;">
							If “Yes,” attach Form(s) 8886 if required by Regulations section 1.6011- 4(c)(3)(i)(G) 
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ReportableTransactionPrtcptInd"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 11 of Schedule G -->
					<!--   BEGIN LINE 12 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNLeftNumBox">12</span>
						<span class="styLNDesc" style="width:175mm">
							During the tax year, did the foreign corporation pay or accrue any foreign tax that was disqualified for credit under section 
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
							<span style="float:left">901(m)? </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">.....................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnTaxDisqualifiedSec901mInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Tax Disqualified Section 901m Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnTaxDisqualifiedSec901mInd"/>
									<xsl:with-param name="BackupName">ForeignTaxDisqualifiedSection901mIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnTaxDisqualifiedSec901mInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Tax Disqualified Section 901m Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/FrgnTaxDisqualifiedSec901mInd"/>
									<xsl:with-param name="BackupName">ForeignTaxDisqualifiedSection901mIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 12 of Schedule G   -->
					<!--   BEGIN LINE 13 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBox">13</span>
						<span class="styLNDesc" style="width:175mm;">
							During the tax year, did the foreign corporation pay or accrue foreign taxes to which section 909 applies, or treat foreign taxes 						
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
							<span style="float:left">
								that were previously suspended under section 909 as no longer suspended?
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignTaxSection909Ind"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Tax Section 909 Indicator Yes" class="styCkbox" style="width: 3mm; height: 3mm">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignTaxSection909Ind"/>
									<xsl:with-param name="BackupName">ForeignTaxSection909IndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width:10px;"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignTaxSection909Ind"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Tax Section 909 Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ForeignTaxSection909Ind"/>
									<xsl:with-param name="BackupName">ForeignTaxSection909IndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 13 of Schedule G -->
					<!--   BEGIN LINE 14 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBox">14</span>
						<span class="styLNDesc" style="width:162mm;">
							<span style="float:left">
							Did you answer "Yes" to any of the questions in the instructions for line 14? 
						</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/AnswerYesAnyQuestionInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Answer Yes Any Question Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/AnswerYesAnyQuestionInd"/>
									<xsl:with-param name="BackupName">AnswerYesAnyQuestionIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width:10px;"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/AnswerYesAnyQuestionInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Answer Yes Any Question Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/AnswerYesAnyQuestionInd"/>
									<xsl:with-param name="BackupName">AnswerYesAnyQuestionIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="margin-left:8mm; ">
							If "Yes," enter the corresponding code(s) from the instructions and attach statement
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/AnswerYesAnyQuestionInd"/>
							</xsl:call-template>
							<span style="width:1mm"/>
						</span>
					</div>
					<!--   END LINE 14 of Schedule G  -->
					<!--   BEGIN LINE 15 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNLeftNumBox">15</span>
						<span class="styLNDesc" style="width:162mm;">
							<span style="float:left">
							Does the foreign corporation have interest expense disallowed under section 163(j) (see instructions)? 
						</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/DisallowedInterestExpenseInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Disallowed Interest Expense Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/DisallowedInterestExpenseInd"/>
									<xsl:with-param name="BackupName">DisallowedInterestExpenseIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width:10px;"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/DisallowedInterestExpenseInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Disallowed Interest Expense Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/DisallowedInterestExpenseInd"/>
									<xsl:with-param name="BackupName">DisallowedInterestExpenseIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
							<span style="float:left">If "Yes," enter the amount </span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<span style="width:1mm"/>$
							<span class="sty1120FItemUnderlineSM" style="width:18mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/DisallowedInterestExpenseAmt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END LINE 15 of Schedule G  -->
					<!--   BEGIN LINE 16 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNLeftNumBox">16</span>
						<span class="styLNDesc" style="width:177mm">
							Does the foreign corporation have previously disallowed interest expense under section 163(j) carried
      forward to the current
						</span>
					</div>
					<div class="styGenericDiv" style="width: 187mm">
						<span class="styLNDesc" style="width: 162mm; margin-left:8mm">
							<span style="float:left">
								tax year (see instructions)?		
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/CfwdPrevDsallwIntExpenseInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Corporation Previously Disallowed Interest Expense Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/CfwdPrevDsallwIntExpenseInd"/>
									<xsl:with-param name="BackupName">ForeignCorporationPreviouslyDisallowedInterestExpenseIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width:10px;"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/CfwdPrevDsallwIntExpenseInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreign Corporation Previously Disallowed Interest Expense Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/CfwdPrevDsallwIntExpenseInd"/>
									<xsl:with-param name="BackupName">ForeignCorporationPreviouslyDisallowedInterestExpenseIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
							<span style="float:left">If "Yes," enter the amount </span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<span style="width:1mm"/>$
							<span class="sty1120FItemUnderlineSM" style="width:18mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/CfwdPrevDsallwIntExpenseAmt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END LINE 16 of Schedule G  -->
					<!--   BEGIN LINE 17a of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNLeftNumBox">17a</span>
						<span class="styLNDesc" style="width:175mm">
							Did any extraordinary reduction with respect to a controlling section 245A shareholder occur during the tax year (see 
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
							<span style="float:left">instructions)? </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">...................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ExtraordinaryReductionInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Extraordinary Reduction Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ExtraordinaryReductionInd"/>
									<xsl:with-param name="BackupName">ExtraordinaryReductionIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ExtraordinaryReductionInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Extraordinary Reduction Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ExtraordinaryReductionInd"/>
									<xsl:with-param name="BackupName">ExtraordinaryReductionIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 17a of Schedule G   -->
					<!--   BEGIN LINE 17b of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNLeftNumBox" style="padding-left:4.5mm;">b</span>
						<span class="styLNDesc" style="width:175mm">
							If the answer to question 17a is “Yes,” was an election made to close the tax year such that no amount is treated as an
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
							<span style="float:left">extraordinary reduction amount or tiered extraordinary reduction amount (see instructions)? </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..........</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/CloseTaxYearElectionInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Close Tax Year Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/CloseTaxYearElectionInd"/>
									<xsl:with-param name="BackupName">CloseTaxYearElectionIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/CloseTaxYearElectionInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Close Tax Year Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/CloseTaxYearElectionInd"/>
									<xsl:with-param name="BackupName">CloseTaxYearElectionIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 17b of Schedule G   -->
					<!--BEGIN FOOTER Page 5-->
					<div style="width:187mm; border-color: black; border-style: solid;
					 border-right-width: 0px; border-left-width: 0px; border-top-width: 2px; 
					 border-bottom-width: 0px">
						<div style="float:right">
                        Form <span class="styBoldText" style="font-size: 8pt">5471</span> (Rev. 12-2021)
                        </div>
					</div>
					<div class="pageEnd"/>
					<!--END FOOTER-->
					<p style="page-break-before:always"/>
					<!--BEGIN Page 6 HEADER-->
					<div class="styBB" style="width:187mm; border-bottom: 1px solid black;">
						<div style="float: left; clear: none">Form 5471 (Rev. 12-2021)</div>
						<div style="float:right">
                         Page <span class="styBoldText" style="font-size: 8pt">6</span>
						</div>
					</div>
					<!--END Page 6 HEADER-->
					<!--   BEGIN LINE 18 of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;height:8mm;">
						<span class="styLNLeftNumBox">18</span>
						<span class="styLNDesc" style="width:175mm;height:8mm;">
							Does the reporting corporation have any loan to or from the related party to which the safe-haven rate rules of Regulations section 1.482-2(a)(2)(iii)(B) are applicable, and for which the reporting corporation used a rate of interest within the safe-haven range of Regulations
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
							<span style="float:left">section 1.482-2(a)(2)(iii)(B)(1) (100% to 130% of the AFR for the relevant term)? </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..............</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ExtraordinaryReductionInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Extraordinary Reduction Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ExtraordinaryReductionInd"/>
									<xsl:with-param name="BackupName">ExtraordinaryReductionIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/ExtraordinaryReductionInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Extraordinary Reduction Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/ExtraordinaryReductionInd"/>
									<xsl:with-param name="BackupName">ExtraordinaryReductionIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 18 of Schedule G   -->
					<!--   BEGIN LINE 19a of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;height:10mm;">
						<span class="styLNLeftNumBox">19a</span>
						<span class="styLNDesc" style="width:175mm;height:10mm;">
							Did the reporting corporation make at least one distribution or acquisition (as defined by Regulations section 1.385-3) during the period including the tax year and the preceding three tax years, or, during the period beginning 36 months before the date of the respective distribution or acquisition and ending 36 months afterward, and did the reporting corporation issue or refinance indebtedness owed to a  
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNDesc" style="width:162mm; margin-left:8mm;">
							<span style="float:left">foreign-related party? </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">................................</span>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/RltdPrtyLoansFnddDistriInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreing Related Party Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/RltdPrtyLoansFnddDistriInd"/>
									<xsl:with-param name="BackupName">RltdPrtyLoansFnddDistriIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span class="styNBSP" style="width: 10px"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$IRS5471GData/RltdPrtyLoansFnddDistriInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Foreing Related Party Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/RltdPrtyLoansFnddDistriInd"/>
									<xsl:with-param name="BackupName">RltdPrtyLoansFnddDistriIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END LINE 19a of Schedule G   -->
					<!--   BEGIN LINE 19b of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm">
						<span class="styLNLeftNumBox" style="padding-left:4.5mm;">b</span>
						<span class="styLNDesc" style="width:175mm">
							If the answer to question 19a is "Yes," provide the following.
						</span>
						</div>					
					<!--   END LINE 19b of Schedule G   -->		
					<!--   BEGIN LINE 19b1of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
					<span class="styLNLeftNumBox" style="padding-left:3mm;">(1)</span>
						<span class="styLNDesc" style="width:162mm; ">
							<span style="float:left;padding-left:.5mm; ">The amount of such distribution(s) and acquisition(s), and </span>
							<span class="styDotLn" style="float:left; padding-right:1mm;">..............</span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<span style="width:1mm"/>$
							<span class="sty1120FItemUnderlineSM" style="width:18mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/DistributionsAcquisitionsAmt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END LINE 19b1 of Schedule G   -->					
					<!--   BEGIN LINE 19b2of Schedule G  -->
					<div class="styGenericDiv" style="width:187mm;">
					<span class="styLNLeftNumBox" style="padding-left:3mm;">(2)</span>
						<span class="styLNDesc" style="width:162mm; ">
							<span style="float:left;padding-left:.5mm;">The amount of such related party indebtedness </span>
							<span class="styDotLn" style="float:left; padding-right:1mm;">.................</span>
							<span style="padding-left:1mm">
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							</span>
							<span style="width:1mm"/>$
							<span class="sty1120FItemUnderlineSM" style="width:18mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$IRS5471GData/IndebtednessAmt"/>
								</xsl:call-template>
							</span>
						</span>
					</div>
					<!--   END LINE 19b2 of Schedule G   -->
					<!-- SCHEDULE I HEADER -->
					<!-- Filler for Schedule I-->
					<!-- Display the data container only if there is no data for Schedule I. -->
					<!-- If the print parameter is "separated" and there is more than one instance of Schedule I, -->
					<!-- then display a message directing the user to the additional data table -->
					<xsl:if test="(not($IRS5471IData)) or (($Print = $Separated) and count($IRS5471IData) &gt; 1)">
						<div class="styBB" style="width:187mm; float:none; clear:both; border-top: 1px solid black;">
							<span class="styPartName" style="width:20mm; float:left;">Schedule I</span>
							<span class="styPartDesc" style="width:160mm;">
								Summary of Shareholder’s Income From Foreign Corporation
								<span class="styNormalText">&#160;(see instructions) </span>
							</span>
						</div>
						<div style="width:187mm; padding-left:2mm;">
							If item H on page 1 is completed, a separate Schedule I must be filed for each Category 4, 5a, or 5b filer for
							whom reporting is furnished<br/>on this Form 5471.  This schedule I is being completed for:
						    <br/>
							<br/>
						</div>
						<div class="styBB" style=" width:187mm; padding-left:2mm;">
							Name of U.S. shareholder <span style="width:2mm;"/>
							<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							<span style="width:65mm;border-bottom: 1 solid black">
								<xsl:if test="(count($IRS5471IData) &gt; 1)">
									<xsl:call-template name="PopulateAdditionalDataTableMessage">
										<xsl:with-param name="TargetNode" select="$IRS5471IData"/>
										<xsl:with-param name="ShortMessage" select="'false'"/>
									</xsl:call-template>
								</xsl:if>
							</span>					
							Identifying number <span style="width:2mm;"/>
							<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
							<span style="width:50mm; border-bottom: 1 solid black; text-align:center;"/>
						</div>
						<br/>
						<!-- Line 1a of Schedule I -->
						<div style="width:187mm;height:6mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox">1a</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Section 964(e)(4) Subpart F dividend income from the sale of stock of a lower-tier foreign corporation (see<br/>
									</span>
									<span>instructions)</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;">............................</span>
								</div>
							</div>
							<div style="float:right;height:6mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">1a</div>
								<div class="styLNAmountBox" style="width:33mm;height:6mm;padding-top:2mm;">
								</div>
							</div>
						</div>
						<!-- Line 1b of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Section 245A(e)(2) Subpart F income from hybrid dividends of tiered corporations (see instructions) </span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">..</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">1b</div>
								<div class="styLNAmountBox" style="width:33mm;">									
								</div>
							</div>
						</div>
						<!-- Line 1c of Schedule I -->
						<div style="width:187mm;height:6mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Subpart F income from tiered extraordinary disposition amounts not eligible for subpart F exception<br/>
									</span>
									<span>under section 954(c)(6)</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;">..........................</span>
								</div>
							</div>
							<div style="float:right;height:6mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">1c</div>
								<div class="styLNAmountBox" style="width:33mm;height:6mm;padding-top:2mm;">
								</div>
							</div>
						</div>
						<!-- Line 1d of Schedule I -->
						<div style="width:187mm;height:6mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">d</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Subpart F income from tiered extraordinary reduction amounts not eligible for subpart F exception<br/>
									</span>
									<span>under section 954(c)(6)</span>
									<span class="styDotLn" style="float:right;padding-right:2mm;">..........................</span>
								</div>
							</div>
							<div style="float:right;height:6mm;">
								<div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">1d</div>
								<div class="styLNAmountBox" style="width:33mm;height:6mm;padding-top:2mm;">
								</div>
							</div>
						</div>
						<!-- Line 1e of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">e</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Section 954(c) Subpart F Foreign Personal Holding Company Income (enter result from Worksheet A)</span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">.</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">1e</div>
								<div class="styLNAmountBox" style="width:33mm;">									
								</div>
							</div>
						</div>
						<!-- Line 1f of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">f</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Section 954(d) Subpart F Foreign Base Company Sales Income (enter result from Worksheet A)</span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">....</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">1f</div>
								<div class="styLNAmountBox" style="width:33mm;">									
								</div>
							</div>
						</div>
						<!-- Line 1g of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">g</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Section 954(e) Subpart F Foreign Base Company Services Income (enter result from Worksheet A)</span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">...</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">1g</div>
								<div class="styLNAmountBox" style="width:33mm;">									
								</div>
							</div>
						</div>
						<!-- Line 1h of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">h</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Other Subpart F income (enter result from Worksheet A) </span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">...............</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">1h</div>
								<div class="styLNAmountBox" style="width:33mm;">									
								</div>
							</div>
						</div>
						<!-- Line 2 of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox">2</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Earnings invested in U.S. property (enter the result from Worksheet B in the instructions) </span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">......</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">2</div>
								<div class="styLNAmountBox" style="width:33mm;"/>
							</div>
						</div>
						<!-- Line 3 of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox">3</div>
								<div class="styLNDesc" style="padding-top:.5mm; padding-bottom:.5mm;">
									<span style="float:left;">Reserved for future use</span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">.......................</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="height:4mm;">3</div>
								<div class="styLNAmountBox" style="width:33mm; height:4mm;background-color:grey;">
								</div>
							</div>
						</div>
						<!-- Line 4 first line of Schedule I-->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox">4</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Factoring income </span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">............................</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">4</div>
								<div class="styLNAmountBox" style="width:33mm;">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="WithdrawnExportTradeIncomeAmt"/>
									</xsl:call-template>-->
								</div>
							</div>
						</div>
						<!-- Line 4 second line of Schedule I-->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="height:4mm;"/>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">See instructions for reporting amounts on lines 1, 2 and 4 on your income tax return </span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">.......</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBoxNBB" style="background-color:grey;"/>
								<div class="styLNAmountBoxNBB" style="width:33mm; "/>
							</div>
						</div>
						<!-- Line 5a of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox">5a</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Section 245A eligible dividends (see instructions) </span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">..................</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">5a </div>
								<div class="styLNAmountBox" style="width:33mm;">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="FactoringIncomeAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>-->
								</div>
							</div>
						</div>
						<!-- Line 5b of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Extraordinary disposition amounts (see instructions)</span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">.................</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">5b</div>
								<div class="styLNAmountBox" style="width:33mm;">									
								</div>
							</div>
						</div>
						<!-- Line 5c of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Extraordinary reduction amounts (see instructions)</span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">.................</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">5c</div>
								<div class="styLNAmountBox" style="width:33mm;">									
								</div>
							</div>
						</div>
						<!-- Line 5d of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">d</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Section 245A(e) dividends (see instructions)</span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">...................</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">5d</div>
								<div class="styLNAmountBox" style="width:33mm;">									
								</div>
							</div>
						</div>
						<!-- Line 5e of Schedule I -->
						<div style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox" style="padding-left:3mm;">e</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Dividends not reported on line 5a, 5b, 5c, or 5d</span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">..................</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox">5e</div>
								<div class="styLNAmountBox" style="width:33mm;">									
								</div>
							</div>
						</div>
						<!-- Line 6 of Schedule I  -->
						<div class="styBB" style="width:187mm;">
							<div style="float:left;">
								<div class="styLNLeftNumBox">6</div>
								<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
									<span style="float:left;">Exchange gain or (loss) on a distribution of previously taxed earnings and profits </span>
									<span class="styDotLn" style="float:right; padding-right:2mm;">........</span>
								</div>
							</div>
							<div style="float:right;">
								<div class="styLNRightNumBox" style="border-bottom-width:0px;">6 </div>
								<div class="styLNAmountBox" style="width:33mm; border-bottom-width:0px;">
									<!--<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotalIncmControlledFrgnCorpAmt"/>
										<xsl:with-param name="MaxSize" select="17"/>
									</xsl:call-template>-->
								</div>
							</div>
						</div>
						<!--YES and NO Boxes  -->
						<div style="width:187mm;">
							<span style="height:4mm;width:10mm; text-align:center; float:right;">
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
									</xsl:call-template>
									<b>No</b>
								</label>
							</span>
							<span style="height:4mm;width:10mm; text-align:center; float:right;">
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
									</xsl:call-template>
									<b>Yes</b>
								</label>
							</span>
						</div>
						<!--   Line 7a of Schedule I   -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox">7a</div>
							<span class="styLNDesc" style="width:159mm; ">
								<span style="float:left;">Was any income of the foreign corporation blocked?
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">.......................</span>
							</span>
							<span style="height:5mm;width:10mm; text-align:center; ">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Any Income of Foreign Corportation Blocked Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										<xsl:with-param name="BackupName">AnyIncomeBlockedIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="height:5mm;width:10mm; text-align:center; ">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Any Income of Foreign Corportation Blocked Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										<xsl:with-param name="BackupName">AnyIncomeBlockedIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<!--   END Line 7a of Schedule I   -->
						<!--   BEGIN LIne 7b of Schedule I   -->
						<div class="styGenericDiv" style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
							<span class="styLNDesc" style="width:159mm; ">
								<span style="float:left">
                                    Did any such income become unblocked during the tax year (see section 964(b))?
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">.............</span>
							</span>
							<span style="height:5mm;width:10mm; text-align:center; ">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Income Unblocked Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										<xsl:with-param name="BackupName">IncomeUnblockedIndYes</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<span style="height:5mm;width:10mm; text-align:center; ">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Income Unblocked Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										<xsl:with-param name="BackupName">IncomeUnblockedIndNo</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
						</div>
						<div class="styGenericDiv" style="width: 187mm;">
							<span class="styLNDesc" style="width: 160mm;">
								If the answer to either question is "Yes," attach an explanation.
							</span>
						</div>
					<!--   END Line 7b of Schedule I   -->
					<!--   Line 8a of Schedule I   -->
					<div class="styGenericDiv" style="width:187mm; ">
						<div class="styLNLeftNumBox">8a</div>
						<span class="styLNDesc" style="width:159mm; ">
							<span style="float:left;">Did this U.S. shareholder have an extraordinary disposition (ED) account with respect to the foreign corporation at any time</span>
						</span>
					</div>
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox"/>
						<span class="styLNDesc" style="width:159mm; ">
							<span style="float:left;">during the tax year (see instructions)?</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">...........................</span>
						</span>
							<span style="height:5mm;width:10mm; text-align:center; ">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="EDAccountInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Extraordinary Disposition Account Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="EDAccountInd"/>
									<xsl:with-param name="BackupName">ExtraordinaryDispositionAccountIndYes</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
							<span style="height:5mm;width:10mm; text-align:center; ">
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="EDAccountInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="Extraordinary Disposition Account Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
								<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="EDAccountInd"/>
									<xsl:with-param name="BackupName">ExtraordinaryDispositionAccountIndNo</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
					</div>
					<!--   END Line 8a of Schedule I   -->
					<!--   Line 8b of Schedule I   -->
					<div class="styGenericDiv" style="width:187mm; height:9mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
						<span class="styLNDesc" style="width: 170mm;">
							<span style="float:left;">If the answer to question 8a is “Yes,” enter the U.S. shareholder’s ED account balance at the beginning of the CFC year 
								<br/>$ 
								<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
								</span>
								and at the end of the tax year $ 
								<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
								</span>
								. Provide an attachment detailing any changes from the beginning to the ending balances.
							</span>
						</span>
					</div>
					<!--   END Line 8b of Schedule I   -->
					<!--   Line 8c of Schedule I   -->
					<div class="styGenericDiv" style="width:187mm; padding-top:1mm; height:11mm;">
						<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
						<span class="styLNDesc" style="width: 170mm;">
							<span style="float:left;">Enter the CFC’s aggregate ED account balance with respect to all U.S. shareholders at the beginning of the CFC year
								<br/>$ 
								<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
								</span>
								and at the end of the tax year $ 
								<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
								</span>
								. Provide an attachment detailing any changes from the beginning to the ending balances.
							</span>
						</span>
					</div>
					<!--   END Line 8c of Schedule I   -->
					<!--   Line 9 of Schedule I   -->
					<div class="styGenericDiv" style="width:187mm;height:4mm;">
						<div class="styLNLeftNumBox">9</div>
						<span class="styLNDesc" style="width: 170mm;">
							<span style="float:left;">Enter the sum of the hybrid deduction accounts with respect to stock of the foreign corporation (see instructions) $ 
								<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="TotHybridDeductionAccountsAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</span>
					</div>
					<!--   END Line 9 of Schedule I   -->
					</xsl:if>
					<!-- Display all instances of Schedule I data if the print option is not "separated" -->
					<!-- If the print option is "separated", but there is only one Schedule I, display that instance -->
					<xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($IRS5471IData) = 1))">
						<xsl:for-each select="$IRS5471IData">
							<div class="styBB" style="width:187mm; float:none; clear:both;">
								<span class="styPartName" style="width:20mm;">Schedule I</span>
								<span class="styPartDesc" style="width:160mm;">
									Summary of Shareholder’s Income From Foreign Corporation
									<span class="styNormalText"> (see instructions)</span>
								</span>
							</div>
							<div style="width:187mm; padding-left:2mm;">
								If item H on page 1 is completed, a separate Schedule I must be filed for each Category 4, 5a, or 5b filer 
								for whom reporting is furnished<br/>on this Form 5471.  This schedule I is being completed for:
							    <br/>
								<br/>
							</div>
							<div class="styBB" style="width:187mm; padding-left:2mm;">
								Name of U.S. shareholder <span style="width:2mm;"/>
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
								<span style="width:65mm; border-bottom: 1 solid black">
									<xsl:choose>
										<xsl:when test="ShareholderInformation/ShareholderPersonNm != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderPersonNm"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</span>					
								Identifying number <span style="width:2mm;"/>
								<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
								<span style="width:50mm; border-bottom: 1 solid black; text-align:center;">
									<xsl:choose>
										<xsl:when test="ShareholderInformation/ShareholderSSN != ''">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderSSN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="ShareholderInformation/ShareholderEIN != ''">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderEIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="ShareholderInformation/ShareholderMissingEINReasonCd != ''">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderMissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:when>
									</xsl:choose>
								</span>
							</div>
							<br/>
							<div class="styBB" style="width:187mm; float:none; clear:both;">
								<!-- Line 1a of Schedule I  -->
								<div style="width:187mm;height:6mm;">
									<div class="styLNLeftNumBox">1a</div>
									<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Section 964(e)(4) Subpart F dividend income from the sale of stock of a lower-tier foreign corporation (see<br/>
										</span>
										<span>instructions)</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">.............................</span>
									</div>
									<div class="styLNRightNumBox" style="border-top-width:1;height:6mm;padding-top:2.5mm;">1a </div>
									<div class="styLNAmountBox" style="width:33mm; border-top-width:1;height:6mm;padding-top:2.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SubpartFLowTierCFCRcvdAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 1b of Schedule I -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
									<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Section 245A(e)(2) Subpart F income from hybrid dividends of tiered corporations (see instructions) </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
									</div>
									<div class="styLNRightNumBox" style="border-top-width:1;">1b </div>
									<div class="styLNAmountBox" style="width:33mm; border-top-width:1;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SubpartFHybridDivRcvdAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 1c of Schedule I  -->
								<div style="width:187mm;height:6mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
									<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Subpart F income from tiered extraordinary disposition amounts not eligible for subpart F exception under<br/>
										</span>
										<span> section 954(c)(6)</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">............................</span>
									</div>
									<div class="styLNRightNumBox" style="border-top-width:1;height:6mm;padding-top:2.5mm;">1c </div>
									<div class="styLNAmountBox" style="width:33mm; border-top-width:1;height:6mm;padding-top:2.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SubpartFIncmTieredEDAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 1d of Schedule I  -->
								<div style="width:187mm;height:6mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">d</div>
									<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Subpart F income from tiered extraordinary reduction amounts not eligible for subpart F exception under<br/>
										</span>
										<span>section 954(c)(6)</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">............................</span>
									</div>
									<div class="styLNRightNumBox" style="border-top-width:1;height:6mm;padding-top:2.5mm;">1d </div>
									<div class="styLNAmountBox" style="width:33mm; border-top-width:1;height:6mm;padding-top:2.5mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SubpartFIncmTieredERAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 1e of Schedule I -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">e</div>
									<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Section 954(c) Subpart F Foreign Personal Holding Company Income (enter result from Worksheet A) </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
									</div>
									<div class="styLNRightNumBox" style="border-top-width:1;">1e </div>
									<div class="styLNAmountBox" style="width:33mm; border-top-width:1;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SubpartFPHCIncomeAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 1f of Schedule I -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">f</div>
									<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Section 954(d) Subpart F Foreign Base Company Sales Income (enter result from Worksheet A) </span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...</span>
									</div>
									<div class="styLNRightNumBox" style="border-top-width:1;">1f </div>
									<div class="styLNAmountBox" style="width:33mm; border-top-width:1;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SubpartFSalesIncomeAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 1g of Schedule I -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">g</div>
									<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Section 954(e) Subpart F Foreign Base Company Services Income (enter result from Worksheet A)</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">..</span>
									</div>
									<div class="styLNRightNumBox" style="border-top-width:1;">1g </div>
									<div class="styLNAmountBox" style="width:33mm; border-top-width:1;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="SubpartFServicesIncomeAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 1h of Schedule I -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">h</div>
									<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Other subpart F income (enter result from Worksheet A)</span>
										<span class="styDotLn" style="float:right;padding-right:2mm;">...............</span>
									</div>
									<div class="styLNRightNumBox" style="border-top-width:1;">1h </div>
									<div class="styLNAmountBox" style="width:33mm; border-top-width:1;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="OtherSubpartFNotIncludedAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 2 of Schedule I -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox">2</div>
									<div class="styLNDesc" style="padding-top:.5mm; padding-bottom:.5mm;">
										<span style="float:left;">Earnings invested in U.S. property (enter the result from Worksheet B in the instructions) </span>
										<span class="styDotLn" style="float:right; padding-right:2mm;">......</span>
									</div>
									<div class="styLNRightNumBox">2 </div>
									<div class="styLNAmountBox" style="width:33mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="EarningsInvestedInUSPropAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- Line 3 of Schedule I -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox">3</div>
										<div class="styLNDesc" style="padding-top:.5mm; padding-bottom:.5mm;">
											<span style="float:left;">Reserved for future use</span>
											<span class="styDotLn" style="float:right; padding-right:2mm;">..........................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox" style="height:4mm;">3</div>
										<div class="styLNAmountBox" style="width:33mm; height:4mm;background-color:grey;">
										</div>
									</div>
								</div>
								<!-- Line 4 of Schedule I -->
								<div style="width:187mm;">
									<div class="styLNLeftNumBox">4</div>
									<div class="styLNDesc" style="padding-top:.5mm; padding-bottom:.5mm;">
										<span style="float:left;">Factoring income </span>
										<span class="styDotLn" style="float:right; padding-right:2mm;">............................</span>
									</div>
									<div class="styLNRightNumBox">4</div>
									<div class="styLNAmountBox" style="width:33mm;  ">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="FactoringIncomeAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<div style="width:187mm;">
									<div class="styLNLeftNumBox"/>
									<div class="styLNDesc" style="padding-top:.5mm; padding-bottom:.5mm;">
										<span style="float:left;">See instructions for reporting amounts on lines 1, 2 and 4 on your income tax return </span>
										<span class="styDotLn" style="float:right; padding-right:2mm;">.......</span>
									</div>
									<div class="styLNRightNumBox" style="background-color:grey;"/>
									<div class="styLNAmountBox" style="width:33mm;  "/>
								</div>
								<!-- Line 5a of Schedule I -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox">5a</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;">Section 245A eligible dividends (see instructions) </span>
											<span class="styDotLn" style="float:right; padding-right:2mm;">..................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">5a </div>
										<div class="styLNAmountBox" style="width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect245AEligibleDividendsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 5b of Schedule I -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;">Extraordinary disposition amounts (see instructions)</span>
											<span class="styDotLn" style="float:right; padding-right:2mm;">.................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">5b</div>
										<div class="styLNAmountBox" style="width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExtraordinaryDispositionAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 5c of Schedule I -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;">Extraordinary reduction amounts (see instructions)</span>
											<span class="styDotLn" style="float:right; padding-right:2mm;">.................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">5c</div>
										<div class="styLNAmountBox" style="width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExtraordinaryReductionAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 5d of Schedule I -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="padding-left:3mm;">d</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;">Section 245A(e) dividends (see instructions)</span>
											<span class="styDotLn" style="float:right; padding-right:2mm;">...................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">5d</div>
										<div class="styLNAmountBox" style="width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section245AeDividendsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 5e of Schedule I -->
								<div style="width:187mm;">
									<div style="float:left;">
										<div class="styLNLeftNumBox" style="padding-left:3mm;">e</div>
										<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
											<span style="float:left;">Dividends not reported on line 5a, 5b, 5c, or 5d</span>
											<span class="styDotLn" style="float:right; padding-right:2mm;">..................</span>
										</div>
									</div>
									<div style="float:right;">
										<div class="styLNRightNumBox">5e</div>
										<div class="styLNAmountBox" style="width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsNotReportedAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</div>
									</div>
								</div>
								<!-- Line 6 of Schedule I -->
								<div class="styBB" style="width:187mm;">
									<div class="styLNLeftNumBox">6</div>
									<div class="styLNDesc" style="padding-top:.5mm;padding-bottom:.5mm;">
										<span style="float:left;">Exchange gain or (loss) on a distribution of previously taxed earnings and profits </span>
										<span class="styDotLn" style="float:right; padding-right:2mm;">........</span>
									</div>
									<div class="styLNRightNumBox" style="border-bottom-width:0px;">6 </div>
									<div class="styLNAmountBox" style="width:33mm; border-bottom-width:0px;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="ExchangeGainOrLossOnDistriAmt"/>
											<xsl:with-param name="MaxSize" select="17"/>
										</xsl:call-template>
									</div>
								</div>
								<!--YES and NO Boxes-->
								<div class="styGenericDiv" style="width:187mm;">
									<span style="height:4mm;width:8mm; text-align:center; float:right;">
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
												<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
											</xsl:call-template>
											<b>No</b>
										</label>
									</span>
									<span style="height:4mm;width:8mm; text-align:center; float:right;">
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
												<xsl:with-param name="BackupName">IRS5471AnyIncomeBlocked</xsl:with-param>
											</xsl:call-template>
											<b>Yes</b>
										</label>
									</span>
								</div>
								<!--   Line 7a of Schedule I   -->
								<div class="styGenericDiv" style="width:187mm;">
									<div class="styLNLeftNumBox">7a</div>
									<span class="styLNDesc" style="width:163mm; ">
										<span style="float:left;">Was any income of the foreign corporation blocked?
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right; padding-right:1mm;">......................</span>
									</span>
									<span style="height:5mm;width:8mm; text-align:center; ">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Any Income of Foreign Corportation Blocked Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
												<xsl:with-param name="BackupName">AnyIncomeBlockedIndYes</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="height:5mm;width:8mm; text-align:center; ">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Any Income of Foreign Corportation Blocked Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
												<xsl:with-param name="BackupName">AnyIncomeBlockedIndNo</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
								</div>
								<!--   END Line 7a of Schedule I   -->
								<!--   BEGIN LIne 7b of Schedule I   -->
								<div class="styGenericDiv" style="width:187mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
									<span class="styLNDesc" style="width:163mm; ">
										<span style="float:left">
											Did any such income become unblocked during the tax year (see section 964(b))?
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right; padding-right:1mm;">.............</span>
									</span>
									<span style="height:5mm;width:8mm; text-align:center; ">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Income Unblocked Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
												<xsl:with-param name="BackupName">IncomeUnblockedIndYes</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="height:5mm;width:8mm; text-align:center; ">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Income Unblocked Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
												<xsl:with-param name="BackupName">IncomeUnblockedIndNo</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
								</div>
								<div class="styGenericDiv" style="width: 187mm;">
									<span class="styLNDesc" style="width: 159mm;">
										If the answer to either question is "Yes," attach an explanation.
									</span>
								</div>
								<!--   END Line 7b of Schedule I   -->
								<!--   Line 8a of Schedule I   -->
								<div class="styGenericDiv" style="width:187mm;">
									<div class="styLNLeftNumBox">8a</div>
									<span class="styLNDesc" style="width:159mm; padding-top:0.5mm;">
										<span style="float:left;">Did this U.S. shareholder have an extraordinary disposition (ED) account with respect to the foreign corporation at any time </span>
									</span>
								</div>
								<div class="styGenericDiv" style="width:187mm;height:5mm;">
									<div class="styLNLeftNumBox"/>
									<span class="styLNDesc" style="width:163mm;padding-top:1mm; ">
										<span style="float:left;">during the tax year (see instructions)?</span>
										<span class="styDotLn" style="float:right; padding-right:1mm; ">...........................</span>
									</span>
									<span style="height:5mm;width:8mm; text-align:center; ">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="EDAccountInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Extraordinary Disposition Account Indicator Yes" class="styCkbox" style="width:3mm; height:3mm;">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="EDAccountInd"/>
												<xsl:with-param name="BackupName">ExtraordinaryDispositionAccountIndYes</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="height:5mm;width:8mm; text-align:center; ">
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="EDAccountInd"/>
										</xsl:call-template>
										<input type="checkbox" alt="Extraordinary Disposition Account Indicator No" class="styCkbox" style="width:3mm; height:3mm;">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="EDAccountInd"/>
												<xsl:with-param name="BackupName">ExtraordinaryDispositionAccountIndNo</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
								</div>
								<!--   END Line 8a of Schedule I   -->
								<!--   Line 8b of Schedule I   -->
								<div class="styGenericDiv" style="width:187mm; height:9mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
									<span class="styLNDesc" style="width: 170mm;">
										<span style="float:left;">If the answer to question 8a is “Yes,” enter the U.S. shareholder’s ED account balance at the beginning of the CFC year 
										<br/>$ 
										<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BOYEDAccountBalAmt"/>
												</xsl:call-template>
											</span>
										and at the end of the tax year $ 
										<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EOYEDAccountBalAmt"/>
												</xsl:call-template>
											</span>
										. Provide an attachment detailing any changes from the beginning 
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="BOYEDAccountBalAmt"/>
											</xsl:call-template>  
											to the ending 
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="EOYEDAccountBalAmt"/>
											</xsl:call-template>
											 balances.
										</span>
									</span>
								</div>
								<!--   END Line 8b of Schedule I   -->
								<!--   Line 8c of Schedule I   -->
								<div class="styGenericDiv" style="width:187mm; padding-top:1mm; height:11mm;">
									<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
									<span class="styLNDesc" style="width: 170mm;">
										<span style="float:left;">Enter the CFC’s aggregate ED account balance with respect to all U.S. shareholders at the beginning of the CFC year
										<br/>$ 
										<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="BOYAggrgtEDAccountBalAmt"/>
												</xsl:call-template>
											</span>
										and at the end of the tax year $ 
										<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="EOYAggrgtEDAccountBalAmt"/>
												</xsl:call-template>
											</span>
										. Provide an attachment detailing any changes from the beginning 
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="BOYAggrgtEDAccountBalAmt"/>
											</xsl:call-template>
											to the ending 
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="EOYAggrgtEDAccountBalAmt"/>
											</xsl:call-template>
											balances.
										</span>
									</span>
								</div>
								<!--   END Line 8c of Schedule I   -->
								<!--   Line 9 of Schedule I   -->
								<div class="styGenericDiv" style="width:187mm;height:4mm;">
									<div class="styLNLeftNumBox">9</div>
									<span class="styLNDesc" style="width: 170mm;">
										<span style="float:left;">Enter the sum of the hybrid deduction accounts with respect to stock of the foreign corporation (see instructions) $ 
										<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="TotHybridDeductionAccountsAmt"/>
												</xsl:call-template>
											</span>
										</span>
									</span>
								</div>
								<!--   END Line 9 of Schedule I   -->
							</div>
						</xsl:for-each>
						<!--   END SECOND BULLET   -->
					</xsl:if>
					<!--BEGIN FOOTER of Page 5  -->
					<div style="width:187mm; border-color:black; border-style:solid; border-right-width: 0px; border-left-width: 0px; border-top-width:1px; border-bottom-width: 0px">
						<div style="float:right">
							Form <span class="styBoldText" style="font-size:8pt;">5471</span> (Rev. 12-2021)
                        </div>
					</div>
					<!--END FOOTER of Page 5  -->
					<br/>
					<p style="page-break-before:always"/>
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$IRS5471Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Change In Taxable Year No. 898c</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/ChangeInTaxableYearNo898cInd"/>
							<!--	<xsl:with-param name="TargetNode" select="$IRS5471Data/@ChangeInTaxableYearNo898cInd"/>-->
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Election Change In Year 898c</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/ElectionChangeInYear898cInd"/>
							<!--<xsl:with-param name="TargetNode" select="$IRS5471Data/@ElectionChangeInYear898cInd"/>-->
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section 898c Election</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/Section898cElectionInd"/>
							<!--<xsl:with-param name="TargetNode" select="$IRS5471Data/@Section898cElectionInd"/>-->
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="IRS5471PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section 338g Election</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/Section338gElectionInd"/>
							<!--<xsl:with-param name="TargetNode" select="$IRS5471Data/@Section338gElectionInd"/>-->
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Dormant Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/@dormantForeignCorporationCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Change Annual Accounting Period</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$IRS5471Data/@changeAnnualAccountingPeriodCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
					<!-- Separated Repeating Data Table Line D -->
					<xsl:if test="($Print = $Separated) and  (count($IRS5471Data/PersonInformationIsFiledFor) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 5471, Line H - Person(s) on whose behalf this information return is filed:
						</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="font-size:7pt; text-align:center;" rowspan="2">
										<b>
											<br/>(1)</b> Name
									</th>
									<th scope="col" class="styDepTblCell" style="font-size:7pt; text-align:center;" rowspan="2">
										<b>
											<br/>(2)</b> Address
									</th>
									<th scope="col" class="styDepTblCell" style="font-size:7pt; text-align:center;" rowspan="2">
										<b>
											<br/>(3)</b> Identifying number
									</th>
									<th scope="col" class="styDepTblCell" style="font-size:7pt;" colspan="3">
										<b>(4)</b> Check applicable box(es)
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell">Shareholder </th>
									<th scope="col" class="styDepTblCell">Officer </th>
									<th scope="col" class="styDepTblCell">Director </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471Data/PersonInformationIsFiledFor">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width:68mm; font-size:7pt; text-align: left;">
											<xsl:if test="PersonNm!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1Txt!=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
												<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
													</xsl:call-template>
												</xsl:if>
											</xsl:if>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:63mm; font-size 7pt; text-align:left;">
											<xsl:if test="USAddress !=''">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="USAddress"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="ForeignAddress !=''">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="ForeignAddress"/>
												</xsl:call-template>
											</xsl:if>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm; text-align:center; font-size:7pt;">
											<xsl:choose>
												<xsl:when test="EIN != ''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="SSN != ''">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="text-align:center; font-size:7pt; width:17mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderInd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="text-align:center; font-size:7pt; width:11mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="OfficerInd"/>
											</xsl:call-template>
										</td>
										<td class="styTableCell" style="text-align:center; font-size:7pt; width:14mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="DirectorInd"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data Table Line D -->
					<!-- Start Separate Data for Line 1b(2) -->
					<xsl:if test="(($Print = $Separated) and (count($IRS5471Data/ForeignEntityIdentificationGrp) &gt; 1))">
						<br/>
						<span class="styRepeatingDataTitle">
							<br/>Form 5471, Line 1b(2) - Reference ID number (see instructions):
						</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<tbody>
								<xsl:for-each select="$IRS5471Data/ForeignEntityIdentificationGrp">
									<tr>
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<span style="text-align:left;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
												</xsl:call-template>
												<br/>
											</span>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End Separate Data for Line 1b(2) -->
					<!-- Separate Data for Line 2(d) -->
					<xsl:if test="($Print = $Separated) and ( count($IRS5471Data/PersonWithRecordsCustody) &gt; 1)">
						<br/>
						<span class="styRepeatingDataTitle">
							<br/> Form 5471, Line 2(d) - Name and address (including corporate
							department, if applicable) of person (or persons) 
							with custody of the books and records of the
							foreign corporation, and the location of such
							books and records, if different:
						</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<tbody>
								<xsl:for-each select="$IRS5471Data/PersonWithRecordsCustody">
									<tr>
										<!--Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:choose>
												<xsl:when test="BusinessName/BusinessNameLine1Txt !=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="BusinessName/BusinessNameLine2Txt !=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="PersonNm"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:choose>
												<xsl:when test="USAddress">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<br/>
											<br/>
											<xsl:choose>
												<xsl:when test="LocationAddressInUS">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="LocationAddressInUS"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="LocationAddressInForeign"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<br/>
					</xsl:if>
					<!-- End Separate Data for Line 2(d) -->
					<!-- Separated Repeating Data Table for Schedule A -->
					<xsl:if test="($Print = $Separated) and  (count($IRS5471AData/StockOfTheForeignCorporation) &gt; 4)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">Form 5471, Schedule A - Stock of the Foreign Corporation:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- JMI: Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:90mm; text-align:center; font-size:7pt;" rowspan="2">
										<br/>
										<b>(a)</b> Description of each class of stock
									</th>
									<th scope="col" class="styDepTblCell" style="width:96mm; text-align:center; border-right-width:0px; font-size:7pt;" colspan="2">
										<b>(b)</b> Number of shares issued and outstanding
									</th>
								</tr>
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:48mm; text-align:center;">
										<i>(i)</i> Beginning of annual accounting period
									</th>
									<th scope="col" class="styDepTblCell" style="width:48mm; border-right-width:0px;">
										<i>(ii)</i> End of annual accounting period
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471AData/StockOfTheForeignCorporation">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width:90mm; text-align:left;">
											<xsl:choose>
												<xsl:when test="StockClassDesc">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StockClassDesc"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StockClassTypeCd "/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:48mm; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:48mm; text-align:right;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data Table for Schedule A -->
					<!-- Separated Repeating Data Table for Part I of Schedule B -->
					<xsl:if test="((count($IRS5471BData/USShareholdersOfForeignCorp) &gt; 5)
					 or (count($IRS5471BData/USShareholdersOfForeignCorp[count(ForeignCorporationStocks) &gt; 4])
					  &gt; 0)) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 5471, Schedule B Part I - U.S. Shareholders of Foreign Corporation (see instructions):
						</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:50mm; text-align:center;">
										<br/>
										<br/>
										<b>(a)</b> Name, address, and identifying number of shareholder
									</th>
									<th scope="col" class="styDepTblCell" style="width:48mm; text-align:center;">
										<b>(b)</b> Description of each class of stock held by shareholder. (<b>Note:</b>
										<i> This description should match the corresponding description entered in Schedule A, column (a).</i>
									</th>
									<th scope="col" class="styDepTblCell" style="width:30mm; text-align:center;">
										<b>(c)</b> Number of shares held at beginning of annual accounting period
									</th>
									<th scope="col" class="styDepTblCell" style="width:30mm; text-align:center; border-right-width:1px;">
										<b>(d)</b> Number of shares held at end of annual accounting period
									</th>
									<th scope="col" class="styDepTblCell" style="width:34mm; text-align:center; border-right-width:0px;">
										<b>(e)</b> Pro rata share of subpart F income (enter as a percentage)
									</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471BData/USShareholdersOfForeignCorp">
									<xsl:variable name="RowCount" select="count(ForeignCorporationStocks)"/>
									<tr style="height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell" style="width:50mm; text-align:left; font-size:6pt;">
											<xsl:choose>
												<xsl:when test="$RowCount&gt;4">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"/></xsl:attribute>
													<!--													<xsl:attribute name="height"><xsl:value-of select="$RowCount*4"/>mm</xsl:attribute>-->
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="rowspan">4</xsl:attribute>
													<xsl:attribute name="style">text-align:left;height:88mm;</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="PersonNm != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="USAddress != ''">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="ForeignAddress != ''">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<br/>
											<xsl:choose>
												<xsl:when test="ShareholderEIN != ''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="ShareholderEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ShareholderSSN != ''">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="ShareholderSSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderMissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:48mm; text-align:left; padding-left:1px; padding-right:0px; padding-top:0px; padding-bottom:0px; font-size:6pt;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/StockClassDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm; text-align:right; padding-left:1px; padding-right:0px; padding-top:0px; padding-bottom:0px; font-size:6pt;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/AnnualAcctPeriodBeginShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:30mm; text-align:right; border-right-width:1px; font-size:6pt; padding-left:1px; padding-right:0px; padding-top:0px; padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/AnnualAcctPeriodEndShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:34mm; text-align:right; font-size:5.5pt;">
											<xsl:choose>
												<xsl:when test="$RowCount&gt;4">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"/></xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="rowspan">4</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="PopulatePercent">
												<xsl:with-param name="TargetNode" select="ProRataShareSubpartFIncomeRt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<xsl:for-each select="ForeignCorporationStocks">
										<xsl:if test="not(position() = 1)">
											<tr style="height:6mm;">
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCell" style="width:48mm; text-align:left; font-size:6pt;height:6mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StockClassDesc"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:30mm; text-align:right; font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:34mm; text-align:right; border-right-width:1px; font-size:6pt;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="position()=last()">
											<xsl:call-template name="AddDepRowsScheduleB">
												<xsl:with-param name="RowNumber" select="position()"/>
												<xsl:with-param name="index" select="1"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data for Part I of Schedule B -->
					<!-- Separated Repeating Data Table for Part II of Schedule B-->
					<xsl:if test="((count($IRS5471BData/DirectShareholdersForeignCorp) &gt; 5)
					 or (count($IRS5471BData/DirectShareholdersForeignCorp[count(ForeignCorporationStocks) &gt; 4])
					  &gt; 0)) and ($Print = $Separated)">
						<br/>
						<br/>
						<span class="styRepeatingDataTitle">
							Form 5471, Schedule B Part II - Direct Shareholders of Foreign Corporation (see instructions):
						</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<tr class="styDepTblHdr">
									<th scope="col" class="styDepTblCell" style="width:58mm; text-align:center;">
										<b>(a)</b> Name, address, and identifying number of shareholder.  Also include country of incorporation or formation, if applicable.
									</th>
									<th scope="col" class="styDepTblCell" style="width:58mm; text-align:center;">
										<b>(b)</b> Description of each class of stock held by shareholder. (<b>Note:</b>
										<i> This description should match the corresponding description entered in Schedule A, column (a).</i>
									</th>
									<th scope="col" class="styDepTblCell" style="width:32mm; text-align:center;">
										<b>(c)</b> Number of shares held at beginning of annual accounting period
									</th>
									<th scope="col" class="styDepTblCell" style="width:32mm; text-align:center; border-right-width:0px;">
										<b>(d)</b> Number of shares held at end of annual accounting period
									</th>
									<!--<th scope="col" class="styDepTblCell" style="width:20mm; text-align:center; border-right-width:0px;">
										<b>(e)</b> Pro rata share of subpart F income (enter as a percentage)
									</th>-->
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$IRS5471BData/DirectShareholdersForeignCorp">
									<xsl:variable name="RowCount" select="count(ForeignCorporationStocks)"/>
									<tr style="height:6mm;">
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<td class="styTableCell">
											<xsl:choose>
												<xsl:when test="$RowCount&gt;4">
													<xsl:attribute name="rowspan"><xsl:value-of select="$RowCount"/></xsl:attribute>
													<xsl:attribute name="style">width:58mm; text-align:left;</xsl:attribute>
												</xsl:when>
												<xsl:otherwise>
													<xsl:attribute name="rowspan">4</xsl:attribute>
													<xsl:attribute name="style">width:58mm; text-align:left;height:88mm;</xsl:attribute>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:if test="PersonNm != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="PersonNm"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:if test="BusinessName/BusinessNameLine1Txt != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="USAddress != ''">
													<br/>
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="USAddress"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="ForeignAddress != ''">
													<br/>
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="ForeignAddress"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<br/>
											<xsl:choose>
												<xsl:when test="ShareholderEIN != ''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="ShareholderEIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="ShareholderSSN != ''">
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="ShareholderSSN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ShareholderMissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:choose>
												<xsl:when test="../IncorporationCountryCd != ''">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="../IncorporationCountryCd"/>
													</xsl:call-template>
												</xsl:when>
											</xsl:choose>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:58mm; text-align:left; padding-left:1px; padding-right:0px; padding-top:0px; padding-bottom:0px;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/StockClassDesc"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm; text-align:right; padding-left:1px; padding-right:0px; padding-top:0px; padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/AnnualAcctPeriodBeginShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
										<td class="styTableCell" style="width:32mm; text-align:right; border-right-width:1px; padding-left:1px; padding-right:0px; padding-top:0px; padding-bottom:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ForeignCorporationStocks[1]/AnnualAcctPeriodEndShareCnt"/>
											</xsl:call-template>
											<span class="styTableCellPad"/>
										</td>
									</tr>
									<xsl:for-each select="ForeignCorporationStocks">
										<xsl:if test="not(position() = 1)">
											<tr style="height:6mm;">
												<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
												<td class="styTableCell" style="width:58mm; text-align:left;height:6mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="StockClassDesc"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:32mm; text-align:right;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AnnualAcctPeriodBeginShareCnt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
												<td class="styTableCell" style="width:32mm; text-align:right; border-right-width:1px;;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="AnnualAcctPeriodEndShareCnt"/>
													</xsl:call-template>
													<span class="styTableCellPad"/>
												</td>
											</tr>
										</xsl:if>
										<xsl:if test="position()=last()">
											<xsl:call-template name="AddDepRowsScheduleB">
												<xsl:with-param name="RowNumber" select="position()"/>
												<xsl:with-param name="index" select="1"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<!-- /Separated Repeating Data Part II of Schedule B -->
					<!-- Additional Data Table for Separated Repeating Data from Schedule I -->
					<xsl:if test="($Print = $Separated) and (count($IRS5471IData) &gt; 1) ">
						<xsl:for-each select="$IRS5471IData">
						<br/>
							<span class="styRepeatingDataTitle">
								<br/>Form 5471, Schedule I - Summary of Shareholder’s Income From Foreign Corporation (see instructions):
							</span>
							<table class="styDepTbl" style="font-size:7pt; width:186mm;">
								<thead class="styTableThead">
									<tr class="styDepTblHdr">
								</tr>
								</thead>
								<tbody>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;" colspan="3">
											<div style="width:181mm; padding-left:2mm;">
												Name of U.S. shareholder <span style="width:2mm;"/>
												<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
												<span style="width:55mm; border-bottom: 1 solid black;">
													<xsl:choose>
														<xsl:when test="ShareholderInformation/ShareholderPersonNm != ''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderPersonNm"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:otherwise>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine1Txt"/>
															</xsl:call-template>
															<br/>
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderBusinessName/BusinessNameLine2Txt"/>
															</xsl:call-template>
														</xsl:otherwise>
													</xsl:choose>
												</span>					
												Identifying number <span style="width:2mm;"/>
												<img src="{$ImagePath}/5471_Bullet_Title.gif" alt="right pointing arrow"/>
												<span style="width:50mm; border-bottom:1 solid black; text-align:center;">
													<xsl:choose>
														<xsl:when test="ShareholderInformation/ShareholderSSN != ''">
															<xsl:call-template name="PopulateSSN">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderSSN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="ShareholderInformation/ShareholderEIN != ''">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderEIN"/>
															</xsl:call-template>
														</xsl:when>
														<xsl:when test="ShareholderInformation/ShareholderMissingEINReasonCd != ''">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="ShareholderInformation/ShareholderMissingEINReasonCd"/>
															</xsl:call-template>
														</xsl:when>
													</xsl:choose>
												</span>
											</div>
										</td>
									</tr>
									<!-- Line 1a of Schedule I -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;width:150mm;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">1a</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Section 964(e)(4) Subpart F dividend income from the sale of stock of a lower-tier foreign corporation <br/>
												</div>
											</div>
											<span style="float:left; padding-left:8mm;">(see instructions) </span>
											<div class="styDotLn" style="float:right;">............................</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;padding-top:3mm;">1a</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;padding-top:3mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFLowTierCFCRcvdAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 1b of Schedule I -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;">b</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Section 245A(e)(2) Subpart F income from hybrid dividends of tiered corporations (see instructions) 
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">..</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">1b</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFHybridDivRcvdAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 1c of Schedule I -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;">c</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Subpart F income from tiered extraordinary disposition amounts not eligible for subpart F exception <br/>
												</div>
											</div>
											<span style="float:left; padding-left:8mm;">under section 954(c)(6)</span>
											<div class="styDotLn" style="float:right;">..........................</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;padding-top:3mm;">1c</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;padding-top:3mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFIncmTieredEDAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 1d of Schedule I -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;padding-left:3mm;">d</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Subpart F income from tiered extraordinary reduction amounts not eligible for subpart F exception <br/>
												</div>
											</div>
											<span style="float:left; padding-left:8mm;">under section 954(c)(6)</span>
											<div class="styDotLn" style="float:right;">..........................</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;padding-top:3mm;">1d</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;padding-top:3mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFIncmTieredERAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 1e of Schedule I -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;">e</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Section 954(c) Subpart F Foreign Personal Holding Company Income (enter result from Worksheet A)
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">..</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">1e</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFPHCIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 1f of Schedule I -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;">f</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Section 954(d) Subpart F Foreign Base Company Sales Income (enter result from Worksheet A) 
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">....</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">1f</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFSalesIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 1g of Schedule I -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;">g</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Section 954(e) Subpart F Foreign Base Company Services Income (enter result from Worksheet A)
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">..</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">1g</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="SubpartFServicesIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 1h of Schedule I -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;  padding-left:3mm;">h</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Other subpart F income (enter result from Worksheet A)
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">...............</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">1h</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="OtherSubpartFNotIncludedAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 2 -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">2</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Earnings invested in U.S. property (enter the result from Worksheet B in the instructions)   
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">.....</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">2</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="EarningsInvestedInUSPropAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 3 of Schedule I -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left; border-bottom-width:0px;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">3</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Reserved for future use
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">.........................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm; ">3</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm; background-color:grey;">
											<!--											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect245AEligibleDividendsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>-->
										</td>
									</tr>
									<!-- Line 4 of Schedule I -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left; ">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;border-bottom-width:0px;">4</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Factoring income 
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">...........................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:bottom; font-weight:bold; width:5mm; padding-top:2mm; border-top-width:0px;">4</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm; padding-top:2mm; border-top-width:0px;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FactoringIncomeAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 4 of Schedule I -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm; border-top-width:0px;"/>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													See instructions for reporting amounts on lines 1, 2 and 4 on your income tax return.  
												</div>
											</div>
										</td>
										<td class="styDepTblCell" style="width:5mm;background-color:grey; border-right-width:0px; "/>
										<td class="styDepTblCell" style="width:33mm; background-color:grey;"/>
									</tr>
									<!-- Line 5a of Schedule I -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">5a</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Section 245A eligible dividends (see instructions)
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">...................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">5a</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Sect245AEligibleDividendsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 5b of Schedule I -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;  padding-left:3mm;">b</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Extraordinary disposition amounts (see instructions)
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">.................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">5b</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExtraordinaryDispositionAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 5c of Schedule I -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;  padding-left:3mm;">c</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Extraordinary reduction amounts (see instructions)
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">..................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">5c</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExtraordinaryReductionAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 5d of Schedule I -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;  padding-left:3mm;">d</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Section 245A(e) dividends (see instructions)
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">....................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">5d</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Section245AeDividendsAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 5e of Schedule I -->
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;  padding-left:3mm;">e</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Dividends not reported on line 5a, 5b, 5c, or 5d
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">...................</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm;">5e</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="DividendsNotReportedAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<!-- Line 6 of Schedule I -->
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left;">
											<div style="float:left;">
												<div class="styLNLeftNumBox" style="height:4mm;">6</div>
												<div class="styGenericDiv" style="height:4mm; padding-top:.5mm; padding-bottom:.5mm;">
													Exchange gain or (loss) on a distribution of previously taxed earnings and profits    
												</div>
											</div>
											<div style="float:right;">
												<div class="styDotLn">........</div>
											</div>
										</td>
										<td class="styDepTblCell" style="text-align:center; font-weight:bold; width:5mm">6</td>
										<td class="styDepTblCell" style="text-align:right; width:33mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ExchangeGainOrLossOnDistriAmt"/>
												<xsl:with-param name="MaxSize" select="17"/>
											</xsl:call-template>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left; border-bottom-width:0px;" colspan="3">
											<div class="styGenericDiv" style="width:181mm;">
												<span class="styLNDesc" style="font-size:8pt; width:180mm;">
													<span style="float:right; clear:none; padding-right:4mm;">
														<b>No</b>
														<!--		<span style="width: 1mm"/>-->
													</span>
													<span style="float:right; clear:none; padding-right:1mm;">
															<b>Yes</b>
														<span style="width:3mm;"/>
													</span>
												</span>
											</div>
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left; border-bottom-width:0px;" colspan="3">
											<!--   BEGIN line 7a of Schedule I   -->
											<div class="styGenericDiv" style="width:181mm;">
												<div class="styLNLeftNumBox">7a</div>
												<span class="styLNDesc" style="width:154mm;">
													<span style="float:left">
														Was any income of the foreign corporation blocked?
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
														</xsl:call-template>
													</span>
													<span class="styDotLn" style="float:right; padding-right:1mm;">....................</span>
												</span>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
													</xsl:call-template>
													<input type="checkbox" alt="Income Blocked Indicator Yes" class="styCkbox" style="width:4mm;">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
															<xsl:with-param name="BackupName">IncomeBlockedIndYes</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
												<span class="styNBSP" style="width:10px;"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
													</xsl:call-template>
													<input type="checkbox" alt="Income Blocked Indicator No" class="styCkbox" style="width:4mm;">
														<xsl:call-template name="PopulateNoCheckbox">
															<xsl:with-param name="TargetNode" select="IncomeBlockedInd"/>
															<xsl:with-param name="BackupName">IncomeBlockedIndNo</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
											</div>
											<!--   END line 7a of Schedule I    -->										
										</td>
									</tr>				
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left; border-bottom-width:0px;" colspan="3">
											<!--   BEGIN line 7b of Schedule I    -->
											<div class="styGenericDiv" style="width:181mm;">
												<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
												<span class="styLNDesc" style="width:154mm;">
													<span style="float:left">
														Did any such income become unblocked during the tax year (see section 964(b))?
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
														</xsl:call-template>
													</span>
													<span class="styDotLn" style="float:right; padding-right:1mm;">..........</span>
												</span>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
													</xsl:call-template>
													<input type="checkbox" alt="Income Unblocked Indicator Yes" class="styCkbox" style="width:4mm;">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
															<xsl:with-param name="BackupName">IncomeUnblockedIndYes</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
												<span class="styNBSP" style="width:10px;"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
													</xsl:call-template>
													<input type="checkbox" alt="Income Unblocked Indicator No" class="styCkbox" style="width:4mm;">
														<xsl:call-template name="PopulateNoCheckbox">
															<xsl:with-param name="TargetNode" select="IncomeUnblockedInd"/>
															<xsl:with-param name="BackupName">IncomeUnblockedIndNo</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
											</div>
											<div class="styGenericDiv" style="width:180mm;">
												<span class="styLNDesc" style="width:160mm;">
													If the answer to either question is "Yes," attach an explanation.
												</span>
											</div>
											<!--   END Line 7b of Schedule I   -->
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left; border-bottom-width:0px;" colspan="3">
											<!--   Line 8a of Schedule I   -->
											<div class="styGenericDiv" style="width:181mm;">
												<div class="styLNLeftNumBox">8a</div>
												<span class="styLNDesc" style="width:154mm; ">
													<span style="float:left;">Did this U.S. shareholder have an extraordinary disposition (ED) account with respect to the foreign corporation at any </span>
												</span>
											</div>
											<div class="styGenericDiv" style="width:181mm;height:4mm;">
												<div class="styLNLeftNumBox"/>
												<span class="styLNDesc" style="width:154mm; ">
													<span style="float:left;">time during the tax year (see instructions)?</span>
													<span class="styDotLn" style="float:right; padding-right:1mm;">.......................</span>
												</span>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="EDAccountInd"/>
													</xsl:call-template>
													<input type="checkbox" alt="Extraordinary Disposition Account Indicator Yes" class="styCkbox" style="width:4mm;">
														<xsl:call-template name="PopulateYesCheckbox">
															<xsl:with-param name="TargetNode" select="EDAccountInd"/>
															<xsl:with-param name="BackupName">ExtraordinaryDispositionAccountIndYes</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
												<span class="styNBSP" style="width: 10px"/>
												<span>
													<xsl:call-template name="PopulateSpan">
														<xsl:with-param name="TargetNode" select="EDAccountInd"/>
													</xsl:call-template>
													<input type="checkbox" alt="Extraordinary Disposition Account Indicator No" class="styCkbox" style="width:4mm;">
														<xsl:call-template name="PopulateNoCheckbox">
															<xsl:with-param name="TargetNode" select="EDAccountInd"/>
															<xsl:with-param name="BackupName">ExtraordinaryDispositionAccountIndNo</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
											</div>
											<!--   END Line 8a of Schedule I   -->
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left; border-bottom-width:0px;" colspan="3">
											<!--   Line 8b of Schedule I   -->
											<div class="styGenericDiv" style="width:181mm; height:10mm;">
												<div class="styLNLeftNumBox" style="padding-left:3mm;">b</div>
												<span class="styLNDesc" style="width: 170mm;">
													<span style="float:left;">If the answer to question 8a is “Yes,” enter the U.S. shareholder’s ED account balance at the beginning of the CFC year 
														<br/>$ 
														<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="BOYEDAccountBalAmt"/>
															</xsl:call-template>
														</span>
														and at the end of the tax year $ 
														<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="EOYEDAccountBalAmt"/>
															</xsl:call-template>
														</span>
														. Provide an attachment detailing any changes from the beginning 
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="BOYEDAccountBalAmt"/>
														</xsl:call-template>
														to the ending balances.														
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="EOYEDAccountBalAmt"/>
														</xsl:call-template>
													</span>
												</span>
											</div>
											<!--   END Line 8b of Schedule I   -->
										</td>
									</tr>
									<tr class="styDepTblRow2">
										<td class="styDepTblCell" style="text-align:left; border-bottom-width:0px;" colspan="3">
											<!--   Line 8c of Schedule I   -->
											<div class="styGenericDiv" style="width:181mm; height:10mm;">
												<div class="styLNLeftNumBox" style="padding-left:3mm;">c</div>
												<span class="styLNDesc" style="width: 170mm;">
													<span style="float:left;">Enter the CFC’s aggregate ED account balance with respect to all U.S. shareholders at the beginning of the CFC year
														<br/>$ 
														<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="BOYAggrgtEDAccountBalAmt"/>
															</xsl:call-template>
														</span>
														and at the end of the tax year $ 
														<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="EOYAggrgtEDAccountBalAmt"/>
															</xsl:call-template>
														</span>
														. Provide an attachment detailing any changes from the beginning 
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="BOYAggrgtEDAccountBalAmt"/>
														</xsl:call-template>
														to the ending balances.
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="EOYAggrgtEDAccountBalAmt"/>
														</xsl:call-template>
													</span>
												</span>
											</div>
											<!--   END Line 8c of Schedule I   -->
										</td>
									</tr>
									<tr class="styDepTblRow1">
										<td class="styDepTblCell" style="text-align:left; border-bottom-width:0px;" colspan="3">
											<!--   Line 9 of Schedule I   -->
											<div class="styGenericDiv" style="width:181mm;height:4mm;">
												<div class="styLNLeftNumBox">9</div>
												<span class="styLNDesc" style="width: 170mm;">
													<span style="float:left;">Enter the sum of the hybrid deduction accounts with respect to stock of the foreign corporation (see instructions) $ 
														<span class="sty1120FItemUnderlineSM" style="width:25mm; ">
															<xsl:call-template name="PopulateAmount">
																<xsl:with-param name="TargetNode" select="TotHybridDeductionAccountsAmt"/>
															</xsl:call-template>
														</span>
													</span>
												</span>
											</div>
											<!--   END Line 9 of Schedule I   -->
										</td>
									</tr>
								</tbody>
							</table>
						</xsl:for-each>
					</xsl:if>
					<!-- End Schedule I Separated Data -->
				</form>
			</body>
		</html>
	</xsl:template>
	<!-- Template 1 -->
	<xsl:template name="IRS5471LinkToLeftoverDataTable">
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="Style"/>
		<xsl:param name="TabOrder">1</xsl:param>
		<!-- do nothing if for printing -->
		<!-- take this out -->
		<xsl:choose>
			<xsl:when test="$TargetNode='X' or $TargetNode='x'">
				<!-- do nothing if for printing -->
				<!--xsl:if test="not($Print) or $Print=''" Commented to print pen images-->
				<xsl:if test="($TargetNode)">
					<div>
						<img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: {'Yes'}" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' + window.event.y;
						goToLeftoverDataTable( this.id );" onkeypress="this.id =window.event.x + 'and' + window.event.y;
						 goToLeftoverDataTable( this.id );"/>
					</div>
				</xsl:if>
				<!--/xsl:if-->
			</xsl:when>
			<xsl:otherwise>
				<!-- do nothing if for printing -->
				<!--xsl:if test="not($Print) or $Print=''" Commented to print pen image-->
				<xsl:if test="($TargetNode)">
					<div>
						<img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: {'No'}" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable
						 ( this.id );" onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable
						 ( this.id );"/>
					</div>
				</xsl:if>
				<!--/xsl:if-->
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Template 2 -->
	<xsl:template name="IRS5471PopulateLeftoverRow">
		<xsl:param name="Desc"/>
		<xsl:param name="TargetNode"/>
		<xsl:param name="DescWidth">100</xsl:param>
		<xsl:param name="AmountWidth" select="187 - $DescWidth"/>
		<xsl:if test="$TargetNode">
			<tr>
				<td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">
					<xsl:value-of select="$Desc"/>:
				</td>
				<td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
					<xsl:choose>
						<xsl:when test="$TargetNode='X'">Yes</xsl:when>
						<xsl:otherwise>No</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>
	<!-- Template 3 - 6 columns table -->
	<xsl:template name="AddRowsD">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="PersonCount"/>
		<xsl:if test="($PersonCount &gt;4) and ($Print = $Separated)">
			<tr>
				<td class="styTableCell" style="width:68mm; border-color:black; text-align:left; font-size:7pt;">
					<span class="styTableCellPad"/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$IRS5471Data/PersonInformationIsFiledFor/PersonNm"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="width:63mm; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:30mm; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:12mm; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:7mm; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:7mm; border-color:black; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsD">
				<xsl:with-param name="PersonCount" select="1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
		<!-- Separated data case -->
		<xsl:if test="$PersonCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="width:68mm; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:63mm; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:30mm; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:12mm; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:7mm; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:7mm; border-color:black; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsD">
				<xsl:with-param name="PersonCount" select="$PersonCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Template 4 - Schedule A - 3 columns table -->
	<xsl:template name="AddRowsScheduleAI">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="StockCount"/>
		<!-- Separated data case -->
		<xsl:if test="($StockCount &gt;4) and ($Print = $Separated)">
			<tr>
				<td class="styTableCell" style="width:68mm; border-color:black; text-align:left;">
					<span class="styTableCellPad"/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="width:48mm; text-align:right; border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="width:48mm; text-align:right; border-color:black; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsScheduleAI">
				<xsl:with-param name="StockCount" select="1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
		<!-- Separated data case Schedule A -->
		<xsl:if test="$StockCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="border-color:black; width:90mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:48mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:48mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddRowsScheduleAI">
				<xsl:with-param name="StockCount" select="$StockCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!--@@@@@@Schedule B Part I @@@@@@@@@@@@@@@@@@@@@-->
	<!-- Template 5 - Schedule B Part I - 5 columns - columns 2-4 repeat within row -->
	<!-- Begin separated data Schedule B Part I-->
	<xsl:template name="AddRowsScheduleB">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="ShareholdersCount"/>
		<xsl:param name="StockSetsCount"/>
		<xsl:if test="($ShareholdersCount &lt; 1) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:60mm; text-align:left; font-size:7pt;" rowspan="4">
					<span class="styTableCellPad"/>
					<xsl:if test="(($ShareholdersCount &gt; $NumOfRows)
					 or ($StockSetsCount&gt; 0)) and ($Print = $Separated)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$IRS5471BData/USShareholdersOfForeignCorp/PersonNm"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="border-color:black; width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 2) or ((($ShareholdersCount &gt; $NumOfRows)
		 or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:60mm;" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 3) or ((($ShareholdersCount &gt; $NumOfRows)
		 or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:60mm;" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 4) or ((($ShareholdersCount &gt; $NumOfRows)
		 or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:60mm;" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 5) or ((($ShareholdersCount &gt; $NumOfRows)
		 or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:60mm;" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Template 6 - 4 columns table -->
	<!-- AddDepRowsScheduleB -->
	<xsl:template name="AddDepRowsScheduleB">
		<xsl:param name="RowNumber"/>
		<xsl:param name="index"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr style="height:20mm;">
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styTableCell" style=" width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style=" width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style=" width:20mm; text-align:right; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddDepRowsScheduleB">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Template 7 4 columns table -->
	<!-- /AddDepRowsScheduleB -->
	<xsl:template name="AddDepSubRows">
		<xsl:param name="RowNumber"/>
		<xsl:param name="index"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styTableCell" style="border-color:black; width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddDepSubRows">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Template 8 - 4 columns table -->
	<xsl:template name="AddSubRows">
		<xsl:param name="RowNumber"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<td class="styTableCell" style="border-color:black; width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS5471TableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Template 9 - 3 columns table -->
	<xsl:template name="AddSubRows3Col">
		<xsl:param name="RowNumber"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<td class="styTableCell" style="border-color:black; width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
			</tr>
			<xsl:call-template name="AddSubRows3Col">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- End separated data Schedule B Part I-->
	<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	<!--@@@@@@Schedule B Part II@@@@@@@@@@@@@@@@@@ -->
	<!-- Template 8 - 4 columns table -->
	<xsl:template name="AddSubRowsB2">
		<xsl:param name="RowNumber"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<td class="styTableCell" style="border-color:black; width:60mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS5471TableLastCol" id="FSspcr"/>
			</tr>
			<xsl:call-template name="AddSubRowsB2">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Template 5 - Schedule B Part II - 5 columns - columns 2-4 repeat within row -->
	<!-- Begin separated data Schedule B Part II *****Problem with this template*****-->
	<xsl:template name="AddRowsScheduleB2">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="ShareholdersCount"/>
		<xsl:param name="StockSetsCount"/>
		<xsl:if test="($ShareholdersCount &lt; 1) or ((($ShareholdersCount &gt; $NumOfRows) or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:62mm; text-align:left; font-size:7pt;" rowspan="4">
					<span class="styTableCellPad"/>
					<xsl:if test="(($ShareholdersCount &gt; $NumOfRows)
					 or ($StockSetsCount&gt; 0)) and ($Print = $Separated)">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$IRS5471BData/DirectShareholdersForeignCorp/PersonNm"/>
						</xsl:call-template>
					</xsl:if>
				</td>
				<td class="styTableCell" style="border-color:black; width:61mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<!--<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>-->
			</tr>
			<xsl:call-template name="AddSubRowsB2">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 2) or ((($ShareholdersCount &gt; $NumOfRows)
		 or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:62mm;" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:61mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<!--<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>-->
			</tr>
			<xsl:call-template name="AddSubRowsB2">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 3) or ((($ShareholdersCount &gt; $NumOfRows)
		 or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:62mm;" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:61mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<!--<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>-->
			</tr>
			<xsl:call-template name="AddSubRowsB2">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 4) or ((($ShareholdersCount &gt; $NumOfRows)
		 or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:62mm;" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:61mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<!--<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>-->
			</tr>
			<xsl:call-template name="AddSubRowsB2">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="($ShareholdersCount &lt; 5) or ((($ShareholdersCount &gt; $NumOfRows)
		 or ($StockSetsCount&gt; 0)) and ($Print = $Separated))">
			<tr>
				<td class="styTableCell" style="border-color:black; width:62mm;" rowspan="4">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:61mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<!--<td class="styTableCell" rowspan="4" style="border-color:black; width:20mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>-->
			</tr>
			<xsl:call-template name="AddSubRowsB2">
				<xsl:with-param name="RowNumber">1</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Template 6 - 4 columns table -->
	<!-- AddDepRowsScheduleB *****Problem with this template*****-->
	<xsl:template name="AddDepRowsScheduleB2">
		<xsl:param name="RowNumber"/>
		<xsl:param name="index"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styTableCell" style=" width:61mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style=" width:32mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style=" width:32mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<!--<td class="styTableLastCol" id="FSspcr"/>-->
			</tr>
			<xsl:call-template name="AddDepRowsScheduleB2">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Template 7 4 columns table -->
	<!-- /AddDepRowsScheduleB *****Problem with this template*****-->
	<xsl:template name="AddDepSubRows2">
		<xsl:param name="RowNumber"/>
		<xsl:param name="index"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<xsl:attribute name="class"><xsl:choose><xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
				<td class="styTableCell" style="border-color:black; width:61mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<!--<td class="styTableLastCol" id="FSspcr"/>-->
			</tr>
			<xsl:call-template name="AddDepSubRows2">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
				<xsl:with-param name="index" select="$index + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- Template 8 - 4 columns table *****Problem with this template*****-->
	<xsl:template name="AddSubRows2">
		<xsl:param name="RowNumber"/>
		<xsl:if test="$RowNumber &lt; 4">
			<tr>
				<td class="styTableCell" style="border-color:black; width:61mm;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; width:32mm; text-align:right; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<!--<td class="styIRS5471TableLastCol" id="FSspcr"/>-->
			</tr>
			<xsl:call-template name="AddSubRows">
				<xsl:with-param name="RowNumber" select="$RowNumber + 1"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<!-- End separated data Schedule B Part I-->
	<!--@@@@@@@@@@@@@@@@@@@@@@@@-->
	<!-- Template 9 - Schedule E *****Delete ao R10.2 D5*****-->
	<!-- Begin separated data Schedule E -->
	<xsl:template name="AddRowsScheduleE">
		<xsl:param name="NumOfRows"/>
		<xsl:param name="TPCount"/>
		<!-- Separated data case  -->
		<xsl:if test="($TPCount &gt; $NumOfRows) and ($Print = $Separated)">
			<tr style="height:4mm;">
				<td class="styTableCell" style="border-color:black; width:90mm; text-align:left; ">
					<span style=" width: 2mm;"/>
					<b>2</b>
					<span style=" width: 2px;"/>
					<span class="styTableCellPad"/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$IRS5471AData/StockOfTheForeignCorporation/StockClassDesc"/>
					</xsl:call-template>
				</td>
				<td class="styTableCell" style="border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; border-right-width:1px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableLastCol" id="PAspcr"/>
			</tr>
			<xsl:call-template name="AddRowsScheduleE">
				<xsl:with-param name="TPCount" select="1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
		<!-- /Separated data case -->
		<xsl:if test="$TPCount &lt; $NumOfRows">
			<tr>
				<td class="styTableCell" style="border-color:black; width:90mm; font-size:7pt; text-align:left; padding-left:2mm;">
					<span class="styBoldText">
						<xsl:number value="$TPCount + 2"/>
					</span>
					<span style="width: 2px"/>
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; text-align:right;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styTableCell" style="border-color:black; border-right-width:0px;">
					<span class="styTableCellPad"/>
				</td>
				<td class="styIRS5471TableLastCol" id="PAspcr"/>
			</tr>
			<xsl:call-template name="AddRowsScheduleE">
				<xsl:with-param name="TPCount" select="$TPCount + 1"/>
				<xsl:with-param name="NumOfRows" select="$NumOfRows"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="IRS5471_SetInitialState">
		<xsl:if test="$Print='separated'">
			<xsl:attribute name="style">overflow:visible;height:auto;display:block;</xsl:attribute>
		</xsl:if>
	</xsl:template>
	<!-- End separated data Schedule E -->
</xsl:stylesheet>
