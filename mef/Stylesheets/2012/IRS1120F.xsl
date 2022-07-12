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
				<!-- Define Character Set  -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Form 1120F"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!--Hint:  When Special Condition it does not require a pen/ink or pushpin image.  The data is displayed in the additional data area at the end of form -->
					<!--  Separated text     -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS1120FStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form1120F">
					<!--  Begin Header section 1 -->
					<xsl:call-template name="DocumentHeader"/>
					<div class="styBB" style="width:187mm;border-bottom-width:1px;">
						<div class="styFNBox" style="width:31mm;height:21mm;border-right-width:1px;">
							Form <span class="styFormNumber" style="font-size:18pt">1120-F</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<!--General Dependency Push Pin 
							 <xsl:call-template name="SetFormLinkInline">
								 <xsl:with-param name="TargetNode" select="$FormData"/>
							 </xsl:call-template>-->
							<span style="width:3px;"/>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120F, Top Left Margin - Change of Acct PD Ind</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@ChngOfAcctPDUndrSec1442BOrCInd"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120F, Top Left Margin -Section 3019.100-2 Election Ind</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@section30191002ElectionInd"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Form 1120F, Top Left Margin -Short Period Reason 1120 1120F Ind</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/@shortPeriodReason11201120FInd"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
							<span class="styAgency" style="width:3mm; padding-left:3mm"/>
						</div>
						<div class="styFTBox" style="width:125mm;height:21mm;">
							<br/>
							<div class="styMainTitle" style="height:8mm;">U.S. Income Tax Return of a Foreign Corporation</div>
							<div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;font-weight:normal;">
								For calendar year 2012
								<!--<span style="width:6mm;">
									<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
								</span> -->  
								, or tax year beginning
								<span style="width:18mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>
								<!--,
									<span style="width: 10mm;">
										<xsl:call-template name="PopulateReturnHeaderTaxYear"></xsl:call-template>
									</span>			
								-->
								, and ending 
								<span style="width:18mm;border-bottom:1 solid black;">
									<!-- No need to send the parameters -->
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
								<!--
									, 
										<span style="width: 10mm;">
											<xsl:call-template name="PopulateReturnHeaderTaxYear"></xsl:call-template>
									</span>        
								-->
								<br/>
								<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
								<b>Information about Form 1120-F and its separate instructions is at 
										<a href="http://www.irs.gov/form1120f" title="Link to IRS.gov">
										<i>www.irs.gov/form1120f.</i>
									</a>
								</b>
							</div>
						</div>
						<div class="styTYBox" style="width:30mm;height:21mm;;border-left-width:1px;">
							<div class="styOMB" style="height:2mm;">OMB No. 1545-0126</div>
							<div class="styTY" style="height:11mm;">20<span class="styTYColor">12</span>
							</div>
						</div>
					</div>
					<!--  End Header section 1 -->
					<!--  Begin Header section 2 (return header address box) -->
					<table cellpadding="0" cellspacing="0" class="styTable" style="width:187mm;float:left;clear:left; height:21mm">
						<tr>
							<td valign="top" rowspan="3" class="styUseLbl" style="width:12mm;height:21mm;border-left-width:2px;
							border-right-width:1px;border-bottom-width:2px; border-top-width:2px;text-align:left;
							font-size:10pt;font-weight:bold;padding-top:10mm;">
			Type<br/>
			or<br/>
			Print
		</td>
							<td valign="top" class="styNameAddr" style="width:115mm;height:7mm;border-right-width:2px;
							 border-bottom-width:1px; border-top-width:2px;padding-left:4px;">
			Name<br/>
								<span class="stySmallText" style="width:90mm;padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td valign="top" class="styEINDateAssets" style="width:58.5mm;height:9mm;
							border-bottom-width:1px;border-right-width:0px; ">
								<span class="styBoldText">Employer identification number</span>
								<br/>
								<br/>
								<br/>
								<br/>
								<span class="styEINFld">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="EINChanged">true</xsl:with-param>
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
						</tr>
						<tr>
							<td valign="top" class="styNameAddr" style="width:115mm;height:7mm;
							border-right-width:2px; border-bottom-width:1px;padding-left:4px;">
		       Number, street, and room or suite no. (see instructions)<br/>
								<span class="stySmallText" style="padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
							<td rowspan="2" valign="top" class="styEINDateAssets" style="width:58.5mm;height:15mm;
							border-bottom-width:1px;border-right-width:0px; ">
								<span class="styBoldText" style="padding-top:1mm; height:2mm">Check box(es) if:</span>
								<span style="padding-left:13mm">
									<!-- begin check box for initial return -->
									<input type="checkbox" alt="IRS1120FInitialReturn" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/InitialReturn"/>
											<xsl:with-param name="BackupName">IRS1120FInitialReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/InitialReturn"/>
											<xsl:with-param name="BackupName">IRS1120FInitialReturn</xsl:with-param>
										</xsl:call-template>
       		 Initial return
     			</label>
								</span>
								<br/>
								<!-- end check box for initial return -->
								<!-- begin check box for name, address change -->
								<span style="padding-top:1mm; height:2mm"/>
								<input type="checkbox" alt="IRS1120FNameOrAddressChange" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/NameOrAddressChange"/>
										<xsl:with-param name="BackupName">IRS1120FNameOrAddressChange</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/NameOrAddressChange"/>
										<xsl:with-param name="BackupName">IRS1120FNameOrAddressChange</xsl:with-param>
									</xsl:call-template>
			Name or Address change
		      </label>
								<!-- end check box for name, address change -->
								<!-- begin check box for final return -->
								<span style="padding-left:2mm">
									<input type="checkbox" alt="IRS1120FFinalReturn" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/FinalReturn"/>
											<xsl:with-param name="BackupName">IRS1120FFinalReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/FinalReturn"/>
											<xsl:with-param name="BackupName">IRS1120FinalReturn</xsl:with-param>
										</xsl:call-template>
       		 Final return
     			</label>
								</span>
								<br/>
								<!-- end check box for final return -->
								<!-- begin check box for first post-merger return -->
								<span style="padding-top:1mm; height:2mm"/>
								<input type="checkbox" alt="IRS1120FFirstPostMergerReturn" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/FirstPostMergerReturn"/>
										<xsl:with-param name="BackupName">IRS1120FFirstPostMergerReturn</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/FirstPostMergerReturn"/>
										<xsl:with-param name="BackupName">IRS1120FFirstPostMergerReturn</xsl:with-param>
									</xsl:call-template>
			First post-merger return
		      </label>
								<!-- end check box for first post-merger return -->
								<!-- begin check box for amended return -->
								<span style="width:3.4mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/AmendedReturn"/>
									</xsl:call-template>
								</span>
								<span style="padding-left:.05mm">
									<input type="checkbox" alt="IRS1120FAmendedReturn" class="styCkbox">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturn"/>
											<xsl:with-param name="BackupName">IRS1120FAmendedReturn</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/AmendedReturn"/>
											<xsl:with-param name="BackupName">IRS1120FAmendedReturn</xsl:with-param>
										</xsl:call-template>
				

       		 Amended return
     			</label>
								</span>
								<br/>
								<!-- end check box for amended return -->
								<!-- begin check box for schedule M-3 attached -->
								<span style="padding-top:1mm; height:2mm"/>
								<input type="checkbox" alt="IRS1120FScheduleM3Attached" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ScheduleM3Attached"/>
										<xsl:with-param name="BackupName">IRS1120FScheduleM3Attached</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ScheduleM3Attached"/>
										<xsl:with-param name="BackupName">IRS1120FScheduleM3Attached</xsl:with-param>
									</xsl:call-template>
			Schedule M-3 attached		     
			 </label>
								<span style="width:3.4mm;">
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/ScheduleM3Attached"/>
									</xsl:call-template>
								</span>
								<span style="width:1mm;"/>
								<input type="checkbox" alt="IRS1120FSupersededReturn" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/SupersededReturn"/>
										<xsl:with-param name="BackupName">IRS1120FSupersededReturn</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/SupersededReturn"/>
										<xsl:with-param name="BackupName">IRS1120FSupersededReturn</xsl:with-param>
									</xsl:call-template>
									<span style="font-size:5pt">
                                            Superseded Return
                                        </span>
								</label>
								<span style="width:33.5mm;"/>
								<!-- end check box for schedule M-3 attached -->
								<!-- begin check box for protective return -->
								<input type="checkbox" alt="IRS1120FProtectiveReturn" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturn"/>
										<xsl:with-param name="BackupName">IRS1120FProtectiveReturn</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/ProtectiveReturn"/>
										<xsl:with-param name="BackupName">IRS1120FProtectiveReturn</xsl:with-param>
									</xsl:call-template>
       		 Protective return
     			</label>
								<br/>
								<!-- end check box for protective return -->
							</td>
						</tr>
						<tr>
							<td valign="top" class="styNameAddr" style="width:115mm;height:7mm;
							border-right-width:2px; border-bottom-width:2px;padding-left:4px;">
	      		City or town, state and ZIP code, or country (see instructions)<br/>
								<span class="stySmallText" style="width:90mm;padding-left:2mm;">
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
									</xsl:call-template>
									<br/>
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">Country</xsl:with-param>
										<xsl:with-param name="MainForm">true</xsl:with-param>
									</xsl:call-template>
								</span>
							</td>
						</tr>
					</table>
					<!--  End Header section 2 (return header address box) -->
					<!-- begin main content area -->
					<div style="width:187mm;font-size:7pt">
						<table class="styTable" cellspacing="0" cellpadding="0" style="font-size:7pt; width:187mm;
						border: 0 solid black;border-bottom-width:1px">
							<tr>
								<!-- begin left side  -->
								<td valign="top" class="styGenericDiv" style="width:100mm;border: 0 solid black;border-right-width:1px">
									<!-- begin line A  -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox" style="height:4.2mm">A</div>
										<div class="styIRS1120FLNDesc" style="height:4.2mm">Country of incorporation
					<span class="sty1120FItemUnderline" style="width:61mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/CountryOfIncorporation"/>
												</xsl:call-template>
											</span>
										</div>
									</div>
									<!-- end line A  -->
									<!-- begin line B  -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox" style="padding-top:0px">B</div>
										<div class="styIRS1120FLNDesc">
				Foreign country under whose laws the income reported on this return is also subject to tax
					<span class="sty1120FItemUnderline" style="width:68.4mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryIncomeSubjToTax"/>
												</xsl:call-template>
											</span>
										</div>
									</div>
									<!-- end line B  -->
									<!-- begin line C  -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox" style="height:4.2mm">C</div>
										<div class="styIRS1120FLNDesc" style="height:4.2mm">
				Date incorporated
					<span class="sty1120FItemUnderline" style="width:69.2mm">
												<xsl:call-template name="PopulateMonthDayYear">
													<xsl:with-param name="TargetNode" select="$FormData/DateIncorporated"/>
												</xsl:call-template>
											</span>
										</div>
									</div>
									<!-- end line C  -->
									<!-- begin line D (1) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox" style="height:4.5mm; padding-top:1mm">D</div>
										<div class="styIRS1120FLNDesc" style="height:4.5mm; padding-top:1mm">
											<b>(1)</b> Location of corporation&#8217;s primary books and records (city, province
											 <span style="width:5mm"/> or state, and country)
                              
                              <xsl:choose>
												<xsl:when test="string-length($FormData/LocationOfPrimaryBooks/City) + 
												string-length($FormData/LocationOfPrimaryBooks/ProvinceOrState) + 
												string-length($FormData/LocationOfPrimaryBooks/Country) &gt; 28">
													<span class="sty1120FItemUnderlineSM" style="width:59.5mm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/City"/>
														</xsl:call-template>
													</span>
													<br/>
													<span class="sty1120FItemUnderlineSM" style="width:94mm; float:left; clear:none;">
														<xsl:if test="not($FormData/LocationOfPrimaryBooks/ProvinceOrState = '')">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/ProvinceOrState"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="not($FormData/LocationOfPrimaryBooks/ProvinceOrState = '') and 
														$FormData/LocationOfPrimaryBooks/ProvinceOrState and
														 not($FormData/LocationOfPrimaryBooks/Country = '') and
														  $FormData/LocationOfPrimaryBooks/Country">
															<span>, </span>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/Country"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:otherwise>
													<span class="sty1120FItemUnderlineSM" style="width:59.5mm">
														<xsl:if test="not($FormData/LocationOfPrimaryBooks/City= '') and $FormData/LocationOfPrimaryBooks/City">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/City"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="(not($FormData/LocationOfPrimaryBooks/City = '') and
														 $FormData/LocationOfPrimaryBooks/City) and 
														 ((not($FormData/LocationOfPrimaryBooks/Country = '') and 
														 $FormData/LocationOfPrimaryBooks/Country) or 
														 (not($FormData/LocationOfPrimaryBooks/ProvinceOrState = '') and 
														 $FormData/LocationOfPrimaryBooks/ProvinceOrState))">
															<span>, </span>
														</xsl:if>
														<xsl:if test="not($FormData/LocationOfPrimaryBooks/ProvinceOrState = '') and 
														$FormData/LocationOfPrimaryBooks/ProvinceOrState">
															<xsl:call-template name="PopulateText">
																<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/ProvinceOrState"/>
															</xsl:call-template>
														</xsl:if>
														<xsl:if test="not($FormData/LocationOfPrimaryBooks/ProvinceOrState = '') and
														 $FormData/LocationOfPrimaryBooks/ProvinceOrState and
														  not($FormData/LocationOfPrimaryBooks/Country = '') and
														   $FormData/LocationOfPrimaryBooks/Country">
															<span>, </span>
														</xsl:if>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/LocationOfPrimaryBooks/Country"/>
														</xsl:call-template>
													</span>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</div>
									<!-- end line D (1) -->
									<!-- begin line D (2) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox" style="text-valign:top; height:4.5mm;"/>
										<div class="styIRS1120FLNDesc" style="height:4.5mm; padding-top:1mm">
											<b>(2)</b> Principal location of worldwide business
			    <span class="sty1120FItemUnderline" style="width:35.8mm">
												<span style="width:1px"/>
											</span>
											<xsl:variable name="LocUSAddressBlank">
												<xsl:value-of select="$FormData/PrincipleLocationUSAddress/AddressLine1 = ''
                                                         and $FormData/PrincipleLocationUSAddress/AddressLine2 = ''
                                                         and $FormData/PrincipleLocationUSAddress/City = ''
                                                         and $FormData/PrincipleLocationUSAddress/State = ''
                                                         and $FormData/PrincipleLocationUSAddress/ZIPCode = ''"/>
											</xsl:variable>
											<xsl:variable name="LocForeignAddressBlank">
												<xsl:value-of select="$FormData/PrincipleLocationFrgnAddress/AddressLine1 = ''
                                                         and $FormData/PrincipleLocationFrgnAddress/AddressLine2 = ''
                                                         and $FormData/PrincipleLocationFrgnAddress/City = ''
                                                         and $FormData/PrincipleLocationFrgnAddress/ProvinceOrState = ''
                                                         and $FormData/PrincipleLocationFrgnAddress/PostalCode = ''
                                                         and $FormData/PrincipleLocationFrgnAddress/Country = ''"/>
											</xsl:variable>
											<xsl:if test="$FormData/PrincipleLocationUSAddress and $LocUSAddressBlank = 'false'">
												<span class="sty1120FItemUnderlineSM" style="width:94mm; float:left; clear:none;">
													<xsl:call-template name="PopulateUSAddressTemplate">
														<xsl:with-param name="TargetNode" select="$FormData/PrincipleLocationUSAddress"/>
													</xsl:call-template>
												</span>
											</xsl:if>
											<xsl:if test="$FormData/PrincipleLocationFrgnAddress and $LocForeignAddressBlank = 'false'">
												<span class="sty1120FItemUnderlineSM" style="width:94mm; float:left; clear:none;">
													<xsl:call-template name="PopulateForeignAddressTemplate">
														<xsl:with-param name="TargetNode" select="$FormData/PrincipleLocationFrgnAddress"/>
													</xsl:call-template>
												</span>
											</xsl:if>
										</div>
									</div>
									<!-- end line D (2) -->
									<!-- begin line D (3) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox" style="text-valign:top; height:4.5mm;"/>
										<div class="styIRS1120FLNDesc" style="height:4.5mm; padding-top:1mm">
											<b>(3) </b>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/MaintainOfficeInUS"/>
													<xsl:with-param name="BackupName">IRS1120FMaintainOfficeInUS</xsl:with-param>
												</xsl:call-template>
					If the corporation maintains an office or place of business in the<br/>
												<span style="width:5mm"/>United States, check here
				</label>
											<!--Dotted Line-->
											<span class="styDotLn" style="float:none">............</span>
											<span style="padding-left:1mm">
												<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											</span>
											<span style="width:8px"/>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/MaintainOfficeInUS"/>
													<xsl:with-param name="BackupName">IRS1120FMaintainOfficeInUS</xsl:with-param>
												</xsl:call-template>
											</input>
										</div>
									</div>
									<!-- end line D (3) -->
									<!-- begin line E  -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox" style="padding-top:0mm">E</div>
										<div class="styIRS1120FLNDesc">
				If the corporation had an agent in the United States at any time during the tax year, enter:</div>
									</div>
									<!-- end line E  -->
									<!-- begin line E (1) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox"/>
										<div class="styIRS1120FLNDesc">
											<b>(1)</b> Type of agent					
				<span class="sty1120FItemUnderlineSM" style="width:70mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/TypeOfAgent"/>
												</xsl:call-template>
											</span>
											<br/>
											<!--<span class="sty1120FItemUnderlineSM" style="width:94mm; float:left; clear:none;"></span>-->
										</div>
									</div>
									<!-- end line E (1) -->
									<!-- begin line E (2) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox"/>
										<div class="styIRS1120FLNDesc">
											<b>(2)</b> Name					
				<span class="sty1120FItemUnderlineSM" style="width:80.4mm">
												<xsl:if test="$FormData/NameOfAgentPerson">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/NameOfAgentPerson"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$FormData/NameOfAgentBusiness">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/NameOfAgentBusiness/BusinessNameLine1"/>
													</xsl:call-template>
												</xsl:if>
											</span>
											<xsl:if test="$FormData/NameOfAgentBusiness">
												<br/>
												<span class="sty1120FItemUnderlineSM" style="width:94mm; float:left; clear:none;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/NameOfAgentBusiness/BusinessNameLine2"/>
													</xsl:call-template>
												</span>
											</xsl:if>
										</div>
									</div>
									<!-- end line E (2) -->
									<!-- begin line E (3) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox"/>
										<div class="styIRS1120FLNDesc">
											<b>(3)</b> Address					
				<span class="sty1120FItemUnderlineSM" style="width:77mm">
												<span style="width:1px"/>
											</span>
											<xsl:variable name="USAddressBlank">
												<xsl:value-of select="$FormData/USAddressOfAgent/AddressLine1 = ''
                                                         and $FormData/USAddressOfAgent/AddressLine2 = ''
                                                         and $FormData/USAddressOfAgent/City = ''
                                                         and $FormData/USAddressOfAgent/State = ''
                                                         and $FormData/USAddressOfAgent/ZIPCode = ''"/>
											</xsl:variable>
											<xsl:variable name="ForeignAddressBlank">
												<xsl:value-of select="$FormData/ForeignAddressOfAgent/AddressLine1 = ''
                                                         and $FormData/ForeignAddressOfAgent/AddressLine2 = ''
                                                         and $FormData/ForeignAddressOfAgent/City = ''
                                                         and $FormData/ForeignAddressOfAgent/ProvinceOrState = ''
                                                         and $FormData/ForeignAddressOfAgent/PostalCode = ''
                                                         and $FormData/ForeignAddressOfAgent/Country = ''"/>
											</xsl:variable>
											<xsl:variable name="AddressNotPresent">
												<xsl:value-of select="(not($FormData/USAddressOfAgent) and not($FormData/ForeignAddressOfAgent)) or 
                                (not($FormData/USAddressOfAgent) and $ForeignAddressBlank = 'true') or
                                (not($FormData/ForeignAddressOfAgent) and $USAddressBlank = 'true')"/>
											</xsl:variable>
											<xsl:choose>
												<xsl:when test="$AddressNotPresent = 'true'">
													<span class="sty1120FItemUnderline" style="width:94mm; float:left; clear:none;">
														<span style="width:1px"/>
													</span>
													<span class="sty1120FItemUnderline" style="width:94mm; float:left; clear:none;">
														<span style="width:1px"/>
													</span>
												</xsl:when>
												<xsl:when test="$FormData/USAddressOfAgent and $USAddressBlank = 'false'">
													<span class="sty1120FItemUnderlineSM" style="width:94mm; float:left; clear:none;">
														<xsl:call-template name="PopulateUSAddressTemplate">
															<xsl:with-param name="TargetNode" select="$FormData/USAddressOfAgent"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:when test="$FormData/ForeignAddressOfAgent and $ForeignAddressBlank = 'false'">
													<span class="sty1120FItemUnderlineSM" style="width:94mm; float:left; clear:none;">
														<xsl:call-template name="PopulateForeignAddressTemplate">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignAddressOfAgent"/>
														</xsl:call-template>
													</span>
												</xsl:when>
											</xsl:choose>
										</div>
									</div>
									<!-- end line E (3) -->
									<!-- begin line F  -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox">F</div>
										<div class="styIRS1120FLNDesc" style="padding-top:.5mm">
				See the instructions and enter the corporation&#8217;s principal:</div>
									</div>
									<!-- end line F  -->
									<!-- begin line F (1) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox"/>
										<div class="styIRS1120FLNDesc">
											<b>(1) </b>Business activity code number<span style="width:2mm"/>
											<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											<span style="width:1mm"/>
											<span class="sty1120FItemUnderline" style="width:42.8mm">
												<xsl:if test="$FormData/BusinessActivityCode">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/BusinessActivityCode"/>
													</xsl:call-template>
												</xsl:if>
												<xsl:if test="$FormData/InactiveBusinessActivityCode">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/InactiveBusinessActivityCode"/>
													</xsl:call-template>
												</xsl:if>
											</span>
										</div>
									</div>
									<!-- end line F (1) -->
									<!-- begin line F (2) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox"/>
										<div class="styIRS1120FLNDesc">
											<b>(2) </b>Business activity<span style="width:2mm"/>
											<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											<span style="width:1mm"/>
											<span class="sty1120FItemUnderline" style="width:60.6mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/BusinessActivity"/>
												</xsl:call-template>
											</span>
										</div>
									</div>
									<!-- end line F (2) -->
									<!-- begin line F (3) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox"/>
										<div class="styIRS1120FLNDesc">
											<b>(3) </b>Product or service<span style="width:2mm"/>
											<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											<span style="width:1mm"/>
											<span class="sty1120FItemUnderlineSM" style="width:59.3mm">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/ProductOrService"/>
												</xsl:call-template>
											</span>
										</div>
									</div>
									<!-- end line F (3) -->
									<!-- begin line G(1,2) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox">G</div>
										<div class="styIRS1120FLNDesc" style="padding-top:.5mm">
											Check method of accounting:
											<span style="padding-left:3mm;">
												<b>(1)</b>
											</span>
											<span style="padding-left:2mm;">
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/MethodOfAcctCash"/>
														<xsl:with-param name="BackupName">IRS1120FMethodOfAcctCash</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/MethodOfAcctCash"/>
													<xsl:with-param name="BackupName">IRS1120FMethodOfAcctCash</xsl:with-param>
												</xsl:call-template>
												<span style="padding-left:2mm;">Cash</span>
											</label>
											<span style="padding-left:3mm;">
												<b>(2)</b>
											</span>
											<span style="padding-left:2mm;">
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/MethodOfAcctAccrual"/>
														<xsl:with-param name="BackupName">IRS1120FMethodOfAcctAccrual</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/MethodOfAcctAccrual"/>
													<xsl:with-param name="BackupName">IRS1120FMethodOfAcctAccrual</xsl:with-param>
												</xsl:call-template>
												<span style="padding-left:2mm;">Accrual</span>
											</label>
										</div>
									</div>
									<!-- end line G(1,2)  -->
									<!-- begin line G (3) -->
									<div class="styGenericDiv" style="width:100mm;">
										<div class="styIRS1120FLNLeftNumBox"/>
										<div class="styIRS1120FLNDesc">
											<b>(3)</b>
											<span style="padding-left:2mm;">
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/MethodOfAcctOther"/>
														<xsl:with-param name="BackupName">IRS1120FMethodOfAcctOther</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
											<span style="width:2mm"/>
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/MethodOfAcctOther"/>
													<xsl:with-param name="BackupName">IRS1120FMethodOfAcctOther</xsl:with-param>
												</xsl:call-template>
					Other (specify)
				</label>
											<span style="width:2mm;"/>
											<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											<span class="sty1120FItemUnderlineSM" style="width:56.7mm">
												<!-- Form to Form Link -->
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$FormData/MethodOfAcctOther/@OtherMethodOfAcctSpecify"/>
												</xsl:call-template>
											</span>
											<br/>
											<span class="sty1120FItemUnderlineSM" style="width:94mm; float:left; clear:none;"/>
											<br/>
											<span style="width:1px;"/>
										</div>
									</div>
									<!-- end line G (3) -->
								</td>
								<!-- end left side  -->
								<!-- begin right side -->
								<td class="styGenericDiv" style="width:87mm;vertical-align:top;">
									<table cellpadding="0" cellspacing="0" style="width:87mm;font-size:7pt">
										<tbody>
											<!-- begin line H  -->
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox">H</td>
												<td class="styIRS1120FRGnewDesc" style="text-align-last:justify">
                        Did the corporation&#8217;s method of accounting change
                      </td>
												<td class="styIRS1120FRGnewYesNoBox" style="font-weight:bold;">Yes</td>
												<td class="styIRS1120FRGnewYesNoBox" style="font-weight:bold;">No</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox"/>
												<td class="styIRS1120FRGnewDesc">
													<div class="sty1120FRightFloat">
														<span class="sty1120FDotLn">........</span>
													</div>
													<span style="text-align:left">from the preceding tax year?</span>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/AccountingMethodChangeFromPrYr"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/AccountingMethodChangeFromPrYr"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox" style="height:5mm"/>
												<td class="styIRS1120FRGnewDesc" style="text-align:left">
                        If &#8220;Yes,&#8221; attach a statement with an explanation.
                        <xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/AccountingMethodChangeFromPrYr"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded ">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded ">
													<span style="width:1px"/>
												</td>
											</tr>
											<!--Begin Line I-->
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox">I</td>
												<td class="styIRS1120FRGnewDesc">
													<div style="text-align-last:justify">
                          Did the corporation&#8217;s method of determining income
                        </div>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox"/>
												<td class="styIRS1120FRGnewDesc">
													<div class="sty1120FRightFloat">
														<span class="sty1120FDotLn">......</span>
													</div>
													<span style="text-align:left">change from the preceding tax year?</span>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/DeterminationMethodChgFromPrYr"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/DeterminationMethodChgFromPrYr"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox" style="height:5mm"/>
												<td class="styIRS1120FRGnewDesc" style="text-align:left">
                        If &#8220;Yes,&#8221; attach a statement with an explanation.
                        <xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/DeterminationMethodChgFromPrYr"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
											<!--Begin Line J-->
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox">J</td>
												<td class="styIRS1120FRGnewDesc">
													<div style="text-align-last:justify">
                          Did the corporation file a U.S. income tax return for
                        </div>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox"/>
												<td class="styIRS1120FRGnewDesc">
													<div class="sty1120FRightFloat">
														<span class="sty1120FDotLn">..........</span>
													</div>
													<span style="text-align:left">the preceding tax year?</span>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/PrecedingUSTaxReturn"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/PrecedingUSTaxReturn"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--Begin Line K (1)-->
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox">K</td>
												<td class="styIRS1120FRGnewDesc">
													<div style="text-align-last:justify;font-size:6pt">
														<span style="font-weight:bold;font-size:7pt">(1) </span>At any time during the tax year, was the corporation<br/>
														<span style="width:5.7mm"/>engaged in a trade or business in the United States?
                        </div>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/TradeOrBusinessInUS"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/TradeOrBusinessInUS"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--Begin Line K (2)-->
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox"/>
												<td class="styIRS1120FRGnewDesc">
													<div style="text-align-last:justify;font-size:6pt">
														<span style="font-weight:bold;font-size:7pt">(2) </span>If &#8220;Yes,&#8221; is taxpayer&#8217;s trade or business within the<br/>
														<span style="width:5.7mm"/>United States solely the result of a section 897
                        </div>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox"/>
												<td class="styIRS1120FRGnewDesc">
													<div class="sty1120FRightFloat">
														<span class="sty1120FDotLn">........</span>
													</div>
													<span style="width:5.7mm"/>
													<span style="font-size:6pt;text-align:left">(FIRPTA) sale or disposition?</span>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/FIRPTASaleOrDisposition"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/FIRPTASaleOrDisposition"/>
													</xsl:call-template>
												</td>
											</tr>
											<!--Begin Line L-->
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox">L</td>
												<td class="styIRS1120FRGnewDesc">
													<div style="text-align-last:justify">
                          Did the corporation have a permanent establishment in the United States for purposes of any applicable
                           tax treaty between the United States and a foreign
                        </div>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox"/>
												<td class="styIRS1120FRGnewDesc">
													<div class="sty1120FRightFloat">
														<span class="sty1120FDotLn">..............</span>
													</div>
													<span style="text-align:left">country?</span>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/PrmnntEstabInUSForSect894bTrty"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/PrmnntEstabInUSForSect894bTrty"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox" style="height:6mm"/>
												<td class="styIRS1120FRGnewDesc" style="text-align:left;padding-bottom:1mm">
                        If &#8220;Yes,&#8221; enter the name of the foreign country:<br/>
													<span class="sty1120FItemUnderline" style="width:70mm">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$FormData/ForeignCountryName"/>
														</xsl:call-template>
													</span>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
											<!--Begin Line M-->
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox">M</td>
												<td class="styIRS1120FRGnewDesc">
													<div style="text-align-last:justify">
                          Did the corporation have any transactions with
                        </div>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox"/>
												<td class="styIRS1120FRGnewDesc">
													<div class="sty1120FRightFloat">
														<span class="sty1120FDotLn">...........</span>
													</div>
													<span style="text-align:left">related parties?</span>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactions"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBox">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactions"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox"/>
												<td class="styIRS1120FRGnewDesc" style="text-align:left;font-size:6pt">
                        If &#8220;Yes,&#8221; Form 5472 may have to be filed (see instructions).
                        <span style="width:0.5mm"/>
													<xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactions"/>
													</xsl:call-template>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
											<tr>
												<td class="styIRS1120FRGnewLeftNumBox"/>
												<td class="styIRS1120FRGnewDesc" style="text-align:left;font-size:6pt">
                        Enter number of Forms 5472 attached
                        <img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
													<span class="sty1120FItemUnderline" style="width:23mm;font-size:6pt">
														<xsl:call-template name="PopulateAmount">
															<xsl:with-param name="TargetNode" select="$FormData/RelatedPartyTransactions/@numberOf5472sAttached"/>
														</xsl:call-template>
													</span>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
											<!--Note-->
											<tr>
												<td colspan="2" class="styIRS1120FRGnewDesc" style="width:75mm;text-align:left;padding-left:2mm">
													<b>Note: </b>
													<i>Additional information is required on page 2.</i>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
												<td class="styIRS1120FRGnewYesNoBoxShaded">
													<span style="width:1px"/>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
								<!-- end right side -->
							</tr>
						</table>
					</div>
					<!-- end main content area -->
					<div style="width:187mm">
						<div class="styIRS1120Fseparater" style="font-size:8pt">Computation of Tax Due or Overpayment</div>
						<!-- begin table II -->
						<table cellspacing="0" cellpadding="0" style="font-size:7pt; width:187mm" border="0">
							<!-- begin item 1 -->
							<tr>
								<td class="styIRS1120FLeftNumBox">1</td>
								<td colspan="3" class="styIRS1120FItemDesc" style="width:119mm" scope="row">
									<span style="float:left">
								Tax from Section I, line 11, page 2
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">................</span>
								</td>
								<td class="styIRS1120FNumBox">1</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxFromSectionI"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 1 -->
							<!-- begin item 2  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">2</td>
								<td colspan="3" class="styIRS1120FItemDesc" style="width:119mm" scope="row">
									<span style="float:left">
Tax from Section II, Schedule J, line 9, page 4
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
								</td>
								<td class="styIRS1120FNumBox">2</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxFromSectionII"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 2  -->
							<!-- begin item 3  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">3</td>
								<td colspan="3" class="styIRS1120FItemDesc" style="width:119mm" scope="row">
									<span style="float:left">
Tax from Section III (add lines 6 and 10 on page 5)
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>
								</td>
								<td class="styIRS1120FNumBox">3</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxFromSectionIII"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 3  -->
							<!-- begin item 4  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">4</td>
								<td colspan="5" class="styIRS1120FItemDesc" style="width:153mm" scope="row">
									<span style="float:left">
										<b>Total tax.</b> Add lines 1 through 3
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
								</td>
								<td class="styIRS1120FNumBox">4</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTax"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end item 4  -->
							<!-- begin item 5a  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">5a</td>
								<td class="styIRS1120FItemDesc" style="width:81mm" scope="row">
									<span style="float:left">
										2011 overpayment credited to 2012
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
								</td>
								<td class="styIRS1120FNumBox">5a</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/PriorYearOverpaymentCredited"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 5a  -->
							<!-- begin item 5b  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">
									<span style="padding-left:1.5mm">b</span>
								</td>
								<td class="styIRS1120FItemDesc" style="width:81mm" scope="row">
									<span style="float:left">
										2012 estimated tax payments
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 1120F Line 5(b), Estimated Tax Payments - Trust Indicator </xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPayments/@trustIndicator"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Form 1120F Line 5(b), Estimated Tax Payments - Trust Payment Amount </xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPayments/@trustPaymentAmount"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
								</td>
								<td class="styIRS1120FNumBox">5b</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPayments"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 5b  -->
							<!-- begin item 5c  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">
									<span style="padding-left:1.5mm">c</span>
								</td>
								<td class="styIRS1120FItemDesc" style="width:81mm" scope="row">
									<span style="float:left">
										Less 2012 refund applied for on Form 4466
										<span style="padding-left:1mm;">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/RefundAppliedForForm4466"/>
											</xsl:call-template>
										</span>
										<span style="padding-left:1mm;"/>
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
								</td>
								<td class="styIRS1120FNumBox">5c</td>
								<td class="styIRS1120FColumnBox">(
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RefundAppliedForForm4466"/>
									</xsl:call-template>		
								)</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 5c  -->
							<!-- begin item 5d  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">
									<span style="padding-left:1.5mm">d</span>
								</td>
								<td colspan="3" class="styIRS1120FItemDesc" style="width:119mm" scope="row">
									<span style="float:left">
										Combine lines 5a through 5c
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</td>
								<td class="styIRS1120FNumBox">5d</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxPaymentBalance"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 5d  -->
							<!-- begin item 5e  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">
									<span style="padding-left:1.5mm">e</span>
								</td>
								<td colspan="3" class="styIRS1120FItemDesc" style="width:119mm" scope="row">
									<span style="float:left">
										Tax deposited with Form 7004
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.................</span>
								</td>
								<td class="styIRS1120FNumBox">5e</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TaxDepositedWith7004"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 5e  -->
							<!-- begin item 5f  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">
									<span style="padding-left:1.5mm">f</span>
								</td>
								<td colspan="3" class="styIRS1120FItemDesc" style="width:119mm" scope="row">
									<span style="float:left">
										Credit for tax paid on undistributed capital gains (attach Form 2439)
										<span style="padding-left:1mm;">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/CreditFromForm2439"/>
											</xsl:call-template>
										</span>
										<span style="padding-left:1mm;"/>
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
								</td>
								<td class="styIRS1120FNumBox">5f</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CreditFromForm2439"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 5f  -->
							<!-- begin item 5g  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">
									<span style="padding-left:1.5mm">g</span>
								</td>
								<td colspan="3" class="styIRS1120FItemDesc" style="width:119mm" scope="row">
									<span style="float:left">
										Credit for federal tax paid on fuels (attach Form 4136). See instructions
										<span style="padding-left:1mm;">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/CreditFromForm4136"/>
											</xsl:call-template>
											<span style="width:1mm;"/>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Form 1120F Line 5(g), Credit From Form 4136 - Ozone Depleting Chemicals Indicator</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/CreditFromForm4136/@OzoneDepletingChemicalsInd"/>
											</xsl:call-template>
										</span>
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;"/>
								</td>
								<td class="styIRS1120FNumBox">5g</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/CreditFromForm4136"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 5g  -->
							<!-- begin item 5h  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">
									<span style="padding-left:1.5mm">h</span>
								</td>
								<td colspan="3" class="styIRS1120FItemDesc" style="width:119mm" scope="row">
									<span style="float:left">
										Refundable credit from Form 8827, line 8c	
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/RefundableCredits"/>
										</xsl:call-template>
										<span style="width:1mm;"/>
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
								</td>
								<td class="styIRS1120FNumBox">5h</td>
								<td class="styIRS1120FColumnBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/RefundableCredits"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 5h  -->
							<!-- begin item 5i  -->
							<tr>
								<td class="styIRS1120FLeftNumBox" valign="top">
									<span style="padding-left:1.5mm">i</span>
								</td>
								<td colspan="3" class="styIRS1120FItemDesc" style="width:119mm" scope="row">
U.S. income tax paid or withheld at source (add line 12, page 2, and amounts
 <span style="float:left">from Forms 8288-A and 8805 (attach Forms 8288-A and 8805))
						<!-- Form to Form Link -->
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/WithholdingFrom8288AOr8805"/>
										</xsl:call-template>
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
								</td>
								<td class="styIRS1120FNumBox" valign="bottom">5i</td>
								<td class="styIRS1120FColumnBox" style="padding-top:3.5mm">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WithholdingFrom8288AOr8805"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FNumBox" style="background:lightgrey; border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:0px">
									<span style="width:1px;"/>
								</td>
							</tr>
							<!-- end item 5i  -->
							<!-- begin item 5j  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">
									<span style="padding-left:1.5mm">j</span>
								</td>
								<td colspan="5" class="styIRS1120FItemDesc" style="width:153mm" scope="row">
									<span style="float:left">
										Total payments. Add lines 5d through 5i
										<span style="padding-left:1mm;">
											<!-- Form to Form Link -->
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Form 1120F Line 5(j), Total Payments -  Backup Withholding Indicator</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/TotalPayments/@BackupWithholdingIndicator"/>
											</xsl:call-template>
											<xsl:call-template name="LinkToLeftoverDataTableInline">
												<xsl:with-param name="Desc">Form 1120F Line 5(j), Total Payments -  Backup Withholding Amount</xsl:with-param>
												<xsl:with-param name="TargetNode" select="$FormData/TotalPayments/@BackupWithholdingAmount"/>
											</xsl:call-template>
										</span>
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
								</td>
								<td class="styIRS1120FNumBox">5j</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalPayments"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end item 5i  -->
							<!-- begin item 6  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">6</td>
								<td colspan="5" class="styIRS1120FItemDesc" style="width:153mm" scope="row">
									<span style="float:left">
Estimated tax penalty (see instructions). 
		<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/Form2220Attached"/>
												<xsl:with-param name="BackupName">IRS1120FForm2220Attached</xsl:with-param>
											</xsl:call-template>
			Check if Form 2220 is attached
		</label>
										<span style="padding-left:1mm;">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Form2220Attached"/>
											</xsl:call-template>
										</span>
									</span>
									<span style="float:right;padding-left:1mm">
										<span class="styDotLn" style="float:left;padding-right:1mm;">.......</span>
										<span style="float:right;">
											<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
											<span style="width:8px"/>
											<input type="checkbox" class="styCkbox">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/Form2220Attached"/>
													<xsl:with-param name="BackupName">IRS1120FForm2220Attached</xsl:with-param>
												</xsl:call-template>
											</input>
											<span style="width:8px"/>
										</span>
									</span>
								</td>
								<td class="styIRS1120FNumBox">6</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPenalty"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end item 6  -->
							<!-- begin item 7  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">7</td>
								<td colspan="5" class="styIRS1120FItemDesc" style="width:153mm" scope="row">
									<span style="float:left">
										<b>Amount owed. </b>If line 5j is smaller than the total of lines 4 and 6, enter amount owed
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
								</td>
								<td class="styIRS1120FNumBox" style="height:4mm;">7</td>
								<td class="styIRS1120FRGColumnBox" style="height:4mm;border-bottom-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BalanceDue"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end item 7  -->
							<!-- begin item 8a  -->
							<tr>
								<td class="styIRS1120FLeftNumBox">8a</td>
								<td colspan="5" class="styIRS1120FItemDesc" style="width:153mm" scope="row">
									<span style="float:left">
										<b>Overpayment. </b>If line 5j is larger than the total of lines 4 and 6, enter amount overpaid
</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
								</td>
								<td class="styIRS1120FNumBox">8a</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/OverpaymentAmount"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end item 8a  -->
							<!-- begin item 8b  -->
							<tr>
								<td class="styIRS1120FLeftNumBox" style="padding-top:0mm;padding-left:3mm;padding-bottom:2.5mm;">b</td>
								<td colspan="5" class="styIRS1120FItemDesc" style="width:153mm" scope="row">
									<b>Amount of overpayment on line 8a resulting from tax deducted and withheld under Chapter 3  </b>(from 
									<span style="float:left">Schedule W, line 7, page 7)
<!--									<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/OverpaymentAmountFromCTW"/>
										</xsl:call-template>-->
									</span>
									<span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
								</td>
								<td class="styIRS1120FNumBox" style="height:8mm;padding-top:4mm;">8b</td>
								<td class="styIRS1120FRGColumnBox" style="height:8mm;padding-top:4mm;border-bottom-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/OverpaymentAmountFromCTW"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end item 8b  -->
							<!-- begin item 9  -->
							<tr>
								<td class="styIRS1120FLeftNumBox" style="border-bottom-width:1px">9</td>
								<td colspan="5" class="styIRS1120FItemDesc" style="width:153mm; border-bottom-width:1px; float:none" scope="row">
									<span style="padding-left:10mm; float:right">
										<b>Refunded</b>
										<span style="width:1px"/>
										<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
										<span style="width:1px"/>
									</span>
			Enter portion of line 8a you want <b>Credited to 2013 estimated tax</b>
									<span style="padding-left:1mm">
										<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
									</span>
									<span valign="bottom" style="padding-left:1mm; padding-bottom:0mm;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/CreditElect"/>
										</xsl:call-template>
									</span>
								</td>
								<td class="styIRS1120FNumBox" style="border-bottom-width:1px">9</td>
								<td class="styIRS1120FRGColumnBox" style="border-bottom-width:1px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentSection/Refund"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end item 9  -->
						</table>
						<!-- end table II -->
					</div>
					<!-- begin signature section on separate printed page-->
					<div class="pageEnd"/>
					<!-- Implementing the signature section as a table -->
					<div style="width:187mm">
						<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;">
							<tr>
								<td rowspan="3" style="width:10mm;font-size: 11pt;font-weight:bold;border-right:1 solid black;border-bottom:1 solid black;">Sign Here</td>
								<td colspan="6" style="padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge. </td>
							</tr>
							<tr>
								<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
									<span style="width:1px"/>
								</td>
								<td style="width:52mm;border-right:1 solid black;border-bottom:1 solid black;vertical-align:bottom;">
									<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
									</xsl:call-template>
									<span style="width:1px;"/>
								</td>
								<td style="width:20mm;border-right:1 solid black;border-bottom:1 solid black;vertical-align:bottom;padding-left:.5mm;">
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
									</xsl:call-template>
								</td>
								<td rowspan="2" style="border-bottom:1 solid black;padding-left:1mm;">
									<span style="width:1px"/>
								</td>
								<td style="width:60mm;border-bottom:1 solid black;vertical-align:bottom;">
									<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
									<xsl:call-template name="PopulateReturnHeaderOfficer">
										<xsl:with-param name="TargetNode">Title</xsl:with-param>
									</xsl:call-template>
								</td>
								<td rowspan="2" style="width:40mm;border-bottom:1 solid black;padding-bottom:1mm;">
									<div class="styGenericDiv" style="width:2px;"/>
									<div style="border-right:3 solid black;border-left:3 solid black;border-bottom:3 solid black;border-top:3 solid black;float:right;" class="styGenericDiv">	May the IRS discuss this return<br/> with the preparer shown below <br/>(see instructions)?
			<input class="styCkbox" type="checkbox" name="Checkbox" style="width:3mm;">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
												<xsl:with-param name="BackupName">IRS1120FAuthorizeThirdPartyYesCheckbox</xsl:with-param>
											</xsl:call-template>
										</input>
										<span class="styBoldText">
											<label>
												<xsl:call-template name="PopulateReturnHeaderOfficer">
													<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
													<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
												</xsl:call-template>
			Yes
			</label>
										</span>
										<input class="styCkbox" type="checkbox" name="Checkbox" style="width:2.5mm;">
											<xsl:call-template name="PopulateReturnHeaderOfficer">
												<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
												<xsl:with-param name="BackupName">IRS1120FAuthorizeThirdPartyNoCheckbox</xsl:with-param>
											</xsl:call-template>
										</input>
										<span class="styBoldText">
											<label>
												<xsl:call-template name="PopulateReturnHeaderOfficer">
													<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
													<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
												</xsl:call-template>
			No
			</label>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td style="border-bottom:1 solid black;vertical-align:top;">Signature of officer</td>
								<td style="border-bottom:1 solid black;vertical-align:top;">Date</td>
								<td style="border-bottom:1 solid black;vertical-align:top;">Title</td>
							</tr>
						</table>
						<!-- end signature section -->
						<!-- BEGIN PREPARER SIGNATURE SECTION -->
						<!-- Implementing the Preparer section in table -->
						<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;border-color:black;border-bottom:1 solid black;">
							<tr>
								<!--row 1-->
								<td rowspan="3" style="width:18mm;font-size:10pt;font-weight:bold;font-family:'arial narrow';border-right:1 solid black;vertical-align:top;padding-top:5mm;border-bottom:1 solid black;">Paid Preparer Use Only</td>
								<td style="width:43mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">Print/Type preparer's name
                <br/>
									<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>
								</td>
								<td style="width:55mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">Preparer's signature
                <br/>
									<span style="width:2px;"/>
								</td>
								<td style="width:24mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;">
				Date <br/>
									<span style="text-align:center; padding-left:7mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
										</xsl:call-template>
									</span>
								</td>
								<td style="width:19mm;border-right:1 solid black;border-bottom:1 solid black;padding-left:1mm;vertical-align:bottom;padding-bottom:.5mm;">
									<nobr>
										<label>
											<xsl:call-template name="PopulateReturnHeaderPreparer">
												<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
												<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
											</xsl:call-template>Check  
				  </label>
									</nobr>
									<input class="styCkbox" type="checkbox" style="width:4mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
											<xsl:with-param name="BackupName">IRS1120FSelfEmployedCheckbox</xsl:with-param>
										</xsl:call-template>
									</input>
                if <br/> self-employed
              </td>
								<td style="width:35mm;border-bottom:1 solid black;padding-left:1mm;">PTIN
                <br/>
									<span style="text-align:center;padding-left:10mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SSN</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
										</xsl:call-template>
									</span>
								</td>
							</tr>
							<tr>
								<!--row 2-->
								<td rowspan="1" colspan="4" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">Firm&#8217;s name
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template>
									<br/>
									<span style="padding-left:16mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
										</xsl:call-template>
									</span>
								</td>
								<td style="border-bottom:1 solid black;padding-left:1mm;">Firm&#8217;s EIN
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>
									<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
										<xsl:with-param name="TargetNode">MissingEINReason</xsl:with-param>
									</xsl:call-template>
								</td>
							</tr>
							<tr>
								<!--row 3-->
								<td rowspan="1" colspan="4" style="border-bottom:1 solid black;border-right:1 solid black;padding-left:.5mm;">Firm&#8217;s address
                <img src="{$ImagePath}/1120_Bullet_Sm.gif" alt="SmallBullet"/>
									<span style="padding-left:1mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
										</xsl:call-template>
									</span>
									<br/>
									<span style="padding-left:19.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
										</xsl:call-template>
									</span>
									<br/>
									<span>
										<span style="width:18.5mm; height:12mm;float:left;"/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
									</span>
									<br/>
									<span style="padding-left:18.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">Country</xsl:with-param>
										</xsl:call-template>
									</span>
								</td>
								<td style="border-bottom:1 solid black;padding-left:1mm;"> Phone no. 
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
						<!-- page break and footer-->
						<div style="width:187mm;">
							<span style="float:left;">
								<b>For Paperwork Reduction Act Notice, see separate instructions.</b>
								<span style="width:3mm;"/>
								<i>IRS.gov/form1120f</i>
								<span style="width:3mm;"/>                 
			Cat. No. 11470I
		</span>
							<span style="float:right;">
							  
			Form <span class="styBoldText" style="font-size:8pt;">1120-F </span>
								<span style="font-size:7pt">(2012)</span>
							</span>
						</div>
						<div class="pageEnd"/>
						<!-- end page break and footer  -->
						<!-- begin page 2 -->
						<!-- page header -->
						<div class="styBB" style="width:187mm;padding-top:.5mm;">
							<div style="float:left;">Form 1120-F (2012)<span style="width:148mm;"/>
							</div>
							<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span>
							</div>
						</div>
					</div>
					<!-- end page header -->
					<!-- begin line items -->
					<table border="0" cellpadding="0" cellspacing="0" class="styTable" style="width:187mm;clear:both;float:none;font-size:7pt;">
						<tr>
							<!-- begin page 2  left side-->
							<td class="styGenericDiv" style="width:93mm;">
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styIRS1120FAdditionInfoTitle" style="width:92mm; height:4.5mm; border-right:1 solid black;">
										<b>Additional Information</b>
										<i> (continued from page 1)</i>
									</div>
								</div>
								<!-- begin Additional Information - line N  -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">N</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">Is the corporation a controlled foreign corporation?</div>
									<div class="styIRS1120FYesNoBox" style="height:4.5mm;font-weight:bold">Yes</div>
									<div class="styIRS1120FLFNoBox" style="height:4.5mm; font-weight:bold">No</div>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
										<span style="float:left">
(See section 957(a) for definition.)
	      				</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</div>
									<span style="font-weight:normal;">
										<div class="styIRS1120LNYesNoBox">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/ControlledCorporation"/>
											</xsl:call-template>
										</div>
										<div class="styIRS1120LNYesNoBoxRB">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/ControlledCorporation"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!-- end Additional Information - line N  -->
								<!-- begin Additional Information - line O  -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">O</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">Is the corporation a personal service corporation?</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
										<span style="float:left">
(See instructions for definition.)
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
									</div>
									<span style="font-weight:normal;">
										<div class="styIRS1120LNYesNoBox">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/PersonalServiceCorporation"/>
											</xsl:call-template>
										</div>
										<div class="styIRS1120LNYesNoBoxRB">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/PersonalServiceCorporation"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<!-- end Additional Information - line O  -->
								<!-- begin Additional Information - line P  -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">P</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter tax-exempt interest received or accrued during</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">the tax year (see instructions)
			       	<span style="padding-left:1mm">
											<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
										<span style="width:1mm"/>$
					<span class="sty1120FItemUnderlineSM" style="width:22mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterest"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:5.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:5.5mm;"/>
								</div>
								<!-- end Additional Information - line P  -->
								<!-- begin Additional Information - line Q  -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">Q</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">At the end of the tax year, did the corporation own,</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">directly or indirectly, 50% or more of the voting stock</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">of a U.S. corporation? (See section 267(c) for rules</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
										<span style="float:left">
of attribution.)
					<span style="padding-left:1mm;">
												<!-- Form to Form Link -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/Own50PercentOrMoreVotingStock"/>
												</xsl:call-template>
											</span>
											<span style="padding-left:1mm;"/>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
									</div>
									<span style="font-weight:normal;">
										<div class="styIRS1120LNYesNoBox">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/Own50PercentOrMoreVotingStock"/>
											</xsl:call-template>
										</div>
										<div class="styIRS1120LNYesNoBoxRB">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/Own50PercentOrMoreVotingStock"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">If &#8220;Yes,&#8221; attach a statement showing <b>(1)</b> name and</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">EIN of such U.S. corporation; <b>(2)</b> percentage owned;</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">and <b>(3)</b> taxable income or (loss) before NOL and </div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;"> special deductions of such U.S. 
									corporation for the tax</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
									 year ending with or within your tax year.</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<!--	<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;"></div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>    -->
								<!-- end Additional Information - line Q  -->
								<!-- begin Additional Information - line R  -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">R</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">If the corporation has an NOL for the tax year</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">and is electing to forego the carryback period,</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
										<span style="float:left">
											<label>
												<xsl:call-template name="PopulateLabel">
													<xsl:with-param name="TargetNode" select="$FormData/NOLForegoCarryback"/>
													<xsl:with-param name="BackupName">IRS1120FNOLForegoCarryback</xsl:with-param>
												</xsl:call-template>
					check here
				</label>
										</span>
										<span style="float:right;">
											<span class="styDotLn" style="float:left;padding-left:1mm;">............</span>
											<span style="float:right;padding-right:2mm;">
												<span style="padding-left:1mm;">
													<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
												</span>
												<span style="width:8px"/>
												<input type="checkbox" class="styCkbox">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/NOLForegoCarryback"/>
														<xsl:with-param name="BackupName">IRS1120FNOLForegoCarryback</xsl:with-param>
													</xsl:call-template>
												</input>
											</span>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:5.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:5.5mm;"/>
								</div>
								<!-- end Additional Information - line R  -->
								<!-- begin Additional Information - line S  -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">S</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">Enter the available NOL carryover from prior tax</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">years. (Do not reduce it by any deduction on line 30a,</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">page 3.)
					<span style="padding-left:1mm;">
											<!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverFromPriorYear"/>
											</xsl:call-template>
										</span>
										<span style="padding-left:1mm;"/>
										<span style="padding-left:2mm">
											<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
										<span style="width:1mm"/>
			       	$
					<span class="sty1120FItemUnderlineSM" style="width:44mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/NOLCarryoverFromPriorYear"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:5.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:5.5mm;"/>
								</div>
								<!-- end Additional Information - line S  -->
								<!-- begin Additional Information - line T  -->
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">T</div>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">Is the corporation a subsidiary in a parent-subsidiary</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
										<span style="float:left">
controlled group?
</span>
										<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
									</div>
									<span style="font-weight:normal;">
										<div class="styIRS1120LNYesNoBox">
											<xsl:call-template name="PopulateYesBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMember"/>
											</xsl:call-template>
										</div>
										<div class="styIRS1120LNYesNoBoxRB">
											<xsl:call-template name="PopulateNoBoxText">
												<xsl:with-param name="TargetNode" select="$FormData/ControlledGroupMember"/>
											</xsl:call-template>
										</div>
									</span>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">If &#8220;Yes,&#8221; enter the parent corporation&#8217;s:</div>
									<div class="styShadingCell" style="width:6mm;height:4.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:4.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
										<b>(1) EIN</b>
										<span style="padding-left:2mm">
											<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
										<span class="sty1120FItemUnderlineSM" style="padding-left:2mm; width:55mm">
											<xsl:choose>
												<xsl:when test="$FormData/ParentCorporationEIN">
													<span style="text-align:left">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationEIN"/>
														</xsl:call-template>
													</span>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$FormData/MissingEINReason"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:5.5mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:5.5mm;"/>
								</div>
								<div class="styGenericDiv" style="width:93mm;border-bottom-width: 1px solid black">
									<div class="styLNLeftNumBox" style="height:4.5mm; padding-left:3mm"/>
									<div class="styLNDesc" style="width:72mm;height:4.5mm;">
										<b>(2) Name</b>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Additional Information - Parent Corporation Name Control</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationNameControl"/>
										</xsl:call-template>
										<span style="padding-left:2mm">
											<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
										</span>
										<span class="sty1120FItemUnderlineSM" style="padding-left:2mm; width:50mm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine1"/>
											</xsl:call-template>
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationName/BusinessNameLine2"/>
											</xsl:call-template>
										</span>
									</div>
									<div class="styShadingCell" style="width:6mm;height:10mm;"/>
									<div class="styShadingCellRB" style="width:6mm;height:10mm;"/>
								</div>
								<!--  This is the start of Z to U -->
								<div class="styGenericDiv" style="width:94mm">
									<div class="styLNLeftNumBox" style="">U</div>
									<div class="styLNDesc" style="width:72mm;">
										<b>(1) </b>Is the corporation a dealer under section 475? 
					<span class="styDotLn" style="float:none"/>
									</div>
									<div class="styIRS1120FRGnewYesNoBox" style="height:4.2mm;float:left;clear:none">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="$FormData/DealerUnderIRC475"/>
										</xsl:call-template>
									</div>
									<div class="styIRS1120FRGnewYesNoBox" style="height:4.2mm;float:left;clear:none;border-right-width:1px;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="$FormData/DealerUnderIRC475"/>
										</xsl:call-template>
									</div>
									<div class="styLNLeftNumBox" style="padding-left:3mm;clear:left">
										<span style="width:1px"/>
									</div>
									<div class="styLNDesc" style="width:72mm">
										<b>(2) </b>Did the corporation mark to market any securities
			       </div>
									<div class="styIRS1120FRGnewYesNoBoxShaded" style="height:4.2mm;float:left;clear:none">
										<span style="width:1px"/>
									</div>
									<div class="styIRS1120FRGnewYesNoBoxShaded" style="height:4.2mm;float:left;clear:none;border-right-width:1px;">
										<span style="width:1px"/>
									</div>
									<div class="styLNLeftNumBox" style="clear:left;padding-left:3mm">
										<span style="width:1px"/>
									</div>
									<div class="styLNDesc" style="width:72mm">
										<span style="padding-left:5mm; float:left; clear:none">or commodities other than in a dealer capacity?
			         <span class="styDotLn" style="float:none"/>
										</span>
									</div>
									<div class="styIRS1120FRGnewYesNoBox" style="height:13mm;float:left;clear:none;border-bottom-width:0px;
									padding-top:0.5mm;">
										<xsl:call-template name="PopulateYesBoxText">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketOtherThanDealer"/>
										</xsl:call-template>
									</div>
									<div class="styIRS1120FRGnewYesNoBox" style="height:13mm;float:left;clear:none;border-bottom-width:0px;
									padding-top:0.5mm;border-right-width:1px;">
										<xsl:call-template name="PopulateNoBoxText">
											<xsl:with-param name="TargetNode" select="$FormData/MarkToMarketOtherThanDealer"/>
										</xsl:call-template>
									</div>
								</div>
								<!-- end Additional Information - line T  -->
							</td>
							<!--  end page 2  left side-->
							<!--  begin page 2 right side-->
							<td class="styGenericDiv" style="width:94mm;vertical-align:top;">
								<!-- begin Additional Information - line U  -->
								<div class="styGenericDiv" style="width:94mm;height:12.5mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">V</div>
									<div style="width:85.8mm; float:left; clear: none; height:12.5mm;">
										<div class="styLNDesc" style="width:73.6mm;height:12.5mm;">
										
										
											At the end of the tax year, did any individual, partnership,
											corporation, estate, or trust own, directly or indirectly,
											50% or more of the corporation&#8217;s voting stock? (See
											section 267(c) for rules of attribution.) 
											
											
											If &#8220;Yes,&#8221; attach a statement showing the name and
											identifying number. (Do not include any information
											already entered in item <b> T. </b>)
											
											
												 <!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/Own50PercentCorpVotingStock"/>
											</xsl:call-template>
											<div style="float:left;clear:left;padding-top:1mm">
        						Enter percentage owned 
        						<span style="padding-left:2mm">
													<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
												</span>
												<span class="sty1120FItemUnderlineSM" style="width:35mm; padding-left:2mm">
													<xsl:call-template name="PopulatePercent">
														<xsl:with-param name="TargetNode" select="$FormData/OwnCorpVotingStockPercent"/>
													</xsl:call-template>
												</span>
											</div>
										</div>
										<div style="width:12.1mm;height:12.5mm;float:left; clear:none;">
											<div class="styIRS1120FYesNoBox" style="width:6mm;height:4.5mm; float:left; clear:none; font-weight:bold">Yes</div>
											<div class="styIRS1120FYesNoBoxRB" style="width:6mm;height:4.5mm; border-right-width:0px;float:left; clear:none;font-weight:bold">No</div>
											<!--											<div class="styShadingCell" style="width:6mm;height:5.5mm;float:left; clear:none;"/>
											<div class="styShadingCellRB" style="width:6mm;height:5.5mm; border-right-width:0px;float:left; clear:none;"/>
-->
											<span style="font-weight:normal;">
												<div class="styIRS1120FYesNoBox" style="height:4mm">
													<xsl:call-template name="PopulateYesBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/Own50PercentCorpVotingStock"/>
													</xsl:call-template>
												</div>
												<div class="styIRS1120FYesNoBoxRB" style="height:4mm">
													<xsl:call-template name="PopulateNoBoxText">
														<xsl:with-param name="TargetNode" select="$FormData/Own50PercentCorpVotingStock"/>
													</xsl:call-template>
												</div>
											</span>
											<div style="width:12.1mm;height:20mm;float:left; clear:none;">
												<div class="styShadingCell" style="width:6mm;height:20mm; float:left; clear:none;"/>
												<div class="styShadingCellRB" style="width:6mm;height:20mm; border-right-width:0px;float:left; clear:none;"/>
											</div>
										</div>
									</div>
								</div>
								<!-- end Additional Information - line U  -->
								<!-- begin Additional Information - line W  -->
								<div class="styGenericDiv" style="width:94mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">W</div>
									<div style="width:85.8mm; float:left; clear: none;">
										<div class="styLNDesc" style="width:73.6mm;">
						Is the corporation taking a position on this return that<br/>  a U.S.
						tax treaty overrules or modifies an Internal Revenue law of
						the United States, thereby causing
<span>
												<span style="float:left">  a reduction of tax?
</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
											</span>
											<br/>
											<br/>
						If "Yes," the corporation is generally required to complete and attach Form 8833.  
						See Form 8833 for exceptions.
							 <!-- Form to Form Link -->
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/USTreatyOverrules"/>
											</xsl:call-template>
											<br/>
											<b>Note:</b>
											<span style="width:1mm"/>
											<i>Failure to disclose a treaty-based return position
						may result in a $10,000 penalty (see section 6712).</i>
										</div>
										<div style="width:12.1mm;float:left; clear:none;">
											<div class="styShadingCell" style="width:6mm;"/>
											<div class="styShadingCellRB" style="width:6mm;border-right-width:0px"/>
											<div class="styIRS1120FYesNoBox" style="width:6mm;height:4mm">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/USTreatyOverrules"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120FYesNoBoxRB" style="width:6mm;height:4mm; border-right-width:0px">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/USTreatyOverrules"/>
												</xsl:call-template>
											</div>
											<div class="styShadingCell" style="width:6mm;height:22.7mm"/>
											<div class="styShadingCellRB" style="width:6mm;height:22.7mm; border-right-width:0px"/>
										</div>
									</div>
								</div>
								<!-- end Additional Information - line W  -->
								<!-- begin Additional Information - line X  -->
								<div class="styGenericDiv" style="width:94mm; height:20mm">
									<div class="styLNLeftNumBox" style="height:4.5mm;">X</div>
									<div style="width:85.8mm; float:left; clear: none">
										<div class="styLNDesc" style="width:73.6mm">
						During the tax year, did the corporation own any entity
						that was disregarded as an entity separate from its owner
						under Regulations sections 301.7701-2 and 301.7701-3?
						<span style="padding-left:1mm;">
												<!-- Form to Form Link -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/OwnedEntitiesDisregarded"/>
												</xsl:call-template>
											</span>
											<div style="float:left;clear:left;font-size:6pt;padding-top:1.5mm">
						If "Yes," attach a statement listing the name, country under whose
						laws the entity was organized, and EIN (if any) of each such entity.
						</div>
										</div>
										<div style="width:12.1mm;height:20mm;float:left; clear:none;">
											<div class="styShadingCell" style="width:6mm;height:9mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:9mm; border-right-width:0px"/>
											<div class="styIRS1120FYesNoBox" style="width:6mm;height:4mm">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/OwnedEntitiesDisregarded"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120FYesNoBoxRB" style="width:6mm;height:4mm; border-right-width:0px">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/OwnedEntitiesDisregarded"/>
												</xsl:call-template>
											</div>
											<div class="styShadingCell" style="width:6mm;height:8mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:8mm; border-right-width:0px;"/>
										</div>
									</div>
								</div>
								<!-- end Additional Information - line X  -->
								<!-- begin Additional Information - line Y  -->
								<!--  ********* New Area *********** -->
								<div class="styGenericDiv" style="width:94mm; height:19.5mm;">
									<div class="styLNLeftNumBox" style="height:4.5mm;">Y</div>
									<div style="width:85.8mm; float:left; clear: none; height:12.5mm;">
										<div class="styLNDesc" style="width:73.6mm;height:19.5mm;">
											<b>(1) </b>Did a partnership allocate to the corporation a 
											<span style="padding-left:5mm; float:left; clear:none">
                                                          distributive share of income from a directly owned partnership interest, 
                                                          any of which is ECI or treated
                                                          <span style="float:left">
                                                           as ECI by the partnership or the partner?
                                                             <xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/ECIOrECITrtdDistriSharePrtshp"/>
													</xsl:call-template>
												</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
											</span>
											<div class="styLNDesc" style="width:73.6mm;padding-left:5mm;height:4mm;">
											    If &#8220;Yes,&#8221; attach Schedule P. See instructions.</div>
											<br/>
											<div class="styLNDesc" style="width:73.6mm; ">
												<b>(2) </b>During the tax year, did the corporation own </div>
											<div class="styLNDesc" style="width:73.6mm; padding-left:5mm;">
                                                              directly or indirectly, at least a 10% interest in  
                                                            <span style="float:left">
                                                            any foreign partnership?
                                                             <xsl:call-template name="SetFormLinkInline">
														<xsl:with-param name="TargetNode" select="$FormData/Owned10PercentIntForeignPrtshp"/>
													</xsl:call-template>
												</span>
												<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
											</div>
											<span style="padding-left:5mm; float:left; clear:none;">
											   If &#8220;Yes,&#8221;see instructions for required attachment .</span>
										</div>
										<div style="width:12.1mm;height:19.5mm;float:left; clear:none;">
											<div class="styShadingCell" style="width:6mm;height:10mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:10mm;
											 border-right-width:0px;float:left; clear:none;"/>
											<div class="styIRS1120FYesNoBox" style="width:6mm;height:4mm;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ECIOrECITrtdDistriSharePrtshp"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120FYesNoBoxRB" style="width:6mm;height:4mm; border-right-width:0px">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/ECIOrECITrtdDistriSharePrtshp"/>
												</xsl:call-template>
											</div>
											<div class="styLNRightNumBox" style="width:6mm;height:11.5mm;float:left; clear:none;background-color:lightgrey;border-bottom-width:0px;"/>
											<div class="styShadingCellRB" style="width:6mm;height:11.5mm; border-right-width:0px;float:left; clear:none;"/>
											<div class="styIRS1120FYesNoBox" style="width:6mm;height:8.5mm;padding-top:.5mm">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/Owned10PercentIntForeignPrtshp"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120FYesNoBoxRB" style="width:6mm;height:8.5mm; border-right-width:0px;padding-top:.5mm">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/Owned10PercentIntForeignPrtshp"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
								<!-- end Additional Information - line Y  -->
								<!-- begin Additional Information - line Z  -->
								<div class="styGenericDiv" style="width:94mm; height:19.5mm">
									<div class="styLNLeftNumBox" style="height:4.5mm;">Z</div>
									<div style="width:85.8mm; float:left; clear: none; height:12.5mm">
										<div class="styLNDesc" style="width:73.6mm;height:10mm;">
											<b>(1) </b>Has the corporation engaged in any transactions the
										results of which are subject to the arm's length standard
										under section 482 and its regulations?
											<!--Has the corporation made any allocation or <span style="padding-left:5mm; float:left; clear:none">
						reallocation of income based on section 482 and its regulations?</span>-->
											<br/>
											<b>(2) </b>Has the corporation recognized any interbranch 
						 <span style="padding-left:5mm; float:left; clear:none">amounts? If &#8220;Yes,&#8221; attach statement (see instructions).
								 <!-- Form to Form Link -->
												<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/InterbranchTransaction"/>
												</xsl:call-template>
											</span>
										</div>
										<div style="width:12.1mm;height:10mm;float:left; clear:none;">
											<div class="styShadingCell" style="width:6mm;height:7mm; float:left; clear:none;"/>
											<div class="styShadingCellRB" style="width:6mm;height:7mm; border-right-width:0px;float:left; clear:none;"/>
											<div class="styIRS1120FYesNoBox" style="width:6mm;height:4mm">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/AllocationIncomePerSection482"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120FYesNoBoxRB" style="width:6mm;height:4mm; border-right-width:0px">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/AllocationIncomePerSection482"/>
												</xsl:call-template>
											</div>
											<div class="styShadingCell" style="width:6mm;height:5.5mm;float:left; clear:none;"/>
											<div class="styShadingCellRB" style="width:6mm;height:5.5mm; border-right-width:0px;float:left; clear:none;"/>
											<div class="styIRS1120FYesNoBox" style="width:6mm;height:5mm;padding-top:.5mm">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/InterbranchTransaction"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120FYesNoBoxRB" style="width:6mm;height:5mm; border-right-width:0px;padding-top:.5mm">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/InterbranchTransaction"/>
												</xsl:call-template>
											</div>
										</div>
									</div>
								</div>
								<!-- end Additional Information - line Z  -->
								<!-- begin Additional Information - line AA  -->
								<div class="styGenericDiv" style="width:94mm; height:9mm;">
									<div class="styLNLeftNumBox" style="">AA</div>
									<div style="width:85.8mm; float:left; clear: none; height:9mm;">
										<div class="styLNDesc" style="width:73.6mm;">
Is the corporation required to file Schedule UTP (Form 1120), Uncertain Tax Position Statement (see
<span style="float:left">
instructions)?
</span>
											<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
											<span style="float:left; clear:none">
											</span>
											<div class="styLNDesc" style="width:73.6mm;height:4mm;">
If "Yes," complete and attach Schedule UTP.
<xsl:call-template name="SetFormLinkInline">
													<xsl:with-param name="TargetNode" select="$FormData/UncertainTaxPositionStatement"/>
												</xsl:call-template>
											</div>
										</div>
										<div style="width:12.1mm;height:10mm;float:left; clear:none;">
											<div class="styShadingCell" style="width:6mm;height:6mm;"/>
											<div class="styShadingCellRB" style="width:6mm;height:6mm;
											border-right-width:0px;float:left; clear:none;"/>
											<div class="styIRS1120FYesNoBox" style="width:6mm;height:4mm;">
												<xsl:call-template name="PopulateYesBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/UncertainTaxPositionStatement"/>
												</xsl:call-template>
											</div>
											<div class="styIRS1120FYesNoBoxRB" style="width:6mm;height:4mm; border-right-width:0px">
												<xsl:call-template name="PopulateNoBoxText">
													<xsl:with-param name="TargetNode" select="$FormData/UncertainTaxPositionStatement"/>
												</xsl:call-template>
											</div>
											<div class="styLNRightNumBox" style="width:6mm;height:6mm;float:left; clear:none;background-color:lightgrey;border-bottom-width:0px;"/>
											<div class="styShadingCellRB" style="width:6mm;height:6mm; border-right-width:0px;float:left; clear:none;"/>
										</div>
									</div>
								</div>
								<!-- end Additional Information - line X  -->
							</td>
							<!--  end page 2  right side-->
						</tr>
					</table>
					<!-- begin section I description -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td style="float:left; font-size: 7pt; font-weight:bold; padding-top:1mm; padding-bottom:1mm">
			SECTION I&#8212;Income From U.S. Sources Not Effectively Connected With the Conduct of a Trade or Business in the United States&#8212;<span style="font-size:7pt; font-weight:normal;">Do not report items properly withheld and reported on Form 1042-S. See instructions.</span>
							</td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="float:left; font-size:6pt; font-weight:normal;clear:none; padding-bottom:1mm; padding-top:1mm">
			Include below <b>only</b> income from U.S. sources that is <b>not</b> effectively connected with the conduct of a trade or business in the
			United States.  Do not report items properly withheld and reported on Form 1042-S.  Report only items that <b>(a)</b> are not correctly withheld at source or 
			<b>(b)</b> are not correctly reported on Form 1042-S.  The rate of tax on each item of <b>gross</b> income listed below is 30% (4% for the gross transportation 
			 tax) or such lower rate specified by tax treaty. No deductions are allowed against these types of income. Enter treaty rates where applicable. <b>If the
			corporation is claiming a lower treaty rate, also complete item W above.</b> If multiple treaty rates apply to a type of income (e.g., subsidiary
			and portfolio dividends or dividends received by disregarded entities), attach a statement showing the amounts, tax rates, and withholding for each.	
             <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<!-- end section I description -->
					<!-- begin name of treaty country -->
					<div class="styBB" style="width:187mm;clear:none; padding-bottom:0.5mm">
						<div style="text-align:left;float:left;margin-top:0px; font-size:7pt">Name of treaty country, if any
		<span style="padding-left:1mm;">
								<img src="{$ImagePath}/1120F_Bullet_Md.gif" valign="middle" alt="MediumBullet"/>
							</span>
							<span class="sty1120FItemUnderline" style="padding-left:1mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/NameOfTreatyCountry"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- end name of treaty country -->
					<!-- begin name of treaty country table -->
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyLF" style="width:65mm;">
							(a)
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
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px">
							<span style="float:left;padding-left:1mm; padding-right:2mm; font-weight:bold">1</span>
							<span style="float:left;">
							Interest 
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Interest/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Interest/RateOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Interest/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Interest/AmountOfUSTaxPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px">
							<span style="float:left;padding-left:1mm; padding-right:2mm; font-weight:bold">2</span>
							<span style="float:left;">
Dividends 
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Dividends/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Dividends/RateOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Dividends/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Dividends/AmountOfUSTaxPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px">
							<span style="float:left;padding-left:1mm; padding-right:2mm; font-weight:bold">3</span>
							<span style="float:left;">
Rents
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/ClassOfIncomeRents/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/ClassOfIncomeRents/RateOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/ClassOfIncomeRents/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/ClassOfIncomeRents/AmountOfUSTaxPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px">
							<span style="float:left;padding-left:1mm; padding-right:2mm; font-weight:bold">4</span>
							<span style="float:left">
Royalties
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Royalties/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Royalties/RateOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Royalties/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Royalties/AmountOfUSTaxPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm; border-bottom-width:0px">
							<span style="float:left;padding-left:1mm; padding-right:2mm; font-weight:bold">5</span>
							<span style="float:left">
Annuities
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Annuities/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:4.5mm; text-align:center">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Annuities/RateOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Annuities/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/Annuities/AmountOfUSTaxPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:9mm; border-bottom-width:0px">
							<span style="padding-left:1mm; padding-right:2mm; font-weight:bold">6</span>Gains from disposal of timber, coal, or domestic
			<span style="padding-left:4.5mm;">iron ore with a retained economic interest (attach </span>
							<span style="float:left;padding-left:4.5mm;">supporting statement)
							<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposal"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:10mm; padding-top:5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposal/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:10mm; text-align:center; padding-top:5mm">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposal/RateOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:10mm; padding-top:5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposal/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:10mm; padding-top:5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromDisposal/AmountOfUSTaxPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:7mm; border-bottom-width:0px">
							<span style="padding-left:1mm; padding-right:2mm; font-weight:bold">7</span>Gains from sale or exchange of patents,
			<br/>
							<span style="float:left;padding-left:4.5mm;">copyrights, etc. 
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:7mm; padding-top:3.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromSaleOrExchange/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:7mm; text-align:center; padding-top:3.5mm">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromSaleOrExchange/RateOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:7mm; padding-top:3.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromSaleOrExchange/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:7mm; padding-top:3.5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GainsFromSaleOrExchange/AmountOfUSTaxPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:4.5mm;border-bottom-width:0px">
							<span style="padding-left:1mm; padding-right:2mm; font-weight:bold">8</span>
							<span style="font-size:6pt">Fiduciary distributions (attach supporting statement)</span>
							<span>
								<!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistributions"/>
								</xsl:call-template>
							</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm;  height:4.5mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistributions/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; text-align:center;  height:4.5mm;">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistributions/RateOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm; ">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistributions/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm;  height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/FiduciaryDistributions/AmountOfUSTaxPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:5mm;
						       border-bottom-width:0px">
							<span style="float:left;padding-left:1mm; padding-right:2mm; font-weight:bold">9</span>
							<span style="float:left;">
Gross transportation income  (attach Schedule V)
</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">..</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:5mm;">
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GrossTransporationIncome/GrossAmount"/>
							</xsl:call-template>
							<span style="width:2mm"/>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GrossTransporationIncome/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:5mm; text-align:center;font-size:7pt;font-weight:bold">4</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:5mm;padding-top:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/GrossTransporationIncome/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:5mm; background:lightgrey"/>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:7.5mm; border-bottom-width:0px">
							<span style="padding-left:0mm; padding-right:1mm; font-weight:bold">10</span>Other fixed or determinable annual or periodic
			<span style="float:left;padding-left:4.5mm;">gains, profits, and income
				 <!-- Form to Form Link -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:7.5mm; padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains/GrossAmount"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:7.5mm; text-align:center; padding-top:4mm">
							<xsl:call-template name="PopulatePercent">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains/RateOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:7.5mm; padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains/AmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:7.5mm; padding-top:4mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/OtherFixedGains/AmountOfUSTaxPaid"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:5mm; border-bottom-width:0px">
							<span style="width:4.5mm"/>
							<span class="sty1120FItemUnderlineSM" style="float:none">
								<span style="width:1px"/>
							</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:5mm;"/>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:5mm; text-align:center"/>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:5mm;"/>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:5mm;"/>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:65mm; height:5mm; border-bottom-width:0px">
							<span style="width:4.5mm"/>
							<span class="sty1120FItemUnderlineSM" style="float:none">
								<span style="width:1px"/>
							</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:31mm; height:5mm;"/>
						<div class="styIRS1120FDivTreatyDataLF" style="width:25mm; height:5mm; text-align:center"/>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:5mm;"/>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:5mm;"/>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:121mm; height:4.5mm; border-bottom-width:0px">
							<span style="padding-left:0mm; padding-right:1mm; font-weight:bold">11</span>Total. Enter here and on line 1, page 1
			<span class="styDotLn" style="float:none">.................<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
							</span>
						</div>
						<div class="styIRS1120FDivTreatyDataLF" style="width:32mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/TotalAmountOfTax"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm; background:lightgrey"/>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:0mm;">
						<div class="styIRS1120FDivTreatyDataTitle" style="width:153mm; height:4.5mm;">
							<span style="padding-left:0mm; padding-right:1mm; font-weight:bold">12</span>Total. Enter here and include on line 5i, page 1
			<span class="styDotLn" style="float:none">.......................<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="MediumBullet"/>
							</span>
						</div>
						<div class="styIRS1120FDivTreatyDataRG" style="width:33mm; height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/TotalAmtOfTaxPaidWithheldSrc"/>
							</xsl:call-template>
						</div>
					</div>
					<div style="width:187mm;clear:none; padding-bottom:.5mm; padding-top:.5mm">
						<div class="styIRS1120FDivTreatyDataRG" style="width:187mm; height:4.5mm; text-align:left;">
							<span style="padding-left:0mm; padding-right:1mm; font-weight:bold">13</span>
							<span style="font-size:6pt">Is the corporation fiscally transparent under the laws of the foreign jurisdiction with respect to any item of income listed above?
		
			<span style="padding-left:15mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparent"/>
									</xsl:call-template>
									<!-- begin check box for Yes -->
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparent"/>
											<xsl:with-param name="BackupName">IRS1120FCorpFiscallyTransparent</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparent"/>
											<xsl:with-param name="BackupName">IRS1120FCorpFiscallyTransparent</xsl:with-param>
										</xsl:call-template>
										<span style="padding-left:2mm">
											<b>Yes</b>
										</span>
									</label>
								</span>
								<!-- end check box for Yes -->
								<!-- begin check box for No -->
								<span style="padding-left:10mm;">
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparent"/>
									</xsl:call-template>
									<input type="checkbox" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparent"/>
											<xsl:with-param name="BackupName">IRS1120FCorpFiscallyTransparent</xsl:with-param>
										</xsl:call-template>
									</input>
									<label>
										<xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparent"/>
											<xsl:with-param name="BackupName">IRS1120FCorpFiscallyTransparent</xsl:with-param>
										</xsl:call-template>
										<span style="padding-left:2mm">
											<b>No</b>
										</span>
									</label>
								</span>
								<br/>
								<span style="padding-left:4.5mm">
     			If &#8220;Yes,&#8221; attach a statement that provides the information requested above with respect to each such item of income.
				 <!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionI/CorpFiscallyTransparent"/>
									</xsl:call-template>
								</span>
							</span>
							<!-- end check box for No -->
						</div>
					</div>
					<!-- end name of treaty country table -->
					<!-- page break and footer-->
					<div style="width:187mm;padding-top:0.5mm;">
						<div style="float:left;">
							<span class="styBoldText"/>
							<span style="width:13mm;"/>
						</div>
						<div style="float:right;">
							<span style="width:40px;"/>  
			Form <span class="styBoldText" style="font-size:8pt;">1120-F</span> (2012)
		</div>
					</div>
					<div class="pageEnd"/>
					<!-- end page break and footer  -->
					<!-- begin page 3 -->
					<!-- page header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120-F (2012)<span style="width:148mm;"/>
						</div>
						<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">3</span>
						</div>
					</div>
					<!-- end page header -->
					<!-- begin section II description -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td style="float:left; font-size: 8pt; font-weight:bold; padding-top:1mm; padding-bottom:1mm">
			SECTION II&#8212;Income Effectively Connected With the Conduct of a Trade or Business in the United States<br/>
								<span style="font-size:7pt; font-weight:normal;padding-left:3mm">(see instructions)</span>
							</td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="float:left; font-size:7pt; font-weight:normal;clear:none">
								<b>Important:</b>
								<span style="padding-left:1mm">
									<i>Fill in all applicable lines and schedules. If you need more space, see 
			<b>Assembling the Return</b> in the instructions.</i>
								</span>
							</td>
						</tr>
					</table>
					<!-- end section I description -->
					<!--begin Income Section-->
					<div class="styBB" style="width:187mm;border-bottom-width:1px">
						<div class="styIRS1120FVTImageBox" style="height:50mm;padding-top:20mm;">
							<img src="{$ImagePath}/1120F_Income.gif" alt="VerticalIncome"/>
						</div>
						<div style="width:181mm;float:right;clear:none;">
							<!-- begin line 1a -->
							<div class="styLNLeftNumBox" style="height:4mm;">
								<span class="styBoldText" style="font-size:7pt;padding-left: 1.25mm">1a</span>
							</div>
							<div class="styLNDesc" style="width:133mm;">
								<div class="styLNDesc" style="width:26mm;height:4mm;">
									<span class="styArialText" style="">Gross receipts or sales</span>
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossReceiptsOrSales"/>
									</xsl:call-template>
								</div>
								<div class="styLNAmountBox" style="width:30mm;border-bottom-width:1px;border-right-width:1px;height:4mm;">
									<span style="text-align:right;font-family:arial;font-size:8pt;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossReceiptsOrSales"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNDesc" style="width:35mm;height:4mm;padding-left:2mm;">
									<span class="styBoldText" style="width:3mm;float:left;clear:none;">b</span>
									<span class="styArialText" style="float:left;clear:none;">Less returns and allowances</span>
								</div>
								<div class="styLNAmountBox" style="width:28mm;text-align:right;border-bottom-width:1px;border-right-width:1px;height:4mm;font-family:arial;font-size:8pt;">
									<span style="text-align:right;">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/ReturnsAndAllowances"/>
										</xsl:call-template>
									</span>
								</div>
								<div class="styLNDesc" style="width:14.0mm;height:4mm;padding-left:2mm;">
									<span style="float:left">
										<span class="styBoldText">c</span>
										<span style="width:1mm"/> Bal<span style="width:1mm"/>
									</span>
									<span style="float:right">
										<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="MidSizeBullet"/>
									</span>
								</div>
							</div>
							<div class="styLNRightNumBox" style="height:6mm;">1c</div>
							<div class="styLNAmountBox" style="height:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossReceiptsOrSalesBalance"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 1a -->
						<!-- begin line 2 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">2</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
							Cost of goods sold from Form 1125-A, line 8 (attach Form 1125-A)
	<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CostOfGoodsSold"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CostOfGoodsSold"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossProfit"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 3 -->
						<!-- begin line 4 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;padding-left: 2.25mm">4</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
Dividends (Schedule C, line 14)
</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">4</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/DividendsSchC"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/InterestIncome"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossRents"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/GrossRoyalties"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CapitalGainNetIncome"/>
										</xsl:call-template>
									</span>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CapitalGainNetIncome"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/NetGainLoss"/>
									</xsl:call-template>
									<span style="width:1mm;"/>
									<xsl:call-template name="LinkToLeftoverDataTableInline">
										<xsl:with-param name="Desc">Part II,Line 9 - Form 4684 Indicator</xsl:with-param>
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/NetGainLoss/@form4684Indicator"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">9</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/NetGainLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 9 -->
						<!-- begin line 10 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">10</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
Other income (see instructions&#8212;attach statement)
				<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OtherIncome"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">10</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OtherIncome"/>
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
								<span style="float:right;">
									<span class="styDotLn" style="float:none">...................</span>
									<span style="width:3mm"/>
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="MidSizeBullet"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm; border-bottom-width:0px">11</div>
							<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalIncome"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 11 -->
					</div>
					<!-- end Income Section-->
					<!-- begin Deduction Section-->
					<div class="styBB" style="width:187mm;border-bottom-width:1px">
						<div class="styIRS1120FVTImageBox" style="height:98mm;padding-top:16mm;">
							<img src="{$ImagePath}/1120F_Deductions.gif" alt="VertDeductions"/>
						</div>
						<!-- begin line 12 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">12</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
Compensation of officers from Form 1125-E, line 4 (attach Form 1125-E)
											<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CompensationOfOfficers"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CompensationOfOfficers"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/SalariesAndWages"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/RepairsAndMaintenance"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/BadDebts"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">15</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/BadDebts"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/Rents"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TaxesAndLicenses"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/InterestDeductions"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">18</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/InterestDeductions"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CharitableContributions"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">19</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/CharitableContributions"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 19 -->
						<!-- begin line 20 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:8mm;">20</div>
							<div class="styLNDesc" style="width:133mm;height:8mm;">

Depreciation from Form 4562 not claimed on Form 1125-A or elsewhere on return (attach
			<span style="float:left">
 Form 4562).
				<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/Depreciation"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">20</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/Depreciation"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/Depletion"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/Advertising"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/PensionProfitSharingPlans"/>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/EmployeeBenefitPrograms"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 24 -->
						<!-- begin line 25 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4mm;">25</div>
							<div class="styLNDesc" style="width:133mm;height:4mm;">
								<span style="float:left">
Domestic production activities deduction (attach Form 8903)
				<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/DomProdActivitiesDeductions"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">............</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">25</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/DomProdActivitiesDeductions"/>
								</xsl:call-template>
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
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/ExpensesAllocatedIncome"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OtherDeductions"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">27</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/OtherDeductions"/>
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
								<span class="styDotLn" style="float:right;padding-right:1mm;">.................<span style="width:3mm"/>
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="MidSizeBullet"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">28</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalDeductions"/>
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
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TaxableIncomeBeforeNOL"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">
									<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="MidSizeBullet"/>
								</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">29</div>
							<div class="styLNAmountBox" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TaxableIncomeBeforeNOL"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- end line 29-->
						<!-- begin line 30 -->
						<div style="width:181mm;float:right;clear:none;">
							<div class="styLNLeftNumBox" style="height:4.5mm;">30</div>
							<div class="styLNDesc" style="width:9mm;height:4.5mm;">
								<span class="styBoldText">Less:</span>
							</div>
							<!-- begin line 30a -->
							<div class="styLNDesc" style="width:84.60mm;height:4.5mm;">
								<span style="float:left">
									<span class="styBoldText">a</span>
						Net operating loss deduction (see instructions)
						<span style="width:2px;"/>
									<!-- Form to Form Link -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/NetOperatingLossDeduction"/>
									</xsl:call-template>
								</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">30a</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/NetOperatingLossDeduction"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="width:31.9mm;height:4.5mm;"/>
							<!-- end line 30a -->
							<!-- begin line 30b -->
							<div class="styLNLeftNumBox" style="height:4.5mm;"/>
							<div class="styLNDesc" style="width:9mm;height:4.5mm;"/>
							<div class="styLNDesc" style="width:84.60mm;height:4mm;">
								<span style="float:left">
									<span class="styBoldText">b</span>
						Special deductions (Schedule C, line 15)
</span>
								<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">30b</div>
							<div class="styLNAmountBox" style="height:4.5mm;width:31.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/SpecialDeductions"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
							<div class="styLNAmountBoxNBB" style="width:31.9mm;height:4.5mm;"/>
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
							<div class="styLNRightNumBoxNBB" style="height:4.5mm;">30c</div>
							<div class="styLNAmountBoxNBB" style="width:31.9mm;height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TotalNOLAndSpecialDeductions"/>
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
							<div class="styLNRightNumBoxNBB" style="height:4.5mm; border-bottom-width">31</div>
							<div class="styLNAmountBoxNBB" style="height:4.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/TaxableIncome"/>
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
			Form <span class="styBoldText" style="font-size:8pt;">1120-F</span> (2012)
		</div>
					</div>
					<div class="pageEnd"/>
					<!-- end page break and footer  -->
					<!-- begin page 4 -->
					<!-- page header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120-F (2012)<span style="width:148mm;"/>
						</div>
						<div style="float:right;padding-bottom:0.5mm">Page <span style="font-weight:bold;font-size:8pt;">4</span>
						</div>
					</div>
					<!-- end page header -->
					<!-- begin section II description -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td style="float:left; font-size: 8pt; font-weight:bold; padding-bottom:1mm">
			SECTION II&#8212;Income Effectively Connected With the Conduct of a Trade or Business in the United States<br/>
								<span style="font-weight:normal;padding-left:3mm">(continued)</span>
							</td>
						</tr>
					</table>
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:23mm;">Schedule C</div>
						<div class="styPartDesc" style="width:164mm;">Dividends and Special Deductions <span class="styNormalText">(see instructions)</span>
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
			<br/>received
		</th>
								<th class="styIRS1120FLNPercentBox" style="vertical-align:middle" scope="col">
									<b>(b) </b>%
		</th>
								<th class="sty1120FSchCLNRightAmountBoxHeader" scope="col">
									<b>(c) </b>Special deductions<br/>
									<b>(a) </b>x<b> (b)</b>
								</th>
							</tr>
						</thead>
						<tbody>
							<!-- begin Schedule C line 1 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:0">1</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div style="text-align-last:justify">
		  Dividends from less-than-20%-owned domestic corporations (other than
		</div>
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">..................</span>
									</div>
              debt-financed stock) 				
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DomesticOwndBelow20Dividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">70</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DomesticOwndBelow20SpecialDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Schedule C line 1 -->
							<!-- begin Schedule C line 2 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:0">2</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div style="text-align-last:justify">
		    Dividends from 20%-or-more-owned domestic corporations (other than
		  </div>
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn">..................</span>
									</div>
                debt-financed stock) 			
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DomesticOwnd20OrMoreDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">80</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DomesticOwnd20OrMoreSpecialDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Schedule C line 2 -->
							<!-- begin Schedule C line 3 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:1mm">3</td>
								<td class="sty1120FSchCLNDesc" style="font-size:6pt;padding-top:1mm" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn">..</span>
									</div>
		  Dividends on debt-financed stock of domestic and foreign corporations (section 246A)		
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DebtFinancedStockDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox" style="padding-top:0mm;padding-bottom: 0mm;font-size:6pt;">see instructions</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<div style="float:right;clear:none">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DebtFinancedStockSpecialDed"/>
										</xsl:call-template>
									</div>
									<div class="sty1120FTableLeftAlignedItem">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/DebtFinancedStockSpecialDed"/>
										</xsl:call-template>
									</div>
								</td>
							</tr>
							<!-- end Schedule C line 3 -->
							<!-- begin Schedule C line 4 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:0">4</td>
								<td class="sty1120FSchCLNDesc" style="font-size:6pt;padding-top:0.5mm" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn">....</span>
									</div>
		  Dividends on certain preferred stock of less-than-20%-owned public utilities
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PubUtilBelow20PrefStkDiv"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">42</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PubUtilBelow20PrefStkSpclDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Schedule C line 4 -->
							<!-- begin Schedule C line 5 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox" style="padding-top:0">5</td>
								<td class="sty1120FSchCLNDesc" style="font-size:6pt;padding-top:0.5mm" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">.....</span>
									</div>
		  Dividends on certain preferred stock of 20%-or-more-owned public utilities
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PubUtil20OrMorePrefStkDiv"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">48</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PubUtil20OrMorePrefStkSpclDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Schedule C line 5 -->
							<!-- begin Schedule C line 6 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox">6</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">.....</span>
									</div>
		Dividends from less-than-20%-owned foreign corporations
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/ForeignOwndBelow20Dividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">70</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/ForeignOwndBelow20SpecialDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Schedule C line 6 -->
							<!-- begin Schedule C line 7 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox">7</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">......</span>
									</div>
		  Dividends from 20%-or-more-owned foreign corporations
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/ForeignOwnd20OrMoreDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBox">80</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/ForeignOwnd20OrMoreSpecialDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Schedule C line 7 -->
							<!-- begin Schedule C line 8 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox">8</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">.....</span>
									</div>
									<b>Total. </b> Add lines 1 through 7. See instructions for limitation
		</td>
								<td class="sty1120FSchCLNAmountBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/TotalLimitedSpecialDeductions"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Schedule C line 8 -->
							<!-- begin Schedule C line 9 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBox">9</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">...</span>
									</div>
		Dividends from foreign corporations not included on lines 3, 6, or 7
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/OtherForeignDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBoxShaded">
									<span style="width:1px"/>
								</td>
							</tr>
							<!-- end Schedule C line 9 -->
							<!-- begin Schedule C line 10 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">10</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">............</span>
									</div>
		Foreign dividend gross-up (section 78)
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/ForeignDividendGrossUp"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBoxShaded">
									<span style="width:1px"/>
								</td>
							</tr>
							<!-- end Schedule C line 10 -->
							<!-- begin Schedule C line 11 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">11</td>
								<td class="sty1120FSchCLNDesc" style="font-size:6pt;padding-top:0.25mm" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">..</span>
									</div>
		IC-DISC and former DISC dividends not included on lines 1, 2, or 3 (section 246(d))
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/ICDISCFormerDISCDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBoxShaded">
									<span style="width:1px"/>
								</td>
							</tr>
							<!-- end Schedule C line 11 -->
							<!-- begin Schedule C line 12 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">12</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">..................</span>
									</div>
        		Other dividends
			  <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/OtherDividends"/>
									</xsl:call-template>
								</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/OtherDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBoxShaded">
									<span style="width:1px"/>
								</td>
							</tr>
							<!-- end Schedule C line 12 -->
							<!-- begin Schedule C line 13 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">13</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">.</span>
									</div>
		Deduction for dividends paid on certain preferred stock of public utilities
		</td>
								<td class="sty1120FSchCLNAmountBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/PublicUtilitiesPrefStkDivDed"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Schedule C line 13 -->
							<!-- begin Schedule C line 14 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">14</td>
								<td class="sty1120FSchCLNDesc" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">.</span>
									</div>
									<b>Total dividends. </b> Add lines 1 through 12. Enter here and on line 4, page 3
		</td>
								<td class="sty1120FSchCLNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/TotalDividends"/>
									</xsl:call-template>
								</td>
								<td class="styIRS1120FLNPercentBoxShaded" style="border-bottom-width:1px">
									<span style="width:1px"/>
								</td>
								<td class="sty1120FSchCLNRightAmountBoxShaded" style="border-bottom-width:1px">
									<span style="width:1px"/>
								</td>
							</tr>
							<!-- end Schedule C line 14 -->
							<!-- begin Schedule C line 15 -->
							<tr>
								<td class="sty1120FSchCLNLeftNumBoxDD">15</td>
								<td colspan="3" class="sty1120FSchCLNDesc" style="width:151mm;padding-right:3mm" scope="row">
									<div class="sty1120FRightFloat">
										<span class="sty1120FDotLn ">........</span>
										<span style="width:3mm"/>
										<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
									</div>
									<b>Total special deductions. </b> Add lines 8 and 13. Enter here and on line 30b, page 3
		</td>
								<td class="sty1120FSchCLNRightAmountBox" style="border-bottom-width:0px">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleC/TotalSpecialDeductions"/>
									</xsl:call-template>
								</td>
							</tr>
							<!-- end Schedule C line 15 -->
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
					<!-- begin Schedule J line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;padding-top:0.8mm">1</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1.5mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.</span>
								<span style="width:1.5mm"/>
								<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:1.5mm"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/MemberOfControlledGroup"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleJMemberOfControlledGroup</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/MemberOfControlledGroup"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJMemberOfControlledGroup</xsl:with-param>
								</xsl:call-template>
				Check if the corporation is a member of a controlled group (attach Schedule O (Form 1120))
			    </label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/MemberOfControlledGroup"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end Schedule J line 1 -->
					<!-- begin Schedule J line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:5mm;font-size:7pt;padding-top:1.3mm;padding-left:2.5mm">2</div>
						<div class="styLNDesc" style="height:5mm;width:138mm;padding-right:1.5mm;padding-top:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn" style="float:none">....</span>
								<span style="width:1.5mm"/>
								<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:1.5mm"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/QualifiedPersonalServiceCorp"/>
										<xsl:with-param name="BackupName">IRS1120ScheduleJQualifiedPersonalServiceCorp</xsl:with-param>
									</xsl:call-template>
								</input>
							</div>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/QualifiedPersonalServiceCorp"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJQualifiedPersonalServiceCorp</xsl:with-param>
								</xsl:call-template>
								Income tax. Check if a qualified personal service corporation (see instructions)
                          </label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTax"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Indicator</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTax/@section197Indicator"/>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Amount</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTax/@section197Amount"/>
							</xsl:call-template>
							<!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:5mm;padding-top:1mm">2</div>
						<div class="styLNAmountBox" style="height:5mm;padding-top:1mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Schedule J line 2 -->
					<!-- begins Schedule J line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">3</div>
						<div class="styLNDesc" style="height:4.5mm;padding-right:1.8mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">..................</span>
							</div>
			Alternative minimum tax (attach Form 4626)
				<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/AlternativeMinimumTax"/>
							</xsl:call-template>
							<!--Dotted Line-->
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/AlternativeMinimumTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Schedule J line 3 -->
					<!-- begin Schedule J line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">4</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<div class="sty1120FRightFloat">
								<span class="styDotLn">...........................</span>
							</div>
			Add lines 2 and 3	
	      		</div>
						<div class="styLNRightNumBox" style="height:4mm;">4</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTaxAndAlternativeMinTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Schedule J line 4 -->
					<!-- begin Schedule J line 5a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">5a</div>
						<div class="styLNDesc" style="width:98.1mm;height:4.5mm;padding-right:1.5mm">
							<div class="sty1120FRightFloat">
								<span class="styDotLn" style="float:none">..........</span>
							</div>
			Foreign tax credit (attach Form 1118)
				<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/ForeignTaxCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5a</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/ForeignTaxCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end Schedule J line 5a -->
					<!-- begin Schedule J line 5b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:3mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:98.1mm;height:4.5mm;padding-right:1.5mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">........</span>
							</div>
			General business credit. (attach Form 3800)         
			<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/GeneralBusinessCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5b</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/GeneralBusinessCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end Schedule J line 5b checkbox(es) -->
					<!-- begin Schedule J line 5c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:3mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:98.1mm;height:4.5mm;padding-right:1.5mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">......</span>
							</div>
			Credit for prior year minimum tax (attach Form 8827)         
			<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/PriorYearMinimumTaxCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5c</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/PriorYearMinimumTaxCredit"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end Schedule J line 5c -->
					<!-- begin Schedule J line 5d -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:3mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="width:98.1mm;height:4.5mm;padding-right:1.5mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.............</span>
							</div>
			Bond credits from Form 8912
			<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/BondCreditsFromForm8912"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">5d</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/BondCreditsFromForm8912"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- end Schedule J line 5d -->
					<!-- begin Schedule J line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style=";font-size:7pt;padding-left:2.5mm;padding-top:1.25mm">6</div>
						<div class="styLNDesc" style="width:138mm;padding-right:1.8mm;padding-top:1.25mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....................</span>
							</div>
							<b>Total credits. </b>Add lines 5a through 5d          		
		</div>
						<div class="styLNRightNumBox" style="padding-top:1.25mm">6</div>
						<div class="styLNAmountBox" style="padding-top:1.25mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalCredits"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Schedule J line 6 -->
					<!-- begin Schedule J line 7 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;font-size:7pt;padding-left:2.5mm;padding-top:1.25mm">7</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1.8mm;padding-top:1.25mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.........................</span>
							</div>
			Subtract line 6 from line 4          
		</div>
						<div class="styLNRightNumBox" style="height:5.25mm;padding-top:1.25mm;">7</div>
						<div class="styLNAmountBox" style="height:5.25mm;padding-top:1.25mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxLessTotalCredit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Schedule J line 7 -->
					<!-- begin Schedule J line 8  -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">8</div>
						<div class="styLNDesc" style="width:39.1mm">Other taxes. Check if from:</div>
						<div class="styLNDesc" style="width:99mm;height:4.5mm;">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm4255"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm4255</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm4255"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm4255</xsl:with-param>
								</xsl:call-template>
				  Form 4255
				</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm4255"/>
							</xsl:call-template>
							<span style="width:4mm"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8611"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8611</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8611"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8611</xsl:with-param>
								</xsl:call-template>
        				Form 8611
				</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8611"/>
							</xsl:call-template>
							<span style="width:4mm"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8697"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8697</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8697"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8697</xsl:with-param>
								</xsl:call-template>
        				Form 8697
				</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8697"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="height:4.5mm;"/>
						<div class="styLNAmountBoxNBB" style="height:4.5mm;"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;"/>
						<div class="styLNDesc" style="width:39.1mm"/>
						<div class="styLNDesc" style="width:99mm;height:4.5mm">
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8866"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8866</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8866"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8866</xsl:with-param>
								</xsl:call-template>
        				Form 8866
				</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8866"/>
							</xsl:call-template>
							<span style="width:4mm"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8902"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8902</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8902"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJTaxFromForm8902</xsl:with-param>
								</xsl:call-template>
        				Form 8902
				</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TaxFromForm8902"/>
							</xsl:call-template>
							<span style="width:4mm"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/OtherTaxes"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJOtherTaxes</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:1mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/OtherTaxes"/>
									<xsl:with-param name="BackupName">IRS1120ScheduleJOtherTaxes</xsl:with-param>
								</xsl:call-template>
        				Other (attach statement)
				</label>
							<!-- Form to Form Link -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/OtherTaxes"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">8</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalOtherTaxes"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Schedule J line 8 -->
					<!-- begin Schedule J line 9 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;font-size:7pt;padding-left:2.5mm;padding-top:1.25mm">9</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1.8mm;;padding-top:1.25mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">..............</span>
							</div>
							<b>Total tax.</b> Add lines 7 and 8. Enter here and on line 2, page 1		
		</div>
						<div class="styLNRightNumBox" style="height:5.25mm;padding-top:1.25mm; border-bottom-width:0px">9</div>
						<div class="styLNAmountBox" style="height:5.25mm; border-bottom-width:0x;padding-top:1.25mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/TotalTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end Schedule J line 9 -->
					<!-- page break and footer-->
					<div style="width:187mm;padding-top:0.5mm; border: 0 solid black; border-top-width:1px;">
						<div style="float:right;">
			Form <span class="styBoldText" style="font-size:8pt;">1120-F</span> (2012)
		</div>
					</div>
					<div class="pageEnd"/>
					<!-- end page break and footer  -->
					<!-- begin page 5 -->
					<!-- page header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120-F (2012)<span style="width:148mm;"/>
						</div>
						<div style="float:right;padding-bottom:0.5mm">Page <span style="font-weight:bold;font-size:8pt;">5</span>
						</div>
					</div>
					<!-- end page header -->
					<!-- begin section III description -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td style="float:left; font-size: 8pt; font-weight:bold;">
			SECTION III&#8212;Branch Profits Tax and Tax on Excess Interest
		</td>
						</tr>
					</table>
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="float:left; font-size:8pt; font-weight:normal;clear:none; padding-bottom:0mm; padding-top:0mm">
								<b>Part I&#8212;Branch Profits Tax </b>(see instructions)
		</td>
						</tr>
					</table>
					<!-- end section III description -->
					<!-- begin section III, line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">1</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">....................</span>
							</div> 
			  Enter the amount from Section II, line 29
			</div>
						<div class="styLNRightNumBox" style="height:4.5mm">1</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/AmountFromSectionII"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 1 -->
					<!-- begin section III, line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7.7mm;padding-left:2.5mm;">2</div>
						<div class="styLNDesc" style="height:7.7mm;width:138mm;padding-right:1mm">
							<div style="text-align:justify;text-align-last:justify">
			    Enter total adjustments to line 1 to get effectively connected earnings and profits. (Attach required
			  </div>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">........</span>
							</div>
                     statement showing the nature and amount of adjustments.) (See instructions.)
                      <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/ConnectedEarningsAndProfits"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:7.7mm;padding-top:4mm">2</div>
						<div class="styLNAmountBox" style="width:33mm;height:7.7mm;padding-top:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/ConnectedEarningsAndProfits"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 2 -->
					<!-- begin section III, line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">3</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">............</span>
							</div>
			Effectively connected earnings and profits. Combine line 1 and line 2
		</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/EffectivelyConnectedEarnProfit"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 3 -->
					<!-- begin section III, line 4a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">4a</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">......</span>
							</div>
		  Enter U.S. net equity at the end of the current tax year. (Attach required statement.)
	      	  <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityCurrentEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4a</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityCurrentEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4a -->
					<!-- begin section III, line 4b -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">b</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">......</span>
							</div>
			Enter U.S. net equity at the end of the prior tax year. (Attach required statement.)
			<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityPriorEOY"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4b</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/USNetEquityPriorEOY"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4b -->
					<!-- begin section III, line 4c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:7.7mm;padding-left:4mm;padding-top:1mm">c</div>
						<div class="styLNDesc" style="height:7.7mm;width:138mm;padding-right:1mm;padding-top:1mm">
							<div style="text-align:justify;text-align-last:justify">
		    Increase in U.S. net equity. If line 4a is greater than or equal to line 4b, subtract line 4b from line 4a.
		  </div>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....................</span>
							</div>
		  Enter the result here and skip to line 4e	
		</div>
						<div class="styLNRightNumBox" style="height:7.7mm;padding-top:4mm">4c</div>
						<div class="styLNAmountBox" style="width:33mm;height:7.7mm;padding-top:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/IncreaseInUSNetEquity"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4c -->
					<!-- begin section III, line 4d -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">d</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....</span>
							</div> 
		  Decrease in U.S. net equity. If line 4b is greater than line 4a, subtract line 4a from line 4b		
		</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">4d</div>
						<div class="styLNAmountBox" style="width:33mm;height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/DecreaseInUSNetEquity"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4d -->
					<!-- begin section III, line 4e -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:7.4mm;padding-left:4mm;padding-top:0.5mm">e</div>
						<div class="styLNDesc" style="height:7.4mm;width:138mm;padding-top:0.5mm;padding-right:1mm;text-align:justify;text-align-last:justify">
			Non-previously taxed accumulated effectively connected earnings and profits. Enter excess, if any, of effectively connected earnings and profits for preceding tax years beginning after 1986 over any
			</div>
						<div class="styLNRightNumBox" style="height:7.4mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:33mm;height:7.4mm; border-bottom-width:0px"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;"/>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">..................</span>
							</div>      
		  dividend equivalent amounts for those tax years
	      							
		</div>
						<div class="styLNRightNumBox">4e</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/NonPreviouslyTaxedAccumulated"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 4e -->
					<!-- begin section III, line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7.7mm;padding-left:2.5mm;padding-top:0.7mm">5</div>
						<div class="styLNDesc" style="height:7.7mm;width:138mm;padding-right:1mm;padding-top:0.7mm">
							<div style="text-align:justify;text-align-last:justify">
		    Dividend equivalent amount. Subtract line 4c from line 3. If zero or less, enter -0-. If no amount is
		  </div>
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">......</span>
							</div>
		  entered on line 4c, add the lesser of line 4d or line 4e to line 3 and enter the total here		
		</div>
						<div class="styLNRightNumBox" style="height:7.7mm;padding-top:4mm;">5</div>
						<div class="styLNAmountBox" style="width:33mm;height:7.7mm;padding-top:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/DividendEquivalent"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 5 -->
					<!-- begin section III, line 6 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7.4mm;padding-top:0.5mm;padding-left:2.5mm">6</div>
						<div class="styLNDesc" style="height:7.4mm;width:138mm;padding-top:0.5mm;padding-right:1mm;text-align:justify;text-align-last:justify">
							<b>Branch profits tax.</b> Multiply line 5 by 30% (or lower treaty rate if the corporation is a qualified resident or otherwise qualifies for treaty benefits).  (See instructions.)  Enter here and include on line 3, page 1.
			</div>
						<div class="styLNRightNumBox" style="height:7.4mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:33mm;height:7.4mm; border-bottom-width:0px"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm;"/>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">......................</span>
							</div>
							<b>Also complete item W on page 2</b>
						</div>
						<div class="styLNRightNumBox" style=" border-bottom-width:0px">6</div>
						<div class="styLNAmountBox" style="width:33mm;border-bottom-width:0px;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/BranchProfitsTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 6 -->
					<!-- begin section III, Part II title -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="float:left; font-size:8pt; font-weight:normal;clear:none; padding-bottom:0mm; padding-top:0mm">
								<b>Part II&#8212;Tax on Excess Interest </b>(see instructions for this Part and for Schedule I (Form 1120-F))
		</td>
						</tr>
					</table>
					<!-- end section III, Part II title -->
					<!-- begin section III, line 7a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm;">7a</div>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">....................</span>
							</div>
		  Enter the interest from Section II, line 18
		</div>
						<div class="styLNRightNumBox">7a</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/InterestFromSectionII"/>
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
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">.....</span>
							</div>
	         (i.e, if line 24d is negative, enter as a positive number; if line 24d is positive, enter as a negative number)
		</div>
						<div class="styLNRightNumBox" style="height:6.8mm;padding-top:3mm">7b</div>
						<div class="styLNAmountBox" style="height:6.8mm;width:33mm;padding-top:3mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/InterestApportionedEffectively"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 7b -->
					<!-- begin section III, line 7c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">............</span>
							</div>
		  Combine lines 7a and 7b (amount must equal Schedule I, line 23)		
		</div>
						<div class="styLNRightNumBox">7c</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/InterestTotal"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 7c -->
					<!-- begin section III, line 8 -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="padding-left:2.5mm;">8</div>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							<b>Branch Interest</b> (see instructions for definition): Enter the sum of Schedule I, line 9, column (c), and
                      Schedule I, line 22. If the interest paid by the foreign corporation&#8217;s U.S. trade or business was increased
                      because 80% or more of the foreign corporation&#8217;s assets are U.S. assets, check this
                      <br/>
							<span style="float:left;">box</span>
							<span style="float:right;">
								<span class="sty1120FDotLn">..............................</span>
								<span style="width:2.9mm"/>
								<img src="{$ImagePath}/1120F_Bullet_Sm.gif" alt="SmallBullet"/>
								<span style="width:2.7mm"/>
								<input type="checkbox" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/AssetsMore80USAssets"/>
										<xsl:with-param name="BackupName">IRS1120FSectionIIIAssetsMore80USAssets</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/AssetsMore80USAssets"/>
										<xsl:with-param name="BackupName">IRS1120FSectionIIIAssetsMore80USAssets</xsl:with-param>
									</xsl:call-template>
								</label>
							</span>
						</div>
						<div class="styLNRightNumBox" style="height:9.5mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="width:33mm;height:9.5mm; border-bottom-width:0px"/>
						<div class="styLNRightNumBox">8</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/BranchInterest"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 8 -->
					<!-- begin section III, line 9a -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm;">9a</div>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">...........</span>
							</div>   
		  Excess interest. Subtract line 8 from line 7c. If zero or less, enter -0-
		</div>
						<div class="styLNRightNumBox">9a</div>
						<div class="styLNAmountBox" style="width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/ExcessInterest"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/BankExcessInterest"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 9b -->
					<!-- begin section III, line 9c -->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox" style="height:4.5mm;padding-left:4mm;">c</div>
						<div class="styLNDesc" style="height:4.5mm;width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">........................</span>
							</div>      
                Subtract line 9b from line 9a
		</div>
						<div class="styLNRightNumBox" style="height:4.5mm">9c</div>
						<div class="styLNAmountBox" style="height:4.5mm;width:33mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TotalExcessInterest"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 9c -->
					<!-- begin section III, line 10 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:7.4mm">10</div>
						<div class="styLNDesc" style="height:7.4mm;width:138mm;text-align:justify;text-align-last:justify;padding-right:1mm">
							<b>Tax on excess interest. </b>Multiply line 9c by 30% or lower treaty rate (if the corporation is a qualified resident
or otherwise qualifies for treaty benefits). (See instructions.) Enter here and include on line 
			</div>
						<div class="styLNRightNumBox" style="height:7.4mm; background:lightgrey; border-bottom-width:0px"/>
						<div class="styLNAmountBox" style="height:7.4mm; border-bottom-width:0px"/>
					</div>
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm;"/>
						<div class="styLNDesc" style="width:138mm;padding-right:1mm">
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">..................</span>
							</div>    
			3, page 1. <b>Also complete item W on page 2</b>
						</div>
						<div class="styLNRightNumBox" style="border-bottom-width:0px">10</div>
						<div class="styLNAmountBox" style="border-bottom-width:0px">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxOnExcessInterest"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- end section III, line 10 -->
					<!-- begin section III, Part III title -->
					<table cellpadding="0" cellspacing="0" class="styIRS1120FSectionTitle">
						<tr>
							<td class="styBB" style="float:left; font-size:8pt; font-weight:normal;clear:none; padding-bottom:0mm; padding-top:0mm">
								<b>Part III&#8212;Additional Information</b>
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
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">......................</span>
							</div>   
		  A complete termination of all U.S. trades or businesses?
		  <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/CompleteTerminationOfUS"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.4mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/CompleteTerminationOfUS"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.4mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/CompleteTerminationOfUS"/>
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
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">...................</span>
							</div>      
		  The tax-free liquidation or reorganization of a foreign corporation?
		  <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxFreeLiquidation"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.5mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxFreeLiquidation"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.5mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxFreeLiquidation"/>
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
							<div class="sty1120FRightFloat">
								<span class="sty1120FDotLn">......................</span>
							</div>
		  The tax-free incorporation of a U.S. trade or business?
		  <xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxFreeIncorporation"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.5mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateYesBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxFreeIncorporation"/>
							</xsl:call-template>
						</div>
						<div class="styIRS1120FYesNoBox" style="height:4.5mm;padding-top:0.5mm">
							<xsl:call-template name="PopulateNoBoxText">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionIII/TaxFreeIncorporation"/>
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
			Form <span class="styBoldText" style="font-size:8pt;">1120-F</span> (2012)
		</div>
					</div>
					<div class="pageEnd"/>
					<!-- end page break and footer  -->
					<!-- begin page 6 -->
					<!-- page header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120-F (2012)<span style="width:148mm;"/>
						</div>
						<div style="float:right;padding-bottom:0.5mm">Page <span style="font-weight:bold;font-size:8pt">6</span>
						</div>
					</div>
					<!-- end page header -->
					<!--Begin Page 6 Note-->
					<div class="styBB" style="width:187mm">
						<div class="styPartDesc" style="width:187mm; font-weight:normal;padding-left:0">
							<b>Note: </b>
							<i>Check if completing on </i>
							<img src="{$ImagePath}/1120F_Bullet_Md.gif" alt="1120F Medium Bullet"/>
							<span style="width:8mm"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/USBasis"/>
									<xsl:with-param name="BackupName">IRS1120FScheduleLUSBasis</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/USBasis"/>
									<xsl:with-param name="BackupName">IRS1120FScheduleLUSBasis</xsl:with-param>
								</xsl:call-template>
								<span>U.S. basis or   </span>
							</label>
							<span style="width:2mm"/>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/WorldwideBasis"/>
									<xsl:with-param name="BackupName">IRS1120FScheduleLWorldwideBasis</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:2mm"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/WorldwideBasis"/>
									<xsl:with-param name="BackupName">IRS1120FScheduleLWorldwideBasis</xsl:with-param>
								</xsl:call-template>
                Worldwide basis.
              </label>
						</div>
					</div>
					<!--Begin Schedule L-->
					<!--Begin Schedule L Header-->
					<div class="styBB" style="width:187mm">
						<div class="styPartName" style="width:20mm">Schedule L</div>
						<div class="styPartDesc" style="width:166mm">Balance Sheets per Books</div>
					</div>
					<!--Begin Schedule L Table-->
					<!--Table Header-->
					<div style="width:187mm">
						<table class="styTBB" cellpadding="0" cellspacing="0" style="width:187mm">
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/Cash/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/Cash/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TradeNotesAcctReceivable/BalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TradeNotesAcctReceivable/BalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BadDebtAllowance/BalanceSheetPerBooksBOY"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BadDebtAllowance/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BadDebtAllowance/BalanceSheetPerBooksEOY"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BadDebtAllowance/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/Inventories/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/Inventories/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/USGovernmentObligations/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/USGovernmentObligations/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TaxExemptSecurities/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TaxExemptSecurities/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchCurrentAssets/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchCurrentAssets/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentNonUSAssets/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentNonUSAssets/TotalBalanceSheetPerBooksEOY"/>
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
										<span class="styDotLn" style="float:right;padding-right:1mm">....</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentUSAssets/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentUSAssets/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LoansToShareholders/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LoansToShareholders/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/MortgageRealEstateLoans/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/MortgageRealEstateLoans/TotalBalanceSheetPerBooksEOY"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 9a-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-bottom:3mm">9a</td>
									<td class="sty1120FTableCellDesc" scope="row">
									Other loans and investments&#8212;non-U.S.
									<span style="float:left;"> assets*
                  <span style="width:0.5mm;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsNonUS"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">..........</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none;padding-top:2.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsNonUS/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none;padding-top:2.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsNonUS/TotalBalanceSheetPerBooksEOY"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 9b-->
								<tr>
									<td class="sty1120FTableCellNum" style="padding-bottom:3mm;padding-left:4mm">b</td>
									<td class="sty1120FTableCellDesc" scope="row">
									        Other loans and investments&#8212;U.S.
									        <span style="float:left;">assets*
                  <span style="width:0.5mm;"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsUS"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">..........</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none;padding-top:2.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsUS/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none;padding-top:2.5mm">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInvestmentsUS/TotalBalanceSheetPerBooksEOY"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 10a-->
								<tr>
									<td class="sty1120FTableCellNumDD">10a</td>
									<td class="sty1120FTableCellDesc" scope="row">
                  Buildings and other depreciable
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
								</tr>
								<tr>
									<td class="sty1120FTableCellNum">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">assets</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">............</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BldgOtherDepreciableAssets/BalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/BldgOtherDepreciableAssets/BalanceSheetPerBooksEOY"/>
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
										<span class="styDotLn" style="float:right;padding-right:1mm">....</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepreciation/BalanceSheetPerBooksBOY"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepreciation/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepreciation/BalanceSheetPerBooksEOY"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepreciation/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/DepletableAssets/BalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/DepletableAssets/BalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepletion/BalanceSheetPerBooksBOY"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepletion/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepletion/BalanceSheetPerBooksEOY"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedDepletion/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/Land/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/Land/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/IntangibleAssets/BalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/IntangibleAssets/BalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedAmortization/BalanceSheetPerBooksBOY"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedAmortization/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedAmortization/BalanceSheetPerBooksEOY"/>
											</xsl:call-template>
											<span style="font-size:7pt"> )</span>
										</div>
										<div class="sty1120FTableLeftAlignedItem">(</div>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccumulatedAmortization/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/HeldInTrustAssets/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/HeldInTrustAssets/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentInterbranchAst/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentInterbranchAst/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentAssetsNonUS"/>
											</xsl:call-template>
										</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentAssetsNonUS/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentAssetsNonUS/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentAssetsUS"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentAssetsUS/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherNonCurrentAssetsUS/TotalBalanceSheetPerBooksEOY"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 17-->
								<tr>
									<td class="sty1120FTableCellNumDDTBB">17</td>
									<td class="sty1120FTableCellDesc" style="border-bottom-width:2px;" scope="row">
										<span style="float:left;">Total assets</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">..........</span>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:2px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TotalAssets/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:2px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol" style="border-bottom-width:2px">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TotalAssets/TotalBalanceSheetPerBooksEOY"/>
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
										<span class="styDotLn" style="float:right;padding-right:1mm">........</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccountsPayable/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AccountsPayable/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ShortTermPayableInterbranch"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ShortTermPayableInterbranch/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ShortTermPayableInterbranch/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ShortTermPayableThirdParty"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ShortTermPayableThirdParty/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ShortTermPayableThirdParty/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentLiabilities/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherCurrentLiabilities/TotalBalanceSheetPerBooksEOY"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 21-->
								<tr>
									<td class="sty1120FTableCellNumDD">21</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Loans from shareholders</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LoansFromShareholders/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LoansFromShareholders/TotalBalanceSheetPerBooksEOY"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 22-->
								<tr>
									<td class="sty1120FTableCellNumDD" style="padding-bottom:3mm">22</td>
									<td class="sty1120FTableCellDesc" scope="row">
                  Mortgages, notes, bonds payable in 1 year or more:
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
										<span class="styDotLn" style="float:right;padding-right:1mm">......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchLiabilities/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/InterbranchLiabilities/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ThirdPartyLiabilities/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/ThirdPartyLiabilities/TotalBalanceSheetPerBooksEOY"/>
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
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LiabilitiesHeldInTrust/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/LiabilitiesHeldInTrust/TotalBalanceSheetPerBooksEOY"/>
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
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInterbranchLiabilities/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherInterbranchLiabilities/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherLiabilities"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherLiabilities/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:2px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol" style="border-bottom-width:2px">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/OtherLiabilities/TotalBalanceSheetPerBooksEOY"/>
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
										<span class="styDotLn" style="float:right;padding-right:1mm">...</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalPreferredStock/BalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded" style="border-bottom-width:1px">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalPreferredStock/BalanceSheetPerBooksEOY"/>
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
											<span style="width:21.8mm"/>
											<b>b </b>Common stock</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">...</span>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalCommonStock/BalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalCommonStock/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalCommonStock/BalanceSheetPerBooksEOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CapitalCommonStock/TotalBalanceSheetPerBooksEOY"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 26-->
								<tr>
									<td class="sty1120FTableCellNumDD">26</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Additional paid-in capital</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">......</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdditionalPaidInCapital/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdditionalPaidInCapital/TotalBalanceSheetPerBooksEOY"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 27-->
								<tr>
									<td class="sty1120FTableCellNumDD">27</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Retained earnings&#8212;Appropriated*
                  <span style="width:0.5mm"/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsAppr"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsAppr/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsAppr/TotalBalanceSheetPerBooksEOY"/>
											</xsl:call-template>
										</div>
									</td>
								</tr>
								<!--Line 28-->
								<tr>
									<td class="sty1120FTableCellNumDD">28</td>
									<td class="sty1120FTableCellDesc" scope="row">
										<span style="float:left;">Retained earnings&#8212;Unappropriated</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">...</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsUnappr/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/RetainedEarningsUnappr/TotalBalanceSheetPerBooksEOY"/>
										</xsl:call-template>
									</td>
								</tr>
								<!--Line 29-->
								<tr>
									<td class="sty1120FTableCellNumDD">29</td>
									<td class="sty1120FTableCellDesc" scope="row">
                  Adjustments to shareholders&#8217; equity*
                  <span style="width:0.5mm"/>
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdjToShareholdersEquity"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdjToShareholdersEquity/TotalBalanceSheetPerBooksBOY"/>
											</xsl:call-template>
										</div>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol">
										<div style="float:right;clear:none">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/AdjToShareholdersEquity/TotalBalanceSheetPerBooksEOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CostOfTreasuryStockBOY/TotalBalanceSheetPerBooksBOY"/>
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
												<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/CostOfTreasuryStockBOY/TotalBalanceSheetPerBooksEOY"/>
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
										<span style="float:left;">Total liabilities and shareholders&#8217; equity</span>
										<span class="styDotLn" style="float:right;padding-right:1mm">.</span>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmount" style="border-bottom-width:0">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TotalLiabilitiesEquity/TotalBalanceSheetPerBooksBOY"/>
										</xsl:call-template>
									</td>
									<td class="sty1120FTableCellAmountShaded">
										<span style="width:1px"/>
									</td>
									<td class="sty1120FTableCellAmountLastCol" style="border-bottom-width:0">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleL/TotalLiabilitiesEquity/TotalBalanceSheetPerBooksEOY"/>
										</xsl:call-template>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--End Schedule L Table-->
					<!--Begin Page 6 Footer-->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="float:right;" class="styGenericDiv">Form <span style="font-size:8pt;font-weight:bold">1120-F</span> (2012)</div>
						<div style="text-align:left;font-size:7pt;padding-top:1mm">*Attach statement&#8212;see instructions.</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Page 6 Footer-->
					<!--END Page 6-->
					<!-- Start Page 7 -->
					<!-- Begin Page Header -->
					<!-- end page break and footer  -->
					<!-- begin page 6 -->
					<!-- page header -->
					<div class="styBB" style="width:187mm;padding-top:.5mm;">
						<div style="float:left;">Form 1120-F (2012)<span style="width:148mm;"/>
						</div>
						<div style="float:right;padding-bottom:0.5mm">Page <span style="font-weight:bold;font-size:8pt">7</span>
						</div>
					</div>
					<!-- End Page Header -->
					<!--Begin Schedule W Header-->
					<div class="styBB" style="width:187mm">
						<div class="styPartName" style="width:20mm">Schedule W</div>
						<div class="styPartDesc" style="width:166mm">Overpayment Resulting From Tax Deducted and Withheld Under Chapter 3</div>
					</div>
					<!--Begin Schedule W Table-->
					<!-- Begin Line 1 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">1</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<div class="sty1120FRightFloat">
								<span class="styDotLn">............</span>
							</div>
							<b>Total Chapter 3 payments. </b> Enter the amount from page 1, line 5i
	      		</div>
						<div class="styLNRightNumBox" style="height:4mm;">1</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/Totalpayments"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 1 -->
					<!-- Begin Line 2 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2.5mm;">2</div>
						<div class="styLNDesc" style="width:98.1mm;height:4.5mm;padding-right:1.5mm">
							<div class="sty1120FRightFloat">
								<span class="styDotLn" style="float:none">...........</span>
							</div>
							Enter the tax amount from page 1, line 1
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">2</div>
						<div class="styLNAmountBox" style="height:4.5mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/TaxAmountLine1"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;height:4.5mm;border-bottom-width:0px;"/>
						<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px;"/>
					</div>
					<!-- End Line 2 -->
					<!-- Begin Line 3 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:11mm;padding-left:2.5mm;">3</div>
						<div class="styLNDesc" style="width:98.1mm;height:11mm;padding-right:1.5mm">
							Enter the portion of the tax amount shown on page 1, line 2 pertaining to income
							associated with amounts deducted and withheld under sections
							<span style="float:left;">
							  1445 and 1446 (see instructions for general guidelines). 
							<span style="width:1mm;"/>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/Section1445And1446Tax"/>
								</xsl:call-template>
							</span>
							<span class="styDotLn" style="float:right;">....</span>
						</div>
						<div class="styLNRightNumBox" style="height:11mm;padding-top:7mm;">3</div>
						<div class="styLNAmountBox" style="padding-right:1mm;height:11mm;padding-top:7mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/Section1445And1446Tax"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBox" style="background-color:lightgrey;border-bottom-width:0px;height:11mm;"/>
						<div class="styLNAmountBox" style="border-bottom-width:0px;height:11mm;"/>
					</div>
					<!-- End Line 3 -->
					<!-- Begin Line 4 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">4</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<div class="sty1120FRightFloat">
								<span class="styDotLn">...................</span>
							</div>
							<b>Total Chapter 3 tax. </b> Combine lines 2 and 3
	      		</div>
						<div class="styLNRightNumBox" style="height:4mm;">4</div>
						<div class="styLNAmountBox" style="height:4mm;padding-right:1mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/TotalCTWTax"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 4 -->
					<!-- Begin Line 5 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">5</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<b>Tentative overpayment resulting from tax deducted and withheld under Chapter 3. </b> Subtract line 4
<span style="float:left;">
from line 1
</span>
							<span class="styDotLn" style="float:right;">.............................</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5</div>
						<div class="styLNAmountBox" style="height:8mm;padding-right:1mm;padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/TentativeOverpaymentAMTCTW"/>
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
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/Overpayment8aAmount"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 6 -->
					<!-- Begin Line 7 -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4mm;padding-left:2.5mm;">7</div>
						<div class="styLNDesc" style="height:4mm;padding-right:1.8mm">
							<b>Overpayment resulting from tax deducted and withheld under Chapter 3. </b> Enter the smaller
<span style="float:left;">
 of line 5 or line 6. Enter the result here and on page 1, line 8b.
</span>
							<span class="styDotLn" style="float:right;">..............</span>
						</div>
						<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px;">7</div>
						<div class="styLNAmountBox" style="height:8mm;padding-right:1mm;padding-top:4mm;border-bottom-width:0px;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleW/OverpaymentFromCTW"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- End Line 7 -->
					<!-- Begin Page Footer -->
					<div style="width:187mm;clear:both;padding-top:0.5mm">
						<div style="float:right;" class="styGenericDiv">Form <span style="font-size:8pt;font-weight:bold">1120-F</span> (2012)</div>
					</div>
					<br/>
					<div class="pageEnd"/>
					<!-- End Page Footer -->
					<!-- End Page 7 -->
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
						<!--<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Return Software ID</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareId"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Return Software Version</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareVersion"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>-->
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F, Top Left Margin - Change of Acct PD</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@ChngOfAcctPDUndrSec1442BOrCInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F, Top Left Margin - section 3019.100-2 Election Indicator
							</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/@section30191002ElectionInd"/>
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
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPayments/@trustIndicator "/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120F Line 5(b), Estimated Tax Payments - Trust Payment Amount </xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/EstimatedTaxPayments/@trustPaymentAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Line 5(g), Credit From Form 4136 - Ozone Depleting Chemicals Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/CreditFromForm4136/@OzoneDepletingChemicalsInd"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Form 1120F Line 5(j), Total Payments -  Backup Withholding Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPayments/@BackupWithholdingIndicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Form 1120F Line 5(j), Total Payments -  Backup Withholding Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/TotalPayments/@BackupWithholdingAmount"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Line T - Parent Corporation Name Control</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/ParentCorporationNameControl"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Section II, Line 9 - Form 4684 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FSectionII/NetGainLoss/@form4684Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRow">
							<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Indicator</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTax/@section197Indicator"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
						<xsl:call-template name="PopulateLeftoverRowAmount">
							<xsl:with-param name="Desc">Schedule J Line 2 - Section 197 Amount</xsl:with-param>
							<xsl:with-param name="TargetNode" select="$FormData/IRS1120FScheduleJ/IncomeTax/@section197Amount"/>
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
							<xsl:for-each select="$FormData/SpecialConditionDescription">
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
