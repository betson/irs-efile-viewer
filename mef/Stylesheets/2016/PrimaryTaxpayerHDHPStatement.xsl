<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" /> 
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:param name="DependencyData" select="$RtnDoc/PrimaryTaxpayerHDHPStatement" />
	<xsl:template name="ShowDependencyData">
		<div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">Archer MSA Employer Contribution Amount:</div><br/>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/ArcherMSAEmployerContriAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">Archer MSA Contribution Amount:</div><br/>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/ArcherMSAContributionAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">Archer MSA Contribution Limitation Amount:</div><br/>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/ArcherMSAContriLimitationAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">HDHP Employer Compensation Amount:</div><br/>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/HDHPEmployerCompensationAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;" class="styTopSectionLineLbl">Archer MSA Deduction Amount:</div>
          <div class="styExplanationLine">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/ArcherMSADeductionAmt"/>
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
			<body class="styBodyClass" style="width:187mm;">
				<xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>
				<div class="styDepTitleLine">
					<span class="styDepTitle" style="width:101mm">
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
