<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/15/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ItemizedOrdinaryIncomeLossStmt"/>
	<!-- Template to display Itemized Other Income Schedule -->
	<xsl:template name="DependencyTemplate">
		<!-- Itemized Other Income Schedule Data -->
		<table id="IOILTbl" class="styDepTbl" style="font-size:7pt;">
			<thead class="styDepTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col">Name</th>
					<th class="styDepTblCell" scope="col">US Address or Foreign Address</th>
					<th class="styDepTblCell" scope="col">Partnership's, Estate's or Trust's EIN</th>
					<th class="styDepTblCell" scope="col">Partnership's, Estate's or Trust's Missing EIN Reason</th>
					<th class="styDepTblCell" scope="col">Partnership's, Estate's or Trust's Ordinary Income (Loss) Amount</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/OrdinaryIncomeLossGrp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" style="text-align:left">
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
						<td class="styDepTblCell" style="text-align:left;">
							<xsl:choose>
								<xsl:when test="USAddress">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="USAddress/AddressLine2Txt != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="USAddress/CityNm != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
										</xsl:call-template>,
                  </xsl:if>
									<xsl:if test="USAddress/StateAbbreviationCd != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="USAddress/ZIPCd != ''">, 
                    <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
									<xsl:if test="ForeignAddress/AddressLine2Txt != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="ForeignAddress/CityNm != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="ForeignAddress/ProvinceOrStateNm != ''">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="ForeignAddress/CountryCd != ''">, 
                    <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="ForeignAddress/ForeignPostalCd != ''"> 
                    - <xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styDepTblCell" style="text-align:center;width:20mm;">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="EIN"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;width:30mm;">
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:30mm;" nowrap="yes">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="Amt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<!-- Main template -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
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
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesDep"/>
			</head>
			<body class="styBodyClass">
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine" style="width:187mm;">
					<span class="styDepTitle" style="width:187mm;">
						<span style="width:187mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<span style="height:5px;"/>
				<!-- Transform Itemized Other Income Schedule -->
				<xsl:call-template name="DependencyTemplate"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>