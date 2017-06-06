<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/OwnsForeignPartnershipStmt"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="DependencyTemplate">
		<table id="OFPSTbl" class="styDepTbl" style="margin-top:4mm; font-size:8pt; font-family:Arial">
			<thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" style="width:43mm;text-align:center;vertical-align:middle;" rowspan="2" scope="col">Name</th>
					<!--<th class="styDepTblCell" scope="col" rowspan="2"
            valign="top" align="center" width="43mm" style="text-align:center;">
            Name</th>-->
					<th class="styDepTblCell" style="width:25mm;text-align:center;vertical-align:middle;" rowspan="2" scope="col">
            EIN or SSN</th>
					<th class="styDepTblCell" style="width:25mm;text-align:center;vertical-align:middle;" rowspan="2" scope="col">
            Other Forms Filed</th>
					<th class="styDepTblCell" style="width:43mm;text-align:center;vertical-align:middle;" rowspan="2" scope="col">
            Name of Tax Matters Partner</th>
					<th class="styDepTblCell" style="width:50mm;text-align:center;vertical-align:middle;" colspan="2" scope="col">
            Foreign Partnership Tax Year</th>
				</tr>
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" style="width:25mm;text-align:center;vertical-align:middle;" scope="col">
           Beginning Date</th>
					<th class="styDepTblCell" style="width:25mm;text-align:center;vertical-align:middle;" scope="col">
           Ending Date</th>
				</tr>
			</thead>
			<tfoot/>
			<tbody>
				<xsl:for-each select="$DependencyData/ForeignPartnership">
					<tr>
						<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
						<!--td class="styDepTblCell" valign="top">
            <xsl:value-of select="position()" />
          </td-->
						<td class="styDepTblCell" valign="top" align="left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignPartnershipName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="normalize-space(ForeignPartnershipName/BusinessNameLine2Txt) != ''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignPartnershipName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styDepTblCell" valign="top" align="center">
							<xsl:choose>
								<xsl:when test="EIN != ''">
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="EIN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="SSN != ''">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="SSN"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td class="styDepTblCell" valign="top" align="center">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="OtherFormsFiledCd"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" valign="top" align="left">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TaxMatterPartnerName/BusinessNameLine1Txt"/>
							</xsl:call-template>
							<xsl:if test="normalize-space(TaxMatterPartnerName/BusinessNameLine2Txt) != ''">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="TaxMatterPartnerName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</td>
						<td class="styDepTblCell" valign="top" align="center">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TaxYearBeginDt"/>
							</xsl:call-template>
						</td>
						<td class="styDepTblCell" valign="top" align="center">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="TaxYearEndDt"/>
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
					<!--Owns Foreign Partnership Statement-->
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
					<div class="styDepTitle" style="width:105mm">
						<!--TY 2003 Owns Foreign Partnership Statement-->
						<xsl:value-of select="$depDocTitle"/>
					</div>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="DependencyTemplate"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>