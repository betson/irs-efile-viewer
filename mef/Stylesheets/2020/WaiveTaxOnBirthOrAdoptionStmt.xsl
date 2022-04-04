<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="MPSData" select="$RtnDoc/WaiveTaxOnBirthOrAdoptionStmt"/>
	<!-- Main template -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$MPSData"/>
		</xsl:call-template>
	</xsl:param>
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
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<span style="width:100mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$MPSData"/>
				</xsl:call-template>
				<span style="height:5px;"/>
				<xsl:call-template name="ShowMPS"/>
			</body>
		</html>
	</xsl:template>
	<!-- Template to display Additional Information for Gross Foreign Distributions Schedule -->
	<xsl:template name="ShowMPS">
		<table id="MPSTbl" class="styDepTbl">
			<thead class="styDepTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:auto;text-align:center;">Name</th>
					<th class="styDepTblCell" scope="col" style="width:auto;text-align:center;">Age</th>
					<th class="styDepTblCell" scope="col" style="width:auto;text-align:center;">SSN</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$MPSData/ChildInfoBirthOrAdoptionGrp">
					<tr>
						<!-- Assign alternate rows the different colors -->
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!-- Column 1 -->
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PersonFullName/PersonFirstNm"/>
							</xsl:call-template>
							<span style="width:2mm;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PersonFullName/PersonLastNm"/>
							</xsl:call-template>
						</td>
						<!-- Column 2 -->
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AgeNum"/>
							</xsl:call-template>
						</td>
						<!-- Column 3 -->
						<td class="styDepTblCell" style="text-align:right;">
							<xsl:call-template name="PopulateSSN">
								<xsl:with-param name="TargetNode" select="SSN"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
