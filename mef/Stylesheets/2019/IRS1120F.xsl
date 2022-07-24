<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS1120FStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120F"/>
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
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1120F"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- Hint:  05/21/2014 Per Schema: Special Condition Desc does not require a pen/ink image on the top left of the style sheet.  
			  The data is	displayed in the additional data area at the end of form -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120FStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form name="Form1120F">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm; border-bottom-width:1px;">
						<div class="styFNBox" style="width:31mm; height:21mm; border-right-width:1px;">
				  Form <span class="styFormNumber" style="font-size:18pt;">1120-F</span>
							<br/>
							<!--General Dependency Push Pin -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<span style="width:3px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120F, Top Left Margin - Change of Acct PD Ind</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@changeAnnualAccountingPeriodCd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120F, Top Left Margin -Section 3019.100-2 Election Ind</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@filedPursuantToSect30191002Cd"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120F, Top Left Margin -Short Period Reason 1120 1120F Ind</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@shortPeriodReason11201120FInd"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120F, Top Left Margin -Special Condition Description</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<div style="padding-top:4mm;">
								<span class="styAgency">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
							</div>
						</div>
						<div class="styFTBox" style="width:125mm; height:21mm;">
							<br/>
							<div class="styMainTitle" style="height:8mm;">U.S. Income Tax Return of a Foreign Corporation</div>
							<div class="styFST" style="height:5mm; font-size:7pt; margin-left:2mm; text-align:center; font-weight:normal;">
					For calendar year 2019
					, or tax year beginning
					<span style="width:18mm; border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>
					, and ending 
					<span style="width:18mm; border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
								<br/>
								<br/>
								<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
								<b>Go to
					  <a style="text-decoration:none; color:black;" href="http://www.irs.gov/Form1120F" title="Link to IRS.gov">
										<i>www.irs.gov/Form1120F</i>
									</a>
					  for instructions and the latest information.									
					</b>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm; height:21mm; border-left-width:1px;">
							<div class="styOMB" style="height:4mm;">OMB No. 1545-0123</div>
							<div class="styTY" style="height:11mm; padding-top:3mm;">20<span class="styTYColor">19</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!--  Begin Header section 2 (return header address box) -->
					<div class="styBB" style="width:187mm;">
						<div class="styUseLbl" style="padding-top:8mm; width:12mm; height:32mm; font-size:10pt; border:2px solid black; border-right-width:1px;">
				  Type<br/>or<br/>Print
				</div>
						<div class="styNameBox" style="width:113mm; height:32mm; font-size:7pt; border:2px solid black; border-left:0;">
							<div valign="top" class="styNameAddr" style="width:113mm; height:10mm; padding-left:4px;">
					Name<br/>
								<span style="padding-top:1mm; padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div valign="top" class="styNameAddr" style="width:113mm; height:10mm;">
					Number, street, and room or suite no. (see instructions)<br/>
								<span style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
							<div valign="top" class="styNameAddr" style="width:113mm; height:10mm; border-bottom:0;">
					City or town, state or province, country, and ZIP or foreign postal code<br/>
								<span class="stySmallText" style="width:90mm; padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										<xsl:with-param name="MainForm">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Exception: - red triangle display in EIN field is due to EINchanged indicator-->
						<div class="styEINBox" style="width:62mm; height:10.5mm; border-bottom:1px solid black; padding-left:2mm; font-size:7pt;">
				  Employer identification number
				  <br/>
							<br/>
							<span class="styEINFld" style="font-weight:normal; padding-left:2mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="EINChanged">true</xsl:with-param>
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
						<div valign="top" class="styNameBox" style="width:62mm; border-bottom-width:0px; border-right-width:0px;">
							<span style="height:4mm; width:62mm; padding-left:1mm;">
								<b>Check box(es) if: </b>
								<span style="height:5mm; padding-left:11.6mm;">
									<!-- begin check box for initial return -->
									<input type="checkbox" alt="Initial Return Indicator" class="styCkbox" style="width:9px; height:9px;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120FInitialReturnInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/InitialReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120FInitialReturnLabel</xsl:with-param>
										</xsl:call-template>
						Initial return
					  </label>
								</span>
							</span>
							<!-- end check box for initial return -->
							<!-- begin check box for name, address change -->
							<span style="height:5mm; width:62mm;">
								<input type="checkbox" alt="Name Or Address Change Indicator" class="styCkbox" style="width:9px; height:9px;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NameOrAddressChangeInd"/>
										<xsl:with-param name="BackupName">IRS1120FNameOrAddressChangeInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/NameOrAddressChangeInd"/>
										<xsl:with-param name="BackupName">IRS1120FNameOrAddressChangeLabel</xsl:with-param>
									</xsl:call-template>
					  Name or address change
					</label>
								<!-- end check box for name, address change -->
								<!-- begin check box for final return -->
								<span style="height:5mm; padding-left:1.5mm;">
									<input type="checkbox" alt="Final Return Indicator" class="styCkbox" style="width:9px; height:9px;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120FFinalReturnInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120FinalReturnLabel</xsl:with-param>
										</xsl:call-template>
						Final return
					  </label>
								</span>
							</span>
							<!-- end check box for final return -->
							<!-- begin check box for first post-merger return -->
							<span style="height:5mm; width:62mm;">
								<input type="checkbox" alt="First Post Merger Return Indicator" class="styCkbox" style="width:9px; height:9px;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FirstPostMergerReturnInd"/>
										<xsl:with-param name="BackupName">IRS1120FFirstPostMergerReturnInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/FirstPostMergerReturnInd"/>
										<xsl:with-param name="BackupName">IRS1120FFirstPostMergerReturnLabel</xsl:with-param>
									</xsl:call-template>
					  First post-merger return
					</label>
								<!-- end check box for first post-merger return -->
								<!-- begin check box for amended return -->
								<span style="height:5mm; padding-left:2mm;">
									<input type="checkbox" alt="Amended Return Indicator" class="styCkbox" style="width:9px; height:9px;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120FAmendedReturnInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120FAmendedReturnLabel</xsl:with-param>
										</xsl:call-template>
						Amended return
					  </label>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
									</xsl:call-template>
								</span>
							</span>
							<!-- end check box for amended return -->
							<!-- begin check box for schedule M-3 attached -->
							<span style="height:4mm; width:62mm;">
								<input type="checkbox" alt="ScheduleM3 Attached Indicator" class="styCkbox" style="width:9px; height:9px;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ScheduleM3AttachedInd"/>
										<xsl:with-param name="BackupName">IRS1120FScheduleM3AttachedInd</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ScheduleM3AttachedInd"/>
										<xsl:with-param name="BackupName">IRS1120FScheduleM3AttachedLabel</xsl:with-param>
									</xsl:call-template>
					  Schedule M-3 attached		     
					</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/ScheduleM3AttachedInd"/>
								</xsl:call-template>
								<!-- end check box for schedule M-3 attached -->
								<!-- begin check box for protective return -->
								<span style="height:4mm; padding-left:3.5mm;">
									<input type="checkbox" alt="Protective Return Indicator" class="styCkbox" style="width:9px; height:9px;">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120FProtectiveReturnInd</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturnInd"/>
											<xsl:with-param name="BackupName">IRS1120FProtectiveReturnLabel</xsl:with-param>
										</xsl:call-template>
						Protective return
					  </label>
									<!-- end check box for protective return -->
									<!--<xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$FormData/ScheduleM3AttachedInd"/>
					  </xsl:call-template>-->
								</span>
							</span>
						</div>
					</div>
					<!--  End Header section 2 (return header address box) -->
					<!-- begin main content area -->
					<table class="styTable" cellspacing="0" cellpadding="0" style="font-size:7pt; width:187mm;">
						<tr>
							<!-- begin left side  -->
							<td valign="top" class="styGenericDiv" style="width:93mm;">
								<!-- begin line A  -->
								<div class="styGenericDiv" style="width:93mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;">A</div>
					  Country of incorporation
					  <span class="sty1120FItemUnderline" style="width:53mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/IncorporationCountryCd"/>
										</xsl:call-template>
									</span>
								</div>
								<!-- end line A  -->
								<!-- begin line B  -->
								<div class="styGenericDiv" style="width:93mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;">B</div>
					  Foreign country under whose laws the income reported on this return is also subject to tax
					  <span class="sty1120FItemUnderline" style="width:58mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/UndWhoseLawsIncmSubjTxCntryNm"/>
										</xsl:call-template>
									</span>
								</div>
								<!-- end line B  -->
								<!-- begin line C  -->
								<div class="styGenericDiv" style="width:93mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;">C</div>
					  Date incorporated
					  <span class="sty1120FItemUnderline" style="width:61mm;">
										<xsl:call-template name="PopulateMonthDayYear">
											<xsl:with-param name="TargetNode" select="$FormData/IncorporationDt"/>
										</xsl:call-template>
									</span>
								</div>
								<!-- end line C  -->
								<!-- begin line D (1) -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;">D</div>
									<b>(1)</b> Location of corporations primary books and records (city, province or state, and country)                              
					  <xsl:choose>
										<xsl:when test="string-length($FormData/LocationOfPrimaryBooks/CityNm) +              
											    string-length($FormData/LocationOfPrimaryBooks/ProvinceOrStateNm) + string-length($FormData/LocationOfPrimaryBooks/CountryCd) &gt; 28">
											<span class="sty1120FItemUnderlineSM" style="width:45mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/CityNm"/>
												</xsl:call-template>
											</span>
											<br/>
											<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
											<span class="sty1120FItemUnderlineSM" style="width:84mm; float:left; clear:none;">
												<xsl:if test="not($FormData/LocationOfPrimaryBooks/ProvinceOrStateNm = '')">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/ProvinceOrStateNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="not($FormData/LocationOfPrimaryBooks/ProvinceOrStateNm = '') and
												    $FormData/LocationOfPrimaryBooks/ProvinceOrStateNm and not($FormData/LocationOfPrimaryBooks/CountryCd = '') and 			
													$FormData/LocationOfPrimaryBooks/CountryCd">
													<span>, </span>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/CountryCd"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<span class="sty1120FItemUnderlineSM" style="width:44mm; ">
												<xsl:if test="not($FormData/LocationOfPrimaryBooks/CityNm= '') and $FormData/LocationOfPrimaryBooks/CityNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/CityNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="(not($FormData/LocationOfPrimaryBooks/CityNm = '') and $FormData/LocationOfPrimaryBooks/CityNm) and                 
											  ((not($FormData/LocationOfPrimaryBooks/CountryCd = '') and $FormData/LocationOfPrimaryBooks/CountryCd) or                 
											  (not($FormData/LocationOfPrimaryBooks/ProvinceOrStateNm = '') and $FormData/LocationOfPrimaryBooks/ProvinceOrStateNm))">
													<span>, </span>
												</xsl:if>
												<xsl:if test="not($FormData/LocationOfPrimaryBooks/ProvinceOrStateNm = '') and                
													$FormData/LocationOfPrimaryBooks/ProvinceOrStateNm">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/ProvinceOrStateNm"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="not($FormData/LocationOfPrimaryBooks/ProvinceOrStateNm = '') and                
													$FormData/LocationOfPrimaryBooks/ProvinceOrStateNm and not($FormData/LocationOfPrimaryBooks/CountryCd = '') and                  
													$FormData/LocationOfPrimaryBooks/CountryCd">
													<span>, </span>
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/CountryCd"/>
												</xsl:call-template>
											</span>
											<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
											<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:4mm;"/>
											<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
											<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:4mm;"/>
										</xsl:otherwise>
									</xsl:choose>
								</div>
								<!-- end line D (1) -->
								<!-- begin line D (2) -->
								<div class="styGenericDiv" style="width:93mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<b>(2) </b> Principal location of worldwide business
						<span class="sty1120FItemUnderline" style="width:29mm;"/>
									<xsl:variable name="LocUSAddressBlank">
										<xsl:value-of select="$FormData/LocationOfBooksUSAddress/AddressLine1Txt = '' and $FormData/LocationOfBooksUSAddress/AddressLine2Txt = '' and 
													     $FormData/LocationOfBooksUSAddress/CityNm = '' and $FormData/LocationOfBooksUSAddress/State = '' and 
													     $FormData/LocationOfBooksUSAddress/ZIPCd = ''"/>
									</xsl:variable>
									<xsl:variable name="LocForeignAddressBlank">
										<xsl:value-of select="$FormData/LocationOfBooksForeignAddress/AddressLine1Txt = '' and $FormData/LocationOfBooksForeignAddress/AddressLine2Txt = '' and 
                                                         $FormData/LocationOfBooksForeignAddress/CityNm = '' and $FormData/LocationOfBooksForeignAddress/ProvinceOrStateNm = '' and 
                                                         $FormData/LocationOfBooksForeignAddress/ForeignPostalCd = '' and $FormData/LocationOfBooksForeignAddress/CountryCd = ''"/>
									</xsl:variable>
									<xsl:if test="$FormData/LocationOfBooksUSAddress and $LocUSAddressBlank = 'false'">
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:auto; float:left; padding-left:6mm; clear:none;">
											<xsl:call-template name="PopulateUSAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/LocationOfBooksUSAddress"/>
											</xsl:call-template>
										</span>
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
									</xsl:if>
									<xsl:if test="$FormData/LocationOfBooksUSAddress and $LocUSAddressBlank = 'true'">
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
									</xsl:if>
									<xsl:if test="$FormData/LocationOfBooksUSAddress and $LocUSAddressBlank = ' '">
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm;height:4mm; float:left; padding-left:6mm; clear:none;"/>
									</xsl:if>
									<xsl:if test="$FormData/LocationOfBooksForeignAddress and $LocForeignAddressBlank = 'false'">
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:auto; float:left; padding-left:6mm; clear:none;">
											<xsl:call-template name="PopulateForeignAddressTemplate">
												<xsl:with-param name="TargetNode" select="$FormData/LocationOfBooksForeignAddress"/>
											</xsl:call-template>
										</span>
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
									</xsl:if>
									<xsl:if test="$FormData/LocationOfBooksForeignAddress and $LocForeignAddressBlank = 'true'">
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
									</xsl:if>
									<xsl:if test="$FormData/LocationOfBooksForeignAddress and $LocForeignAddressBlank = ' '">
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
									</xsl:if>
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<span class="sty1120FItemUnderlineSM" style="width:84mm; height:4mm; float:left; padding-left:6mm; clear:none;"/>
								</div>
								<!-- end line D (2) -->
								<!-- begin line D (3) -->
								<div class="styGenericDiv" style="width:93mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<b>(3) </b> If the corporation maintains an office or place of business in the United States, check here											
					  <!--Dotted Line-->
									<span class="styDotLn" style="float:none;">..........</span>
									<span style="padding-left:1mm;">
										<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
									</span>
									<span style="width:8px;"/>
									<input type="checkbox" alt="Maintain Office In US Indicator" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/MaintainUSOfficeInd"/>
											<xsl:with-param name="BackupName">IRS1120FMaintainOfficeInUS</xsl:with-param>
										</xsl:call-template>
									</input>
								</div>
								<!-- end line D (3) -->
							</td>
							<!-- end left side  -->
							<!-- begin right side -->
							<td class="styGenericDiv" style="width:94mm; vertical-align:top; border-left:1px solid black;">
								<!-- begin line E  -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;padding-top:0mm;">E</div>
					  If the corporation had an agent in the United States at any time during the tax year, enter: 
					</div>
								<!-- end line E  -->
								<!-- begin line E (1) -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<b>(1)</b> Type of agent					
					  <span class="sty1120FItemUnderlineSM" style="width:64mm; height:auto;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/AgentTypeDesc"/>
										</xsl:call-template>
									</span>
								</div>
								<!-- end line E (1) -->
								<!-- begin line E (2) -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<b>(2)</b> Name					
					  <span class="sty1120FItemUnderlineSM" style="width:74mm;">
										<xsl:if test="$FormData/AgentPersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/AgentPersonNm"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$FormData/USAgentName">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/USAgentName/BusinessNameLine1Txt"/>
											</xsl:call-template>
										</xsl:if>
									</span>
									<xsl:if test="$FormData/USAgentName">
										<br/>
										<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
										<span class="sty1120FItemUnderlineSM" style="width:87mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/USAgentName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</span>
									</xsl:if>
								</div>
								<!-- end line E (2) -->
								<!-- begin line E (3) -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<b>(3)</b> Address					
					  <span class="sty1120FItemUnderlineSM" style="width:71mm;"/>
									<xsl:variable name="USAddressBlank">
										<xsl:value-of select="$FormData/USAgentAddress/AddressLine1Txt = '' and $FormData/USAgentAddress/AddressLine2Txt = '' and 
													   $FormData/USAgentAddress/CityNm = '' and $FormData/USAgentAddress/State = '' and $FormData/USAgentAddress/ZIPCd = ''"/>
									</xsl:variable>
									<xsl:variable name="ForeignAddressBlank">
										<xsl:value-of select="$FormData/AgentForeignAddress/AddressLine1Txt = '' and $FormData/AgentForeignAddress/AddressLine2Txt = '' and 
													   $FormData/AgentForeignAddress/CityNm = '' and $FormData/AgentForeignAddress/ProvinceOrStateNm = '' and 
													   $FormData/AgentForeignAddress/ForeignPostalCd = '' and $FormData/AgentForeignAddress/CountryCd = ''"/>
									</xsl:variable>
									<xsl:variable name="AddressNotPresent">
										<xsl:value-of select="(not($FormData/USAgentAddress) and not($FormData/AgentForeignAddress)) or                                  
													   (not($FormData/USAgentAddress) and $ForeignAddressBlank = 'true') or 
													   (not($FormData/AgentForeignAddress) and $USAddressBlank = 'true')"/>
									</xsl:variable>
									<xsl:choose>
										<xsl:when test="$AddressNotPresent = 'true'">
											<div class="styIRS1120FLNLeftNumBox" style="width:6mm; "/>
											<span class="sty1120FItemUnderlineSM" style="width:87mm; height:4mm; float:left; padding-left:4mm; "/>
											<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
											<span class="sty1120FItemUnderlineSM" style="width:87mm; height:4mm; float:left; padding-left:4mm;"/>
										</xsl:when>
										<xsl:when test="$FormData/USAgentAddress and $USAddressBlank = 'false'">
											<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
											<span class="sty1120FItemUnderlineSM" style="width:87mm; height:auto; float:left; padding-left:4mm;">
												<xsl:call-template name="PopulateUSAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/USAgentAddress"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:when test="$FormData/AgentForeignAddress and $ForeignAddressBlank = 'false'">
											<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
											<span class="sty1120FItemUnderlineSM" style="width:87mm; height:auto; float:left; padding-left:4mm;">
												<xsl:call-template name="PopulateForeignAddressTemplate">
													<xsl:with-param name="TargetNode" select="$FormData/AgentForeignAddress"/>
												</xsl:call-template>
											</span>
										</xsl:when>
									</xsl:choose>
								</div>
								<!-- end line E (3) -->
								<!-- begin line F  -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;padding-top:0mm;">F</div>
					  See the instructions and enter the corporations principal: 
					</div>
								<!-- end line F  -->
								<!-- begin line F (1) -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<b>(1) </b>Business activity code number<span style="width:2mm;"/>
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:1mm;"/>
									<span class="sty1120FItemUnderlineSM" style="width:39mm;">
										<xsl:if test="$FormData/PrincipalBusinessActivityCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/PrincipalBusinessActivityCd"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$FormData/InactivePrincipalBusActyCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/InactivePrincipalBusActyCd"/>
											</xsl:call-template>
										</xsl:if>
									</span>
								</div>
								<!-- end line F (1) -->
								<!-- begin line F (2) -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<b>(2) </b>Business activity<span style="width:2mm;"/>
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:1mm;"/>
									<span class="sty1120FItemUnderlineSM" style="width:56mm; height:auto;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PrincipalBusinessActivityDesc"/>
										</xsl:call-template>
									</span>
								</div>
								<!-- end line F (2) -->
								<!-- begin line F (3) -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<b>(3) </b>Product or service<span style="width:2mm;"/>
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:1mm;"/>
									<span class="sty1120FItemUnderlineSM" style="width:54mm; height:auto;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/PrincipalProductDesc"/>
										</xsl:call-template>
									</span>
								</div>
								<!-- end line F (3) -->
								<!-- begin line G(1,2) -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;padding-top:1mm; ">G</div>
					  Check method of accounting:
					  <span style="padding-left:3mm;">
										<b>(1)</b>
									</span>
									<span style="padding-left:2mm;">
										<input type="checkbox" alt="Method Of Acct Cash Indicator" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingCashInd"/>
												<xsl:with-param name="BackupName">IRS1120FMethodOfAcctCashInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingCashInd"/>
											<xsl:with-param name="BackupName">IRS1120FMethodOfAcctCashLabel</xsl:with-param>
										</xsl:call-template>
										<span style="padding-left:2mm;">Cash</span>
									</label>
									<span style="padding-left:3mm;">
										<b>(2)</b>
									</span>
									<span style="padding-left:2mm;">
										<input type="checkbox" alt="Method Of Acct Accrual Indicator" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingAccrualInd"/>
												<xsl:with-param name="BackupName">IRS1120FMethodOfAcctAccrualInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingAccrualInd"/>
											<xsl:with-param name="BackupName">IRS1120FMethodOfAcctAccrualLabel</xsl:with-param>
										</xsl:call-template>
										<span style="padding-left:2mm;">Accrual</span>
									</label>
								</div>
								<!-- end line G(1,2)  -->
								<!-- begin line G (3) -->
								<div class="styGenericDiv" style="width:94mm; padding-top:1mm;">
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
									<b>(3)</b>
									<span style="padding-left:2mm;">
										<input type="checkbox" alt="Method Of Acct Other Indicator" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOtherInd"/>
												<xsl:with-param name="BackupName">IRS1120FMethodOfAcctOtherInd</xsl:with-param>
											</xsl:call-template>
										</input>
									</span>
									<span style="width:2mm;"/>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOtherInd"/>
											<xsl:with-param name="BackupName">IRS1120FMethodOfAcctOtherLabel</xsl:with-param>
										</xsl:call-template>
						Other (specify)
					  </label>
									<span style="width:2mm;"/>
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
									<span class="sty1120FItemUnderlineSM" style="width:50mm;">
										<!-- Form to Form Link -->
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
										</xsl:call-template>
									</span>
									<div class="styIRS1120FLNLeftNumBox" style="width:6mm;"/>
								</div>
								<!-- end line G (3) -->
							</td>
							<!-- end right side -->
						</tr>
					</table>
					<div class="styIRS1120Fseparater" style="font-size:8pt; border-top-width:1px;">Computation of Tax Due or Overpayment</div>
					<!-- begin table II -->
					<table cellspacing="0" cellpadding="0" style="font-size:7pt; width:187mm;" border="0">
						<!-- begin item 1 -->
						<tr>
							<td class="styIRS1120FLeftNumBox">1</td>
							<td colspan="3" class="styIRS1120FItemDesc" style="width:106mm;" scope="row">
								<span style="float:left">
								  Tax from Section I, line 11, page 3
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">..............</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">1</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="width:35mm; float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 1 -->
						<!-- begin item 2  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">2</td>
							<td colspan="3" class="styIRS1120FItemDesc" style="width:106mm;" scope="row">
								<span style="float:left">
					  Tax from Section II, Schedule J, line 9, page 5
					</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">..........</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">2</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxComputationAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="width:35mm; float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 2  -->
						<!-- begin item 3  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">3</td>
							<td colspan="3" class="styIRS1120FItemDesc" style="width:106mm;" scope="row">
								<span style="float:left;">
					  Tax from Section III (add lines 6 and 10 on page 6)
					</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">.........</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">3</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotBranchPrftExcessIntTaxAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="width:35mm; float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 3  -->
						<!-- begin item 4  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">4</td>
							<td colspan="5" class="styIRS1120FItemDesc" style="width:142mm;" scope="row">
								<span style="float:left">
									<b>Total tax.</b> Add lines 1 through 3
					</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">........................</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">4</td>
							<td class="styIRS1120FRGColumnBox" style="width:35mm; float:none; border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- end item 4  -->
						<!-- begin item 5a  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">5a</td>
							<td class="styIRS1120FItemDesc" style="width:70mm;" scope="row">
								<span style="float:left;">
					  2018 overpayment credited to 2019
					</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">.....</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">5a</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/PriorYearOverpaymentCreditAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 5a  -->
						<!-- begin item 5b  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">
								<span style="padding-left:1.5mm;">b</span>
							</td>
							<td class="styIRS1120FItemDesc" style="width:70mm;" scope="row">
								<span style="float:left">
					  2019 estimated tax payments
					  <xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Form 1120F Line 5(b), Estimated Tax Payments - Trust Indicator </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@beneficiaryTrustCd"/>
									</xsl:call-template>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Form 1120F Line 5(b), Estimated Tax Payments - Trust Payment Amount </xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@beneficiaryTrustAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">.....</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">5b</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 5b  -->
						<!-- begin item 5c  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">
								<span style="padding-left:1.5mm;">c</span>
							</td>
							<td class="styIRS1120FItemDesc" style="width:70mm;" scope="row">
								<span style="float:left;">
					  Less 2019 refund applied for on Form 4466
					  <span style="padding-left:1mm;">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaymentOfEstimatedTaxAmt"/>
										</xsl:call-template>
									</span>
									<span style="padding-left:1mm;"/>
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">.</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">5c</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">(
					<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentOfEstimatedTaxAmt"/>
								</xsl:call-template>		
				  )</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 5c  -->
						<!-- begin item 5d  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">
								<span style="padding-left:1.5mm;">d</span>
							</td>
							<td colspan="3" class="styIRS1120FItemDesc" style="width:106mm;" scope="row">
								<span style="float:left;">
					  Combine lines 5a through 5c
					</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">................</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">5d</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:0px">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 5d  -->
						<!-- begin item 5e  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">
								<span style="padding-left:1.5mm;">e</span>
							</td>
							<td colspan="3" class="styIRS1120FItemDesc" style="width:106mm;" scope="row">
								<span style="float:left">
					  Tax deposited with Form 7004
					</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">...............</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">5e</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TaxPaidForm7004Amt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 5e  -->
						<!-- begin item 5f  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">
								<span style="padding-left:1.5mm;">f</span>
							</td>
							<td colspan="3" class="styIRS1120FItemDesc" style="width:106mm;" scope="row">
								<span style="float:left;">
					  Credit for tax paid on undistributed capital gains (attach Form 2439)
					  <span style="padding-left:1mm;">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalUndistributedLTCapGainAmt"/>
										</xsl:call-template>
									</span>
									<span style="padding-left:1mm;"/>
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">5f</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalUndistributedLTCapGainAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 5f  -->
						<!-- begin item 5g  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">
								<span style="padding-left:1.5mm">g</span>
							</td>
							<td colspan="3" class="styIRS1120FItemDesc" style="width:106mm;" scope="row">
								<span style="float:left">
					  Credit for federal tax paid on fuels (attach Form 4136). See instructions
					  <span style="padding-left:1mm;">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 1120F Line 5(g), Credit From Form 4136 - Ozone Depleting Chemicals Indicator </xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt/@ozoneDepletingChemicalCd"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;"/>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">5g</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 5g  -->
						<!-- begin item 5h  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">
								<span style="padding-left:1.5mm;">h</span>
							</td>
							<td colspan="3" class="styIRS1120FItemDesc" style="width:106mm;" scope="row">
								<span style="float:left">
					  Refundable credit from Form 8827, line 5c	
					  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/CYRefundableMinimumTaxCrAmt"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">..........</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">5h</td>
							<td class="styIRS1120FColumnBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CYRefundableMinimumTaxCrAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 5h  -->
						<!-- begin item 5i  -->
						<tr>
							<td class="styIRS1120FLeftNumBox" valign="top">
								<span style="padding-left:1.5mm;">i</span>
							</td>
							<td colspan="3" class="styIRS1120FItemDesc" style="width:106mm; height:8mm;" scope="row">
					U.S. income tax paid or withheld at source (add line 12, page 3, and amounts
					<span style="float:left">from Forms 8288-A and 8805 (attach Forms 8288-A and 8805))
					  <!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxPaidOrWithheldAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">...</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:8mm; padding-top:4mm;" valign="bottom">5i</td>
							<td class="styIRS1120FColumnBox" style="height:8mm; padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IncomeTaxPaidOrWithheldAmt"/>
								</xsl:call-template>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:8mm; background:lightgrey; border-bottom-width:0px;">
								<span style="width:1px;"/>
							</td>
						</tr>
						<!-- end item 5i  -->
						<!-- begin item 5j  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">
								<span style="padding-left:1.5mm">j</span>
							</td>
							<td colspan="5" class="styIRS1120FItemDesc" style="width:142mm;" scope="row">
								<span style="float:left">
					  Total payments. Add lines 5d through 5i
					  <span style="padding-left:1mm;">
										<!-- Form to Form Link -->
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 1120F Line 5(j), Total Payments -  Backup Withholding Indicator</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@backupWithholdingTypeCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 1120F Line 5(j), Total Payments -  Backup Withholding Amount</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@backupWithholdingAmt"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">..................</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">5j</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; height:4.5mm; border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- end item 5j  -->
						<!-- begin item 6  -->
						<tr>
							<td class="styIRS1120FLeftNumBox" style="height:4.5mm;">6</td>
							<td colspan="5" class="styIRS1120FItemDesc" style="width:142mm; height:4.5mm;" scope="row">
								<span style="float:left">
					  Estimated tax penalty (see instructions). 
					  <label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/Form2220AttachedInd"/>
											<xsl:with-param name="BackupName">IRS1120FForm2220AttachedLabel</xsl:with-param>
										</xsl:call-template>
						Check if Form 2220 is attached
					  </label>
									<span style="padding-left:1mm;">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/Form2220AttachedInd"/>
										</xsl:call-template>
									</span>
								</span>
								<span style="float:right; padding-left:1mm">
									<span class="styDotLn" style="float:left; padding-right:1mm;">......</span>
									<span style="float:right;">
										<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:8px"/>
										<input type="checkbox" alt="Form 2220 Attached Indicator" class="styCkbox">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/Form2220AttachedInd"/>
												<xsl:with-param name="BackupName">IRS1120FForm2220Attached</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:8px"/>
									</span>
								</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">6</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; height:4.5mm; border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/EsPenaltyAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- end item 6  -->
						<!-- begin item 7  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">7</td>
							<td colspan="5" class="styIRS1120FItemDesc" style="width:142mm;" scope="row">
								<span style="float:left">
									<b>Amount owed. </b>If line 5j is smaller than the total of lines 4 and 6, enter amount owed
					</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">.......</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm;">7</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- end item 7  -->
						<!-- begin item 8a  -->
						<tr>
							<td class="styIRS1120FLeftNumBox">8a</td>
							<td colspan="5" class="styIRS1120FItemDesc" style="width:142mm;" scope="row">
								<span style="float:left">
									<b>Overpayment. </b>If line 5j is larger than the total of lines 4 and 6, enter amount overpaid
					</span>
								<span class="styDotLn" style="float:right; padding-right:1mm;">.......</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm;">8a</td>
							<td class="styIRS1120FRGColumnBox" style="height:4.5mm; float:none; border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentInfo1120SchFGrp/OverpaymentAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- end item 8a  -->
						<!-- begin item 8b  -->
						<tr>
							<td class="styIRS1120FLeftNumBox" style="padding-left:3mm;">b</td>
							<td colspan="5" class="styIRS1120FItemDesc" style="height:8mm; width:142mm;" scope="row">
								<b>Amount of overpayment on line 8a resulting from tax deducted and withheld under Chapters 3 and 4</b>
                    (from Schedule W, line 7, page 8)
                    <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:8mm; padding-top:4mm;">8b</td>
							<td class="styIRS1120FRGColumnBox" style="float:none; border-bottom-width:1px; padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentInfo1120SchFGrp/OvpmtWthldSpecifiedChapAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- end item 8b  -->
						<!-- begin item 9  -->
						<tr>
							<td class="styIRS1120FLeftNumBox" style="height:4.5mm; border-bottom-width:1px;">9</td>
							<td colspan="5" class="styIRS1120FItemDesc" style="width:142mm; height:4.5mm; border-bottom-width:1px;" scope="row">									
					Enter portion of line 8a you want <b>Credited to 2020 estimated tax</b>
								<span style="padding-left:1mm;">
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
								</span>
								<span valign="bottom" style="padding-left:1mm; padding-bottom:0mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentInfo1120SchFGrp/AppliedToEsTaxAmt"/>
									</xsl:call-template>
								</span>
								<!-- DO NOT add these attributes "border-style:solid;border-color:black;border-top-width:0px;border-bottom-width:0px;border-left-width: 1px;
					      border-right-width:0px;" that display a vertical line sepated estimated and refund provided impression of Dollar and cents 
						  Per Style Sheet Guideline amount is display dollars only-->
								<span style="padding-left:6mm;">
									<b>Refunded</b>
									<span style="width:1px;"/>
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="width:1px"/>
								</span>
							</td>
							<td class="styIRS1120FNumBox" style="width:6mm; height:4.5mm; border-bottom-width:1px;">9</td>
							<td class="styIRS1120FRGColumnBox" style="height:4.5mm ;float:none; border-bottom-width:1px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentInfo1120SchFGrp/RefundAmt"/>
								</xsl:call-template>
							</td>
						</tr>
						<!-- end item 9  -->
					</table>
					<!-- end table II -->
					<!--</div>-->
					<!-- begin signature section on separate printed page-->
					<!--<div class="pageEnd"/>-->
					<!-- Implementing the signature section as a table -->
					<!--<div style="width:187mm">-->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm; font-size:6pt;">
						<tr>
							<td rowspan="3" style="width:10mm; font-size:11pt;font-weight:bold; border-right:1pt solid black; border-bottom:1pt solid black;">Sign Here</td>
							<td colspan="6" style="padding-left:1mm; padding-bottom:1mm;">
				    Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, 
				    and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) 
				    is based on all information of which preparer has any knowledge. 
				  </td>
						</tr>
						<tr>
							<!-- This information is located in the return header in Business Officer Group -->
							<td rowspan="2" style="border-bottom:1pt solid black; padding-left:1mm;">
								<span style="width:1px"/>
							</td>
							<td style="width:52mm; border-right:1pt solid black; border-bottom:1pt solid black; vertical-align:bottom;">
								<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
								</xsl:call-template>
								<span style="width:1px;"/>
							</td>
							<td style="width:20mm; border-right:1pt solid black; border-bottom:1pt solid black; vertical-align:bottom; padding-left:.5mm;">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
								</xsl:call-template>
							</td>
							<td rowspan="2" style="border-bottom:1pt solid black; padding-left:1mm;">
								<span style="width:1px"/>
							</td>
							<td style="width:60mm; border-bottom:1pt solid black; vertical-align:bottom;">
								<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
								<span style="width:2mm;"/>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">Title</xsl:with-param>
								</xsl:call-template>
							</td>
							<!-- Authorize Third Party Indicator box -->
							<td rowspan="2" style="width:40mm; border-bottom:1pt solid black; padding-bottom:0mm;">
								<div class="styGenericDiv" style="width:2px;"/>
								<div style="border-right:3pt solid black; border-left:3pt solid black; border-bottom:3pt solid black; border-top:3pt solid black; float:right; padding-left:.5mm;" class="styGenericDiv">	
					  May the IRS discuss this return<br/> with the preparer shown below <br/>(see instructions)?
					  <input class="styCkbox" alt="Discuss With Paid Preparer Indicator Yes" type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">DiscussWithPaidPreparerIndicatorYes</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidyes">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
												<xsl:with-param name="BackupName">DiscussWithPaidPreparerIndicatorYesLabel</xsl:with-param>
											</xsl:call-template>
						  Yes
					    </label>
									</span>
									<input class="styCkbox" alt="Discuss With Paid Preparer Indicator No" type="checkbox" name="Checkbox" id="dummyidno" style="width:2.5mm;">
										<xsl:call-template name="PopulateReturnHeaderOfficer">
											<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">DiscussWithPaidPreparerIndicatorNo</xsl:with-param>
										</xsl:call-template>
									</input>
									<span class="styBoldText">
										<label for="dummyidno">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
												<xsl:with-param name="BackupName">DiscussWithPaidPreparerIndicatorNoLabel</xsl:with-param>
											</xsl:call-template>
						  No
					    </label>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td style="border-bottom:1pt solid black; vertical-align:top;">Signature of officer</td>
							<td style="border-bottom:1pt solid black; vertical-align:top;">Date</td>
							<td style="border-bottom:1pt solid black; vertical-align:top;">Title</td>
						</tr>
					</table>
					<!-- end signature section -->
					<!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the Preparer section in table -->
					<table border="0" cellspacing="0" cellpadding="0" style="width:187mm; font-size:6pt; border-color:black; border-bottom:1pt solid black;">
						<!--row 1-->
						<tr>
							<td rowspan="3" style="width:18mm; font-size:10pt; font-weight:bold; font-family:'arial narrow'; border-right:1pt solid black; vertical-align:top; padding-top:5mm; border-bottom:0pt solid black;">Paid Preparer Use Only
				  </td>
							<td style="width:43mm; border-right:1pt solid black; border-bottom:1pt solid black; padding-left:1mm;">
					Print/Type preparer's name <br/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Name</xsl:with-param>
								</xsl:call-template>
							</td>
							<td style="width:55mm; border-right:1pt solid black; border-bottom:1pt solid black; padding-left:1mm;">
					Preparer's signature <br/>
								<span style="width:2px;"/>
							</td>
							<td style="width:24mm; border-right:1pt solid black; border-bottom:1pt solid black; padding-left:1mm;">
					Date <br/>
								<span style="text-align:center; padding-left:7mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="width:19mm; border-right:1pt solid black; border-bottom:1pt solid black; padding-left:1mm; vertical-align:bottom; padding-bottom:.5mm;">
								<nobr>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">IRS1120FSelfEmployedCheckboxLabel</xsl:with-param>
										</xsl:call-template>Check  
					  </label>
								</nobr>
								<input class="styCkbox" type="checkbox" style="width:4mm;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
										<xsl:with-param name="BackupName">IRS1120FSelfEmployedCheckbox</xsl:with-param>
									</xsl:call-template>
								</input>
					if <br/> self-employed
				  </td>
							<td style="width:35mm; border-bottom:1pt solid black; padding-left:1mm;">
					PTIN <br/>
								<span style="text-align:center; padding-left:10mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SSN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
						</tr>
						<!--row 2-->
						<tr>
							<td rowspan="1" colspan="4" style="border-bottom:1pt solid black; border-right:1pt solid black; padding-left:.5mm;">
					Firms name
					<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:17mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="border-bottom:1pt solid black; padding-left:1mm;">
					Firms EIN
					<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</span>
								<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
						<!--row 3-->
						<tr>
							<td rowspan="1" colspan="4" style="border-bottom:0pt solid black; border-right:1pt solid black; padding-left:.5mm;">
					Firms address
					<img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="padding-left:1mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:19.5mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span>
									<span style="width:18.5mm;"/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
								</span>
								<br/>
								<span style="padding-left:18.5mm;">
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td style="border-bottom:0pt solid black; padding-left:1mm;"> Phone no. 
					<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">ForeignPhone</xsl:with-param>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- END PREPARER SIGNATURE SECTION -->
					<!-- Begin Page 1 break and footer-->
					<div class="pageEnd" style="width:187mm;">
						<span style="float:left;">
							<b>For Paperwork Reduction Act Notice, see separate instructions.</b>
							<span style="width:18mm;"/>                 
				  Cat. No. 11470I
				</span>
						<span style="float:right;">Form 
				  <span class="styBoldText" style="font-size:8pt;">1120-F </span>
							<span style="font-size:7pt"> (2019)</span>
						</span>
					</div>
					<!--<div class="pageEnd"/>-->
					<!-- ***********************************************************************-->
					<p style="page-break-before: always"/>
					<!-- End Page 1 break and footer  -->
					<!-- BEGIN Page 2 header -->
					<div class="styBB" style="width:187mm; padding-top:.5mm; border-bottom-width:2px;">
						<div style="float:left;">Form 1120-F (2019)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold; font-size:8pt;">2</span>
						</div>
					</div>
					<!--</div>-->
					<!-- END Page 2 header -->
					<!-- BEGIN 2 columns table -->
					<div class="styGenericDiv" style="width:187mm;">
						<table border="0" cellpadding="0" cellspacing="0" class="styTable" style="width:187mm; clear:both; float:none; font-size:7pt;">
							<tr>
								<!-- begin page 2  left side  height:146mm; -->
								<td class="styGenericDiv" style="width:93mm; height:auto;">
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styIRS1120FAdditionInfoTitle" style="width:92mm; height:4.5mm; border-right:1pt solid black; border-bottom:1pt solid black;">
											<b>Additional Information</b>
											<i> (continued from page 1)</i>
										</div>
									</div>
									<!-- begin Additional Information - line H  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">H</div>
										<!-- 2016 XML SpY version descrepancy where "corporation's" apostrophe is display as quote"corporation"s" and remove quote display apostrophe "corporation's" -->
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">Did the corporations method of accounting change</div>
										<div class="styIRS1120FYesNoBox" style="height:3.5mm; font-weight:bold; padding-top:.5mm;">Yes</div>
										<div class="styIRS1120FLFNoBox" style="height:3.5mm; font-weight:bold; padding-top:.5mm;">No</div>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:3.5mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
											<span style="float:left">from the preceding tax year?</span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ChangeInMethodOfAccountingInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ChangeInMethodOfAccountingInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">If Yes, attach a statement with an explanation.
						  <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/ChangeInMethodOfAccountingInd"/>
											</xsl:call-template>
										</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<!-- end Additional Information - line H  -->
									<!-- begin Additional Information - line I  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">I</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">Did the corporations method of determining income</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">change from the preceding tax year?</span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">......</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/IncomeDetermMethodChangeInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/IncomeDetermMethodChangeInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">If Yes, attach a statement with an explanation.
						  <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IncomeDetermMethodChangeInd"/>
											</xsl:call-template>
										</div>
										<div class="styShadingCell" style="width:6mm; height:4mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:4mm;"/>
									</div>
									<!-- end Additional Information - line I  -->
									<!-- begin Additional Information - line J  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">J</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
						  Did the corporation file a U.S. income tax return for
						</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">the preceding tax year?	</span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">..........</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/PrecedingUSTaxReturnInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/PrecedingUSTaxReturnInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<!-- end Additional Information - line J  -->
									<!-- begin Additional Information - line K1  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">K</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
											<b>(1) </b> At any time during the tax year, was the corporation
						</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">engaged in a trade or business in the United States? </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">.</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/TradeOrBusinessUSInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/TradeOrBusinessUSInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<!-- end Additional Information - line K1  -->
									<!-- begin Additional Information - line K2  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
											<b>(2) </b> If Yes, is taxpayers trade or business within the
						</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
						  United States solely the result of a section 897 (FIRPTA)
						</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">sale or disposition? </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">...........</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/FIRPTASaleOrDispositionInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/FIRPTASaleOrDispositionInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<!-- end Additional Information - line K2  -->
									<!-- begin Additional Information - line L -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">L</div>
										<div class="styLNDesc" style="width:72mm;height:3.5mm;">
						  Did the corporation have a permanent establishment in
						</div>
										<div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm;height:3.5mm;">
						  the United States for purposes of any applicable tax
						</div>
										<div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">
							treaty between the United States and a foreign country?
						  </span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/Sect894bTrtyUSPrmnntEstabInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/Sect894bTrtyUSPrmnntEstabInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:7.5mm;"/>
										<div class="styLNDesc" style="width:72mm;">If Yes, enter the name of the foreign country:<br/>
											<span class="sty1120FItemUnderline" style="width:70mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryCd"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm; height:7.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:7.5mm;"/>
									</div>
									<!-- end Additional Information - line L  -->
									<!-- begin Additional Information - line M  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">M</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
						  Did the corporation have any transactions with related
						</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">parties? </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">...............</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactionsInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactionsInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm;height:3.5mm;">
						  If Yes, Form 5472 may have to be filed (see 
						</div>
										<div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm;height:3.5mm;">
						  instructions).
						  <!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactionsInd"/>
											</xsl:call-template>
										</div>
										<div class="styShadingCell" style="width:6mm;height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
						  Enter number of Forms 5472 attached
						  <span style="padding-left:1mm;">
												<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											</span>
											<span style="width:1mm;"/>
											<span class="sty1120FItemUnderlineSM" style="width:18mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactionsInd/@totalForm5472FiledCnt"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm; height:4mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:4mm;"/>
									</div>
									<!-- end Additional Information - line M  -->
									<!-- begin Additional Information - line N  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">N</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">Is the corporation a controlled foreign corporation?</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:3.5mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
											<span style="float:left">(See section 957(a) for definition.) </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">......</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/FrgnCorpControlledFrgnCorpInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/FrgnCorpControlledFrgnCorpInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<!-- end Additional Information - line N  -->
									<!-- begin Additional Information - line O  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">O</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">Is the corporation a personal service corporation?</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">(See instructions for definition.) </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">.......</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/PersonalServiceCorporationInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/PersonalServiceCorporationInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<!-- end Additional Information - line O  -->
									<!-- begin Additional Information - line P  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">P</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">Enter tax-exempt interest received or accrued during</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">the tax year (see instructions)
						  <span style="padding-left:1mm">
												<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											</span>
											<span style="width:1mm"/>$
						  <span class="sty1120FItemUnderlineSM" style="width:22mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm; height:5.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:5.5mm;"/>
									</div>
									<!-- end Additional Information - line P  -->
									<!-- begin Additional Information - line Q  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">Q</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">At the end of the tax year, did the corporation own,</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">directly or indirectly, 50% or more of the voting stock</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">of a U.S. corporation? (See section 267(c) for rules</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">
							of attribution.)
							<span style="padding-left:1mm;">
													<!-- Form to Form Link -->
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/Own50PctOrMoreVotingStkInd"/>
													</xsl:call-template>
												</span>
												<span style="padding-left:1mm;"/>
											</span>
											<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/Own50PctOrMoreVotingStkInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/Own50PctOrMoreVotingStkInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">If Yes, attach a statement showing <b>(1)</b> name and</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">EIN of such U.S. corporation; <b>(2)</b> percentage owned;</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">and <b>(3)</b> taxable income or (loss) before NOL and </div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm;height:3.5mm;"> special deductions of such U.S. corporation for the</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">tax year ending with or within your tax year.</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<!-- end Additional Information - line Q  -->
									<!-- begin Additional Information - line R  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">R</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">If the corporation has an NOL for the tax year</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">and is electing to forego the carryback period,</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$FormData/NOLForegoCarrybackInd"/>
														<xsl:with-param name="BackupName">IRS1120FNOLForegoCarrybackLabel</xsl:with-param>
													</xsl:call-template>
							  check here (see instructions)
							</label>
											</span>
											<span style="float:right;">
												<span class="styDotLn" style="float:left; padding-left:1mm;">.....</span>
												<span style="float:right; padding-right:2mm;">
													<span style="padding-left:1mm;">
														<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
													</span>
													<span style="width:8px"/>
													<input type="checkbox" alt="NOL Forego Carryback Indicator" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="$FormData/NOLForegoCarrybackInd"/>
															<xsl:with-param name="BackupName">IRS1120FNOLForegoCarryback</xsl:with-param>
														</xsl:call-template>
													</input>
												</span>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm; height:4mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:4mm;"/>
									</div>
									<!-- end Additional Information - line R  -->
									<!-- begin Additional Information - line S  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">S</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">Enter the available NOL carryover from prior tax</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">years. (Do not reduce it by any deduction on line 30a,</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">page 4.)
						  <span style="padding-left:1mm;">
												<!-- Form to Form Link -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverFromPriorYearAmt"/>
												</xsl:call-template>
											</span>
											<span style="padding-left:1mm;"/>
											<span style="padding-left:2mm;">
												<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											</span>
											<span style="width:1mm;"/>
						  $
						  <span class="sty1120FItemUnderlineSM" style="width:44mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverFromPriorYearAmt"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm; height:5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:5mm;"/>
									</div>
									<!-- end Additional Information - line S  -->
									<!-- begin Additional Information - line T  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm;">T</div>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">Is the corporation a subsidiary in a parent-subsidiary</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">controlled group? </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">............</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:1px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">If Yes, enter the parent corporations:</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm; border-right-width:1px;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
										   (1) EIN
											<span style="padding-left:2mm;">
												<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											</span>
											<span class="sty1120FItemUnderlineSM" style="padding-left:2mm; width:55mm;">
												<xsl:choose>
													<xsl:when test="$FormData/ParentCorporationEIN">
														<span style="text-align:left;">
															<xsl:call-template name="PopulateEIN">
																<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationEIN"/>
															</xsl:call-template>
														</span>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm; height:5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:5mm; border-right-width:1px;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:auto; ">
										<div class="styLNLeftNumBox" style="height:auto; padding-left:3mm;"/>
										<div class="styLNDesc" style="width:72mm; height:auto;">
											(2) Name
											<span style="width:1mm;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Additional Information - Parent Corporation Name Control</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/PrntCorporationNameControlTxt"/>
											</xsl:call-template>
											<span style="padding-left:1mm;">
												<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											</span>
											<span class="sty1120FItemUnderlineSM" style="padding-left:2mm; width:60mm; height:6mm;">
												<xsl:choose>
													<xsl:when test="string-length($FormData/ParentCorporationName/BusinessNameLine1Txt) &lt; 50">
														<br/>
													</xsl:when>
												</xsl:choose>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine1Txt"/>
												</xsl:call-template>
											</span>
											<br/>
											<span class="sty1120FItemUnderlineSM" style="padding-left:2mm; width:60mm; height:6mm;">
												<xsl:choose>
													<xsl:when test="string-length($FormData/ParentCorporationName/BusinessNameLine2Txt) &lt; 50">
														<br/>
													</xsl:when>
												</xsl:choose>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</span>
										</div>
										<div class="styShadingCell" style="width:6mm; height:16.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:16.5mm; border-right-width:1px;"/>
									</div>
									<!-- end Additional Information - line T -->
									<!-- begin Additional Information - line U  -->
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm;">U</div>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">
												<b>(1) </b>Is the corporation a dealer under section 475? </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox" style="border-bottom-width:0px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:1px; border-bottom-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
											<b>(2) </b>Did the corporation mark to market any securities 
						</div>
										<div class="styShadingCell" style="width:6mm; height:3.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:3.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:4mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
											<span style="float:left">
												<span style="width:4mm;"/> or commodities other than in a dealer capacity? </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">.</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox" style="border-bottom-width:0px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:1px; border-bottom-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<!-- end Additional Information - line U -->
									<!-- begin Additional Information - line V  -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm;">V</div>
										<div class="styLNDesc" style="width:72mm; height:9.5mm;">
										  At the end of the tax year, did any individual, 
										  partnership, corporation, estate, or trust own, directly or 
                                          indirectly, 50% or more of the corporation’s voting  		  
										</div>
										<div class="styShadingCell" style="width:6mm; height:9.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:9.5mm;"/>
									</div>
									<div class="styGenericDiv" style="width:93mm; height:3.5mm;">
										<div class="styLNLeftNumBox" style="height:3.5mm; padding-left:3mm"/>
										<div class="styLNDesc" style="width:72mm; height:3.5mm;">
											<span style="float:left">stock? (See section 267(c) for rules of attribution.) </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">.</span>
										</div>
										<span style="font-weight:normal;">
											<div class="styIRS1120LNYesNoBox" style="border-bottom-width:0px;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:1px; border-bottom-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMemberInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<div class="styGenericDiv" style="width:93mm;padding-top:1mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">										
											If Yes, attach a statement showing the name and
											identifying number. (Do not include any information already entered in item <b> T. </b>)
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Own50PercentOrMoreVotingStkInd"/>
											</xsl:call-template>
<!--											<div style="float:left; clear:left; padding-top:1mm;">-->
											  Enter percentage owned 
											  <span style="padding-left:0.5mm;">
												<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											  </span>
											  <span class="sty1120FItemUnderlineSM" style="width:35mm; padding-left:2mm;">
												<xsl:call-template name="PopulatePercent">
												  <xsl:with-param name="TargetNode" select="$FormData/VotingStockOwnedPct"/>
												</xsl:call-template>
											  </span>
<!--											</div>-->
										</div>
										<div class="styShadingCell" style="width:6mm; height:18.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:18.5mm;"/>
									</div>
									<!-- end Additional Information - line V -->
								</td>
								<!--  end page 2  left side-->
								<!--@@@@@@@ RIGHT SIDE @@@@@@@ -->
								<!--  begin page 2 right side-->
								<td class="styGenericDiv" style="width:94mm; height:auto; vertical-align:top;">
									<!-- begin Additional Information - line W (1) -->
									<div class="styGenericDiv" style="width:94mm; height:32mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">W</div>
										<div style="width:85.8mm; float:left; clear:none;">
											<div class="styLNDesc" style="width:73.6mm; height:28mm;">
												<b>(1) </b>Is the corporation taking a position on this return that<br/>
												<span style="padding-left:5mm; float:left; clear:none">
												  a U.S.	tax treaty overrules or modifies an Internal Revenue law of	the United States, thereby causing
												  <span>
													<span style="float:left">  a reduction of tax?</span>
													<span class="styDotLn" style="float:right; padding-right:1mm;">...........</span>
												  </span>
												  If "Yes," the corporation is generally required to complete and attach Form 8833. 
												  See Form 8833 for exceptions.
												  <!-- Form to Form Link -->
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/USTreatyOverrulesInd"/>
													</xsl:call-template>
													<span style="width:1mm;"/>
													<br/>
													<b>Note:</b>
													<span style="width:1mm;"/>
													<i>Failure to disclose a treaty-based return position may result in a $10,000 penalty (see section 6712).</i>
												</span>
											</div>
											<div style="width:12.01mm; height:9mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:9mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:9mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/USTreatyOverrulesInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/USTreatyOverrulesInd"/>
													</xsl:call-template>
												</div>
												<div class="styShadingCell" style="width:6mm; height:19mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:19mm; border-right-width:0px;"/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - line W (1) -->
									<!-- begin Additional Information - line W (2) -->
									<div class="styGenericDiv" style="width:94mm; height:22mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;"/>
										<div style="width:85.8mm; float:left; clear: none;">
											<div class="styLNDesc" style="width:73.6mm;">
												<b>(2) </b>Is the corporation claiming treaty benefits pursuant <br/>
												<span style="padding-left:5mm; float:left; clear:none;">
												  to, or otherwise filing its return pursuant to, a Competent Authority determination or an Advance Pricing Agreement?
												  <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
													<br/>
												  If "Yes," attach a copy of the Competent Authority determination letter or Advance Pricing Agreement to your return.
												  <!-- Form to Form Link -->
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermAPAInd"/>
													</xsl:call-template>
												</span>
											</div>
											<div style="width:12.01mm; float:right; height:16mm; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:8mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:8mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermAPAInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/CompetentAuthorityDetermAPAInd"/>
													</xsl:call-template>
												</div>
												<div class="styShadingCell" style="width:6mm; height:10mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:10mm; border-right-width:0px;"/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - line W (2) -->
									<!-- begin Additional Information - line X  -->
									<div class="styGenericDiv" style="width:94mm; height:25mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">X</div>
										<div style="width:85.8mm; float:left; clear: none">
											<div class="styLNDesc" style="width:73.6mm; height:13mm;">
												During the tax year, did the corporation own any entity
												that was disregarded as an entity separate from its owner
												under Regulations sections 301.7701-2 and 301.7701-3?
												<span style="padding-left:1mm;">
													<!-- Form to Form Link -->
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/OwnedDisregardedForeignEntInd"/>
													</xsl:call-template>
												</span>
												<div style="float:left; clear:left; padding-top:1.5mm; height:10mm;">
												  If "Yes," attach a statement listing the name, country under whose
												  laws the entity was organized, and EIN (if any) of each such entity.
												</div>
											</div>
											<div style="width:12.01mm; height:22mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:7mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:7mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/OwnedDisregardedForeignEntInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/OwnedDisregardedForeignEntInd"/>
													</xsl:call-template>
												</div>
												<div class="styShadingCell" style="width:6mm; height:17mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:17mm; border-right-width:0px;"/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - line X  -->
									<!-- begin Additional Information - line Y  -->
									<div class="styGenericDiv" style="width:94mm; height:30mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">Y</div>
										<div style="width:85.8mm; float:left; clear: none; height:12.5mm;">
											<div class="styLNDesc" style="width:73.6mm; height:22mm;">
												<b>(1) </b>Did a partnership allocate to the corporation a 
													<span style="padding-left:5mm; float:left; clear:none">
													  distributive share of income from a directly owned partnership interest, any of which is ECI or treated
													  <span style="float:left">
														as ECI by the partnership or the partner?
														<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="$FormData/ECIOrTrtdECIDistriShrPrtshpInd"/>
														</xsl:call-template>
													</span>
													<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
												</span>
												<div class="styLNDesc" style="width:73.6mm; padding-left:5mm; height:4mm;">
												  If Yes, attach Schedule P. See instructions.
												</div>
												<br/>
												<div class="styLNDesc" style="width:73.6mm; height:4mm;">
													<b>(2) </b>During the tax year, did the corporation own 
												</div>
												<div class="styLNDesc" style="width:73.6mm; height:10mm; padding-left:5mm;">
												  directly or indirectly, at least a 10% interest, in 
												  <span style="float:left">
													any foreign partnership?
													<xsl:call-template name="SetFormLinkInline">
															<xsl:with-param name="TargetNode" select="$FormData/Owned10PercentIntFrgnPrtshpInd"/>
														</xsl:call-template>
													</span>
													<span class="styDotLn" style="float:right; padding-right:1mm;">.......</span>
													<span style="float:left; clear:none;">If Yes,see instructions for required attachment.</span>
												</div>
											</div>
											<div style="width:12.01mm; height:4mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm;height:10mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:10mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/ECIOrTrtdECIDistriShrPrtshpInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/ECIOrTrtdECIDistriShrPrtshpInd"/>
													</xsl:call-template>
												</div>
												<div class="styLNRightNumBox" style="width:6mm; height:11mm; float:left; clear:none; background-color:lightgrey; border-bottom-width:0px;"/>
												<div class="styShadingCellRB" style="width:6mm; height:11mm; border-right-width:0px; float:left; clear:none;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/Owned10PercentIntFrgnPrtshpInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px; padding-top:.5mm;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/Owned10PercentIntFrgnPrtshpInd"/>
													</xsl:call-template>
												</div>
												<div class="styLNRightNumBox" style="width:6mm; height:4mm ;float:left; clear:none; background-color:lightgrey; border-bottom-width:0px;"/>
												<div class="styShadingCellRB" style="width:6mm; height:4mm; border-right-width:0px;"/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - line Y  -->
									<!-- begin Additional Information - line Z  -->
									<div class="styGenericDiv" style="width:94mm; height:22mm; padding-top:2mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm;">Z</div>
										<div style="width:85.8mm; float:left; clear: none; height:12.5mm;">
											<div class="styLNDesc" style="width:73.6mm;height:19.5mm;">
												<b>(1) </b>Has the corporation engaged in any transactions the
												results of which are subject to the arm's-length standard
												under section 482 and its regulations?
												<span class="styDotLn" style="float:right; padding-right:1mm;">.....</span>
												<br/><br/>
												<b>(2) </b>Has the corporation recognized any interbranch 
												<span style="float:left; clear:none;">amounts? If Yes, attach statement (see instructions).
												  <!-- Form to Form Link -->
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/InterbranchTransactionInd"/>
													</xsl:call-template>
												</span>
											</div>
											<div style="width:12.01mm; height:10mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm;height:7mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:7mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/AllocationIncomePerSect482Ind"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/AllocationIncomePerSect482Ind"/>
													</xsl:call-template>
												</div>
												<div class="styShadingCell" style="width:6mm; height:4mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:4mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:5mm; padding-top:1mm; border-bottom-width:0px; ">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/InterbranchTransactionInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:5mm; border-right-width:0px; border-bottom-width:0px; padding-top:1mm;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/InterbranchTransactionInd"/>
													</xsl:call-template>
												</div>
											</div>
										</div>
									</div>
									<!-- end Additional Information - line Z  -->
									<!-- begin Additional Information - line AA  -->
									<div class="styGenericDiv" style="width:94mm; height:15mm;">
										<div class="styLNLeftNumBox" style="">AA</div>
										<div style="width:85.8mm; float:left; clear: none; height:9mm;">
											<div class="styLNDesc" style="width:73.6mm;">
												Is the corporation required to file Schedule UTP (Form 1120), Uncertain Tax Position Statement (see
												<span style="float:left">instructions)? </span>
												<span class="styDotLn" style="float:right; padding-right:1mm;">.............</span>
												<span style="float:left; clear:none"/>
												<div class="styLNDesc" style="width:73.6mm; height:4mm;">
												  If "Yes," complete and attach Schedule UTP.
												  <xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/UncertainTaxPositionStmtInd"/>
													</xsl:call-template>
												</div>
											</div>
											<div style="width:12.01mm; height:10mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:6mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:6mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm;  border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/UncertainTaxPositionStmtInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/UncertainTaxPositionStmtInd"/>
													</xsl:call-template>
												</div>
												<div class="styLNRightNumBox" style="width:6mm; height:8.5mm;background-color:lightgrey; border-bottom-width:0px;"/>
												<div class="styShadingCellRB" style="width:6mm;height:8.5mm; border-right-width:0px;"/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - lline AA -->
									<!-- begin Additional Information - line BB  -->
									<div class="styGenericDiv" style="width:94mm; height:16mm;">
										<div class="styLNLeftNumBox" style="">BB</div>
										<div style="width:85.8mm; float:left; clear: none; height:16mm;">
											<div class="styLNDesc" style="width:73.6mm;">
							During the corporation’s tax year, did the corporation 
							make any payments that would require it to file Forms 1042 and 1042-S under chapter 3 
							(sections 1441 through 1464) or chapter 4 (sections 1471 through 1474) of the Code?
							<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
											</div>
											<div style="width:12.01mm; height:10mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:12mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:12mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/RequiredToFileForms1042Ind"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/RequiredToFileForms1042Ind"/>
													</xsl:call-template>
												</div>
											</div>
										</div>
									</div>
									<!-- end Additional Information - lline BB -->
									<!-- begin Additional Information - line CC Question -->
									<div class="styGenericDiv" style="width:94mm; height:7mm;">
										<div class="styLNLeftNumBox" style="">CC</div>
										<div style="width:85.8mm; float:left; clear: none; height:16mm;">
											<div class="styLNDesc" style="width:73.6mm;">
						    Is the corporation (including the home office or any branch) a qualified derivatives dealer (QDD)?
						    <span class="styDotLn" style="float:right; padding-right:1mm;">....</span>
											</div>
											<div style="width:12.01mm; height:7mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:3mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:3mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/QualifiedDerivativeDealerInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/QualifiedDerivativeDealerInd"/>
													</xsl:call-template>
												</div>
											</div>
										</div>
									</div>
									<!-- end Additional Information - lline CC Question-->
									<!-- begin Additional Information - line CC(1)  -->
									<div class="styGenericDiv" style="width:94mm; height:8mm;">
										<div class="styLNLeftNumBox" style=""/>
										<div style="width:85.8mm; float:left; clear:none; height:8mm;">
											<div class="styLNDesc" style="width:73.6mm; height:8mm;">
												<b>(1) </b>If "Yes," attach Schedule Q (Form 1120-F) (see instructions).
							<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/QualifiedDerivativeDealerInd"/>
												</xsl:call-template>
											</div>
											<div style="width:12.01mm; height:8mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:8mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:8mm; border-right-width:0px;"/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - lline CC(1) -->
									<!-- begin Additional Information - line CC(2)  -->
									<div class="styGenericDiv" style="width:94mm;;">
										<div class="styLNLeftNumBox" style=""/>
										<div style="width:85.8mm; float:left; clear:none;;">
											<div class="styLNDesc" style="width:73.6mm;">
												<b>(2) </b>If "Yes" enter the QI-EIN
							<span style="padding-left:2mm">
													<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
												</span>
												<span class="sty1120FItemUnderlineSM" style="padding-left:2mm; width:22mm;">
													<xsl:choose>
														<xsl:when test="$FormData/QualifiedIntermediaryEIN ">
															<span style="text-align:left">
																<xsl:call-template name="PopulateEIN">
																	<xsl:with-param name="TargetNode" select="$FormData/QualifiedIntermediaryEIN "/>
																</xsl:call-template>
															</span>
														</xsl:when>
														<xsl:otherwise>
															<!--<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
								  </xsl:call-template>-->
														</xsl:otherwise>
													</xsl:choose>
												</span>
											</div>
											<div style="width:12.01mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:5mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:5mm; border-right-width:0px;"/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - lline CC(2) -->
									<!-- begin Additional Information - line DD  -->
									<div class="styGenericDiv" style="width:94mm;height:15mm;">
										<div class="styLNLeftNumBox" style="">DD</div>
										<div style="width:85.8mm; float:left; clear: none;">
											<!-- 2016 XMLSpy version descrepancy where "corporation's" apostrophe 
							is display as quote"corporation"s" and remove quote display apostrophe "corporation's" -->
											<div class="styLNDesc" style="width:73.6mm;">
												Does the corporation have gross receipts of at least $500 
												million in any of the 3 preceding tax years (see 
												<span style="float:left">sections 59A(e)(2) and (3))? </span>
												<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
												<span style="float:left; clear:none"/>
												<div class="styLNDesc" style="width:73.6mm; height:4mm;">
												  If "Yes," complete and attach Form 8991.
												  <xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsLast3YearsInd"/>
												  </xsl:call-template>
												</div>
											</div>
											<div style="width:12.01mm; height:8mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:7mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:7mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsLast3YearsInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/GrossReceiptsLast3YearsInd"/>
													</xsl:call-template>
												</div>
												<div class="styLNRightNumBox" style="width:6mm; height:9.5mm; background-color:lightgrey; border-bottom-width:0px;"/>
												<div class="styShadingCellRB" style="width:6mm;height:9.5mm; border-right-width:0px; "/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - lline DD -->
									<!-- begin Additional Information - line EE  -->
									<div class="styGenericDiv" style="width:94mm; height:17.5mm;">
										<div class="styLNLeftNumBox" style="">EE</div>
										<div style="width:85.8mm; float:left; clear: none; height:8mm;">
											<div class="styLNDesc" style="width:73.6mm;">
												During the tax year, did the corporation pay or accrue 
												any interest or royalty for which a deduction is not allowed 
												<span style="float:left">under section 267A (see instructions) ? </span>
												<span class="styDotLn" style="float:right; padding-right:1mm;">.....</span>
												<div class="styLNDesc" style="width:73.6mm; height:4mm;">
												  If “Yes,” enter the total amount of the disallowed <br/>
													<span style="float:left">deductions </span>
													<span class="styDotLn" style="padding-right:1mm;">...</span>
													<span style="width:1mm;"/>
													<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
													<span style="width:1mm;"/>$
													<span class="sty1120FItemUnderlineSM" style="width:18mm;">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/NondedIntRoyaltyUndSect267AAmt"/>
														</xsl:call-template>
													</span>
												</div>
											</div>
											<div style="width:12.01mm; height:8mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:7mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:7mm; border-right-width:0px; "/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/NondedIntRoyaltyUndSect267AInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom:0;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/NondedIntRoyaltyUndSect267AInd"/>
													</xsl:call-template>
												</div>
												<div class="styShadingCell" style="width:6mm; height:7mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:7mm; border-right-width:0px; float:left; "/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - lline EE -->
									<!-- begin Additional Information - line FF  -->
									<div class="styGenericDiv" style="width:94mm;height:10mm;">
										<div class="styLNLeftNumBox" style="">FF</div>
										<div style="width:85.8mm; float:left; clear: none;">
											<div class="styLNDesc" style="width:73.6mm;">
												Did the corporation have an election under section 163(j)							
												for any real property trade or business or any farming
												business in effect during the tax year (see instructions)? 
											  </div>
											<div style="width:12.01mm; height:8mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:7mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:7mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/Section163jElectionInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/Section163jElectionInd"/>
													</xsl:call-template>
												</div>
											</div>
										</div>
									</div>
									<!-- end Additional Information - lline FF -->
									<!-- begin Additional Information - line GG  -->
									<div class="styGenericDiv" style="width:94mm;height:13mm;">
										<div class="styLNLeftNumBox" style="">GG</div>
										<div style="width:85.8mm; float:left; clear: none;">
											<div class="styLNDesc" style="width:73.6mm;">						    
												Does the corporation satisfy <b>one or more</b> of the following<br/>
												<span style="float:left">(see instructions)? </span>
												<span class="styDotLn" style="float:right; padding-right:1mm;">............</span><br/>
												<b>(1) </b>The corporation owns a pass-through entity with current, or prior year carryover, excess business interest expense.
											</div>
											<div style="width:12.01mm; height:8mm; float:right; clear:none;">
												<div class="styShadingCell" style="width:6mm; height:4mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:4mm; border-right-width:0px;"/>
												<div class="styIRS1120FYesNoBox" style="width:6mm; height:3.5mm; border-bottom-width:0px;">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/SatisfyOneOrMoreConditionsInd"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:3.5mm; border-right-width:0px; border-bottom-width:0px;">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/SatisfyOneOrMoreConditionsInd"/>
													</xsl:call-template>
												</div>
												<div class="styShadingCell" style="width:6mm; height:12.5mm;"/>
												<div class="styShadingCellRB" style="width:6mm; height:12.5mm; border-right-width:0px;"/>
											</div>
										</div>
									</div>
									<!-- end Additional Information - line GG -->
								</td>
								<!--  end page 2  right side-->
							</tr>
						</table>
						<!-- begin section I description -->
					</div>
					<!-- Page 2 break and footer-->
					<div class="styBB" style="width:187mm; padding-top:0.5mm; border-top-width: 1px; border-bottom-width: 0px;">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
				  Form <span class="styBoldText" style="font-size:8pt;">1120-F</span> (2019)
				</div>
					</div>
					<p style="page-break-before:always"/>
					<!-- End page 2 break and footer  -->
					<!-- Begin Page 3 header -->
					<div class="styBB" style="width:187mm; padding-top:.5mm;">
						<div style="float:left;">Form 1120-F (2019)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold; font-size:8pt;">3</span>
						</div>
					</div>
					<!-- END Page 3 header -->
					<!-- BEGIN 2 columns table from Page 2 -->
					<div class="styGenericDiv" style="width:187mm;">
						<table border="0" cellpadding="0" cellspacing="0" class="styTable" style="width:187mm; clear:both; float:none; font-size:7pt;">
							<tr>
								<!-- begin page 3  left side  height:146mm; -->
								<!-- @@@@@@@ BEGIN Page 3 Left Side @@@@@@@ -->
								<td class="styGenericDiv" style="width:93mm; height:auto;">
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styIRS1120FAdditionInfoTitle" style="width:92mm; height:4.5mm; border-right:1pt solid black; border-bottom:1pt solid black;">
											<b>Additional Information</b>
											<i> (continued from page 2)</i>
										</div>
									</div>
									<!-- begin Line 2. of GG Line Page 3 of Additional Information -->
									<div class="styGenericDiv" style="width:93mm; padding-top:.5mm;">
										<div class="styLNLeftNumBox"/>
										<div class="styLNDesc" style="width:72mm; ">
											<b>(2) </b>The corporation's aggregate average annual gross </div>
										<div class="styIRS1120FYesNoBox" style="font-weight:bold; height:4mm; padding-top:.5mm;">Yes</div>
										<div class="styIRS1120FLFNoBox" style="font-weight:bold; height:4mm; padding-top:.5mm;">No</div>
									</div>
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm;"/>
										<div class="styLNDesc" style="width:72mm; height:13mm;">
						receipts (determined under section 448(c)) for the 3 tax years preceding the current tax year are more than $26 million and the corporation has business interest expense.<br/>
										</div>
										<div class="styShadingCell" style="width:6mm; height:13mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:13mm; border-right-width:1px;"/>
									</div>
									<!-- End Line 2. of GG Line Page 3 of Additional Information -->
									<!-- begin Line 3. of GG Line Page 3 of Additional Information -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm; padding-left:3mm;"/>
										<div class="styLNDesc" style="width:72mm; height:6.5mm;">
											<b>(3) </b>The corporation is a tax shelter and the corporation has business interest expense.
						</div>
										<div class="styShadingCell" style="width:6mm; height:6.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:6.5mm; border-right-width:1px;"/>
									</div>
									<!-- End Line 3. of GG Line Page 3 of Additional Information -->
									<!-- Begin Yes Line of Line GG Line Page 3 of Additional Information -->
									<div class="styGenericDiv" style="width:93mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:72mm; height:4mm;">
							If "Yes" to any, complete and attach Form 8990.
						  <xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/SatisfyOneOrMoreConditionsInd"/>
											</xsl:call-template>
										</div>
										<div class="styShadingCell" style="width:6mm; height:4mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:4mm;"/>
									</div>
								</td>
								<!-- @@@@@@@ END Page 3 Left Side @@@@@@@ -->
								<!-- @@@@@@@ BEGIN Page 3 Right Side @@@@@@@ -->
								<!--  begin page 3 right side-->
								<td class="styGenericDiv" style="width:94mm; height:auto; vertical-align:top;">
									<!-- begin Additional Information - Yes and No label line -->
									<div class="styGenericDiv" style="width:94mm;">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:73.6mm; height:4mm;"/>
										<div style="width:12.1mm; height:4mm; float:left; clear:none;">
											<div class="styIRS1120FYesNoBox" style="width:6mm; height:4mm; float:left; clear:none; font-weight:bold; padding-top:1mm;">Yes </div>
											<div class="styIRS1120FYesNoBoxRB" style="width:6mm; height:4mm; float:left; clear:none; font-weight:bold; padding-top:1mm; border-right-width:0px;">No </div>
										</div>
									</div>
									<!-- end Additional Information - Yes and No label line -->
									<!-- Begin Line HH Page 3 Additional Information  -->
									<div class="styGenericDiv" style="width:94mm; height:11.5mm;">
										<div class="styLNLeftNumBox" style="height:4mm;">HH</div>
										<div class="styLNDesc" style="width:73.6mm; height:7.5mm; border-right-width:0px;">
						  During the tax year, did the corporation dispose of an 
						  interest in a partnership that directly or indirectly engaged 
						  <span style="float:left; ">in a trade or business within the United States? </span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">...</span>
										</div>
										<div class="styShadingCell" style="width:6mm; height:7mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:7mm; border-right-width:0px;"/>
										<span style="font-weight:normal; border-right-width:0px; height:4mm;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactionsInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactionsInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<!-- End Line HH Page 3 Additional Information  -->
									<!-- Begin Line II Page 3 Additional Information  -->
									<div class="styGenericDiv" style="width:94mm; height:7.5mm;">
										<div class="styLNLeftNumBox" style="height:4mm;">II</div>
										<div class="styLNDesc" style="width:73.6mm; height:7.7mm; border-right-width:0px;">
										  Is the corporation attaching Form 8996 to certify as a <br/>
											<span style="float:left; ">
												Qualified Opportunity Fund
												  <xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/QlfyOpportunityFundPenaltyAmt"/>
												</xsl:call-template>		
												?
											</span>
											<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
										</div>
										<div class="styShadingCell" style="width:6mm; height:4mm;"/>
										<div class="styShadingCellRB" style="width:6mm; height:4mm; border-right-width:0px;"/>
										<span style="font-weight:normal; border-right-width:0px; height:4mm;">
											<div class="styIRS1120LNYesNoBox">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/Form8996AttachedInd"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120LNYesNoBoxRB" style="border-right-width:0px;">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/Form8996AttachedInd"/>
												</xsl:call-template>
											</div>
										</span>
									</div>
									<div class="styGenericDiv" style="width:94mm; ">
										<div class="styLNLeftNumBox" style="height:4mm;"/>
										<div class="styLNDesc" style="width:73.6mm;height:6.5mm; border-right-width:0px;">
										  If “Yes,” enter amount from Form 8996, line 14 				  
										  <br/>
										  <img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
										  <span style="width:1mm;"/>$
										  <span class="sty1120FItemUnderlineSM" style="width:18mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/QlfyOpportunityFundPenaltyAmt"/>
											</xsl:call-template>
										  </span>
										</div>
										<div class="styShadingCell" style="width:6mm;height:9.5mm;"/>
										<div class="styShadingCellRB" style="width:6mm;height:9.5mm; border-right-width:0px;"/>
									</div>
									<!-- End Line II Page 3 Additional Information  -->
								</td>
								<!-- @@@@@@@ END Page 3 Right Side @@@@@@@ -->
							</tr>
						</table>
						<!-- begin section I description -->
					</div>
					<!-- BEGIN SECTION I -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td style="float:left; font-size:7pt; font-weight:bold; padding-top:1mm; padding-bottom:1mm;">
						SECTION IIncome From U.S. Sources Not Effectively Connected With the Conduct of a Trade or Business in the United States
						<span style="font-size:7pt; font-weight:normal;">Do not report items properly withheld and reported on Form 1042-S. See instructions.</span>
							</td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="float:left; font-size:6pt; font-weight:normal; clear:none; padding-bottom:1mm; padding-top:1mm;">
							Report all gross transportation income subject to 4% tax on line 9. Report other column (a) income items only if not properly withheld and reported on Form 1042-S.  The rate 
							of tax on these <b>gross</b> income items is 30% or such lower rate specified by tax treaty.  No deductions are allowed against these types of income. Enter treaty rates where applicable. 
							<b>If the corporation is claiming a lower treaty rate, also complete item W on page 2.</b> If multiple treaty rates apply to a type of income (e.g., subsidiary and 
							portfolio dividends or dividends received by disregarded entities), attach a statement showing the amounts, tax rates, and withholding for each.	
							<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- end section I description -->
					<!-- begin name of treaty country -->
					<div class="styBB" style="width:187mm; clear:none; padding-bottom:0.5mm;">
						<div style="text-align:left; float:left; margin-top:0px; font-size:7pt;">Name of treaty country, if any
						<span style="padding-left:1mm;">
								<img src="{$ImagePath}/1120F_Bullet_Md.gif" valign="middle" alt="MediumBullet"/>
							</span>
							<span class="sty1120FItemUnderline" style="padding-left:1mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/TreatyCountryCd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- end name of treaty country -->
					<!-- begin name of treaty country table -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyLF" style="width:65mm;">
							<b>(a)</b>
							<br/> Class of income (see instructions)</div>
						<div class="styIRS1120FDivTreatyLF" style="width:31mm;">
							<b>(b)</b>
							<br/> Gross amount</div>
						<div class="styIRS1120FDivTreatyLF" style="width:25mm;">
							<b>(c)</b>
							<br/> Rate of tax (%)</div>
						<div class="styIRS1120FDivTreatyLF" style="width:32mm;">
							<b>(d)</b>
							<br/> Amount of tax liability</div>
						<div class="styIRS1120FDivTreatyRG" style="width:33mm;">
							<b>(e)</b>
							<br/> Amount of U.S. income tax paid or withheld at the source</div>
					</div>
					<!-- Line 1, Section I -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="float:left; padding-left:1mm; padding-right:2mm; font-weight:bold;">1</span>
							<span style="float:left;">
								Interest 
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">.............</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/InterestIncmClassGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center; padding-top:1mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/InterestIncmClassGrp/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/InterestIncmClassGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/InterestIncmClassGrp/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--Line 2a, Section I -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:7.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="padding-left:1mm; padding-right:2mm; font-weight:bold;">2a 
								<span style="font-weight:normal;">Dividends (excluding payments received by QDDs in </span>
							</span>
							<span style="padding-left:4.5mm;">their equity derivatives dealer capacity) </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">...</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/DividendExcldQDDGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:7.5mm; text-align:center; padding-top:4mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/DividendExcldQDDGrp/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/DividendExcldQDDGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/DividendExcldQDDGrp/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 2b, Section I, -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:7.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="padding-left:1mm; padding-right:2mm; font-weight:bold;">2b
								<span style="font-weight:normal;">Dividend equivalents (excluding payments received </span>
							</span>
							<span style="padding-left:4.5mm;">by QDDs in their equity derivatives dealer capacity) </span>
							<!--<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>-->
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/DividendEquivalentExcldQDDGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:7.5mm; text-align:center; padding-top:4mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/DividendEquivalentExcldQDDGrp/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/DividendEquivalentExcldQDDGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/DividendEquivalentExcldQDDGrp/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 3, Section I  -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="float:left; padding-left:1mm; padding-right:2mm; font-weight:bold;">3</span>
							<span style="float:left;">Rents </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">.............</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/RentsIncmClassGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center; padding-top:1mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/RentsIncmClassGrp/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/RentsIncmClassGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/RentsIncmClassGrp/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 4, Section I  -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="float:left; padding-left:1mm; padding-right:2mm; font-weight:bold;">4</span>
							<span style="float:left">Royalties </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">............</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/RoyaltiesIncmClassGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center; padding-top:1mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/RoyaltiesIncmClassGrp/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/RoyaltiesIncmClassGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/RoyaltiesIncmClassGrp/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 5, Section I  -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="float:left; padding-left:1mm; padding-right:2mm; font-weight:bold;">5</span>
							<span style="float:left">Annuities </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">............</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/AnnuitiesIncmClassGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center; padding-top:1mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/AnnuitiesIncmClassGrp/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/AnnuitiesIncmClassGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/AnnuitiesIncmClassGrp/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 6, Section I  -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:9.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="padding-left:1mm; padding-right:2mm; font-weight:bold;">6</span>Gains from disposal of timber, coal, or domestic
							<span style="padding-left:4.5mm;">iron ore with a retained economic interest (attach </span>
							<span style="float:left; padding-left:4.5mm;">supporting statement)
							<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposalIncmClassGrp"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">........</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:9.5mm; padding-top:6mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposalIncmClassGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:9.5mm; text-align:center; padding-top:6mm">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposalIncmClassGrp/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:9.5mm; padding-top:6mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposalIncmClassGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:9.5mm; padding-top:6mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposalIncmClassGrp/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 7, Section I  -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:7.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="padding-left:1mm; padding-right:2mm; font-weight:bold;">7</span>
							Gains from sale or exchange of patents, <br/>
							<span style="float:left; padding-left:4.5mm;">copyrights, etc. 
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromSaleExchIncmClassGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:7.5mm; text-align:center; padding-top:4mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromSaleExchIncmClassGrp/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromSaleExchIncmClassGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromSaleExchIncmClassGrp/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 8, Section I  -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:7.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="padding-left:1mm; padding-right:1mm; font-weight:bold;">8</span>
							Fiduciary distributions (attach supporting <br/>
							<span style="padding-left:4mm;">statement) </span>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistriIncmClassGrp"/>
							</xsl:call-template>
							<span class="styDotLn" style="float:right; padding-right:1mm;">...........</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:7.5mm; padding-top:4mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistriIncmClassGrp/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; text-align:center; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistriIncmClassGrp/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:7.5mm; padding-top:4mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistriIncmClassGrp/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:7.5mm; padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistriIncmClassGrp/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 9, Section I  -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="float:left; padding-left:1mm; padding-right:2mm; font-weight:bold;">9</span>
							<span style="float:left;">Gross transportation income  (see instructions) </span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">..</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm; padding-top:1mm;">
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GrossTransporationIncome/GrossAmt"/>
							</xsl:call-template>
							<span style="width:2mm;"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GrossTransporationIncome/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center; font-size:7pt; font-weight:bold; padding-top:1mm;">4</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GrossTransporationIncome/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; background:lightgrey;"/>
					</div>
					<!-- Line 10, Section I  -->
					<div style="width:187mm; clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="float:left; padding-left:0mm; padding-right:1mm; font-weight:bold; padding-top:.75mm;">10</span>
							<!--<span style="padding-left:0mm; padding-right:1mm; font-weight:bold;">10</span>-->
							<span style="float:left;">Other items of income 
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right; padding-right:1mm;">.......</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains/GrossAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center; padding-top:1mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains/TaxRt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains/TaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="width:4.5mm"/>
							<span class="sty1120FItemUnderlineSM" style="float:none">
								<span style="width:1px"/>
							</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm; padding-top:1mm;"/>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center; padding-top:1mm;"/>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; padding-top:1mm;"/>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; padding-top:1mm;"/>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="width:4.5mm"/>
							<span class="sty1120FItemUnderlineSM" style="float:none">
								<span style="width:1px"/>
							</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm; padding-top:1mm;"/>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center; padding-top:1mm;"/>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; padding-top:1mm;"/>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; padding-top:1mm;"/>
					</div>
					<!-- Line 11, Section I  -->
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:121mm; height:4.5mm; border-bottom-width:0px; padding-top:1mm;">
							<span style="padding-left:0mm; padding-right:1mm; font-weight:bold">11</span>
							Total. Enter here and on line 1, page 1
							<span class="styDotLn" style="float:none">.................<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
							</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/TotalTaxLiabilityAmt"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; background:lightgrey; padding-top:1mm;"/>
					</div>
					<!-- Line 12, Section I  -->
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:153mm; height:4.5mm; padding-top:1mm;">
							<span style="padding-left:0mm; padding-right:1mm; font-weight:bold">12</span>
							Total. Enter here and include on line 5i, page 1
							<span class="styDotLn" style="float:none">.......................<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
							</span>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/TotIncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- Line 13, Section I  -->
					<div style="width:187mm; clear:none; padding-bottom:.5mm; padding-top:.5mm">
						<div class="styIRS1120FDivTreatyDataRG" style="width:187mm; height:9mm; text-align:left;">
							<span style="padding-left:0mm; padding-right:1mm; font-weight:bold;">13</span>
							Is the corporation fiscally transparent under the laws of the foreign jurisdiction with respect to any item of income listed above?		
							<span style="padding-left:11mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparentInd"/>
								</xsl:call-template>
								<!-- begin check box for Yes -->
								<input type="checkbox" alt="Corporation Fiscally Transparent Indicator Yes" class="styCkbox">
									<xsl:call-template name="PopulateYesCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparentInd"/>
										<xsl:with-param name="BackupName">CorporationFiscallyTransparentIndicatorYes</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparentInd"/>
										<xsl:with-param name="BackupName">CorporationFiscallyTransparentIndicatorYesLabel</xsl:with-param>
									</xsl:call-template>
									<span style="padding-left:2mm;">
										<b>Yes</b>
									</span>
								</label>
							</span>
							<!-- end check box for Yes -->
							<!-- begin check box for No -->
							<span style="padding-left:8mm;">
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparentInd"/>
								</xsl:call-template>
								<input type="checkbox" alt="Corporation Fiscally Transparent Indicator No" class="styCkbox">
									<xsl:call-template name="PopulateNoCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparentInd"/>
										<xsl:with-param name="BackupName">CorporationFiscallyTransparentIndicatorNo</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparentInd"/>
										<xsl:with-param name="BackupName">CorporationFiscallyTransparentIndicatorNoLabel</xsl:with-param>
									</xsl:call-template>
									<span style="padding-left:2mm;">
										<b>No</b>
									</span>
								</label>
							</span>
							<br/>
							<span style="padding-left:4.5mm;">
								If Yes, attach a statement that provides the information requested above with respect to each such item of income.
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparentInd"/>
								</xsl:call-template>
							</span>
							<!-- end check box for No -->
						</div>
					</div>
					<!-- end name of treaty country table -->
					<!-- page break and footer-->
					<div style="width:187mm; padding-top:0.5mm;">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">1120-F</span> (2019)
						</div>
					</div>
					<div class="pageEnd"/>
					<p style="page-break-before:always"/>
					<!-- end page break and footer  -->
					<!-- begin page 3 -->
					<!-- page header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120-F (2019)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- end page header -->
					<!-- begin section II description -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle" style="width:187mm;">
						<tr>
							<td style="float:left; font-size: 8pt; font-weight:bold; padding-top:1mm; padding-bottom:1mm">
								SECTION II Income Effectively Connected With the Conduct of a Trade or Business in the United States<br/>
								<span style="font-size:7pt; font-weight:normal;">(see instructions)</span>
							</td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="float:left; font-size:7pt; font-weight:normal; clear:none; width:187mm;">
								<b>Important:</b>
								<span style="padding-left:1mm;">
									<i>Fill in all applicable lines and schedules. If you need more space, see 
									<b>Assembling the Return</b> in the instructions.</i>
								</span>
							</td>
						</tr>
					</table>
					<!-- end section I description -->
					<!--begin Income Section-->
					<!--HINT: create image using snagit of actual form PDF image -->
					<div class="styBB" style="width:187mm; border-bottom-width:1px;">
						<div class="styIRS1120FVTImageBox" style="height:51mm; padding-top:16mm;">
							<img src="{$ImagePath}/1120F_Income2018.gif" alt="VerticalIncome" style="height:15mm;"/>
						</div>
						<div style="width:181mm; float:right; clear:none;">
							<!-- begin line 1a -->
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span class="styBoldText" style="font-size:7pt; padding-left:1.25mm">1a</span>
							</div>
							<div class="styLNDesc" style="width:133mm;">
								<div class="styLNDesc" style="width:26mm; height:4mm;">
									<span class="styArialText" style="">Gross receipts or sales</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossReceiptsOrSalesAmt"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:30mm; border-bottom-width:1px; border-right-width:1px; height:4mm;">
									<span style="text-align:right;font-family:arial;font-size:8pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossReceiptsOrSalesAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNDesc" style="width:35mm; height:4mm; padding-left:2mm;">
									<span class="styBoldText" style="width:3mm; float:left; clear:none;">b</span>
									<span class="styArialText" style="float:left; clear:none;">Less returns and allowances</span>
								</div>
								<div class="styLNAmountBox" style="width:28mm; text-align:right; border-bottom-width:1px; border-right-width:1px; height:4mm; font-family:arial; font-size:8pt;">
									<span style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/ReturnsAndAllowancesAmt"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNDesc" style="width:14.0mm; height:4mm; padding-left:2mm;">
									<span style="float:left;">
										<span class="styBoldText">c</span>
										<span style="width:1mm"/> Bal<span style="width:1mm;"/>
									</span>
									<span style="float:right;">
										<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="MidSizeBullet"/>
									</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;">1c</div>
							<div class="styLNAmountBox" style="height:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/NetGrossReceiptsOrSalesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 1a -->
						<!-- begin line 2 -->
						<div style="width:181mm; float:right; clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm; padding-left:2.25mm;">2</div>
							<div class="styLNDesc" style="width:133mm; height:4mm;">
								<span style="float:left">
								Cost of goods sold (attach Form 1125-A)
								<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CostOfGoodsSoldAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CostOfGoodsSoldAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 2 -->
						<!-- begin line 3 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">3</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Gross profit (subtract line 2 from line 1c)
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossProfitAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 3 -->
						<!-- begin line 4 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Dividends (Schedule C, line 13)
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalDividendsReceivedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 4 -->
						<!-- begin line 5 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">5</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Interest
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">5</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TaxableInterestAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 5 -->
						<!-- begin line 6 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">6</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Gross rents
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">6</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossRentsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 6 -->
						<!-- begin line 7 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">7</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Gross royalties
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">7</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossRoyaltiesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 7 -->
						<!-- begin line 8 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">8</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Capital gain net income (attach Schedule D (Form 1120))
									<span style="padding-left:1mm;">
										<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CapitalGainNetIncomeAmt"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CapitalGainNetIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 8 -->
						<!-- begin line 9 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">9</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Net gain or (loss) from Form 4797, Part II, line 17 (attach Form 4797)
									<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalOrdinaryGainLossAmt"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part II,Line 9 - Form 4684 Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalOrdinaryGainLossAmt/@form4684Cd"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalOrdinaryGainLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 9 -->
						<!-- begin line 10 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Other income (see instructionsattach statement)
								<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OtherIncomeAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OtherIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 10 -->
						<!-- begin line 11 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">11</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<b>Total income.</b> Add lines 3 through 10
								</span>
								<span style="float:right;padding-right:2mm;">
									<span class="styDotLn" style="float:none">...................</span>
									<span style="width:3mm"/>
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="MidSizeBullet"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm; border-bottom-width:0px">11</div>
							<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 11 -->
					</div>
					<!-- end Income Section-->
					<!-- begin Deduction Section-->
					<!--HINT: create image using snagit of actual form PDF image -->
					<div class="styBB" style="width:187mm;border-bottom-width:1px">
						<div class="styIRS1120FVTImageBox" style="height:99.5mm;padding-top:1mm;padding-left:.5mm;">
							<img src="{$ImagePath}/1120F_Deductions2018.gif" alt="Deductions (See instructions for limitations on deductions)" style="height:97.5mm;"/>
						</div>
						<!-- begin line 12 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Compensation of officers (see instructions—attach Form 1125-E)
										<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OfficersCompensationAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OfficersCompensationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 12 -->
						<!-- begin line 13 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">13</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Salaries and wages (less employment credits)
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/SalariesAndWagesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 13 -->
						<!-- begin line 14 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">14</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Repairs and maintenance
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">14</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/RepairsAndMaintenanceAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 14 -->
						<!-- begin line 15 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">15</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Bad debts (for bad debts over $500,000, attach a list of debtors and amounts)
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/BadDebtExpenseAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/BadDebtExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 15 -->
						<!-- begin line 16 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">16</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Rents
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">16</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalRentOrLeaseExpenseAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 16 -->
						<!-- begin line 17 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">17</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Taxes and licenses
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">17</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TaxesAndLicensesAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 17 -->
						<!-- begin line 18 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">18</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Interest expense from Schedule I, line 25 (see instructions)
									<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalInterestExpenseDedAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalInterestExpenseDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 18 -->
						<!-- begin line 19 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">19</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Charitable contributions
									<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CharitableContributionsTotAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CharitableContributionsTotAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 19 -->
						<!-- begin line 20 -->
						<div style="width:181mm;height:8mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;">20</div>
							<div class="styLNDesc" style="width:133mm;height:8mm;">
								Depreciation from Form 4562 not claimed on Form 1125-A or elsewhere on return (attach Form 4562).
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/DepreciationAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:right;padding-right:1mm;padding-top:.5mm;">...............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">20</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/DepreciationAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 20-->
						<!-- begin line 21 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">21</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Depletion
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">21</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/DepletionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 21 -->
						<!-- begin line 22 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">22</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Advertising
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">22</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/AdvertisingAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 22 -->
						<!-- begin line 23 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">23</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Pension, profit-sharing, etc., plans
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">23</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/PensionProfitSharingPlansAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 23 -->
						<!-- begin line 24 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">24</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Employee benefit programs
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">24</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/EmployeeBenefitProgramAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 24 -->
						<!-- begin line 25 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">25</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Reserved for future use
									<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<!--<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/DomesticProductionActDedAmt"/>
									</xsl:call-template-->
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
							<div class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey">
								<!--<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/DomesticProductionActDedAmt"/>
								</xsl:call-template>-->
							</div>
						</div>
						<!-- end line 25 -->
						<!-- begin line 26 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">26</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Deductions allocated and apportioned to ECI from Schedule H, line 20 (see instructions)
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">26</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotDedExpnssAllocApprtnECIAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 26 -->
						<!-- begin line 27 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">27</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Other deductions (attach statement)
									<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OtherDeductionsAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OtherDeductionsAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 27-->
						<!-- begin line 28 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">28</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<b>Total deductions. </b>Add lines 12 through 27
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">.................<span style="width:3mm"/>
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="MidSizeBullet"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalDeductionAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 28-->
						<!-- begin line 29 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">29</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									Taxable income before NOL deduction and special deductions (subtract line 28 from line 11)
										<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TaxableIncomeBfrNOLSpclDedAmt"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2mm;">
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="MidSizeBullet"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">29</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TaxableIncomeBfrNOLSpclDedAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 29-->
						<!-- begin line 30 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:5mm;">30</div>
							<div class="styLNDesc" style="width:9mm;height:5mm;">
								<span class="styBoldText">Less:</span>
							</div>
							<!-- begin line 30a -->
							<div class="styLNDesc" style="width:84mm;height:5mm;">
								<b>a </b>Net operating loss deduction (see instructions)
								<span style="width:2px;"/>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/NetOperatingLossDeductionAmt"/>
								</xsl:call-template>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="width:8mm;height:5mm;">30a</div>
							<div class="styLNAmountBox" style="width:32mm;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/NetOperatingLossDeductionAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="width:8mm;background-color:lightgrey;height:5mm;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:5mm;"/>
							<!-- end line 30a -->
							<!-- begin line 30b -->
							<div class="styLNDesc" style="width:101mm;">
								<span style="float:left;padding-left:17mm">
									<span class="styBoldText">b</span>
									Special deductions (Schedule C, line 14)
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:5mm;">30b</div>
							<div class="styLNAmountBox" style="width:32mm;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalSpecialDeductionsAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:5mm;"/>
							<div class="styLNAmountBoxNBB" style="width:32mm;height:5mm;"/>
							<!-- end line 30b -->
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftLtrBox" style="height:4mm;"/>
							<div class="styLNDesc" style="width:8.75mm;height:4.5mm;"/>
							<!-- begin line 30c -->
							<div class="styLNDesc" style="width:124.25mm;height:4mm;">
								<span style="float:left">
									<span class="styBoldText">c</span>
									Add lines 30a and 30b
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:5mm;">30c</div>
							<div class="styLNAmountBoxNBB" style="width:31.9mm;height:5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalNOLSpecialDeductionAmt"/>
								</xsl:call-template>
							</div>
							<!-- end line 30-->
						</div>
						<!-- end Deduction Section-->
					</div>
					<!-- begin line 31 -->
					<div class="styBB" style="width:187mm;">
						<div class="styIRS1120FVTImageBox" style="height:4.5mm; border-right-width:0px"/>
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">31</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
									<span style="font-size:7pt;">Taxable income or (loss).</span>
									Subtract line 30c from line 29 
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:4.5mm; border-bottom-width;padding-top:1mm;">31</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TaxableIncomeAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- end line 31 -->
					<!-- page break and footer-->
					<div style="width:187mm">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form <span class="styBoldText" style="font-size:8pt;">1120-F</span> (2019)
						</div>
					</div>
					<div class="pageEnd"/>
					<p style="page-break-before: always"/>
					<!-- end page break and footer  -->
					<!-- begin page 4 -->
					<!-- page header -->
					<div class="styBB" style="width:187mm; padding-top:.5mm;">
						<div style="float:left;">Form 1120-F (2019)<span style="width:148mm;"/>
						</div>
						<div style="float:right; padding-bottom:0.5mm;">Page <span style="font-weight:bold; font-size:8pt;">5</span>
						</div>
					</div>
					<!-- end page header -->
					<!-- begin section II description -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle" style="width:187mm;">
						<tr>
							<td style="float:left; font-size:8pt; font-weight:bold; padding-bottom:1mm;">
								SECTION II Income Effectively Connected With the Conduct of a Trade or Business in the United States<br/>
								<span style="font-weight:normal; ">
									<i>(continued) </i>
								</span>
							</td>
						</tr>
					</table>
					<div class="styBB" style="width:187mm; border-top-width:1px;">
						<div class="styPartName" style="width:23mm;">Schedule C</div>
						<div class="styPartDesc" style="width:164mm;">Dividends and Special Deductions <span class="styNormalText">(see instructions)
							</span>
						</div>
					</div>
					<!-- end section I description -->
					<!-- begin Schedule C  -->
					<table style="font-size:7pt;width:187mm" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th class="sty1120FSchCLNLeftNumBox" style="height:9mm" scope="col"/>
								<th class="sty1120FSchCLNDesc" scope="col">
									<span style="width:1px"/>
								</th>
								<th class="sty1120FSchCLNAmountBoxHeader" scope="col">
									<b>(a) </b>Dividends
								</th>
								<th class="styIRS1120FLNPercentBox" style="padding-top:3mm; height:9mm;" scope="col">
									<b>(b) </b>%
								</th>
								<th class="sty1120FSchCLNRightAmountBoxHeader" scope="col">
									<b>(c) </b>Special deductions:<br/>
									<b>(a) </b>x<b> (b)</b>
								</th>
							</tr>
						</thead>
						<tbody>
							<!-- begin Line 1, Schedule C  -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:0">1</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									Dividends from less-than-20%-owned domestic corporations (other than debt-financed stock) 
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn">...................</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DomCorpBelow20OwnDivRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox" style="height:6mm;padding-top:1.5mm;">50</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DomCorpBelow20OwnDeductionAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Line 1, Schedule C -->
							<!-- begin Line 2, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:.5mm;">2</td>
								<td class="sty1120FSchCLNDesc" scope="row" style="padding-top:.5mm;">
									Dividends from 20%-or-more-owned domestic corporations (other than debt-financed stock) 
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn">...................</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DomCorp20OrMoreOwnDivRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox" style="height:7mm;padding-top:2mm;">65</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DomCorp20OrMoreOwnDeductionAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Line 2, Schedule C -->
							<!-- begin Line 3, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:.5mm;">3</td>
								<td class="sty1120FSchCLNDesc" style="padding-top:.5mm;" scope="row">
									Dividends on certain debt-financed stock of domestic and foreign corporations (section 246A)	
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn">...................</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DebtFincdStockCorpDivRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox" style="height:7mm;font-size:6pt;">see instructions</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<span style="float:left;padding-left:.5mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DebtFincdStockCorpDeductionAmt"/>
										</xsl:call-template>
									</span>
									<div style="float:right;clear:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DebtFincdStockCorpDeductionAmt"/>
										</xsl:call-template>
									</div>
								</td>
							</tr>
							<!-- end Line 3, Schedule C -->
							<!-- begin Line 4, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:.5mm">4</td>
								<td class="sty1120FSchCLNDesc" style="padding-top:.5mm" scope="row">
									Dividends on certain preferred stock of less-than-20%-owned public utilities
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn">.</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PubUtilityBelow20DivRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">23.3</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PubUtilityBelow20DedAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Line 4, Schedule C  -->
							<!-- begin Line 5, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:.5mm">5</td>
								<td class="sty1120FSchCLNDesc" style="padding-top:.5mm" scope="row">
									Dividends on certain preferred stock of 20%-or-more-owned public utilities
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">..</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PubUtility20OrMoreDivRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">26.7</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PubUtility20OrMoreDedAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Line 5, Schedule C -->
							<!-- begin Line 6, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:.7mm;">6</td>
								<td class="sty1120FSchCLNDesc" scope="row" style="padding-top:.5mm;">
									Dividends from less-than-20%-owned foreign corporations
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">.......</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/FrgnCorpBelow20OwnDivRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">50</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/FrgnCorpBelow20OwnDeductionAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Line 6, Schedule C -->
							<!-- begin Line 7, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:.7mm;">7</td>
								<td class="sty1120FSchCLNDesc" scope="row" style="padding-top:.5mm;">
									Dividends from 20%-or-more-owned foreign corporations
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">.......</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/FrgnCorp20OrMoreOwnDivRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">65</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/FrgnCorp20OrMoreOwnDedAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Line 7, Schedule C -->
							<!-- begin Line 8, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:3mm;">8</td>
								<td class="sty1120FSchCLNDesc" scope="row" style="padding-top:2.5mm;">
									<b>Subtotal. </b> Add lines 1 through 7. See instructions for limitation
									<div class="sty1120FRightFloat" style=";">
										<span class="sty1120FDotLn ">.....</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DivRcvdLimitationAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox" style="height:6.5mm;font-size:6pt;">see instructions</td>
								<td class="sty1120FSchCLNRightAmountBox" style="height:4.5mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DivRcvdDedLimitationAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Line 8, Schedule C -->
							<!-- begin Line 9, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:.5mm;">9</td>
								<td class="sty1120FSchCLNDesc" scope="row" style="padding-top:.5mm;">
									Dividends from foreign corporations not included on lines 3, 6, or 7
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">....</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/OtherDivForeignCorpTotRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBoxShaded">
									<span style="width:1px"/>
								</td>
							</tr>
							<!-- end Line 9, Schedule C -->
							<!-- begin Line 10, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">10</td>
								<td class="sty1120FSchCLNDesc" style="font-size:6.5pt;padding-top:.5mm" scope="row">
									IC-DISC and former DISC dividends not included on lines 1, 2, or 3 (section 246(d))
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">.</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/ICDISCFormerDISCDivRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBoxShaded">
									<span style="width:1px"/>
								</td>
							</tr>
							<!-- end Line 10, Schedule C -->
							<!-- begin Line 11, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">11</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									Other dividends
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/OtherDividendsTotRcvdAmt"/>
									</xsl:call-template>
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">..................</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/OtherDividendsTotRcvdAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBoxShaded">
									<span style="width:1px"/>
								</td>
							</tr>
							<!-- end Line 11, Schedule C -->
							<!-- begin Line 12, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">12</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									Deduction for dividends paid on certain preferred stock of public utilities
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">..</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PubUtilityPrefStockDivDedAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Line 12, Schedule C -->
							<!-- begin Line 13, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">13</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<b>Total dividends. </b> Add column (a), lines 8 through 11. Enter here and on line 4, page 4
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">.</span>
									</div>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/TotalDividendsReceivedAmt"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded" style="border-bottom-width:1px">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBoxShaded" style="border-bottom-width:1px">
									<span style="width:1px"/>
								</td>
							</tr>
							<!-- end Line 13, Schedule C -->
							<!-- begin Line 14, Schedule C -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD" style="padding-top:0.5mm">14</td>
								<td colspan="3" class="sty1120FSchCLNDesc" style="width:151mm;padding-right:3mm;" scope="row">
									<b>Total special deductions. </b> Add column (c), lines 8 and 12. Enter here and on line 30b, page 4
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">....</span>
										<span style="width:3mm"/>
										<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
								</td>
								<td class="sty1120FSchCLNRightAmountBox" style="border-bottom-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/TotalSpecialDeductionsAmt"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Line 14, Schedule C -->
						</tbody>
					</table>
					<!-- end Schedule C  -->
					<!-- begin Schedule J title -->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:23mm;">Schedule J</div>
						<div class="styPartDesc" style="width:164mm;">Tax Computation <span class="styNormalText">(see instructions)</span>
						</div>
					</div>
					<!-- end Schedule J title -->
					<!-- begin Line 1, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;padding-top:0.8mm">1</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1.5mm">
							Check if the corporation is a member of a controlled group (attach Schedule O (Form 1120))
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/MemberOfControlledGroupInd"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn"/>
								<span style="width:1.5mm"/>
								<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:1.5mm"/>
								<input type="checkbox" alt="IRS1120ScheduleJMemberOfControlledGroup" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/MemberOfControlledGroupInd"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleJMemberOfControlledGroup</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/MemberOfControlledGroupInd"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJMemberOfControlledGroup</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end Line 1, Schedule J -->
					<!-- begin Line 2, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;font-size:7pt;padding-top:1.3mm;padding-left:2.5mm">2</div>
						<div class="styLNDesc" style="height:5mm;width:138mm;padding-right:1.5mm;padding-top:1mm">
							Income tax. 
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt/@section197Cd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt/@section197Amt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 2 - Form 8978 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt/@form8978Cd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 2 - Form 8978 Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt/@form8978Amt"/>
							</xsl:call-template>
							<!--Dotted Line-->
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.......................</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">2</div>
						<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 2, Schedule J -->
					<!-- begins Line 3, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">3</div>
						<div class="styLNDesc" style="height:4.5mm;padding-right:1.8mm">
							Base erosion minimum tax amount (attach Form 8991)
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/BaseErosionMinimumTaxAmt"/>
							</xsl:call-template>
							<!--Dotted Line-->
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">..............</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/BaseErosionMinimumTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 3, Schedule J -->
					<!-- begin Line 4, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">4</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							Add lines 2 and 3	
							<div class="sty1120FRightFloat">
								<span class="styDotLn">............................</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">4</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxPlusBaseErosionTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 4, Schedule J -->
					<!-- begin Line 5a, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">5a</div>
						<div class="styLNDesc" style="width:98mm;height:4.5mm;padding-right:1.5mm;">
							Foreign tax credit (attach Form 1118)
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/ForeignTaxCreditAmt"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="styDotLn" style="float:none">..........</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5a</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/ForeignTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end Line 5a, Schedule J -->
					<!-- begin Line 5b, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:3mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:98mm;height:4.5mm;padding-right:1.5mm">
							General business credit (attach Form 3800)         
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/CYGenBusinessCreditAllowedAmt"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">........</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5b</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/CYGenBusinessCreditAllowedAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end LIne 5b checkbox(es), Schedule J -->
					<!-- begin Line 5c, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:3mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:98mm;height:4.5mm;padding-right:1.5mm">
							Credit for prior year minimum tax (attach Form 8827)         
								<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/CurrentYearMinimumTaxCreditAmt"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5c</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/CurrentYearMinimumTaxCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end Line 5c, Schedule J -->
					<!-- begin Line 5d, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:3mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:98mm;height:4.5mm;padding-right:1.5mm">
							Bond credits from Form 8912
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/CurrentYearAllowableCreditAmt"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.............</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5d</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/CurrentYearAllowableCreditAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end Line 5d, Schedule J -->
					<!-- begin Line 6, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style=";font-size:7pt;padding-left:2.5mm;padding-top:1.25mm">6</div>
						<div class="styLNDesc" style="width:138mm;padding-right:1.8mm;padding-top:1.25mm">
							<b>Total credits. </b>Add lines 5a through 5d  
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalCreditAmt"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 6 - Form 8978 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalCreditAmt/@form8978Cd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 6 - Form 8978 Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalCreditAmt/@form8978Amt"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.................</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="padding-top:.5mm">6</div>
						<div class="styLNAmountBox" style="padding-top:.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalCreditAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 6, Schedule J -->
					<!-- begin LIne 7, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;font-size:7pt;padding-left:2.5mm;padding-top:1.25mm">7</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1.8mm;padding-top:1.25mm">
							Subtract line 6 from line 4     
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">........................</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:5.25mm;padding-top:1.25mm;">7</div>
						<div class="styLNAmountBox" style="height:5.25mm;padding-top:1.25mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxLessCreditsAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 7, Schedule J -->
					<!-- begin Line 8, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;padding-top:1.5mm;">8</div>
						<div class="styLNDesc" style="width:35mm;padding-top:1.5mm;">Other taxes. Check if from:</div>
						<div class="styLNDesc" style="width:103mm;height:4mm;">
							<input type="checkbox" alt="IRS1120ScheduleJTaxFromForm4255" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form4255Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm4255</xsl:with-param>
								</xsl:call-template>
							</input>
<!--							<span style="width:1mm"/>-->
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form4255Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm4255</xsl:with-param>
								</xsl:call-template>
								  Form 4255
							</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form4255Ind"/>
							</xsl:call-template>
							<span style="width:5mm"/>
							<input type="checkbox" alt="IRS1120ScheduleJTaxFromForm8611" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8611Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8611</xsl:with-param>
								</xsl:call-template>
							</input>
<!--							<span style="width:1mm"/>-->
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8611Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8611</xsl:with-param>
								</xsl:call-template>
								Form 8611
							</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8611Ind"/>
							</xsl:call-template>
							<span style="width:5mm"/>
							<input type="checkbox" alt="IRS1120ScheduleJTaxFromForm8697" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8697Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8697</xsl:with-param>
								</xsl:call-template>
							</input>
<!--							<span style="width:1mm"/>-->
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8697Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8697</xsl:with-param>
								</xsl:call-template>
								Form 8697
							</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8697Ind"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;"/>
						<div class="styLNDesc" style="width:35mm"/>
						<div class="styLNDesc" style="width:103mm;height:5mm;">
							<input type="checkbox" alt="IRS1120ScheduleJTaxFromForm8866" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8866Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8866</xsl:with-param>
								</xsl:call-template>
							</input>
<!--							<span style="width:1mm"/>-->
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8866Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8866</xsl:with-param>
								</xsl:call-template>
								Form 8866
							</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8866Ind"/>
							</xsl:call-template>
							<span style="width:5mm"/>
							<input type="checkbox" alt="IRS1120ScheduleJTaxFromForm8902" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8902Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8902</xsl:with-param>
								</xsl:call-template>
							</input>
<!--							<span style="width:1mm"/>-->
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8902Ind"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8902</xsl:with-param>
								</xsl:call-template>
								Form 8902
							</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/Form8902Ind"/>
							</xsl:call-template>
							<span style="width:5mm"/>
							<input type="checkbox" alt="IRS1120ScheduleJOtherTaxes" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJOtherTaxes</xsl:with-param>
								</xsl:call-template>
							</input>
<!--							<span style="width:1mm"/>-->
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/OtherInd"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJOtherTaxes</xsl:with-param>
								</xsl:call-template>
								Other (attach statement)
							</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/OtherInd"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm;">8</div>
						<div class="styLNAmountBox" style="height:5mm;padding-right:1mm;padding-top:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalOtherTaxesAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 8, Schedule J -->
					<!-- begin Line 9, Schedule J -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;font-size:7pt;padding-left:2.5mm;padding-top:1.25mm">9</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1.8mm;;padding-top:1.25mm">
							<b>Total tax.</b> Add lines 7 and 8. Enter here and on line 2, page 1	
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.............</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:5.25mm;padding-top:1.25mm; border-bottom-width:0px">9</div>
						<div class="styLNAmountBox" style="height:5.25mm;border-bottom-width:0px;padding-top:1.25mm;padding-right:1mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalTaxComputationAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Line 9, Schedule J -->
					<!-- page break and footer-->
					<div style="width:187mm;padding-top:0.5mm; border: 0 solid black; border-top-width:1px;">
						<div style="float:right;">
						Form <span class="styBoldText" style="font-size:8pt;">1120-F</span> (2019)
					</div>
					</div>
					<div class="pageEnd"/>
					<p style="page-break-before: always"/>
					<!-- end page break and footer  -->
					<!-- begin page 5 -->
					<!-- page header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120-F (2019)<span style="width:148mm;"/>
						</div>
						<div style="float:right;padding-bottom:0.5mm">Page <span style="font-weight:bold;font-size:8pt;">6</span>
						</div>
					</div>
					<!-- end page header -->
					<!-- begin section III description -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td style="float:left; font-size: 8pt; font-weight:bold;">
								SECTION IIIBranch Profits Tax and Tax on Excess Interest
							</td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="width:187mm;float:left; font-size:8pt; font-weight:normal;clear:none; padding-bottom:0mm; padding-top:0mm">
								<b>Part IBranch Profits Tax </b>(see instructions)
							</td>
						</tr>
					</table>
					<!-- end section III description -->
					<!-- begin section III, line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">1</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							Enter the amount from Section II, line 29
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">....................</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm">1</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxableIncomeBfrNOLSpclDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 1 -->
					<!-- begin section III, line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7.7mm;padding-left:2.5mm;">2</div>
						<div class="styLNDesc" style="height:7.7mm;width:138mm;padding-right:1mm">							
							Enter total adjustments to line 1 to get effectively connected earnings and profits. (Attach required statement showing the nature and amount of adjustments.) (See instructions.)							
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/AdjECTIAmt"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">..........</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:7.7mm;padding-top:4mm">2</div>
						<div class="styLNAmountBox" style="width:33mm;height:7.7mm;padding-top:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/AdjECTIAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 2 -->
					<!-- begin section III, line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">3</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							Effectively connected earnings and profits. Combine line 1 and line 2
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">............</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/EffectivelyConnectEarnPrftAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 3 -->
					<!-- begin section III, line 4a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">4a</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							Enter U.S. net equity at the end of the current tax year. (Attach required statement.)
						    <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityCurrentEndYearAmt"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">......</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4a</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityCurrentEndYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4a -->
					<!-- begin section III, line 4b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							Enter U.S. net equity at the end of the prior tax year. (Attach required statement.)
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityPriorEndYearAmt"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">......</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityPriorEndYearAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4b -->
					<!-- begin section III, line 4c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:7.7mm;padding-left:4mm;padding-top:1mm">c</div>
						<div class="styLNDesc" style="height:7.7mm;width:138mm;padding-right:1mm;padding-top:1mm">
							Increase in U.S. net equity. If line 4a is greater than or equal to line 4b, subtract line 4b from line 4a.  Enter the result here and skip to line 4e	
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....................</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:7.7mm;padding-top:4mm">4c</div>
						<div class="styLNAmountBox" style="width:33mm;height:7.7mm;padding-top:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityIncreaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4c -->
					<!-- begin section III, line 4d -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							Decrease in U.S. net equity. If line 4b is greater than line 4a, subtract line 4a from line 4b	
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4d</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityDecreaseAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4d -->
					<!-- begin section III, line 4e -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:7.4mm;padding-left:4mm;padding-top:0.5mm">e</div>
						<div class="styLNDesc" style="height:7.4mm;width:138mm;padding-top:0.5mm;padding-right:1mm;">
			Non-previously taxed accumulated effectively connected earnings and profits. Enter excess, if any, of effectively connected earnings and profits for preceding tax years beginning after 1986 over any dividend equivalent amounts for those tax years
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....................</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:6mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:33mm;height:6mm; border-bottom-width:0px"/>
						<div class="styLNRightNumBox">4e</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/NonPrevTxdAccumECEPAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4e -->
					<!-- begin section III, line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7.7mm;padding-left:2.5mm;padding-top:0.7mm">5</div>
						<div class="styLNDesc" style="height:7.7mm;width:138mm;padding-right:1mm;padding-top:0.7mm">
							Dividend equivalent amount. Subtract line 4c from line 3. If zero or less, enter -0-. If no amount is entered on line 4c, add the lesser of line 4d or line 4e to line 3 and enter the total here						
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">........</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:7.7mm;padding-top:4mm;">5</div>
						<div class="styLNAmountBox" style="width:33mm;height:7.7mm;padding-top:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/DividendEquivalentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 5 -->
					<!-- begin section III, line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:7.4mm;padding-left:2.5mm;padding-top:0.5mm">6</div>
						<div class="styLNDesc" style="height:7.4mm;width:138mm;padding-top:0.5mm;padding-right:1mm;">
							<b>Branch profits tax.</b> Multiply line 5 by 30% (0.30) (or lower treaty rate if the corporation is a qualified resident or otherwise qualifies for treaty benefits).  (See instructions.)  Enter here and include on line 3, page 1.  <b>Also complete item W on page 2</b>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....................</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:6mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:33mm;height:6mm; border-bottom-width:0px"/>
						<div class="styLNRightNumBox" style=" border-bottom-width:0px">6</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/BranchProfitsTaxAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 6 -->
					<!-- begin section III, Part II title -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="width:187mm;float:left; font-size:8pt; font-weight:normal;clear:none; padding-bottom:0mm; padding-top:0mm;">
								<b>Part IITax on Excess Interest </b>(see instructions for this Part and for Schedule I (Form 1120-F))
							</td>
						</tr>
					</table>
					<!-- end section III, Part II title -->
					<!-- begin section III, line 7a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm;">7a</div>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							Enter the interest from Section II, line 18
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">....................</span>
							</div>
						</div>
						<div class="styLNRightNumBox">7a</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TotalInterestExpenseDedAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 7a -->
					<!-- begin section III, line 7b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:6.8mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:6.8mm;width:138mm;padding-right:1mm;font-size:6pt">
							<div style="text-align:justify;text-align-last:justify">
								Enter the inverse of the total amount deferred, capitalized, and disallowed from Schedule I, line 24d
						    </div>							
							 (i.e, if line 24d is negative, enter as a positive number; if line 24d is positive, enter as a negative number)
							 <div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">............</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:6.8mm;padding-top:3mm">7b</div>
						<div class="styLNAmountBox" style="height:6.8mm;width:33mm;padding-top:3mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/InverseTotIntExpnsAllocableAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 7b -->
					<!-- begin section III, line 7c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							Combine lines 7a and 7b (amount must equal Schedule I, line 23)	
						    <div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">............</span>
							</div>
						</div>
						<div class="styLNRightNumBox">7c</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/InterstExpenseAllocableAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 7c -->
					<!-- begin section III, line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:2.5mm;">8</div>
						<div class="styLNDesc" style="height:11mm;width:138mm;padding-right:1mm;">
							<b>Branch Interest</b> (see instructions for definition): Enter the sum of Schedule I, line 9, column (c), and
							Schedule I, line 22. If the interest paid by the foreign corporations U.S. trade or business was increased
							because 80% or more of the foreign corporations assets are U.S. assets, check this box
							<span style="float:right;">
								<span class="sty1120FDotLn">...</span>
								<span style="width:1mm"/>
								<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:1mm"/>
								<input type="checkbox" alt="IRS1120FSectionIIIAssetsMore80USAssets" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/AssetsMore80USAssetsInd"/>
										<xsl:with-param name="BackupName">IRS1120FSectionIIIAssetsMore80USAssets</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/AssetsMore80USAssetsInd"/>
										<xsl:with-param name="BackupName">IRS1120FSectionIIIAssetsMore80USAssets</xsl:with-param>
									</xsl:call-template>
								</label>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.5mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:33mm;height:7.5mm; border-bottom-width:0px"/>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/BranchInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 8 -->
					<!-- begin section III, line 9a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm;">9a</div>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							Excess interest. Subtract line 8 from line 7c. If zero or less, enter -0-
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">...........</span>
							</div>
						</div>
						<div class="styLNRightNumBox">9a</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/ExcessInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 9a -->
					<!-- begin section III, line 9b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:7.7mm;padding-left:4mm;padding-top:1mm">b</div>
						<div class="styLNDesc" style="height:7.7mm;width:138mm;padding-right:1mm;padding-top:1mm">
							If the foreign corporation is a bank, enter the excess interest treated as interest on deposits (see 
							<span style="float:left;">instructions for rules for computing this amount). Otherwise, enter -0- </span>
							<div class="sty1120FRightFloat">
								<span class="styDotLn" style="float:none">...........</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:7.7mm;padding-top:4mm">9b</div>
						<div class="styLNAmountBox" style="height:7.7mm;width:33mm;padding-top:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/BankExcessInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 9b -->
					<!-- begin section III, line 9c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							Subtract line 9b from line 9a
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.......................</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm">9c</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/NetExcessInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 9c -->
					<!-- begin section III, line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7.4mm">10</div>
						<div class="styLNDesc" style="height:7.4mm;width:138mm;padding-right:1mm">
							<b>Tax on excess interest. </b>Multiply line 9c by 30% (0.30) (or lower treaty rate if the corporation is a qualified resident
							or otherwise qualifies for treaty benefits). (See instructions.) Enter here and include on line 3, page 1. <b>Also complete item W on page 2</b>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.....................</span>
						</div>
						<div class="styLNRightNumBox" style="height:7.4mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:7.4mm; border-bottom-width:0px"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm;"/>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">							
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0px">10</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxOnExcessInterestAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 10 -->
					<!-- begin section III, Part III title -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="width:187mm;float:left; font-size:8pt; font-weight:normal;clear:none; padding-bottom:0mm; padding-top:0mm">
								<b>Part IIIAdditional Information</b>
								<span style="padding-left:1mm; font-size:7pt"/>
							</td>
						</tr>
					</table>
					<!-- end section III, Part III title -->
					<!-- begin section III, Part III yes/no -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:167mm"/>
						<div class="styIRS1120FYesNoBox" style="height:4.2mm;padding-top:0.5mm;font-weight:bold">Yes</div>
						<div class="styIRS1120FYesNoBox" style="height:4.2mm;padding-top:0.5mm;font-weight:bold">No</div>
					</div>
					<!-- end section III, Part III yes/no -->
					<!-- begin section III, line 11 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:0.5mm">11</div>
						<div class="styLNDesc" style="width:167mm;padding-top:0.5mm">      
							Is the corporation claiming a reduction in, or exemption from, the branch profits tax due to:
						</div>
						<div class="styShadingCell" style="width:6mm;height:4.2mm"/>
						<div class="styShadingCell" style="width:6mm;height:4.2mm"/>
					</div>
					<!-- end section III, line 11 -->
					<!-- begin section III, line 11a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm">a</div>
						<div class="styLNDesc" style="width:167mm;padding-right:2mm">
							A complete termination of all U.S. trades or businesses?
						    <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USTradeOrBusTerminationInd"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....................</span>
							</div>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.4mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USTradeOrBusTerminationInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.4mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USTradeOrBusTerminationInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 11a -->
					<!-- begin section III, line 11a blank -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:167mm"/>
						<div class="styShadingCell" style="width:6mm;height:4.2mm;"/>
						<div class="styShadingCell" style="width:6mm;height:4.2mm"/>
					</div>
					<!-- end section III, line 11a blank -->
					<!-- begin section III, line 11b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:167mm;padding-right:2mm">
							The tax-free liquidation or reorganization of a foreign corporation?
						    <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxFreeLiquidationInd"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">..................</span>
							</div>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.5mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxFreeLiquidationInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.5mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxFreeLiquidationInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 11b -->
					<!-- begin section III, line 11b blank -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:167mm"/>
						<div class="styShadingCell" style="width:6mm;height:4.2mm;"/>
						<div class="styShadingCell" style="width:6mm;height:4.2mm"/>
					</div>
					<!-- end section III, line 11b blank -->
					<!-- begin section III, line 11c -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm">c</div>
						<div class="styLNDesc" style="width:167mm;padding-right:2mm">
							The tax-free incorporation of a U.S. trade or business?
						    <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USTradeOrBusTaxFreeIncorpInd"/>
							</xsl:call-template>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....................</span>
							</div>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.5mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USTradeOrBusTaxFreeIncorpInd"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.5mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USTradeOrBusTaxFreeIncorpInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 11c -->
					<!-- begin section III, line 11c blank -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:167mm"/>
						<div class="styShadingCell" style="width:6mm;height:4.2mm"/>
						<div class="styShadingCell" style="width:6mm;height:4.2mm"/>
					</div>
					<div class="styLNLeftNumBox"/>
					<div class="styLNDesc" style="width:167mm;text-align:justify;padding-right:2mm">      
			If <b>11a </b>or<b> 11b </b>applies and the transferee is a domestic corporation, attach Form 8848. If<b> 11c </b>applies, attach the statement required by Temporary Regulations section 1.884-2T(d)(5).
				</div>
					<div class="styShadingCell" style="width:6mm;height:7.5mm"/>
					<div class="styShadingCell" style="width:6mm;height:7.5mm"/>
					<!-- end section III, line 11c blank -->
					<!-- page break and footer-->
					<div style="width:187mm;padding-top:1mm; border:1px solid black; border-left-width:0px; border-right-width:0px; border-bottom:0px">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
							Form 
							<span class="styBoldText" style="font-size:8pt;">1120-F</span> (2019)
						</div>
					</div>
					<div class="pageEnd"/>
					<p style="page-break-before: always"/>
					<!-- end page break and footer  -->
					<!-- begin page 6 -->
					<!-- page header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;border-bottom-width:2px;">
						<div style="float:left;">Form 1120-F (2019)<span style="width:148mm;"/>
						</div>
						<div style="float:right;padding-bottom:0.5mm">Page <span style="font-weight:bold;font-size:8pt">7</span>
						</div>
					</div>
					<!-- end page header -->
					<!--Begin Page 7 Note-->
					<div class="styBB" style="width:187mm">
						<div class="styPartDesc" style="width:187mm; font-weight:normal;padding-left:0">
							<b>Note: </b>
							<i>Check if completing on </i>
							<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="1120F Medium Bullet"/>
							<span style="width:8mm"/>
							<input type="checkbox" alt="IRS1120FScheduleLUSBasis" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/USBasisInd"/>
									<xsl:with-param name="BackupName">IRS1120FScheduleLUSBasis</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/USBasisInd"/>
									<xsl:with-param name="BackupName">IRS1120FScheduleLUSBasis</xsl:with-param>
								</xsl:call-template>
								<span>U.S. basis or   </span>
							</label>
							<span style="width:2mm"/>
							<input type="checkbox" alt="IRS1120FScheduleLWorldwideBasis" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/WorldwideBasisInd"/>
									<xsl:with-param name="BackupName">IRS1120FScheduleLWorldwideBasis</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/WorldwideBasisInd"/>
									<xsl:with-param name="BackupName">IRS1120FScheduleLWorldwideBasis</xsl:with-param>
								</xsl:call-template>
								Worldwide basis.
						    </label>
						</div>
					</div>
					<!--Begin Schedule L-->
					<!--Begin Schedule L Header-->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:20mm">Schedule L</div>
						<div class="styPartDesc" style="width:166mm;">Balance Sheets per Books</div>
					</div>
					<!--Begin Schedule L Table-->
					<!--Table Header-->
					<div style="width:187mm">
						<table class="styTBB" cellpadding="0" cellspacing="0" style="width:187mm;">
							<tbody>
								<!--Assets-->
								<tr>
									<th class="sty1120FTableCellDesc" rowspan="2" colspan="2" style="width:67mm;font-size:8pt;text-align:center;font-weight:bold;padding-top:3mm" scope="col">Assets</th>
									<th class="sty1120FTableCellHeader" colspan="2" style="width:64mm" scope="col">Beginning of tax year</th>
									<th class="sty1120FTableCellHeaderLastCol" colspan="2" style="width:64mm" scope="col">End of tax year</th>
								</tr>
								<tr>
									<th class="sty1120FTableCellHeader" scope="col">(a)</th>
									<th class="sty1120FTableCellHeader" scope="col">(b)</th>
									<th class="sty1120FTableCellHeader" scope="col">(c)</th>
									<th class="sty1120FTableCellHeaderLastCol" scope="col">(d)</th>
								</tr>
								<!--Line 1-->
								<tr>
									<td class="sty1120FTableCellNum">1</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Cash</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.............</span>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CashAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CashAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 2a-->
								<tr>
									<td class="sty1120FTableCellNum">2a</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Trade notes and accounts receivable</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">..</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TradeNotesAcctReceivableAssets/BalanceSheetPerBooksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TradeNotesAcctReceivableAssets/BalanceSheetPerBooksEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShadedLastCol" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 2b-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Less allowance for bad debts</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.....</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BadDebtAllowanceAssets/BalanceSheetPerBooksBOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BadDebtAllowanceAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BadDebtAllowanceAssets/BalanceSheetPerBooksEOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BadDebtAllowanceAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 3-->
								<tr>
									<td class="sty1120FTableCellNum">3</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Inventories</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">...........</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InventoriesAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InventoriesAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 4-->
								<tr>
									<td class="sty1120FTableCellNum">4</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">U.S. government obligations</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/USGovernmentObligationsAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/USGovernmentObligationsAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 5-->
								<tr>
									<td class="sty1120FTableCellNum">5</td>
									<td class="sty1120FTableCellDesc" scope="row">
									  Tax-exempt securities (see instructions)
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TaxExemptSecuritiesAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TaxExemptSecuritiesAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 6a-->
								<tr>
									<td class="sty1120FTableCellNum">6a</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">
										  Interbranch current assets*
										    <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchCurrentAssets"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchCurrentAssets/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchCurrentAssets/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 6b-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Other current non-U.S. assets*
										<span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentNonUSAssets"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">...</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentNonUSAssets/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentNonUSAssets/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 6c-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">c</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">
											Other current U.S. assets*
										    <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentUSAssets"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="height:4.2mm;">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentUSAssets/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentUSAssets/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 7-->
								<tr>
									<td class="sty1120FTableCellNum">7</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Loans to shareholders</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LoansToShareholdersAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LoansToShareholdersAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 8-->
								<tr>
									<td class="sty1120FTableCellNum">8</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Mortgage and real estate loans</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/MortgageRealEstateLoansAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/MortgageRealEstateLoansAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 9a-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-bottom:3.5mm;">9a</td>
									<td class="sty1120FTableCellDesc" scope="row">
										Other loans and investmentsnon-U.S.<br/>
										<span style="float:left;"> assets*
										    <span style="width:0.5mm;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsNonUSAssets"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">..........</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none;padding-top:3mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsNonUSAssets/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none;padding-top:3mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsNonUSAssets/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 9b-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm;">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
									    Other loans and investmentsU.S.assets*
										 <span style="width:0.5mm;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsUSAssets"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<!-- remove padding-top:2.5mm to remove excess space -->
										<div style="float:right;clear:none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsUSAssets/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<!-- remove padding-top:2.5mm to remove excess space -->
										<div style="float:right;clear:none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsUSAssets/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 10a-->
								<!--Remove excess line <tr>
									<td class="sty1120FTableCellNumDD" style="padding-right:1mm;"></td>
									<td class="sty1120FTableCellDesc" scope="row">
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShadedLastCol">
										<span style="width:1px"/>
									</td>
								</tr>-->
								<tr>
									<td class="sty1120FTableCellNumDD" style="padding-right:1mm;">10a</td>
									<td class="sty1120FTableCellDesc" scope="row"> Buildings and other depreciable assets
										<span class="styDotLn" style="float:right;padding-right:1mm">..</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BldgOtherDepreciableAssets/BalanceSheetPerBooksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BldgOtherDepreciableAssets/BalanceSheetPerBooksEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShadedLastCol" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 10b-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Less accumulated depreciation</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.....</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepreciationAssets/BalanceSheetPerBooksBOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepreciationAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepreciationAssets/BalanceSheetPerBooksEOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepreciationAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 11a-->
								<tr>
									<td class="sty1120FTableCellNumDD">11a</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Depletable assets</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">........</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/DepletableAssets/BalanceSheetPerBooksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/DepletableAssets/BalanceSheetPerBooksEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShadedLastCol" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 11b-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Less accumulated depletion</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.....</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepletionAssets/BalanceSheetPerBooksBOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepletionAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepletionAssets/BalanceSheetPerBooksEOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepletionAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 12-->
								<tr>
									<td class="sty1120FTableCellNumDD">12</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Land (net of any amortization)</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LandAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LandAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 13a-->
								<tr>
									<td class="sty1120FTableCellNumDD">13a</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Intangible assets (amortizable only)</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">...</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/IntangibleAssets/BalanceSheetPerBooksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/IntangibleAssets/BalanceSheetPerBooksEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShadedLastCol" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 13b-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Less accumulated amortization</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.....</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedAmortizationAssets/BalanceSheetPerBooksBOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedAmortizationAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedAmortizationAssets/BalanceSheetPerBooksEOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedAmortizationAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 14-->
								<tr>
									<td class="sty1120FTableCellNumDD">14</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Assets held in trust</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">........</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/HeldInTrustAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/HeldInTrustAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 15-->
								<tr>
									<td class="sty1120FTableCellNumDD">15</td>
									<td class="sty1120FTableCellDesc" scope="row">
									  Other non-current interbranch assets*
									  <span style="width:0.5mm;"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentInterbranchAst"/>
										</xsl:call-template>
										<span class="styDotLn" style="float:none;padding-left:1.9mm"/>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentInterbranchAst/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentInterbranchAst/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 16a-->
								<tr>
									<td class="sty1120FTableCellNumDD">16a</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Other non-current non-U.S. assets*
										<span style="width:0.5mm;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentNonUSAssets"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">..</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentNonUSAssets/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentNonUSAssets/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 16b-->
								<tr>
									<td class="sty1120FTableCellNumDD" style="padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Other non-current U.S. assets*
										    <span style="width:0.5mm;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentUSAssets"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">...</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentUSAssets/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentUSAssets/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 17-->
								<tr>
									<td class="sty1120FTableCellNumDDTBB">17</td>
									<td class="sty1120FTableCellDesc" style="border-bottom-width:2px;" scope="row">
										<span style="float:left;">Total assets</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">...........</span>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:2px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TotalAssets/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:2px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TotalAssets/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Liabilities-->
								<tr>
									<td class="sty1120FTableCellDesc" colspan="2" style="height:5.5mm;width:67mm;font-size:8pt;text-align:center;font-weight:bold">Liabilities</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShadedLastCol" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 18-->
								<tr>
									<td class="sty1120FTableCellNumDD">18</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Accounts payable</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.........</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccountsPayableLiabilities/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccountsPayableLiabilities/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 19-->
								<tr>
									<td class="sty1120FTableCellNumDD" style="padding-bottom:3mm">19</td>
									<td class="sty1120FTableCellDesc" scope="row">
									  Mortgages, notes, bonds payable in less than 1 year:
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShadedLastCol" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 19a-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">a</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Interbranch liabilities*
										    <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/STPyblInterbranchLiabilities"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/STPyblInterbranchLiabilities/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/STPyblInterbranchLiabilities/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 19b-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Third-party liabilities*
											<span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/STPyblThirdPartyLiabilities"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/STPyblThirdPartyLiabilities/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/STPyblThirdPartyLiabilities/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 20-->
								<tr>
									<td class="sty1120FTableCellNumDD">20</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Other current liabilities*
										    <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentLiabilities"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentLiabilities/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentLiabilities/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 21-->
								<tr>
									<td class="sty1120FTableCellNumDD" style="height:4.1mm;">21</td>
									<td class="sty1120FTableCellDesc" scope="row" style="height:4.1mm;">
										<span style="float:left;">Loans from shareholders</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="height:4.1mm;">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount" style="height:4.1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LoansFromShrLiabilities/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="height:4.1mm;">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol" style="height:4.1mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LoansFromShrLiabilities/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 22-->
								<tr>
									<td class="sty1120FTableCellNumDD" style="vertical-align:top;">22</td>
									<td class="sty1120FTableCellDesc" scope="row" style="vertical-align:top;">
									  Mortgages, notes, bonds payable in 1 year or more:
									</td>
									<td class="sty1120FTableCellAmountShaded"/>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px;"/>
									<td class="sty1120FTableCellAmountShaded"/>
									<td class="sty1120FTableCellAmountShadedLastCol" style="border-bottom-width:1px;"/>
								</tr>
								<!--Line 22a-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">a</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Interbranch liabilities*
										    <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchLiabilities"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="height:4.1mm;">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchLiabilities/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchLiabilities/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 22b-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Third-party liabilities*
										    <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ThirdPartyLiabilities"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ThirdPartyLiabilities/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ThirdPartyLiabilities/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 23-->
								<tr>
									<td class="sty1120FTableCellNumDD">23</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Liabilities held in trust</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LiabilitiesHeldInTrust/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LiabilitiesHeldInTrust/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 24a-->
								<tr>
									<td class="sty1120FTableCellNumDD">24a</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Other interbranch liabilities*
										    <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInterbranchLiabilities"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px;"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInterbranchLiabilities/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInterbranchLiabilities/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 24b-->
								<tr>
									<td class="sty1120FTableCellNumDDTBB" style="padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" style="border-bottom-width:2px" scope="row">
										<span style="float:left;">Other third-party liabilities*
										    <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherThirdPartyLiabilities"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:2px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount" style="border-bottom-width:2px">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherThirdPartyLiabilities/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:2px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol" style="border-bottom-width:2px">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherThirdPartyLiabilities/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Equity-->
								<tr>
									<td class="sty1120FTableCellDesc" colspan="2" style="height:5.5mm;width:67mm;font-size:8pt;text-align:center;font-weight:bold">
									Equity
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountShadedLastCol">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 25a-->
								<tr>
									<td class="sty1120FTableCellNumDD">25</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Capital stock:<span style="width:3mm"/>
											<b>a </b>Preferred stock</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">....</span>
									</td>
									<td class="sty1120FTableCellAmount" style="border-top-width:0.5pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalPreferredStockEquity/BalanceSheetPerBooksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount" style="border-top-width:0.5pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalPreferredStockEquity/BalanceSheetPerBooksEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShadedLastCol" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
								</tr>
								<!--Line 25b-->
								<tr>
									<td class="sty1120FTableCellNumDD"/>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">
											<span style="width:20mm"/>
											<b>b </b>Common stock</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">....</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalCommonStockEquity/BalanceSheetPerBooksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalCommonStockEquity/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalCommonStockEquity/BalanceSheetPerBooksEOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalCommonStockEquity/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26-->
								<tr>
									<td class="sty1120FTableCellNumDD">26</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Additional paid-in capital</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdditionalPaidInCapitalEquity/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdditionalPaidInCapitalEquity/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 27-->
								<tr>
									<td class="sty1120FTableCellNumDD">27</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Retained earningsAppropriated*
										    <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsApprEquity"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">..</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsApprEquity/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="height:5mm;">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsApprEquity/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 28-->
								<tr>
									<td class="sty1120FTableCellNumDD">28</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Retained earningsUnappropriated</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">...</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsUnapprEquity/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsUnapprEquity/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 29-->
								<tr>
									<td class="sty1120FTableCellNumDD">29</td>
									<td class="sty1120FTableCellDesc" scope="row">
									  Adjustments to shareholders equity*
									  <span style="width:0.5mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdjustmentShrEquity"/>
										</xsl:call-template>
										<span class="styDotLn" style="float:right;padding-right:1mm">.</span>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="height:5mm;">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdjustmentShrEquity/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdjustmentShrEquity/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 30-->
								<tr>
									<td class="sty1120FTableCellNumDD">30</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Less cost of treasury stock</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LessCostOfTreasuryStockEquity/TotalBalanceSheetPerBksBOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LessCostOfTreasuryStockEquity/TotalBalanceSheetPerBksEOYAmt"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
								</tr>
								<!--Line 31-->
								<tr>
									<td class="sty1120FTableCellNumDD">31</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Total liabilities and shareholders equity</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">..</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount" style="border-bottom-width:0">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TotalLiabilitiesEquity/TotalBalanceSheetPerBksBOYAmt"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol" style="border-bottom-width:0">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TotalLiabilitiesEquity/TotalBalanceSheetPerBksEOYAmt"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--End Schedule L Table-->
					<!--Begin Page 7 Footer-->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="text-align:left;font-size:7pt;padding-top:1mm">*Attach statementsee instructions.</div>
						<div style="float:right;" class="styGenericDiv">Form <span style="font-size:8pt;font-weight:bold">1120-F</span> (2019)</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<p style="page-break-before: always"/>
					<!-- End Page 7 Footer-->
					<!--END Page 7-->
					<!-- Start Page 8 -->
					<!-- Begin Page Header -->
					<!-- end page break and footer  -->
					<!-- page header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;border-bottom-width:2px;">
						<div style="float:left;">Form 1120-F (2019)<span style="width:148mm;"/>
						</div>
						<div style="float:right;padding-bottom:0.5mm">Page <span style="font-weight:bold;font-size:8pt">8</span>
						</div>
					</div>
					<!-- End Page Header -->
					<!--Begin Schedule W Header-->
					<div class="styBB" style="width:187mm">
						<div class="styPartName" style="width:20mm">Schedule W</div>
						<div class="styPartDesc" style="width:166mm">Overpayment Resulting From Tax Deducted and Withheld Under Chapters 3 and 4</div>
					</div>
					<!--Begin Schedule W Table-->
					<!-- Begin Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">1</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<div class="sty1120FRightFloat">
								<span class="styDotLn">..........</span>
							</div>
							<b>Total Chapter 3 and 4 payments. </b> Enter the amount from page 1, line 5i
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">1</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/IncomeTaxPaidOrWithheldAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 1 -->
					<!-- Begin Line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">2</div>
						<div class="styLNDesc" style="width:98mm;height:4.5mm;padding-right:1.5mm">
							<div class="sty1120FRightFloat">
								<span class="styDotLn" style="float:none">...........</span>
							</div>
							Enter the tax amount from page 1, line 1
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/TotalTaxComputationAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- End Line 2 -->
					<!-- Begin Line 3a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7mm;padding-left:2.5mm;">3</div>
						<div class="styLNDesc" style="width:98mm;height:7mm;padding-right:1.5mm">
							Enter the portion of the tax amount shown on page 1, line 2 pertaining to <span style="line-height:12.5px;">income
							associated with amounts deducted and withheld under sections</span>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:7mm;border-left-width:0px;"/>
						<div class="styLNAmountBoxNBB" style="height:7mm;border-left-width:0px;">							
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:7.5mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:7.5mm;"/>
					</div>
					<!-- End Line 3a -->
					<!-- Begin Line 3b -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm;"/>
						<div class="styLNDesc" style="width:98mm;padding-right:1.5mm">
							<span style="float:left;">
							  1445 and 1446 (see instructions for general guidelines). 
							<span style="width:1mm;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/Section1445And1446TaxAmt"/>
								</xsl:call-template>
							</span>
							<div class="sty1120FRightFloat">
								<span class="styDotLn" style="float:none">....</span>
							</div>
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">3</div>
						<div class="styLNAmountBox" style="padding-right:1mm;height:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/Section1445And1446TaxAmt"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:4.5mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:4.5mm;"/>
					</div>
					<!-- End Line 3b -->
					<!-- Begin Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">4</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<div class="sty1120FRightFloat">
								<span class="styDotLn">.................</span>
							</div>
							<b>Total Chapter 3 and 4 tax. </b> Combine lines 2 and 3
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">4</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/TotalTaxSpecifiedChapAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 4 -->
					<!-- Begin Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">5</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<b>Tentative overpayment resulting from tax deducted and withheld under Chapters 3 and 4. </b>
							<span style="float:left;">
								Subtract line 4 from line 1
							</span>
							<span class="styDotLn" style="float:right;">.........................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5</div>
						<div class="styLNAmountBox" style="height:8mm;padding-right:1mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/TentOvpmtWthldSpecifiedChapAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 5 -->
					<!-- Begin Line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">6</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<div class="sty1120FRightFloat">
								<span class="styDotLn">.....................</span>
							</div>
							Enter the amount from page 1, line 8a
						</div>
						<div class="styLNRightNumBox" style="height:4mm;">6</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/OverpaymentAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 6 -->
					<!-- Begin Line 7 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">7</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<b>Overpayment resulting from tax deducted and withheld under Chapters 3 and 4. </b> Enter the smaller
							<span style="float:left;">
							 of line 5 or line 6. Enter the result here and on page 1, line 8b.
							</span>
							<span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">7</div>
						<div class="styLNAmountBox" style="height:8mm;padding-right:1mm;padding-top:4mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/OvpmtWthldSpecifiedChapAmt"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 8 -->
					<!-- Begin Page Footer -->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="float:right;" class="styGenericDiv">Form <span style="font-size:8pt;font-weight:bold">1120-F</span> (2019)</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<p style="page-break-before: always"/>
					<!-- End Page Footer -->
					<!-- End Page 8 -->
					<p/>
					<br/>
					<br/>
					<br/>
					<br/>
					<p/>
					<p/>
					<p/>
					<!-- Begin Left Over Data Table -->
					<!-- Begin Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle" style="float:left;">
							Additional Data        
						</div>
						<div class="styLeftOverButtonContainer" style="float:right;">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- End Additional Data Title Bar and Button -->
					<!-- Begin Left Over Table -->
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F, Top Left Margin - Change of Acct PD</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@changeAnnualAccountingPeriodCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F, Top Left Margin - section 3019.100-2 Election Indicator
							</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@filedPursuantToSect30191002Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F, Top Left Margin - Short Period Reason 1120 1120F Indicator
							</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@shortPeriodReason11201120FInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Line 5(b), Estimated Tax Payments - Trust Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@beneficiaryTrustCd "/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120F Line 5(b), Estimated Tax Payments - Trust Payment Amount </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPaymentsAmt/@beneficiaryTrustAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Line 5(g), Credit From Form 4136 - Ozone Depleting Chemicals Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt/@ozoneDepletingChemicalCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Line 5(j), Total Payments -  Backup Withholding Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@backupWithholdingTypeCd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120F Line 5(j), Total Payments -  Backup Withholding Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt/@backupWithholdingAmt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Line T - Parent Corporation Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/PrntCorporationNameControlTxt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Section II, Line 9 - Form 4684 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalOrdinaryGainLossAmt/@form4684Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Schedule J Line 2 - Section 197 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt/@section197Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120F Schedule J Line 2, Income Tax - Section 197 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt/@section197Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Schedule J Line 2, Income Tax - Form 8978 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt/@form8978Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120F Schedule J Line 2, Income Tax - Form 8978 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAmt/@form8978Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Schedule J Line 6, Total credits - Form 8978 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalCreditAmt/@form8978Cd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120F Schedule J Line 6, Total credits - Form 8978 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalCreditAmt/@form8978Amt"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<br/>
					<!--Special Condition Description -->
					<span class="styRepeatingDataTitle">Form 1120F, Special Condition: </span>
					<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
						<thead class="styTableThead">
							<tr class="styDepTblHdr">
								<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">
								Special Condition Description</th>
							</tr>
						</thead>
						<tfoot/>
						<tbody>
							<xsl:for-each select="$FormData/SpecialConditionDesc">
								<tr style="border-color:black;height:6mm;">
									<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
									<td class="styTableCellText" style="width:179mm;text-align:left;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<!-- End Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
