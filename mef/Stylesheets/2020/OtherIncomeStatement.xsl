<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/OtherIncomeStatement"/>
	<!-- Corporate Income Tax Display name is Other Income Statement -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="DependencyTemplate">
		<!-- Table begin -->
		<table class="styDepTbl" style="margin-top:4mm;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:111mm;vertical-align:middle;">
            Type
          </th>
					<th class="styDepTblCell" scope="col" style="width:25mm;vertical-align:middle;">
             Foreign Country or U.S. Possession, or 863(B) or NOL or RICs or HTKO
          </th>
					<th class="styDepTblCell" scope="col" style="width:40mm;vertical-align:middle;">       
            Amount Of Other Income
            </th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/OtherIncomeTyp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" align="left">
							<span style="width:111mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="OtherIncomeDesc"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styDepTblCell" align="center">
							<span style="width:25mm">
								<xsl:choose>
									<xsl:when test="ForeignCountryOrUSPossessionCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignCountryOrUSPossessionCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="NetOperatingLossCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="NetOperatingLossCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="ForeignRegulatedInvestmtCompCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignRegulatedInvestmtCompCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:when test="ForeignIncHighTaxedKickOutCd">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignIncHighTaxedKickOutCd"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Section863bIncomeCd"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</td>
						<td class="styDepTblCell" align="right">
							<span style="width:40mm">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="OtherIncomeAmt"/>
								</xsl:call-template>
							</span>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-OtherIncomeDesc" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<span style="width:75mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
						<span style="width:2mm;"/>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="DependencyTemplate"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>