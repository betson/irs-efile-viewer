<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="FormData" select="$RtnDoc/OtherCertHistoricStructuresSch"/>
	<!-- 3468- Other Certified Historic Structures Schedule -->
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
				<xsl:call-template name="DocumentHeaderDependencyLandscape"/>
				<div class="styDepTitleLineLandscape">
					<span class="styDepTitle">
						<span style="width:115mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>
				<span style="height:5px;"/>
				<table id="Tbl" class="styDepTblLandscape" style="font-size:7pt;">
					<thead class="styDepTableThead">
						<tr class="styDepTblHdr">
							<th class="styDepTblCell" scope="col" style="width:31mm;">Credit Amount</th>
							<th class="styDepTblCell" scope="col" style="width:30mm;">NPS Project Number</th>
							<th class="styDepTblCell" scope="col" style="width:22mm;">Date of NPS Approval</th>
							<th class="styDepTblCell" scope="col" style="width:22mm;">Rehabilitation Test Period Begin</th>
							<th class="styDepTblCell" scope="col" style="width:22mm;">Rehabilitation Test Period End</th>
							<th class="styDepTblCell" scope="col" style="width:31mm;">Adjusted Basis of Building</th>
							<th class="styDepTblCell" scope="col" style="width:31mm;">Qualified Rehabilitation Expenditures</th>
							<th class="styDepTblCell" scope="col" style="width:45mm;">Explanation</th>
							<th class="styDepTblCell" scope="col" style="width:22mm;">Prior Year Credit Date</th>
						</tr>
					</thead>
					<tfoot/>
					<tbody>
						<xsl:for-each select="$FormData/OtherCertHistoricStructures">
							<tr>
								<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
								<td class="styDepTblCell" style="text-align:right;width:31mm;" nowrap="yes">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Pre1936BuildingCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:left;width:30mm;" nowrap="yes">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="NPSProjectNum"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;width:22mm;" nowrap="yes">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="NPSApprovalDt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;width:22mm;" nowrap="yes">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="RehabilitationPeriodBeginDt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;width:22mm;" nowrap="yes">
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="RehabilitationPeriodEndDt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:right;width:31mm;" nowrap="yes">
									<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="AdjustedBasisOfBuildingAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:right;width:31mm;" nowrap="yes">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QlfyRehbltExpendIncurredAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:left;width:45mm;" >
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ExplanationTxt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;width:22mm;" nowrap="yes">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="PriorYearCreditDt"/>
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