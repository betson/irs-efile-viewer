<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="IRS8838PStyle.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS8838P"/>
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
				<!-- No Browser Caching  -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="Form IRS 8838P"/>
				<meta name="GENERATOR" content="IBM WebSphere Studio"/>
				<xsl:call-template name="GlobalStylesForm"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8838PStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
			</head>
			<body class="styBodyClass" style="width:187mm">
				<form name="Form8838P">
					<xsl:call-template name="DocumentHeader"/>
					<!--Title of Form -->
					<div class="styBB" style="width:187mm;height:auto;">
						<div class="styFNBox" style="width:32mm;font-size: 7pt;height:18mm;">
							Form 
							<span class="styFormNumber">8838-P</span>
							<br/>
							<span class="styAgency">
								(December 2017)
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$FormData"/>
								</xsl:call-template>
							</span>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:118mm;height:14mm;">
							<div class="styMainTitle" style="height:4mm; font-size: 12pt">Consent To Extend the Time To Assess Tax</div>
							<div class="styMainTitle" style="height:4mm; font-size: 12pt">Pursuant to the Gain Deferral Method (Section 721(c))</div>
							<div class="styFST" style="height:5mm;margin-left:3mm;font-weight:bold;padding-top:3mm;">
								<img src="{$ImagePath}/8838_Bullet_Sm.gif" alt="SmallBullet"/> 
								Attach to your income tax return.
							</div>
							<div class="styFST" style="height:4mm;padding-top:1mm;">
								<img src="{$ImagePath}/8838_Bullet_Sm.gif" alt="bullet image"/>
									Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form8865">
									<i>www.irs.gov/Form8865</i>
								</a> for the latest information.
							</div>
						</div>
					<!--  1/8/2018 R10.1 MD1 : Customer  Flores Carl R <Carl.R.Flores@irs.gov>, Andrews Airon R <Airon.R.Andrews@irs.gov> send an email on 1/8/2018 would like to add OMB number into the form because they are unable to update this UWR in WRMS (not allowed systemically). -->
						<div class="styTYBox" style="width:37mm; height: 9mm;padding-top:2mm; font-size:7pt; border-bottom-width:1px">OMB No. 1545-1668</div>
						<div class="styTYBox" style="width:37mm; height:9mm;padding-top:2mm; font-size:7pt; padding-left:4mm;text-align:left;">Attachment<br/>
							Sequence No. <span style="font-weight:bold">146</span>
						</div>
					</div>
					<!--  End title of Form  -->
					<!--  Name and Employer identification number  -->
					<div class="styBB" style="width:187mm">
						<div class="styNameBox" style="width:125mm; height: 20mm;font-size: 7pt;">
							Name(s) of consenting taxpayer(s)<br/>
							<div style="font-size: 7pt;font-family:verdana;">
								<xsl:choose>
									<xsl:when test="normalize-space($FormData/BusinessConsentGrp/TaxpayerName/BusinessNameLine1Txt) != ''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/TaxpayerName/BusinessNameLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($FormData/BusinessConsentGrp/TaxpayerName/BusinessNameLine2Txt)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/TaxpayerName/BusinessNameLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<div class="styEINBox" style="width: 62mm; padding-left:2mm; height: 9mm; font-size: 7pt;font-weight:normal;">
							<b>Identifying number</b> (see instructions)
							<div style="text-align:left;font-size: 7pt; font-weight: normal;">
								<br/>
								<xsl:if test="$FormData/BusinessConsentGrp/EIN != ' ' ">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/EIN"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$FormData/BusinessConsentGrp/MissingEINReasonCd != ' ' ">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
						<div class="styEINBox" style="width: 62mm; padding-left:2mm; height: 9mm; border-color: black; border-style: solid; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; font-weight:normal;font-size: 7pt;">Social security number of spouse (only if a joint income tax return was filed)<br/>
							<span style="width:100%;text-align:left;padding-top:2mm">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param>
									<xsl:with-param name="EINChanged">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!--  End Name and Employer indentification number  -->
					<div class="styBB" style="width: 187mm; height: 10mm">Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
						<xsl:choose>
							<xsl:when test="$FormData/BusinessConsentGrp/USAddress/AddressLine1Txt!=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/USAddress/AddressLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($FormData/BusinessConsentGrp/USAddress/AddressLine2Txt)!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/USAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/ForeignAddress/AddressLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($FormData/BusinessConsentGrp/ForeignAddress/AddressLine2Txt)!=''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/ForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div class="styBB" style="width: 187mm; height: 10mm">City or town, state or province, country, and ZIP or foreign postal code<br/>
						<xsl:choose>
							<xsl:when test="$FormData/BusinessConsentGrp/USAddress/CityNm!=''">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/USAddress/CityNm"/>
								</xsl:call-template>
								<span class="styTableCellPad"/>
								<xsl:if test="$FormData/BusinessConsentGrp/USAddress/StateAbbreviationCd!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/USAddress/StateAbbreviationCd"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								</xsl:if>
								<xsl:if test="$FormData/BusinessConsentGrp/USAddress/ZIPCd!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/USAddress/ZIPCd"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<!-- Foreign Address -->
								<xsl:if test="$FormData/BusinessConsentGrp/ForeignAddress/CityNm!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/ForeignAddress/CityNm"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								</xsl:if>
								<xsl:if test="$FormData/BusinessConsentGrp/ForeignAddress/ProvinceOrStateNm!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								</xsl:if>
								<xsl:if test="$FormData/BusinessConsentGrp/ForeignAddress/ForeignPostalCd!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								</xsl:if>
								<xsl:if test="$FormData/BusinessConsentGrp/ForeignAddress/CountryCd!=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/BusinessConsentGrp/ForeignAddress/CountryCd"/>
									</xsl:call-template>
									<span class="styTableCellPad"/>
								</xsl:if>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<div style="width: 187mm;font-size:7pt;">The taxpayer(s) listed above and the Commissioner of the IRS, according to the regulations under section 721(c), agree to the following.</div>
					<!--  Line 1a -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">1a</div>
						<span class="styLNDesc" style="width: 177mm;font-size:7pt;">
							For gain deferral contributions, the amount of any federal income tax due on the gain realized, but not recognized, upon the contribution  
						</span>
					</div>
					<div style="width: 187mm">
						<span class="styLNDesc" style="padding-left: 8mm; width: 177mm;font-size:7pt;height:auto;">
							described on line 5, below, on any income tax return made by or for the above taxpayer(s) for the tax year ended <br/>
							<xsl:choose>
								<xsl:when test="$FormData/GainDeferralContributionGrp/FederalIncmTxDueGainRlzdGrp/TaxYearEndDt != ''">
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueGainRlzdGrp/TaxYearEndDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueGainRlzdGrp/TaxYearEndDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueGainRlzdGrp/TaxYearEndDt"/>
										</xsl:call-template>
									</span> may be assessed at any time on or before
								</xsl:when>
								<xsl:otherwise>
									__________ , _________ , _________  may be assessed at any time on or before 
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$FormData/GainDeferralContributionGrp/FederalIncmTxDueGainRlzdGrp/ExpirationDt != ''">
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueGainRlzdGrp/ExpirationDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueGainRlzdGrp/ExpirationDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueGainRlzdGrp/ExpirationDt"/>
										</xsl:call-template>
									</span> 
								</xsl:when>
								<xsl:otherwise>
									__________, _________, _________
								</xsl:otherwise>
							</xsl:choose>
							<div style="width: 187mm">
								<span style="width: 4mm"/>month<span style="width: 11mm"/>day<span style="width:13mm"/>year<span style="width: 62mm"/>month<span style="width: 12mm"/>day<span style="width: 12mm"/>year</div>
								</span>
							</div>
							<div style="width: 187mm">
								<span class="styLNDesc" style="padding-left: 8mm; width: 177mm;font-size:7pt;height:auto;">
				(see instructions); and The amount of any federal income tax due as a result of the allocation of book and tax items with respect to the section 721(c) property described on line 5, below, on any income tax return made by or for the above taxpayer(s) for the tax year ended 
							<xsl:choose>
								<xsl:when test="$FormData/GainDeferralContributionGrp/FederalIncmTxDueAllocnBookGrp/TaxYearEndDt != ''">
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueAllocnBookGrp/TaxYearEndDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueAllocnBookGrp/TaxYearEndDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueAllocnBookGrp/TaxYearEndDt"/>
										</xsl:call-template>
									</span> may be assessed at any time on or before
								</xsl:when>
								<xsl:otherwise>
									__________, _________, _________ may be assessed at any time on or before
								</xsl:otherwise>
								</xsl:choose>
							<xsl:choose>
								<xsl:when test="$FormData/GainDeferralContributionGrp/FederalIncmTxDueAllocnBookGrp/ExpirationDt != ''">
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueAllocnBookGrp/ExpirationDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueAllocnBookGrp/ExpirationDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/GainDeferralContributionGrp/FederalIncmTxDueAllocnBookGrp/ExpirationDt"/>
										</xsl:call-template>
									</span> 
								</xsl:when>
								<xsl:otherwise>
									__________, _________, _________
								</xsl:otherwise>
							</xsl:choose>
							<div style="width: 187mm">
								<span style="width: 12mm"/>month<span style="width: 11mm"/>day<span style="width:13mm"/>year<span style="width: 62mm"/>month<span style="width: 12mm"/>day<span style="width: 12mm"/>year</div>
								</span>
							</div>
					<div style="width: 187mm">
						<span class="styLNDesc" style="padding-left: 8mm; width: 177mm;font-size:7pt;height:auto;">
						 (see instructions).
						</span>
					</div>
					<!--  Line 1a -->
					<!--  Line b -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<span class="styLNDesc" style="width: 177mm;font-size:7pt;height:auto;">
For contributions not subject to the gain deferral method, the amount of any federal income tax due on the gain recognized upon the contribution described on line 5, below, on any income tax return made by or for the above taxpayer(s) for the tax year ended<br/>
							<xsl:choose>
								<xsl:when test="$FormData/ContriNotSubjGainDeferralGrp/TaxYearEndDt != ''">
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$FormData/ContriNotSubjGainDeferralGrp/TaxYearEndDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$FormData/ContriNotSubjGainDeferralGrp/TaxYearEndDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/ContriNotSubjGainDeferralGrp/TaxYearEndDt"/>
										</xsl:call-template>
									</span> may be assessed at any time on or before
								</xsl:when>
								<xsl:otherwise>
									__________ , _________ , _________  may be assessed at any time on or before 
								</xsl:otherwise>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="$FormData/ContriNotSubjGainDeferralGrp/ExpirationDt != ''">
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateMonth">
											<xsl:with-param name="TargetNode" select="$FormData/ContriNotSubjGainDeferralGrp/ExpirationDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateDay">
											<xsl:with-param name="TargetNode" select="$FormData/ContriNotSubjGainDeferralGrp/ExpirationDt"/>
										</xsl:call-template>
									</span> ,
									<span style="text-align: center; width:15mm; border-style:solid; border-color:black; border-left-width:0px; border-right-width:0px; border-top-width:0px; border-bottom-width:1px">
										<xsl:call-template name="PopulateYear">
											<xsl:with-param name="TargetNode" select="$FormData/ContriNotSubjGainDeferralGrp/ExpirationDt"/>
										</xsl:call-template>
									</span> 
								</xsl:when>
								<xsl:otherwise>
								___________,  __________,  __________
							</xsl:otherwise>
							</xsl:choose>
							<div style="width: 187mm">
								<span style="width: 4mm"/>month<span style="width: 12mm"/>day<span style="width: 12mm"/>year<span style="width: 64mm"/>month<span style="width: 12mm"/>day<span style="width: 12mm"/>year
							</div>
						</span>
					</div>
					<div style="width: 187mm">
						<span class="styLNDesc" style="padding-left: 8mm; width: 177mm;font-size:7pt;height:auto;">
						 (see instructions).
						</span>
					</div>
					<!--  Line 1b -->
					<!--  Line 2 -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">2</div>
						<span class="styLNDesc" style="width: 177mm;font-size:7pt;height:auto;">
      This consent establishes an extended period for assessing tax. The expiration of the extended period may be suspended or otherwise affected by the operation of law in the same manner as the original period. For example, if a notice of deficiency in tax covered by this consent is issued, the period for assessing tax won't end prior to the end of the suspension period provided for by section 6503(a), plus any time that remains in the assessment period, as extended, at the time the suspension takes effect. Under no circumstances will this consent reduce the period of time otherwise provided by law for making an assessment.
					</span>
					</div>
					<!--  Line 2  -->
					<!--  Line 3  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">3</div>
						<span class="styLNDesc" style="width: 177mm;font-size:7pt;height:auto;">
							The consenting taxpayer(s) may file a claim for credit or refund for the tax assessed by reason of this consent within 6 months after the period ends for assessing tax established by this consent.
						</span>
					</div>
					<!--  Line 3  -->
					<!--  Line 4  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">4</div>
						<span class="styLNDesc" style="width: 177mm;height:auto;">
      The amount of any deficiency assessment covered by this consent will be limited to the amount of any federal income tax due on the gain realized, whether or not recognized, on the contribution described on line 5 (and as applicable, the federal income tax due as a result of the allocation of book and tax items with respect to the section 721(c) property) including any penalties, additions to tax, and interest attributable to it and consequential changes to other items based on that adjustment.
					</span>
					</div>
					<!--  Line 4  -->
					<!--  Line 5  -->
					<div style="width: 187mm">
						<div class="styLNLeftNumBox" style="padding-left: 2mm">5</div>
						<span class="styLNDesc" style="width: 177mm;height:auto;">
							Complete the following information (see instructions).
						</span>
					</div>
					<!--  Line 5  -->
					<!--  Line 5a  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">a</div>
						<div style="float: left; padding-top: .5mm">
							Date of contribution  
						</div>
						<div class="styBB" style="float: right; clear: none; border-style: solid; width: 152mm; border-bottom-width: 1px">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$FormData/ContributionDt"/>
							</xsl:call-template>
						</div>
					</div>
					<!--  Line 5a  -->
					<!--  Line 5b  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">b</div>
						<div style="float: left; padding-top: .5mm">
							Description of the section 721(c) property 
						</div>
						<xsl:choose>
							<xsl:when test="$FormData/PropertyDesc != ''">
								<div class="styBB" style="float: right; clear: none; width: 124mm; padding-top: .5mm; border-style: solid; border-bottom-width: 1px">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/PropertyDesc"/>
									</xsl:call-template>
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="styBB" style="float: right; clear: none; border-style: solid; width: 125mm; border-bottom-width: 1px;height:12px"/>
								<br/>
								<div class="styBB" style="float: right; border-style: solid; width: 178mm; border-bottom-width: 1px;height:12px"/>
							</xsl:otherwise>
						</xsl:choose>
					</div>
					<!--  Line 5b  -->
					<br/>
					<!--  Line 5c  -->
					<div style="width: 187mm">
						<div class="styLNLeftLtrBox">c</div>
						<div style="float: left; padding-top: .5mm">
							Name of section 721(c) partnership (as defined in Temporary Regulations section 1.721(c)-1T(b)(14)) and identifying number, if any
						</div>
					</div>
					<div style="width: 187mm">
						<div class="styBB" style="float: left; clear: none;border-style: solid; border-bottom-width: 0px;width: 178mm;padding-left:8mm;">
							<xsl:if test="$FormData/TransfereeName/BusinessNameLine1Txt != ''">	
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TransfereeName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<span style="width: 1mm"/>
							</xsl:if>
							<xsl:if test="$FormData/TransfereeName/BusinessNameLine2Txt != ''">	
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/TransfereeName/BusinessNameLine2Txt"/>
								</xsl:call-template>
								<span style="width: 1mm"/>
							</xsl:if>
							<xsl:if test="$FormData/TransfereeEIN">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="$FormData/TransfereeEIN"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$FormData/MissingEINReasonCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$FormData/MissingEINReasonCd"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--  Line 5c  -->
					<!-- Signature of consenting taxpayer  -->
					<div class="styBB" style="width: 187mm"/>
					<div style="width: 187mm">
Under penalties of perjury, I declare that I have examined this consent, including accompanying statements and schedules, and to the best of my knowledge and belief, it’s true, correct, and complete. A signed consent, properly completed in accordance with this form and its instructions, is deemed to have been executed by the Commissioner of the IRS.
				</div>
					<br/>
					<div style="width: 187mm;height: 10.5mm">
						<div style="width: 103mm; float: left; clear none">
							<div style="width: 4mm; float: left; clear: none">
								<img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
							<div class="styBB" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid"/>
							<div style="float: left; clear: none; width:95mm; height:4mm; text-align:left">Signature of consenting taxpayer (see instructions)</div>
						</div>
						<div style="width:83mm; float: right; clear none">
							<div style="width: 4mm; float: left; clear: none">
								<img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
							<div class="styBB" style="float: right; clear: none; width:79mm;height:4mm; border-style:solid">
								<span style="width:4px"/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="float: right; clear: none; width:79mm;height:4mm;padding-left:.5mm; text-align:left">Date</div>
						</div>
					</div>
					<!--Signature of consenting taxpayer-->
					<!-- Signature of spouse (complete only if a joint return is filed)  -->
					<div style="width: 187mm;height: 10.5mm">
						<div style="width: 103mm; float: left; clear none">
							<div style="width: 4mm; float: left; clear: none">
								<img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
							<div class="styBB" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid"/>
							<div style="float: left; clear: none; width:95mm; height:4mm; padding-left:.5mm;text-align:left">Signature of spouse (complete only if a joint return is filed)</div>
						</div>
						<div style="width:83mm; float: right; clear none">
							<div style="width: 4mm; float: left; clear: none">
								<img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
							<div class="styBB" style="float: right; clear: none; width:79mm;height:4mm; border-style:solid">
								<span style="width:4px"/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="float: right; clear: none; width:79mm;height:4mm;padding-left:.5mm; text-align:left">Date</div>
						</div>
					</div>
					<!--Signature of spouse (complete only if a joint return is filed)-->
					<!-- Taxpayer’s representative sign here  -->
					<div style="width: 187mm;height: 10.5mm">
						<div style="width: 103mm; float: left; clear none">
							<div style="width: 4mm; float: left; clear: none">
								<img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
							<div class="styBB" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid"/>
							<div style="float: left; clear: none; width:95mm; height:4mm; padding-left:.5mm;text-align:left">Taxpayer’s representative sign here</div>
						</div>
						<div style="width:83mm; float: right; clear none">
							<div style="width: 4mm; float: left; clear: none">
								<img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
							<div class="styBB" style="float: right; clear: none; width:79mm;height:4mm; border-style:solid">
								<span style="width:4px"/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="float: right; clear: none; width:79mm;height:4mm;padding-left:.5mm;text-align:left">Date</div>
						</div>
					</div>
					<!--Taxpayer’s representative sign here -->
					<!-- Corporate officer(s) sign here  -->
					<div style="width: 187mm;height: 10.5mm">
						<div style="width: 103mm; float: left; clear none">
							<div style="width: 4mm; float: left; clear: none">
								<img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
							<div class="styBB" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid"/>
							<div style="float: left; clear: none; width:95mm; height:4mm; padding-left:.5mm;font-size: 7pt; text-align:left">Corporate officer(s) sign here</div>
						</div>
						<div style="width:83mm; float: right; clear none">
							<div style="width: 4mm; float: left; clear: none">
								<img src="{$ImagePath}/8838_Bullet_Lg.gif" alt="LargeBullet"/>
							</div>
							<div class="styBB" style="float: right; clear: none; width:79mm;height:4mm; border-style:solid">
								<span style="width:4px"/>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
								</xsl:call-template>
							</div>
							<div style="float: right; clear: none; width:79mm;height:4mm;padding-left:.5mm;text-align:left">Date</div>
						</div>
					</div>
					<br/>
					<br/>
					<!--Corporate officer(s) sign here-->
					<!--  Pager Footer  -->
					<div class="styBB" style="border-top-width: 1px; border-bottom-width: 0px; width:187mm;">
						<span class="styBoldText" style="float:left;">For Paperwork Reduction Act Notice, see the instructions.</span>
						<span style="float:right;">
							Cat. No. 69698U 
							<span style="width:73px"/>  
							Form <span class="styBoldText" style="font-size: 8pt">8838-P</span> (12-2017)
						</span>
					</div>
					<br/>
					<br/>
					<div class="pageEnd"/>
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
							<xsl:with-param name="TargetNode" select="$FormData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
