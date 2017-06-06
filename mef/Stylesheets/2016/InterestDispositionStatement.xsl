<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/InterestDispositionStatement" />

	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		<xsl:for-each select="$DependencyData/InterestDispositionDetail">
			<br/><hr style="width:187mm;"/><br/>
			<div class="styTopSectionLine"><span class="styTopSectionLineLbl" style="text-align:left;">Detail <xsl:value-of select="position()"/></span></div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Interest Disposition Description:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="InterestDispositionDesc"/>
					</xsl:call-template>
				</span>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Entity Name:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="EntityName/BusinessNameLine2Txt">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</span>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Entity EIN:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="EntityEIN"/>
					</xsl:call-template>
				</span>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Gain or Loss From Disposition Amount:</span>
				<span class="styExplanationLine" style="font-size:10pt;"><br/>
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="GainOrLossFromDisposAmt"/>
					</xsl:call-template>
					</span>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;">  AdjustmentsTo Gain Or Loss Amt:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AdjustmentsToGainOrLossAmt"/>
					</xsl:call-template>
				</span>
			</div>
		</xsl:for-each>
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
					<span class="styDepTitle" style="width:92mm">
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
