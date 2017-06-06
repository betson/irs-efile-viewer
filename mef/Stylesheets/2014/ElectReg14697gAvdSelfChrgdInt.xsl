<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ElectReg14697gAvdSelfChrgdInt"/>
	<!-- 1120S-Display Name is Election Under Reg 1.469-7(g) To Avoid Self-Charged Interest Rules  -->
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="DependencyTemplate">
		<!-- Table begin -->
		<table class="styDepTbl" style="margin-top:4mm;">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" scope="col" style="width:51mm;vertical-align:middle;">
             S Corporation Name
          </th>
					<th class="styDepTblCell" scope="col" style="width:50mm;vertical-align:middle;">
             S Corporation Address
          </th>
					<th class="styDepTblCell" scope="col" style="width:32mm;vertical-align:middle;">
             S corporation EIN
           </th>
					<th class="styDepTblCell" scope="col" style="width:51mm;vertical-align:middle;">       
            Declaration that the election is being made under Regulations section 1.469-7(g)
            </th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/ElectionUnderReg14697gGrp">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<td class="styDepTblCell" align="left">
							<span style="width:51mm">
								<xsl:choose>
									<xsl:when test="SCorporationNameAndAddress/BusinessName">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="SCorporationNameAndAddress/BusinessName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="normalize-space(SCorporationNameAndAddress/BusinessName/BusinessNameLine2)!=''">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="SCorporationNameAndAddress/BusinessName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="SCorporationNameAndAddress/PersonName"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</td>
						<td class="styDepTblCell" align="left">
							<span style="width:50mm">
								<xsl:choose>
									<xsl:when test="SCorporationNameAndAddress/AddressInUS">
										<xsl:call-template name="PopulateUSAddressTemplate">
											<xsl:with-param name="TargetNode" select="SCorporationNameAndAddress/AddressInUS"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateForeignAddressTemplate">
											<xsl:with-param name="TargetNode" select="SCorporationNameAndAddress/AddressInForeign"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</span>
						</td>
						<td class="styDepTblCell" align="center">
							<span style="width:32mm">
								<xsl:call-template name="PopulateEIN">
									<xsl:with-param name="TargetNode" select="SCorporationEIN"/>
								</xsl:call-template>
							</span>
						</td>
						<td class="styDepTblCell" align="left">
							<span style="width:51mm">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="DeclarationDesc"/>
								</xsl:call-template>
							</span>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
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
				<div class="styDepTitleLine">
					<span class="styDepTitle">
						<span style="width:169mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
						<span style="width:2mm;"/>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="DependencyTemplate"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>