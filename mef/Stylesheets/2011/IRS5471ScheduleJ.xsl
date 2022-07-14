<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS5471ScheduleJStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="IRS5471ScheduleJData" select="$RtnDoc/IRS5471ScheduleJ"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($IRS5471ScheduleJData)"/>
					</xsl:call-template>
				</title>
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<meta http-equiv="Cache-Control" content="private"/>
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="IRS Schedule J (Form 5471)"/>
				<META name="GENERATOR" content="IBM WebSphere Studio"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<!-- Form 5471ScheduleJ CSS Styles are located in the template called below -->
						<xsl:call-template name="IRS5471ScheduleJStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="IRS5471ScheduleJ">
					<!--   BEGIN WARNING LINE  -->
					<xsl:call-template name="DocumentHeaderLandscape"/>
					<!--   END WARNING LINE   -->
					<!--   BEGIN FORM HEADER   -->
					<div class="styBB" style="width:256mm;height: 25mm;border-bottom-width:1px;">
						<div class="styFNBox" style="width:40mm;font-size:8pt;height:25mm;border-right-width:1px;">
							<div class="styFormNumber" style="font-size:10pt;font-weight:bold;">SCHEDULE J</div>
							<span class="sty5471ScheduleJFNum2">(Form 5471)</span>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Return Software ID</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/softwareId"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<xsl:call-template name="LinkToLeftoverDataTableInline">
								<xsl:with-param name="Desc">Return Software Version</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/softwareVersion"/>
								<xsl:with-param name="Style">padding-left:3mm;</xsl:with-param>
							</xsl:call-template>
							<div class="sty5471ScheduleJRev">(Rev. December 2005)</div>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData"/>
							</xsl:call-template>
							<div class="styAgency" style="padding-top:1.7mm;">Department of the Treasury</div>
							<div class="styAgency" style="padding-bottom:.1mm;">Internal Revenue Service</div>
						</div>
						<div class="styFTBox" style="height: 25mm;width:175mm;padding-top:1mm;border-left-width:1px;border-right-width:1px;">
							<div class="styMainTitle" style="font-weight:bold;">Accumulated Earnings and Profits (E&amp;P)<br/> of Controlled Foreign Corporation</div>
							<div class="styFST" style="font-size:6pt;margin-left:3mm;font-weight:bold;">
								<div style="margin-left: 1.5mm;padding-top:8mm;">
									<img src="{$ImagePath}/5471SchJ_Bullet.gif" alt="bullet"/>
 Attach to Form 5471.  See Instructions for Form 5471.
								</div>
							</div>
						</div>
						<div class="styTYBox" style="width:40mm;height:25mm;border-left-width: 1px">
							<div class="styOMB" style="padding-top:10mm;height:2mm;border-bottom:0;text-align:middle;">OMB No. 1545-0704</div>
						</div>
					</div>
					<!--   END FORM HEADER   -->
					<!--   BEGIN TAXPAYER INFO   -->
					<div style="width:256mm;">
						<div class="sty5471ScheduleJBusinessName" style="width:200mm;height:30px;">Name of person filing Form 5471
					  <br/>
							<span style="font-family: verdana, arial, sans-serif;font-size: 7pt;">
								<xsl:choose>
									<xsl:when test="$IRS5471ScheduleJData/NameOfPersonFilingForm5471 != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/NameOfPersonFilingForm5471"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471ScheduleJData/NameOfBusinessFilingForm5471/BusinessNameLine1 != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/NameOfBusinessFilingForm5471/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:choose>
											<xsl:when test="$IRS5471ScheduleJData/NameOfBusinessFilingForm5471/BusinessNameLine2 != '' ">
												<br/>
												<xsl:call-template name="PopulateText">
													<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/NameOfBusinessFilingForm5471/BusinessNameLine2"/>
												</xsl:call-template>
											</xsl:when>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="$RtnHdrData/ReturnType='1040'">
												<br/>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">Name</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
												</xsl:call-template>
												<br/>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
						<div class="sty5471ScheduleJIN" style="width:56mm;height:30px;">
							<span style="font-weight:bold;float:left; clear: none; margin-left: 1mm">Identifying number</span>
							<br/>
							<span class="sty5471ScheduleJINBox" style="font-weight:normal;font-size: 7pt; height:4mm;float:left; margin-left: 1mm; padding-top:2mm;">
								<xsl:choose>
									<xsl:when test="$IRS5471ScheduleJData/SSN != '' ">
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/SSN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471ScheduleJData/EIN != '' ">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="$IRS5471ScheduleJData/MissingSSNEINReason != '' ">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/MissingSSNEINReason"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
											<xsl:when test="$RtnHdrData/ReturnType='1040'">
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
												</xsl:call-template>
											</xsl:when>
											<xsl:otherwise>
												<xsl:call-template name="PopulateReturnHeaderFiler">
													<xsl:with-param name="TargetNode">EIN</xsl:with-param>
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</div>
					</div>
					<!--   END TAXPAYER INFO   -->
					<!--   BEGIN NAME OF FOREIGN CORPORATION   -->
					<div class="sty5471ScheduleJCorporation" style="font-size:6pt">Name of foreign corporation</div>
					<div style="width: 256mm;font-family: verdana, arial, sans-serif; font-size: 7pt; height: 4.5mm; border-style:solid; border-bottom-width: 1px; border-top-width: 0px; border-left: 0px; border-right: 0px">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/NameOfForeignCorporation/BusinessNameLine1"/>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/NameOfForeignCorporation/BusinessNameLine2"/>
						</xsl:call-template>
					</div>
					<!--   BEGIN HEADER   -->
					<div style="width: 256mm;">
						<span class="sty5471ScheduleJCellGeneric" style="width:62mm;font-size: 8pt;text-align: center; height: 22.5mm;  padding-top: 1.5mm">
							<br/>
							<b>Important:</b> Enter amounts in<br/>functional currency.
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="width:32mm;text-align: center; height: 22.5mm;  font-size: 7pt; padding-top: 2mm;">
						  <b>(a)</b> Post-1986<br/>Undistributed Earnings<br/>(post-86 section<br/>	959(c)(3) balance)
						</span>
						
						<span class="sty5471ScheduleJCellGeneric" style="width:35mm;text-align: center; height: 22.5mm; font-size: 7pt; padding-top: 2mm">
							<b>(b)</b> Pre-1987 E&amp;P<br/>Not Previously Taxed<br/>(pre-87 section<br/>959(c)(3) balance)
						</span>
						
						<span style="width:95mm;">
							<span class="sty5471ScheduleJCellGeneric" style="width:95mm;text-align: center; height: 10.5mm; font-size: 7pt">
								<b>(c)</b>Previously Taxed E&amp;P (see instructions)<br/>(sections 959(c)(1) and (2) balances)
							</span>
							<span class="sty5471ScheduleJCellGeneric" style="width:31mm;text-align: center;height: 12mm;">
								<br/>
								<i>(i)</i> Earnings Invested<br/>in U.S. Property
							</span>
							<span class="sty5471ScheduleJCellGeneric" style="width:31mm;text-align: center; height: 12mm;">
								<i>(ii)</i> Earnings Invested<br/>in Excess Passive<br/>Assets
							</span>
							<span class="sty5471ScheduleJCellGeneric" style="width:33mm;text-align: center; height: 12mm;">
								<br/>
								<i>(iii)</i> Subpart F Income
							</span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="width:32mm;text-align: center; border-right: 0;height: 22.5mm; font-size: 7pt">
							<b>(d)</b> Total Section<br/>964(a) E&amp;P<br/>(combine columns<br/>(a), (b), and (c))
						</span>
					</div>
					<!--   END HEADER   -->
					<!--   BEGIN LINE 1   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol" style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="padding-top: 1.5mm">1</span>
							<span class="sty5471ScheduleJLine" style="margin-left: 4.5mm; padding-top: 1.5mm">Balance at beginning of year</span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="width:32mm; padding-top: 5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/BalAtBOYPost1986UndistrEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="width:35mm; padding-top: 5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/BalAtBOYPre1987EPNotPrevTxd"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="width:31mm; padding-top: 5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/BalanceAtBOYUSPropInvestedEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="width:31mm; padding-top: 5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/BalanceAtBOYExPssvAstInvstEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="width:33 mm; padding-top: 5mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/BalanceAtBOYSubpartFIncome"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="width:32mm; padding-top: 5mm; border-right:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/BalanceAtBOYTotalSection964aEP"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 1   -->
					<!--   BEGIN LINE 2a   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol" style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="padding-top: 1.5mm">2a</span>
							<span class="sty5471ScheduleJLine" style="padding-top: 1.5mm">Current year E&amp;P</span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="padding-top: 5mm; width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/CurrYearEPPost1986UndistrEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; width:35mm; "/>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; padding-top: 3mm; width:31mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; width:31mm; "/>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; padding-top: 3mm ;width:33mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; padding-top: 3mm; width:32mm; border-right:0;"/>
					</div>
					<!--   END LINE 2a   -->
					<!--   BEGIN LINE 2b   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol" style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="margin-left: 2.5mm; padding-top: 1.5mm">b</span>
							<span class="sty5471ScheduleJLine" style="padding-top: 1.5mm">Current year deficit in E&amp;P</span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="padding-top: 5mm; width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/CurrYrEPDfctPost86UndistrEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; padding-top: 3mm; width:35mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; padding-top: 3mm;  width:31mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; padding-top: 4mm;  width:31mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; padding-top: 3mm;  width:33mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="background-color: lightgrey; padding-top: 3mm;  width:32mm; border-right:0;"/>
					</div>
					<!--   END LINE 2b   -->
					<!--   BEGIN LINE 3   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol" style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="padding-top: 1mm">3</span>
							<span class="sty5471ScheduleJLine" style="height: 13mm; margin-left: 4.5mm; padding-top: 1mm">Total current and accumulated<br/>
								<span style="width: .5mm"/>E&amp;P not previously taxed (line 1<br/>
								<span style="width: .5mm"/>plus line 2a <b>or</b> line 1 minus line 2b)
      </span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top: 9mm; width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotCurrAndAccumEPPost1986Earn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top: 9mm; width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/TotCurrAccumEPPre1987EPNotTxd"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey;padding-top: 9mm; width:31mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;background-color: lightgrey;padding-top: 9mm; width:31mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;background-color: lightgrey;padding-top: 9mm; width:33mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;background-color: lightgrey;padding-top: 9mm; width:32mm; border-right:0;"/>
					</div>
					<!--   END LINE 3   -->
					<!--   BEGIN LINE 4   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol" style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="padding-top: 1.5mm">4</span>
							<span class="sty5471ScheduleJLine" style="height: 13mm; margin-left: 4.5mm; padding-top: 1.5mm">Amounts included under section<br/>
								<span style="width: .5mm"/>951(a) or reclassified under<br/>
								<span style="width: .5mm"/>section 959(c) in current year
      </span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top: 9mm; width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/CurrYr951aOr959cAmtPost86Earn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/CurrYear951aOr959cAmtPre1987EP"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/CY951aOr959cAmtUSPropInvstEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/CY951aOr959cAmtExPssvAstInvst"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; width:33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/CY951aOr959cAmtSubpartFIncome"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; background-color: lightgrey; width:32mm; border-right:0;"/>
					</div>
					<!--   END LINE 4   -->
					<!--   BEGIN LINE 5a   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol" style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="padding-top: 1.5mm">5a</span>
							<span class="sty5471ScheduleJLine" style="height: 13mm; padding-top: 1.5mm">Actual distributions or<br/>
								<span style="width: .5mm"/>reclassifications of<br/>
								<span style="width: .5mm"/>previously taxed E&amp;P
      </span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:32mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:35mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; padding-top: 9mm; width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/ActlDistriReclsUSPropInvstEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; padding-top: 9mm; width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/ActlDistriReclsExPssvAstInvst"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; padding-top: 9mm; width:33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/ActlDistriReclsSubpartFIncome"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:32mm; border-right:0;"/>
					</div>
					<!--   END LINE 5a   -->
					<!--   BEGIN LINE 5b   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol" style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="margin-left: 2.5mm; padding-top: 2mm ">b</span>
							<span class="sty5471ScheduleJLine" style="height: 10mm; padding-top: 2mm">Actual distributions of<br/>
								<span style="width: .5mm"/>nonpreviously taxed E&amp;P
      </span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 10mm; padding-top: 7mm; width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/ActlDistriOfNotPrevTxdEPPost86"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 10mm; padding-top: 7mm; width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/ActlDistriOfNotPrevTxdEPPre87"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 10mm; background-color: lightgrey; padding-top: 7mm; width:31mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 10mm; background-color: lightgrey; padding-top: 7mm; width:31mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 10mm; background-color: lightgrey; padding-top: 7mm; width:33mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 10mm; background-color: lightgrey; padding-top: 7mm; width:32mm; border-right:0;"/>
					</div>
					<!--   END LINE 5b   -->
					<!--   BEGIN LINE 6a   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol" style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="padding-top: 1mm">6a</span>
							<span class="sty5471ScheduleJLine" style="height: 13mm;padding-top: 1mm">Balance of previously taxed<br/>
								<span style="width: .5mm"/>E&amp;P at end of year (line 1 plus<br/>
								<span style="width: .5mm"/>line 4, minus line 5a)
      </span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:32mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:35mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; padding-top: 9mm; width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EOYEPBalPrevTxdUSPropInvstEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; padding-top: 9mm; width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EOYEPBalPrevTxdExPssvAstInvst"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; padding-top: 9mm; width:33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EOYEPBalPrevTxdSubpartFIncome"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:32mm; border-right:0;"/>
					</div>
					<!--   END LINE 6a   -->
					<!--   BEGIN LINE 6b   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol" style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="margin-left: 2.5mm; padding-top:1mm">b</span>
							<span class="sty5471ScheduleJLine" style="height: 13mm; padding-top: 1mm">Balance of E&amp;P not previously<br/>
								<span style="width: .5mm"/>taxed at end of year (line 3<br/>
								<span style="width: .5mm"/>minus line 4, minus line 5b)
      </span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; padding-top: 9mm; width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndOfYearEPBalNotPrevTxdPost86"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; padding-top: 9mm; width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndOfYearEPBalNotPrevTxdPre87"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:31mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:31mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:33mm;"/>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm; background-color: lightgrey; padding-top: 9mm; width:32mm; border-right:0;"/>
					</div>
					<!--   END LINE 6b   -->
					<!--   BEGIN LINE 7   -->
					<div class="sty5471ScheduleJDescLine">
						<span class="sty5471ScheduleJLNCol"  style="width:62mm;">
							<span class="sty5471ScheduleJLN" style="padding-top: 1mm">7</span>
							<span class="sty5471ScheduleJLine" style="height: 13mm; margin-left: 4.5mm;padding-top: 1mm">Balance at end of year. (Enter<br/>
								<span style="width: .5mm"/>amount from line 6a or line 6b,<br/>
								<span style="width: .5mm"/>whichever is applicable.)
      </span>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height:13mm; padding-top: 9mm; width:32mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndOfYearBalPost86UndistrEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndOfYearBalPre87EPNotPrevTxd"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndOfYearBalUSPropInvestedEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; width:31mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndOfYearBalExPssvAstInvstEarn"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; width:33mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndOfYearBalSubpartFIncome"/>
							</xsl:call-template>
						</span>
						<span class="sty5471ScheduleJCellGeneric" style="height: 13mm;padding-top:9mm; width:32mm; border-right:0;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="MaxSize" select="17"/>
								<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData/EndOfYearBalTotalSection964aEP"/>
							</xsl:call-template>
						</span>
					</div>
					<!--   END LINE 7   -->
					<!--   BEGIN FORM FOOTER  -->
					<div class="sty5471ScheduleJFormFooter">
						<div style="width:140mm;font-weight:bold; float: left; clear: none">For Paperwork Reduction Act Notice, see the Instructions for Form 5471.</div>
						<div style="width:19mm;font-weight:normal; float: left; clear: none">Cat. No. 21111K</div>
						<div style="width:55mm;text-align:right;font-weight:bold; text-align: right; float: right; clear: none">Schedule J(Form 5471)<span style="font-weight: normal"> (Rev. 12-2005)</span>
						</div>
					</div>
					<!--     END FORM FOOTER   -->
					<div class="pageEnd"/>
					<br/>
					<div class="styLeftOverTitleLineLandscape" id="LeftoverData">
						<div class="styLeftOverTitle">
      Additional Data        
    </div>
						<div class="styLeftOverButtonContainerLandscape">
							<input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<!-- Additional Data Table -->
					<table class="styLeftOverTblLandscape">
						<xsl:call-template name="PopulateCommonLeftoverLandscape">
							<xsl:with-param name="TargetNode" select="$IRS5471ScheduleJData"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
					<!-- END Left Over Table -->
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
