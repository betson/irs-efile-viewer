<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/ResidencyTerminationDateStmt" />

	<xsl:template name="ShowDependencyData">
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">US Alien Name:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:choose>
					<xsl:when test="$DependencyData/AlienNameAndAddress/PersonNm">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/AlienNameAndAddress/PersonNm"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/AlienNameAndAddress/BusinessName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="$DependencyData/AlienNameAndAddress/BusinessName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/AlienNameAndAddress/BusinessName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">US Alien Address:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/AlienNameAndAddress//AddressLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/AlienNameAndAddress//AddressLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/AlienNameAndAddress//AddressLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				<br />
				<xsl:call-template name="PopulateCityStateInfo">
					<xsl:with-param name="TargetNode" select="$DependencyData/AlienNameAndAddress/USAddress"/>
					<xsl:with-param name="ForeignAddressTargetNode" select="$DependencyData/AlienNameAndAddress/ForeignAddress"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/AlienNameAndAddress/ForeignAddress">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/AlienNameAndAddress/ForeignAddress/CountryCd"/>
					</xsl:call-template> (<xsl:value-of select="document('CountriesList.xml')/countries/country[@id=$DependencyData/AlienNameAndAddress/ForeignAddress//CountryCd]"/>)
				</xsl:if>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">US Taxpayer Identification Number:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="$DependencyData/TIN"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">US Visa Number:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/VisaTypeDesc"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Country Name that issued Passport:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/PassportIssuedGrp/CountryCd"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/PassportIssuedGrp/CountryCd">
					(<xsl:value-of select="document('CountriesList.xml')/countries/country[@id=$DependencyData/PassportIssuedGrp/CountryCd]"/>)
				</xsl:if>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Passport Number:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/PassportIssuedGrp/PassportNum"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Tax Year:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateYear">
					<xsl:with-param name="TargetNode" select="$DependencyData/TaxYr"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">First Date of US Residency:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="$DependencyData/USPresenceBeginDt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Foreign Country Closer Connection Description:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/FrgnCntryCloserConnectionDesc"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Date that Status of US Residency was Rescinded:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="$DependencyData/LawfulPrmnntResRescindDt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Description of Why Lawful US Residency Status was Rescinded:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/LawfulPrmnntResRescindDesc"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">De Minimis Presence Rule Description:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/DeMinimisPresenceRuleDesc"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>

	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title><xsl:value-of select="$depDocTitle" /></title>

				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content= "{$depDocTitle}" />

				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
				<xsl:call-template name="InitJS"></xsl:call-template>

				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"></xsl:call-template>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass" >
				<xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<xsl:value-of select="$depDocTitle" />
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
				<xsl:call-template name="ShowDependencyData" />
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
