<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/RevokeResidentSpouseStatement" />

	<xsl:template name="ShowDependencyData">
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Name of Spouse:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:choose>
					<xsl:when test="$DependencyData/SpouseNameAndAddress/PersonNm">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/SpouseNameAndAddress/PersonNm"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/SpouseNameAndAddress/BusinessName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="$DependencyData/SpouseNameAndAddress/BusinessName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/SpouseNameAndAddress/BusinessName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Spouse Address:</div>
			<div style="width:440px;font-size:10pt;float:left;">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/SpouseNameAndAddress//AddressLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/SpouseNameAndAddress//AddressLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/SpouseNameAndAddress//AddressLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				<br />
				<xsl:call-template name="PopulateCityStateInfo">
					<xsl:with-param name="TargetNode" select="$DependencyData/SpouseNameAndAddress/USAddress"/>
					<xsl:with-param name="ForeignAddressTargetNode" select="$DependencyData/SpouseNameAndAddress/ForeignAddress"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/SpouseNameAndAddress/ForeignAddress">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/SpouseNameAndAddress/ForeignAddress/CountryCd"/>
					</xsl:call-template>
				</xsl:if>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Spouse Taxpayer Identification Number:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="$DependencyData/SpouseTIN"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Revocating Party Name for deceased Spouse:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:choose>
					<xsl:when test="$DependencyData/PartyRevocationNameAndAddress/PersonNm">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartyRevocationNameAndAddress/PersonNm"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PartyRevocationNameAndAddress/BusinessName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="$DependencyData/PartyRevocationNameAndAddress/BusinessName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$DependencyData/PartyRevocationNameAndAddress/BusinessName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Revocating Party Address for deceased Spouse:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/PartyRevocationNameAndAddress//AddressLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/PartyRevocationNameAndAddress//AddressLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartyRevocationNameAndAddress//AddressLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				<br />
				<xsl:call-template name="PopulateCityStateInfo">
					<xsl:with-param name="TargetNode" select="$DependencyData/PartyRevocationNameAndAddress/USAddress"/>
					<xsl:with-param name="ForeignAddressTargetNode" select="$DependencyData/PartyRevocationNameAndAddress/ForeignAddress"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/PartyRevocationNameAndAddress/ForeignAddress">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PartyRevocationNameAndAddress/ForeignAddress/CountryCd"/>
					</xsl:call-template>
				</xsl:if>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">State of Community Property:</div>
			<div style="width:440px;font-size:10pt;float:left;"> 
				<xsl:for-each select="$DependencyData/CommunityPropertyStateCd">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="."/>
					</xsl:call-template> <xsl:if test="position() != last()"><br /></xsl:if>
				</xsl:for-each>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Foreign Country for Community Property:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:for-each select="$DependencyData/CommunityPropertyFrgnCntryCd">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="."/>
					</xsl:call-template>
					<xsl:if test="position() != last()"><br /></xsl:if>
				</xsl:for-each>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left;">Additional explanation if needed by filer:</div>
			<div style="width:440px;font-size:10pt;float:left;"><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/AdditionalExplanationTxt"/>
				</xsl:call-template>
			</div>
		</div>
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
