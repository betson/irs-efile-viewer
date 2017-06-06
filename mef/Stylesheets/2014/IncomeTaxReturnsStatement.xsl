<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/IncomeTaxReturnsStatement"/>
			<!-- - Forms display as - Income Tax Returns Statement - -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="IncomeTaxReturnsStatementTemp">
		<table id="IncomeTaxReturnsStatementTemp" class="styDepTblLandscape" style="font-size: 7pt">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="text-align:center;width:60mm;">Filing Requirements Satisfied Statement</th>
					<th class="styDepTblCell" scope="col" style="text-align:center;width:50mm;">Return Name</th>
					<th class="styDepTblCell" scope="col" style="text-align:center;width:60mm;">Return Address</th>
					<th class="styDepTblCell" scope="col" style="text-align:center;width:30mm;">Return Identifying Number</th>
					<th class="styDepTblCell" scope="col" style="text-align:center;width:36mm;">IRS Service Center Where Field</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/IncomeTaxReturnsStatementGrp">
					<!-- set row background -->
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!-- Filing Rqr Satisfied Statement  -->
						<td class="stydepTblCell" style="width:60mm; text-align:left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="FilingRequirementSatisfiedTxt"/>
							</xsl:call-template>
						</td>
						<!--Return Name -->
						<td class="styDepTblCell" style="width:50mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="BusinessName/BusinessNameLine2Txt != ''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<!-- Return Address -->
						<td class="styDepTblCell" style="text-align:left;width:60mm;">
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
						<!-- EIN -->
						<td class="styDepTblCell" style="width: 30mm; text-align:center;">
							<span style="text-align:center;">
								<!--xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="EIN" />
                </xsl:call-template -->
								<xsl:choose>
									<xsl:when test="normalize-space(EIN)">
										<xsl:call-template name="PopulateEIN">
											<xsl:with-param name="TargetNode" select="EIN"/>
										</xsl:call-template>
										<span style="width: 2px"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
										</xsl:call-template>
										<span style="width: 2px"/>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</td>
						<!-- IRS Service Center Where Filed -->
						<td class="styDepTblCell" style="width:36mm; text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ServiceCenterWhereRetFiledCd"/>
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
						<span style="width:90mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="IncomeTaxReturnsStatementTemp"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
