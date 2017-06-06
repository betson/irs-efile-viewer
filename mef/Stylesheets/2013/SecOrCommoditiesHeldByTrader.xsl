<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/SecOrCommoditiesHeldByTrader"/>
	<!-- Table implemented as rows as there are more number of fields as type line explanation type -->
	<xsl:template name="DependencyTemplate">
		<table id="SCHTTbl" class="styDepTblLandscape" style="font-size:7pt;">
			<thead class="styDepTableThead">
				<tr class="styDepTblHdr">
					<!--th class="styDepTblCell" scope="col">Item No.</th-->
					<th class="styDepTblCell" scope="col" style="width:92mm;">Property Description</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;">
						<xsl:choose>
							<xsl:when test="$DependencyData/SecurityOrCommodityHeld/AcquiredDt">
                Date Acquired  
              </xsl:when>
							<xsl:otherwise>
                Date Acquired Inherited
              </xsl:otherwise>
						</xsl:choose>
					</th>
					<th class="styDepTblCell" scope="col" style="width:22mm;">Date Sold</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;">Gross Sales Price</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;">Depreciation Allowed</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;">Cost or Other Basis</th>
					<th class="styDepTblCell" scope="col" style="width:30mm;">Gain or Loss</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/SecurityOrCommodityHeld">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!--td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()" /></td-->
						<td class="styDepTblCell" style="text-align:left;width:92mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="PropertyDesc"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:center;width:22mm;" nowrap="nowrap">
							<xsl:choose>
								<xsl:when test="AcquiredDt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="AcquiredDt"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="DateAcquiredInheritedCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styDepTblCell" style="text-align:center;width:22mm;" nowrap="nowrap">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="SoldDt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GrossSalesPriceAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="DepreciationAllowedAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" style="text-align:right;width:30mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="GainOrLossAmt"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="GetClass">
		<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
	</xsl:template>
	<!-- Itemized Other Income Schedule Data -->
	<!-- Main template -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
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
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
        </style>
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
						<span style="width:95mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftoverLandscape">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<!-- Transform Itemized Other Income Schedule -->
				<xsl:call-template name="DependencyTemplate"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
