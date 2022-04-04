<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/TransportationTaxStatement" />

	<xsl:template name="ShowDependencyData">
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Total Transportation Income Derived for All Services for Calendar Year:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br /><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/TotalUSSourceGrossTransIncmAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<br /><br />
		<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:50mm;">Transportation Services Performed</th>
					<th class="styDepTblCell" scope="col" style="width:50mm;">Vessel Name</th>
					<th class="styDepTblCell" scope="col" style="width:50mm;">Vessel or Aircraft Registration Number</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;">Income Derived for Each Service</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/TransportationServiceGrp">
					<tr style="border-color:black;height:6mm;">
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="width:50mm;text-align:left;">
							<div style="width:4.0mm;font-weight:bold;text-align:right;padding-right:1.5mm;float:left;">
								<xsl:value-of select="position()"/>
							</div>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ServiceTypeTxt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="width:50mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="VesselOrAircraftNm"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="width:50mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="VesselOrAircraftIDNum"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="width:30mm;text-align:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="USSourceGrossTransIncmAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>

	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title><xsl:value-of select="$depDocTitle" /></title>

				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content= "{$depDocTitle}" />

				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
				<xsl:call-template name="InitJS"></xsl:call-template>

				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"></xsl:call-template>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass" >
				<xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<xsl:value-of select="$depDocTitle" />
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
				<xsl:call-template name="ShowDependencyData" />
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
