<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="FormData" select="$RtnDoc/CertHistStructureAffctMWDASch"/>
	<!-- Main template -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$FormData"/>
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
						<span style="width:59mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>
				<span style="height:5px;"/>
				<table id="Tbl" class="styDepTblLandscape" style="font-size:7pt;">
					<thead class="styDepTableThead">
						<tr class="styDepTblHdr">
							<!--th class="styDepTblCell" scope="col">Item No.</th-->
							<th class="styDepTblCell" scope="col">Credit Amount</th>
							<th class="styDepTblCell" scope="col">NPS Project Number</th>
							<th class="styDepTblCell" scope="col">Date of NPS Approval</th>
							<th class="styDepTblCell" scope="col">Rehabilitation Test Period Begin</th>
							<th class="styDepTblCell" scope="col">Rehabilitation Test Period End</th>
							<th class="styDepTblCell" scope="col">Adjusted Basis of Building</th>
							<th class="styDepTblCell" scope="col">Qualified Rehabilitation Expenditures</th>
							<th class="styDepTblCell" scope="col">Explanation</th>
							<th class="styDepTblCell" scope="col">Prior Year Credit Date</th>
						</tr>
					</thead>
					<tfoot/>
					<tbody>
						<xsl:for-each select="$FormData/CertHistStructureAffctMWDA">
							<tr>
								<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
								<td class="styDepTblCell" style="text-align:right;width:29mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="Pre1936BuildingCreditAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="NPSProjectNumber"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;width:20mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="DateOfNPSApproval"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;width:20mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="RehabilitationTestPeriodBegDt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;width:20mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="RehabilitationTestPeriodEndDt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:right;width:29mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="AdjustedBasisOfBuildingAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:right;width:29mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="QualifiedRehbltExpendituresAmt"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:left;width:40mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="Explanation"/>
									</xsl:call-template>
								</td>
								<td class="styDepTblCell" style="text-align:center;width:20mm;">
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
