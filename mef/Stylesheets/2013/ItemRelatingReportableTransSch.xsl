<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ItemRelatingReportableTransSch"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<!-- Template to display ItemRelatingReportableTransSch -->
	<xsl:template name="ItemRelatingReportableTransSchTemp">
		<table id="ItemRelatingReportableTransSchTbl" class="styDepTblLandscape" style="font-family:'verdana' ">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:25mm;">Sequence Number</th>
					<th class="styDepTblCell" scope="col" style="width:78mm;">Description</th>
					<th class="styDepTblCell" scope="col" style="width:50mm;">Tax Shelter Name</th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Tax Shelter Registration Number</th>
					<th class="styDepTblCell" scope="col" style="width:78mm;">Type of Reportable Transaction</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/ItemRelatingReportableTrans">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;width:25mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SequenceNumberDesc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;width:69mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Desc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;width:68mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TaxShelterName/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TaxShelterName/BusinessNameLine2"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;width:25mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TaxShelterRegistrationNumber"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:left;width:69mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ReportableTransactionDesc"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Next template to display ItemRelatingReportableTransSch -->
	<xsl:template name="ItemRelatingReportableTransSchTemp2">
		<table id="ItemRelatingReportableTransSchTbl2" class="styDepTblLandscape" style="font-family:'verdana' ">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:62mm;">Name of the Entity</th>
					<th class="styDepTblCell" scope="col" style="width:24mm">EIN of the Entity</th>
					<th class="styDepTblCell" scope="col" style="width:34mm;">Income (Loss) per Income Statement Amount</th>
					<th class="styDepTblCell" scope="col" style="width:34mm;">Temporary Difference Amount</th>
					<th class="styDepTblCell" scope="col" style="width:34mm;">Permanent Difference Amount</th>
					<th class="styDepTblCell" scope="col" style="width:34mm;">Other Permanent Differences for Allocations to Non-ECI and ECI</th>
					<th class="styDepTblCell" scope="col" style="width:34mm;">Income (Loss) per Tax Return Amount</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/ItemRelatingReportableTrans">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left;width:62mm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;width:24mm">
							<xsl:choose>
								<xsl:when test="EntityEIN !=''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="EntityEIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IncomeLossPerIncomeStmtAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="TemporaryDifferenceAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="PermanentDifferenceAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="OtherPermanentDifferenceAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:34mm">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="IncomeLossPerTaxReturnAmt"/>
							</xsl:call-template>
						</td>
					</tr>
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
				<meta name="Author" content="Trin Xue"/>
				<meta name="ShortExplanationTxt" content="{$depDocTitle}"/>
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
					<span class="styDepTitle" style="width:140mm">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<br/>
				<xsl:call-template name="ItemRelatingReportableTransSchTemp"/>
				<br/>
				<br/>
				<xsl:call-template name="ItemRelatingReportableTransSchTemp2"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
