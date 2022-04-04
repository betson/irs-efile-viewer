<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 

	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>

	<xsl:param name="DependencyData" select="$RtnDoc/ExcessBusinessHoldDisposedStmt" />

	<xsl:template name="ShowDependencyData">
		<!-- Add stylesheet dependency code here -->
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Business Enterprise Name:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/BusinessEnterpriseName/BusinessNameLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$DependencyData/BusinessEnterpriseName/BusinessNameLine2Txt">
					<br />
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/BusinessEnterpriseName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Business Enterprise EIN:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateEIN">
					<xsl:with-param name="TargetNode" select="$DependencyData/EIN"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Received by gift or bequest:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/GiftOrBequestAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Permitted holding of donor advised fund or supporting org:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/PrmtHoldDnrAdvsdFndSuprtOrgAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Readjustment, distribution, or change in relative value of classes of stock:
			</div>
			<div class="styExplanationLine" style="float:left"><br /><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/ReadjustDistriOrChgVlStkAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Disposal of pre-May 26, 1969 holding to disposed person at sale price of at least fair market value:
			</div>
			<div class="styExplanationLine" style="float:left"><br /><br /><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/DisposalPreMay1969HoldingAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Other disposal amount:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/OtherDisposalAmt"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Other disposal description:
			</div>
			<div class="styExplanationLine" style="float:left">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$DependencyData/OtherDisposalDesc"/>
				</xsl:call-template>
			</div>
		</div>
		<div class="styTopSectionLine">
			<div class="styTopSectionLineLbl" style="float:left">
				Total excess business holdings disposed:
			</div>
			<div class="styExplanationLine" style="float:left"><br />
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$DependencyData/TotalExcessBusHoldDisposedAmt"/>
				</xsl:call-template>
			</div>
		</div>
	</xsl:template>

	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
	</xsl:param>

	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
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
					<span class="styDepTitle" style="">
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
