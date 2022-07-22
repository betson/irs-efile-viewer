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
				<span class="styTopSectionLineLbl" style="float:left; width:70mm;"> Interest Disposition Description:</span>
				<div style="width:187mm;padding-top:2mm;float:left;clear:none;font-size:10pt;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="InterestDispositionDesc"/>
					</xsl:call-template>
				</div>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Entity Name:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine1"/>
					</xsl:call-template>
					<xsl:if test="EntityName/BusinessNameLine2">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="EntityName/BusinessNameLine2"/>
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
				<span class="styTopSectionLineLbl" style="float:left;"> Full Market Value Of Stock On Date Of Sale Or Disposition Amount:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="FMVStkOnDtSaleOrDisposAmt"/>
					</xsl:call-template>
				</span>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Adjustment Basis Amount:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AdjBasisStkOnDtSaleOrDisposAmt"/>
					</xsl:call-template>
				</span>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Allocable Gain Or Loss Property Amount:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AllocableGainLossPropertyAmt"/>
					</xsl:call-template>
				</span>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Property Trade Or Business Not Section 1.1411 Text:</span>
				<div style="width:187mm;padding-top:2mm;float:left;clear:none;font-size:10pt;"><br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="PropTradeOrBusNotSect11411Txt"/>
					</xsl:call-template>
				</div>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Investment Properties Net Disposition Gain Amount:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="InvestmentPropNetDispGainAmt"/>
					</xsl:call-template>
				</span>
			</div>
			<div class="styTopSectionLine">
				<span class="styTopSectionLineLbl" style="float:left;"> Adjustment From Dispoition Of Stocks Amount:</span>
				<span class="styExplanationLine" style="font-size:10pt;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="AdjFromDisposOfStockAmt"/>
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
