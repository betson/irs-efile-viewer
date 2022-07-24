<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Change this dependency name (ItemizedIncomeNotRecOnBooksSch)
           by your dependency name -->
	<xsl:param name="DependencyData" select="$RtnDoc/OtherAmountsPaidStatement"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Main template  -->
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
				<meta name="Author" content="Trin Xue"/>
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
<span style="width:117mm;">
<xsl:value-of select="$depDocTitle"/>
</span>
</span>
</div>
<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
<xsl:with-param name="TargetNode" select="$DependencyData"/>
</xsl:call-template>
<!-- TransformAdjustments to Shareholder's Equity Schedule  Schedule -->
<xsl:call-template name="OtherAmountsPaidStatementTemp"/>
</body>
		</html>
	</xsl:template>
	<xsl:template name="OtherAmountsPaidStatementTemp">
	<table id="VesselOrAircraftCharterOutStmtTbl" class="styDepTblLandscape">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="text-align:center">Explanation</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">USPersCtrlFrgn<br/>CorpAmt</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">TenPctMore<br/>USShrAnyCFCAmt</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">OthFrgnCorp<br/>PrtshpUSPrsnAmt</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">TenPctMore<br/>USShrAnyCFCAmt</th>
					<th class="styDepTblCell" scope="col" style="text-align:center">TenPctMore<br/>USShrAnyCFCAmt</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/OtherAmountsPaidGrp">
					<!-- set row background -->
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
							<td class="styDepTblCell" style="text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="USPersonCtrlFrgnCorpAmt"/>
							</xsl:call-template>
						</td>
					    <td class="styDepTblCell" style="text-align:center;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DomCorpPrtshpUSPrsnFlngAmt"/>
							</xsl:call-template>
						</td>
							<td class="styDepTblCell" style="text-align:center;font-size:8pt">
									<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OthFrgnCorpPrtshpUSPrsnAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;font-size:6.37pt">
							<span style="width:21mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TenPctMoreUSShrCFCAmt"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styDepTblCell" style="text-align:center;font-size:6.37pt">
							<span style="width:21mm;text-align:center;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="TenPctMoreUSShrAnyCFCAmt"/>
								</xsl:call-template>
							</span>
						</td>
					</tr>
				</xsl:for-each>
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;">Total Line
						</td>
						<td class="styDepTblCell" style="text-align:center">
									<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotUSPersonCtrlFrgnCorpAmt"/>
							</xsl:call-template>
						</td>
							<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotDomCorpPrtshpUSPrsnFlngAmt"/>
								</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;">
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotOthFrgnCorpPrtshpUSPrsnAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;font-size:6.37pt">
									<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotTenPctMoreUSShrCFCAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;font-size:6.37pt">
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$DependencyData/TotTenPctMoreUSShrAnyCFCAmt"/>
								</xsl:call-template>
						</td>
					</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
