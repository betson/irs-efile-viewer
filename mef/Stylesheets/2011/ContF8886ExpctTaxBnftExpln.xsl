<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<!-- Reference to Dependency Root Name -->
	<xsl:param name="CCSData" select="$RtnDoc/ContF8886ExpctTaxBnftExpln"/>
	<!-- HINTS - Dependency title Expected Tax Benefits Explanation - 8886-->
	<xsl:template name="ShowData">
		<!--Dependency Table Begin-->
		<table id="ILSTbl" class="styDepTbl" style="text-align:center;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:76mm;">Name </th>
					<th class="styDepTblCell" scope="col" style="width:25mm;">Identification Number</th>
					<th class="styDepTblCell" scope="col" style="width:86mm;">Expected Tax Benefits Explanation </th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<!-- Table Name or First element name -->
				<xsl:for-each select="$CCSData/ContF8886ExpctTaxBenefitExpln">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!-- 1st Column -->
						<td class="styDepTblCell" style="width:76mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Name/BusinessNameLine1"/>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="Name/BusinessNameLine2"/>
							</xsl:call-template>
						</td>
						<!-- 2nd Column -->
						<td class="styDepTblCell" style="width:25mm;text-align:center;">
							<!--<xsl:if test="EIN">-->
							<xsl:call-template name="PopulateEIN">
								<xsl:with-param name="TargetNode" select="IdentificationNumber"/>
							</xsl:call-template>
							<!-- </xsl:if>
            <xsl:if test="MissingEINReason">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="MissingEINReason" />
                </xsl:call-template>
           </xsl:if>-->
						</td>
						<!-- 3rd Column -->
						<td class="styDepTblCell" style="width:86mm;text-align:left;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ExpectedTaxBenefitsExplanation"/>
							</xsl:call-template>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$CCSData"/>
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
				<meta name="Author" content="Lisa Lane"/>
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
				<xsl:call-template name="DocumentHeaderDependency"/>
				<div class="styDepTitleLine ">
					<span class="styDepTitle" style="width:100mm">
						<xsl:value-of select="$depDocTitle"/>
					</span>
				</div>
				<!--Adding template for left over data  -->
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$CCSData"/>
				</xsl:call-template>
				<xsl:call-template name="ShowData"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
