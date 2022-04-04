<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/MultiLevelMarketingStatement" />

	<xsl:template name="ShowDependencyData">
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Income Not Subjected To U.S. Tax Statement:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/IncomeNotSubjectToUSTaxTxt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">U.S Arrivals and Departures Dates:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$DependencyData/USArrivalDepartureDateTxt"/>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/USArrivalDepartureDateTxt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Low Tier Distributors of Personal Services Statement:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/LowerTierDistrPrsnlServiceTxt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Additional Explanation:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/AdditionalExplanationTxt"/>
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
