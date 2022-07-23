<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
	<!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5472Style.xsl"/>
	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="Form5472Data" select="$RtnDoc/IRS5472"/>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form5472Data)"/>
					</xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<meta name="Description" content="Form 5472"/>
				<meta name="GENERATOR" content="M WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<script> function expandParentCtn(containerId) { var container = document.getElementById(containerId); container.style.overflowY = "visible"; } </script>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS5472Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<form style="font-family:arial; font-size:8pt" name="Form5472">
					<xsl:call-template name="DocumentHeader"/>
					<div class="styTBB" style="width:187mm; clear:both">
						<div class="styFNBox" style="height:26mm; width:30mm; font-size:7pt;border-right-width:2px;">
							<div>								
								Form  
								<span class="styFormNumber">5472</span>
								<div style="height:12mm;">
									(Rev. December 2018)
									<br/>
									<!--General Dependency Push Pin -->
									<xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form5472Data"/>
									</xsl:call-template>
								</div>
								<div style="font-size:6pt;">
									Department of the Treasury
									<br/>
									Internal Revenue Service
								</div>
							</div>
						</div>
						<div class="styFTBox" style="width:126mm;">
							<div class="styMainTitle" style="font-size:11pt; line-height:110%;">
								Information Return of a 25% Foreign-Owned U.S. Corporation
								<br/>
								or a Foreign Corporation Engaged in a U.S. Trade or Business
								<br/>
								<font style="font-size:9pt;">(Under Sections 6038A and 6038C of the Internal Revenue Code)</font>
								<br/>
								<font style="font-size:8pt;">
									<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Bullet"/>
									<span style="padding-left:1mm;">
										Go to <a style="text-decoration:none;color:black;" href="http://www.irs.gov/form5472" title="Link to IRS.gov">
											<i>www.irs.gov/Form5472</i>
										</a> for instructions and the latest information.
									</span>
								</font>
							</div>
							<div style="font-size:6.5pt; padding-top:2mm;">
								For tax year of the reporting corporation beginning
								<span style="width:20mm;border-bottom:1px solid black;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
								</span>
								, and ending
								<span style="width:20mm; border-bottom:1px solid black;">
									<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
								</span>
								<br/>
								<font style="font-size:8.5pt;">
									<b>Note: </b>Enter all information in English and money items in U.S. dollars.
								</font>
							</div>
						</div>
						<div class="styTYBox" style="font-size:7pt; height:26mm; width:31mm; padding-top:3mm; border-left-width:2px;">
							<br/>
							<br/>
							<br/>
							OMB No. 1545-0123
						</div>
					</div>
					<!-- BEGIN Part I Title -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName" style="width:11mm; padding-top:.5mm;">Part I</div>
						<div class="styPartDesc" style="padding-top:.5mm;">
							Reporting Corporation
							<span class="styNormalText">(see instructions). All reporting corporations must complete Part I.</span>
						</div>
					</div>
					<!-- END Part I Title -->
					<!--Part I, Line 1a-->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:138mm; height:10mm; border-bottom:1 solid black;">
							<div class="styIRS5472TextTitle">1a</div>
							Name of reporting corporation <br/>
							<span style="padding-left:6mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($Form5472Data/ReportingCorporationInfo/CorporationName/BusinessNameLine2Txt) != ''">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/CorporationName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</span>
						</div>
						<!--Part I, Line 1b-->
						<div class="styFNBox" style="width:49mm; border-right:0px;">
							<div class="styIRS5472TextTitle">1b</div>
							<b>Employer identification number</b>
							<!--point one -->
							<xsl:choose>
								<xsl:when test="$Form5472Data/ReportingCorporationInfo/EIN">
									<div class="styIRS5472CenterTxt" style="vertical-align:bottom;text-align:left;padding-left:6mm;">
										<br/>
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/EIN"/>
										</xsl:call-template>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div class="styIRS5472CenterTxt" style="vertical-align:bottom; text-align:left; padding-left:6mm;">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/MissingEINReasonCd"/>
										</xsl:call-template>
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:138mm; height:20mm;">
							<div style="padding-left:6mm; height:10mm; border-bottom:1px solid black; width:138mm;">
								Number, street, and room or suite no. (if a P.O. box, see instructions)
								<br/>
								<div>
									<xsl:choose>
										<xsl:when test="$Form5472Data/ReportingCorporationInfo/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/USAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($Form5472Data/ReportingCorporationInfo/USAddress/AddressLine2Txt) != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/USAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($Form5472Data/ReportingCorporationInfo/ForeignAddress/AddressLine2Txt) != ''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ForeignAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
							<div style="padding-left:6mm; height:12mm;">
								City or town, state, and ZIP code (if a foreign address, see instructions)
								<br/>
								<div>
									<xsl:choose>
										<xsl:when test="$Form5472Data/ReportingCorporationInfo/USAddress">
											<br/>
											<xsl:attribute name="style">
												margin-left:0mm; 
											</xsl:attribute>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/USAddress/CityNm"/>
											</xsl:call-template>
											,
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/USAddress/StateAbbreviationCd"/>
											</xsl:call-template>  
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/USAddress/ZIPCd"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<!--xsl:attribute name="style"> line-height:100%; font-size:5pt </xsl:attribute -->
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ForeignAddress/CityNm"/>
											</xsl:call-template>
											<xsl:if test="(normalize-space($Form5472Data/ReportingCorporationInfo/ForeignAddress/CityNm) != '') and 
											(normalize-space($Form5472Data/ReportingCorporationInfo/ForeignAddress/ProvinceOrStateNm) != '' or 
											normalize-space($Form5472Data/ReportingCorporationInfo/ForeignAddress/ForeignPostalCd) != '')">
												,
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ForeignAddress/ProvinceOrStateNm"/>
											</xsl:call-template>  
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ForeignAddress/ForeignPostalCd"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($Form5472Data/ReportingCorporationInfo/ForeignAddress/CityNm) != '' or 	
											normalize-space($Form5472Data/ReportingCorporationInfo/ForeignAddress/ProvinceOrStateNm) != '' or 
											normalize-space($Form5472Data/ReportingCorporationInfo/ForeignAddress/ForeignPostalCd) != ''">
												<br/>
											</xsl:if>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ForeignAddress/CountryCd"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</div>
							</div>
						</div>
						<!--Part I, Line 1c-->
						<div class="styFNBox" style="float:left; width:49mm; height:20mm; border-right:0px;">
							<div class="styIRS5472TextTitle">1c</div>
							<div class="styGenericDiv">Total assets</div>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<span style="padding-left:6.5mm;">
								$
								<span style="width:39mm; text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/TotalAssetsAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<!--Part I, Line 1d and 1e-->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:118mm; height:4mm;">
							<div class="styIRS5472TextTitle">1d</div>
							<div class="styGenericDiv">
								Principal business activity
								<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/> 
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/PrincipalBusinessActivityDesc"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Part I, Line 1e-->
						<div style="float:left">
							<div class="styIRS5472TextTitle">1e</div>
							<div class="styGenericDiv">
								<!-- point 2 -->
								Principal business activity code
								<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/> 
								<xsl:if test="$Form5472Data/ReportingCorporationInfo/PrincipalBusinessActivityCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/PrincipalBusinessActivityCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form5472Data/ReportingCorporationInfo/InactivePrincipalBusActyCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/InactivePrincipalBusActyCd"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<!--Part I, Line 1f-->
					<div class="styBB" style="width:187mm; height:12mm;">
						<div class="styFNBox" style="float:left; width:70mm;">
							<div class="styIRS5472TextTitle">1f</div>							
							Total value of gross payments made or received
							<span style="padding-left:6mm;">									
							reported on <b>this</b> Form 5472. See instructions. 
							</span>
							<div style="padding-top:2mm; padding-left:6.5mm;">
								$
								<span style="width:58mm; text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/TotalValueGrossPaymentsAmt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!--Part I, Line 1g-->
						<div class="styFNBox" style="float:left; width:48mm; border-left:1 solid; border-right:1px solid;">
							<div class="styIRS5472TextTitle">1g</div>							
							Total number of Forms 5472 
							<span style="padding-left:6mm;">filed for the tax year</span>
							<br/>
							<div style="padding-top:2mm; padding-left:6mm; text-align:left;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="MaxSize" select="4"/>
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/TotalForm5472FiledCnt"/>
								</xsl:call-template>
							</div>
						</div>
						<!--Part I, Line 1h-->
						<div class="styFNBox" style="float:left; width:69mm; border-right:0px;">
							<div class="styIRS5472TextTitle">1h</div>							
							Total value of gross payments made or received 
							<span style="padding-left:6mm;">
							reported on <b>all</b> Forms 5472. See instructions.
							</span>
							<div style="padding-top:2mm; padding-left:6.5mm;">
								$
								<span style="width:59mm; text-align:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/TotalVlGroPymtRptAll5472Amt"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
					</div>
					<!--Part I, Line 1i-->
					<div class="styBB" style="width:187mm; height:8mm;">
						<div class="styFNBox" style="float:left; width:60mm;height:8mm;">
							<div class="styIRS5472TextTitle">1i</div>							
								Check here if this is a consolidated filing of<br/>
								<span style="padding-left:6mm;">Form 5472</span>
								<span style="letter-spacing:3mm; font-weight:bold; padding-left:1mm;"> ...... </span>
								<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Arrow Bullet"/>  
							<input type="checkbox" alt="IRS5472ConsolidatedFiling" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ConsolidatedFilingForm5472Ind"/>
									<xsl:with-param name="BackupName">5472ConsolidatedFilingOfForm5472</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ConsolidatedFilingForm5472Ind"/>
									<xsl:with-param name="BackupName">5472ConsolidatedFilingOfForm5472</xsl:with-param>
								</xsl:call-template>
							</label>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/ConsolidatedFilingForm5472Ind"/>
							</xsl:call-template>
						</div>
						<!--Part I, Line 1j-->
						<div class="styFNBox" style="float:left; width:78mm; height:8mm; border-left:1 solid; border-right:1px solid;">
							<div class="styIRS5472TextTitle">1j</div>							
							Check here if this is the initial year for which the US <br/>
							<span style="padding-left:6mm;">reporting corporation is filing a Form 5472</span>
							<span style="letter-spacing:3.3mm; font-weight:bold; padding-left:1mm;"> .. </span>
							<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Arrow Bullet"/>  
							<input type="checkbox" alt="IRS5472ConsolidatedFiling" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/InitialYrRptgFilingForm5472Ind"/>
									<xsl:with-param name="BackupName">5472InitialYrRptgFilingForm5472Ind</xsl:with-param>
								</xsl:call-template>
							</input>
						</div>
						<!--Part I, Line 1k-->
						<div class="styFNBox" style="float:left; width:49mm; height:8mm; border-right:0px;">
							<div class="styIRS5472TextTitle">1k</div>							
							<span style="padding-right:2mm;">Country of incorporation</span><br/>
							<div style="padding-left:6mm;padding-top:1mm;">							
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/IncorporationCountryCd"/>
								</xsl:call-template>
							</div>	
						</div>
					</div>					
					<!--Part I, Line 1l and 1m-->
					
					<div class="styBB" style="font-size:8pt; width:187mm; empty-cells:show; border-collapse:collapse; border-style:solid; border-color:black; border-top-width:0px; border-bottom-width:0; border-left-width:0; border-right-width:0;" cellpadding="0" cellspacing="0">
						<div class="styFNBox" style="font-weight:normal; width:79mm; border-right:1px solid black;" align="left" valign="top">
							<div class="styIRS5472TextTitle">1l</div>
							<div class="styGenericDiv">
								Country(ies) under whose laws the reporting corporation <br/>files an income tax return as a resident<br/>
								<xsl:for-each select="$Form5472Data/ReportingCorporationInfo/FilesIncmTaxResidentCountryCd">
									<xsl:if test="position()!= 1">
										,
									</xsl:if>
									<xsl:if test="(position() mod 12 = 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</div>
						</div>
						<div style="float:left">
							<div class="styIRS5472TextTitle">1m</div>
							<div class="styGenericDiv">
								Principal country(ies) where business is conducted<br/><br/>
								<xsl:for-each select="$Form5472Data/ReportingCorporationInfo/PrincipalPlaceOfBusCountryCd">
									<xsl:if test="position()!= 1">
										,
									</xsl:if>
									<xsl:if test="(position() mod 12 = 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</div>
						</div>
					</div>
					<!--<table style="font-size:8pt; width:187mm; empty-cells:show; border-collapse:collapse; border-style:solid; border-color:black; border-top-width:0px; border-bottom-width:0; border-left-width:0; border-right-width:0;" cellpadding="0" cellspacing="0">
						<tr>
							<th rowspan="2" scope="row" style="width:5mm;text-align:left;padding-left:1mm;" valign="top"> 1l </th>
							<th scope="col" style="font-weight:normal; width:77mm; border-right:1px solid black;" align="left" valign="top">
								Country(ies) under whose laws the reporting corporation files an income tax return as a resident
							</th>
							
						</tr>
						<tr style="height:4mm;">
							<td style="width:65mm; border-right:1px solid black; padding-top:4mm;" valign="top">
								<xsl:for-each select="$Form5472Data/ReportingCorporationInfo/FilesIncmTaxResidentCountryCd">
									<xsl:if test="position()!= 1">
										,
									</xsl:if>
									<xsl:if test="(position() mod 12= 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</td>
							<th rowspan="2" scope="row" valign="top" style="width:6mm;"> 1m </th>
							<th scope="col" style="font-weight:normal; width:77mm;" align="left" valign="top">
								Principal country(ies) where business is conducted
							</th>
							<td colspan="2" valign="top" style="padding-top:1mm;">
								<xsl:for-each select="$Form5472Data/ReportingCorporationInfo/PrincipalPlaceOfBusCountryCd">
									<xsl:if test="position()!= 1">
										,
									</xsl:if>
									<xsl:if test="(position() mod 12= 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</td>
						</tr>
					</table>-->
					<!--Part I, Line 2-->
					<div class="styBB" style="width:187mm; padding-bottom:0.5mm; padding-top:0.5mm; border-bottom-width:1px; border-top-width:1px;">
						<div class="styIRS5472TextTitle">2</div>
						<div class="styGenericDiv">
							Check here if, at any time during the tax year, any foreign person owned, directly or indirectly, at least 50% of
							<b>(a)</b>
							the total voting
							<br/>
							power of all classes of the stock of the reporting corporation entitled to vote, or
							<b>(b)</b>
							the total value of all classes of stock of the
							<br/>
							reporting corporation
							<span style="letter-spacing:3.3mm; font-weight:bold; padding-left:1mm;"> .................................. </span>
							<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Arrow Bullet"/>
							<span style="width:2mm;"/>
							<input type="checkbox" alt="IRS5472ForeignPersonOwn50PercentTotalVotingPowerOrValue" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/FrgnPrsnOwn50PctTotVoteOrVlInd"/>
									<xsl:with-param name="BackupName">IRS5472FrgnPersonOwn50PctVoteOrStock</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/FrgnPrsnOwn50PctTotVoteOrVlInd"/>
									<xsl:with-param name="BackupName">IRS5472FrgnPersonOwn50PctVoteOrStock</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<!--Part I, Line 3-->
					<div class="styBB" style="width:187mm; padding-bottom:0.5mm; padding-top:0.5mm; border-bottom-width:2px;">
						<div class="styIRS5472TextTitle">3</div>
						<div class="styGenericDiv">
							Check here if the reporting corporation is a foreign-owned domestic disregarded entity (foreign-owned U.S. DE) treated as a corporation 
							<br/>for purposes of section 6038A. See instructions.
							<span style="letter-spacing:3.3mm; font-weight:bold;"> ..........................</span>
							<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Arrow Bullet"/>
							<span style="width:2mm;"/>
							<input type="checkbox" alt="IRS5472ForeignOwnedUSDECorporation" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/FrgnOwnUSDECorpInd"/>
									<xsl:with-param name="BackupName">IRS5472FrgnOwnUSDECorp</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/ReportingCorporationInfo/FrgnOwnUSDECorpInd"/>
									<xsl:with-param name="BackupName">IRS5472FrgnOwnUSDECorp</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<!-- BEGIN Part II Title -->
					<xsl:variable name="p2DirectCount" select="count($Form5472Data/Direct25PctFrgnShareholderInfo)"/>
					<xsl:variable name="containerHeight" select="1"/>
					<div>
					<div class="styBB" style="width:187mm; border-top:1 solid black;">
						<div class="styPartName" style="width:11mm; height:5mm; padding-top:.5mm;">Part II</div>
						<div class="styPartDesc" style="padding-top:1mm;height:12mm;">
							25% Foreign Shareholder <span class="styNormalText">(see instructions)</span><br/>
							<span class="styNormalText">
								Check here if any direct (or ultimate indirect) 25% foreign shareholder listed in Part II is a surrogate foreign corporation under section 7874(a)(2)(B). 
								<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>  
								<input type="checkbox" alt="Part II Surrogate Foreign Corporation Under Section 7874(a)(2)(B) Indicator" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SrgtFrgnCorpUndSect7874a2BInd"/>
										<xsl:with-param name="BackupName">SrgtFrgnCorpUndSect7874a2BIndicator</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SrgtFrgnCorpUndSect7874a2BInd"/>
										<xsl:with-param name="BackupName">SrgtFrgnCorpUndSect7874a2BIndicatorLabel</xsl:with-param>
									</xsl:call-template>
								</label>    
							</span>
							<!--<span class="styNormalText">(see instructions)</span>-->
						</div>
						<xsl:if test="$p2DirectCount &gt; $containerHeight">
							<div style="float:right">
								<!-- button display logic -->
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo"/>
									<xsl:with-param name="containerHeight" select="$containerHeight"/>
									<xsl:with-param name="containerID" select="'part2TPctn1'"/>
								</xsl:call-template>
								<!-- end button display logic -->
							</div>
						</xsl:if>
					</div>
					<!-- END Part II Title -->
					<!-- BEGIN Part II Line Items -->
					<!-- Using 2 different templates define at the end of the codes; p2DirectTemplate (Part II, Line 1a-2e) and p2UltimateTemplate (Part II, line 3a-4e)-->
					<div class="styIRS5472TableContainer2" id="part2TPctn1" style="width:187mm; border-bottom:0px;">
						<xsl:attribute name="style"><xsl:if test="$p2DirectCount &gt; $containerHeight">
							height:51.2mm;
						</xsl:if></xsl:attribute>
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<xsl:call-template name="p2DirectTemplate">
							<xsl:with-param name="p2DirectCount" select="$p2DirectCount"/>
							<xsl:with-param name="max">
								<xsl:choose>
									<xsl:when test="$p2DirectCount &gt; $containerHeight">
										<xsl:value-of select="$p2DirectCount"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$containerHeight"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
						</xsl:call-template>
					</div>
					<xsl:if test="($Form5472Data/Direct25PctFrgnShareholderInfo &gt;1) and ($Print = $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo"/>
							<xsl:with-param name="containerHeight" select="$containerHeight"/>
							<xsl:with-param name="containerID" select="'part2TPctn1'"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:variable name="p2UltimateCount" select="count($Form5472Data/UltimateIndr25PctFrgnShrInfo)"/>
					<xsl:if test="$p2UltimateCount &gt; $containerHeight">
						<div class="styBB" style="width:187mm; border-top:0;">
							<div style="float:right">
								<xsl:call-template name="SetDynamicTableToggleButton">
									<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo"/>
									<xsl:with-param name="containerHeight" select="$containerHeight"/>
									<xsl:with-param name="containerID" select="'part2TPctn2'"/>
								</xsl:call-template>
							</div>
						</div>
					</xsl:if>
					<div class="styIRS5472TableContainer2" id="part2TPctn2">
						<xsl:attribute name="style"><xsl:if test="$p2UltimateCount &gt; $containerHeight">
							height:51.2mm; 
						</xsl:if></xsl:attribute>
						<!-- print logic -->
						<xsl:call-template name="SetInitialState"/>
						<!-- end -->
						<xsl:call-template name="p2UltimateTemplate">
							<xsl:with-param name="p2UltimateCount" select="$p2UltimateCount"/>
							<xsl:with-param name="max">
								<xsl:choose>
									<xsl:when test="$p2UltimateCount &gt; $containerHeight">
										<xsl:value-of select="$p2UltimateCount"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$containerHeight"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:with-param>
						</xsl:call-template>
					</div>
					<xsl:if test="($Form5472Data/UltimateIndr25PctFrgnShrInfo &gt;1) and ($Print = $Separated)">
						<xsl:call-template name="SetInitialDynamicTableHeight">
							<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo"/>
							<xsl:with-param name="containerHeight" select="$containerHeight"/>
							<xsl:with-param name="containerID" select="'part2TPctn2'"/>
						</xsl:call-template>
					</xsl:if>
					</div>
					<!-- END Part II Line Items -->
					<!-- BEGIN Page 1 Footer -->
					<div style="width:187mm; font-size:7pt; border-top:1 solid black; padding-top:0.5mm;">
						<div style="float:left; font-size:8pt">
							<b>For Paperwork Reduction Act Notice, see instructions.</b>
						</div>
						<div style="float:right;">
							Cat. No. 49987Y
							<span style="width:35mm;"/>
							Form
							<b style="font-size:8pt;">5472</b>
							(Rev. 12-2018)
						</div>
					</div>
					<div class="pageEnd"/>
					<!-- END Page 1 Footer -->
					<!-- BEGIN Page 2 Page Header -->
					<div style="width:187mm; font-size:7pt; page-break-before:always; padding-bottom:0.5mm;">
						<div style="float:left;"> Form 5472 (Rev. 12-2018) </div>
						<div style="float:right;">
							Page
							<b style="font-size:8pt;">2</b>
						</div>
					</div>
					<!-- END Page 2 Page Header -->
					<!-- BEGIN Part III Title -->
					<div class="styBB" style="width:187mm; height:9mm; border-top:2 solid black; border-top-width:2px;">
						<div class="styPartName" style="width:13mm;">Part III</div>
						<div class="styPartDesc">
							Related Party
							<span class="styNormalText">
								(see instructions). All reporting corporations must complete this question and the rest of Part III.
								</span>
							<br/>
							<span class="styNormalText">
								Check applicable box: Is the related party a
								<input type="checkbox" alt="IRS5472ForeignPerson" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignPersonInd"/>
										<xsl:with-param name="BackupName">IRS5472RelatedPartyIsForeignPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignPersonInd"/>
										<xsl:with-param name="BackupName">IRS5472RelatedPartyIsForeignPerson</xsl:with-param>
									</xsl:call-template>
									foreign person
								</label>
								or
								<input type="checkbox" alt="IRS5472USPerson" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/USPersonInd"/>
										<xsl:with-param name="BackupName">IRS5472RelatedPartyIsUSPerson</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/USPersonInd"/>
										<xsl:with-param name="BackupName">IRS5472RelatedPartyIsUSPerson</xsl:with-param>
									</xsl:call-template>
									U.S. person
								</label>
								?
								</span>
						</div>
					</div>
					<!-- END Part III Title -->
					<!-- BEGIN Part III Line Items -->
					<!-- Part III, Line 1a, 1b(1) and 1b(2)-->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:187mm; clear:none; border-bottom:1px solid black; border-right:0px;">
							<div class="styIRS5472TextTitle" style="width:4mm;">1a</div>
							<div class="styGenericDiv" style="padding-left:2mm;">Name and address of related party</div>
							<br/>
							<div style="margin-left:6mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyName/BusinessNameLine1Txt"/>
								</xsl:call-template>
								<xsl:if test="normalize-space($Form5472Data/RelatedPartyInfo/RelatedPartyName/BusinessNameLine2Txt)!=''">
									<span style="width:1mm;">
									</span>									
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedPartyName/BusinessNameLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
								<br/>
								<xsl:choose>
									<xsl:when test="$Form5472Data/RelatedPartyInfo/ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignAddress/AddressLine1Txt"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form5472Data/RelatedPartyInfo/ForeignAddress/AddressLine2Txt)!=''">
											<span style="width:1mm;"></span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
										<span style="width:1mm;"></span>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignAddress/CityNm"/>
										</xsl:call-template>
										<xsl:if test="(normalize-space($Form5472Data/RelatedPartyInfo/ForeignAddress/CityNm) != '') and (normalize-space($Form5472Data/RelatedPartyInfo/ForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form5472Data/RelatedPartyInfo/ForeignAddress/ForeignPostalCd) != '')">											,
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>  
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
										<xsl:if test="normalize-space($Form5472Data/RelatedPartyInfo/ForeignAddress/CityNm) != '' or normalize-space($Form5472Data/RelatedPartyInfo/ForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form5472Data/RelatedPartyInfo/ForeignAddress/ForeignPostalCd) != ''">
										<span style="width:1mm;"></span>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:if test="$Form5472Data/RelatedPartyInfo/USAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/USAddress/AddressLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="normalize-space($Form5472Data/RelatedPartyInfo/USAddress/AddressLine2Txt)!=''">
											<span style="width:1mm;"></span>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/USAddress/AddressLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<span style="width:1mm;"></span>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/USAddress/CityNm"/>
											</xsl:call-template>
											,
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/USAddress/StateAbbreviationCd"/>
											</xsl:call-template>  
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/USAddress/ZIPCd"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
						<!-- Part III, Line 1b(1) and 1b(2), choice of inline or separated-->
						<xsl:choose>
							<xsl:when test="($Print = $Separated)">
								<tr>
									<td class="styFNBox" style="width:33mm; height:9.5mm; border-right:1px solid black;">
										<div class="styIRS5472TextTitle" style="white-space:nowrap; width:6mm;">1b(1) </div>
										<div class="styGenericDiv" style="padding-left:3mm; width:33mm; height:9.5mm; border-right:1px solid black;">
											U.S. identifying number, if any
											<br/>
											<div>
												<xsl:choose>
													<xsl:when test="$Form5472Data/RelatedPartyInfo/EIN !=''">
														<xsl:call-template name="PopulateEIN">
															<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/EIN"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:when test="$Form5472Data/RelatedPartyInfo/MissingEINReasonCd !=''">
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/MissingEINReasonCd"/>
														</xsl:call-template>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="PopulateSSN">
															<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/SSN"/>
														</xsl:call-template>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</div>
									</td>
									<td class="styFNBox" style="width:59mm;height:9.5mm;border-right:1px solid black;">
										<div class="styIRS5472TextTitle" style="white-space:nowrap;width:6mm;">1b(2) </div>
										<div class="styGenericDiv" style="padding-left:3mm;width:59mm;height:9.5mm;border-right:1px solid black;">
											Reference ID number (see instructions)
											<br/>
											<div style="padding-top:1mm;">
										<xsl:choose>
											<xsl:when test="count($Form5472Data/RelatedPartyInfo/ForeignEntityIdentificationGrp) = 1">
												<span style="text-align:left; width: 59mm; padding-left:7mm;">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
													</xsl:call-template>
													<br/>
												</span>
											</xsl:when>
											<xsl:otherwise>
												<span style="text-align:left; width: 59mm; padding-top:2mm;">
													<xsl:call-template name="PopulateAdditionalDataTableMessage">
														<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignEntityIdentificationGrp"/>
														<xsl:with-param name="ShortMessage" select=" 'false' "/>
													</xsl:call-template>
													<br/>
												</span>
											</xsl:otherwise>
										</xsl:choose>
											</div>
										</div>
									</td>
									<td class="styFNBox" style="width:85mm;height:9.5mm;">
										<div class="styIRS5472TextTitle" style="white-space:nowrap;width:6mm;">1b(3) </div>
										<div class="styGenericDiv" style="padding-left:4mm;width:75mm;height:9.5mm;">
											FTIN, if any (see instructions)
											<br/>
											<div style="padding-top:2.5mm;font-size:7.5pt;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/FTIN"/>
												</xsl:call-template>
											</div>
										</div>
									</td>									
								</tr>
							</xsl:when>
							<!-- Part III, Line 1b-->
							<!--Exception: left border and bottom border dsiplay thick are due to repearting table when display either as a blank form and/or with data-->
							<xsl:when test="($Print != $Separated)">
							<div style="width:30mm;height:9mm;vertical-align: top;">
								<div class="styIRS5472TextTitle" style="white-space:nowrap;width:5mm;">1b(1) </div>
								<div class="styGenericDiv" style="padding-left:3mm;width:25mm;height:9mm;">
									U.S. identifying number, if any
									<br/>
									<div>
										<xsl:choose>
											<xsl:when test="$Form5472Data/RelatedPartyInfo/EIN !=''">
												<xsl:call-template name="PopulateEIN">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/EIN"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:when test="$Form5472Data/RelatedPartyInfo/MissingEINReasonCd !=''">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/MissingEINReasonCd"/>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateSSN">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/SSN"/>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
							</div>
								<div style="width:78mm;border-top:0 solid black;border-left:1px solid black;border-right:1px solid black;">
									<span class="styTableCell" style="width:78mm;border:none;border-top:0 solid black;">
										<span style="width:78mm;text-align:left;">
											<b>1b(2)</b>
											<span style="padding-left:1mm;">Reference ID number (see instructions)
											</span>
											<span style="float:right;padding-right:0.5mm;">
												<xsl:call-template name="SetDynamicTableToggleButton">
													<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignEntityIdentificationGrp"/>
													<xsl:with-param name="containerHeight" select="1"/>
													<xsl:with-param name="headerHeight" select="0"/>
													<xsl:with-param name="containerID" select=" 'FEIdctn' "/>
												</xsl:call-template>
											</span>
										</span>
									</span>
									<div class="styIRS5472TableContainer" id="FEIdctn" style="width:77mm;height:5mm;border-top:0;border-left:0px;">
										<xsl:call-template name="SetInitialState"/>
										<table class="styTable" cellspacing="0" style="font-size:6.5pt;">
											<tbody>
												<xsl:choose>
													<xsl:when test="count($Form5472Data/RelatedPartyInfo/ForeignEntityIdentificationGrp) = 0">
														<tr>
															<td class="styTableCell" style="vertical-align:bottom;height:11mm;border-right:0;border-bottom:0px;">
																<span style="text-align:left;width:57mm;">
																	<br/>
																</span>
															</td>
														</tr>
													</xsl:when>
													<xsl:otherwise>
														<xsl:for-each select="$Form5472Data/RelatedPartyInfo/ForeignEntityIdentificationGrp">
															<tr>
																<td class="styTableCell" style="vertical-align:bottom;height:5mm;border-right:0;border-left-width:0px;width:77mm;">
																	<!-- 06/01/2015 WWT: if statements are for last border-widths -->
																	<xsl:if test="(position() = last())">
																		<xsl:attribute name="style">vertical-align:bottom;height:5mm;border-right:0;border-bottom:0;border-left-width:0px</xsl:attribute>
																	</xsl:if>
																	<!-- 03/08/2016 WWT: if statements are for first border-widths -->
																	<xsl:if test="(position() = 1)">
																		<xsl:attribute name="style">vertical-align:bottom;height:5mm;border-right:0;border-bottom:1;border-left-width:0px;
																	</xsl:attribute>
																	</xsl:if>
																	<span style="text-align:left;width: 70mm; padding-left:4.5mm;">
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
							<div style="width:70mm;height:9mm;vertical-align: top;">
								<div class="styIRS5472TextTitle" style="white-space:nowrap;width:5mm;">1b(3) </div>
								<div class="styGenericDiv" style="padding-left:4mm;width:63mm;height:9mm;">
									FTIN, if any (see instructions)
									<br/>
									<div style="font-size:7pt;padding-top:3mm;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/FTIN"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
								<xsl:call-template name="SetInitialDynamicTableHeight">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignEntityIdentificationGrp"/>
									<xsl:with-param name="containerHeight" select="1"/>
									<xsl:with-param name="headerHeight" select="0"/>
									<xsl:with-param name="containerID" select=" 'FEIdctn' "/>
								</xsl:call-template>
							</xsl:when>
						</xsl:choose>
					</div>
					<!-- Part III, Line 1c and 1d-->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:118mm;height:4mm;">
							<div class="styIRS5472TextTitle">1c</div>
							<div class="styGenericDiv">
								Principal business activity
								<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/> 
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/PrincipalBusinessActivityDesc"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Part III, Line 1d-->
						<div style="float:left">
							<div class="styIRS5472TextTitle">1d</div>
							<div class="styGenericDiv">
								Principal business activity code
								<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/> 
								<xsl:if test="$Form5472Data/RelatedPartyInfo/PrincipalBusinessActivityCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/PrincipalBusinessActivityCd"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$Form5472Data/RelatedPartyInfo/InactivePrincipalBusActyCd">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/InactivePrincipalBusActyCd"/>
									</xsl:call-template>
								</xsl:if>
							</div>
						</div>
					</div>
					<!-- Part III, Line 1e-->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="border-right:0px;">
							<div class="styIRS5472TextTitle" style="padding-top:1mm;">1e</div>
							Relationship—Check boxes that apply:
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedReportingCorporationInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5472RelatedReportingCorporation" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedReportingCorporationInd"/>
									<xsl:with-param name="BackupName">IRS5472RelatedToReportingCorporation</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/RelatedReportingCorporationInd"/>
									<xsl:with-param name="BackupName">IRS5472RelatedToReportingCorporation</xsl:with-param>
								</xsl:call-template>
								Related to reporting corporation
							</label>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/Related25PercentForeignShrInd"/>
							</xsl:call-template>
								<input type="checkbox" alt="IRS5472Related25PercentForeignShareholder" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/Related25PercentForeignShrInd"/>
									<xsl:with-param name="BackupName">IRS5472RelatedTo25PctFrgnShareholder</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/Related25PercentForeignShrInd"/>
									<xsl:with-param name="BackupName">IRS5472RelatedTo25PctFrgnShareholder</xsl:with-param>
								</xsl:call-template>
								Related to 25% foreign shareholder
							</label>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignShareholder25PercentInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="IRS5472ForeignShareholder25" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignShareholder25PercentInd"/>
									<xsl:with-param name="BackupName">IRS5472ForeignShareholder25Percent</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form5472Data/RelatedPartyInfo/ForeignShareholder25PercentInd"/>
									<xsl:with-param name="BackupName">IRS5472ForeignShareholder25Percent</xsl:with-param>
								</xsl:call-template>
								25% foreign
								<span style="padding-left:5mm">shareholder</span>
							</label>
						</div>
					</div>
					<!-- Part III, Line 1f-->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:75mm;height:10mm;">
							<div class="styIRS5472TextTitle">1f</div>
							<div class="styGenericDiv">
								Principal country(ies) where business is conducted<br/><br/>
								<xsl:for-each select="$Form5472Data/RelatedPartyInfo/PrincipalPlaceOfBusCountryCd">
									<xsl:if test="position()!= 1">
										,
									</xsl:if>
									<xsl:if test="(position() mod 13 = 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</div>
						</div>
						<!-- Part III, Line 1g-->
						<div style="float:left">
							<div class="styIRS5472TextTitle">1g</div>
							<div class="styGenericDiv">
								Country(ies) under whose laws the related party files an income tax return as a<br/>
								resident<br/>
								<xsl:for-each select="$Form5472Data/RelatedPartyInfo/FilesIncmTaxResidentCountryCd">
									<xsl:if test="position()!= 1">
										,
									</xsl:if>
									<xsl:if test="(position() mod 19 = 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</div>
						</div>
					</div>
					<!-- END Part III Line Items -->
					<!-- BEGIN Part IV Title -->
					<div class="styBB" style="width:187mm;height:13mm;border-top:2 solid black;border-top-width: 1px">
						<div class="styPartName" style="width:13mm;">Part IV</div>
						<div class="styPartDesc" style="padding-top:.5mm;">
							Monetary Transactions Between Reporting Corporations and Foreign Related Party
							<span style="font-weight:normal;">(see instructions)</span>
							<br/>
							<b>Caution:</b> 
							<span style="font-weight:normal;">
								Part IV
								<b>must</b>
								be completed if the "foreign person" box is checked in the heading for Part III.
							</span>
							<br/>
							<span class="styNormalText" style="font-size: 8pt;">
								If estimates are used, check here
								<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>    
								<input type="checkbox" alt="IRS5472ReasonableEstimateUsed" class="styCkbox">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReasonableEstimateUsedInd"/>
										<xsl:with-param name="BackupName">
											IRS5472ReasonableEstimatesUsed
										</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ReasonableEstimateUsedInd"/>
										<xsl:with-param name="BackupName">
											IRS5472ReasonableEstimatesUsed
										</xsl:with-param>
									</xsl:call-template>
								</label>  
							</span>
						</div>
					</div>
					<!-- END Part IV Title -->
					<!-- BEGIN Part IV Line 1 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">1</div>
						<div style="float:left;padding-top:.5mm;"> Sales of stock in trade (inventory) </div>
						<div style="float:right">
							<span class="styDotLn"> ........................ </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:2.5mm;">1</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/StockSalesTradeAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/StockSalesTradeAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/StockSalesTrade50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 2 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">2</div>
						<div style="float:left"> Sales of tangible property other than stock in trade </div>
						<div style="float:right">
							<span class="styDotLn"> .................. </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:2.5mm;">2</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/TangiblePropertySalesAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TangiblePropertySalesAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TangiblePropertySls50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 3 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">3</div>
						<div style="float:left">Platform contribution transaction payments received</div>
						<div style="float:right">
							<span class="styDotLn"> .................. </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:2.5mm;">3</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/PlatformContributionRcvdAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PlatformContributionRcvdAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PlatformContriRcvd50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 4 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">4</div>
						<div style="float:left">Cost sharing transaction payments received</div>
						<div style="float:right">
							<span class="styDotLn"> .................... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:2.5mm;">4</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/CostSharingReceivedAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CostSharingReceivedAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CostSharingRcvd50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 5a Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">5a</div>
						<div style="float:left"> Rents received (for other than intangible property rights) </div>
						<div style="float:right">
							<span class="styDotLn"> ................ </span>
							<div class="styLNRightNumBox">5a</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/RentsReceivedAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RentsReceivedAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RentsReceived50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 5b Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD" style="padding-left:4mm">b</div>
						<div style="float:left"> Royalties received (for other than intangible property rights) </div>
						<div style="float:right">
							<span class="styDotLn"> ............... </span>
							<div class="styLNRightNumBox">5b</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/RoyaltiesReceivedAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RoyaltiesReceivedAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RoyaltiesReceived50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 6 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">6</div>
						<div style="float:left;"> Sales, leases, licenses, etc., of intangible property rights (for example, patents, trademarks, secret formulas) </div>
						<div style="float:right">
							<span class="styDotLn"> . </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:2.5mm;">6</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/PropertyRightsSalesAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PropertyRightsSalesAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PropertyRightsSales50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 7 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">7</div>
						<div style="float:left"> Consideration received for technical, managerial, engineering, construction, scientific, or like services </div>
						<div style="float:right">
							<span class="styDotLn"> .. </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:2.5mm;">7</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/TechnicalSrvcCompRcvdAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TechnicalSrvcCompRcvdAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TechSrvcCompRcvd50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 8 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">8</div>
						<div style="float:left"> Commissions received </div>
						<div style="float:right">
							<span class="styDotLn"> ........................... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:2.5mm;">8</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/CommissionsReceivedAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CommissionsReceivedAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CommissionsReceived50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 9 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBoxSD">9</div>
						<div style="float:left">
							Amounts borrowed
							<span style="font-family:'Arial Narrow'">
								(see instructions)
								<span style="width:1mm"/>
								<!-- BEGIN Part IV Line 9a Items -->
								<b>a</b>  Beginning	balance 
								<span style="width:21mm; border-bottom:1 solid black; text-align:right">
									<!-- *************************************************************************************** -->
									<xsl:choose>
										<xsl:when test="normalize-space($Form5472Data/BorrowedBegngBalAmt) != ''">
											<span class="styFixedUnderline" style="width:20mm;padding-top:0mm;padding-bottom:0mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form5472Data/BorrowedBegngBalAmt"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<span class="styFixedUnderline" style="width:20mm;padding-top:0mm;padding-bottom:0mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/BorrowedBegngBal50000LessCd"/>
												</xsl:call-template>
											</span>
										</xsl:otherwise>
									</xsl:choose>
									<!-- *************************************************************************************** -->
								</span>
								<span style="width:1mm"/>
								<!-- BEGIN Part IV Line 9b Items -->
								<b>b</b>  Ending	balance or monthly average 
							</span>
							<span style="width:2mm"/>
							<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style="height:4.2mm;text-align:left;padding-left:2.5mm;">9b</div>
							<div class="styLNAmountBox" style="height:4.2mm;">
								<!--  ** 02/02/2016 WT: Exception, a choice of three items for line 9b**********************   -->
								<!-- *********************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/BorrowedMonthlyAverageAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/BorrowedMonthlyAverageAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="normalize-space($Form5472Data/BorrowedEndingBalAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/BorrowedEndingBalAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/BorrowedEndingBal50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 10 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">10</div>
						<div style="float:left"> Interest received </div>
						<div style="float:right">
							<span class="styDotLn"> ............................. </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">10</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/InterestReceivedAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InterestReceivedAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InterestReceived50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 11 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">11</div>
						<div style="float:left"> Premiums received for insurance or reinsurance </div>
						<div style="float:right">
							<span class="styDotLn"> ................... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">11</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/InsReinsPremRcvdAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InsReinsPremRcvdAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InsReinsPremRcvd50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 12 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">12</div>
						<div style="float:left"> Other amounts received (see instructions) </div>
						<div style="float:right">
							<span class="styDotLn"> ..................... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">12</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/OthTransactionsRcvdAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/OthTransactionsRcvdAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/OthTransactionsRcvd50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 13 Items -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox">13</div>
						<div style="float:left">
							<b>Total.</b>
							Combine amounts on lines 1 through 12
						</div>
						<div style="float:right">
							<span class="styDotLn"> ................... </span>
							<div class="styLNRightNumBox" style="border-bottom:0;text-align:left;padding-left:1.5mm;">13</div>
							<div class="styLNAmountBoxNBB">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/TotalReceivedAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TotalReceivedAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TotalReceived50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 14 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">14</div>
						<div style="float:left"> Purchases of stock in trade (inventory) </div>
						<div style="float:right">
							<span class="styDotLn"> ...................... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">14</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/StockPurchasesTradeAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/StockPurchasesTradeAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/StockPurchasesTrade50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 15 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">15</div>
						<div style="float:left"> Purchases of tangible property other than stock in trade </div>
						<div style="float:right">
							<span class="styDotLn"> ................. </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">15</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/TangiblePropPrchsAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TangiblePropPrchsAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TangiblePropPrchs50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 16 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">16</div>
						<div style="float:left"> Platform contribution transaction payments paid </div>
						<div style="float:right">
							<span class="styDotLn"> ................... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">16</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/PlatformContributionPaidAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PlatformContributionPaidAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PlatformContriPaid50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 17 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">17</div>
						<div style="float:left"> Cost sharing transaction payments paid </div>
						<div style="float:right">
							<span class="styDotLn"> ..................... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">17</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/CostSharingPaidAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CostSharingPaidAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CostSharingPaid50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 18a Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">18a</div>
						<div style="float:left"> Rents paid (for other than intangible property rights) </div>
						<div style="float:right">
							<span class="styDotLn"> ................. </span>
							<div class="styLNRightNumBox">18a</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/RentsPaidAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RentsPaidAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RentsPaid50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 18b Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox" style="padding-left:4.2mm">b</div>
						<div style="float:left"> Royalties paid (for other than intangible property rights) </div>
						<div style="float:right">
							<span class="styDotLn"> ................. </span>
							<div class="styLNRightNumBox">18b</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/RoyaltiesPaidAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RoyaltiesPaidAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/RoyaltiesPaid50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 19 row 1 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">19</div>
						<div class="styLNDesc" style="width:138mm;"> Purchases, leases, licenses, etc., of intangible property rights (for example, patents, trademarks, secret<br/> 
							<div>
							<span style="float:left;width:15mm;">formulas) </span>						
							<span class="styDotLn" style="float:right; width: 123mm;">................................</span>
							</div>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style=" text-align:left;padding-left:1.5mm;height:7mm;padding-top:3mm;">19</div>
							<div class="styLNAmountBox" style="height:7mm;padding-top:3mm;">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/PropertyRightsPrchsAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PropertyRightsPrchsAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/PropertyRightsPrchs50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 20 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">20</div>
						<div style="float:left"> Consideration paid for technical, managerial, engineering, construction, scientific, or like services </div>
						<div style="float:right">
							<span class="styDotLn"> .... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">20</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/TechnicalSrvcCompPdAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TechnicalSrvcCompPdAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TechnicalSrvcCompPd50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 21 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">21</div>
						<div style="float:left"> Commissions paid </div>
						<div style="float:right">
							<span class="styDotLn"> ............................. </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">21</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/CommissionsPaidAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CommissionsPaidAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/CommissionsPaid50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 22 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">22</div>
						<div style="float:left">
							Amounts loaned
							<span style="font-family:'Arial Narrow'">
								(see instructions)
								<span style="width:1mm"/>
								<!-- BEGIN Part IV Line 22a Items -->
								<b>a</b>  Beginning	balance 
								<span style="width:21mm; border-bottom:1 solid black; text-align:right">
									<!-- *************************************************************************************** -->
									<xsl:choose>
										<xsl:when test="normalize-space($Form5472Data/LoanedBeginningBalAmt) != ''">
											<span class="styFixedUnderline" style="width:24mm;padding-top:0mm;padding-bottom:0mm;">
												<xsl:call-template name="PopulateAmount">
													<xsl:with-param name="TargetNode" select="$Form5472Data/LoanedBeginningBalAmt"/>
												</xsl:call-template>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<span class="styFixedUnderline" style="width:24mm;padding-top:0mm;padding-bottom:0mm;">
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$Form5472Data/LoanedBeginningBal50000LessCd"/>
												</xsl:call-template>
											</span>
										</xsl:otherwise>
									</xsl:choose>
									<!-- *************************************************************************************** -->
								</span>
								<span style="width:4mm"/>
								<!-- BEGIN Part IV Line 22b Items -->
								<b>b</b>  Ending	balance or monthly average 
							</span>
							<span style="width:2mm"/>
							<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>
						</div>
						<div style="float:right">
							<div class="styLNRightNumBox" style="height:4.2mm;">22b</div>
							<div class="styLNAmountBox" style="height:4.2mm;">
								<!--  ** 02/02/2016 WT: Exception, a choice of three items for line 22b*************   -->
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/LoanedMonthlyAverageAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/LoanedMonthlyAverageAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="normalize-space($Form5472Data/LoanedEndingBalanceAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/LoanedEndingBalanceAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/LoanedEndingBalance50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 23 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">23</div>
						<div style="float:left"> Interest paid </div>
						<div style="float:right">
							<span class="styDotLn"> .............................. </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">23</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/InterestPaidAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InterestPaidAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InterestPaid50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 24 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">24</div>
						<div style="float:left"> Premiums paid for insurance or reinsurance </div>
						<div style="float:right">
							<span class="styDotLn"> ..................... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">24</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/InsReinsPremPdAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InsReinsPremPdAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/InsReinsPremPd50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 25 Items -->
					<div style="width:187mm">
						<div class="styLNLeftNumBox">25</div>
						<div style="float:left"> Other amounts paid (see instructions) </div>
						<div style="float:right">
							<span class="styDotLn"> ...................... </span>
							<div class="styLNRightNumBox" style="text-align:left;padding-left:1.5mm;">25</div>
							<div class="styLNAmountBox">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/OtherTransactionsPdAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/OtherTransactionsPdAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/OtherTransactionsPd50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- BEGIN Part IV Line 26 Items -->
					<div class="styBB" style="width:187mm;">
						<div class="styLNLeftNumBox">26</div>
						<div style="float:left">
							<b>Total.</b>
							Combine amounts on lines 14 through 25
						</div>
						<div style="float:right">
							<span class="styDotLn"> ................... </span>
							<div class="styLNRightNumBox" style="border-bottom:0;text-align:left;padding-left:1.5mm;">26</div>
							<div class="styLNAmountBoxNBB">
								<!-- *************************************************************************************** -->
								<xsl:choose>
									<xsl:when test="normalize-space($Form5472Data/TotalTransactionsPdAmt) != ''">
										<xsl:call-template name="PopulateAmount">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TotalTransactionsPdAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/TotalTransactionsPd50000LessCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
								<!-- *************************************************************************************** -->
							</div>
						</div>
					</div>
					<!-- END Part IV Line Items -->
					<!-- BEGIN Part V Title -->
					<div class="styBB" style="width:187mm;height:16mm;border-top:1 solid black">
						<div class="styPartName" style="width:12mm;">Part V</div>
						<div class="styPartDesc" style="width:170mm;">
							Reportable Transactions of a Reporting Corporation That is a Foreign-Owned U.S. DE
							<span class="styNormalText"> (see instructions)</span>
							<br/>
							<span class="styNormalText" style="padding-top:0.5mm;">
								Describe on an attached separate sheet any other transaction as defined by Regulations section 1.482-1(i)(7), such as amounts paid or received in connection with the formation, dissolution, acquisition, and disposition of the entity, including contributions to and distributions from the entity, and check here.
								<img src="{$ImagePath}/5472_Bullet_Lg.gif" alt="Big Right Arrow Bullet"/> 
								<input type="Checkbox" alt="IRS5472ForeignOwnedUSDEReportingCorporationTransaction" style="vertical-align: middle;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnOwnUSDERptgCorpTransInd"/>
										<xsl:with-param name="BackupName">
											IRS5472FrgnOwnUSDERptgCorpTrans
										</xsl:with-param>
									</xsl:call-template>
								</input>
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnOwnUSDERptgCorpTransInd"/>
										<xsl:with-param name="BackupName">
											IRS5472FrgnOwnUSDERptgCorpTrans
										</xsl:with-param>
									</xsl:call-template>
								</label>
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnOwnUSDERptgCorpTransInd"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- END Part V Title -->
					<!-- BEGIN Part VI Title -->
					<div class="styBB" style="width:187mm;height:12mm;border-top:1 solid black">
						<div class="styPartName" style="width:12mm;">Part VI</div>
						<div class="styPartDesc" style="width:170mm">
							Nonmonetary and Less-Than-Full Consideration Transactions Between the Reporting Corporation	and the Foreign Related Party
							<span class="styNormalText"> (see instructions)</span>
							<br/>
							<span class="styNormalText">
								<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/NonmonetaryAndLessThanFullInd"/>
										<xsl:with-param name="BackupName">
											IRS5472AllNonmonetaryAndLessThanFull
										</xsl:with-param>
									</xsl:call-template>
									Describe these transactions on an attached separate sheet and check here.
								</label>
								<img src="{$ImagePath}/5472_Bullet_Lg.gif" alt="Big Right Arrow Bullet"/> 
								<input type="Checkbox" alt="IRS5472NonmonetaryAndLessThanFull" style="vertical-align: middle;">
									<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/NonmonetaryAndLessThanFullInd"/>
										<xsl:with-param name="BackupName">
											IRS5472AllNonmonetaryAndLessThanFull
										</xsl:with-param>
									</xsl:call-template>
								</input>
							</span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5472Data/NonmonetaryAndLessThanFullInd"/>
							</xsl:call-template>
						</div>
					</div>
					<!-- END Part VI Title -->
					<!-- BEGIN Page 1 Footer -->
					<div style="width:187mm; font-size:7pt;  border-top:1 solid black; padding-top:0.5mm">
						<div style="float:left; font-size:8pt">
						<!--	<b>For Paperwork Reduction Act Notice, see instructions.</b>-->
						</div>
						<div style="float:right">
							<!--Cat. No. 49987Y-->
							<span style="width:35mm"/>
							Form
							<b style="font-size:8pt">5472</b>
							(Rev. 12-2018)
						</div>
					</div>
					<div class="pageEnd"/>
					<!-- END Page 1 Footer -->
					<!-- BEGIN Page 2 Page Header -->
					<div style="width:187mm; font-size:7pt;  page-break-before:always; padding-bottom:0.5mm">
						<div style="float:left"> Form 5472 (Rev. 12-2018) </div>
						<div style="float:right">
							Page
							<b style="font-size:8pt">3</b>
						</div>
					</div>
					<!-- END Page 2 Page Header -->
					<!-- BEGIN Part VII Title -->
					<div class="styBB" style="width:187mm;border-top:1 solid black;border-top-width: 2px;">
						<div class="styPartName" style="width:13mm">Part VII</div>
						<div class="styPartDesc">
							Additional Information.
							<span class="styNormalText">All reporting corporations must complete Part VII.</span>
						</div>
					</div>
					<!-- END Part VII Title -->
					<!-- BEGIN Part VII Line 1 Items -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox">1</div>
						<div style="float:left"> Does the reporting corporation import goods from a foreign related party? </div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> .............. </span>
							<div class="styLNDesc" style="clear:none; width: 26mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsForeignRltdPartyInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="5472ImportGoodsForeignRelatedPartyYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsForeignRltdPartyInd"/>
											<xsl:with-param name="BackupName">
												5472ImportGoodsForeignRelatedPartyYes
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsForeignRltdPartyInd"/>
										<xsl:with-param name="BackupName">
											5472ImportGoodsFromFrgnRltdPartyLabelYes
										</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<span style="width:4mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsForeignRltdPartyInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="5472ImportGoodsForeignRelatedPartyNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsForeignRltdPartyInd"/>
											<xsl:with-param name="BackupName">
												5472ImportGoodsForeignRelatedPartyNo
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ImportGoodsForeignRltdPartyInd"/>
										<xsl:with-param name="BackupName">
											5472ImportGoodsFromFrgnRltdPartyLabelNo
										</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</div>
						</div>
					</div>
					<!-- BEGIN Part VII Line 2a Items -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox">2a</div>
						<div style="float:left;padding-top:0.5mm;">
							If "Yes," is the basis or inventory cost of the goods valued at greater than the customs value of the imported goods?
						</div>
						<div style="float:right; margin-right:1mm">
							<div class="styLNDesc" style="float: right; clear:none; width: 26mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGrtrThanCustomsVlInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="5472GoodsCostGreaterThanCustomsValueYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGrtrThanCustomsVlInd"/>
											<xsl:with-param name="BackupName">
												5472GoodsCostGreaterThanCustomsValYes
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGrtrThanCustomsVlInd"/>
										<xsl:with-param name="BackupName">
											5472GoodsCostGreaterThanCustomsValLabelYes
										</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<span style="width:4mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGrtrThanCustomsVlInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="5472GoodsCostGreaterThanCustomsValueNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGrtrThanCustomsVlInd"/>
											<xsl:with-param name="BackupName">
												5472GoodsCostGreaterThanCustomsValNo
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGrtrThanCustomsVlInd"/>
										<xsl:with-param name="BackupName">
											5472GoodsCostGreaterThanCustomsValLabelNo
										</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</div>
						</div>
					</div>
					<!-- BEGIN Part VII Line 2b Items -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm">b</div>
						<div style="float:left;padding-top:0.5mm;"> If "Yes," attach a statement explaining the reason or reasons for such difference. </div>
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form5472Data/GoodsCostGrtrThanCustomsVlInd"/>
						</xsl:call-template>
					</div>
					<!-- BEGIN Part VII Line 2c Items -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox" style="padding-left:2.5mm">c</div>
						<div style="float:left;padding-top:0.5mm;"> 
							If the answers to questions 1 and 2a are "Yes," were the documents used to support this treatment of the imported goods in existence and
						</div>
					</div>
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox" style="padding-left:4mm"/>
						<div style="float:left"> available in the United States at the time of filing Form 5472? </div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> ...................</span>
							<div class="styLNDesc" style="clear:none; width: 26mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocumentsExstUSInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="5472SupportingDocumentsExistUSYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocumentsExstUSInd"/>
											<xsl:with-param name="BackupName">
												5472SupportingDocInExistenceInUSYes
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocumentsExstUSInd"/>
										<xsl:with-param name="BackupName">
											5472SupportingDocInExistenceInUSLabelYes
										</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<span style="width:4mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocumentsExstUSInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="5472SupportingDocumentsExistUSNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocumentsExstUSInd"/>
											<xsl:with-param name="BackupName">
												5472SupportingDocInExistenceInUSNo
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/SupportingDocumentsExstUSInd"/>
										<xsl:with-param name="BackupName">
											5472SupportingDocInExistenceInUSLabelNo
										</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</div>
						</div>
					</div>
					<!-- BEGIN Part VII Line 3 Items -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox">3</div>
						<div style="float:left"> During the tax year, was the foreign parent corporation a participant in any cost sharing arrangement? </div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> ..... </span>
							<div class="styLNDesc" style="clear:none; width: 26mm">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntCorpPartcpCostShrInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="5472ForeignPartnerCorporationParticipantCostSharedYes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntCorpPartcpCostShrInd"/>
											<xsl:with-param name="BackupName">
												5472ForeignPartnerCorporationParticipantCostSharedYes
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntCorpPartcpCostShrInd"/>
										<xsl:with-param name="BackupName">
											5472ForeignPartnerCorporationParticipantCostSharedLabelYes
										</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<span style="width:4mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntCorpPartcpCostShrInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="5472ForeignPartnerCorporationParticipantCostSharedNo" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntCorpPartcpCostShrInd"/>
											<xsl:with-param name="BackupName">
												5472ForeignPartnerCorporationParticipantCostSharedNo
											</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntCorpPartcpCostShrInd"/>
										<xsl:with-param name="BackupName">
											5472ForeignPartnerCorporationParticipantCostSharedLabelNo
										</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</div>
						</div>
					</div>
					<!-- BEGIN Part VII Line 4 Items -->
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox">4</div>
						<div style="float:left"> During the course of the tax year, did the foreign parent corporation become a participant in any cost sharing </div>
					</div>
					<div style="width:187mm;padding-bottom:1mm; ">
						<div class="styLNLeftNumBox" style="padding-left:4mm"/>
						<div style="float:left"> arrangement ? </div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> ................................. </span>
							<div class="styLNDesc" style="clear:none; width: 26mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntBecamePartcpCostShrInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Part VII Line 4 Foreign Partner Became Participant Cost Sharing Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntBecamePartcpCostShrInd"/>
											<xsl:with-param name="BackupName">PartVIILine4ForeignPartnerBecameParticipantCostSharingYes</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntBecamePartcpCostShrInd"/>
										<xsl:with-param name="BackupName">PartVIILine4ForeignPartnerBecameParticipantCostSharingYesLabel</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<span style="width:4mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntBecamePartcpCostShrInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Part VII Line 4 Foreign Partner Became Participant Cost Sharing No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntBecamePartcpCostShrInd"/>
											<xsl:with-param name="BackupName">PartVIILine4ForeignPartnerBecameParticipantCostSharingNo</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FrgnPrntBecamePartcpCostShrInd"/>
										<xsl:with-param name="BackupName">PartVIILine4ForeignPartnerBecameParticipantCostSharingNoLabel</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</div>
						</div>
					</div>
					<!-- BEGIN Part VII Line 5a Items -->
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox">5a</div>
						<div style="float:left"> 
							During the tax year, did the reporting corporation pay or accrue any interest or royalty, to the related party, for which the deduction is not 
						</div>
					</div>
					<div style="width:187mm;padding-bottom:1mm; ">
						<div class="styLNLeftNumBox" style="padding-left:4mm"/>
						<div style="float:left"> allowed under section 267A? See instructions</div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> ....................... </span>
							<div class="styLNDesc" style="clear:none; width: 26mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/NondedIntRoyaltyUndSect267AInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Part VII Line 4 Foreign Partner Became Participant Cost Sharing Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/NondedIntRoyaltyUndSect267AInd"/>
											<xsl:with-param name="BackupName">PartVIILine5aNondedIntRoyaltyUndSect267AIndYes</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/NondedIntRoyaltyUndSect267AInd"/>
										<xsl:with-param name="BackupName">PartVIILine5aNondedIntRoyaltyUndSect267AIndYesLabel</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<span style="width:4mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/NondedIntRoyaltyUndSect267AInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Part VII Line 4 Foreign Partner Became Participant Cost Sharing No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/NondedIntRoyaltyUndSect267AInd"/>
											<xsl:with-param name="BackupName">PartVIILine5aNondedIntRoyaltyUndSect267AIndNo</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/NondedIntRoyaltyUndSect267AInd"/>
										<xsl:with-param name="BackupName">PartVIILine5aNondedIntRoyaltyUndSect267AIndNoLabel</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</div>
						</div>
					</div>					
					<!-- BEGIN Part VII Line 5b Items -->
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox">5b</div>
						<div style="float:left">  If “Yes,” enter the total amount (see instructions) </div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> ..................... </span>
							<span class="styLNDesc" style="clear:none; width:33mm;">
								$
								<span class="styFixedUnderline" style="width:30mm;text-align:right;float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5472Data/NondedIntRoyaltyUndSect267AAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<!-- BEGIN Part VII Line 6a Items -->
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox">6a</div>
						<div style="float:left"> 
							Does the reporting corporation claim a foreign derived intangible income (FDII) deduction (under section 250) with 
							respect to amounts 
						</div>
					</div>
					<div style="width:187mm;padding-bottom:1mm; ">
						<div class="styLNLeftNumBox" style="padding-left:4mm"/>
						<div style="float:left"> listed in Part IV?  </div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> ................................. </span>
							<div class="styLNDesc" style="clear:none; width: 26mm;">
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FDIIBenefitsClaimInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Part VII Line 6a FDII Benefits Claim Indicator Yes" class="styCkbox">
										<xsl:call-template name="PopulateYesCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/FDIIBenefitsClaimInd"/>
											<xsl:with-param name="BackupName">PartVIILine6aFDIIBenefitsClaimIndYes</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FDIIBenefitsClaimInd"/>
										<xsl:with-param name="BackupName">PartVIILine6aFDIIBenefitsClaimIndYesLabel</xsl:with-param>
									</xsl:call-template>
									Yes
								</label>
								<span style="width:4mm"/>
								<span>
									<xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FDIIBenefitsClaimInd"/>
									</xsl:call-template>
									<input type="checkbox" alt="Part VII Line 6a FDII Benefits Claim Indicator No" class="styCkbox">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode" select="$Form5472Data/FDIIBenefitsClaimInd"/>
											<xsl:with-param name="BackupName">PartVIILine6aFDIIBenefitsClaimIndNo</xsl:with-param>
										</xsl:call-template>
									</input>
								</span>
								<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$Form5472Data/FDIIBenefitsClaimInd"/>
										<xsl:with-param name="BackupName">PartVIILine6aFDIIBenefitsClaimIndNoLabel</xsl:with-param>
									</xsl:call-template>
									No
								</label>
							</div>
						</div>
					</div>
					<!-- BEGIN Part VII Line 6b Items -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox">6b</div>
						<div class="styLNDesc" style="float:left;padding-top:0.5mm;width:179mm;height:6.5mm;"> 
							If "Yes," enter the amount of gross income derived from sales, leases, exchanges, or other dispositions (but not licenses) of property to the
							foreign related party that the reporting corporation included in its computation of foreign-derived deduction eligible income (FDDEI)					
						</div>
					</div>
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm"/>
						<div style="float:left">(see instructions)</div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> ............................... </span>
							<span class="styLNDesc" style="clear:none; width:33mm;">
								$
								<span class="styFixedUnderline" style="width:30mm;text-align:right;float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5472Data/NotLicensePropertyGrossIncmAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<br/>
					<!-- BEGIN Part VII Line 6c Items -->
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox">6c</div>
						<div style="float:left"> 
							If "Yes," enter the amount of gross income derived from a license of property to the foreign related party 
							that the reporting corporation included 
						</div>
					</div>
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm"/>
						<div style="float:left">in its computation of FDDEI  (see instructions)</div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> ...................... </span>
							<span class="styLNDesc" style="clear:none; width:33mm;">
								$
								<span class="styFixedUnderline" style="width:30mm;text-align:right;float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5472Data/LicensePropertyGrossIncomeAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<br/>					
					<!-- BEGIN Part VII Line 6d Items -->
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox">6d</div>
						<div style="float:left"> 
							If "Yes," enter the amount of gross income derived from services provided to the foreign related party that 
							the reporting corporation included 
						</div>
					</div>
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox" style="padding-left:4mm"/>
						<div style="float:left">in its computation of FDDEI  (see instructions)</div>
						<div style="float:right; margin-right:1mm">
							<span class="styDotLn"> ...................... </span>
							<span class="styLNDesc" style="clear:none; width:33mm;">
								$
								<span style="width:30mm;text-align:right;float:right;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form5472Data/ForeignServiceGrossIncomeAmt"/>
									</xsl:call-template>
								</span>
							</span>
						</div>
					</div>
					<br/>
					<!-- BEGIN Part VIII Title -->
					<div class="styBB" style="width:187mm;border-top:1 solid black;border-top-width: 2px;">
						<div class="styPartName" style="width:13mm">Part VIII</div>
						<div class="styPartDesc">
							Base Erosion Payments and Base Erosion Tax Benefits Under Section 59A (see instructions) 
							<span class="styNormalText"></span>
						</div>
					</div>
					<!-- END Part VIII Title -->
					<!-- BEGIN Part VIII Line 1 Items -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox">1</div>
						<div class="styLNDesc" style="width:144mm; float:left;"> Amounts defined as base erosion payments under section 59A(d) 
							<span class="styDotLn" style="float:right;margin-right:1mm; "> ...............</span>
						</div>
						<div style="float:right;">
							<span style="float:left;"> $ <span style="width:.5mm;"/></span>				
							<span class="styFixedUnderline" style="width:32mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5472Data/BaseErosionPaymentAmt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- BEGIN Part VIII Line 2 Items -->
					<div style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox">2</div>
						<div class="styLNDesc" style="width:144mm; float:left;"> Amount of base erosion tax benefits under section 59A(c)(2) 
							<span class="styDotLn" style="float:right;margin-right:1mm; "> ................. </span>
						</div>
						<div style="float:right; ">
							<span style="float:left;"> $ <span style="width:.5mm;"/></span>	
							<span class="styFixedUnderline" style="width:32mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5472Data/BaseErosionTaxBenefitAmt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- BEGIN Part VIII Line 3 Items -->
					<div style="width:187mm; padding-top:1mm">
						<div class="styLNLeftNumBox">3</div>
						<div class="styLNDesc" style="width:144mm; float:left;"> Amount of total qualified derivative payments as described in section 59A(h) made by the reporting corporation. 
						</div>
						<div style="float:right; ">
							<span style="float:left;"> $ <span style="width:.5mm;"/></span>	
							<span class="styFixedUnderline" style="width:32mm;text-align:right;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5472Data/TotalDerivativePaymentsAmt"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- BEGIN Part VIII Line 4 Items -->
					<div class="styTBB" style="width:187mm; padding-top:1mm;">
						<div class="styLNLeftNumBox" style="padding-top:1mm;">4</div>
						<div style="float:left; padding-bottom:.5mm; "> 
							<!--per UWR 214855, line will be changed to "Reserved for future use" until final guidance-->
							<!--List on an attached separate sheet any qualified derivative payment as described in section 59A(h),  -->
							Reserved for future use
							<span class="styNormalText">
								<!--<label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form5472Data/QualifiedDerivativePaymentInd"/>
										<xsl:with-param name="BackupName">QualifiedDerivativePaymentIndLabel</xsl:with-param>
									</xsl:call-template>
									and check here
								</label>-->  
								<img src="{$ImagePath}/5472_Bullet_Sm.gif" alt="Small Right Arrow Bullet"/>    
								<input type="checkbox" alt="Part VII Line 4 Qualified Derivative Payment Indicator" class="styCkbox" disabled="disabled">
									<!--per UWR 214855, checkbox is disabled until final guidance-->
									<!--<xsl:call-template name="PopulateCheckbox">
										<xsl:with-param name="TargetNode" select="$Form5472Data/QualifiedDerivativePaymentInd"/>
										<xsl:with-param name="BackupName">QualifiedDerivativePaymentInd</xsl:with-param>
									</xsl:call-template>-->
								</input>
							</span>
						</div>
						<div style="float:right; padding-top:1mm; ">								
							<!--per UWR 214855, line is reserved until final guidance-->
							<!--<span style="float:left;"> $ <span style="width:.5mm;"/></span>	
							<span style="width:32mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form5472Data/QualifiedDerivativePaymentInd"/>
								</xsl:call-template>
							</span>-->
						</div>
					</div>
					<!-- END Part VIII Line Items -->
					<div style="float:right">
						<span style="width:35mm"/>
							Form
							<b style="font-size:8pt">5472</b>
							(Rev. 12-2018)
					</div>
					<p style="page-break-before:always"/>
					<div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
						<div class="styLeftOverTitle"> Additional Data </div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form5472Data"/>
						</xsl:call-template>
					</table>
					<!-- Separated Print of Part II, Lines 1a-e and 2a-e -->
					<xsl:if test="(count($Form5472Data/Direct25PctFrgnShareholderInfo) &gt; 2) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 5472, Part II, Lines 1a-e and Lines 2a-e - 25% Direct Foreign Shareholder:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:3mm;"/>
									<th class="styDepTblCell" scope="col" style="width:55mm;">(a) Name and Address of Direct 25% Foreign Shareholder</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;">(b1) U.S. Identifying Number, if any </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;">(b2) Reference ID Number </th>
									<th class="styDepTblCell" scope="col" style="width:30mm;">(b3) FTIN, if any (see instructions) </th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-size:6.5pt;">(c) Principal Country(ies) Where Business is Conducted</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-size:6.5pt;">(d) Country of Citizenship, Organization, or Incorporation</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-size:6.5pt;">(e) Country(ies) Under Whose Laws the Direct 25% Foreign Shareholder Files an Income Tax Return as a Resident</th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5472Data/Direct25PctFrgnShareholderInfo">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styDepTblCell" style="text-align:center;">
											<xsl:value-of select="position()"/>
										</td>
										<!-- Second Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="normalize-space(ShareholderName/BusinessNameLine2Txt)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="USAddress">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(USAddress/AddressLine2Txt)!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
													</xsl:call-template>,
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
													</xsl:call-template> 
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(ForeignAddress/AddressLine2Txt)!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
													</xsl:call-template>
													<xsl:if test="(normalize-space(ForeignAddress/CityNm) != '') and (normalize-space(ForeignAddress/ProvinceOrStateNm) != '' or normalize-space(ForeignAddress/ForeignPostalCd) != '')">,
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
													</xsl:call-template>   
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(ForeignAddress/CityNm) != '' or normalize-space(ForeignAddress/ProvinceOrStateNm) != '' or normalize-space(ForeignAddress/ForeignPostalCd) != ''">
														<br/>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Third Column -->									
										<td class="styDepTblCell" style="text-align:center;">
											<xsl:choose>
												<xsl:when test="EIN !=''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="MissingEINReasonCd !=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Fourth Column -->	
										<td class="styDepTblCell" style="text-align:left;font-size:6.5pt;">
											<div style="width:30mm;word-wrap:break-word;display:block;">
												<xsl:for-each select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum">
													<xsl:if test="position()!= 1">,
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="."/>
													</xsl:call-template>
												</xsl:for-each>
											</div>	
										</td>
										<!-- Fifth Column -->	
										<td class="styDepTblCell" style="text-align:left;font-size:6.5pt;">
											<div style="width:30mm;word-wrap:break-word;display:block;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FTIN"/>
											</xsl:call-template>
											</div>
										</td>
										<!-- Sixth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:for-each select="PrincipalPlaceOfBusCountryCd">
												<xsl:if test="position()!= 1">,
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</td>
										<!-- Seventh Column -->
										<td class="styDepTblCell" style="text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CtznOrgIncorporationCountryCd"/>
											</xsl:call-template>
										</td>
										<!-- Eighth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:for-each select="FilesIncmTaxResidentCountryCd">
												<xsl:if test="position()!= 1">,
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
					</xsl:if>
					<br/>
					<!-- Separated Print of Part II, Lines 3a-e and 4a-e -->
					<xsl:if test="(count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &gt; 2) and ($Print = $Separated)">
						<span class="styRepeatingDataTitle">Form 5472, Part II, Lines 3a-e and Lines 4a-e - 25% Indirect Foreign Shareholder:</span>
						<table class="styDepTbl" style="font-size:7pt;">
							<thead class="styTableThead">
								<!-- Label the Column Headers -->
								<tr class="styDepTblHdr">
									<th class="styDepTblCell" scope="col" style="width:3mm;"/>
									<th class="styDepTblCell" scope="col" style="width:59mm;">(a) Name and Address of Ultimate Indirect 25% Foreign Shareholder</th>
									<th class="styDepTblCell" scope="col" style="width:25mm;">(b) U.S. Identifying Number, if any </th>
									<th class="styDepTblCell" scope="col" style="width:25mm;">(b2) Reference ID Number </th>
									<th class="styDepTblCell" scope="col" style="width:30mm;">(b3) FTIN, if any (see instructions) </th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-size:6.5pt;">(c) Principal Country(ies) Where Business is Conducted</th>
									<th class="styDepTblCell" scope="col" style="width:15mm;font-size:6.5pt;">(d) Country of Citizenship, Organization, or Incorporation</th>
									<th class="styDepTblCell" scope="col" style="width:30mm;font-size:6.5pt;">(e) Country(ies) Under Whose Laws the Ultimate Indirect 25% Foreign Shareholder Files an Income Tax Return as a Resident </th>
								</tr>
							</thead>
							<tfoot/>
							<tbody>
								<xsl:for-each select="$Form5472Data/UltimateIndr25PctFrgnShrInfo">
									<tr>
										<!-- Define background colors to the rows -->
										<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
										<!-- First Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<!--xsl:if test="position() &lt; 3" -->
											<xsl:value-of select="position()"/>
											<!--/xsl:if -->
											<br/>
											<xsl:call-template name="SetFormLinkInline">
												<xsl:with-param name="TargetNode" select="."/>
											</xsl:call-template>
										</td>
										<!-- Second Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine1Txt"/>
											</xsl:call-template>
											<xsl:if test="normalize-space(ShareholderName/BusinessNameLine2Txt)!=''">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="ShareholderName/BusinessNameLine2Txt"/>
												</xsl:call-template>
											</xsl:if>
											<xsl:choose>
												<xsl:when test="USAddress">
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(USAddress/AddressLine2Txt)!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
													</xsl:call-template>,
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
													</xsl:call-template> 
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(ForeignAddress/AddressLine2Txt)!=''">
														<br/>
														<xsl:call-template name="PopulateText">
															<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
														</xsl:call-template>
													</xsl:if>
													<br/>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
													</xsl:call-template>
													<xsl:if test="(normalize-space(ForeignAddress/CityNm) != '') and (normalize-space(ForeignAddress/ProvinceOrStateNm) != '' or normalize-space(ForeignAddress/ForeignPostalCd) != '')">,
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
													</xsl:call-template>   
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
													</xsl:call-template>
													<xsl:if test="normalize-space(ForeignAddress/CityNm) != '' or normalize-space(ForeignAddress/ProvinceOrStateNm) != '' or normalize-space(ForeignAddress/ForeignPostalCd) != ''">
														<br/>
													</xsl:if>
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Third Column -->
										<td class="styDepTblCell" style="text-align:center;">
											<xsl:choose>
												<xsl:when test="EIN !=''">
													<xsl:call-template name="PopulateEIN">
														<xsl:with-param name="TargetNode" select="EIN"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:when test="MissingEINReasonCd !=''">
													<xsl:call-template name="PopulateText">
														<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<xsl:call-template name="PopulateSSN">
														<xsl:with-param name="TargetNode" select="SSN"/>
													</xsl:call-template>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<!-- Fourth Column -->
										<td class="styDepTblCell" style="text-align:left;font-size:6.5pt;">
											<div style="width:30mm;word-wrap:break-word;display:block;">
											<xsl:for-each select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum">
												<xsl:if test="position()!= 1">,
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:for-each>
											</div>
										</td>
										<!-- Fifth Column -->	
										<td class="styDepTblCell" style="text-align:left;font-size:6.5pt;">
											<div style="width:30mm;word-wrap:break-word;display:block;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="FTIN"/>
											</xsl:call-template>
											</div>
										</td>
										<!-- Sixth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:for-each select="PrincipalPlaceOfBusCountryCd">
												<xsl:if test="position()!= 1">,
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</td>
										<!-- Seventh Column -->
										<td class="styDepTblCell" style="text-align:center;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="CtznOrgIncorporationCountryCd"/>
											</xsl:call-template>
										</td>
										<!-- Eighth Column -->
										<td class="styDepTblCell" style="text-align:left;">
											<xsl:for-each select="FilesIncmTaxResidentCountryCd">
												<xsl:if test="position()!= 1">,
												</xsl:if>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="."/>
												</xsl:call-template>
											</xsl:for-each>
										</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<!-- /Separated Repeating Data Table Line D -->
						<!-- Start Separate Data for Line 1b(2) -->
						<xsl:if test="(($Print = $Separated) and (count($Form5472Data/RelatedPartyInfo/ForeignEntityIdentificationGrp) &gt; 1))">
							<br/>
							<span class="styRepeatingDataTitle">
								<br/>Form 5472, Part III, Line 1b(2) - Reference ID number (see instructions):
					    </span>
							<table class="styDepTbl" style="font-size:7pt;">
								<tbody>
									<xsl:for-each select="$Form5472Data/RelatedPartyInfo/ForeignEntityIdentificationGrp">
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
					</xsl:if>
					<br/>
				</form>
			</body>
		</html>
	</xsl:template>
	<!--Part II - Line 1-->
	<xsl:template name="p2DirectTemplate">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:param name="p2DirectCount"/>
		<xsl:if test="($index &lt;= $max) or ($index &lt;=2)">
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<th scope="row" valign="top" align="center" style="width:5.5mm;">
						<xsl:if test="$index &lt; 3">
							<xsl:value-of select="$index"/>
						</xsl:if>a
					</th>
					<th scope="col" align="left" style="font-weight:normal; ">
						Name and address of direct 25% foreign shareholder 
					</th>
				</tr>
				<tr style="height:6mm;">
					<td rowspan="4">
					</td>
					<td rowspan="4" style="padding-left:0.5mm;" valign="top">
						<xsl:if test="($Print = $Separated) and (count($Form5472Data/Direct25PctFrgnShareholderInfo) &gt; 2) and ($index = 1)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ShareholderName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ShareholderName/BusinessNameLine2Txt)!=''">
								<span style="width:2mm;"></span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ShareholderName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<br/>
							<xsl:choose>
								<xsl:when test="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/AddressLine2Txt)!=''">
										<span style="width:2mm;"></span>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width:2mm;"></span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/CityNm"/>
									</xsl:call-template>,
									<span style="width:1mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/StateAbbreviationCd"/>
									</xsl:call-template> 
									<span style="width:0.5mm;"/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/USAddress/ZIPCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/AddressLine2Txt)!=''">
										<span style="width:2mm;"/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width:2mm;"></span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/CityNm"/>
									</xsl:call-template>
									<xsl:if test="(normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/CityNm) != '') and (normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/ForeignPostalCd) != '')">,
									</xsl:if>
									<span style="width:1mm;"></span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>   
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/CityNm) != '' or normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/ForeignPostalCd) != ''">
									<span style="width:1mm;"></span>
									</xsl:if>
									<span style="width:1mm;"></span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignAddress/CountryCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</td>
				</tr>
			</table>
			<!-- Part II, line 1b(1)-(3) -->
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<thead class="styTableThead">
					<tr>
						<th scope="col" align="left" style="font-weight:normal;width:40mm; border-right:1px solid black;padding-left:1.5mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index"/>
								</xsl:if>b(1)	
							</b>						
							U.S. identifying number, 
							<span style="padding-left:7mm;">if any</span><br/><br/>
							<span style="padding-left:5mm;"> 
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:choose>
									<xsl:when test="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/EIN !=''">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/MissingEINReasonCd !=''">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/MissingEINReasonCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/SSN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							</span>
						</th>
						<th scope="col" align="left" style="font-weight:normal;width:71mm; border-right:1px solid black;padding-left:1mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index"/>
								</xsl:if><span style="font-size:7pt;">b(2)</span>    	
							</b>
							<!--********Font size has to be reduced to 6.5 due to the maxium data size of 50********-->						
							Reference ID number (see instructions)<br/><br/><br/>
							<span style="padding-left:6mm; font-size:6.5pt;">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:for-each select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/ForeignEntityIdentificationGrp">
									<xsl:if test="position()!= 1">,
									</xsl:if>
									<xsl:if test="(position() mod  8 = 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
								</xsl:for-each>
							</xsl:if>
							</span>
						</th>
						<th scope="col" align="left" style="font-weight:normal;padding-left:1mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index"/>
								</xsl:if><span style="font-size:7pt;">b(3)</span> 	
							</b>			
							<xsl:choose>
							<!--********Font size has to be reduced to 6.5 due to the maxium data size of 50********-->
								<xsl:when test="$index = 1">
									Foreign taxpayer identification number (FTIN), if any (see instructions)<br/><br/>
								</xsl:when>
								<xsl:otherwise>
									FTIN, if any (see instructions)<br/><br/><br/>
								</xsl:otherwise>
							</xsl:choose>
							<span style="padding-left:7mm;font-size:6.5pt;">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/FTIN"/>
								</xsl:call-template>
							</xsl:if>
							</span>			
						</th>
					</tr>
				</thead>
			</table>
			<!-- Part II, line 1c - 1e-->
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<thead class="styTableThead">
					<tr>
						<th scope="col" align="left" style="font-weight:normal;width:40mm; border-right:1px solid black;padding-left:1.5mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index"/>
								</xsl:if>c 
							</b>						
							Principal country(ies) <br/>
							<span style="padding-left:4mm;">
							where business is conducted 
							</span>
							<span style="padding-left:4mm;">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:for-each select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/PrincipalPlaceOfBusCountryCd">
									<xsl:if test="position()!= 1">,
									</xsl:if>
									<xsl:if test="(position() mod 5 = 1) and (position()!= 1)">
										<br/><span style="width:1.5mm"></span>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</xsl:if>
							</span>
						</th>
						<th scope="col" align="left" style="font-weight:normal;width:71mm; border-right:1px solid black;padding-left:1mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index"/>
								</xsl:if>d	
							</b>						
							Country of citizenship, organization, or <br/> 
							<span style="padding-left:4mm;">
							incorporation
							</span><br/><br/>
							<span style="padding-left:3.5mm;">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/CtznOrgIncorporationCountryCd"/>
								</xsl:call-template>
							</xsl:if>
							</span>
						</th>
						<th scope="col" align="left" style="font-weight:normal;padding-left:1mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index"/>
								</xsl:if>e	
							</b>						
							Country(ies) under whose laws the direct 25%  <br/> 
							<span style="padding-left:4mm;">
								foreign shareholder files an income tax return as a resident 
							</span>
							<span style="padding-left:3.5mm;">
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:for-each select="$Form5472Data/Direct25PctFrgnShareholderInfo[$index]/FilesIncmTaxResidentCountryCd">
									<xsl:if test="position()!= 1">
										,
									</xsl:if>
									<xsl:if test="(position() mod 15 = 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="."/>
									</xsl:call-template>
								</xsl:for-each>
							</xsl:if>
							</span>
						</th>
					</tr>
				</thead>
				<!--<tbody>
					<tr style="height:4.5mm;">
						<td style="border-right:1px solid black;padding-left:4mm;"> 
							
						</td>
						<td style="border-right:1px solid black;"> 
							
						</td>
						<td style="padding-left:3.5mm;"> 
							
						</td>
					</tr>
				</tbody>-->
			</table>
			<xsl:choose>
				<xsl:when test="($Print = $Separated) and (count($Form5472Data/Direct25PctFrgnShareholderInfo) &gt; 2) and ($index = 2)">
					<xsl:call-template name="p2DirectTemplate">
						<xsl:with-param name="index" select="$max+1"/>
						<xsl:with-param name="max" select="$max"/>
						<xsl:with-param name="p2DirectCount" select="$p2DirectCount"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="p2DirectTemplate">
						<xsl:with-param name="index" select="$index + 1"/>
						<xsl:with-param name="max" select="$max"/>
						<xsl:with-param name="p2DirectCount" select="$p2DirectCount"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<!-- Part II, line 3a and 4a-->
	<xsl:template name="p2UltimateTemplate">
		<xsl:param name="index" select="1"/>
		<xsl:param name="max"/>
		<xsl:param name="p2UltimateCount"/>
		<xsl:if test="($index &lt;= $max) or ($index &lt;=2)">
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<tr>
					<th scope="row" valign="top" style="padding-left:1.5mm;" align="left">
						<xsl:if test="$index &lt; 3">
							<xsl:value-of select="$index + 2"/>
						</xsl:if>a <span style="font-weight:normal">
							Name and address of ultimate indirect 25% foreign shareholder
						</span> 
						<!--Warning:a need to be after the closing if otherwise it will introduce a line break between 3 and a plus 4 and a-->
					</th>
				</tr>
				<tr style="height:7mm;border-bottom:1px solid black;">
					<td rowspan="4" style="padding-left:5.5mm;" valign="top">
						<xsl:if test="($Print = $Separated) and (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &gt; 2) and ($index = 1)">
							<xsl:call-template name="PopulateAdditionalDataTableMessage">
								<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ShareholderName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ShareholderName/BusinessNameLine2Txt)!=''">
								<span style="width:1mm;"></span>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ShareholderName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
							<br/>
							<xsl:choose>
								<xsl:when test="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/AddressLine2Txt)!=''">
										<span style="width:2m;"></span>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width:1mm;"></span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/CityNm"/>
									</xsl:call-template>
									,<span style="width:1mm;"></span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/StateAbbreviationCd"/>
									</xsl:call-template> 
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/USAddress/ZIPCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/AddressLine2Txt)!=''">
										<span style="width:2mm;"></span>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<span style="width:1mm;"></span>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/CityNm"/>
									</xsl:call-template>
									<xsl:if test="(normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/CityNm) != '') and (normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/ForeignPostalCd) != '')">
										,
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/ProvinceOrStateNm"/>
									</xsl:call-template>  
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/ForeignPostalCd"/>
									</xsl:call-template>
									<xsl:if test="normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/CityNm) != '' or normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/ProvinceOrStateNm) != '' or normalize-space($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/ForeignPostalCd) != ''">
									<span style="width:1mm;"></span>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignAddress/CountryCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						<span style="width:1mm;"></span>
						<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]"/>
							</xsl:call-template>
						</xsl:if>
					</td>
				</tr>
			</table>
			<!-- Part II, line 3b(1)-(3) -->
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<thead class="styTableThead">
					<tr>
						<th scope="col" align="left" style="font-weight:normal;width:40mm; border-right:1px solid black;padding-left:1.5mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index + 2"/>
								</xsl:if>b(1)	
							</b>						
							U.S. identifying number, 
							<span style="padding-left:7mm;">if any</span>
							<span style="padding-left:7mm;"> 
						<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
							<xsl:choose>
								<xsl:when test="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/MissingEINReasonCd !=''">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/EIN !=''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/SSN"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
						</span>
						</th>
						<th scope="col" align="left" style="font-weight:normal;width:71mm; border-right:1px solid black;padding-left:1mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index + 2"/>
								</xsl:if><span style="font-size:7pt;">b(2)</span>  
							</b>						
							Reference ID number (see <br/> 
							<span style="padding-left:7.5mm;">
								instructions)
							</span><br/>
							<!--********Font size has to be reduced to 6.5 due to the maxium data size of 50********-->
						<span style="padding-left:6mm;font-size:6.5pt;"> 
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/Direct25PctFrgnShareholderInfo) &lt; 3)">
								<xsl:for-each select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/ForeignEntityIdentificationGrp">
									<xsl:if test="position()!= 1">,
									</xsl:if>
									<xsl:if test="(position() mod  8 = 1) and (position()!= 1)">
										<br/>
									</xsl:if>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
								</xsl:for-each>
							</xsl:if>
							</span>
						</th>
						<th scope="col" align="left" style="font-weight:normal;padding-left:1mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index + 2"/>
								</xsl:if><span style="font-size:7pt;">b(3)</span>  
							</b>						
							FTIN, if any (see instructions)<br/><br/>
							<!--********Font size has to be reduced to 6.5 due to the maxium data size of 50********-->
						<span style="padding-left:7mm;font-size:6.5pt;"> 
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/FTIN"/>
								</xsl:call-template>
							</xsl:if>
							</span>
						</th>						
					</tr>
				</thead>				
			</table>
			<!-- Part II, line 3c-e -->
			<table class="styIRS5472Table" cellspacing="0" cellpadding="0" border="0">
				<thead class="styTableThead">
					<tr>
						<th scope="col" align="left" style="font-weight:normal;width:40mm; border-right:1px solid black;padding-left:1.5mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index + 2"/>
								</xsl:if>c	
							</b>						
							Principal country(ies)
							<br/>
							<span style="width:3mm;">
							</span>
							where business is 							
							<br/>
							<span style="width:3mm;">
							</span>
							conducted
							<span style="padding-left:3.5mm;"> 
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
									<xsl:attribute name="id"><xsl:value-of select="concat('partII3cTPctn', $index)"/></xsl:attribute>
									<xsl:if test="count($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/PrincipalPlaceOfBusCountryCd) &gt; 12">
										<xsl:call-template name="SetInitialState"/>
									</xsl:if>
									<xsl:variable name="breakPnt2">
										<xsl:choose>
											<xsl:when test="count($Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/PrincipalPlaceOfBusCountryCd) &gt; 12">
												<xsl:value-of select="5"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="5"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:for-each select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/PrincipalPlaceOfBusCountryCd">
										<xsl:if test="position()!= 1">,
										</xsl:if>
										<xsl:if test="(position() mod $breakPnt2 = 1) and (position()!= 1)">
											<br/><span style="width:1.5mm;"></span>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</xsl:for-each>
							</xsl:if>
						</span>
						</th>
						<th scope="col" align="left" style="font-weight:normal;width:71mm; border-right:1px solid black;padding-left:1mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index + 2"/>
								</xsl:if>d	
							</b>						
							Country of citizenship, organization, or 
							<br/>
							<span style="padding-left:4mm;">
							incorporation
							</span><br/><br/>
							<span style="padding-left:3.5mm;"> 
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/CtznOrgIncorporationCountryCd"/>
								</xsl:call-template>
							</xsl:if>							
						</span>
						</th>
						<th scope="col" align="left" style="font-weight:normal;padding-left:1mm;" valign="top">
							<b>
								<xsl:if test="$index &lt; 3">
									<xsl:value-of select="$index + 2"/>
								</xsl:if>e
							</b>						
							Country(ies) under whose laws the ultimate indirect
							<br/>
							<span style="padding-left:4mm;">
							25% foreign shareholder files an income tax return as a resident
							</span>
							<span style="padding-left:3.5mm;"> 
							<xsl:if test="($Print != $Separated) or (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &lt; 3)">
									<xsl:for-each select="$Form5472Data/UltimateIndr25PctFrgnShrInfo[$index]/FilesIncmTaxResidentCountryCd">
										<xsl:if test="position()!= 1">
											,
										</xsl:if>
										<xsl:if test="(position() mod 10 = 1) and (position()!= 1)">
											<br/>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="."/>
										</xsl:call-template>
									</xsl:for-each>
							</xsl:if>
						</span>
						</th>
					</tr>
				</thead>				
			</table>
			<xsl:choose>
				<xsl:when test="($Print = $Separated) and (count($Form5472Data/UltimateIndr25PctFrgnShrInfo) &gt; 2) and ($index = 2)">
					<xsl:call-template name="p2UltimateTemplate">
						<xsl:with-param name="index" select="$max+1"/>
						<xsl:with-param name="max" select="$max"/>
						<xsl:with-param name="p2UltimateCount" select="$p2UltimateCount"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="p2UltimateTemplate">
						<xsl:with-param name="index" select="$index + 1"/>
						<xsl:with-param name="max" select="$max"/>
						<xsl:with-param name="p2UltimateCount" select="$p2UltimateCount"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>