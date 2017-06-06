<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/PersonMeetingFilingRqrStmt"/>
	<!-- 5471 Display name is Person Meeting Filing Requirements Statement -->
	<xsl:template name="ShowCCS">
		<table id="CCSTbl" class="styDepTblLandscape">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:56mm;vertical-align:middle;">Filing Requirement Met Description</th>
					<th class="styDepTblCell" scope="col" style="width:60mm;vertical-align:middle;">Name</th>
					<th class="styDepTblCell" style="width:50mm;text-align:center;vertical-align:middle;" scope="col">Address</th>
					<th class="styDepTblCell" style="width:40mm;text-align:center;vertical-align:middle;" scope="col">SSN/EIN/Missing EIN Reason</th>
					<th class="styDepTblCell" scope="col" style="width:50mm;vertical-align:middle;">IRS Service Center Where Filed</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/PersonMeetingFilingRqr">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="width:56mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="FilingRequirementMetDesc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="width:60mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Name"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" align="left" style="width:50mm;">
							<xsl:choose>
								<xsl:when test="USAddress">
									<xsl:call-template name="PopulateUSAddressTemplate">
										<xsl:with-param name="TargetNode" select="USAddress"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateForeignAddressTemplate">
										<xsl:with-param name="TargetNode" select="ForeignAddress"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styDepTblCell" style="width:40mm;text-align:middle;">
							<xsl:choose>
								<xsl:when test="SSN">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="SSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="EIN">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="MissingEINReason"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styDepTblCell" style="width:50mm;text-align:middle;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="IRSServiceCenterWhereFiled"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
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
				<meta name="Author" content=""/>
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
				<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
				<div class="styDepTitleLineLandscape ">
					<span class="styDepTitle" style="width:127mm">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="ShowCCS"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
