<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="TOAVSData" select="$RtnDoc/TrustOwnedAssetValuesStmt"/>
	<!-- Template to display Trust Owned Asset Values Statement -->
	<xsl:template name="ShowTOAVS">
		<table id="TOAVSTbl" class="styDepTbl" style="font-size:7pt;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:35mm;">Total Asset Value<br/>of Trust Amount</th>
					<th class="styDepTblCell" scope="col" style="width:40mm;">Trust Name</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Trust EIN</th>
					<th class="styDepTblCell" scope="col" style="width:70mm;">Explanation</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$TOAVSData/TrustOwnedAssetValuesGrp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:right;width:35mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TotalAssetValueOfTrustAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;width:40mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TrustNm/BusinessNameLine1"/>
							</xsl:call-template>
							<xsl:if test="TrustNm/BusinessNameLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TrustNm/BusinessNameLine2"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styDepTblCell" style="text-align:left;width:25mm;">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="TrustEIN"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;width:70mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Explanation"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$TOAVSData"/>
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
					<span class="styDepTitle" style="width:92mm">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$TOAVSData"/>
				</xsl:call-template>
				<xsl:call-template name="ShowTOAVS"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
