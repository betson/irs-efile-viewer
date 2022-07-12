<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="Form3115DepsData" select="$RtnDoc/OwnsDisregardedEntitiesStmt"/>
	<!-- Schema location 1120F - Owns Disregarded Entities Statement -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$Form3115DepsData"/>
		</xsl:call-template>
	</xsl:param>
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
				<meta name="Author" content="Jessica Lee - jesslee@us.ibm.com"/>
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
					<span class="styDepTitle" style="width:105mm;">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$Form3115DepsData"/>
				</xsl:call-template>
				<table class="styDepTbl" style="margin-top:4mm;">
					<thead class="styTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:137mm;"> Name </th>
							<th class="styDepTblCell" scope="col" style="width:10mm;"> Country </th>
							<th class="styDepTblCell" scope="col" style="width:40mm;"> Identification Number </th>
						</tr>
					</thead>
					<tfoot/>
					<tbody>
						<xsl:for-each select="$Form3115DepsData/ForeignEntity">
							<tr>
								<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
								<td class="styDepTblCell" align="left" style="width:137mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
									</xsl:call-template>
									<xsl:if test="normalize-space(Name/BusinessNameLine2)!=''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:if>
								</td>
								<td class="styDepTblCell" align="center" style="width:10mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Country"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" align="center" style="width:40mm;">
									<xsl:choose>
										<xsl:when test="EIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="EIN"/>
											</xsl:call-template>
										</xsl:when>
										<xsl:when test="SSN">
											<xsl:call-template name="PopulateSSN">
												<xsl:with-param name="TargetNode" select="SSN"/>
											</xsl:call-template>
											<br/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="MissingEINReason"/>
											</xsl:call-template>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>