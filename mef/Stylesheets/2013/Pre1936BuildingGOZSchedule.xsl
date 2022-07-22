<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="FormData" select="$RtnDoc/Pre1936BuildingGOZSchedule"/>
	<!-- Main template -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$FormData"/>
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
				<meta name="Author" content="Chris Sinderson"/>
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
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<span style="width:85mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>
				<span style="height:5px;"/>
				<table id="Tbl" class="styDepTbl" style="width:187mm;">
					<thead class="styDepTableThead">
						<tr class="styDepTblHdr">
							<!--th class="styDepTblCell" scope="col">Item No.</th-->
							<th class="styDepTblCell" scope="col">Credit</th>
							<th class="styDepTblCell" scope="col">Rehabilitation Test Period Begin</th>
							<th class="styDepTblCell" scope="col">Rehabilitation Test Period End</th>
							<th class="styDepTblCell" scope="col">Adjusted Basis of Building</th>
							<th class="styDepTblCell" scope="col">Qualified Rehabilitation Expenditures</th>
						</tr>
					</thead>
					<tfoot/>
					<tbody>
						<xsl:for-each select="$FormData/Pre1936BuildingGOZ">
							<tr>
								<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
								<td class="styDepTblCell" style="text-align:right;width:34mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="CreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="RehabilitationPeriodBeginDt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="RehabilitationPeriodEndDt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:right;width:34mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustedBasisOfBuildingAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:right;width:34mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QlfyRehbltExpendIncurredAmt"/>
									</xsl:call-template>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>