<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="DependencyData" select="$RtnDoc/NonaccrualExperienceMethodSch"/>
  <xsl:param name="depDocTitle">
    <!--Share Common Dependency  - Nonaccrual Experience Method Schedule -->
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
          <span class="styDepTitle" style="width:115mm;">
            <span>
              <xsl:value-of select="$depDocTitle"/>
            </span>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$DependencyData"/>
        </xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Corporation Name:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine1Txt"/>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$DependencyData/CorporationName/BusinessNameLine2Txt"/>
              </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Corporation EIN:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:choose>
              <xsl:when test="$DependencyData/CorporationEIN">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$DependencyData/CorporationEIN"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$DependencyData/MissingEINReasonCd"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Nonaccrual Experience Method Description:</span>
          </div>
          <div style="float:left;clear:none;padding-top:4mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/NonaccrualMethodDesc"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Total Gross Receipts:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/TotalGrossReceiptsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Amount Not Accrued:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/NotAccruedAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div style="float:left;clear:none;">
            <span class="styTopSectionLineLbl">Net amount accrued:</span>
          </div>
          <div style="float:left;clear:none;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/NetAccruedAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>