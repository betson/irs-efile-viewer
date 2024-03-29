<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Foreign Consolidated Group Members Statement -->
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ForeignCnsldtGroupMemStatement"/>
	<!-- 1120F Sch-H, Foreign Consolidated Group Members Statement -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="DependencyTemplate">
		<table id="DDSTbl" class="styDepTbl">
			<tr class="styDepTblHdr">
				<th class="styDepTblCell" scope="col" style="text-align:center;width:186mm;">Group Member</th>
			</tr>
			<xsl:for-each select="$DependencyData/GroupMemberInfo">
				<tr>
					<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2
					</xsl:otherwise></xsl:choose></xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:186mm;">
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2
						 </xsl:otherwise></xsl:choose></xsl:attribute>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="GroupMember/BusinessNameLine1"/>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="GroupMember/BusinessNameLine2"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
		<br/>
	</xsl:template>
	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
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
					<div class="styDepTitle" style="width:130mm">
						<xsl:value-of select="$depDocTitle"/>
						<!-- Foreign Consolidated Group Members Statement -->
					</div>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<div class="styTopSectionLine" style="width:187mm;">
					<div class="styTopSectionLineLbl" style="float:left;clear:none;">Explanation:</div>
					<div style="float:left;clear:none;width:118mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/Explanation"/>
						</xsl:call-template>
					</div>
				</div>
				<xsl:call-template name="DependencyTemplate"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
