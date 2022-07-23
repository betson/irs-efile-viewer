<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="OCSData" select="$RtnDoc/OtherCostStatement"/>
	<!-- Template to display Other Cost Statement-->
	<xsl:template name="ShowOCS">
		<table id="OCSTbl" class="styDepTbl" style="table-layout:fixed;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:147mm;">Other Cost Type</th>
					<th class="styDepTblCell" scope="col" style="width:40mm;">Other Cost Amount</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$OCSData/OtherCostStmt">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;width:147mm;height:auto;padding:0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="OtherCostTypeDesc"/>
								</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:40mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherCostAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:140mm;border-width:3px 0px 0px 0px;border-style:solid;border-color:black;">Total Other Cost Amount</th>
					<td style="text-align:right;width:40mm;border-width:3px 0px 0px 3px;border-style:solid;border-color:black;">
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<b>
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$OCSData/TotalOtherCostAmt"/>
							</xsl:call-template>
						</b>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$OCSData"/>
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
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="padding-right:2mm;">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$OCSData"/>
				</xsl:call-template>
				<xsl:call-template name="ShowOCS"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>