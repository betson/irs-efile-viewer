<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="DependencyData" select="$RtnDoc/VesselOrAircraftCharterOutStmt"/>
<xsl:param name="depDocTitle">
<xsl:call-template name="PopulateDisplayName">
<xsl:with-param name="TargetNode" select="$DependencyData"/>
</xsl:call-template>
</xsl:param>
<!-- Template to display Adjustments To Shareholders Equity Schedule Data -->
<xsl:template name="VesselOrAircraftCharterOutInfoSchTemp">
<table id="VesselOrAircraftCharterOutStmtTbl" class="styDepTblLandscape">
<thead class="styTableThead">
<tr class="styDepTblHdr">
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:15mm">Name of Vessel or Aircraft</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:15mm">Country of Registration</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:60mm">Lesee Name</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:60mm">Lesee Address</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:20mm">Term Bareboat Lease</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:10mm">Days under lease</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:35mm;">USSGTI Method</th>
<th class="styDepTblCell" scope="col" style="font-size: 7pt;width:35mm;">Calculation Method</th>
</tr>
</thead>
<tfoot/>
<tbody>
<xsl:for-each select="$DependencyData/VesselOrAircraftCharterOutInfo">
<tr>
<!-- Set row background color -->
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td class="styDepTblCell" scope="col" style="width:15mm;text-align:left;font-size: 7pt;">
<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="VesselOrAircraftName"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:15mm;text-align:left;font-size: 7pt;">
<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CntryOfRegOfVesselOrAircraft"/>
</xsl:call-template>
</td>
<xsl:for-each select="LesseeInformation">
<xsl:if test="position() = 1">
<td class="styDepTblRow1Cell" scope="col" style="width:60mm;text-align:left;font-size: 7pt">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BusinessNameOfEachLessee/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BusinessNameOfEachLessee/BusinessNameLine2"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:60mm;text-align:left;font-size: 7pt; ">
<xsl:if test="USAddressOfEachLessee">
<xsl:call-template name="PopulateUSAddressTemplate">
<xsl:with-param name="TargetNode" select="USAddressOfEachLessee"/>
</xsl:call-template>
</xsl:if>
<xsl:if test="PopulateForeignAddressTemplate">
<xsl:call-template name="PopulateForeignAddressTemplate">
<xsl:with-param name="TargetNode" select="ForeignAddressOfEachLessee"/>
</xsl:call-template>
</xsl:if>
</td>
</xsl:if>
</xsl:for-each>
<td class="styDepTblCell" scope="col" style="width:20mm;text-align:left;font-size: 7pt;">
<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="TermOfBareboatLease"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:10mm;text-align:right;font-size: 7pt;">
<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="DaysUnderLsForVesselOrAircraft"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:35mm;text-align:left;font-size: 7pt;">
<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="DescriptionOfMethodUsed"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:35mm;text-align:left;font-size: 7pt;">
<xsl:attribute name="rowspan"><xsl:value-of select="count(LesseeInformation)"/></xsl:attribute>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="CalcUsedToApplyMethod"/>
</xsl:call-template>
</td>
</tr>
<xsl:for-each select="LesseeInformation">
<xsl:if test="position() &gt; 1">
<tr>
<!-- Set row background color -->
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td class="styDepTblCell" scope="col" style="width:60mm;text-align:left;font-size: 7pt;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BusinessNameOfEachLessee/BusinessNameLine1"/>
</xsl:call-template>
<br/>
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="BusinessNameOfEachLessee/BusinessNameLine2"/>
</xsl:call-template>
</td>
<td class="styDepTblCell" scope="col" style="width:60mm;text-align:left;font-size: 7pt;">
<xsl:if test="USAddressOfEachLessee">
<xsl:call-template name="PopulateUSAddressTemplate">
<xsl:with-param name="TargetNode" select="USAddressOfEachLessee"/>
</xsl:call-template>
</xsl:if>
<xsl:if test="PopulateForeignAddressTemplate">
<xsl:call-template name="PopulateForeignAddressTemplate">
<xsl:with-param name="TargetNode" select="ForeignAddressOfEachLessee"/>
</xsl:call-template>
</xsl:if>
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
<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
<div class="styDepTitleLineLandscape">
<span class="styDepTitle">
<span style="width:110mm;">
<xsl:value-of select="$depDocTitle"/>
</span>
</span>
</div>
<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
<xsl:with-param name="TargetNode" select="$DependencyData"/>
</xsl:call-template>
<!-- TransformAdjustments to Shareholder's Equity Schedule  Schedule -->
<xsl:call-template name="VesselOrAircraftCharterOutInfoSchTemp"/>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
