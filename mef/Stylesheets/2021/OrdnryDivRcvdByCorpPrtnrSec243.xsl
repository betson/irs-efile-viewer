<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 11/14/2012 --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/OrdnryDivRcvdByCorpPrtnrSec243"/>
  <xsl:param name="depDocTitle">
    <!--Partnership Income (IRS1065ScheduleK1)   -  Ordinary Dividends Recieved By Corporate Partners Under Section243 -->
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$DependencyData"/>
    </xsl:call-template>
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">
    <!-- New -->
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
        <div class="styDepTitleLine">
            <span class="styDepTitle" style="width:180mm;">
				<span style="padding-right:1.5mm;">TY</span>
				<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
				<span style="padding-left:1.5mm;">Ordinary Dividends Received By Corporate Partners Under Section243</span>
			</span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Name of Corporate Partner:</div>
            <div style="width:118mm;float:left;clear:none;">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine1Txt"/>
				 </xsl:call-template><br/>
				<xsl:call-template name="PopulateText">
				   <xsl:with-param name="TargetNode" select="$DependencyData/PartnerName/BusinessNameLine2Txt"/>
				</xsl:call-template>
			</div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">EIN:</div>
            <div style="float:left;clear:none;">
				<xsl:call-template name="PopulateEIN">
				  <xsl:with-param name="TargetNode" select="$DependencyData/EIN"/>
				</xsl:call-template>
			</div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
            <div class="styTopSectionLineLbl" style="float:left;clear:none;">Amount of Ordinary Dividends:</div>
            <div style="float:left;clear:none;">
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="$DependencyData/Section243OrdinaryDividendsAmt"/>
				</xsl:call-template>
            </div>
        </div>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>