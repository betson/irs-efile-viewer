<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="DependencyData" select="$RtnDoc/VesselOrAircraftCharterOutStmt"/>
<!-- Form 1120F Sch V-Vessel Or Aircraft Chartered Out Statement-->
<xsl:param name="depDocTitle">
<xsl:call-template name="PopulateDisplayName">
<xsl:with-param name="TargetNode" select="$DependencyData"/>
</xsl:call-template>
</xsl:param>
<xsl:template name="VesselOrAircraftCharterOutInfoSchTemp">
<table id="VesselOrAircraftCharterOutStmtTbl" class="styDepTblLandscape">
<thead class="styTableThead">
<tr class="styDepTblHdr">
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:15mm">Name of Vessel or Aircraft</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:15mm">Country of Registration</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:30mm">Lesee Name</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:30mm">Lesee Address</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:20mm">Term Bareboat Lease</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:10mm">Days under lease</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:35mm;">USSGTI Method</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:95mm;">Calculation Method</th>
</tr>
</thead>
<tfoot/>
<tbody>
<xsl:for-each select="$DependencyData/VesselOrAircraftCharterOutDtl">
<tr>
<!-- Set row background color -->
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose>
</xsl:attribute>
<td class="styDepTblCell" scope="col" style="width:15mm;text-align:left;font-size: 7pt;">
	<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
	<xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="VesselOrAircraftNm"/>
	</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:15mm;text-align:left;font-size: 7pt;">
	<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
	<xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="VesselOrAircraftRegCntryNm"/>
	</xsl:call-template>
</td>
<xsl:for-each select="LesseeInformation">
<xsl:if test="position() = 1">
<td class="styDepTblRow1Cell" scope="col" style="width:60mm;text-align:left;font-size: 7pt">
	<!--Choice of Business Name versus Name -->
		<xsl:choose>
			<xsl:when test="BusinessName/BusinessNameLine1Txt !=''">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="BusinessName/BusinessNameLine2Txt !=''">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="PersonNm"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
</td>
<td class="styDepTblRow1Cell" scope="col" style="width:60mm;text-align:left;font-size: 7pt; ">
	<!-- Choice of US and Foreign Address -->
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
</xsl:if>
</xsl:for-each>
<td class="styDepTblCell" scope="col" style="width:20mm;text-align:left;font-size: 7pt;">
	<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
	<xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="BoatLeaseTermTxt"/>
	</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:10mm;text-align:right;font-size: 7pt;">
	<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
	<xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="VesselOrArcrftLsDaysCnt"/>
	</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:35mm;text-align:left;font-size: 7pt;">
	<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
	<xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="MethodCalcRntlPrtnPymtTxt"/>
	</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:95mm;text-align:left;font-size: 7pt;">
	<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
	<xsl:call-template name="PopulateText">
	<xsl:with-param name="TargetNode" select="CalUsedApplyMethodTxt"/>
	</xsl:call-template>
</td>
</tr>
<xsl:for-each select="LesseeInformation">
<xsl:if test="position() &gt; 1">
<tr>
	<!-- Set row background color -->
	<xsl:attribute name="class">
		<xsl:choose>
			<xsl:when test="position() mod 2 = 1">styDepTblRow1
			</xsl:when>
			<xsl:otherwise>styDepTblRow2
			</xsl:otherwise>
		</xsl:choose>
	</xsl:attribute>
	<td class="styDepTblCell" scope="col" style="width:30mm;text-align:left;font-size: 7pt;">
	<!--Choice of Business Name versus Name -->
		<xsl:choose>
			<xsl:when test="BusinessName/BusinessNameLine1Txt !=''">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="BusinessName/BusinessNameLine2Txt !=''">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="PersonNm"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</td>
	<td class="styDepTblCell" scope="col" style="width:30mm;text-align:left;font-size: 7pt">
	<!-- Choice of US and Foreign Address -->
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
</tr>
</xsl:if>
</xsl:for-each>
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
<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
<div class="styDepTitleLineLandscape">
<span class="styDepTitle">
<span style="padding-right:2mm;">
<xsl:value-of select="$depDocTitle"/>
</span>
</span>
</div>
<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
<xsl:with-param name="TargetNode" select="$DependencyData"/>
</xsl:call-template>
<xsl:call-template name="VesselOrAircraftCharterOutInfoSchTemp"/>
</body>
</html>
</xsl:template>
</xsl:stylesheet>